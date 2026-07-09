# VAMS Team Git Workflow & Branching Guidelines

**Lead Author:** Ansh Soni (`ansh10soni@gmail.com`)  
**Version Control Policy:** Git Feature Branch & Pull Request Workflow  

---

## 1. Branch Strategy & Architecture
We follow a structured Git branching strategy tailored for agile multi-developer academic projects:

- **`main`**: Production-ready, fully tested codebase. Direct pushes are restricted to release tags.
- **`dev` / `feature/*`**: Active sprint development branches.
  - `feature/auth-bcrypt`: Backend user authentication & security filters (Anant)
  - `feature/ui-dashboard`: Thymeleaf views & responsive UI components (Ashish)
  - `feature/db-jpa`: JPA entities, repository layer & SQL migrations (Bhavesh)
  - `feature/qa-phase4`: JUnit 5 test suites & Mockito integration tests (Deepanshu)
  - `feature/devops-ci`: Maven configuration, GitHub Actions, Docker & scripts (Ansh)

---

## 2. Commit Message Standards
Every commit must adhere to conventional commit conventions:
```text
<type>(<scope>): <short imperative summary>

[optional body explaining rationale]
```
**Permitted Types:** `feat` (new feature), `fix` (bug resolution), `docs` (documentation), `test` (test case additions), `refactor` (code restructuring).
