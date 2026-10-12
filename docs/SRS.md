# Visitor Access Management System (VAMS)
## Software Requirements Specification
**Version:** 1.0 | **Date:** October 2026  
**Standard:** IEEE Std 830-1998 Recommended Practice for SRS  

---

## Table of Contents
1. **Introduction**
   - 1.1 Purpose
   - 1.2 Document Conventions
   - 1.3 Intended Audience and Reading Suggestions
   - 1.4 Product Scope
   - 1.5 Abbreviations
2. **Overall Description**
   - 2.1 Product Perspective
   - 2.2 Product Functions
   - 2.3 User Classes and Characteristics
   - 2.4 Operating Environment
   - 2.5 Design and Implementation Constraints
   - 2.6 Assumptions and Dependencies
3. **External Interface Requirements**
   - 3.1 User Interfaces
   - 3.2 Hardware Interfaces
   - 3.3 Software Interfaces
   - 3.4 Communication Interfaces
4. **System Features**
   - 4.1 User Registration (REQ_01 to REQ_06)
   - 4.2 Email Verification (REQ_07 to REQ_08)
   - 4.3 Login (REQ_09 to REQ_12)
   - 4.4 Access Request Approval (REQ_13 to REQ_18)
   - 4.5 Manager Account Creation (REQ_19 to REQ_20)
   - 4.6 QR Badge Generation and Display (REQ_21 to REQ_24)
   - 4.7 QR Code Scanning (REQ_25 to REQ_31)
   - 4.8 Entry/Exit Logging (REQ_32 to REQ_34)
   - 4.9 Real-Time Occupancy Monitoring (REQ_35 to REQ_38)
   - 4.10 Access Validity Management (REQ_39 to REQ_41)
   - 4.11 Password Reset (REQ_42 to REQ_44)
   - 4.12 Logout (REQ_45 to REQ_47)
5. **Data Requirements** (REQ_48 to REQ_50)
6. **Other Nonfunctional Requirements**
   - 6.1 Performance Requirements (REQ_51 to REQ_52)
   - 6.2 Security Requirements (REQ_53 to REQ_57)
   - 6.3 Software Quality Attributes
7. **Appendix: Glossary**
8. **References**

---

## 1. Introduction

### 1.1 Purpose
This document describes the Visitor Access Management System (VAMS) in detail: the purpose and features of the system, its interfaces, what it will do, the constraints under which it must operate, and how it reacts to external stimuli. It is intended to help developers, testers and end users understand the functional and nonfunctional requirements of VAMS.

### 1.2 Document Conventions
This SRS follows the IEEE software requirements specification practice. Every requirement has a unique identifier (REQ_01, REQ_02, and so on) and each feature has a priority level (High, Medium or Low). The word “shall” marks a mandatory requirement, and “should” marks a desirable one.

### 1.3 Intended Audience and Reading Suggestions
* **Project Guides & Evaluators:** Read the Overall Description and System Features to judge completeness and architectural rigor.
* **Developers:** Use Sections 3, 4, 5 and 6 to implement controllers, services, database schemas and security rules.
* **Testers:** Use Section 4 and Section 6 to write unit, integration and security test cases.
* **End Users (Owners, Managers, Employees, Guests):** Read the Overall Description to understand system capabilities.

### 1.4 Product Scope
VAMS is a web-based, QR-code-driven access control system that replaces paper visitor registers and manual gate-keeping. It manages the complete visitor lifecycle: registration, email verification, manager approval, digital QR badge issuance, gate scanning, entry/exit logging, and real-time occupancy monitoring.

The system is built with **Java, Spring Boot, Spring Security, JPA/Hibernate, Thymeleaf and MySQL**. It uses the **ZXing library** to generate QR codes and the **html5-qrcode library** to scan them in a browser, so no special scanning hardware is needed.

**Out of scope for this version:** biometric authentication, GPS tracking, integration with turnstiles or electronic locks, native iOS/Android apps, SMS/push notifications, multi-building deployment, video surveillance integration, and automated threat detection.

### 1.5 Abbreviations
* **VAMS:** Visitor Access Management System
* **RBAC:** Role-Based Access Control
* **QR:** Quick Response (code)
* **UUID:** Universally Unique Identifier
* **JPA:** Java Persistence API
* **ORM:** Object-Relational Mapping
* **MVC:** Model View Controller
* **CSRF:** Cross-Site Request Forgery
* **SRS:** Software Requirements Specification

---

## 2. Overall Description

### 2.1 Product Perspective
VAMS is a self-contained web application accessed via standard web browsers. The server communicates with a MySQL database, while Firebase Authentication handles email verification and password reset links.

```text
  ┌──────────────────┐               ┌──────────────────────────────────────────────┐               ┌──────────────────┐
  │ Employee / Guest │ <─── HTTP ──> │               VAMS Application               │ <─── JPA ───> │  MySQL Database  │
  │ Shows QR Badge   │               │   Spring Boot 3, Spring Security 6, Thymeleaf│               │     (vams_db)    │
  └──────────────────┘               │          ZXing QR Generator, html5-qrcode    │               └──────────────────┘
  ┌──────────────────┐               │                                              │               ┌──────────────────┐
  │ Owner / Manager  │ <─── HTTP ──> │                                              │ <─── REST ──> │  Firebase Auth   │
  │ Review & Monitor │               └──────────────────────────────────────────────┘               │Email Verification│
  └──────────────────┘                                                                              └──────────────────┘
```

