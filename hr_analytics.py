"""
HR employee monitoring: page time, session duration, and CRUD stats from activity_log.
"""
from __future__ import annotations

import re
from datetime import datetime, timedelta
from typing import Any, Callable, Dict, List, Optional, Tuple

# (path fragment or regex, page_key, page_label)
_PAGE_PATH_RULES: List[Tuple[str, str, str]] = [
    ("/human-resource", "hr", "Human Resource"),
    ("/role-view", "admin_access", "Role & Access"),
    ("/farm/pig", "pig", "Pig Management"),
    ("pig-management", "pig", "Pig Management"),
    ("register-pigs", "pig", "Pig Registration"),
    ("breeding", "pig_breeding", "Breeding & Farrowing"),
    ("farrowing", "pig_breeding", "Breeding & Farrowing"),
    ("litters", "pig_breeding", "Litters"),
    ("weaned-litters", "pig_breeding", "Litters"),
    ("/cow", "cow", "Cow Management"),
    ("cow-management", "cow", "Cow Management"),
    ("milk", "cow_milk", "Milk Production"),
    ("/chicken", "chicken", "Chicken Management"),
    ("chicken-management", "chicken", "Chicken Management"),
    ("feeding", "feeding", "Feeding & Feed"),
    ("feed-", "feeding", "Feeding & Feed"),
    ("slaughter", "slaughter", "Slaughter"),
    ("vaccination", "health", "Health & Vaccination"),
    ("/health", "health", "Health & Vaccination"),
    ("weight", "weight", "Weight Management"),
    ("stock-management", "stock", "Stock Management"),
    ("animal-relocation", "relocation", "Animal Relocation"),
    ("revenue", "revenue", "Revenue"),
    ("/analytics", "analytics", "Analytics"),
    ("/dashboard", "dashboard", "Dashboard"),
    ("/settings", "account", "Settings & Profile"),
    ("/profile", "account", "Settings & Profile"),
    ("/approvals", "hr", "Human Resource"),
    ("/farm-management", "farm", "Farm Operations"),
]

_ACTION_PAGE_RULES: List[Tuple[List[str], str, str]] = [
    (["PIG_", "LITTER_", "BREEDING_", "FARROWING_", "WEANED"], "pig", "Pig & Breeding"),
    (["COW_", "MILK_", "CALVING", "LACTATION"], "cow", "Cow & Milk"),
    (["CHICKEN_"], "chicken", "Chicken"),
    (["FEED_", "FEEDING"], "feeding", "Feeding & Feed"),
    (["SLAUGHTER_"], "slaughter", "Slaughter"),
    (["DEATH_"], "death", "Death Records"),
    (["SALE_"], "sales", "Sales"),
    (["EMPLOYEE_", "PERMISSION", "STATUS_UPDATE", "FINANCE_", "HR_"], "hr", "Human Resource"),
    (["VACCIN", "MEDICATION", "HEALTH"], "health", "Health & Vaccination"),
    (["RELOCATION", "RECOVER"], "relocation", "Relocation & Recovery"),
    (["WEIGHT"], "weight", "Weight Management"),
    (["FARM_"], "farm", "Farm Setup"),
    (["LOGIN", "LOGOUT", "PROFILE", "WEBAUTHN", "SIGNUP"], "account", "Account & Profile"),
]


def ensure_hr_analytics_tables(cursor) -> None:
    cursor.execute(
        """
        CREATE TABLE IF NOT EXISTS employee_page_visits (
            id INT AUTO_INCREMENT PRIMARY KEY,
            employee_id INT NOT NULL,
            page_key VARCHAR(64) NOT NULL,
            page_label VARCHAR(120) NOT NULL,
            path VARCHAR(255) NOT NULL,
            started_at DATETIME NOT NULL,
            last_seen_at DATETIME NOT NULL,
            ended_at DATETIME NULL,
            duration_seconds INT NOT NULL DEFAULT 0,
            INDEX idx_epv_employee_started (employee_id, started_at),
            INDEX idx_epv_employee_open (employee_id, ended_at),
            FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE
        )
        """
    )


