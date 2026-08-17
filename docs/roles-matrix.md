# User Roles Matrix
- OWNER: Full system control
- MANAGER: Visitor approval/rejection
- GUEST: Entry pass recipient
- STAFF: Facility access

- Hierarchy: ROLE_OWNER > ROLE_MANAGER > ROLE_STAFF > ROLE_GUEST.

- Added enabled boolean flag to block banned accounts.

- SECURITY role authorized for /scanner/** camera endpoints.
