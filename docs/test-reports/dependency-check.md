# OWASP Dependency-Check & Security Vulnerability Report

**Tool:** OWASP Dependency-Check Maven Plugin 9.0.9  
**Target:** Spring Boot 3.2.x, Spring Security, Thymeleaf, ZXing, MySQL Connector  
**Vulnerability Threshold:** CVSS Score $\ge 7.0$ (High / Critical)  

---

## 1. Scanned Components

| Artifact ID | Version | Known CVEs | CVSS Severity | Remediation |
| :--- | :--- | :---: | :---: | :--- |
| `spring-boot-starter-web` | 3.2.3 | 0 | None | Up to date |
| `spring-boot-starter-security` | 3.2.3 | 0 | None | Up to date |
| `spring-boot-starter-data-jpa` | 3.2.3 | 0 | None | Up to date |
| `thymeleaf-spring6` | 3.1.2.RELEASE | 0 | None | Up to date |
| `zxing-core` | 3.5.3 | 0 | None | Up to date |
| `zxing-javase` | 3.5.3 | 0 | None | Up to date |
| `mysql-connector-j` | 8.3.0 | 0 | None | Up to date |

**Result:** Zero high or critical vulnerabilities identified. Build approved.
