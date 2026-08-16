# Relational Schema Draft
Mapping 1:N relations between Users and AccessRequests.

- Guard logic: User cannot have two ENTRY scans without an EXIT scan.

- ScanLog has @ManyToOne mapping to User.

- ScanLog has @ManyToOne mapping to Gate.

- AccessRequest maps @ManyToOne to visitor User and permitted Gate.

- ValidityType calculates validUntil: 1 hour, 1 day, 1 week, 1 month.

- Added revokePass method setting status to REVOKED.
