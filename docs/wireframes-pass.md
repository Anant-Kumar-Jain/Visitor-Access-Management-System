# Wireframe Architecture: Visitor Access Pass Request & Card

**Views Included:** Pass Application (`pass-request.html`), Digital Pass View (`pass-view.html`)  
**Author:** Ashish Kumar Swami (`ashishswami227@gmail.com`)  

---

## 1. Digital Visitor Pass Card Wireframe

```text
+-------------------------------------------------------------+
|                 VISITOR ACCESS PERMIT - VAMS                |
+-------------------------------------------------------------+
|  Pass Holder: John Doe              Status: APPROVED (Green)|
|  Company: Apex Systems              Pass ID: #AR-10492      |
|  Valid Date: 2026-09-27             Valid Window: 09:00-18:00|
|  Designated Gate: Main Gate Entrance                         |
+-------------------------------------------------------------+
|                                                             |
|                 +-------------------------+                 |
|                 |       [QR CODE]         |                 |
|                 |       300x300 px        |                 |
|                 |     (ZXing Base64)      |                 |
|                 +-------------------------+                 |
|                 Token: 9e8f1b2c... [HMAC Valid]             |
|                                                             |
+-------------------------------------------------------------+
|  [ Download PDF Badge ]               [ Print Pass Card ]   |
+-------------------------------------------------------------+
```
