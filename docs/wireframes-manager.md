# Wireframe Architecture: Manager Approval Queue Dashboard

**Views Included:** `manager/dashboard.html`  
**Author:** Ashish Kumar Swami (`ashishswami227@gmail.com`)  

---

## 1. Dashboard Table Layout

```text
+-----------------------------------------------------------------------------------------+
| VAMS Manager Console                       Active User: manager@vams.com [Logout]       |
+-----------------------------------------------------------------------------------------+
| [ Metric: 12 Pending ]       [ Metric: 84 Approved Today ]      [ Metric: 3 Rejected ]  |
+-----------------------------------------------------------------------------------------+
| PENDING APPROVAL REQUESTS                                                               |
+----+---------------+---------------------+--------------------+------------+------------+
| ID | Visitor Name  | Organization        | Time Window        | Gate       | Action     |
+----+---------------+---------------------+--------------------+------------+------------+
| 42 | Alice Smith   | Global Logistics    | Today 10:00-14:00  | Main Gate  | [Approve]  |
|    |               | Reason: IT Audit    |                    |            | [Reject]   |
| 43 | Bob Johnson   | Hardware Vendors    | Today 11:30-16:00  | Gate 2     | [Approve]  |
|    |               | Reason: Maintenance |                    |            | [Reject]   |
+----+---------------+---------------------+--------------------+------------+------------+
```
