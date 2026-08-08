# Spring Security Architecture
Evaluating SecurityFilterChain and BCryptPasswordEncoder for VAMS.

- Session Fixation: migrateSession()
- CSRF Tokens: CookieCsrfTokenRepository

- BCrypt strength set to 12 rounds for balanced security/latency.

- SimpleGrantedAuthority mapped with 'ROLE_' prefix.

- Public: /css/**, /js/**, /images/**, /login, /register, /verify

- Logout invalidates HTTP session and clears security context.
