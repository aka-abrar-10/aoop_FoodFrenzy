# 🍔 FoodFrenzy - Complete Project Guide (বাংলায় বিস্তারিত)

## 📌 প্রজেক্ট সম্পর্কে সংক্ষিপ্ত বিবরণ

**FoodFrenzy** হল একটি Food Delivery Web Application যেটা **Spring Boot** এর উপর তৈরি। এখানে Admin Panel এবং Customer Panel দুটোই আছে। Admin রা Product, User, Order সব ম্যানেজ করতে পারে, আর Customer রা Login করে Product Search করে Order দিতে পারে।

---

## 🛠️ ব্যবহৃত Technologies

| Technology | Version | কি কাজে লাগে |
|------------|---------|--------------|
| Spring Boot | 3.1.3 | Main Framework |
| Spring MVC | - | Web Layer (Controller) |
| Spring Data JPA | - | Database ORM |
| Thymeleaf | - | HTML Template Engine |
| MySQL | - | Database |
| Spring Security | - | Security (Currently disabled) |
| Maven | - | Build Tool |
| Java | 17 | Programming Language |

---

## 📁 প্রজেক্ট ফোল্ডার স্ট্রাকচার

```
aoop_FoodFrenzy/
├── pom.xml                          # Maven dependencies
├── db.sql                           # Sample database insert script
├── src/
│   └── main/
│       ├── java/com/example/demo/
│       │   ├── FoodFrenzyApplication.java   # Main entry point
│       │   ├── Exceptions.java              # Custom exceptions
│       │   │
│       │   ├── config/                      # Configuration
│       │   │   └── SecurityConfig.java      # Spring Security config
│       │   │
│       │   ├── controllers/                 # HTTP Request Handlers
│       │   │   ├── HomeController.java      # Public pages
│       │   │   ├── AdminController.java     # Admin operations
│       │   │   ├── ProductController.java   # Product CRUD
│       │   │   ├── UserController.java      # User CRUD
│       │   │   └── OrderController.java     # Order handling
│       │   │
│       │   ├── entities/                    # Database Models (JPA)
│       │   │   ├── Admin.java               # Admin entity
│       │   │   ├── User.java                # User entity
│       │   │   ├── Product.java             # Product entity
│       │   │   └── Orders.java              # Order entity
│       │   │
│       │   ├── repositories/                # Database Access (JPA)
│       │   │   ├── AdminRepository.java
│       │   │   ├── UserRepository.java
│       │   │   ├── ProductRepository.java
│       │   │   └── OrderRepository.java
│       │   │
│       │   ├── services/                    # Business Logic
│       │   │   ├── AdminServices.java
│       │   │   ├── UserServices.java
│       │   │   ├── ProductServices.java
│       │   │   └── OrderServices.java
│       │   │
│       │   ├── count/                       # Utility
│       │   │   └── Logic.java               # Total calculation
│       │   │
│       │   └── loginCredentials/            # Login DTOs
│       │       ├── AdminLogin.java
│       │       └── UserLogin.java
│       │
│       └── resources/
│           ├── application.properties       # Database config
│           ├── static/                      # CSS, JS, Images
│           └── templates/                   # Thymeleaf HTML pages
│               ├── Home.html
│               ├── Login.html
│               ├── AdminLogin.html
│               ├── CustomerLogin.html
│               ├── Admin_Page.html
│               ├── BuyProduct.html
│               ├── Products.html
│               └── ... (আরো pages)
```

---

## 🗄️ Database Schema

### 📊 Tables এবং তাদের Relations

```
┌─────────────────┐       ┌─────────────────┐
│     admin       │       │  product_table  │
├─────────────────┤       ├─────────────────┤
│ admin_id (PK)   │       │ pid (PK)        │
│ admin_name      │       │ pname           │
│ admin_email     │       │ pprice          │
│ admin_password  │       │ pdescription    │
│ admin_number    │       └─────────────────┘
└─────────────────┘
                          
┌─────────────────┐       ┌─────────────────┐
│      user       │       │     orders      │
├─────────────────┤       ├─────────────────┤
│ u_id (PK)       │◄──────│ user_u_id (FK)  │
│ uname           │       │ o_id (PK)       │
│ uemail          │       │ o_name          │
│ upassword       │       │ o_price         │
│ unumber         │       │ o_quantity      │
└─────────────────┘       │ order_date      │
                          │ total_ammout    │
                          └─────────────────┘
```

### 🔗 Entity Relationships

| Relationship | Type | Description |
|--------------|------|-------------|
| User ↔ Orders | One-to-Many | একজন User এর অনেক Order থাকতে পারে |
| Orders → User | Many-to-One | প্রতিটি Order একজন User এর সাথে linked |

