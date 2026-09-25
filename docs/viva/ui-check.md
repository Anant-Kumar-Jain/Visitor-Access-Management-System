# User Interface Final Verification & Evaluator Checklist

**Module Lead:** Ashish Kumar Swami (`ashishswami227@gmail.com`)  
**Component:** Frontend UI, Responsive Views, Thymeleaf Templates, WebRTC Scanner  
**Evaluation Status:** 100% Verified across Chrome, Edge, Safari, Firefox  

---

## 1. UI Layout Verification Matrix

| Screen / View | Template Name | Responsive Breakpoints | Visual Accent / Status | Evaluator Demo Flow |
| :--- | :--- | :---: | :---: | :--- |
| **Landing / Home** | `index.html` | Mobile (<576px), Desktop (>992px) | Brand Navy Blue (#1e3c72) | Hero banner, feature overview, CTA links |
| **Login View** | `login.html` | Form centered card | Floating labels, validation error alerts | Guest & Manager credential input |
| **Registration** | `register.html` | Two-column desktop, single mobile | Real-time JS password match confirmation | New visitor self-service sign up |
| **Pass Request** | `pass-request.html`| Card layout with datepicker | Multi-select gate permission checklists | Submission of new visitor pass application |
| **Digital Pass Card** | `pass-view.html` | Responsive pass card layout | High-contrast ZXing Base64 QR display | Dynamic countdown timer & download badge |
| **Manager Approvals**| `manager/dashboard.html`| Full-width responsive table | Badge status (PENDING, APPROVED, REJECTED) | Action buttons with modal confirmation |
| **Guard Scanner** | `scanner/scan.html`| Camera viewport container (100% width)| Audio feedback beep & full-screen flash | WebRTC live video barcode scanning |
| **Owner Admin** | `owner/dashboard.html` | Metric cards & gate management grid | Real-time occupancy counter & analytics | System configuration & role allocation |

---

## 2. Accessibility & Cross-Device Compliance
- **Color Contrast Ratio:** Compliant with WCAG 2.1 AA standards (minimum 4.5:1 on text elements).
- **Mobile Viewport Optimization:** Touch targets configured with minimum 44px x 44px hit dimensions.
- **Form Usability:** HTML5 native constraints combined with Spring Bean Validation field alerts.
- **Camera Viewport:** Automatically selects back-facing environment camera (`facingMode: "environment"`) on mobile smartphones.
