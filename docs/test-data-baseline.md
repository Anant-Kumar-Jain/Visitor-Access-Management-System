# Test Data Baseline & Default System Fixtures

**Database Lead:** Bhavesh Sharma (`bhavesh9705@gmail.com`)  

---

## 1. Pre-Populated Accounts (`data.sql`)

| Email | Password (Plaintext for Dev) | Role | Assigned Function |
| :--- | :--- | :--- | :--- |
| `owner@vams.com` | `Owner@123` | `ROLE_OWNER` | System Owner & Enterprise Administrator |
| `manager@vams.com` | `Manager@123` | `ROLE_MANAGER`| Facility Access Approver |
| `guard@vams.com` | `Guard@123` | `ROLE_SECURITY`| Checkpoint Gate Scanner Operator |
| `visitor@vams.com` | `Visitor@123` | `ROLE_GUEST` | Registered Guest & Visitor |

---

## 2. Default Access Gates
- **Gate 1:** Main Campus Gate (Public Access Level, Active)
- **Gate 2:** North Office Entrance (Public Access Level, Active)
- **Gate 3:** Server Room & Data Center (Restricted Access Level, Active)
- **Gate 4:** Loading Dock / Service Bay (Restricted Access Level, Active)
