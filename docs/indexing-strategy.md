# Database Indexing Strategy & Query Performance Optimization

**Database Engineer:** Bhavesh Sharma (`bhavesh9705@gmail.com`)  
**Target RDBMS:** MySQL 8.0 LTS (InnoDB B-Tree Indexes)  

---

## 1. Indexing Inventory & Rationale

| Table Name | Index Name | Column(s) Indexed | Index Type | Query Optimization Rationale |
| :--- | :--- | :--- | :---: | :--- |
| `users` | `idx_user_email` | `email` | UNIQUE B-Tree | Accelerates Spring Security authentication lookups ($O(\log N)$). |
| `users` | `idx_user_role` | `role` | Non-Unique | Speeds up managerial and owner user listing queries. |
| `access_requests` | `idx_req_token` | `token` | UNIQUE B-Tree | Ensures sub-millisecond barcode lookup during guard checkpoint scans. |
| `access_requests` | `idx_req_status` | `status` | Non-Unique | Optimizes manager pending approval queue queries. |
| `access_requests` | `idx_req_validity`| `valid_from, valid_until` | Composite | Speeds up scheduled expiration and active visitor filtering. |
| `scan_logs` | `idx_scan_composite`| `request_id, scan_time` | Composite | Powers instantaneous anti-passback prior-scan state evaluations. |
| `scan_logs` | `idx_gate_occupancy`| `gate_id, scan_type, scan_time`| Composite | Powers live building occupancy aggregations without full table scans. |
