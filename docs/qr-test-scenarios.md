# QR Code Cryptographic & Hardware Scanning Test Scenarios

**Author:** Deepanshu (`deepanshu0973@gmail.com`)  

---

## 1. QR Scenarios Matrix
- QR-01: Valid unexpired pass $
ightarrow$ ENTRY GRANTED.
- QR-02: Expired pass timestamp $
ightarrow$ REJECTED (Pass Expired).
- QR-03: Tampered HMAC signature payload $
ightarrow$ REJECTED (Invalid Signature).
- QR-04: Consecutive entry without exit $
ightarrow$ REJECTED (Anti-Passback Violation).
