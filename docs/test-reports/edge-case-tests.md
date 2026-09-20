# Edge Case & Boundary Value Analysis Test Report

**QA Tester:** Deepanshu (`deepanshu0973@gmail.com`)  
**Focus Areas:** Boundary timestamps, malformed inputs, SQL injection vectors, concurrent duplicate requests.

---

## 1. Boundary Test Scenarios

| Test ID | Input / Scenario | Expected System Response | Actual Result | Status |
| :---: | :--- | :--- | :--- | :---: |
| **TC-EDGE-01** | Pass scan at `validUntil - 1s` | Grant entry (token is active) | Access granted | PASS |
| **TC-EDGE-02** | Pass scan at `validUntil + 1s` | Reject entry (token has expired) | Access rejected | PASS |
| **TC-EDGE-03** | Reason input with 10,000 chars | Validation error: maximum 500 chars | Error banner displayed | PASS |
| **TC-EDGE-04** | SQL payload: `' OR '1'='1` in email | Login fails; parameterized query treats as literal string | Clean rejection | PASS |
| **TC-EDGE-05** | XSS payload: `<script>alert(1)</script>` in visitor name | Escaped by Thymeleaf `th:text`; renders as text | No script execution | PASS |
| **TC-EDGE-06** | Scan QR code from different tenant/system | Rejection: "Unrecognized QR Signature" | Clean rejection | PASS |
