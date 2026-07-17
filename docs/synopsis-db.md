# Project Synopsis: Data Modeling & Relational Schema Justification

**Project Title:** VAMS - Visitor Access Management System  
**Academic Year:** 2026-27  
**Department:** Computer Science & Engineering  
**Project Guide:** Dr. S. K. Verma  
**Team Members:** Ansh Soni, Anant Kumar Jain, Ashish Kumar Swami, Bhavesh Sharma, Deepanshu  

---

## 1. Abstract
The Visitor Access Management System (VAMS) replaces inefficient and vulnerable paper visitor registers with a secure, digital, contactless access solution. Leveraging Spring Boot, Thymeleaf, MySQL, and ZXing QR cryptography, VAMS empowers organizations to issue time-bound, cryptographically signed digital passes verifiable at guard checkpoints via standard mobile cameras using WebRTC.

---

## 2. Technical Objectives
1. Eliminate identity spoofing through HMAC-SHA256 signed QR access tokens.
2. Implement strict role segregation across Facility Owners, Managers, Security Guards, and Visitors.
3. Enforce physical access security policies including real-time anti-passback rule validation.
4. Deliver high-speed scanning performance with sub-200ms verification latency.

- Isolation: READ_COMMITTED to prevent dirty reads during scan verification.
