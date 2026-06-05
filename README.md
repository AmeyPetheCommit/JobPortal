# 🚀 Job Portal System

A web-based recruitment platform developed using **Java, JSP, Servlets, JDBC, and MySQL** that connects **Job Seekers** and **Companies** on a single platform.

## 📌 Features

### 👨‍💼 Job Seeker

* User Registration & Login
* Profile Management
* Search Jobs
* Filter Jobs by Category, Candidate Type & Experience
* View Job Details
* Apply for Jobs
* Track Application Status

### 🏢 Company

* Company Registration & Login
* Company Profile Management
* Post New Jobs
* Edit Jobs
* Delete Jobs
* Close Job Openings
* View Applicants
* Accept / Reject Applications

## 🛠️ Technologies Used

### Frontend

* HTML5
* CSS3
* JSP

### Backend

* Java
* Servlets
* JDBC

### Database

* MySQL

### Server

* Apache Tomcat 10

### Tools

* Eclipse IDE
* Git
* GitHub

## 🏗️ Project Architecture

The project follows the **MVC (Model-View-Controller)** architecture.

* **Model** → Java Classes
* **View** → JSP Pages
* **Controller** → Servlets

## 📂 Database Tables

* job_seeker
* jinfo
* company
* cinfo
* jobs
* applications

## 🔄 Application Flow

### Job Seeker Flow

Register → Login → Search Jobs → View Job → Apply Job → Track Application

### Company Flow

Register → Login → Post Job → Manage Jobs → View Applicants → Accept/Reject Applicants


## ▶️ How to Run

1. Clone the repository

```bash
git clone https://github.com/AmeyPetheCommit/JobPortal.git
```

2. Import project into Eclipse

3. Configure MySQL database

4. Update database credentials in:

```java
DBConnection.java
```

5. Add project to Apache Tomcat Server

6. Run the application

7. Open:

```text
http://localhost:8080/JobPortal
```

## 🎯 Future Enhancements

* Resume Upload
* Email Notifications
* Admin Panel
* Password Encryption
* Advanced Job Recommendation System

## 👨‍💻 Developer

**Amey Gajanan Pethe**

LinkedIn: https://www.linkedin.com/in/amey-pethe-software-developer

GitHub: https://github.com/AmeyPetheCommit

---

⭐ If you found this project useful, consider giving it a star.
