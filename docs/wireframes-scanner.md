# Wireframe Architecture: Security Checkpoint Camera Scanner

**Views Included:** `scanner/scan.html`  
**Author:** Ashish Kumar Swami (`ashishswami227@gmail.com`)  

---

## 1. Guard Terminal Scanner Wireframe

```text
+-----------------------------------------------------------------------------------------+
| VAMS Checkpoint Scanner Terminal           Guard: guard@vams.com | Gate: Main Entrance  |
+-----------------------------------------------------------------------------------------+
|                                                                                         |
|                  +-----------------------------------+                                  |
|                  |     LIVE CAMERA VIEWFINDER        |                                  |
|                  |   [ WebRTC Video Stream 60 FPS ]  |                                  |
|                  |        ┌───             ───┐      |                                  |
|                  |        │   Target Reticle  │      |                                  |
|                  |        └───             ───┘      |                                  |
|                  +-----------------------------------+                                  |
|                                                                                         |
|                  [ SELECT CAMERA DROPDOWN ]  [ STOP STREAM ]                            |
|                                                                                         |
| +-------------------------------------------------------------------------------------+ |
| | SCAN RESULT BANNER: [ GREEN ] ENTRY GRANTED - John Doe (Apex Systems) - 10:14:22 AM  | |
| +-------------------------------------------------------------------------------------+ |
|                                                                                         |
| Manual Override: Token [ 9e8f1b2c... ] [ Submit Manual Scan ]                           |
+-----------------------------------------------------------------------------------------+
```
