# Mobile Camera & WebRTC Hardware Access Test Report

**Module:** Checkpoint Camera Barcode Reader (`html5-qrcode.js`)  
**Tested Devices:** Samsung Galaxy S23, iPhone 14 Pro, Google Pixel 7, Redmi Note 12  
**Test Objective:** Validate camera permission, frame parsing, and lighting adaptability.

---

## 1. Test Results Matrix

| Device Model | OS Version | Camera Sensor | Resolution | Time to Lock QR | Status |
| :--- | :--- | :--- | :---: | :---: | :---: |
| **Pixel 7** | Android 14 | Back Wide (50MP) | 1080p Stream | 320ms | PASS |
| **Galaxy S23**| Android 14 | Primary Sensor | 1080p Stream | 290ms | PASS |
| **iPhone 14 Pro**| iOS 17.4 | Main 48MP | 1080p Stream | 310ms | PASS |
| **Redmi Note 12**| Android 13 | Main 50MP | 720p Stream | 410ms | PASS |

---

## 2. Edge Case Observations
- **Screen Glare / Low Contrast:** Scanning off smartphone screens with brightness at 20% achieved successful decode within 650ms.
- **Angle Tolerance:** QR code recognized at up to 45-degree angle tilt from perpendicular axis.
- **Permissions Handling:** When user declines camera permission, interface gracefully displays clear error banner with fallback manual token entry input.
