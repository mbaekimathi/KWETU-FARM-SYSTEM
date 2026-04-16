"""
Migrate admin_farm*.html templates to shared farm shell (farm_hub_shell_head_fragment,
farm_shell_header, farm_unified_sidebar, mobile overlay). Preserves <main>...</main> and content after </main>.
"""
from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
TPL = ROOT / "templates"

HEAD = """<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{title}</title>
{{% include 'includes/farm_hub_shell_head_fragment.html' %}}
</head>
"""

BODY = """<body class="min-h-screen bg-gradient-to-br from-gray-50 via-blue-50/30 to-purple-50/30 dark:from-gray-900 dark:via-blue-900/20 dark:to-purple-900/20 transition-colors duration-300">
{{% set farm_shell_breadcrumb_current = '{breadcrumb}' %}}
{{% set farm_shell_icon_class = '{icon}' %}}
{{% set farm_sidebar_banner_title = '{banner_title}' %}}
{{% set farm_sidebar_banner_sub = '{banner_sub}' %}}
{{% set farm_sidebar_nav_partial = '{nav_partial}' %}}
{extra_vars}
{{% include 'includes/farm_shell_header.html' %}}
{{% include 'includes/farm_unified_sidebar.html' %}}
    <div id="mobile-overlay" class="fixed inset-0 bg-black/50 z-30 md:hidden hidden"></div>

"""

# filename -> dict with keys: breadcrumb, icon, banner_title, banner_sub, nav_partial, extra (optional str for pig_nav_active etc.)
MIGRATE: dict[str, dict] = {}

# --- Pig module ---
PIG = "includes/farm_nav_pig_hub.html"
COW = "includes/farm_nav_cow_hub.html"
CHICKEN = "includes/farm_nav_chicken_management_hub.html"
OPS = "includes/farm_nav_farm_operations_hub.html"

pig = lambda pa: {"nav_partial": PIG, "extra": "{{% set pig_nav_active = '{}' %}}".format(pa)}
cow = lambda ca: {"nav_partial": COW, "extra": "{{% set cow_nav_active = '{}' %}}".format(ca)}
chicken = lambda ca: {"nav_partial": CHICKEN, "extra": "{{% set farm_chicken_mgmt_hub_nav_active = '{}' %}}".format(ca)}
ops = {"nav_partial": OPS, "extra": ""}

