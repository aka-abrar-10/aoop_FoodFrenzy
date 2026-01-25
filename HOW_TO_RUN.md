# 🚀 How to Run FoodFrenzy

This guide will help you run the FoodFrenzy project on your computer after cloning from GitHub.

## ⚡ Quick Start (5 Minutes)

### 1️⃣ Prerequisites Check

Make sure you have these installed:

- ✅ **Java 17** - Run `java -version` in terminal
- ✅ **MySQL** - XAMPP or standalone MySQL
- ✅ **Git** - Run `git --version` in terminal

### 2️⃣ Clone the Project

```bash
git clone https://github.com/your-username/aoop_FoodFrenzy.git
cd aoop_FoodFrenzy
```

### 3️⃣ Setup Database

**Using XAMPP (Easiest):**

1. Start XAMPP
2. Start MySQL service
3. Open http://localhost/phpmyadmin
4. Click "SQL" tab
5. Open `database_setup.sql` file from the project
6. Copy all content and paste in SQL tab
7. Click "Go"

**Using MySQL CLI:**

```bash
mysql -u root -p
CREATE DATABASE FoodFrenzy;
USE FoodFrenzy;
source /full/path/to/database_setup.sql;
exit;
```

### 4️⃣ Configure Database Password (if needed)

Open `src/main/resources/application.properties`

If your MySQL has a password, change this line:

```properties
spring.datasource.password=your_password_here
```

If no password (default XAMPP), leave it empty:

```properties
spring.datasource.password=
```

### 5️⃣ Run the Application

**On macOS/Linux:**

```bash
./mvnw spring-boot:run
```

**On Windows:**

```bash
mvnw.cmd spring-boot:run
```

**Or in your IDE:**

- Import as Maven project
- Run the main class

### 6️⃣ Open in Browser

```
http://localhost:8080
```

🎉 **Done! The application should now be running!**

---

## 🔧 Common Issues & Solutions

### ❌ Error: "Port 8080 already in use"

**Solution:**

**macOS/Linux:**

```bash
lsof -ti:8080 | xargs kill -9
```

**Windows:**

```bash
netstat -ano | findstr :8080
# Note the PID and then:
taskkill /PID <PID_NUMBER> /F
```

### ❌ Error: "Access denied for user 'root'@'localhost'"

**Solution:** Update your MySQL password in `application.properties`:

```properties
spring.datasource.password=your_actual_mysql_password
```

### ❌ Error: "Unknown database 'FoodFrenzy'"

**Solution:** You haven't created the database yet. Go back to Step 3️⃣

### ❌ Error: "Failed to download dependencies"

**Solution:**

```bash
./mvnw clean install -U
```

### ❌ MySQL is not running

**Solution:**

- If using XAMPP: Start MySQL from XAMPP Control Panel
- If standalone MySQL: Start MySQL service from Services (Windows) or System Preferences (Mac)

---

## 📱 Application URLs

| Page               | URL                                 |
| ------------------ | ----------------------------------- |
| **Home Page**      | http://localhost:8080               |
| **Customer Login** | http://localhost:8080/customerlogin |
| **Admin Login**    | http://localhost:8080/adminlogin    |
| **Products**       | http://localhost:8080/products      |
| **Register**       | http://localhost:8080/register      |

---

## 💡 First Time User?

### For Customers:

1. Go to http://localhost:8080/register
2. Create a new account
3. Login and start ordering!

### For Admin:

1. Check the database for admin credentials
2. Go to http://localhost:8080/adminlogin
3. Login with admin credentials

---

## 📞 Still Having Issues?

1. Make sure MySQL is running
2. Check your Java version: `java -version` (should be 17+)
3. Check the console/terminal for error messages
4. Verify database connection in `application.properties`
5. Try restarting the application

---

**Need more details?** Check the full [README.md](README.md) or [SETUP_GUIDE.md](SETUP_GUIDE.md)
