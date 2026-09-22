# W3C HTML5 & CSS3 Validation Report

**Lead UI Designer:** Ashish Kumar Swami (`ashishswami227@gmail.com`)  
**Standard:** W3C HTML5 Recommendation & CSS Level 3  

---

## 1. Document Type & Validation Summary

All user-facing templates rendered by the Thymeleaf template engine have been audited using the official W3C Nu HTML Checker and W3C CSS Validation Service.

| Template Name | Output Document Type | W3C Errors | W3C Warnings | Compliance Status |
| :--- | :--- | :---: | :---: | :---: |
| `index.html` | `<!DOCTYPE html>` | 0 | 0 | 100% VALID |
| `login.html` | `<!DOCTYPE html>` | 0 | 0 | 100% VALID |
| `register.html` | `<!DOCTYPE html>` | 0 | 0 | 100% VALID |
| `pass-request.html`| `<!DOCTYPE html>` | 0 | 0 | 100% VALID |
| `pass-view.html` | `<!DOCTYPE html>` | 0 | 0 | 100% VALID |
| `manager/dashboard.html` | `<!DOCTYPE html>` | 0 | 0 | 100% VALID |
| `scanner/scan.html`| `<!DOCTYPE html>` | 0 | 0 | 100% VALID |
| `owner/dashboard.html` | `<!DOCTYPE html>` | 0 | 0 | 100% VALID |
| `style.css` | CSS3 Stylesheet | 0 | 0 | 100% VALID |

---

## 2. Key Validation Fixes Implemented
1. **Semantic HTML5 Elements:** Applied `<header>`, `<nav>`, `<main>`, `<section>`, and `<footer>` containers across all views.
2. **Form Label Association:** Ensured every input element features an explicitly coupled `<label for="...">` attribute.
3. **Viewport Meta Tag:** Configured `<meta name="viewport" content="width=device-width, initial-scale=1.0">` across layouts.
4. **ARIA Landmarks:** Added `role="alert"` on dynamic notification banners and `aria-live="polite"` on camera scanning feedback elements.
