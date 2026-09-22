# External Evaluator Guide & Quick Assessment Roadmap

**Project:** VAMS - Visitor Access Management System  
**Guide Author:** Ansh Soni (`ansh10soni@gmail.com`)  

---

## 1. Rapid Evaluator Assessment Steps
1. **Launch Application:** Run `./mvnw clean spring-boot:run` in terminal.
2. **Access Home Page:** Navigate to `http://localhost:8080`.
3. **Log in as Guest:** `visitor@vams.com` / `Visitor@123` $
ightarrow$ Submit a new Access Pass.
4. **Log in as Manager:** `manager@vams.com` / `Manager@123` $
ightarrow$ Approve the pending pass.
5. **View Digital Pass:** Switch back to visitor $
ightarrow$ view 300x300 Base64 ZXing QR pass.
6. **Log in as Guard:** `guard@vams.com` / `Guard@123` $
ightarrow$ Scan QR code via WebRTC camera or manual token $
ightarrow$ verify **ENTRY GRANTED**.
7. **Simulate Anti-Passback:** Scan identical pass immediately $
ightarrow$ verify **ANTI-PASSBACK VIOLATION**.
8. **Log in as Owner:** `owner@vams.com` / `Owner@123` $
ightarrow$ View live campus occupancy counter.
