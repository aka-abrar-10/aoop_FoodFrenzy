# 🍕 Food Delivery App

A full-stack food delivery web application built with Spring Boot and Thymeleaf. This application provides a complete platform for ordering food online with separate interfaces for customers and administrators. Users can browse various food categories including Biryani, Chicken, Chinese, North Indian, Paneer, and Vegetable dishes.

![Screenshot 2024-10-02 123332](https://github.com/user-attachments/assets/1382d32f-3cbb-40c3-b6b5-9fc55cd5176f)

## ✨ Features

### Customer Features

- **User Registration & Login**: Secure authentication system for customers
- **Browse Products**: View food items organized by categories
- **Product Search**: Find your favorite dishes quickly
- **Order Placement**: Easy-to-use ordering system
- **Order Tracking**: Track order status in real-time
- **About & Contact**: Learn about the service and locate restaurants

### Admin Features

- **Admin Dashboard**: Comprehensive admin control panel
- **Product Management**: Add, update, and delete food products
- **User Management**: Manage customer accounts
- **Admin Management**: Manage other admin users
- **Order Management**: View and process customer orders
- **Inventory Control**: Track and manage product availability

### Additional Features

- **Responsive Design**: Mobile-friendly interface
- **Secure Authentication**: Separate login systems for customers and admins
- **Role-Based Access Control**: Different permissions for customers and administrators
- **Database Integration**: MySQL database for persistent data storage
- **Thymeleaf Templates**: Dynamic server-side rendering

## 🛠️ Technology Stack

- **Backend**: Spring Boot 3.1.3, Java 17
- **Frontend**: Thymeleaf, HTML5, CSS3, JavaScript
- **Database**: MySQL
- **ORM**: Spring Data JPA (Hibernate)
- **Build Tool**: Maven
- **Development**: Spring Boot DevTools

## 📋 Prerequisites

Before running this project, ensure you have the following installed:

- **Java 17** or higher
- **MySQL 8.0** or higher
- **Maven 3.6+**
- **IDE**: IntelliJ IDEA, Eclipse, or Spring Tool Suite (STS)

## 🚀 Setup and Installation

### 1. Clone the repository

```bash
git clone https://github.com/your-username/Food-Delivery-App.git
cd Food-Delivery-App
```

### 2. Configure MySQL Database

Create a new MySQL database:

```sql
CREATE DATABASE foodfrenzy;
```

Update the database configuration in [src/main/resources/application.properties](src/main/resources/application.properties):

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/foodfrenzy
spring.datasource.username=your_mysql_username
spring.datasource.password=your_mysql_password
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
```

### 3. Build and Run the project

Using Maven wrapper:

```bash
./mvnw clean install
./mvnw spring-boot:run
```

Or using Maven directly:

```bash
mvn clean install
mvn spring-boot:run
```

Or using your IDE:

- Import the project as a Maven project
- Run `FoodFrenzyApplication.java` as a Spring Boot application

### 4. Access the application

- **Customer Portal**: `http://localhost:8080`
- **Admin Portal**: `http://localhost:8080/admin`

## 📁 Project Structure

```
Food-Delivery-App/
├── src/
│   ├── main/
│   │   ├── java/com/example/demo/
│   │   │   ├── FoodFrenzyApplication.java  # Main application class
│   │   │   ├── config/                      # Configuration classes
│   │   │   ├── controllers/                 # MVC Controllers
│   │   │   ├── entities/                    # JPA Entity classes
│   │   │   │   ├── Admin.java              # Admin entity
│   │   │   │   ├── User.java               # User/Customer entity
│   │   │   │   ├── Product.java            # Product entity
│   │   │   │   └── Orders.java             # Order entity
│   │   │   ├── repositories/                # Spring Data JPA repositories
│   │   │   ├── services/                    # Business logic layer
│   │   │   ├── loginCredentials/            # Authentication logic
│   │   │   ├── count/                       # Utility classes
│   │   │   └── Exceptions.java              # Custom exceptions
│   │   └── resources/
│   │       ├── application.properties       # Application configuration
│   │       ├── static/
│   │       │   ├── css/                     # Stylesheets
│   │       │   ├── JavaScript/              # Client-side scripts
│   │       │   └── Images/                  # Product and logo images
│   │       │       ├── biryani/
│   │       │       ├── chicken/
│   │       │       ├── chinese/
│   │       │       ├── north-india-food/
│   │       │       ├── paneer/
│   │       │       └── vegetable/
│   │       └── templates/                   # Thymeleaf HTML templates
│   │           ├── Home.html
│   │           ├── Products.html
│   │           ├── BuyProduct.html
│   │           ├── CustomerLogin.html
│   │           ├── AdminLogin.html
│   │           ├── Admin_Page.html
│   │           └── ...
│   └── test/                                # Test classes
├── pom.xml                                  # Maven configuration
└── README.md
```

## 🎯 Key Entities

- **User**: Customer information and credentials
- **Admin**: Administrator accounts with elevated permissions
- **Product**: Food items with categories, prices, and images
- **Orders**: Customer orders with product details and status

## 🔐 Security Features

- Secure password handling
- Session management
- Role-based access control (Customer/Admin)
- Protected admin routes

## 📱 Application Pages

### Customer Pages

- **Home**: Landing page with featured items
- **Products**: Browse all food products by category
- **Buy Product**: Product details and purchase page
- **Customer Login**: Authentication for customers
- **Register**: New user registration
- **About**: Information about the service
- **Locate Us**: Restaurant locations and contact

### Admin Pages

- **Admin Dashboard**: Overview and management panel
- **Product Management**: Add, update, delete products
- **User Management**: Add, update, delete customers
- **Admin Management**: Manage administrator accounts
- **Order Management**: View and process orders
- **Admin Login**: Secure admin authentication

## 🖼️ Screenshots

Here is a preview of the Food Delivery App interface:

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

## 🎨 Food Categories

The application features various food categories with high-quality images:

- **Biryani** - Aromatic rice dishes
- **Chicken** - Various chicken preparations
- **Chinese** - Popular Chinese cuisine
- **North Indian Food** - Traditional North Indian dishes
- **Paneer** - Cottage cheese specialties
- **Vegetable** - Healthy vegetarian options

## 🚧 Future Enhancements

- Payment gateway integration
- Real-time order tracking
- Customer ratings and reviews
- Mobile application
- Email notifications
- Discount and coupon system
- Multi-restaurant support
- Advanced search and filters

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 📧 Contact

For any questions or suggestions, feel free to reach out or create an issue in the repository.

## ⭐ Show your support

Give a ⭐️ if you like this project!

---

**Built with ❤️ using Spring Boot and Thymeleaf**
