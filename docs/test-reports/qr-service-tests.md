# QrCodeService Unit Test & Base64 Generation Report

**Service Under Test:** `com.vams.service.QrCodeService`  
**Library:** ZXing (`com.google.zxing:core:3.5.3`)  
**Pass Rate:** 100% (5 / 5 tests passed)  

---

## 1. Test Summary
- `testGenerateQrCodeBase64_ValidPayload`: Verified Base64 string starts with `data:image/png;base64,iVBORw0KGgo...`.
- `testQrCodeResolution`: Verified dimension produces 300x300 pixel output image.
- `testNullPayloadHandling`: Verified throws `IllegalArgumentException` with descriptive error message.
- `testCharacterEncoding`: Verified UTF-8 encoding ensures proper international character preservation.
