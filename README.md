# 🍔 FoodFrenzy

FoodFrenzy is a comprehensive food ordering and management system designed for managing customers, inventory, and orders. It offers secure authentication, role-based access control, and database integration using MySQL. Built with Spring Boot and Thymeleaf, the application provides a seamless experience for both customers and admin users.

![Screenshot 2024-10-02 123332](https://github.com/user-attachments/assets/1382d32f-3cbb-40c3-b6b5-9fc55cd5176f)

## ✨ Features

- **Customer Management**: Easily add, update, and delete customer information
- **Inventory Management**: Keep track of inventory items, including stock levels and pricing
- **Order Management**: Manage customer orders with order creation, updates, and status tracking
- **User Authentication**: Secure login and authentication for customers and admin members
- **Role-Based Access Control**: Define roles and permissions for different user types
- **Product Categories**: Support for various food categories (Bangladeshi, Chinese, Biryani, Chicken, Paneer, etc.)
- **Responsive UI**: Modern and user-friendly interface built with Thymeleaf, HTML, CSS, and JavaScript
- **Database Integration**: Integrated with MySQL for reliable data storage and retrieval

## 🛠️ Technology Stack

- **Backend**: Spring Boot 3.1.3, Java 17, Spring MVC, Spring Data JPA (Hibernate), Spring Security
- **Frontend**: Thymeleaf, HTML5, CSS3, JavaScript
- **Database**: MySQL 8.0+
- **Build Tool**: Maven
- **IDE**: Eclipse, IntelliJ IDEA, or Spring Tool Suite (STS)

## 📋 Prerequisites

Before running this project, ensure you have the following installed on your system:

| Software     | Version                                 | Download Link                                                   |
| ------------ | --------------------------------------- | --------------------------------------------------------------- |
| **Java JDK** | 17 or higher                            | [Download](https://adoptium.net/)                               |
| **MySQL**    | 8.0 or higher                           | [Download](https://dev.mysql.com/downloads/mysql/) or use XAMPP |
| **Maven**    | 3.6+ (optional - included with wrapper) | [Download](https://maven.apache.org/download.cgi)               |
| **Git**      | Latest                                  | [Download](https://git-scm.com/downloads)                       |

## 🚀 Quick Start Guide

### Step 1: Clone the Repository

```bash
git clone https://github.com/your-username/aoop_FoodFrenzy.git
cd aoop_FoodFrenzy
```

### Step 2: Setup MySQL Database

#### Option A: Using XAMPP (Recommended for Windows)

1. Install and start **XAMPP**
2. Start the **MySQL** service from XAMPP Control Panel
3. Open **phpMyAdmin** at `http://localhost/phpmyadmin`
4. Click on **SQL** tab
5. Copy and paste the contents of `database_setup.sql` file
6. Click **Go** to execute the SQL script

#### Option B: Using MySQL Command Line

```bash
# Login to MySQL
mysql -u root -p

# Create the database
CREATE DATABASE FoodFrenzy;

# Use the database
USE FoodFrenzy;

# Import the database setup file
source /path/to/database_setup.sql;

# Exit MySQL
exit;
```

### Step 3: Configure Database Connection

The default configuration in [src/main/resources/application.properties](src/main/resources/application.properties) is:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/FoodFrenzy?createDatabaseIfNotExist=true
spring.datasource.username=root
spring.datasource.password=
```

**If your MySQL has a password**, update the `application.properties` file:

```properties
spring.datasource.password=your_mysql_password
```

### Step 4: Run the Application

#### Using Maven Wrapper (No Maven installation needed):

**On macOS/Linux:**

```bash
./mvnw spring-boot:run
```

**On Windows:**

```bash
mvnw.cmd spring-boot:run
```

#### Using Maven (if installed):

```bash
mvn spring-boot:run
```

#### Using IDE:

1. Import the project as a Maven project
2. Wait for dependencies to download
3. Run the main application class (usually `DemoApplication.java`)

### Step 5: Access the Application

Open your web browser and navigate to:

```
http://localhost:8080
```

## 🔑 Default Login Credentials

After setting up the database with `database_setup.sql`, you can use these default credentials:

**Admin Login:**

- Navigate to: `http://localhost:8080/adminlogin`
- Check your database for admin credentials

**Customer Login:**

- Navigate to: `http://localhost:8080/customerlogin`
- Or register a new customer account

## 📁 Project Structure

```
aoop_FoodFrenzy/
├── src/
│   ├── main/
│   │   ├── java/com/example/demo/
│   │   │   ├── controller/      # Controllers for handling HTTP requests
│   │   │   ├── model/           # Entity classes (JPA entities)
│   │   │   ├── repository/      # Data access layer (JPA repositories)
│   │   │   ├── service/         # Business logic layer
│   │   │   └── config/          # Security and app configuration
│   │   └── resources/
│   │       ├── templates/       # Thymeleaf HTML templates
│   │       ├── static/
│   │       │   ├── css/        # Stylesheets
│   │       │   ├── Images/     # Product images and assets
│   │       │   └── JavaScript/ # Client-side scripts
│   │       └── application.properties  # Application configuration
│   └── test/                    # Unit and integration tests
├── database_setup.sql           # Database schema and initial data
├── pom.xml                      # Maven dependencies and build config
├── mvnw & mvnw.cmd             # Maven wrapper scripts
└── README.md                    # This file
```

## 🐛 Troubleshooting

### Port 8080 is already in use

```bash
# Find and kill the process using port 8080
# On macOS/Linux:
lsof -ti:8080 | xargs kill -9

# On Windows:
netstat -ano | findstr :8080
taskkill /PID <PID> /F
```

### MySQL Connection Error

- Verify MySQL is running
- Check username and password in `application.properties`
- Ensure the database `FoodFrenzy` exists
- Check MySQL is running on port 3306

### Maven Dependencies Not Downloading

```bash
# Clean and install
./mvnw clean install

# Or force update
./mvnw clean install -U
```

## 📝 Additional SQL Scripts

The project includes additional SQL scripts for populating product data:

- `update_bangladeshi_products.sql` - Bangladeshi cuisine products
- `update_chinese_products.sql` - Chinese cuisine products

Run these after the main database setup if needed.

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is open source and available for educational purposes.

## 📞 Support

For detailed setup instructions in Bengali, see [SETUP_GUIDE.md](SETUP_GUIDE.md)

For project documentation, see [DOCUMENTATION.md](DOCUMENTATION.md)

---

**Happy Coding! 🎉**

## Website Screenshot

Here is a preview of the FoodFrenzy interface:

![Screenshot 2025-05-19 143351](https://github.com/user-attachments/assets/3e34f54c-c986-42ac-96a4-ed7ad18035a6)
![Screenshot 2025-05-19 143427](https://github.com/user-attachments/assets/a4046d4e-8c3d-4629-8913-5543d709e80e)
![Screenshot 2025-05-19 143441](https://github.com/user-attachments/assets/09c92348-ec06-4607-9ae4-88b28cc1e0ec)
![Screenshot 2025-05-19 143452](https://github.com/user-attachments/assets/0e73aece-a28c-413d-9363-245358a0e439)
![Screenshot 2025-05-19 143504](https://github.com/user-attachments/assets/ac26bd92-0fcd-473d-a175-9bc45fdb12ba)

![image](https://github.com/user-attachments/assets/3d407958-efbe-449f-b4e1-5b08b9f8a28b)

![Screenshot 2024-08-24 194958](https://github.com/user-attachments/assets/c11a4710-69f8-42fd-b9d7-2b5278b2c8a3)

![Screenshot 2024-08-24 220831](https://github.com/user-attachments/assets/d3cd3cdd-cda5-460a-a253-24e45cf600b0)  
![Screenshot 2024-08-24 195054](https://github.com/user-attachments/assets/733afb94-a251-4a6d-86a4-3a124e8c3469)
![Screenshot 2024-08-24 195106](https://github.com/user-attachments/assets/ef09886f-7936-4ef7-b01e-4da0008fd047)
![Screenshot 2024-08-24 195121](https://github.com/user-attachments/assets/219272b8-3938-4b7f-ba78-817e507beee9)
![Screenshot 2024-10-03 093051](https://github.com/user-attachments/assets/d4da51a4-dfe8-4cc1-ae49-745f6e1ae17a)
![Screenshot 2024-10-03 093106](https://github.com/user-attachments/assets/09c31cf7-e960-4ea5-a858-8807317486b7)
![Screenshot 2024-10-03 093133](https://github.com/user-attachments/assets/b1da1faa-7e71-49be-972a-432029a1e7c3)
![Screenshot 2024-10-03 093424](https://github.com/user-attachments/assets/b0a9a1e2-6018-475a-95fc-d64980677ee7)
![Screenshot 2024-10-03 093437](https://github.com/user-attachments/assets/b860f905-2c35-4af3-9df8-38cda70b4406)

## Project Structure

```bash
src/
├── main/
│   ├── java/
│   │   └── com.example.foodfrenzy/
│   │       ├── controller/      # Contains all controllers
│   │       ├── model/           # Contains entity classes
│   │       ├── repository/      # Repository interfaces for database interaction
│   │       └── service/         # Service layer with business logic
│   ├── resources/
│   │   ├── templates/           # Thymeleaf templates for views
│   │   ├── static/              # Static assets (CSS, JavaScript)
│   │   └── application.properties  # Project configuration
│   └── webapp/
│       └── WEB-INF/
│           └── views/           # Additional view files
└── test/                        # Test cases for unit testing
```
