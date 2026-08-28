# Automated Database Cron Backup Specification

**DevOps Lead:** Ansh Soni (`ansh10soni@gmail.com`)  

---

## 1. Backup Schedule & Retention Policy
- **Execution Frequency:** Daily at 02:00 IST via cron daemon.
- **Backup Command:** `mysqldump -u vams_user -p vams_db | gzip > /backups/vams_$(date +%F).sql.gz`
- **Retention Strategy:**
  - Daily backups preserved for 14 days.
  - Weekly Sunday snapshots preserved for 12 weeks.
  - Automatic pruning of archives older than retention threshold.
