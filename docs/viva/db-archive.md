# Database Archival, Migration & DDL Schema Script

**Database Engineer:** Bhavesh Sharma (`bhavesh9705@gmail.com`)  
**Target Engine:** MySQL 8.0+ / InnoDB / `utf8mb4_unicode_ci`  

---

## 1. Complete DDL Schema Definition

```sql
-- VAMS Master Database Schema Creation
CREATE DATABASE IF NOT EXISTS vams_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE vams_db;

-- 1. Users Table
CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(120) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20),
    role ENUM('ROLE_OWNER', 'ROLE_MANAGER', 'ROLE_SECURITY', 'ROLE_GUEST') NOT NULL DEFAULT 'ROLE_GUEST',
    email_verified BOOLEAN NOT NULL DEFAULT FALSE,
    verification_token VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_user_email (email),
    INDEX idx_user_role (role)
) ENGINE=InnoDB;

-- 2. Gates Table
CREATE TABLE IF NOT EXISTS gates (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    gate_name VARCHAR(50) NOT NULL UNIQUE,
    location VARCHAR(100) NOT NULL,
    access_level ENUM('PUBLIC', 'RESTRICTED') NOT NULL DEFAULT 'PUBLIC',
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 3. Access Requests Table
CREATE TABLE IF NOT EXISTS access_requests (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    visitor_name VARCHAR(100) NOT NULL,
    visitor_organization VARCHAR(100),
    reason TEXT NOT NULL,
    status ENUM('PENDING', 'APPROVED', 'REJECTED', 'EXPIRED', 'COMPLETED') NOT NULL DEFAULT 'PENDING',
    token VARCHAR(64) UNIQUE,
    valid_from DATETIME NOT NULL,
    valid_until DATETIME NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_req_token (token),
    INDEX idx_req_status (status),
    INDEX idx_req_validity (valid_from, valid_until)
) ENGINE=InnoDB;

-- 4. Scan Logs Table
CREATE TABLE IF NOT EXISTS scan_logs (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    request_id BIGINT NOT NULL,
    gate_id BIGINT NOT NULL,
    scanned_by BIGINT NOT NULL,
    scan_type ENUM('ENTRY', 'EXIT') NOT NULL,
    scan_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    guard_notes VARCHAR(255),
    FOREIGN KEY (request_id) REFERENCES access_requests(id) ON DELETE CASCADE,
    FOREIGN KEY (gate_id) REFERENCES gates(id),
    FOREIGN KEY (scanned_by) REFERENCES users(id),
    INDEX idx_scan_composite (request_id, scan_time),
    INDEX idx_gate_occupancy (gate_id, scan_type, scan_time)
) ENGINE=InnoDB;
```