for fn, bc, icon, bt, bs, cfg in [
    ("admin_farm_register_pigs.html", "Register Pigs", "fas fa-piggy-bank", "Pig hub", "Registration", pig("register")),
    ("admin_farm_register_batch.html", "Register Batch", "fas fa-piggy-bank", "Pig hub", "Batch", pig("register")),
    ("admin_farm_breeding_management.html", "Breeding Management", "fas fa-piggy-bank", "Pig hub", "Breeding", pig("breeding")),
    ("admin_farm_breeding_records.html", "Breeding Records", "fas fa-piggy-bank", "Pig hub", "Breeding", pig("breeding")),
    ("admin_farm_completed_farrowings.html", "Completed Farrowings", "fas fa-piggy-bank", "Pig hub", "Breeding", pig("breeding")),
    ("admin_farm_failed_conceptions.html", "Failed Conceptions", "fas fa-piggy-bank", "Pig hub", "Breeding", pig("breeding")),
    ("admin_farm_family_tree.html", "Family Tree", "fas fa-piggy-bank", "Pig hub", "Breeding", pig("breeding")),
    ("admin_farm_litters.html", "Litters", "fas fa-piggy-bank", "Pig hub", "Breeding", pig("breeding")),
    ("admin_farm_farrowing_activity_settings.html", "Farrowing Settings", "fas fa-piggy-bank", "Pig hub", "Breeding", pig("breeding")),
    ("admin_farm_health_management.html", "Health Management", "fas fa-piggy-bank", "Pig hub", "Health", pig("health")),
    ("admin_farm_health_status.html", "Health Status", "fas fa-piggy-bank", "Pig hub", "Health", pig("health")),
    ("admin_farm_location.html", "Location", "fas fa-map-marker-alt", "Pig hub", "Locations", pig("location")),
    ("admin_farm_pig_feeding_tracking.html", "Pig Feeding Tracking", "fas fa-piggy-bank", "Pig hub", "Feeding", pig("feeding")),
    ("admin_farm_pig_analytics.html", "Pig Analytics", "fas fa-chart-line", "Pig hub", "Analytics", pig("hub")),
    ("admin_farm_animal_details.html", "Animal Details", "fas fa-piggy-bank", "Pig hub", "Records", pig("hub")),
    ("admin_farm_insert_weight.html", "Insert Weight", "fas fa-weight", "Pig hub", "Weights", pig("hub")),
    ("admin_farm_feed_analytics.html", "Feed Analytics", "fas fa-chart-line", "Farm", "Feed analytics", ops | {"extra": "{{% set farm_hub_nav_active = 'pig_feeding' %}}"}),
    ("admin_farm_feed_settings.html", "Feed Settings", "fas fa-cog", "Farm", "Feed settings", ops | {"extra": "{{% set farm_hub_nav_active = 'pig_feeding' %}}"}),
    ("admin_farm_feed_stock_management.html", "Feed Stock", "fas fa-boxes", "Farm", "Feed stock", ops | {"extra": "{{% set farm_hub_nav_active = 'stock' %}}"}),
    ("admin_farm_vaccination_tracking.html", "Vaccination Tracking", "fas fa-syringe", "Pig hub", "Health", pig("health")),
    ("admin_farm_vaccination_settings.html", "Vaccination Settings", "fas fa-syringe", "Pig hub", "Health", pig("health")),
    ("admin_farm_vaccination_analytics.html", "Vaccination Analytics", "fas fa-chart-line", "Pig hub", "Health", pig("health")),
    ("admin_farm_vaccinations.html", "Vaccinations", "fas fa-syringe", "Pig hub", "Health", pig("health")),
    ("admin_farm_weight_assessment.html", "Weight Assessment", "fas fa-weight", "Pig hub", "Weights", pig("hub")),
    ("admin_farm_weight_analytics.html", "Weight Analytics", "fas fa-chart-line", "Pig hub", "Weights", pig("hub")),
    ("admin_farm_weight_analysis.html", "Weight Analysis", "fas fa-chart-line", "Pig hub", "Weights", pig("hub")),
    ("admin_farm_weight_settings.html", "Weight Settings", "fas fa-cog", "Pig hub", "Weights", pig("hub")),
    ("admin_farm_register.html", "Farm Register", "fas fa-clipboard-list", "Farm", "Register", ops | {"extra": "{{% set farm_hub_nav_active = 'management' %}}"}),
    ("admin_farm_view.html", "Farm View", "fas fa-eye", "Farm", "Overview", ops | {"extra": "{{% set farm_hub_nav_active = 'management' %}}"}),
    # Cow
    ("admin_farm_register_cows.html", "Register Cows", "fas fa-cow", "Cow hub", "Registration", cow("register")),
    ("admin_farm_cow_health.html", "Cow Health", "fas fa-heartbeat", "Cow hub", "Health", cow("health")),
    ("admin_farm_cow_breeding.html", "Cow Breeding", "fas fa-heart", "Cow hub", "Breeding", cow("breeding")),
    ("admin_farm_cow_milk.html", "Milk Production", "fas fa-tint", "Cow hub", "Milk", cow("milk")),
    ("admin_farm_cow_feeding_management.html", "Cow Feeding", "fas fa-utensils", "Cow hub", "Feeding", cow("feeding")),
    ("admin_farm_cow_feeding_tracking.html", "Cow Feeding Tracking", "fas fa-utensils", "Cow hub", "Feeding", cow("feeding")),
    ("admin_farm_cow_feed_stock_management.html", "Cow Feed Stock", "fas fa-boxes", "Cow hub", "Feed stock", cow("feeding")),
    ("admin_farm_cow_feed_settings.html", "Cow Feed Settings", "fas fa-cog", "Cow hub", "Feed", cow("feeding")),
    ("admin_farm_cow_feed_analytics.html", "Cow Feed Analytics", "fas fa-chart-line", "Cow hub", "Feed", cow("feeding")),
    ("admin_farm_cow_vaccination_tracking.html", "Cow Vaccination", "fas fa-syringe", "Cow hub", "Health", cow("health")),
    ("admin_farm_cow_vaccination_settings.html", "Cow Vaccination Settings", "fas fa-syringe", "Cow hub", "Health", cow("health")),
    ("admin_farm_cow_weight_assessment.html", "Cow Weight", "fas fa-weight", "Cow hub", "Weights", cow("hub")),
    ("admin_farm_cow_weight_settings.html", "Cow Weight Settings", "fas fa-cog", "Cow hub", "Weights", cow("hub")),
    ("admin_farm_cow_detail.html", "Cow Detail", "fas fa-cow", "Cow hub", "Animal", cow("hub")),
    ("admin_farm_milk_production_analytics.html", "Milk Analytics", "fas fa-chart-line", "Cow hub", "Milk", cow("milk")),
    ("admin_farm_milk_quality_records.html", "Milk Quality", "fas fa-tint", "Cow hub", "Milk", cow("milk")),
    # Chicken hub
    ("admin_farm_chicken_management.html", "Chicken Management", "fas fa-drumstick-bite", "Chicken hub", "Overview", chicken("chicken-management")),
    ("admin_farm_chicken_flock_management.html", "Flock Management", "fas fa-feather-alt", "Chicken hub", "Flocks", chicken("flock")),
    ("admin_farm_chicken_feeding_management.html", "Chicken Feeding", "fas fa-seedling", "Chicken hub", "Feeding", chicken("feeding")),
    ("admin_farm_chicken_feeding_tracking.html", "Chicken Feeding Tracking", "fas fa-clipboard-list", "Chicken hub", "Feeding", chicken("feeding")),
    ("admin_farm_chicken_feed_analytics.html", "Chicken Feed Analytics", "fas fa-chart-line", "Chicken hub", "Feed", chicken("feeding")),
    ("admin_farm_chicken_feed_settings.html", "Chicken Feed Settings", "fas fa-cog", "Chicken hub", "Feed", chicken("feeding")),
    ("admin_farm_chicken_feed_stock_management.html", "Chicken Feed Stock", "fas fa-boxes", "Chicken hub", "Stock", chicken("feeding")),
    ("admin_farm_chicken_health.html", "Chicken Health", "fas fa-heartbeat", "Chicken hub", "Health", chicken("health")),
    ("admin_farm_chicken_health_analytics.html", "Chicken Health Analytics", "fas fa-chart-area", "Chicken hub", "Health", chicken("health")),
    ("admin_farm_chicken_upcoming_medications.html", "Upcoming Medications", "fas fa-pills", "Chicken hub", "Health", chicken("health")),
    ("admin_farm_chicken_weight_check.html", "Weight Check", "fas fa-weight", "Chicken hub", "Health", chicken("health")),
    ("admin_farm_chicken_settings.html", "Chicken Settings", "fas fa-sliders-h", "Chicken hub", "Settings", chicken("settings")),
    ("admin_farm_chicken_detail.html", "Chicken Detail", "fas fa-egg", "Chicken hub", "Bird", chicken("chicken-management")),
    ("admin_farm_chicken_production.html", "Chicken Production", "fas fa-chart-bar", "Chicken hub", "Production", chicken("dashboard")),
    ("admin_farm_chicken_production_analytics.html", "Production Analytics", "fas fa-chart-line", "Chicken hub", "Production", chicken("dashboard")),
    ("admin_farm_chicken_production_management.html", "Production Management", "fas fa-tasks", "Chicken hub", "Production", chicken("dashboard")),
    # Pig slaughter
    ("admin_farm_slaughter.html", "Slaughter", "fas fa-cut", "Pig hub", "Slaughter", pig("slaughter")),
    ("admin_farm_slaughter_view_production.html", "Slaughter Production", "fas fa-industry", "Pig hub", "Slaughter", pig("slaughter")),
]:
    MIGRATE[fn] = {
        "breadcrumb": bc,
        "icon": icon,
        "banner_title": bt,
        "banner_sub": bs,
        **cfg,
    }

