# Security Architecture Archive & Cryptographic Specifications

**Project:** VAMS - Visitor Access Management System  
**Document Code:** SEC-ARCH-FINAL-2026  
**Security Architect:** Anant Kumar Jain (`anantkumarjain2006@gmail.com`)  

---

## 1. Cryptographic Specifications

### Symmetric Key Token Generation
- **Algorithm:** HMAC-SHA256 (Hash-based Message Authentication Code).
- **Secret Key Storage:** Externalized environment variable `VAMS_QR_SECRET_KEY` (never hardcoded into version control).
- **Signature Payload Formula:**  
  $$	ext{Signature} = 	ext{HMAC-SHA256}(	ext{requestId} + 	ext{"::"} + 	ext{token} + 	ext{"::"} + 	ext{validUntilEpoch}, 	ext{SecretKey})$$
- **Verification Complexity:** $O(1)$ constant-time comparison using `MessageDigest.isEqual` to neutralize timing side-channel attacks.

---

## 2. Spring Security FilterChain Layout

```text
Client Request
      │
      ▼
CorsFilter ──► CsrfFilter ──► SecurityContextHolderFilter ──► LogoutFilter
      │
      ▼
UsernamePasswordAuthenticationFilter (Checks BCrypt Credentials)
      │
      ▼
DefaultLoginPageGeneratingFilter
      │
      ▼
BasicAuthenticationFilter ──► RequestCacheAwareFilter ──► AnonymousAuthenticationFilter
      │
      ▼
SessionManagementFilter (Enforces sessionFixation().migrateSession())
      │
      ▼
ExceptionTranslationFilter (Catches AccessDeniedException -> 403 Page)
      │
      ▼
AuthorizationFilter (Enforces @PreAuthorize and requestMatchers role mappings)
      │
      ▼
DispatcherServlet (Controller Execution)
```

---

## 3. Session Security Configuration
- **Cookie Security:** `JSESSIONID` configured with `HttpOnly` and `SameSite=Strict` attributes.
- **Timeout Policy:** Automatic session invalidation after 30 minutes of idle inactivity.
- **Concurrent Session Control:** Maximum 1 concurrent session per authenticated credential to prevent credential sharing.