---

## 🔌 API Endpoints (সব Routes)

### 📢 Public Routes (HomeController)

| Method | Endpoint | কি কাজ করে | Status |
|--------|----------|-----------|--------|
| GET | `/`, `/home` | Home page দেখায় | ✅ কাজ করছে |
| GET | `/products` | সব Products দেখায় | ✅ কাজ করছে |
| GET | `/location` | Location page | ✅ কাজ করছে |
| GET | `/about` | About page | ✅ কাজ করছে |
| GET | `/login` | Login page দেখায় | ✅ কাজ করছে |
| GET | `/AdminLogin.html` | Admin Login form | ✅ কাজ করছে |
| GET | `/CustomerLogin.html` | Customer Login form | ✅ কাজ করছে |

### 🔐 Authentication Routes (AdminController)

| Method | Endpoint | কি কাজ করে | Status |
|--------|----------|-----------|--------|
| POST | `/adminLogin` | Admin login validate করে | ✅ কাজ করছে |
| POST | `/userLogin` | Customer login validate করে | ✅ কাজ করছে |

### 👨‍💼 Admin Routes (AdminController)

| Method | Endpoint | কি কাজ করে | Status |
|--------|----------|-----------|--------|
| GET | `/admin/services` | Admin dashboard | ✅ কাজ করছে |
| GET | `/addAdmin` | Add Admin form | ✅ কাজ করছে |
| POST | `/addingAdmin` | নতুন Admin save | ✅ কাজ করছে |
| GET | `/updateAdmin/{id}` | Update Admin form | ✅ কাজ করছে |
| GET | `/updatingAdmin/{id}` | Admin update করে | ✅ কাজ করছে |
| GET | `/deleteAdmin/{id}` | Admin delete করে | ✅ কাজ করছে |

### 📦 Product Routes (ProductController + AdminController)

| Method | Endpoint | কি কাজ করে | Status |
|--------|----------|-----------|--------|
| GET | `/addProduct` | Add Product form | ✅ কাজ করছে |
| POST | `/addingProduct` | নতুন Product save | ✅ কাজ করছে |
| GET | `/updateProduct/{id}` | Update Product form | ✅ কাজ করছে |
| GET | `/updatingProduct/{id}` | Product update করে | ✅ কাজ করছে |
| GET | `/deleteProduct/{id}` | Product delete করে | ✅ কাজ করছে |
| POST | `/product/search` | Product search করে | ✅ কাজ করছে |

### 👤 User Routes (UserController + AdminController)

| Method | Endpoint | কি কাজ করে | Status |
|--------|----------|-----------|--------|
| GET | `/addUser` | Add User form | ✅ কাজ করছে |
| POST | `/addingUser` | নতুন User save | ✅ কাজ করছে |
| GET | `/updateUser/{id}` | Update User form | ✅ কাজ করছে |
| GET | `/updatingUser/{id}` | User update করে | ✅ কাজ করছে |
| GET | `/deleteUser/{id}` | User delete করে | ✅ কাজ করছে |

### 🛒 Order Routes (AdminController)

| Method | Endpoint | কি কাজ করে | Status |
|--------|----------|-----------|--------|
| POST | `/product/order` | নতুন Order place করে | ✅ কাজ করছে |
| GET | `/product/back` | BuyProduct page এ ফেরত | ✅ কাজ করছে |

---

## 🧩 Controllers বিস্তারিত

### 1️⃣ HomeController.java
**Location:** `controllers/HomeController.java`

```java
@Controller
public class HomeController {
    // Public pages handle করে
    // Products, About, Location, Login pages
}
```

**Methods:**
- `home()` → Home page return করে
- `products(Model)` → সব products fetch করে template এ পাঠায়
- `location()` → Location page
- `about()` → About page
- `login(Model)` → Login page with AdminLogin object
- `adminLoginPage(Model)` → Admin Login page
- `customerLoginPage()` → Customer Login page

---

### 2️⃣ AdminController.java (সবচেয়ে বড় Controller)
**Location:** `controllers/AdminController.java`

এটা Main controller যেটা Admin operations + Customer Order সব handle করে।

**Important Fields:**
```java
private String email;     // Currently logged in user এর email store করে
private User user;        // Currently logged in user object
```

**Key Methods:**

