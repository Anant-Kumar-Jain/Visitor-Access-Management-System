# Anti-Passback Validation & Concurrent Scan Verification

**Module:** Physical Security Access Control  
**Rule:** An access pass cannot be used for two consecutive ENTRY scans or two consecutive EXIT scans.

---

## 1. Test Sequence Verification

```text
Time t0: [Visitor Applies] -> Approved -> Token Issued
Time t1: Scan ENTRY at Gate 1  ==> SUCCESS (Status: INSIDE)
Time t2: Scan ENTRY at Gate 2  ==> REJECTED (Anti-Passback: Already Inside)
Time t3: Scan EXIT at Gate 1   ==> SUCCESS (Status: OUTSIDE)
Time t4: Scan EXIT at Gate 2   ==> REJECTED (Anti-Passback: Already Outside)
Time t5: Scan ENTRY at Gate 1  ==> SUCCESS (Status: INSIDE)
```

**Conclusion:** The anti-passback rule guarantees that visitor passes cannot be handed back through gates to grant entry to unauthorized individuals.
