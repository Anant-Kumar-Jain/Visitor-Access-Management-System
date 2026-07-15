# Email Verification & Account Activation Architecture

**Author:** Anant Kumar Jain (`anantkumarjain2006@gmail.com`)  

---

## 1. Security Workflow
1. User submits registration form $
ightarrow$ record created with `email_verified = FALSE`.
2. Secure cryptographic token (UUID v4) generated and stored in `verification_token`.
3. Verification link emailed to user: `https://vams.com/verify?token=<UUID>`.
4. User clicks link $
ightarrow$ `email_verified` toggled to `TRUE`, token invalidated.
5. `EmailVerificationInterceptor` permits pass applications only for verified accounts.
