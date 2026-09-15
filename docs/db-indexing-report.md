# MySQL Index Analysis & Query Execution Plans (EXPLAIN)

**Author:** Bhavesh Sharma (`bhavesh9705@gmail.com`)  

---

## 1. Query Execution Plan (Token Verification)
```sql
EXPLAIN SELECT * FROM access_requests WHERE token = '9e8f1b2c3d4e5f6a...';
```
- **select_type:** SIMPLE
- **table:** access_requests
- **type:** const
- **possible_keys:** idx_req_token
- **key:** idx_req_token
- **rows:** 1
- **filtered:** 100.00%
- **Extra:** Using index condition