# Centered "coming soon" pages with no farm chrome — wrap body inner in <main>.
PLACEHOLDER_TEMPLATES = frozenset(
    {
        "admin_farm_register.html",
        "admin_farm_health_status.html",
        "admin_farm_pig_analytics.html",
    }
)


def _find_balanced_div_close(html: str, open_start: int) -> int | None:
    """open_start is the index of '<' for the outer <div>. Returns index after the matching </div>."""
    if open_start >= len(html) or not html.startswith("<div", open_start):
        return None
    depth = 0
    i = open_start
    n = len(html)
    while i < n:
        if html.startswith("<div", i):
            nxt = i + 4
            if nxt < n and html[nxt] not in " \t\n\r>/":
                i += 1
                continue
            depth += 1
            gt = html.find(">", i)
            if gt == -1:
                return None
            i = gt + 1
        elif html.startswith("</div>", i):
            depth -= 1
            i += len("</div>")
            if depth == 0:
                return i
        else:
            i += 1
    return None


def _div_pt16_block_to_main(raw: str) -> str:
    raw = re.sub(r"^<div\b", "<main", raw, count=1)
    lix = raw.rfind("</div>")
    if lix == -1:
        return raw
    raw = raw[:lix] + "</main>" + raw[lix + len("</div>") :]
    # Outer <main> wrapping an inner <main> (e.g. feeding management): demote inner to div
    raw = re.sub(
        r"(?is)(<main\b[^>]*>\s*)(<main\b[^>]*>.*?</main>)",
        lambda m: m.group(1)
        + m.group(2).replace("<main", "<div", 1).replace("</main>", "</div>", 1),
        raw,
        count=1,
    )
    return raw


