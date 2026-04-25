"""Collect farm feed/health notification items (shared by /api/feed/notifications and login welcome)."""
import json
from datetime import date, datetime
from typing import Any, Dict, List


def collect_all_feed_notifications(
    cursor,
    now: datetime,
    today: date,
    current_hour: int,
    current_minute: int,
) -> List[Dict[str, Any]]:
    all_notifications: List[Dict[str, Any]] = []

    # ========== 1. FEEDING NOTIFICATIONS ==========
    cursor.execute(
        """
            SELECT id, age_group_name, start_age_days, end_age_days, feed_amount_grams, 
                   feeding_times_per_day, feeding_times, feed_type, animal_type
            FROM feed_settings
            WHERE status = 'active' AND animal_type = 'pig'
        """
    )
    feed_settings = cursor.fetchall()

    cursor.execute(
        """
            SELECT id, feed_name, feed_type, unit_of_measure
            FROM feeds
            WHERE status = 'active'
        """
    )
    feeds = {row["id"]: row for row in cursor.fetchall()}

    cursor.execute(
        """
            SELECT 
                p.id,
                p.tag_id,
                p.farm_id,
                f.farm_name,
                CASE 
                    WHEN p.birth_date IS NOT NULL THEN DATEDIFF(CURDATE(), p.birth_date)
                    ELSE NULL 
                END as age_days
            FROM pigs p
            LEFT JOIN farms f ON p.farm_id = f.id
            WHERE p.status = 'active' AND p.birth_date IS NOT NULL
        """
    )
    pigs = cursor.fetchall()

    for setting in feed_settings:
        feed_id = None
        if setting["feed_type"]:
            try:
                feed_id = int(setting["feed_type"])
            except Exception:
                continue

        if not feed_id or feed_id not in feeds:
            continue

        feeding_times = []
        if setting["feeding_times"]:
            try:
                feeding_times = (
                    json.loads(setting["feeding_times"])
                    if isinstance(setting["feeding_times"], str)
                    else setting["feeding_times"]
                )
            except Exception:
                feeding_times = []

        time_matched = False
        matched_time = None
        for feed_time in feeding_times:
            if feed_time:
                try:
                    time_parts = str(feed_time).split(":")
                    if len(time_parts) == 2:
                        feed_hour = int(time_parts[0])
                        feed_minute = int(time_parts[1])
                        time_diff = abs(
                            (current_hour * 60 + current_minute) - (feed_hour * 60 + feed_minute)
                        )
                        if time_diff <= 5:
                            time_matched = True
                            matched_time = feed_time
                            break
                except Exception:
                    continue

        if not time_matched:
            continue

        matching_animals = []
        for pig in pigs:
            if pig["age_days"] is not None:
                if setting["start_age_days"] <= pig["age_days"] <= setting["end_age_days"]:
                    matching_animals.append(pig)

        if not matching_animals:
            continue

        farm_groups: Dict[Any, Dict[str, Any]] = {}
        for animal in matching_animals:
            farm_id = animal["farm_id"]
            if farm_id not in farm_groups:
                farm_groups[farm_id] = {
                    "farm_id": farm_id,
                    "farm_name": animal["farm_name"],
                    "animal_count": 0,
                    "total_kg": 0,
                }
            farm_groups[farm_id]["animal_count"] += 1
            farm_groups[farm_id]["total_kg"] += setting["feed_amount_grams"] / 1000

        for _farm_id, farm_data in farm_groups.items():
            all_notifications.append(
                {
                    "type": "feeding",
                    "feed_id": feed_id,
                    "feed_name": feeds[feed_id]["feed_name"],
                    "feed_type": feeds[feed_id]["feed_type"],
                    "farm_id": farm_data["farm_id"],
                    "farm_name": farm_data["farm_name"],
                    "animal_count": farm_data["animal_count"],
                    "total_kg": farm_data["total_kg"],
                    "time": matched_time,
                    "age_group": setting["age_group_name"],
                    "priority": "high",
                }
            )

    # ========== 1a. CHICKEN FEEDING (scheduled times, age-matched flocks) ==========
    try:
        cursor.execute(
            """
            SELECT id, age_group_name, start_age_days, end_age_days, feed_amount_grams,
                   feeding_times_per_day, feeding_times, feed_type, animal_type
            FROM feed_settings
            WHERE status = 'active' AND animal_type = 'chicken'
        """
        )
        chicken_feed_settings = cursor.fetchall()
        cursor.execute(
            """
            SELECT id, chicken_id, batch_name, age_days, quantity, coop_number, chicken_type
            FROM chickens
            WHERE current_status = 'active' AND age_days IS NOT NULL
        """
        )
        flocks = cursor.fetchall()
        for setting in chicken_feed_settings:
            feed_id = None
            if setting.get("feed_type"):
                try:
                    feed_id = int(setting["feed_type"])
                except (ValueError, TypeError):
                    pass
            if not feed_id or feed_id not in feeds:
                continue
            feeding_times = []
            if setting.get("feeding_times"):
                try:
                    feeding_times = (
                        json.loads(setting["feeding_times"])
                        if isinstance(setting["feeding_times"], str)
                        else (setting["feeding_times"] or [])
                    )
                except Exception:
                    feeding_times = []
            time_matched = False
            matched_time = None
            for feed_time in feeding_times:
                if not feed_time:
                    continue
                try:
                    time_parts = str(feed_time).split(":")
                    if len(time_parts) >= 2:
                        h = int(time_parts[0])
                        m = int(time_parts[1])
                        time_diff = abs(
                            (current_hour * 60 + current_minute) - (h * 60 + m)
                        )
                        if time_diff <= 5:
                            time_matched = True
                            matched_time = feed_time
                            break
                except Exception:
                    continue
            if not time_matched:
                continue
            coop_groups: Dict[Any, Dict[str, Any]] = {}
            for fl in flocks:
                if fl["age_days"] is None:
                    continue
                if not (
                    setting["start_age_days"] <= fl["age_days"] <= setting["end_age_days"]
                ):
                    continue
                key = fl.get("coop_number")
                gkey = str(key) if key is not None else "all"
                if gkey not in coop_groups:
                    lbl = f"Coop {key}" if key is not None else "All coops"
                    coop_groups[gkey] = {
                        "coop_number": key,
                        "bird_count": 0,
                        "label": lbl,
                    }
                coop_groups[gkey]["bird_count"] += int(fl.get("quantity") or 0)
            for _ck, gdata in coop_groups.items():
                if gdata["bird_count"] <= 0:
                    continue
                all_notifications.append(
                    {
                        "type": "chicken_feeding",
                        "feed_id": feed_id,
                        "feed_name": feeds[feed_id]["feed_name"],
                        "farm_id": None,
                        "farm_name": gdata["label"],
                        "animal_count": gdata["bird_count"],
                        "total_kg": gdata["bird_count"]
                        * (float(setting["feed_amount_grams"] or 0) / 1000),
                        "time": matched_time,
                        "age_group": setting["age_group_name"],
                        "priority": "high",
                    }
                )
    except Exception:
        pass

    # ========== 1b. COW FEEDING NOTIFICATIONS ==========
    cursor.execute(
        """
            SELECT id, age_group_name, start_age_days, end_age_days, feed_amount_grams,
                   feeding_times_per_day, feeding_times, feed_type, animal_type
            FROM feed_settings
            WHERE status = 'active' AND animal_type = 'cow'
        """
    )
    cow_feed_settings = cursor.fetchall()
    cursor.execute("SELECT COUNT(*) as total FROM cows WHERE status = 'active'")
    total_cows = (cursor.fetchone() or {}).get("total") or 0
    for setting in cow_feed_settings:
        feed_id = None
        if setting.get("feed_type"):
            try:
                feed_id = int(setting["feed_type"])
            except (ValueError, TypeError):
                pass
        if feed_id and feed_id not in feeds:
            continue
        feeding_times = []
        if setting.get("feeding_times"):
            try:
                feeding_times = (
                    json.loads(setting["feeding_times"])
                    if isinstance(setting["feeding_times"], str)
                    else (setting["feeding_times"] or [])
                )
            except Exception:
                pass
        for feed_time in feeding_times:
            if not feed_time:
                continue
            try:
                time_parts = str(feed_time).split(":")
                if len(time_parts) >= 2:
                    feed_hour = int(time_parts[0])
                    feed_minute = int(time_parts[1])
                    time_diff = abs(
                        (current_hour * 60 + current_minute) - (feed_hour * 60 + feed_minute)
                    )
                    if time_diff <= 30:
                        all_notifications.append(
                            {
                                "type": "cow_feeding",
                                "feed_id": feed_id,
                                "feed_name": feeds.get(feed_id, {}).get("feed_name", "Feed")
                                if feed_id
                                else "Feed",
                                "farm_id": None,
                                "farm_name": "Cows",
                                "animal_count": total_cows,
                                "total_kg": (total_cows * (setting["feed_amount_grams"] or 0) / 1000)
                                if total_cows
                                else 0,
                                "time": f"{feed_hour:02d}:{feed_minute:02d}",
                                "age_group": setting["age_group_name"],
                                "priority": "high" if time_diff <= 5 else "medium",
                            }
                        )
                        break
            except Exception:
                continue

    # ========== 2. FARROWING NOTIFICATIONS ==========
    cursor.execute(
        """
            SELECT 
                br.id as breeding_id,
                br.sow_id,
                br.boar_id,
                br.mating_date,
                br.expected_due_date,
                p.tag_id as sow_tag_id,
                p.breed as sow_breed,
                f.farm_name,
                p.farm_id,
                DATEDIFF(br.expected_due_date, CURDATE()) as days_until_farrowing
            FROM breeding_records br
            JOIN pigs p ON br.sow_id = p.id
            LEFT JOIN farms f ON p.farm_id = f.id
            WHERE p.breeding_status = 'pregnant'
            AND br.expected_due_date IS NOT NULL
            AND br.expected_due_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY)
            AND p.status = 'active'
            ORDER BY br.expected_due_date ASC
        """
    )
    farrowing_due = cursor.fetchall()

    for record in farrowing_due:
        days_left = record["days_until_farrowing"]
        all_notifications.append(
            {
                "type": "farrowing",
                "breeding_id": record["breeding_id"],
                "sow_id": record["sow_id"],
                "sow_tag_id": record["sow_tag_id"],
                "sow_breed": record["sow_breed"],
                "farm_id": record["farm_id"],
                "farm_name": record["farm_name"],
                "expected_due_date": record["expected_due_date"].strftime("%Y-%m-%d")
                if record["expected_due_date"]
                else None,
                "days_until_farrowing": days_left,
                "mating_date": record["mating_date"].strftime("%Y-%m-%d")
                if record["mating_date"]
                else None,
                "priority": "critical" if days_left <= 3 else "high",
            }
        )

    # ========== 2b. COW CALVING (due within 7 days) ==========
    try:
        cursor.execute(
            """
            SELECT
                cb.id AS cow_breeding_id,
                cb.dam_id,
                cb.expected_calving_date,
                c.ear_tag,
                c.name AS cow_name,
                DATEDIFF(cb.expected_calving_date, CURDATE()) AS days_until_calving
            FROM cow_breeding cb
            INNER JOIN cows c ON cb.dam_id = c.id
            WHERE c.status = 'active'
            AND cb.pregnancy_status IN ('served', 'conceived')
            AND (cb.conception_cancelled = 0 OR cb.conception_cancelled IS NULL)
            AND cb.birth_date IS NULL
            AND cb.expected_calving_date IS NOT NULL
            AND cb.expected_calving_date BETWEEN CURDATE()
                AND DATE_ADD(CURDATE(), INTERVAL 7 DAY)
            ORDER BY cb.expected_calving_date ASC
        """
        )
        calving_due = cursor.fetchall()
        for row in calving_due:
            dleft = row["days_until_calving"]
            all_notifications.append(
                {
                    "type": "cow_calving",
                    "cow_breeding_id": row["cow_breeding_id"],
                    "dam_id": row["dam_id"],
                    "ear_tag": row["ear_tag"],
                    "cow_name": row.get("cow_name"),
                    "expected_calving_date": row["expected_calving_date"].strftime("%Y-%m-%d")
                    if row.get("expected_calving_date")
                    else None,
                    "days_until_calving": dleft,
                    "priority": "critical" if dleft <= 3 else "high",
                }
            )
    except Exception:
        pass

    # ========== 3. WEANING NOTIFICATIONS ==========
    cursor.execute(
        """
            SELECT 
                l.litter_id,
                l.farrowing_date,
                l.alive_piglets,
                l.sow_id,
                p.tag_id as sow_tag_id,
                p.farm_id,
                f.farm_name,
                DATEDIFF(CURDATE(), l.farrowing_date) as age_days
            FROM litters l
            LEFT JOIN pigs p ON l.sow_id = p.id
            LEFT JOIN farms f ON p.farm_id = f.id
            WHERE l.status = 'unweaned'
            AND l.farrowing_date IS NOT NULL
            AND DATEDIFF(CURDATE(), l.farrowing_date) >= 21
            ORDER BY l.farrowing_date ASC
        """
    )
    weaning_due = cursor.fetchall()

    for litter in weaning_due:
        age_days = litter["age_days"]
        all_notifications.append(
            {
                "type": "weaning",
                "litter_id": litter["litter_id"],
                "farrowing_date": litter["farrowing_date"].strftime("%Y-%m-%d")
                if litter["farrowing_date"]
                else None,
                "alive_piglets": litter["alive_piglets"],
                "sow_tag_id": litter["sow_tag_id"],
                "farm_id": litter["farm_id"],
                "farm_name": litter["farm_name"],
                "age_days": age_days,
                "priority": "high" if age_days <= 25 else "medium",
            }
        )

    # ========== 4. VACCINATION NOTIFICATIONS ==========
    cursor.execute(
        """
            SELECT 
                p.id as pig_id,
                p.tag_id,
                p.birth_date,
                p.farm_id,
                f.farm_name,
                DATEDIFF(CURDATE(), p.birth_date) as age_days
            FROM pigs p
            LEFT JOIN farms f ON p.farm_id = f.id
            WHERE p.status = 'active'
            AND p.birth_date IS NOT NULL
        """
    )
    all_pigs = cursor.fetchall()

    cursor.execute(
        """
            SELECT id, day_number, medicine_activity, reason
            FROM vaccination_schedule
            ORDER BY day_number ASC
        """
    )
    vaccination_schedule = cursor.fetchall()

    for pig in all_pigs:
        if pig["age_days"] is None:
            continue

        age_days = pig["age_days"]

        for schedule in vaccination_schedule:
            due_day = schedule["day_number"]
            schedule_id = schedule["id"]
            if abs(age_days - due_day) <= 2:
                cursor.execute(
                    """
                        SELECT id FROM vaccination_records
                        WHERE animal_id = %s AND animal_type = 'pig' AND schedule_id = %s
                    """,
                    (pig["pig_id"], schedule_id),
                )

                if not cursor.fetchone():
                    all_notifications.append(
                        {
                            "type": "vaccination",
                            "pig_id": pig["pig_id"],
                            "tag_id": pig["tag_id"],
                            "farm_id": pig["farm_id"],
                            "farm_name": pig["farm_name"],
                            "age_days": age_days,
                            "schedule_id": schedule_id,
                            "schedule_day": due_day,
                            "medicine_activity": schedule["medicine_activity"],
                            "reason": schedule["reason"],
                            "priority": "high" if abs(age_days - due_day) <= 1 else "medium",
                        }
                    )
                    break

    # ========== 4b. COW VACCINATION NOTIFICATIONS ==========
    try:
        cursor.execute(
            """
            SELECT
                c.id AS cow_id,
                c.ear_tag,
                c.birth_date,
                DATEDIFF(CURDATE(), c.birth_date) AS age_days
            FROM cows c
            WHERE c.status = 'active' AND c.birth_date IS NOT NULL
        """
        )
        all_cows_v = cursor.fetchall()
        cursor.execute(
            """
            SELECT id, day_number, medicine_activity, reason
            FROM cow_vaccination_schedule
            ORDER BY day_number ASC
        """
        )
        cow_vac_schedule = cursor.fetchall()
        for cow in all_cows_v:
            if cow["age_days"] is None:
                continue
            age_days = cow["age_days"]
            for schedule in cow_vac_schedule:
                due_day = schedule["day_number"]
                schedule_id = schedule["id"]
                if abs(age_days - due_day) <= 2:
                    cursor.execute(
                        """
                        SELECT id FROM cow_vaccination_records
                        WHERE cow_id = %s AND schedule_id = %s
                    """,
                        (cow["cow_id"], schedule_id),
                    )
                    if not cursor.fetchone():
                        all_notifications.append(
                            {
                                "type": "cow_vaccination",
                                "cow_id": cow["cow_id"],
                                "ear_tag": cow["ear_tag"],
                                "age_days": age_days,
                                "schedule_id": schedule_id,
                                "schedule_day": due_day,
                                "medicine_activity": schedule["medicine_activity"],
                                "reason": schedule["reason"],
                                "priority": "high"
                                if abs(age_days - due_day) <= 1
                                else "medium",
                            }
                        )
                        break
    except Exception:
        pass

    # ========== 5. WEIGHT INSERT NOTIFICATIONS ==========
    cursor.execute(
        """
            SELECT 
                id, start_age, end_age, category_name
            FROM weight_categories
            ORDER BY start_age ASC
        """
    )
    weight_categories = cursor.fetchall()

    cursor.execute(
        """
            SELECT 
                p.id as pig_id,
                p.tag_id,
                p.birth_date,
                p.farm_id,
                f.farm_name,
                DATEDIFF(CURDATE(), p.birth_date) as age_days,
                (SELECT MAX(weighing_date) FROM weight_records WHERE pig_id = p.id) as last_weight_date
            FROM pigs p
            LEFT JOIN farms f ON p.farm_id = f.id
            WHERE p.status = 'active'
            AND p.birth_date IS NOT NULL
        """
    )
    pigs_for_weight = cursor.fetchall()

    for pig in pigs_for_weight:
        if pig["age_days"] is None:
            continue

        age_days = pig["age_days"]

        matching_category = None
        for category in weight_categories:
            if category["start_age"] <= age_days <= category["end_age"]:
                matching_category = category
                break

        if not matching_category:
            continue

        last_weight_date = pig["last_weight_date"]
        if last_weight_date is not None and isinstance(last_weight_date, datetime):
            last_weight_date = last_weight_date.date()
        frequency_days = 7 if age_days <= 60 else 14

        if last_weight_date:
            days_since_weight = (today - last_weight_date).days
            if days_since_weight < frequency_days:
                continue
        else:
            if age_days > 7:
                days_since_weight = age_days
            else:
                continue

        if days_since_weight >= frequency_days:
            all_notifications.append(
                {
                    "type": "weight",
                    "pig_id": pig["pig_id"],
                    "tag_id": pig["tag_id"],
                    "farm_id": pig["farm_id"],
                    "farm_name": pig["farm_name"],
                    "age_days": age_days,
                    "category_name": matching_category["category_name"],
                    "days_since_weight": days_since_weight,
                    "frequency_days": frequency_days,
                    "priority": "high" if age_days <= 60 else "medium",
                }
            )

    # ========== 5b. COW WEIGHT NOTIFICATIONS ==========
    try:
        cursor.execute(
            """
            SELECT id, start_age, end_age, category_name
            FROM cow_weight_categories
            ORDER BY start_age ASC
        """
        )
        cow_w_cats = cursor.fetchall()
        if cow_w_cats:
            cursor.execute(
                """
                SELECT
                    c.id AS cow_id,
                    c.ear_tag,
                    c.birth_date,
                    DATEDIFF(CURDATE(), c.birth_date) AS age_days,
                    (SELECT MAX(weighing_date) FROM cow_weight_records WHERE cow_id = c.id) AS last_weight_date
                FROM cows c
                WHERE c.status = 'active' AND c.birth_date IS NOT NULL
            """
            )
            cows_w = cursor.fetchall()
            for cow in cows_w:
                if cow["age_days"] is None:
                    continue
                age_days = cow["age_days"]
                mcat = None
                for cat in cow_w_cats:
                    if cat["start_age"] <= age_days <= cat["end_age"]:
                        mcat = cat
                        break
                if not mcat:
                    continue
                lw = cow["last_weight_date"]
                if lw is not None and isinstance(lw, datetime):
                    lw = lw.date()
                frequency_days = 7 if age_days <= 60 else 14
                if lw:
                    dsw = (today - lw).days
                    if dsw < frequency_days:
                        continue
                else:
                    if age_days > 7:
                        dsw = age_days
                    else:
                        continue
                if dsw >= frequency_days:
                    all_notifications.append(
                        {
                            "type": "cow_weight",
                            "cow_id": cow["cow_id"],
                            "ear_tag": cow["ear_tag"],
                            "age_days": age_days,
                            "category_name": mcat["category_name"],
                            "days_since_weight": dsw,
                            "frequency_days": frequency_days,
                            "priority": "high" if age_days <= 60 else "medium",
                        }
                    )
    except Exception:
        pass

    # ========== 6. CHICKEN FLOCK ALERTS (low headcount / losses) ==========
    try:
        cursor.execute(
            """
            SELECT id, chicken_id, batch_name, chicken_type, quantity, age_days,
                   current_status, coop_number
            FROM chickens
            WHERE (current_status = 'active' AND quantity <= 20)
               OR current_status IN ('dead', 'culled')
            ORDER BY
                CASE current_status
                    WHEN 'dead' THEN 1
                    WHEN 'culled' THEN 2
                    ELSE 3
                END,
                registration_date DESC
            LIMIT 20
        """
        )
        for row in cursor.fetchall() or []:
            st = (row.get("current_status") or "").lower()
            qty = int(row.get("quantity") or 0)
            if st == "dead":
                pr = "critical"
            elif st == "culled":
                pr = "high"
            else:
                pr = "medium"
            all_notifications.append(
                {
                    "type": "chicken_flock",
                    "chicken_row_id": row["id"],
                    "chicken_id": row.get("chicken_id"),
                    "batch_name": row.get("batch_name"),
                    "chicken_type": row.get("chicken_type"),
                    "quantity": qty,
                    "age_days": row.get("age_days"),
                    "coop_number": row.get("coop_number"),
                    "flock_status": st,
                    "priority": pr,
                }
            )
    except Exception:
        pass

    return all_notifications
