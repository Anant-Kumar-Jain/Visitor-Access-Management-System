# Defect Severity Classification & SLA Guidelines

**QA Lead:** Deepanshu (`deepanshu0973@gmail.com`)  
**Standard:** IEEE 1044 Standard for Classification of Software Anomalies  

---

## 1. Severity Levels & Escalation Matrix

| Level | Severity Name | Description | Example in VAMS | SLA Resolution |
| :---: | :--- | :--- | :--- | :---: |
| **S1** | **Blocker / Critical** | Complete system outage, data loss, or security compromise. | Authentication bypass, SQL injection, dual entry passback leak. | $< 24$ Hours |
| **S2** | **Major** | Core functionality impaired without clear workaround. | Manager cannot approve requests; QR code fails to render on pass card. | $< 48$ Hours |
| **S3** | **Medium** | Functional defect with reasonable workaround available. | Filter sorting failure on visitor history; table pagination glitch. | $< 5$ Days |
| **S4** | **Minor / Trivial** | Cosmetic visual flaws, typos, or minor alignment defects. | Margin misalignment on mobile button; text typo in notice footer. | Next Sprint |
