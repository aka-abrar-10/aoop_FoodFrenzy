# FoodFrenzy Documentation

## Overview
FoodFrenzy is a food ordering management system built with Spring Boot 3.1.3 and Thymeleaf templates.

---

## Architecture

### Technology Stack
| Component | Technology |
|-----------|------------|
| Backend | Spring Boot 3.1.3, Java 17 |
| Frontend | Thymeleaf, HTML, CSS, JavaScript |
| Database | MySQL |
| Security | Spring Security (permit all) |
| ORM | Spring Data JPA (Hibernate) |

### Package Structure
```
com.example.demo/
├── config/         # Security configuration
├── controllers/    # MVC Controllers
├── entities/       # JPA Entities
├── repositories/   # Spring Data JPA Repositories
├── services/       # Business logic layer
├── count/          # Utility classes
└── loginCredentials/  # DTO classes for login forms
```

---

## Database Entities

### Admin
| Field | Type | Description |
|-------|------|-------------|
| adminId | int | Primary key (auto-generated) |
| adminName | String | Admin name |
| adminEmail | String | Admin email (unique) |
| adminPassword | String | Admin password |
| adminNumber | String | Phone number |

### User
| Field | Type | Description |
|-------|------|-------------|
| u_id | int | Primary key (auto-generated) |
| uname | String | User name |
| uemail | String | User email |
| upassword | String | User password |
| unumber | Long | Phone number |
| orders | List\<Orders\> | User's orders (OneToMany) |

### Product
| Field | Type | Description |
|-------|------|-------------|
| pid | int | Primary key (auto-generated) |
| pname | String | Product name |
| pprice | double | Product price |
| pdescription | String | Product description |

### Orders
| Field | Type | Description |
|-------|------|-------------|
| oId | int | Primary key (auto-generated) |
| oName | String | Order name |
| oPrice | double | Order price |
| oQuantity | int | Quantity |
| orderDate | Date | Order date |
| totalAmmout | double | Total amount |
| user | User | Reference to user (ManyToOne) |

---

## API Endpoints

### Public Pages
| Method | URL | Description |
|--------|-----|-------------|
| GET | `/`, `/home` | Home page |
| GET | `/products` | Products listing |
| GET | `/about` | About page |
| GET | `/location` | Location page |
| GET | `/login` | Login page |

### Admin Operations
| Method | URL | Description |
|--------|-----|-------------|
| POST | `/adminLogin` | Admin login |
| GET | `/admin/services` | Admin dashboard |
| GET | `/addAdmin` | Add admin form |
| POST | `/addingAdmin` | Create admin |
| GET | `/updateAdmin/{id}` | Update admin form |
| GET | `/updatingAdmin/{id}` | Update admin |
| GET | `/deleteAdmin/{id}` | Delete admin |

### User Operations
| Method | URL | Description |
|--------|-----|-------------|
| POST | `/userLogin` | User login |
| POST | `/addingUser` | Create user |
| GET | `/updatingUser/{id}` | Update user |
| GET | `/deleteUser/{id}` | Delete user |

### Product Operations
| Method | URL | Description |
|--------|-----|-------------|
| POST | `/addingProduct` | Create product |
| GET | `/updatingProduct/{id}` | Update product |
| GET | `/deleteProduct/{id}` | Delete product |
| POST | `/product/search` | Search product |

### Order Operations
| Method | URL | Description |
|--------|-----|-------------|
| POST | `/product/order` | Place order |
| GET | `/product/back` | Return to products |

---

## Setup Guide

### Prerequisites
- Java 17+
- MySQL 8.0+
- Maven 3.6+

### Database Configuration
```properties
# application.properties
spring.datasource.url=jdbc:mysql://localhost:3306/FoodFrenzy?createDatabaseIfNotExist=true
spring.datasource.username=root
spring.datasource.password=root
spring.jpa.hibernate.ddl-auto=update
```

### Running the Application
```bash
cd "d:\Xampp\htdocs\FDap\AOOP Project\aoop_FoodFrenzy"
.\mvnw.cmd spring-boot:run
```

Access at: `http://localhost:8080`

---

## Service Layer

All services use `@Service` and `@Transactional` annotations:

- **AdminServices** - Admin CRUD and authentication
- **UserServices** - User CRUD and login validation
- **ProductServices** - Product CRUD and search
- **OrderServices** - Order management

---

## Repository Layer

All repositories extend `JpaRepository` with `@Repository` annotation:

- **AdminRepository** - `findByAdminEmail(String email)`
- **UserRepository** - `findUserByUemail(String email)`
- **ProductRepository** - `findByPname(String name)`
- **OrderRepository** - `findOrdersByUser(User user)`

---

## Security Configuration

The application uses Spring Security with all requests permitted:

```java
@Bean
public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
    http
        .authorizeHttpRequests(auth -> auth.anyRequest().permitAll())
        .csrf(csrf -> csrf.disable())
        .formLogin(form -> form.disable())
        .httpBasic(basic -> basic.disable());
    return http.build();
}
```

> **Note**: CSRF is disabled for form compatibility. Custom login is handled via controllers.
