# Relational Schema Draft
Mapping 1:N relations between Users and AccessRequests.

- Guard logic: User cannot have two ENTRY scans without an EXIT scan.

- ScanLog has @ManyToOne mapping to User.

- ScanLog has @ManyToOne mapping to Gate.

- AccessRequest maps @ManyToOne to visitor User and permitted Gate.
