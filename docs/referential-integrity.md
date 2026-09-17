# Database Referential Integrity & Foreign Key Cascade Rules

**Author:** Bhavesh Sharma (`bhavesh9705@gmail.com`)  

---

## 1. Cascade Rules Matrix
- `access_requests.user_id` $
ightarrow$ `users.id`: `ON DELETE CASCADE`.
- `scan_logs.request_id` $
ightarrow$ `access_requests.id`: `ON DELETE CASCADE`.
- `scan_logs.gate_id` $
ightarrow$ `gates.id`: `ON DELETE RESTRICT` (prevents deleting active gate with scan history).
- `scan_logs.scanned_by` $
ightarrow$ `users.id`: `ON DELETE RESTRICT` (preserves guard audit trail).
