# Centralized e-Document Repository Management System

The Centralized e-Document Repository Management (CERM) system is a web-based application designed to centralize and manage documents uploaded by users as well as documents issued by various departments, including government departments, schools/colleges, and other public/private institutes/offices. This system streamlines document handling processes, ensures document security, and improves efficiency in document management for both administrators and users.

## Features
- User Registration
- Document Upload, Download, View, and Delete
- Document Categorization
- Administrative Controls
- Document Creation by Department Users

## Technologies Used
- Frontend: HTML, CSS, JavaScript
- Backend: Java Servlets, JavaServer Pages (JSP)
- Database: MySQL
- Web Server: Apache Tomcat

## Installation
1. Clone the repository:https://github.com/GarimaTaya/cerm.git

 2. Set up MySQL database:
- Create a new database named 'cerm' and import the provided SQL dump file (`cerm_database.sql`).
3. Configure database connection:
- Navigate to `WEB-INF` directory and open `web.xml`.
- Modify the database connection settings according to your MySQL setup.
4. Deploy the application:
- Build the WAR file and deploy it to Apache Tomcat or any other servlet container.

## Usage
1. Access the application through your web browser.
2. Register as a user or log in if you already have an account.
3. Upload, download, view, or delete your documents as needed.
4. Administrators can manage document categories, types, and classes.
5. Department users can create and issue documents to citizens.