### 2.2 Product Functions
1. Register user accounts (Manager, Employee, Guest).
2. Email verification via Firebase Authentication.
3. Secure login and session management with BCrypt password encryption.
4. Automatic creation of `PENDING` access requests upon registration.
5. Role-based review and approval/rejection hierarchy.
6. Direct Manager account provisioning by the Owner.
7. Dynamic Base64 250×250 QR badge generation.
8. WebRTC in-browser camera scanning.
9. Automatic `ENTRY` / `EXIT` direction toggling.
10. Immutable audit logging of all scan events.
11. Real-time building occupancy calculation.
12. Configurable access validity (`ONE_DAY`, `UNTIL_LOGOFF`, `ONGOING`).
13. Password recovery workflow.

### 2.3 User Classes and Characteristics
* **Owner (Super Administrator):** Complete system authority; creates Managers, approves any role request, reviews live occupancy.
* **Manager (Facility Manager):** Reviews Employee/Guest requests; operates gate scanner; must be approved by Owner.
* **Employee (Regular Staff):** Registers, receives approved QR badge for daily building transit.
* **Guest (Visitor / Contractor):** Registers with purpose of visit; receives time-limited QR access pass.
* **Scanner Operator:** Guard role operating WebRTC camera checkpoint.

### 2.4 Operating Environment
* **Server:** JDK 17, Spring Boot 3, MySQL 8.0, Apache Maven.
* **Client:** Chrome 90+, Firefox 88+, Edge 90+, Safari 14+. Camera $\ge 2.0	ext{ MP}$ for scanning stations.

### 2.5 Design and Implementation Constraints
* Written in Java using Spring Boot.
* Passwords stored strictly as BCrypt hashes.
* Scan logs are append-only: no update or delete operations exposed.
* QR tokens must be UUID version 4.
* Server-rendered Thymeleaf HTML5 with Bootstrap 5.

### 2.6 Assumptions and Dependencies
* Gate devices have network access to VAMS server.
* Users have accessible email accounts.
* Server system clock is accurate for timestamp and expiration verification.

---

## 3. External Interface Requirements

### 3.1 User Interfaces
Responsive web interface ($\ge 320	ext{px}$): Login, Registration, Verify, Forgot Password, Owner Dashboard, Manager Dashboard, Pending Requests, Guest/Employee Dashboard, Pending Approval, Scanner Station, Scan Result.

### 3.2 Hardware Interfaces
* Server: Dual-Core 2.0 GHz, 4 GB RAM, 20 GB Storage, 100 Mbps NIC.
* Scanner Station: Any smartphone, tablet, laptop with $\ge 2.0	ext{ MP}$ camera.

### 3.3 Software Interfaces
* MySQL Database via Spring Data JPA and Hibernate.
* ZXing Library 3.5.3 for QR code generation.
* html5-qrcode for browser video frame parsing.
* Firebase Auth SDK for email verification.

### 3.4 Communication Interfaces
HTTP/HTTPS protocol with CSRF token protection on all state-changing endpoints.

---

## 4. System Features & Requirements

### 4.1 User Registration
* **REQ_01:** The system shall allow a visitor to submit a registration form.
* **REQ_02:** The system shall reject a registration whose username already exists ("Username already exists!").
* **REQ_03:** The system shall reject a registration whose email already exists ("Email already registered!").
* **REQ_04:** The system shall default the role to GUEST if none is selected.
* **REQ_05:** The system shall store the password only as a BCrypt hash with automatic salt.
* **REQ_06:** The system shall automatically create an access request with status PENDING for every new registration.

### 4.2 Email Verification
* **REQ_07:** The system shall send a verification link to the user’s email through Firebase.
* **REQ_08:** The system shall redirect the user to the login page after successful verification.

### 4.3 Login
* **REQ_09:** The system shall authenticate users with username and password.
* **REQ_10:** The system shall route each user to the dashboard that matches their role.
* **REQ_11:** The system shall block users without an APPROVED request from using the dashboard and show the Pending Approval page.
* **REQ_12:** The system shall restrict URLs by role: `/owner/**` to the Owner only, and `/manager/**` and `/scanner/**` to Managers and the Owner.

### 4.4 Access Request Approval
* **REQ_13:** The system shall let the Owner approve or reject requests from all roles, including Managers.
* **REQ_14:** The system shall let a Manager approve or reject requests from Employees and Guests only, and shall hide Manager and Owner requests from Managers.
* **REQ_15:** When the Owner approves a request, the system shall set the access level to RESTRICTED and the validity to ONGOING.
* **REQ_16:** When a Manager approves a request, the system shall set the access level to PUBLIC and the validity to ONGOING.
* **REQ_17:** On approval, the system shall record the approval timestamp and generate a unique UUID v4 QR token.
* **REQ_18:** The system shall require a Manager to be approved by the Owner before the Manager can use the Manager Dashboard.

