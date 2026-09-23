# Database Schema & Architectural Defense Posters

**Database Architect:** Bhavesh Sharma (`bhavesh9705@gmail.com`)  
**RDBMS:** MySQL 8.0 LTS (InnoDB Storage Engine)  
**Schema Version:** 1.0.0-RELEASE  

---

## 1. Relational Entity Poster (Crow's Foot Notation)

```text
   +-------------------------+             +-------------------------+
   |          USERS          |             |     ACCESS_REQUESTS     |
   +-------------------------+             +-------------------------+
   | PK id         BIGINT    | 1         * | PK id         BIGINT    |
   |    email      VARCHAR   |-------------| FK user_id    BIGINT    |
   |    password   VARCHAR   |             |    visitor_name VARCHAR |
   |    full_name  VARCHAR   |             |    reason       TEXT    |
   |    role       VARCHAR   |             |    status       VARCHAR |
   |    created_at DATETIME  |             |    token        VARCHAR |
   +-------------------------+             |    valid_until  DATETIME|
                                           +-------------------------+
                                                        | 1
                                                        |
                                                        | *
   +-------------------------+             +-------------------------+
   |          GATES          |             |        SCAN_LOGS        |
   +-------------------------+             +-------------------------+
   | PK id         BIGINT    | 1         * | PK id         BIGINT    |
   |    gate_name  VARCHAR   |-------------| FK gate_id    BIGINT    |
   |    location   VARCHAR   |             | FK request_id BIGINT    |
   |    active     BOOLEAN   |             |    scan_type  VARCHAR   |
   +-------------------------+             |    scan_time  DATETIME  |
                                           |    guard_notes VARCHAR  |
                                           +-------------------------+
```

---

## 2. Database Normalization Proof (3NF)

1. **1NF (First Normal Form):**
   - All columns hold atomic, indivisible values (no arrays or comma-delimited lists stored).
   - Each table possesses an explicitly defined primary key (`id` with auto-increment).
2. **2NF (Second Normal Form):**
   - The schema is in 1NF and contains no partial functional dependencies (all non-key columns depend on the whole primary key).
3. **3NF (Third Normal Form):**
   - The schema is in 2NF and exhibits zero transitive dependencies ($X 
ightarrow Y 
ightarrow Z$).
   - For example, visitor profile data resides strictly in `users`, and access requests link via `user_id` foreign key rather than repeating personal attributes.
