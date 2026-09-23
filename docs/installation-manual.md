# VAMS Installation, Configuration & Deployment Manual

**DevOps Lead:** Ansh Soni (`ansh10soni@gmail.com`)  

---

## 1. Prerequisites
- **JDK:** OpenJDK 17 LTS or higher
- **Maven:** Apache Maven 3.8+ (or bundled `./mvnw`)
- **Database:** MySQL Server 8.0+
- **Browser:** Any modern browser supporting WebRTC (Chrome, Edge, Safari, Firefox)

---

## 2. Step-by-Step Installation

### Step 1: Database Setup
```sql
CREATE DATABASE vams_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'vams_user'@'localhost' IDENTIFIED BY 'Vams@Pass2026';
GRANT ALL PRIVILEGES ON vams_db.* TO 'vams_user'@'localhost';
FLUSH PRIVILEGES;
```

### Step 2: Configure Application Properties
Edit `src/main/resources/application.properties`:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/vams_db?useSSL=false&serverTimezone=UTC
spring.datasource.username=vams_user
spring.datasource.password=Vams@Pass2026
spring.jpa.hibernate.ddl-auto=update
```

### Step 3: Build & Launch
```bash
./mvnw clean spring-boot:run
```
Access the application at `http://localhost:8080`.
