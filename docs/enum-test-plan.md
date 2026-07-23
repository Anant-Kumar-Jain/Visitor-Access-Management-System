# System Enums Verification & State Transition Test Plan

**QA Lead:** Deepanshu (`deepanshu0973@gmail.com`)  

---

## 1. Enum Inventory & Valid Values
- `Role`: `ROLE_OWNER`, `ROLE_MANAGER`, `ROLE_SECURITY`, `ROLE_GUEST`
- `RequestStatus`: `PENDING`, `APPROVED`, `REJECTED`, `EXPIRED`, `COMPLETED`
- `ScanType`: `ENTRY`, `EXIT`
- `AccessLevel`: `PUBLIC`, `RESTRICTED`
- `ValidityType`: `SINGLE_DAY`, `MULTI_DAY`

---

## 2. Permitted State Transitions for RequestStatus

```text
[ NEW APPLICATION ] ──► PENDING
                           │
             ┌─────────────┴─────────────┐
             ▼                           ▼
         APPROVED                    REJECTED (Terminal)
             │
             ├──► EXPIRED (If unused after validUntil)
             │
             ▼
         COMPLETED (Upon successful EXIT scan at end of visit)
```