def resolve_page_from_path(path: str) -> Optional[Tuple[str, str]]:
    p = (path or "").lower().split("?")[0].rstrip("/") or "/"
    for fragment, key, label in _PAGE_PATH_RULES:
        if fragment in p:
            return key, label
    if p in ("/admin", "/manager", "/employee", "/vet", "/it"):
        return "dashboard", "Dashboard"
    return None


def resolve_page_from_action(action: str, description: str = "") -> Tuple[str, str]:
    a = (action or "").upper()
    for prefixes, key, label in _ACTION_PAGE_RULES:
        if any(a.startswith(p) or p in a for p in prefixes):
            return key, label
    return "other", "Other Activity"


def classify_activity_operation(action: str) -> str:
    a = (action or "").upper()
    if a in ("LOGIN", "LOGOUT"):
        return "session"
    if any(x in a for x in ("DELETE", "DELETED", "CANCELLATION", "REMOVE", "SETTING_DELETED")):
        return "deletions"
    if any(x in a for x in ("EDIT", "UPDATE", "CHANGE", "SETTING_UPDATED")):
        return "edits"
    if "INSERT" in a or a == "CREATE":
        return "inserts"
    if "SETTING_CREATED" in a:
        return "inserts"
    if any(
        x in a
        for x in (
            "REGISTRATION",
            "REGISTER",
            "SIGNUP",
            "_RECORD",
            "COMPLETED",
            "WEANED",
            "CALVING",
            "PRODUCTION",
            "TRANSACTION",
            "APPROVAL",
        )
    ):
        return "registrations"
    return "other"


def close_open_page_visits(get_db_connection: Callable, employee_id: int) -> None:
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute(
            """
            UPDATE employee_page_visits
            SET ended_at = last_seen_at,
                duration_seconds = GREATEST(
                    0,
                    TIMESTAMPDIFF(SECOND, started_at, last_seen_at)
                )
            WHERE employee_id = %s AND ended_at IS NULL
            """,
            (employee_id,),
        )
        cursor.close()
        conn.close()
    except Exception as exc:
        print(f"Error closing page visits: {exc}")


def track_employee_page_visit(get_db_connection: Callable, employee_id: int, path: str) -> None:
    resolved = resolve_page_from_path(path)
    if not resolved:
        return
    page_key, page_label = resolved
    now = datetime.now()
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute(
            """
            SELECT id, page_key FROM employee_page_visits
            WHERE employee_id = %s AND ended_at IS NULL
            ORDER BY id DESC LIMIT 1
            """,
            (employee_id,),
        )
        open_row = cursor.fetchone()
        if open_row and open_row.get("page_key") == page_key:
            cursor.execute(
                """
                UPDATE employee_page_visits
                SET last_seen_at = %s,
                    path = %s
                WHERE id = %s
                """,
                (now, path[:255], open_row["id"]),
            )
        else:
            if open_row:
                cursor.execute(
                    """
                    UPDATE employee_page_visits
                    SET ended_at = last_seen_at,
                        duration_seconds = GREATEST(
                            0,
                            TIMESTAMPDIFF(SECOND, started_at, last_seen_at)
                        )
                    WHERE id = %s
                    """,
                    (open_row["id"],),
                )
            cursor.execute(
                """
                INSERT INTO employee_page_visits
                (employee_id, page_key, page_label, path, started_at, last_seen_at)
                VALUES (%s, %s, %s, %s, %s, %s)
                """,
                (employee_id, page_key, page_label, path[:255], now, now),
            )
        cursor.close()
        conn.close()
    except Exception as exc:
        print(f"Error tracking page visit: {exc}")


def _parse_since(days: int) -> datetime:
    days = max(1, min(int(days or 30), 365))
    return datetime.now() - timedelta(days=days)


