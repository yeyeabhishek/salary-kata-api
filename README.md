# Salary Management API (Incubyte Kata)

## 🚀 Overview

This project is a RESTful API built using Ruby on Rails to manage employees and their salaries. It supports employee CRUD operations, salary calculations based on country-specific rules, and salary metrics.

This solution follows **Test-Driven Development (TDD)** and aims to be production-ready with clean architecture and maintainable code.

---

## 🛠 Tech Stack

* Ruby on Rails (API mode)
* SQLite
* RSpec (Testing)
* FactoryBot (optional)

---

## 📦 Setup Instructions

```bash
git clone https://github.com/yeyeabhishek/salary-kata-api.git

cd salary-kata-api

bundle install
rails db:create
rails db:migrate

bundle exec rspec
rails server
```

---

## 📡 API Endpoints

### 👤 Employee CRUD

| Method | Endpoint       | Description        |
| ------ | -------------- | ------------------ |
| POST   | /employees     | Create employee    |
| GET    | /employees     | List all employees |
| GET    | /employees/:id | Get employee       |
| PATCH  | /employees/:id | Update employee    |
| DELETE | /employees/:id | Delete employee    |

---

### 💰 Salary Calculation

| Method | Endpoint              |
| ------ | --------------------- |
| GET    | /employees/:id/salary |

#### Rules:

* India → 10% deduction
* United States → 12% deduction
* Others → No deduction

---

### 📊 Salary Metrics

| Endpoint                      | Description          |
| ----------------------------- | -------------------- |
| /metrics/country/:country     | Min, Max, Avg salary |
| /metrics/job_title/:job_title | Avg salary           |

---

## 🧪 Testing Strategy (TDD)

This project strictly follows TDD:

1. Write failing test (RED)
2. Implement minimal code (GREEN)
3. Refactor

Covered:

* Employee CRUD
* Salary calculation
* Metrics API
* Edge cases (invalid ID, empty results)

---

## 🧠 Design Decisions

### Service Object Pattern

Salary logic is extracted into:

```ruby
SalaryCalculator
```

This keeps controllers thin and improves testability.

---

### Error Handling

Global error handling using:

```ruby
rescue_from ActiveRecord::RecordNotFound
```

---

## ⚠️ Edge Cases Handled

* Employee not found (404)
* Invalid salary input
* Empty dataset for metrics
* URL encoding issues in job title

---



## 👨‍💻 Author

Abhishek Anand
