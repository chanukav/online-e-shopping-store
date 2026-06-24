# Online E-Shopping Store

A comprehensive web-based e-commerce application built using Java Servlets, JSP, and MySQL. This project facilitates a complete online shopping experience for customers and provides robust management tools for admins.

## 🚀 Features

### Customer Features
- **User Authentication**: Secure registration and login functionality.
- **Product Browsing**: Browse products by category.
- **Shopping Cart**: Add items to the cart, update quantities, and remove items.
- **Checkout & Payment**: Secure checkout process with payment integration.
- **Profile Management**: Update customer details.

### Admin & Manager Features
- **Product Management**: Add, update, and delete products.
- **Category Management**: Organize products into categories.
- **Manager Handling**: Manage store managers.
- **Inventory Control**: Monitor stock levels.

## 🛠️ Tech Stack

- **Backend**: Java (Servlets), JDBC
- **Frontend**: JSP, HTML, CSS, JavaScript
- **Database**: MySQL
- **Server**: Apache Tomcat
- **IDE**: Eclipse (Recommended)

## 📂 Project Structure

```
src/
├── main/
│   ├── java/
│   │   ├── model/       # Data models (Product, Customer, etc.)
│   │   ├── services/    # Business logic (ProductService, etc.)
│   │   ├── servlet/     # Controllers (Servlets)
│   │   └── util/        # Utility classes (DB Connection)
│   └── webapp/          # Views (JSP), Styles (CSS), Scripts (JS)
```

## ⚙️ Setup & Installation

### Prerequisites
- Java Development Kit (JDK) 8 or higher
- Apache Tomcat Server (v8.5 or v9.0 recommended)
- MySQL Server
- Eclipse IDE for Enterprise Java Developers

### Installation Steps

1.  **Clone the Repository**
    ```bash
    git clone https://github.com/chanukav/online-e-shopping-store.git
    ```

2.  **Import into Eclipse**
    -   Open Eclipse.
    -   Go to `File` > `Open Projects from File System...`.
    -   Select the cloned repository folder.
    -   Click `Finish`.

3.  **Database Configuration**
    -   Make sure your MySQL server is running.
    -   Create a database named `gamudalk`.
    -   Configure database credentials via environment variables:
        *   `DB_URL`: Your database JDBC URL (defaults to `jdbc:mysql://localhost:3306/gamudalk?characterEncoding=utf8`)
        *   `DB_USER`: Your MySQL username (defaults to `root`)
        *   `DB_PASSWORD`: Your MySQL password (defaults to an empty string `""`)
    -   *Note: Ensure you create the necessary tables (Customer, Product, Category, etc.) in your database. Default fallback values can be found in [DBConnect.java](file:///C:/Users/chanuka/git/online-e-shopping-store/src/main/java/util/DBConnect.java).*

4.  **Run the Application**
    -   Right-click on the project in Project Explorer.
    -   Select `Run As` > `Run on Server`.
    -   Choose your configured Apache Tomcat server.
    -   The application should launch in your default browser.

## 🤝 Contributing

Contributions are welcome! Please fork the repository and create a pull request for any feature enhancements or bug fixes.

## 📄 License

This project is open-source and available for use and modification.
