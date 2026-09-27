# Viva Defense Mock Rehearsal & Question Bank

**Evaluators Prepared For:** University External Board of Examiners  
**Team Attendance:** All 5 Team Members  
**Rehearsal Date:** September 26, 2026  

---

## 1. Individual Defense Questions & Prepared Responses

### Ansh Soni (DevOps & Project Lead)
- **Q:** *Why did you choose Spring Boot 3 over traditional Jakarta EE / Servlet containers?*  
  **A:** Spring Boot provides opinionated embedded Tomcat configuration, automated dependency management via starter POMs, rapid scaffolding with zero XML configuration, and production-grade health metrics out of the box.

### Anant Kumar Jain (Backend Security & Auth)
- **Q:** *How does your application prevent SQL Injection?*  
  **A:** All database queries utilize Spring Data JPA / Hibernate parameterized queries. No dynamic string concatenation is used in query creation, ensuring all parameters are safely escaped by JDBC PreparedStatement wrappers.

### Ashish Kumar Swami (Frontend & UI Design)
- **Q:** *How does the camera scanning work without requiring a native mobile app install?*  
  **A:** We use the modern HTML5 WebRTC `navigator.mediaDevices.getUserMedia()` API running in the browser. It streams camera video to an HTML `<canvas>`, and `html5-qrcode` analyzes frames in real-time to decode barcodes on the client without uploading video streams to the server.

### Bhavesh Sharma (Database & Core Logic)
- **Q:** *Explain the Anti-Passback algorithm.*  
  **A:** Anti-passback prevents a pass from being shared or used for multiple entries. When a scan occurs, the system inspects the visitor's most recent `ScanLog`. If the last scan was `ENTRY`, another `ENTRY` is immediately rejected until an intervening `EXIT` is logged.

### Deepanshu (QA & Automated Testing)
- **Q:** *What is the difference between Unit Testing and Integration Testing in your suite?*  
  **A:** Unit tests isolate individual service methods using `@Mock` dependencies (e.g. mocking repositories). Integration tests (via `@SpringBootTest`) bootstrap the full Spring ApplicationContext to verify end-to-end interactions between controllers, filter chains, services, and the database.
