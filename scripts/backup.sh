#!/usr/bin/env bash
# ==============================================================================
# VAMS Automated Database Backup Script
# Author: Ansh Soni (ansh10soni@gmail.com)
# Role: DevOps & Project Lead
# ==============================================================================
set -euo pipefail

DB_NAME="vams_db"
DB_USER="vams_user"
BACKUP_DIR="${HOME}/vams_backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="${BACKUP_DIR}/vams_backup_${TIMESTAMP}.sql.gz"

mkdir -p "${BACKUP_DIR}"

echo "=========================================================="
echo " Starting VAMS MySQL Database Backup: ${TIMESTAMP}"
echo "=========================================================="

# Check if mysqldump is installed
if ! command -v mysqldump &> /dev/null; then
    echo "ERROR: mysqldump command not found. Please install MySQL client."
    exit 1
fi

echo "Exporting database '${DB_NAME}'..."
mysqldump --user="${DB_USER}"           --single-transaction           --quick           --lock-tables=false           "${DB_NAME}" | gzip > "${BACKUP_FILE}"

echo "Backup successfully created: ${BACKUP_FILE}"
echo "Archive size: $(du -h "${BACKUP_FILE}" | cut -f1)"

# Retain last 14 days of backups and remove older snapshots
echo "Pruning backups older than 14 days..."
find "${BACKUP_DIR}" -name "vams_backup_*.sql.gz" -mtime +14 -delete

echo "Backup procedure completed successfully."
