# Final Entity-Relationship (ER) Diagram Specification

**Author:** Bhavesh Sharma (`bhavesh9705@gmail.com`)  

---

## 1. Relational Entities & Multiplicities
- `User (1) ── (N) AccessRequest`: One registered user may submit multiple access pass requests.
- `AccessRequest (1) ── (N) ScanLog`: One approved pass produces multiple transit scan records (ENTRY, EXIT).
- `Gate (1) ── (N) ScanLog`: One physical checkpoint logs thousands of visitor transit events.
- `AccessRequest (N) ── (M) Gate`: Many-to-many relationship mapped via `GatePermission` bridge entity.
