# Security Architecture Evaluator Demonstration Walkthrough

**Domain Lead:** Anant Kumar Jain (`anantkumarjain2006@gmail.com`)  
**Security Framework:** Spring Security 6.x, BCrypt Cryptography, FilterChain Defense  
**Evaluation Objective:** Demonstrate defense against OWASP Top 10 vulnerabilities during live examination.

---

## 1. Live Security Demonstrations Plan

### Demo 1: Password Storage & Salting (BCrypt)
- **Objective:** Prove passwords are not stored in plaintext or weak hashes (MD5/SHA1).
- **Execution:** 
  1. Open MySQL Workbench and query table `users`: `SELECT id, email, password FROM users LIMIT 3;`
  2. Explain hash format: `$2a$12$e8x...` where:
     - `2a`: BCrypt algorithm identifier.
     - `12`: 12 exponential salt rounds ($2^{12} = 4096$ iterations).
     - First 22 characters: Cryptographically secure random salt generated per user.
     - Remaining 31 characters: Derived hash.
  3. Show that identical passwords generate completely distinct hashes, defeating rainbow tables.

### Demo 2: Role-Based Authorization Enforcement
- **Objective:** Demonstrate that unauthorized roles cannot access privileged URLs.
- **Execution:**
  1. Log in as Guest (`visitor@vams.com`).
  2. Attempt direct URL navigation to privileged path: `GET /owner/dashboard`.
  3. Verify system responds with HTTP 403 Forbidden / redirect to unauthorized page.
  4. Log in as Security Guard (`guard@vams.com`).
  5. Confirm access is strictly limited to `/scanner/**` and blocked from `/manager/**` approval endpoints.

### Demo 3: Replay Attack Defense at Scanner Checkpoint
- **Objective:** Show that an expired or copied QR code cannot grant re-entry.
- **Execution:**
  1. Generate access pass valid until 14:00.
  2. At 14:01, simulate QR scan.
  3. Verify Security terminal renders immediate **REJECTED (Pass Expired)** banner and records security violation in `scan_logs`.
  4. Perform ENTRY scan $
ightarrow$ immediately scan identical QR for ENTRY again without prior EXIT.
  5. Verify **ANTI-PASSBACK VIOLATION (Dual Entry Detected)** warning.

### Demo 4: CSRF Token Injection
- **Objective:** Demonstrate cross-site request forgery prevention.
- **Execution:** Inspect HTML source of any POST form; point out hidden `_csrf` input token validated by `CsrfFilter`.
