# Camera QR Code Recognition & Scan Latency Verification

**Testing Rig:** 1080p WebRTC stream via `html5-qrcode.min.js`  
**Distance Tested:** 15cm to 60cm distance from screen / paper  

---

## 1. Recognition Performance Table

| QR Dimension | Display Medium | Ambient Light Level | Distance | Decode Time | Status |
| :---: | :--- | :---: | :---: | :---: | :---: |
| 250 x 250 px | Smartphone Screen | 500 lux (Office) | 25 cm | 180ms | PASS |
| 250 x 250 px | Printed Paper Badge| 500 lux (Office) | 30 cm | 140ms | PASS |
| 250 x 250 px | Smartphone Screen | 50 lux (Dim Hall)| 20 cm | 310ms | PASS |
| 250 x 250 px | Crinkled Paper Badge| 500 lux (Office) | 25 cm | 220ms | PASS |

**Result:** Fast, robust recognition with sub-350ms median decode latency across all standard physical environments.
