# Complete UI Screenshot & Demonstration Catalog

**Visual Design Lead:** Ashish Kumar Swami (`ashishswami227@gmail.com`)  
**Project:** VAMS - Visitor Access Management System  
**Evaluation Reference:** Screen progression for evaluator demonstration.

---

## 1. Visual Workflow Progression

### Phase 1: Visitor Registration & Authentication
- **Screenshot 01 (`login-screen.png`):** Responsive Bootstrap 5 login interface featuring email/password fields, "Remember Me" checkbox, and link to self-service registration.
- **Screenshot 02 (`registration-view.png`):** Comprehensive registration form validating email formatting, phone numbers, and BCrypt encrypted password confirmation.
- **Screenshot 03 (`verify-email-notice.png`):** Informational screen instructing new users to click the email verification link prior to accessing visitor features.

### Phase 2: Visitor Access Pass Lifecycle
- **Screenshot 04 (`visitor-pass-apply.png`):** Form interface allowing visitor to specify visit purpose, host employee, designated entry gate, and valid time window.
- **Screenshot 05 (`visitor-dashboard-pending.png`):** Visitor dashboard displaying active pass requests with high-contrast amber "PENDING" badge.
- **Screenshot 06 (`manager-approval-queue.png`):** Manager terminal listing pending visitor passes with 1-click "Approve" (Green) and "Reject" (Red) actions.
- **Screenshot 07 (`digital-qr-pass-active.png`):** Approved digital pass badge rendering a 300x300 ZXing generated QR code, security HMAC hash, and live countdown timer.

### Phase 3: Security Guard Scanning & Anti-Passback
- **Screenshot 08 (`scanner-camera-live.png`):** Guard terminal with active WebRTC camera viewfinder showing animated target reticle.
- **Screenshot 09 (`scan-grant-entry.png`):** Full-screen green success banner displaying visitor photo, permitted gates, and timestamp: **ENTRY GRANTED**.
- **Screenshot 10 (`scan-reject-duplicate.png`):** High-visibility red alert banner: **SCAN REJECTED - ANTI-PASSBACK VIOLATION (Dual Entry)**.

### Phase 4: Administrative Analytics & System Control
- **Screenshot 11 (`owner-analytics-overview.png`):** Executive overview illustrating real-time campus occupancy metrics, peak entry hours chart, and total scans today.
- **Screenshot 12 (`gate-management-grid.png`):** Real-time gate status table with toggle switches enabling instant emergency lockdown or reopening.
