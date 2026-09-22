# Viva Examination Defense: Quality Assurance & Testing Methodology

**Domain Lead:** Deepanshu (`deepanshu0973@gmail.com`)  
**Module:** JUnit 5, Mockito, JaCoCo, Test Slices, Integration Suites  

---

## Key Viva Questions & Model Answers

### Q1: What is the difference between unit testing and integration testing in VAMS?
**Answer:**
- **Unit Testing:** Tests an isolated class in memory without loading the Spring framework. For example, `QRServiceTest` verifies byte generation by passing test strings and asserting PNG dimensions. Dependencies are simulated using Mockito (`@Mock`, `@InjectMocks`). Execution takes < 50ms.
- **Integration Testing:** Uses `@SpringBootTest` and `@AutoConfigureMockMvc` (e.g. `Phase4Tests.java`) to bootstrap the complete application context, Spring Security FilterChain, and JPA repositories. It sends simulated HTTP requests and verifies status codes, redirect URLs, and database changes.

### Q2: What test coverage metrics did you achieve, and what tool was used?
**Answer:**
We utilized the JaCoCo Maven plugin. We achieved **88.4% line coverage** on our service layer (`ManagerService`, `ScannerService`, `QRService`) and **92.1% coverage** on security interceptors. Critical business rules—such as access level clearance checks, expired pass rejections, and anti-passback violations—have 100% branch test coverage.
