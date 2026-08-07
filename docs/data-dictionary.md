# VAMS Relational Database Data Dictionary

## Table 1: `users`
Stores system accounts across all four access roles.

| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `id` | BIGINT | PRIMARY KEY, AUTO_INCREMENT | Unique user identifier |
| `email` | VARCHAR(255) | NOT NULL, UNIQUE, INDEX | Login email address |
| `password` | VARCHAR(255) | NOT NULL | BCrypt 12-round salted hash |
| `full_name` | VARCHAR(150) | NOT NULL | Full name of visitor or staff |
| `role` | VARCHAR(30) | NOT NULL | Enum: OWNER, MANAGER, STAFF, GUEST |
| `access_level` | VARCHAR(30) | NOT NULL | Enum: GENERAL, RESTRICTED, VIP, SECURITY |
| `email_verified`| BOOLEAN | NOT NULL, DEFAULT FALSE | Account activation status |
| `created_at` | DATETIME | NOT NULL | Account creation timestamp |

---

## Table 2: `gates`
Stores physical facility checkpoints.

| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `id` | BIGINT | PRIMARY KEY, AUTO_INCREMENT | Unique gate identifier |
| `name` | VARCHAR(100) | NOT NULL | Checkpoint name (e.g. Main Lobby Gate) |
| `location` | VARCHAR(255) | NOT NULL | Building or floor location |
| `access_level` | VARCHAR(30) | NOT NULL | Minimum clearance required for entry |
| `active` | BOOLEAN | NOT NULL, DEFAULT TRUE | Gate operational status toggle |

---

## Table 3: `access_requests`
Stores visitor pass applications and status transitions.

| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `id` | BIGINT | PRIMARY KEY, AUTO_INCREMENT | Unique pass request identifier |
| `visitor_id` | BIGINT | FOREIGN KEY -> users(id) | Applicant user reference |
| `gate_id` | BIGINT | FOREIGN KEY -> gates(id) | Requested gate entry |
| `status` | VARCHAR(30) | NOT NULL | Enum: PENDING, APPROVED, REJECTED, EXPIRED |
| `validity_type`| VARCHAR(30) | NOT NULL | Enum: ONE_TIME, DAILY, WEEKLY, MONTHLY |
| `qr_token` | VARCHAR(255) | NULLABLE | Secure token embedded in QR code |
| `valid_from` | DATETIME | NULLABLE | Pass start validity timestamp |
| `valid_until` | DATETIME | NULLABLE | Pass expiration timestamp |
| `notes` | VARCHAR(500) | NULLABLE | Purpose of visit or rejection reason |

---

## Table 4: `scan_logs`
High-volume audit trail of every physical barcode scan attempt.

| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `id` | BIGINT | PRIMARY KEY, AUTO_INCREMENT | Unique audit log entry ID |
| `user_id` | BIGINT | FOREIGN KEY -> users(id) | User who presented the pass |
| `gate_id` | BIGINT | FOREIGN KEY -> gates(id) | Gate where scanner was located |
| `scan_type` | VARCHAR(20) | NOT NULL | Enum: ENTRY, EXIT |
| `scan_time` | DATETIME | NOT NULL, INDEX | Exact scan timestamp |
| `status` | VARCHAR(50) | NOT NULL | ACCESS_GRANTED or specific denial reason |

- Tables: users, gates, gate_permissions, access_requests, scan_logs.

- Added UserRepository derived methods for email lookups.

- Added UserRepository findByRole for manager lists.

- Added derived methods for pending visitor pass queries.
