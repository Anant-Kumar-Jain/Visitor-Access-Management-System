# Thymeleaf Template Structure & Layout Inheritance Specification

**Author:** Ashish Kumar Swami (`ashishswami227@gmail.com`)  

---

## 1. Template Layout Hierarchy
```text
templates/
  ├── layout/main.html (Master HTML5 layout wrapper)
  ├── fragments/ (Reusable header, footer, alert fragments)
  ├── index.html (Public home view)
  ├── login.html (Authentication view)
  ├── register.html (Account creation view)
  ├── pass-request.html (Visitor pass application form)
  ├── pass-view.html (Digital QR pass display card)
  ├── manager/dashboard.html (Manager queue & approvals)
  ├── scanner/scan.html (Guard WebRTC camera scanner)
  └── owner/dashboard.html (Administrative occupancy & gates)
```

- Navbar: Logo, Role Badge, Notifications, User Dropdown, Logout.

- Added client-side download QR button using html5 download attribute.
