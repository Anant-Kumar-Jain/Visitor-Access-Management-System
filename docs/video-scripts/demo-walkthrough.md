# VAMS Video Demonstration Walkthrough Script

**Video Duration:** ~5 Minutes  
**Resolution:** 1080p 60fps  
**Presenters:** VAMS Engineering Team  

---

## Scene 1: Introduction & Problem Statement (0:00 - 0:45)
- **Speaker:** Ansh Soni (Project Lead)
- **Visual:** Title slide and system architecture diagram.
- **Narrative:** "Welcome to our presentation of VAMS, the Visitor Access Management System. Traditional paper visitor logs are slow, insecure, and vulnerable to pass manipulation. VAMS delivers a full-stack, contactless QR-based access control solution with role-based security, instant gate validation, and real-time occupancy monitoring."

## Scene 2: Visitor Registration & Email Verification (0:45 - 1:45)
- **Speaker:** Anant Kumar Jain (Security Lead)
- **Visual:** Browser showing `/register` and `/verify`.
- **Narrative:** "Here, a new visitor registers their credentials. Notice our real-time password validation. Before accessing the portal, our Spring Security EmailVerificationInterceptor ensures unverified accounts cannot apply for passes until confirmed."

## Scene 3: Manager Approval Workflow (1:45 - 2:45)
- **Speaker:** Bhavesh Sharma (Database Lead)
- **Visual:** Manager dashboard showing pending access requests.
- **Narrative:** "Logging in as the facility manager, we view all incoming access requests. With one click, the manager approves the pass. The system automatically computes expiration times and generates a cryptographically signed QR code."

## Scene 4: Security Scanner & Anti-Passback Defense (2:45 - 4:00)
- **Speaker:** Ashish Kumar Swami (Frontend Lead)
- **Visual:** Mobile camera scanner view verifying live QR code.
- **Narrative:** "Here is our HTML5 WebRTC camera scanner. Scanning the visitor's pass instantly verifies the signature and grants access with a green audio chime. Scanning the same QR again triggers our Anti-Passback violation, preventing pass sharing."

## Scene 5: Owner Analytics & Wrap-Up (4:00 - 5:00)
- **Speaker:** Deepanshu (QA Lead)
- **Visual:** Owner dashboard live occupancy gauge and 100% test run.
- **Narrative:** "Finally, the facility owner tracks real-time premise occupancy. Our automated test suite achieved 100% pass across 34 integration scenarios. Thank you!"
