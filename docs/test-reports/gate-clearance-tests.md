# Gate Clearance & Multi-Zone Security Test Report

**Module:** Multi-Gate Authorization & GatePermission Entity  
**Test Objective:** Verify that passes granted for "Main Gate" cannot unlock "Server Room Gate".

---

## 1. Zone Clearance Matrix

| Access Pass ID | Designated Clearance | Attempted Gate | Expected Access | Verified Response |
| :---: | :--- | :--- | :---: | :---: |
| **PASS-101** | PUBLIC (Main Entrance) | Main Entrance (Public) | ALLOW | ACCESS GRANTED |
| **PASS-101** | PUBLIC (Main Entrance) | Data Center (Restricted)| DENY | REJECTED: NO CLEARANCE |
| **PASS-102** | RESTRICTED (Full Campus)| Main Entrance (Public) | ALLOW | ACCESS GRANTED |
| **PASS-102** | RESTRICTED (Full Campus)| Data Center (Restricted)| ALLOW | ACCESS GRANTED |
