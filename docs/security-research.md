# Spring Security Architecture
Evaluating SecurityFilterChain and BCryptPasswordEncoder for VAMS.

- Session Fixation: migrateSession()
- CSRF Tokens: CookieCsrfTokenRepository

- BCrypt strength set to 12 rounds for balanced security/latency.

- SimpleGrantedAuthority mapped with 'ROLE_' prefix.

- Public: /css/**, /js/**, /images/**, /login, /register, /verify

- Logout invalidates HTTP session and clears security context.

- Unauthenticated requests to secured routes redirected to /login?expired

- Interceptor excludes /css/**, /js/**, /images/**, /logout.

- Applied HTML escape sanitization on fullName and email parameters.

- Scans rejected if token timestamp exceeds validUntil bounds.

- Anti-passback: Reject ENTRY if user status is already INSIDE.

- Added business rule preventing self-approval of visitor requests.

- Bulk approval POST guarded with CSRF form validation.

- Admin accounts require minimum 8 characters with digit and special symbol.

- Admin modifications record remote IP address in SystemLog.

- Verified that URL tampering cannot elevate guest session to manager.

- CSP header added to prevent inline script execution.

- Remember-me configured with 7-day token persistence.