def _format_hours(seconds: int) -> float:
    return round(max(0, int(seconds or 0)) / 3600.0, 2)


def compute_session_seconds(cursor, employee_id: int, since: datetime) -> int:
    cursor.execute(
        """
        SELECT action, created_at FROM activity_log
        WHERE employee_id = %s AND action IN ('LOGIN', 'LOGOUT') AND created_at >= %s
        ORDER BY created_at ASC
        """,
        (employee_id, since),
    )
    events = cursor.fetchall()
    total = 0
    login_time = None
    for ev in events:
        ts = ev["created_at"]
        if ev["action"] == "LOGIN":
            login_time = ts
        elif ev["action"] == "LOGOUT" and login_time:
            total += max(0, int((ts - login_time).total_seconds()))
            login_time = None
    if login_time:
        total += max(0, int((datetime.now() - login_time).total_seconds()))
    return total


def _page_time_by_employee(cursor, employee_id: int, since: datetime) -> Dict[str, Dict[str, Any]]:
    cursor.execute(
        """
        SELECT page_key, page_label,
               SUM(
                   CASE
                       WHEN duration_seconds > 0 THEN duration_seconds
                       ELSE GREATEST(0, TIMESTAMPDIFF(SECOND, started_at, COALESCE(ended_at, last_seen_at)))
                   END
               ) AS total_seconds,
               COUNT(*) AS visit_count
        FROM employee_page_visits
        WHERE employee_id = %s AND started_at >= %s
        GROUP BY page_key, page_label
        """,
        (employee_id, since),
    )
    out: Dict[str, Dict[str, Any]] = {}
    for row in cursor.fetchall():
        key = row["page_key"]
        out[key] = {
            "page_key": key,
            "page_label": row["page_label"],
            "seconds_on_page": int(row["total_seconds"] or 0),
            "hours_on_page": _format_hours(int(row["total_seconds"] or 0)),
            "visit_count": int(row["visit_count"] or 0),
            "registrations": 0,
            "inserts": 0,
            "edits": 0,
            "deletions": 0,
            "other_actions": 0,
        }
    return out


def _merge_action_stats(cursor, employee_id: int, since: datetime, pages: Dict[str, Dict[str, Any]]) -> None:
    cursor.execute(
        """
        SELECT action, description, created_at FROM activity_log
        WHERE employee_id = %s AND created_at >= %s
          AND action NOT IN ('LOGIN', 'LOGOUT')
        ORDER BY created_at DESC
        """,
        (employee_id, since),
    )
    for row in cursor.fetchall():
        key, label = resolve_page_from_action(row["action"], row.get("description") or "")
        op = classify_activity_operation(row["action"])
        if key not in pages:
            pages[key] = {
                "page_key": key,
                "page_label": label,
                "seconds_on_page": 0,
                "hours_on_page": 0.0,
                "visit_count": 0,
                "registrations": 0,
                "inserts": 0,
                "edits": 0,
                "deletions": 0,
                "other_actions": 0,
            }
        if op == "registrations":
            pages[key]["registrations"] += 1
        elif op == "inserts":
            pages[key]["inserts"] += 1
        elif op == "edits":
            pages[key]["edits"] += 1
        elif op == "deletions":
            pages[key]["deletions"] += 1
        elif op != "session":
            pages[key]["other_actions"] += 1


