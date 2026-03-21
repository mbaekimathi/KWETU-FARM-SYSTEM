# Database & data-model change log

This file tracks **schema migrations** and **important application rules** that affect stored data.  
DDL changes are applied via `db_migrations.py` → `schema_migrations` table on app startup.

## 2026-03-19 — Chicken flock `age_days` (application rule)

- **Table:** `chickens`
- **Column:** `age_days` (unchanged — still stored in DB)
- **Schema:** No migration required.
- **Behavior:** On **edit** (`POST /admin/farm/chicken-flock-update/<id>`), `age_days` is **recalculated** from `hatch_date` vs today’s date (not accepted from the client). The UI shows age as read-only when editing.

---

_Add new dated sections above when you change tables/columns or data rules that affect the database._
