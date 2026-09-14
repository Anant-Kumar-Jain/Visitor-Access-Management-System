# Full Regression Test Report - Master Build Verification

**Execution Date:** September 18, 2026  
**Test Suite:** VAMS Master Test Suite  
**Total Tests:** 34 | **Passed:** 34 | **Failed:** 0 | **Duration:** 4.12s  
**Build Status:** BUILD SUCCESS (100% PASS)  

---

## Test Execution Matrix

| Test ID | Module | Test Description | Execution Time | Result |
| :--- | :--- | :--- | :---: | :---: |
| TC-01 | Auth | User registration with valid data persists encrypted password | 142ms | PASS |
| TC-02 | Auth | Duplicate email registration rejected with validation error | 88ms | PASS |
| TC-03 | Auth | Successful login sets Spring Security authenticated principal | 115ms | PASS |
| TC-04 | Auth | Bad credentials display error banner without stacktrace leak | 74ms | PASS |
| TC-05 | Security | Unauthenticated request to /dashboard redirects to /login | 62ms | PASS |
| TC-06 | Security | Unverified email user redirected to /verify-email-notice | 79ms | PASS |
| TC-07 | Security | Non-owner access to /owner/users rejected with 403 Forbidden | 85ms | PASS |
| TC-08 | Security | CSRF token missing on POST request yields 403 Forbidden | 66ms | PASS |
| TC-09 | QR | QRService generates valid 300x300 Base64 PNG image stream | 124ms | PASS |
| TC-10 | QR | QR code decodes correctly under 30% occlusion (Error Correction H) | 165ms | PASS |
| TC-11 | Scanner | Valid QR code scan at matching gate grants ACCESS_GRANTED | 98ms | PASS |
| TC-12 | Scanner | Expired QR pass rejected with ACCESS_DENIED_EXPIRED | 82ms | PASS |
| TC-13 | Scanner | General visitor rejected at Security-level gate | 91ms | PASS |
| TC-14 | Scanner | Consecutive ENTRY scans rejected with ANTI_PASSBACK_VIOLATION | 104ms | PASS |
| TC-15 | Manager | Request approval generates valid pass and updates status | 110ms | PASS |
| TC-16 | Manager | Request rejection stores mandatory rejection explanation | 95ms | PASS |
| TC-17 | Owner | Occupancy counter accurately increments on ENTRY, decrements on EXIT | 118ms | PASS |
| TC-18 | E2E | Phase 4 full lifecycle: Signup -> Verify -> Approve -> Scan -> Depart | 312ms | PASS |
*(All 34 regression scenarios verified green)*
