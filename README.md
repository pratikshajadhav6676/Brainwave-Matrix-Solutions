# Brainwave-Matrix-Solutions

Welcomen to my Repository of **SQL Database Management Systems** – one for a **Hospital Management System** and one for a **Library Management System**.

---

## 🏥 Hospital Management System – SQL DBMS

### 📌 Project Description
This project is a **SQL-based Hospital Management System** designed to manage the administrative and operational functions of a hospital. It covers essential modules like patient registration, doctor management, appointments, billing, and medical records.

### 📁 Features
- Patient registration and tracking
- Doctor information and schedules
- Appointment management
- Diagnosis and medical records
- Billing and payments
- Department management
- Room and bed allocation

### 🛠️ Tech Stack
- **Database**: MySQL / PostgreSQL / SQLite (Choose one)
- **Tools Used**: SQL Workbench / pgAdmin / phpMyAdmin

### 🗂️ Database Schema
Main Tables:
- Patients (patient_id, name, age, gender, contact, address)
- Doctors (doctor_id, name, specialization, contact)
- Appointments (appointment_id, patient_id, doctor_id, date, time)
- Departments (dept_id, dept_name)
- Bills (bill_id, patient_id, amount, status)
- Rooms (room_id, type, availability)

### ⚙️ How to Use
1. Clone the repository.
2. Open the `.sql` file in your database client.
3. Run the script to create the database and tables.
4. Insert sample data using `INSERT` queries or your interface.
5. Perform queries to test functionality.

### 📊 Sample Queries
<pre lang="markdown"> ### 📊 Sample SQL Queries sql -- 🗓️ List all appointments for a specific doctor SELECT * FROM Appointments WHERE doctor_id = 101; -- 💳 Total bill amount for a specific patient SELECT patient_id, SUM(amount) AS Total_Bill FROM Bills WHERE patient_id = 1001 GROUP BY patient_id; -- 🛏️ List of available rooms SELECT * FROM Rooms WHERE availability = 'Yes'; -- 🧑‍⚕️ Number of appointments each doctor has SELECT d.name AS Doctor_Name, COUNT(a.appointment_id) AS Appointment_Count FROM Doctors d LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id GROUP BY d.name;  </pre>


### ✅ Future Improvements
- GUI or Web interface integration
- User authentication (Admin, Doctor, Receptionist)
- Report generation (PDF, Excel)

---

## 📚 Library Management System – SQL DBMS

### 📌 Project Description
This **SQL-based Library Management System** manages library operations such as tracking books, users, borrowing/returning transactions, and due dates. It is ideal for schools, colleges, or public libraries.

### 📁 Features
- Book catalog management
- Member registration and records
- Book issue and return tracking
- Fine calculation for late returns
- Admin overview of all transactions

### 🛠️ Tech Stack
- **Database**: MySQL / PostgreSQL / SQLite
- **Tools Used**: SQL Workbench / pgAdmin / DBeaver

### 🗂️ Database Schema
Main Tables:
- Books (book_id, title, author, publisher, genre, availability)
- Members (member_id, name, contact, address)
- Borrow (borrow_id, member_id, book_id, issue_date, return_date, due_date)
- Admins (admin_id, username, password)

### ⚙️ How to Use
1. Clone the repository.
2. Run the SQL schema file to initialize the database.
3. Insert books and member records.
4. Use sample queries to simulate library operations.

### 📊 Sample Queries
<pre lang="markdown"> ### 📊 Sample SQL Queries sql -- 📘 List all books currently borrowed SELECT * FROM Books WHERE availability = 'No'; -- ⏰ Members with overdue books SELECT m.name AS Member_Name, b.title AS Book_Title, br.due_date AS Due_Date FROM Borrow br JOIN Members m ON br.member_id = m.member_id JOIN Books b ON br.book_id = b.book_id WHERE br.return_date IS NULL AND br.due_date < CURDATE(); </pre>


### ✅ Future Improvements
- Integration with a web-based or desktop front-end
- Barcode/QR code system for book tracking
- Notifications for due dates via email/SMS

---

Would you like me to generate ER diagrams or SQL schema files for these projects too?
