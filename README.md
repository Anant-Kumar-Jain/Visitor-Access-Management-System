# VAMS - Visitor Access Management System

[![Java CI with Maven](https://github.com/Ansh10soni/VAMS/actions/workflows/maven.yml/badge.svg)](https://github.com/Ansh10soni/VAMS/actions/workflows/maven.yml)
[![Version](https://img.shields.io/badge/version-1.0.0--RELEASE-blue.svg)](https://github.com/Ansh10soni/VAMS)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

VAMS (Visitor Access Management System) is an enterprise-grade, contactless visitor access control application built with Java 17, Spring Boot 3, Thymeleaf, MySQL 8, and ZXing QR cryptography.

---

## Key Features
- **Role-Based Security:** Four distinct roles (`ROLE_OWNER`, `ROLE_MANAGER`, `ROLE_SECURITY`, `ROLE_GUEST`) with BCrypt 12-round password hashing.
- **Dynamic QR Access Passes:** Cryptographically signed HMAC-SHA256 digital visitor badges generated via ZXing.
- **Hardware-Free WebRTC Scanning:** Live camera barcode reading directly inside modern web browsers using HTML5 WebRTC.
- **Anti-Passback Enforcement:** Guaranteed prevention of pass sharing or duplicate check-ins through atomic database transaction validation.
- **Live Occupancy Monitoring:** Real-time campus building occupancy calculation and emergency gate toggle controls.

---

## Technology Stack
- **Backend:** Java 17 LTS, Spring Boot 3.2.x, Spring Data JPA, Spring Security 6.x
- **Frontend:** Thymeleaf 3, Bootstrap 5.3, HTML5 WebRTC, Vanilla JavaScript
- **Database:** MySQL 8.0 LTS (InnoDB, Normalized to 3NF)
- **Testing:** JUnit 5, Mockito, JaCoCo (87.6% Coverage)
- **CI/CD:** GitHub Actions Maven Workflow
