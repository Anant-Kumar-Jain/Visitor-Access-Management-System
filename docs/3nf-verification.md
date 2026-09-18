# Third Normal Form (3NF) Relational Verification Proof

**Database Lead:** Bhavesh Sharma (`bhavesh9705@gmail.com`)  

---

## 1. Normalization Proof Summary
- **1NF:** Every column contains atomic scalar values. No composite or repeating groups exist.
- **2NF:** Every non-prime attribute is fully functionally dependent on the primary key ($K 
ightarrow A$).
- **3NF:** No non-prime attribute is transitively dependent on the primary key ($K 
ightarrow X 
ightarrow Y$).
- **Integrity Constraints:** All relationships enforce foreign key constraints with `ON DELETE CASCADE` or `RESTRICT` rules to preserve referential consistency.
