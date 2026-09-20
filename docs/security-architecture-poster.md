# Security Architecture & Threat Model Poster

**Security Architect:** Anant Kumar Jain (`anantkumarjain2006@gmail.com`)  

---

## 1. STRIDE Threat Model & VAMS Mitigations

| Threat Category | Identified Attack Vector | VAMS Security Mitigation |
| :--- | :--- | :--- |
| **Spoofing** | Forging an access pass QR code | HMAC-SHA256 signature verification with secret key. |
| **Tampering** | Modifying expiry time inside QR code | Cryptographic signature validation detects payload mutation. |
| **Repudiation** | Denying who authorized visitor entry | Audited `scanned_by` and `approved_by` foreign keys in DB. |
| **Information Disclosure** | Plaintext credential sniffing | TLS encryption and BCrypt 12-round salted password hashing. |
| **Denial of Service** | Flooding scanner with repeated hits | Rate-limiting interceptors and indexed lookups. |
| **Elevation of Privilege** | Guest accessing admin panels | Spring Security `hasRole('ROLE_OWNER')` URL authorization. |
