# QR Code Error Correction Level (Level M) Verification

**Specification:** ISO/IEC 18004 QR Code Standard  
**Configured Error Correction:** Level M (Recovers up to 15% damaged data codewords)  

---

## 1. Obfuscation & Damage Test Results

| Simulated Damage Scenario | Data Loss % | Scannability Result | Decode Time |
| :--- | :---: | :---: | :---: |
| Clean QR Print | 0% | Instant Decode | 120ms |
| 5% Surface Smudge | 5% | Instant Decode | 135ms |
| 10% Corner Occlusion | 10% | Instant Decode | 160ms |
| 14% Center Punch Hole | 14% | Successful Decode | 210ms |
| 20% Extreme Tear | 20% | Failed (Exceeds Level M) | N/A |

**Result:** Level M error correction provides the ideal balance between high recovery capability and compact barcode matrix density.
