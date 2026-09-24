# Viva Examination Defense: Frontend & User Interface Architecture

**Domain Lead:** Ashish Kumar Swami (`ashishswami227@gmail.com`)  
**Module:** Thymeleaf 3, Bootstrap 5, Responsive Design, WebRTC Camera  

---

## Key Viva Questions & Model Answers

### Q1: Why did you choose Thymeleaf over client-side frameworks like React or Angular?
**Answer:**
Thymeleaf provides natural templating that integrates natively with Spring Boot's model layer:
1. **Natural HTML Templates:** Thymeleaf templates can be viewed directly in a browser without a build server during frontend wireframing.
2. **Server-Side Security:** Sensitive role data and permissions are evaluated on the server before HTML rendering, ensuring unauthorized elements are never transmitted to the browser client.
3. **Zero NodeJS Build Complexity:** Simplifies deployment by packaging all static assets within the standalone executable JAR.

### Q2: How does the camera barcode scanner work in the browser without external mobile apps?
**Answer:**
The scanner uses the HTML5 `navigator.mediaDevices.getUserMedia({ video: { facingMode: "environment" } })` WebRTC API. The video stream feeds into an HTML5 `<canvas>` element in real-time. JavaScript decodes the video frame buffer using client-side ZXing and sends an asynchronous `POST` request with the token payload to `/api/scanner/validate`.

### Q3: How did you ensure responsiveness across diverse mobile devices?
**Answer:**
We utilized a mobile-first responsive strategy built on Bootstrap 5's 12-column grid and custom media queries in `style.css`:
- **Fluid Layouts:** Card containers flex to 100% width on viewports `< 576px` and max `450px` on desktop viewports.
- **Touch Targets:** Buttons on mobile scanner views are sized at a minimum of `48px` with `-webkit-tap-highlight-color: transparent` for reliable tactile feedback.
- **Print Media Queries:** Specialized `@media print` rules strip backgrounds and headers to print clean physical paper passes.

- Q: How does scanner work? A: HTML5 navigator.mediaDevices.getUserMedia() streams to video canvas.

- Q: How is responsive layout handled? A: Mobile-first grid with Bootstrap breakpoints.
