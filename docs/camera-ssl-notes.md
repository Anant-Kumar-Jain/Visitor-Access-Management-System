# WebRTC Camera Security & SSL / HTTPS Requirements

**DevOps Lead:** Ansh Soni (`ansh10soni@gmail.com`)  

---

## 1. Browser Security Policy for Camera Hardware Access
Modern web browsers (Chrome, Safari, Edge, Firefox) enforce strict security policies regarding hardware devices (cameras and microphones):
- **Requirement:** `navigator.mediaDevices.getUserMedia` is restricted strictly to **Secure Contexts**.
- **Permitted Contexts:**
  1. `https://` secure domains with valid TLS certificates.
  2. `http://localhost` and `http://127.0.0.1` (development exception granted by browser vendors).
- **Mobile Guard Terminal Access:** When testing guard scanners from mobile phones over local Wi-Fi (e.g. `http://192.168.1.50:8080`), browsers will block camera access unless HTTPS is configured via self-signed keystore or tunneling (ngrok).
