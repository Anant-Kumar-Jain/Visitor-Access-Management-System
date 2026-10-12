# PROJECT IDEA AND ABSTRACT
## 3-Tier Visitor & Access Management System (VAMS)

---

## Project Idea
The **3-Tier Visitor & Access Management System (VAMS)** is a centralized digital platform for managing who can enter an organization’s premises, which areas they may access, and how long that permission remains valid. It replaces paper visitor registers and disconnected gate records with a single workflow that links user registration, manager approval, QR-based access, entry and exit logging, and live occupancy monitoring.

The system is organized around three operational tiers:
1. **Tier 1 (Owner / Super Admin):** Manages the overall system, provisions Managers, and monitors real-time building occupancy.
2. **Tier 2 (Manager / Facility Admin):** Reviews incoming access requests and assigns zone permissions (`PUBLIC` vs. `RESTRICTED`) and validity terms (`ONE_DAY`, `UNTIL_LOGOFF`, `ONGOING`).
3. **Tier 3 (Employees, Guests, Temporary Staff):** Employees use their accounts for daily entry; visitors submit access requests and receive digital QR credentials once vetted.

At entry/exit gates, a browser camera scanner reads the QR credential and validates it against the central database, recording timestamps and updating live occupancy counts.

---

## Problem Statement
Organizations that manage visitors manually often rely on paper registers, physical passes, phone calls, or separate gate records. These methods can make it difficult to verify approvals, apply different area restrictions, track temporary permissions, find historical entry and exit details, and determine who is currently inside the premises. In a multi-gate environment, separate or delayed records may also prevent staff from seeing a consistent view of access activity. VAMS addresses these problems by providing a centralized, role-based process for requesting, approving, issuing, validating, and recording access.

---

## Project Objectives
1. Provide a single digital process for registering employees, guests, and temporary staff and routing access requests for review.
2. Give the Owner system-wide control, including Manager administration and access to overall activity dashboards.
3. Allow Managers to approve or reject requests and assign Public or Restricted area access.
4. Support configurable access validity, including One Day Only, Until Logged Off, and Ongoing, according to the implemented rules.
5. Generate a unique QR credential after approval and validate it at authorized gate scanning points.
6. Record entry and exit events with person, gate, scan type, and timestamp details.
7. Present access activity and calculated occupancy information on Owner and Manager dashboards.

---

## System Overview

### Tier 1: Owner / Super Admin
The Owner is the highest-privilege user. This tier creates or assigns Manager accounts, manages or resets Manager credentials through authorized procedures, and reviews overall system activity. The Owner dashboard provides a system-wide view of access requests, users, scan activity, and the occupancy value calculated from recorded entry and exit events.

### Tier 2: Manager / Admin
Managers handle day-to-day access administration. They review pending requests, confirm the requested purpose and user details, and decide whether access should be granted. For approved requests, Managers assign an area category—Public or Restricted—and a validity option such as One Day Only, Until Logged Off, or Ongoing. Their permissions are limited to the actions granted by the system’s role policy.

### Tier 3: Employees, Guests, and Temporary Staff
Regular employees and staff use their assigned ID and password to access the system. Guests and temporary personnel, such as visitors, mechanics, contractors, or delivery personnel, submit a registration or access-request form. Their access remains pending until an authorized Manager reviews it. Approved users receive a QR credential for presentation at the gate.

---

## Main System Workflow
1. **Registration and Request Creation:** A staff member signs in with assigned credentials, while a guest or temporary visitor submits a registration form. The system stores user details and creates a pending access request.
2. **Manager Review and Decision:** A Manager views pending requests, reviews details, and approves or rejects the request, setting zone permissions and validity periods.
3. **QR Credential Issuance:** Upon approval, the system generates a unique QR code and associated UUID identifier, rendered as a Base64 image on the user's dashboard.
4. **Gate Verification:** A scanner reads the QR code and submits its token for server-side validation. Accepted scans are logged with gate location and timestamp; invalid or expired tokens are rejected.
5. **Monitoring and Occupancy:** Scan events are stored centrally and made available to dashboards, calculating real-time occupancy: $\max(0, \sum 	ext{ENTRY} - \sum 	ext{EXIT})$.

---

## Abstract
The 3-Tier Visitor & Access Management System (VAMS) is proposed as a centralized solution for controlling and monitoring access to organizational premises. The system separates responsibilities among an Owner (Super Admin), Managers, and end users such as employees, guests, and temporary staff. Regular personnel authenticate using assigned credentials, while visitors submit an access request for review. Managers evaluate pending requests and, when granting access, assign an area permission and a validity period. After approval, the system generates a unique QR credential for presentation at designated gates. The scanner validates the credential and records entry or exit activity with the relevant user, gate, and timestamp. Centralized records support Owner and Manager dashboards that display access activity and an occupancy figure derived from scan events. By combining role-based administration, configurable access permissions, QR-based verification, and timestamped records, VAMS aims to improve the organization and traceability of visitor access compared with manual register-based processes.

---

## Scope of the Project
Role-based accounts for Owners, Managers, employees, guests, and temporary staff; visitor registration and request review; approval or rejection; Public and Restricted area categorization; validity selection; QR credential generation and scanning; entry and exit timestamp recording; a central data store; and Owner and Manager dashboards with occupancy monitoring.

---

## Text-Based Architecture Reference
* **Owner / Super Admin** $ightarrow$ manages Managers and monitors system activity
* **Employees and staff** $ightarrow$ sign in with assigned ID and password
* **Guests and temporary staff** $ightarrow$ submit registration/access request
* **Registration and request data** $ightarrow$ Central MySQL Database
* **Manager** $ightarrow$ reviews pending request $ightarrow$ assigns Public/Restricted area and validity $ightarrow$ approves or rejects
* **Approved request** $ightarrow$ unique QR code and associated ID generated $ightarrow$ credential delivered to user
* **User presents QR** $ightarrow$ Entry/Exit gate scanner validates credential $ightarrow$ timestamped scan event stored centrally
* **Central scan records** $ightarrow$ occupancy calculation and activity metrics $ightarrow$ Owner and Manager dashboards

---

## Keywords
Visitor management, access control, role-based access, QR code, access request, gate scanning, entry and exit timestamp, occupancy monitoring, centralized database.
