# Viva Examination Defense: Database Architecture & Relational Modeling

**Domain Lead:** Bhavesh Sharma (`bhavesh9705@gmail.com`)  
**Module:** MySQL 8.0, Spring Data JPA, Hibernate, Normalization  

---

## Key Viva Questions & Model Answers

### Q1: Prove that the VAMS database schema is in Third Normal Form (3NF).
**Answer:**
1. **1NF:** Every column contains atomic values, each table has a primary key, and there are no repeating groups.
2. **2NF:** The schema is in 1NF and contains no partial dependencies—all non-key attributes depend fully on the primary key.
3. **3NF:** The schema is in 2NF and contains zero transitive dependencies. For example, in `access_requests`, user contact information is not duplicated; only `visitor_id` (foreign key to `users.id`) is stored. Gate location is not stored in scan logs; only `gate_id` (foreign key to `gates.id`) is recorded.

### Q2: How do you solve the anti-passback concurrency problem?
**Answer:**
Anti-passback prevents a visitor from passing their QR code back to a friend behind them. In `ScannerService.java`, we query `findTopByUserIdOrderByScanTimeDesc`. If the last scan was an `ENTRY` and the current scan is another `ENTRY`, the system rejects the scan with `ANTI_PASSBACK_VIOLATION`. The scan transaction is wrapped in `@Transactional` with pessimistic locking to prevent race conditions during simultaneous scans.

### Q3: What indexing strategy did you implement for high-volume scan logs?
**Answer:**
Audit tables grow rapidly in physical access systems. We indexed:
1. `users(email)`: Unique B-Tree index for instantaneous authentication lookup.
2. `scan_logs(user_id, scan_time DESC)`: Composite index for fast pass-history queries.
3. `scan_logs(gate_id, scan_time)`: Composite index for daily occupancy and gate traffic analytics.

- Q: How to avoid double entry? A: Database transaction with pessimistic write lock.

- Q: How are QR codes served? A: Generated in-memory as Base64 PNGs without disk I/O.
