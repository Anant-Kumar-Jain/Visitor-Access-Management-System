# Week 11 Database Performance Benchmark & Archival Audit

**Author:** Bhavesh Sharma (`bhavesh9705@gmail.com`)  

---

## 1. Performance Audit Summary
- **Database Engine:** MySQL 8.0.36 InnoDB
- **Connection Pool:** HikariCP with 10 max active connections, 30s connection timeout.
- **Table Statistics:**
  - `users`: 100 benchmark rows, index scan latency 0.4ms.
  - `access_requests`: 500 benchmark rows, index lookup on token 0.2ms.
  - `scan_logs`: 2,500 benchmark rows, composite index lookup on `(request_id, scan_time)` 0.3ms.