def _extract_main_pt16_div(text: str) -> tuple[str, int] | None:
    m = re.search(
        r"<!--\s*Main Content[^>]*-->\s*(<div\s+[^>]*\bpt-16\b[^>]*>)",
        text,
        re.I | re.S,
    )
    if not m:
        return None
    start = m.start(1)
    end = _find_balanced_div_close(text, start)
    if end is None:
        return None
    raw = text[start:end]
    return _div_pt16_block_to_main(raw), end


def _normalize_main_padding(main_block: str) -> str:
    main_block = re.sub(r"lg:pl-72|md:pl-72", "md:pl-64", main_block)
    if "pt-16" in main_block and "md:pl-64" not in main_block and "pl-64" not in main_block:
        main_block = re.sub(
            r'(<main\b[^>]*class=")([^"]*)(")',
            lambda m: m.group(1) + m.group(2) + " md:pl-64" + m.group(3),
            main_block,
            count=1,
        )
    return main_block


def _extract_placeholder_main(text: str, name: str) -> str | None:
    if name not in PLACEHOLDER_TEMPLATES:
        return None
    m = re.search(r"(?is)<body[^>]*>(.*)</body>", text)
    if not m:
        return None
    inner = m.group(1).strip()
    return (
        '<main class="pt-16 md:pl-64 min-h-screen bg-gray-50 dark:bg-gray-900 transition-colors duration-300">\n'
        '    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 flex items-center justify-center min-h-[calc(100vh-4rem)]">\n'
        f"{inner}\n"
        "    </div>\n"
        "</main>"
    )


def migrate_file(name: str) -> bool:
    meta = MIGRATE.get(name)
    if not meta:
        return False
    path = TPL / name
    text = path.read_text(encoding="utf-8")
    if "farm_unified_sidebar.html" in text and "farm_hub_shell_head_fragment.html" in text:
        return False
    title_m = re.search(r"<title>(.*?)</title>", text, re.I | re.S)
    title = title_m.group(1).strip() if title_m else meta["breadcrumb"]

    main_block: str | None = None
    tail: str

    pt = _extract_main_pt16_div(text)
    if pt:
        main_block, end = pt
        tail = text[end:]
    else:
        std = re.search(r"(?is)<main\b[^>]*>.*?</main>", text)
        if std:
            main_block = std.group(0)
            tail = text[std.end() :]
        else:
            ph = _extract_placeholder_main(text, name)
            if ph:
                main_block = ph
                tail = "\n</body>\n</html>\n"
            else:
                print("SKIP no main:", name)
                return False

    main_block = _normalize_main_padding(main_block)

    extra = meta.get("extra") or ""
    body = BODY.format(
        breadcrumb=meta["breadcrumb"],
        icon=meta["icon"],
        banner_title=meta["banner_title"],
        banner_sub=meta["banner_sub"],
        nav_partial=meta["nav_partial"],
        extra_vars=extra + "\n" if extra else "",
    )
    new_html = HEAD.format(title=title) + body + main_block + tail
    path.write_text(new_html, encoding="utf-8")
    print("OK", name)
    return True


def main() -> None:
    n = 0
    for name in sorted(MIGRATE.keys()):
        if migrate_file(name):
            n += 1
    print("migrated", n, "files")


if __name__ == "__main__":
    main()
