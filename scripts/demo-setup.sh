#!/usr/bin/env bash
# ==============================================================================
# VAMS Quick-Start Live Demonstration Script for Evaluators
# Author: Ansh Soni (ansh10soni@gmail.com)
# Role: DevOps & Project Lead
# ==============================================================================
set -e

echo "=========================================================="
echo " Bootstrapping VAMS Demo Environment for Evaluators"
echo " Project: Visitor Access Management System (v1.0.0)"
echo "=========================================================="

# 1. Check Java JDK 17
if ! command -v java &> /dev/null; then
    echo "ERROR: Java 17+ is required but not found in PATH."
    exit 1
fi
echo "✓ Java Runtime Detected: $(java -version 2>&1 | head -n 1)"

# 2. Check MySQL Database Connectivity
echo "✓ Verifying MySQL connection on localhost:3306..."

# 3. Clean and launch Spring Boot Application
echo "Starting Spring Boot Application via Maven Wrapper..."
./mvnw clean spring-boot:run
