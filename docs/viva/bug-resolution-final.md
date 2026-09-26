# Final Bug Resolution & Quality Audit Log

**QA Lead:** Deepanshu (`deepanshu0973@gmail.com`)  
**Total Defects Logged:** 28 | **Total Defects Resolved:** 28 (100% Closure)  
**Verification Date:** September 25, 2026  

---

## 1. Defect Resolution Summary

| Bug ID | Severity | Module | Description | Root Cause | Resolution Details | Status |
| :---: | :---: | :--- | :--- | :--- | :--- | :---: |
| **BUG-01** | High | Auth | Passwords without numbers permitted | Weak regex in UserValidator | Enforced 8+ chars with numeric & special character validation | CLOSED |
| **BUG-02** | Critical | Scanner | Replay attack with duplicate screenshot | Missing scan state transition check | Implemented anti-passback atomic status validation in service | CLOSED |
| **BUG-03** | Medium | UI | QR code clipping on mobile screens | Fixed CSS width in container | Applied `img-fluid` and responsive SVG scaling | CLOSED |
| **BUG-04** | High | Database | Foreign key constraint failure on delete | Missing cascade rule in JPA | Added `CascadeType.ALL` and `orphanRemoval=true` to entities | CLOSED |
| **BUG-05** | Critical | Security | Unverified users submitting requests | Missing interceptor check | Registered `EmailVerificationInterceptor` in WebMvcConfig | CLOSED |
| **BUG-06** | Medium | Manager | Table sorting broken on date column | Client-side string sorting | Implemented server-side Spring Data `Pageable` and `Sort` | CLOSED |
| **BUG-07** | High | QR Service | QR generation memory leak under load | Byte stream buffer unclosed | Enforced `try-with-resources` on `ByteArrayOutputStream` | CLOSED |
| **BUG-08** | Low | UI | Navbar collapse toggle lag on Safari | Outdated Bootstrap JS bundle | Upgraded to Bootstrap 5.3.2 bundle with native Popper.js | CLOSED |
| **BUG-09** | High | Gate | Inactive gate permitted check-in scans | Missing active flag validation | Added `gate.isActive()` precondition in `ScannerService` | CLOSED |
| **BUG-10** | Critical | Auth | Session fixation vulnerability | Default session handling | Configured `sessionManagement().sessionFixation().migrateSession()` | CLOSED |

---

## 2. QA Sign-Off Confirmation
All 28 defect tickets logged across the 12-week development lifecycle have been remediated, unit-tested, and verified in regression runs. **Zero known defects remain open in the production deliverable.**
