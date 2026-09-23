# Viva Examination Defense: Security & Authentication Architecture

**Domain Lead:** Anant Kumar Jain (`anantkumarjain2006@gmail.com`)  
**Module:** Spring Security 6.x, BCrypt, FilterChain, Interceptors  

---

## Key Viva Questions & Model Answers

### Q1: How does VAMS handle password hashing, and why not use MD5 or SHA-256 directly?
**Answer:**
We use `BCryptPasswordEncoder` configured with 12 salt rounds. Raw cryptographic hash functions like MD5 and SHA-256 are fast by design, making them vulnerable to GPU-based rainbow table and brute-force attacks. BCrypt incorporates a salt automatically to prevent rainbow tables and uses an adaptive, computationally intensive key expansion algorithm (Eksblowfish) that deliberately slows down attackers while maintaining seamless single-login verification for legitimate users.

### Q2: Explain the SecurityFilterChain configured in VAMS.
**Answer:**
In `SecurityConfig.java`, we define a `SecurityFilterChain` bean that intercepts incoming HTTP requests:
1. **Public Routes:** `/`, `/login`, `/register`, `/verify`, `/css/**`, `/images/**` are marked `permitAll()`.
2. **Role Boundaries:**
   - `/owner/**` requires authority `ROLE_OWNER`.
   - `/manager/**` requires authority `ROLE_MANAGER` or `ROLE_OWNER`.
   - `/scanner/**` requires authority `ROLE_SECURITY` or `ROLE_OWNER`.
   - `/dashboard` requires any authenticated user.
3. **Session Management:** Sessions use `migrateSession()` upon login to defeat session fixation attacks.
4. **CSRF Protection:** Enabled on all state-changing HTTP POST endpoints with token verification.

### Q3: How do you prevent unverified accounts from generating visitor passes?
**Answer:**
We implemented `EmailVerificationInterceptor.java` registered via `WebMvcConfig.java`. When an authenticated user accesses protected visitor endpoints, the interceptor checks `user.isEmailVerified()`. If `false`, it redirects the user immediately to `/verify-email-notice`, preventing pass generation until the email verification token is validated.

### Q4: How are replay attacks prevented at physical scanning checkpoints?
**Answer:**
Every QR code payload contains:
1. `requestId`: Primary key of the approved access pass.
2. `token`: Cryptographically secure random UUID.
3. `validUntil`: Epoch expiration timestamp.
4. `signature`: HMAC-SHA256 digital signature.
The scanner validates that `currentTime <= validUntil`. Once an `EXIT` scan occurs or the time expires, the pass status updates to `EXPIRED` or `COMPLETED`, rendering copied photos or duplicated tokens invalid.

- Q: Why BCrypt? A: Adaptive work factor prevents GPU brute-force attacks.