def build_hr_analytics_summary(cursor, since: datetime) -> List[Dict[str, Any]]:
    cursor.execute(
        """
        SELECT e.id, e.full_name, e.email, e.employee_code, e.role, e.status, e.profile_image,
               (SELECT MAX(created_at) FROM activity_log al WHERE al.employee_id = e.id) AS last_active_at
        FROM employees e
        ORDER BY e.full_name ASC
        """
    )
    employees = cursor.fetchall()
    summary: List[Dict[str, Any]] = []
    for emp in employees:
        eid = emp["id"]
        session_seconds = compute_session_seconds(cursor, eid, since)
        cursor.execute(
            """
            SELECT COUNT(*) AS c FROM activity_log
            WHERE employee_id = %s AND created_at >= %s AND action NOT IN ('LOGIN', 'LOGOUT')
            """,
            (eid, since),
        )
        action_count = int((cursor.fetchone() or {}).get("c") or 0)
        page_stats = _page_time_by_employee(cursor, eid, since)
        page_seconds = sum(p["seconds_on_page"] for p in page_stats.values())
        summary.append(
            {
                "id": eid,
                "full_name": emp["full_name"],
                "email": emp["email"],
                "employee_code": emp["employee_code"],
                "role": emp["role"],
                "status": emp["status"],
                "profile_image": emp.get("profile_image"),
                "session_seconds": session_seconds,
                "session_hours": _format_hours(session_seconds),
                "page_time_seconds": page_seconds,
                "page_time_hours": _format_hours(page_seconds),
                "total_actions": action_count,
                "last_active_at": emp.get("last_active_at"),
                "pages_used": len(page_stats),
            }
        )
    summary.sort(key=lambda x: (-(x["session_seconds"] or 0), x["full_name"] or ""))
    return summary


def build_hr_employee_analytics_detail(cursor, employee_id: int, since: datetime) -> Optional[Dict[str, Any]]:
    cursor.execute(
        """
        SELECT id, full_name, email, employee_code, role, status, profile_image, created_at
        FROM employees WHERE id = %s
        """,
        (employee_id,),
    )
    emp = cursor.fetchone()
    if not emp:
        return None

    session_seconds = compute_session_seconds(cursor, employee_id, since)
    pages = _page_time_by_employee(cursor, employee_id, since)
    _merge_action_stats(cursor, employee_id, since, pages)

    page_list = sorted(
        pages.values(),
        key=lambda p: (-(p["seconds_on_page"] or 0), -(p["registrations"] + p["inserts"] + p["edits"] + p["deletions"])),
    )

    cursor.execute(
        """
        SELECT action, description, created_at FROM activity_log
        WHERE employee_id = %s AND created_at >= %s
        ORDER BY created_at DESC LIMIT 80
        """,
        (employee_id, since),
    )
    recent = []
    for row in cursor.fetchall():
        pk, pl = resolve_page_from_action(row["action"], row.get("description") or "")
        recent.append(
            {
                "action": row["action"],
                "description": row.get("description"),
                "created_at": row["created_at"],
                "operation": classify_activity_operation(row["action"]),
                "page_key": pk,
                "page_label": pl,
            }
        )

    cursor.execute(
        """
        SELECT DATE(created_at) AS day, COUNT(*) AS actions
        FROM activity_log
        WHERE employee_id = %s AND created_at >= %s
        GROUP BY DATE(created_at)
        ORDER BY day ASC
        """,
        (employee_id, since),
    )
    daily_activity = [
        {"date": str(r["day"]), "actions": int(r["actions"])} for r in cursor.fetchall()
    ]

    totals = {
        "registrations": sum(p["registrations"] for p in page_list),
        "inserts": sum(p["inserts"] for p in page_list),
        "edits": sum(p["edits"] for p in page_list),
        "deletions": sum(p["deletions"] for p in page_list),
        "other_actions": sum(p["other_actions"] for p in page_list),
    }

    return {
        "employee": emp,
        "since": since.isoformat(),
        "session_seconds": session_seconds,
        "session_hours": _format_hours(session_seconds),
        "page_time_seconds": sum(p["seconds_on_page"] for p in page_list),
        "page_time_hours": _format_hours(sum(p["seconds_on_page"] for p in page_list)),
        "totals": totals,
        "pages": page_list,
        "recent_activity": recent,
        "daily_activity": daily_activity,
    }


def parse_days_param(raw) -> datetime:
    try:
        return _parse_since(int(raw))
    except (TypeError, ValueError):
        return _parse_since(30)
