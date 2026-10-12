# UML DESIGN DOCUMENT
## QR-BASED VISITOR ACCESS MANAGEMENT SYSTEM (VAMS)

---

## 1. Use Case Diagram

```mermaid
flowchart LR
    Guest["Guest / Employee"]
    Manager["Facility Manager"]
    Owner["System Owner"]
    Guard["Scanner Operator"]

    subgraph VAMS["Visitor Access Management System (VAMS)"]
        UC1((Register / Login))
        UC2((Submit Access Request))
        UC3((View QR Badge))
        UC4((Review Requests))
        UC5((Approve / Reject Request))
        UC6((Manage Users / Roles))
        UC7((Scan QR Code))
        UC8((Validate Access))
        UC9((Record Entry / Exit))
        UC10((View Occupancy))
    end

    Guest --> UC1
    Guest --> UC2
    Guest --> UC3

    Manager --> UC4
    Manager --> UC5
    Manager --> UC10

    Owner --> UC5
    Owner --> UC6
    Owner --> UC10

    Guard --> UC7
    UC7 -.->|includes| UC8
    UC8 -.->|includes| UC9
```

**Actor Definitions:**
* **Guest / Employee:** Submits registration, accesses dashboard to view issued QR badge, presents badge at gates.
* **Manager:** Reviews pending requests for Employees/Guests, approves or rejects access, views live occupancy.
* **Owner:** Super administrator; provisions Manager accounts, approves all role requests, manages global system parameters.
* **Scanner Operator:** Operates gate checkpoint camera; scans QR codes to validate entry/exit.

---

## 2. Sequence Diagram — QR Scan Verification

```mermaid
sequenceDiagram
    autonumber
    actor Guard as Scanner Operator
    participant UI as Scanner UI (html5-qrcode)
    participant Ctrl as ScannerController
    participant Svc as ScannerService
    participant Repo as AccessRequestRepository
    participant LogRepo as ScanLogRepository
    participant DB as MySQL Database
    participant ResultUI as Scan Result UI

    Guard->>UI: Points camera at Visitor QR Code
    UI->>Ctrl: POST /scanner/verify (qrToken, gateLocation)
    Ctrl->>Svc: processScan(qrToken, gateLocation)
    Svc->>Repo: findByQrToken(qrToken)
    Repo->>DB: SELECT * FROM access_requests WHERE qr_token = ?
    DB-->>Repo: Return AccessRequest record
    Repo-->>Svc: Optional<AccessRequest>

    alt Token not found
        Svc-->>Ctrl: FAIL ("Invalid QR Token")
    else Request Status != APPROVED
        Svc-->>Ctrl: FAIL ("Request Status is: [status]")
    else ValidityType == ONE_DAY and Expired
        Svc-->>Ctrl: FAIL ("Expired (One-Day Pass Ended)")
    else Valid Approved Pass
        Svc->>LogRepo: findByUser_Id(userId)
        LogRepo->>DB: SELECT * FROM scan_logs WHERE user_id = ?
        DB-->>LogRepo: ScanLog history
        LogRepo-->>Svc: List<ScanLog>
        
        Note over Svc: State Machine: If empty or last == EXIT -> ENTRY; Else -> EXIT
        
        Svc->>LogRepo: save(new ScanLog)
        LogRepo->>DB: INSERT INTO scan_logs ...
        DB-->>LogRepo: Persisted ScanLog
        Svc-->>Ctrl: PASS (scanType: ENTRY / EXIT)
    end

    Ctrl->>ResultUI: Render scan-result.html (Banner PASS / FAIL)
    ResultUI-->>Guard: Visual feedback (Green / Red banner)
```

---

## 3. Class Diagram — Core Domain Model

```mermaid
classDiagram
    class User {
        -Long id
        -String username
        -String name
        -String email
        -String password
        -Role role
        +register()
        +login()
    }

    class AccessRequest {
        -Long requestId
        -User user
        -RequestStatus status
        -AccessLevel accessLevel
        -ValidityType validityType
        -String qrToken
        -LocalDateTime createdAt
        -LocalDateTime approvedAt
        +submit()
        +approve()
        +reject()
    }

    class ScanLog {
        -Long logId
        -User user
        -String gateLocation
        -ScanType scanType
        -LocalDateTime timestamp
        +append()
    }

    class Role {
        <<enumeration>>
        OWNER
        MANAGER
        EMPLOYEE
        GUEST
    }

    class RequestStatus {
        <<enumeration>>
        PENDING
        APPROVED
        REJECTED
    }

    class AccessLevel {
        <<enumeration>>
        PUBLIC
        RESTRICTED
    }

    class ValidityType {
        <<enumeration>>
        ONE_DAY
        UNTIL_LOGOFF
        ONGOING
    }

    class ScanType {
        <<enumeration>>
        ENTRY
        EXIT
    }

    User "1" --> "1" AccessRequest : has
    User "1" --> "0..*" ScanLog : generates
    AccessRequest ..> RequestStatus
    AccessRequest ..> AccessLevel
    AccessRequest ..> ValidityType
    ScanLog ..> ScanType
    User ..> Role
```

---

## 4. Activity Diagram — Registration, Approval & QR Access

```mermaid
flowchart TD
    Start([Start]) --> Reg[Register / Login + Email Verification]
    Reg --> Submit[Submit Access Request]
    Submit --> Review[Owner / Manager Reviews Request]
    Review --> Decision{Approved?}
    
    Decision -- No --> Reject[Mark Request REJECTED]
    Reject --> EndReject([Request Denied])

    Decision -- Yes --> Grant[Assign Access Level + Validity]
    Grant --> GenToken[Generate Unique UUID QR Token]
    GenToken --> RenderBadge[Render 250x250 Base64 QR on Dashboard]
    RenderBadge --> GateScan[Scan QR at Gate Checkpoint]
    GateScan --> Validate{Validate Token & State}

    Validate -- Invalid / Expired --> Deny[Deny Gate Access]
    Deny --> EndDeny([Access Denied])

    Validate -- Valid --> LogState[Toggle ENTRY / EXIT State]
    LogState --> AppendLog[Append Immutable ScanLog in MySQL]
    AppendLog --> Occupancy[Refresh Live Occupancy Headcount]
    Occupancy --> AccessGranted([ACCESS GRANTED])
```

---

## 5. Component Diagram — Application Architecture

```mermaid
flowchart TD
    subgraph Client["Client Tier (Browser)"]
        Browser[Thymeleaf HTML5 + Bootstrap 5]
        Scanner[html5-qrcode Camera Engine]
    end

    subgraph Security["Security Tier"]
        SecFilter[Spring Security 6 SecurityFilterChain]
        BCrypt[BCryptPasswordEncoder]
    end

    subgraph App["Application Tier (Spring Boot 3)"]
        Ctrl[MVC Controllers: Auth, Dashboard, Scanner]
        Svc[Services: ManagerService, QRService, ScannerService]
        ZXing[Google ZXing 3.5.3 Barcode Library]
    end

    subgraph External["External Services"]
        Firebase[Firebase Auth SDK Email Verification]
    end

    subgraph Persistence["Persistence Tier"]
        JPA[Spring Data JPA + Hibernate ORM]
        DB[(MySQL vams_db: users, access_requests, scan_logs)]
    end

    Browser -->|HTTP / HTTPS| SecFilter
    Scanner -->|POST /scanner/verify| SecFilter
    SecFilter --> BCrypt
    SecFilter --> Ctrl
    Browser -.->|Email link verification| Firebase
    Ctrl --> Svc
    Svc --> ZXing
    Svc --> JPA
    JPA --> DB
```
