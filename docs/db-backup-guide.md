# Database Backup, Disaster Recovery & Restoration Guide

**Author:** Ansh Soni (`ansh10soni@gmail.com`)  

---

## 1. Daily Backup Command
```bash
mysqldump -u vams_user -p --single-transaction --quick vams_db | gzip > /backups/vams_$(date +%F).sql.gz
```

## 2. Restoration Procedure
```bash
gunzip < /backups/vams_2026-09-27.sql.gz | mysql -u vams_user -p vams_db
```
