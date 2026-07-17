# Authentication & Authorization Test Scenarios

**Author:** Anant Kumar Jain (`anantkumarjain2006@gmail.com`)  
**Scope:** Spring Security 6.x Authentication Flow  

---

## 1. Authentication Scenarios Matrix

| Scenario ID | Test Condition | Input Data | Expected Result | Pass/Fail |
| :---: | :--- | :--- | :--- | :---: |
| **AUTH-01** | Valid credentials for Guest user | `visitor@vams.com` / `Visitor@123` | Redirect to `/dashboard`, session established | PASS |
| **AUTH-02** | Invalid password submission | `visitor@vams.com` / `WrongPass` | Remain on `/login?error`, alert displayed | PASS |
| **AUTH-03** | Unregistered email address | `unknown@vams.com` / `Test@123` | Authentication failure, no user enumeration | PASS |
| **AUTH-04** | Role check: Guard accessing Manager | `guard@vams.com` GET `/manager/dashboard` | HTTP 403 Forbidden | PASS |
| **AUTH-05** | Unauthenticated user accessing API | Anonymous GET `/api/passes` | HTTP 302 Redirect to `/login` | PASS |
