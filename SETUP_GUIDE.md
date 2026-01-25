# 🚀 FoodFrenzy - Complete Setup Guide

## 📋 Step-by-Step Project চালানোর নিয়ম

---

## 🔧 Prerequisites (আগে থেকে যা লাগবে)

| Software | Download Link | Purpose |
|----------|---------------|---------|
| **XAMPP** | https://www.apachefriends.org/ | MySQL Database |
| **Java JDK 17** | https://adoptium.net/ | Java Runtime |
| **Maven** | https://maven.apache.org/ | Build Tool (optional - project এ আছে) |

---

## 📥 Step 1: XAMPP Start করুন

1. **XAMPP Control Panel** ওপেন করুন
2. **Apache** → Start (Optional, phpMyAdmin এর জন্য)
3. **MySQL** → Start ✅ (এটা Must!)

```
┌─────────────────────────────────────────┐
│        XAMPP Control Panel              │
├─────────────────────────────────────────┤
│ Module    │ PID(s) │ Port(s) │ Actions  │
├───────────┼────────┼─────────┼──────────┤
│ Apache    │        │         │ [Start]  │
│ MySQL     │ 1234   │ 3306    │ [Stop]   │ ← এটা Running থাকতে হবে
│ FileZilla │        │         │ [Start]  │
└─────────────────────────────────────────┘
```

---

## 🗄️ Step 2: Database সেটআপ করুন

### Option A: phpMyAdmin ব্যবহার করে (Recommended)

1. Browser এ যান: **http://localhost/phpmyadmin**

2. উপরে **"SQL"** tab এ ক্লিক করুন

3. `database_setup.sql` ফাইলের সব content copy করে paste করুন

4. **"Go"** button এ ক্লিক করুন

### Option B: Import করে

1. Browser এ যান: **http://localhost/phpmyadmin**

2. Left panel এ "New" ক্লিক করুন

3. Database name: `FoodFrenzy` লিখে Create করুন

4. **"Import"** tab এ যান

5. **"Choose File"** → `database_setup.sql` সিলেক্ট করুন

6. **"Go"** ক্লিক করুন

### Option C: MySQL Command Line

```bash
# Command Prompt ওপেন করুন
cd C:\xampp\mysql\bin
mysql -u root -p

# MySQL prompt এ:
source D:\Xampp\htdocs\FDap\AOOP Project\aoop_FoodFrenzy\database_setup.sql
```

---

## ⚙️ Step 3: Database Connection সেটিংস চেক করুন

ফাইল: `src/main/resources/application.properties`

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/FoodFrenzy?createDatabaseIfNotExist=true
spring.datasource.username=root
spring.datasource.password=
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.jpa.hibernate.ddl-auto=update
```

### 🔍 Settings Explanation:

| Property | Value | মানে কি |
|----------|-------|---------|
| `url` | `jdbc:mysql://localhost:3306/FoodFrenzy` | MySQL localhost port 3306, database name FoodFrenzy |
| `username` | `root` | XAMPP default username |
| `password` | (empty) | XAMPP এ default password নেই |
| `ddl-auto` | `update` | Tables auto-create/update হবে |

### ⚠️ যদি MySQL Password থাকে:

যদি আপনি MySQL এ password set করে থাকেন, তাহলে `application.properties` এ password দিন:

```properties
spring.datasource.password=your_password_here
```

---

## ▶️ Step 4: Project Run করুন

### Method 1: Command Prompt দিয়ে (Recommended)

```powershell
# Project folder এ যান
cd "D:\Xampp\htdocs\FDap\AOOP Project\aoop_FoodFrenzy"

# Maven Wrapper দিয়ে run করুন
.\mvnw.cmd spring-boot:run
```

### Method 2: IDE দিয়ে (Eclipse/IntelliJ)

1. Project import করুন as Maven Project
2. `FoodFrenzyApplication.java` ফাইল খুলুন
3. Right click → **Run As** → **Java Application**

### ✅ Success Message দেখবেন:

```
  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::                (v3.1.3)

...
Started FoodFrenzyApplication in X.XXX seconds
Tomcat started on port(s): 8080 (http)
```

---

## 🌐 Step 5: Browser এ ওপেন করুন

Application run হলে browser এ যান:

