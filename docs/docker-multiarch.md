# Multi-Architecture Docker Containerization Specification

**DevOps Lead:** Ansh Soni (`ansh10soni@gmail.com`)  

---

## 1. Multi-Arch Docker Build (`docker buildx`)
To ensure seamless deployment across Intel/AMD (`linux/amd64`) servers and ARM64 Apple Silicon / AWS Graviton (`linux/arm64`) instances:

```dockerfile
# Multi-Stage Dockerfile for VAMS
FROM eclipse-temurin:17-jdk-alpine AS builder
WORKDIR /workspace
COPY . .
RUN ./mvnw clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=builder /workspace/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]
```

Build command:
```bash
docker buildx build --platform linux/amd64,linux/arm64 -t vams-system:1.0.0 .
```