| Method | Endpoint | Logic |
|--------|----------|-------|
| `getAllData()` | POST `/adminLogin` | Admin email/password check করে, সঠিক হলে admin dashboard redirect |
| `userLogin()` | POST `/userLogin` | Customer login validate করে, সঠিক হলে BuyProduct page দেখায় |
| `seachHandler()` | POST `/product/search` | Name দিয়ে Product search করে |
| `returnBack()` | GET `/admin/services` | Admin Dashboard - সব data load করে (users, admins, products, orders) |
| `orderHandler()` | POST `/product/order` | Order place করে - total amount calculate করে, date set করে |

---

### 3️⃣ ProductController.java
**Location:** `controllers/ProductController.java`

```java
@Controller
public class ProductController {
    // Product CRUD operations
}
```

**Methods:**
- `addProduct()` → নতুন Product save করে DB তে
- `updateProduct()` → Existing Product update
- `delete()` → Product delete

---

### 4️⃣ UserController.java
**Location:** `controllers/UserController.java`

```java
@Controller
public class UserController {
    // User CRUD operations (Admin থেকে manage)
}
```

**Methods:**
- `addUser()` → নতুন User create
- `updateUser()` → User info update
- `deleteUser()` → User delete

---

### 5️⃣ OrderController.java
**Location:** `controllers/OrderController.java`

⚠️ **Empty Controller** - Order logic বর্তমানে `AdminController` এ আছে।

---

## 📋 Services বিস্তারিত (Business Logic)

### 1️⃣ AdminServices.java

| Method | কি করে |
|--------|--------|
| `getAll()` | সব Admin list return |
| `getAdmin(id)` | ID দিয়ে একটা Admin return |
| `update(admin, id)` | Admin info update |
| `delete(id)` | Admin delete |
| `addAdmin(admin)` | নতুন Admin create |
| `validateAdminCredentials(email, password)` | Login check - email দিয়ে Admin খুঁজে password match করে |

---

### 2️⃣ UserServices.java

| Method | কি করে |
|--------|--------|
| `getAllUser()` | সব User list return |
| `getUser(id)` | ID দিয়ে User return |
| `getUserByEmail(email)` | Email দিয়ে User খোঁজে |
| `updateUser(user, id)` | User update |
| `deleteUser(id)` | User delete |
| `addUser(user)` | নতুন User create |
| `validateLoginCredentials(email, password)` | Customer login check |

---

### 3️⃣ ProductServices.java

| Method | কি করে |
|--------|--------|
| `addProduct(product)` | নতুন Product save |
| `getAllProducts()` | সব Products return |
| `getProduct(id)` | ID দিয়ে Product খোঁজে |
| `updateproduct(product, id)` | Product update |
| `deleteProduct(id)` | Product delete |
| `getProductByName(name)` | Name দিয়ে Product search |

---

### 4️⃣ OrderServices.java

| Method | কি করে |
|--------|--------|
| `getOrders()` | সব Orders return |
| `saveOrder(order)` | নতুন Order save |
| `updateOrder(id, order)` | Order update |
| `deleteOrder(id)` | Order delete |
| `getOrdersForUser(user)` | একটা User এর সব Orders return |

---

## 🗃️ Repositories (Database Access)

Spring Data JPA ব্যবহার করে automatic query generate হয়।

| Repository | Entity | Custom Methods |
|------------|--------|----------------|
| `AdminRepository` | Admin | `findByAdminEmail(email)` |
| `UserRepository` | User | `findUserByUemail(email)` |
| `ProductRepository` | Product | `findByPname(name)` |
| `OrderRepository` | Orders | `findOrdersByUser(user)` |

---

## 🧮 Utility Classes

### Logic.java (count package)

```java
public static double countTotal(double price, int quantity) {
    return price * quantity;
}
```

Order এ total amount calculate করতে ব্যবহার হয়।

---

### Login DTOs (Data Transfer Objects)

**AdminLogin.java:**
```java
private String email;
private String password;
```

**UserLogin.java:**
```java
private String userEmail;
private String userPassword;
```

Form থেকে login data receive করতে ব্যবহার হয়।

---

## ⚙️ Configuration

