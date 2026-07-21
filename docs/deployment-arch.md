# System Deployment Architecture & Topology

**Architect:** Ansh Soni (`ansh10soni@gmail.com`)  

---

## 1. Multi-Tier Production Topology

```text
[ Client Tier ]
  ├── Visitor Smartphone (Safari / Chrome)
  └── Guard Checkpoint Tablet (WebRTC Camera Scanner)
         │
         │  HTTPS / TLS (Port 443)
         ▼
[ Application Tier ]
  └── Spring Boot 3 Embedded Apache Tomcat (Port 8080)
        ├── Spring Security 6.x (FilterChain & BCrypt)
        ├── Thymeleaf Template Engine (Server-Side HTML Rendering)
        └── ZXing Barcode Engine (Dynamic QR Stream)
         │
         │  JDBC Connection Pool (HikariCP)
         ▼
[ Persistence Tier ]
  └── MySQL 8.0 LTS Database (Port 3306)
        ├── InnoDB Engine (ACID Transactions & Foreign Keys)
        └── B-Tree Indexes on composite query keys
```