### 4.5 Manager Account Creation
* **REQ_19:** The system shall let the Owner create a Manager account by entering a username and password on the Owner Dashboard.
* **REQ_20:** The system shall store the new Manager’s password as a BCrypt hash and assign the MANAGER role.

### 4.6 QR Badge Generation and Display
* **REQ_21:** The system shall generate a QR code image of 250 x 250 pixels from the user’s token using the ZXing library.
* **REQ_22:** The system shall embed the QR image in the page as a Base64-encoded PNG.
* **REQ_23:** The system shall show the badge status, access level and validity type next to the QR code.
* **REQ_24:** The system shall ensure that every QR token is unique.

### 4.7 QR Code Scanning
* **REQ_25:** The system shall provide a scanner page that uses the rear camera and detects QR codes automatically.
* **REQ_26:** The system shall provide a manual text field for entering a token when the camera cannot be used.
* **REQ_27:** The system shall fail the scan with the reason “Invalid QR Token” if the token is not found.
* **REQ_28:** The system shall fail the scan with the reason “Request Status is: [status]” if the request is not APPROVED.
* **REQ_29:** The system shall fail the scan with the reason “Expired (One-Day Pass Ended)” if a ONE_DAY pass is more than 24 hours past its approval time.
* **REQ_30:** The system shall show a green PASS banner with the scan direction for a valid scan and a red FAIL banner with the reason for an invalid scan.
* **REQ_31:** The system shall record the gate location with each scan.

### 4.8 Entry/Exit Logging
* **REQ_32:** The system shall treat the first scan of a user as ENTRY and shall toggle between ENTRY and EXIT on every following valid scan.
* **REQ_33:** The system shall save, for every valid scan, the user, gate location, scan type and a timestamp with microsecond precision.
* **REQ_34:** The system shall not provide any update or delete operation on scan logs.

### 4.9 Real-Time Occupancy Monitoring
* **REQ_35:** The system shall calculate live occupancy from all scan logs: Occupancy = max(0, total ENTRY scans − total EXIT scans).
* **REQ_36:** The system shall display live occupancy on the Owner Dashboard and the Manager Dashboard.
* **REQ_37:** The system shall show the Manager the number of Employees, Managers and Guests, and the number of PUBLIC and RESTRICTED access grants.
* **REQ_38:** The Owner Dashboard shall list all users with their roles and all requests with their status, with Approve and Reject buttons for pending requests.

### 4.10 Access Validity Management
* **REQ_39:** The system shall support the validity types ONE_DAY, UNTIL_LOGOFF and ONGOING.
* **REQ_40:** The system shall enforce ONE_DAY expiry at scan time without manual action.
* **REQ_41:** The system shall support the access levels PUBLIC and RESTRICTED.

### 4.11 Password Reset
* **REQ_42:** The system shall let a user request a password reset by entering their registered email.
* **REQ_43:** The system shall verify the email through a Firebase link before allowing a new password to be set.
* **REQ_44:** The system shall store the new password as a BCrypt hash and redirect to the login page.

### 4.12 Logout
* **REQ_45:** The system shall let a logged-in user log out.
* **REQ_46:** On logout, the system shall invalidate the session and remove the session data.
* **REQ_47:** The user shall be able to log out from any screen.

---

## 5. Data Requirements
* **REQ_48:** The system shall enforce unique constraints on `username`, `email`, and `qr_token`.
* **REQ_49:** The system shall use foreign keys from `access_requests` and `scan_logs` referencing `users.id` with `ON DELETE CASCADE`.
* **REQ_50:** The system shall store timestamps with microsecond precision (`DATETIME(6)`).

---

## 6. Other Nonfunctional Requirements
* **REQ_51:** A QR scan shall be validated and the result shown in less than 2 seconds under normal load.
* **REQ_52:** Dashboard pages should load in less than 3 seconds.
* **REQ_53:** The system shall hash all passwords with BCrypt.
* **REQ_54:** The system shall protect all state-changing forms with CSRF tokens.
* **REQ_55:** The system shall deny access to protected URLs for users without the required role and return HTTP 403.
* **REQ_56:** The system shall destroy all session data after logout.
* **REQ_57:** QR tokens shall be random UUID v4 values that cannot be predicted.

---

## 7. Appendix: Glossary
* **Access Request:** Record created during registration awaiting administrative clearance.
* **Badge:** Base64 QR image rendered on dashboard acting as digital credential.
* **Gate:** Physical checkpoint equipped with browser camera scanning station.
* **Occupancy:** Estimated count of people inside the building ($\max(0, \sum 	ext{ENTRY} - \sum 	ext{EXIT})$).

---

## 8. References
1. IEEE Std 830-1998, *Recommended Practice for Software Requirements Specifications*.
2. Spring Boot, Spring Security and Spring Data JPA Reference Documentation.
3. ZXing Barcode Library v3.5.3.
4. html5-qrcode Library Documentation.