| Page | URL |
|------|-----|
| 🏠 **Home Page** | http://localhost:8080 |
| 🛒 **Products** | http://localhost:8080/products |
| 🔐 **Login** | http://localhost:8080/login |
| 👨‍💼 **Admin Login** | http://localhost:8080/AdminLogin.html |
| 👤 **Customer Login** | http://localhost:8080/CustomerLogin.html |
| ℹ️ **About** | http://localhost:8080/about |
| 📍 **Location** | http://localhost:8080/location |

---

## 🔑 Test Login Credentials

### 👨‍💼 Admin Logins:

| Email | Password | Role |
|-------|----------|------|
| `admin@foodfrenzy.com` | `admin123` | Super Admin |
| `manager@foodfrenzy.com` | `manager123` | Manager |
| `staff@foodfrenzy.com` | `staff123` | Staff |

### 👤 Customer Logins:

| Email | Password | Name |
|-------|----------|------|
| `rahim@gmail.com` | `rahim123` | Rahim Ahmed |
| `karim@gmail.com` | `karim123` | Karim Khan |
| `abrar@gmail.com` | `abrar123` | Abrar Hossain |
| `fatema@gmail.com` | `fatema123` | Fatema Begum |
| `test@test.com` | `test123` | Test User |

---

## 📊 Database এ কি কি Data আছে

### Products (36 টি Food Items):

| Category | Items |
|----------|-------|
| 🍔 Burgers | Beef Burger, Chicken Burger |
| 🍕 Pizza | Cheese Pizza, Pepperoni Pizza |
| 🍚 Biryani | Chicken, Mutton, Kacchi Biryani |
| 🍜 Noodles | Chow Mein, Fried Rice, Ramen |
| 🍝 Pasta | Alfredo, Arrabiata |
| 🍗 Chicken | Wings, Buffalo Wings, Steak |
| 🥪 Sandwiches | Chicken, Club Sandwich |
| 🥗 Salads | Caesar, Greek Salad |
| 🍰 Desserts | Chocolate Cake, Cheesecake, Ice Cream |
| 🥤 Drinks | Lassi, Coffee, Lime, Coke |

### Sample Orders:
Database এ 8 টি sample order আছে বিভিন্ন customer দের।

---

## ❌ সমস্যা হলে কি করবেন?

### Problem 1: "Port 8080 already in use"

**Solution:** অন্য কোনো application 8080 port ব্যবহার করছে।

```powershell
# কোন process ব্যবহার করছে দেখুন
netstat -ano | findstr :8080

# অথবা application.properties এ port change করুন
server.port=8081
```

---

### Problem 2: "Cannot connect to MySQL"

**চেক করুন:**
1. XAMPP এ MySQL চালু আছে?
2. Port 3306 ব্যবহার হচ্ছে?

```powershell
# MySQL চালু আছে কিনা চেক করুন
netstat -ano | findstr :3306
```

---

### Problem 3: "Access denied for user 'root'"

**Solution:** Password সমস্যা

```properties
# application.properties এ password দিন
spring.datasource.password=your_mysql_password
```

---

### Problem 4: "Table doesn't exist"

**Solution:** Database SQL run হয়নি

1. phpMyAdmin এ যান
2. `database_setup.sql` আবার run করুন

---

### Problem 5: "JAVA_HOME not set"

**Solution:**

```powershell
# PowerShell এ temporarily set করুন
$env:JAVA_HOME = "C:\Program Files\Java\jdk-17"

# অথবা System Properties এ permanently add করুন
```

---

## 🛑 Application বন্ধ করতে

Command Prompt এ: **Ctrl + C** চাপুন

---

## 🔄 Quick Test Workflow

1. ✅ XAMPP MySQL Start
2. ✅ `database_setup.sql` run করুন phpMyAdmin এ
3. ✅ `.\mvnw.cmd spring-boot:run` command দিন
4. ✅ http://localhost:8080 এ যান
5. ✅ Admin Login করুন: `admin@foodfrenzy.com` / `admin123`
6. ✅ Admin Dashboard দেখুন - Users, Products, Orders দেখা যাবে
7. ✅ Customer Login করুন: `rahim@gmail.com` / `rahim123`
8. ✅ Product search করুন (যেমন: "Burger")
9. ✅ Order place করুন

---

## 📁 Important Files Location

| File | Path | কি কাজে লাগে |
|------|------|-------------|
| Database SQL | `database_setup.sql` | Database + Dummy data |
| Project Guide | `PROJECT_GUIDE.md` | Full documentation |
| DB Config | `src/main/resources/application.properties` | Database connection |
| Main Entry | `src/main/java/.../FoodFrenzyApplication.java` | Application start point |

---

*Happy Coding! 🎉*
