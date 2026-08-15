# VAMS Cryptographic QR Code Specification

## 1. Payload Format
The generated QR code encodes a structured pipe-delimited payload:
```text
VAMS|v1|<requestId>|<visitorId>|<validUntilEpoch>|<hmacSha256Signature>
```

## 2. Parameter Breakdown
- `VAMS`: Application protocol identifier.
- `v1`: Payload version for backward compatibility.
- `requestId`: Unique database primary key from `access_requests`.
- `visitorId`: Database primary key of the authorized user.
- `validUntilEpoch`: Unix timestamp in seconds defining expiration.
- `hmacSha256Signature`: HMAC computed over `<requestId>|<visitorId>|<validUntilEpoch>` using the server master secret.

## 3. Verification Sequence
1. Camera reads raw string from QR bitmap.
2. Server validates format starts with `VAMS|v1|`.
3. Server recomputes HMAC-SHA256 signature using internal server secret.
4. If signature matches:
   - Check `currentEpoch <= validUntilEpoch`.
   - Verify visitor clearance level $\ge$ gate clearance level.
   - Verify anti-passback rule.
5. Record outcome to `scan_logs` and return JSON result to scanner viewport.

- QRService encrypts pass tokens using 256-bit AES cipher.
