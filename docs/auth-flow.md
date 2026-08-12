# Authentication Endpoints
- GET /login
- POST /login
- GET /register
- POST /register

- Lockout policy: 5 consecutive failed attempts lock account for 15 mins.

- Added getId(), getFullName(), and getAccessLevel() getters.

- Registration checks for duplicate email and redirects with error alert.

- Owner -> /owner/dashboard, Manager -> /manager/dashboard, Guest -> /dashboard

- Added secure UUID token generation with 15-minute expiry.
