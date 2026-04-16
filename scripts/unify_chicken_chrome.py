"""Replace AgriTech / glass-effect header + footer with shared farm shell partials."""
from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
TEMPLATES = ROOT / "templates"

# (filename, breadcrumb, fa icon class, footer note)
FILES: list[tuple[str, str, str, str]] = [
    ("admin_farm_chicken_management.html", "Chicken Management", "fas fa-feather", "Chicken module"),
    ("admin_farm_chicken_health.html", "Chicken Health", "fas fa-heartbeat", "Chicken module"),
    ("admin_farm_chicken_settings.html", "Chicken Settings", "fas fa-sliders-h", "Chicken module"),
    ("admin_farm_chicken_flock_management.html", "Flock Management", "fas fa-users", "Chicken module"),
    ("admin_farm_chicken_production.html", "Chicken Production", "fas fa-egg", "Chicken module"),
    ("admin_farm_chicken_production_management.html", "Production Management", "fas fa-clipboard-list", "Chicken module"),
    ("admin_farm_chicken_weight_check.html", "Weight Check", "fas fa-weight", "Chicken module"),
]

HEADER_RE = re.compile(
    r"    <!-- Modern Header -->.*?    </header>\s*\n",
    re.DOTALL,
)

FOOTER_RE = re.compile(
    r"    <!-- Modern Footer -->.*?    </footer>\s*\n",
    re.DOTALL,
)

BODY_RE = re.compile(
    r'<body class="bg-slate-50 dark:bg-slate-900 transition-colors duration-300 font-inter chicken-pattern">',
)


def patch_text(name: str, breadcrumb: str, icon: str, footer_note: str) -> str:
    path = TEMPLATES / name
    text = path.read_text(encoding="utf-8")
    header_inc = (
        f'{{% set farm_shell_breadcrumb_current = {breadcrumb!r} %}}\n'
        f'{{% set farm_shell_icon_class = {icon!r} %}}\n'
        f"{{% include 'includes/farm_shell_header.html' %}}\n\n"
    )
    if "Modern Header -->" not in text:
        raise SystemExit(f"No Modern Header marker in {name}")
    text, n = HEADER_RE.subn(header_inc, text, count=1)
    if n != 1:
        raise SystemExit(f"Header replace count {n} in {name}")

    footer_inc = (
        f'{{% set farm_shell_footer_note = {footer_note!r} %}}\n'
        f"{{% include 'includes/farm_shell_footer.html' %}}\n\n"
    )
    if "Modern Footer -->" in text:
        text, fn = FOOTER_RE.subn(footer_inc, text, count=1)
        if fn != 1:
            raise SystemExit(f"Footer replace count {fn} in {name}")
    else:
        raise SystemExit(f"No Modern Footer in {name}")

    text, bn = BODY_RE.subn(
        '<body class="min-h-screen bg-gradient-to-br from-gray-50 via-blue-50/30 to-purple-50/30 '
        "dark:from-gray-900 dark:via-blue-900/20 dark:to-purple-900/20 transition-colors duration-300\">",
        text,
        count=1,
    )
    if bn != 1:
        raise SystemExit(f"Body replace count {bn} in {name}")

    text = text.replace("lg:translate-x-0", "md:translate-x-0")
    text = text.replace(" id=\"mobile-menu-btn\" class=\"lg:hidden", ' id="mobile-menu-btn" class="md:hidden')
    text = text.replace(" id=\"close-sidebar\" class=\"lg:hidden", ' id="close-sidebar" class="md:hidden')
    text = text.replace("window.innerWidth < 1024", "window.innerWidth < 768")
    text = text.replace("window.innerWidth >= 1024", "window.innerWidth >= 768")

    text = text.replace(
        '<div class="pt-16 lg:pl-72 min-h-screen bg-slate-50 dark:bg-slate-900">',
        '<main class="pt-16 md:pl-72 min-h-screen transition-[padding] duration-300">',
    )
    # Close main before footer: first </div> before Modern Footer was removed; find "</div>\n\n    <!-- Modern Footer" already replaced
    # Replace closing </div> that wrapped page content — pattern: content ends with </div> before footer include
    # After our footer replace, we need </main> before footer. The old structure was </div></div> before footer inside outer wrapper.
    # Simpler: replace the closing sequence before footer include marker - now before `{% set farm_shell_footer`
    text = text.replace(
        "</div>\n\n{% set farm_shell_footer_note",
        "</main>\n\n{% set farm_shell_footer_note",
        1,
    )
    return text


def main() -> None:
    for name, bc, icon, fnote in FILES:
        out = patch_text(name, bc, icon, fnote)
        (TEMPLATES / name).write_text(out, encoding="utf-8")
        print("patched", name)


if __name__ == "__main__":
    main()
