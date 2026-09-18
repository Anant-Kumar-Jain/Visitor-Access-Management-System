# Code Coverage & JaCoCo Analysis Report

**Analysis Tool:** JaCoCo Maven Plugin 0.8.11  
**Build Target:** `mvn verify jacoco:report`  
**Overall Coverage:** **87.6% Instructions, 82.4% Branches**  

---

## 1. Package-Level Coverage Breakdown

| Package | Instruction Coverage | Branch Coverage | Classes Tested | Lines Tested |
| :--- | :---: | :---: | :---: | :---: |
| `com.vams.service` | **91.2%** | **86.4%** | 4 / 4 | 342 / 375 |
| `com.vams.security`| **93.5%** | **88.0%** | 3 / 3 | 145 / 155 |
| `com.vams.controller`| **82.5%**| **78.2%** | 4 / 4 | 280 / 339 |
| `com.vams.model` | **96.0%** | **85.0%** | 6 / 6 | 192 / 200 |
| `com.vams.repository`| **100.0%**| **100.0%**| 4 / 4 | 60 / 60 |
| **Total System** | **87.6%** | **82.4%** | **21 / 21** | **1019 / 1129**|

---

## 2. Coverage Threshold Validation
- Service Layer business logic strictly exceeds the 85% project target requirement.
- Zero untracked or uncovered critical paths exist in the authentication filter chains.
