# VAMS 12-Week Master Milestone Schedule

## Project Information
- **Project Title:** VAMS - Visitor Access Management System
- **Domain:** Advanced Java (Spring Boot, Thymeleaf, MySQL, ZXing)
- **Academic Term:** 2026-27

---

## Milestone Breakdown

### Phase 1: Problem Definition, Ideation & Synopsis (Weeks 1 - 2)
- [x] Topic approval and problem formulation with Project Guide
- [x] Literature review of modern physical security and visitor access platforms
- [x] Relational schema requirements and data entity mapping
- [x] Initial UI wireframes and responsive layout benchmarks
- [x] University synopsis compilation, review, and formal departmental sign-off

### Phase 2: Architecture, Modeling & Environment Setup (Week 3)
- [x] Maven Spring Boot 3 build scaffolding and wrapper configuration
- [x] UML Class Diagrams, Use-Case Diagrams, and ER Diagram normalized to 3NF
- [x] Deployment architecture specification (Tomcat, MySQL, ZXing)
- [x] Baseline testing harness setup with JUnit 5 and Mockito

### Phase 3: Core Domain Implementation (Weeks 4 - 8)
- [x] Core JPA entities: User, Gate, GatePermission, AccessRequest, ScanLog, SystemLog
- [x] Spring Security FilterChain, BCryptPasswordEncoder, and session hardening
- [x] ZXing QR engine integration for in-memory Base64 QR code streaming
- [x] HTML5 WebRTC camera barcode scanner interface and audio/visual feedback
- [x] Manager approval and rejection workflows with rejection reason tracking
- [x] Staff self-service portal and security guard terminal integration

### Phase 4: Administrator Control, Analytics & Integration (Weeks 9 - 10)
- [x] Owner control dashboard with live premise occupancy counters
- [x] Gate CRUD management and user credential administration
- [x] Historical audit logs with indexed descending timestamp pagination
- [x] Comprehensive Phase 4 automated integration test suite (18 scenarios)
- [x] Multi-container Docker Compose stack configuration with MySQL 8.0

### Phase 5: Hardening, UI Polish, Viva Prep & Release (Weeks 11 - 12)
- [x] Security vulnerability audit and session fixation verification
- [x] W3C HTML5 accessibility validation across all 19 Thymeleaf templates
- [x] Full regression test run across 34 automated test cases (100% pass rate)
- [x] Staging deployment smoke tests and video demonstration walkthrough
- [x] Comprehensive viva examination defense notes and evaluator package bundling
- [x] Final v1.0.0 production tag and project sign-off
