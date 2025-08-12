📌 Customer Relationship Management (CRM) System
A Java Spring Boot powered Customer Relationship Management web application for managing customers, tracking products/courses, and organizing sales workflows efficiently.

This project demonstrates Java Full Stack Development with Spring Boot (Backend), MySQL (Database), and HTML/CSS/JS + Bootstrap (Frontend), along with REST APIs for seamless data exchange.

🚀 Features
✅ User Authentication & Authorization (Spring Security)
✅ Customer Management (Add, View, Edit, Delete)
✅ Product & Course Tracking
✅ AJAX-based Dynamic Course Details Fetching
✅ Image Upload for Customer Profiles
✅ Responsive Bootstrap UI
✅ REST API Endpoints for integration with other services

🛠 Tech Stack
Backend: Java, Spring Boot, Spring Data JPA, Spring Security, REST APIs
Frontend: HTML5, CSS3, JavaScript, Bootstrap, AJAX
Database: MySQL
Tools & Others: Git & GitHub, Maven, Lombok

📂 Project Structure
bash
Copy
Edit
Customer_Reletionship_Management-CRM-/
│── src/main/java/com/scm/    # Java source code (controllers, services, entities)
│── src/main/resources/       # Templates, static resources, configs
│── pom.xml                   # Maven dependencies
│── README.md                 # Project documentation
⚡ Getting Started
1️⃣ Clone the repository
bash
Copy
Edit
git clone https://github.com/vikasgadekar18/Customer_Reletionship_Management-CRM-.git
cd Customer_Reletionship_Management-CRM-
2️⃣ Configure Database
Create a MySQL database:

sql
Copy
Edit
CREATE DATABASE crm_db;
Update application.properties:

properties
Copy
Edit
spring.datasource.url=jdbc:mysql://localhost:3306/crm_db
spring.datasource.username=YOUR_DB_USERNAME
spring.datasource.password=YOUR_DB_PASSWORD
spring.jpa.hibernate.ddl-auto=update
3️⃣ Build & Run
bash
Copy
Edit
mvn clean install
mvn spring-boot:run
The application will run on: http://localhost:8080