### application.properties

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/FoodFrenzy?createDatabaseIfNotExist=true
spring.datasource.username=root
spring.datasource.password=
spring.jpa.hibernate.ddl-auto=update
```

- **Database:** MySQL (localhost:3306)
- **Database Name:** FoodFrenzy (automatically create হবে)
- **DDL Auto:** update (tables auto-create হবে)

---

### SecurityConfig.java

```java
@Configuration
@EnableWebSecurity
public class SecurityConfig {
    // সব routes open রাখা হয়েছে
    // CSRF disabled
    // Form login disabled
    // Basic auth disabled
}
```

⚠️ **Note:** Security বর্তমানে disabled আছে - সব URL publicly accessible।

---

## 🌐 Frontend Templates (Thymeleaf)

| Template | Purpose | Used By |
|----------|---------|---------|
| `Home.html` | Main landing page | `/`, `/home` |
| `Login.html` | Login selection page | `/login` |
| `AdminLogin.html` | Admin login form | `/AdminLogin.html` |
| `CustomerLogin.html` | Customer login form | `/CustomerLogin.html` |
| `Admin_Page.html` | Admin dashboard | `/admin/services` |
| `BuyProduct.html` | Customer product page + order | After customer login |
| `Products.html` | Public products display | `/products` |
| `Add_Admin.html` | Add new admin form | `/addAdmin` |
| `Add_Product.html` | Add new product form | `/addProduct` |
| `Add_User.html` | Add new user form | `/addUser` |
| `Update_*.html` | Update forms | Update operations |
| `Order_success.html` | Order confirmation | After placing order |
| `Locate_us.html` | Location page | `/location` |
| `About.html` | About page | `/about` |

---

## 🚀 Application চালানোর নিয়ম

### Prerequisites:
1. Java 17 installed
2. MySQL running (XAMPP বা standalone)
3. Maven installed

### Steps:

```bash
# 1. MySQL এ FoodFrenzy database create করতে হবে না (auto-create হবে)

# 2. Application run করুন
cd aoop_FoodFrenzy
mvnw spring-boot:run

# 3. Browser এ open করুন
http://localhost:8080

# 4. Sample data insert করুন (optional)
# db.sql file MySQL এ run করুন
```

### Default Login Credentials (db.sql থেকে):

**Admin:**
- Email: `admin@foodfrenzy.com`
- Password: `admin123`

**Customer:**
- Email: `john@example.com`
- Password: `password123`

---

## 🔄 Data Flow Diagram

```
┌──────────────────────────────────────────────────────────────────┐
│                         CLIENT (Browser)                          │
│                    HTML Forms + Thymeleaf Templates               │
└───────────────────────────────┬──────────────────────────────────┘
                                │ HTTP Request
                                ▼
┌──────────────────────────────────────────────────────────────────┐
│                        CONTROLLER LAYER                           │
│   HomeController │ AdminController │ ProductController │ etc.     │
│                    @GetMapping, @PostMapping                      │
└───────────────────────────────┬──────────────────────────────────┘
                                │ Method Call
                                ▼
┌──────────────────────────────────────────────────────────────────┐
│                         SERVICE LAYER                             │
│   AdminServices │ UserServices │ ProductServices │ OrderServices  │
│                  Business Logic + Validation                      │
└───────────────────────────────┬──────────────────────────────────┘
                                │ Method Call
                                ▼
┌──────────────────────────────────────────────────────────────────┐
│                       REPOSITORY LAYER                            │
│   JpaRepository implementations                                   │
│   Auto-generated CRUD + Custom queries                           │
└───────────────────────────────┬──────────────────────────────────┘
                                │ JDBC
                                ▼
┌──────────────────────────────────────────────────────────────────┐
│                         MySQL DATABASE                            │
│        admin │ user │ product_table │ orders                      │
└──────────────────────────────────────────────────────────────────┘
```

---

## ✅ API Testing Status

| Feature | Status | Notes |
|---------|--------|-------|
| Admin Login | ✅ Working | Email/Password validation |
| Customer Login | ✅ Working | Email/Password validation |
| View Products | ✅ Working | Public access |
| Add Product | ✅ Working | Admin only |
| Update Product | ✅ Working | Admin only |
| Delete Product | ✅ Working | Admin only |
| Search Product | ✅ Working | By name |
| Add User | ✅ Working | Admin only |
| Update User | ✅ Working | Admin only |
| Delete User | ✅ Working | Admin only |
| Add Admin | ✅ Working | Admin only |
| Update Admin | ✅ Working | Admin only |
| Delete Admin | ✅ Working | Admin only |
| Place Order | ✅ Working | Customer only |
| View Orders | ✅ Working | Admin Dashboard |

---

## ⚠️ Known Issues / Improvements করা যেতে পারে

1. **Password Encryption নেই** - Plain text password store হচ্ছে
2. **Session Management নেই** - User state controller instance variable এ আছে
3. **OrderController Empty** - Order logic AdminController এ মিশে আছে
4. **No Role-based Access** - Security disabled
5. **No Input Validation** - Form validation missing in some places
6. **No Error handling** - Exception handling incomplete

---

## 📞 Contact / Support

এই documentation তৈরি করা হয়েছে FoodFrenzy Spring Boot Project এর জন্য।

---

*Last Updated: January 25, 2026*
