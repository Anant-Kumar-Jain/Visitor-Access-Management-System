# Database Requirements & Storage Capacity Projections

**Author:** Bhavesh Sharma (`bhavesh9705@gmail.com`)  

---

## 1. Capacity Model (1,000 Visitors / Day)
- User Profile: ~512 bytes per record.
- Access Pass Record: ~1 KB per record (including token and timestamps).
- Checkpoint Scan Log: ~256 bytes per entry/exit event.
- **Estimated Storage Growth:** ~1.5 MB / day $pprox$ 550 MB / year.
- **Engine Recommendation:** MySQL InnoDB with row format `DYNAMIC` and utf8mb4 encoding.
