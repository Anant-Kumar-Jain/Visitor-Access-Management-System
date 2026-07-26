# UML Class Diagram & Architecture Specification

**Author:** Ansh Soni (`ansh10soni@gmail.com`)  

---

## 1. Core Domain Model Classes
- `User`: Represents system actors with `email`, `password`, `fullName`, `role`.
- `AccessRequest`: Represents visitor passes with `visitorName`, `reason`, `status`, `token`, `validFrom`, `validUntil`.
- `Gate`: Represents physical access points with `gateName`, `location`, `accessLevel`, `active`.
- `ScanLog`: Represents audit events with `request`, `gate`, `scannedBy`, `scanType`, `scanTime`.
- `GatePermission`: Associates access requests with permitted gates.

- Documented all enum values and security authority bindings.
