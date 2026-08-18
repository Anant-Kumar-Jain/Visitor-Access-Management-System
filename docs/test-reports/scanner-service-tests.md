# ScannerService Unit & Integration Test Report

**Service Under Test:** `com.vams.service.ScannerService`  
**Test Suite:** `ScannerServiceTest.java`  
**Pass Rate:** 100% (6 / 6 tests passed)  

---

## 1. Test Scenarios Matrix

| Scenario Name | Precondition | Input Data | Expected Output | Actual | Status |
| :--- | :--- | :--- | :--- | :--- | :---: |
| `testValidEntryScan` | Approved pass, no prior scans | Token `T-101`, Gate 1, ENTRY | ScanLog persisted, status GRANTED | GRANTED | PASS |
| `testValidExitScan` | Approved pass, prior ENTRY scan | Token `T-101`, Gate 1, EXIT | ScanLog persisted, status GRANTED | GRANTED | PASS |
| `testAntiPassbackEntryViolation` | Pass already has ENTRY scan | Token `T-101`, Gate 2, ENTRY | Rejection: Dual Entry Detected | REJECTED | PASS |
| `testAntiPassbackExitViolation` | Pass has no prior ENTRY scan | Token `T-102`, Gate 1, EXIT | Rejection: Exit without Entry | REJECTED | PASS |
| `testInactiveGateRejection` | Gate active flag set to false | Token `T-101`, Gate 3, ENTRY | Rejection: Gate is inactive | REJECTED | PASS |
| `testRestrictedGateAccessControl`| Pass lacks RESTRICTED permission| Token `T-103`, Gate 4, ENTRY | Rejection: Insufficient clearance | REJECTED | PASS |
