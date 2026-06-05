CREATE DATABASE jobPortal;
USE jobPortal;

create table job_seeker(
jskId int primary key auto_increment,
email varchar(100) unique not null,
password varchar(100) not null,
created_at timestamp default current_timestamp
);


CREATE TABLE jinfo (
    jinfo_id INT PRIMARY KEY AUTO_INCREMENT,
    jsk_id INT UNIQUE NOT NULL,
    name VARCHAR(100),
    phone VARCHAR(15),
    skills VARCHAR(255),
    experience VARCHAR(50),
    qualification VARCHAR(100),

    CONSTRAINT fk_jsk_jinfo
        FOREIGN KEY (jsk_id)
        REFERENCES job_seeker(jskId)
        ON DELETE CASCADE
);

CREATE TABLE company (
    company_id INT PRIMARY KEY AUTO_INCREMENT,
    company_email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    status VARCHAR(20) DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE cinfo (
    cinfo_id INT PRIMARY KEY AUTO_INCREMENT,
    company_id INT UNIQUE NOT NULL,
    company_name VARCHAR(150),
    location VARCHAR(100),
    website VARCHAR(150),
    description TEXT,

    CONSTRAINT fk_company_cinfo
        FOREIGN KEY (company_id)
        REFERENCES company(company_id)
        ON DELETE CASCADE
);

CREATE TABLE jobs (
    job_id INT PRIMARY KEY AUTO_INCREMENT,
    company_id INT NOT NULL,
    title VARCHAR(100),
    description TEXT,
    location VARCHAR(100),
    salary VARCHAR(50),
    posted_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_company_jobs
        FOREIGN KEY (company_id)
        REFERENCES company(company_id)
        ON DELETE CASCADE
);
ALTER TABLE jobs
ADD COLUMN category VARCHAR(50) AFTER description,
ADD COLUMN candidate_type VARCHAR(20) AFTER category,
ADD COLUMN experience_years INT DEFAULT 0 AFTER candidate_type;

ALTER TABLE jobs
ADD COLUMN status VARCHAR(20) DEFAULT 'OPEN';



CREATE TABLE applications (
    application_id INT PRIMARY KEY AUTO_INCREMENT,
    job_id INT NOT NULL,
    jsk_id INT NOT NULL,
    status VARCHAR(20) DEFAULT 'APPLIED',
    applied_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_app_job
        FOREIGN KEY (job_id)
        REFERENCES jobs(job_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_app_jsk
        FOREIGN KEY (jsk_id)
        REFERENCES job_seeker(jskId)
        ON DELETE CASCADE
);

select * from job_seeker;
select * from jinfo where jsk_id=1;
select * from company;
select * from cinfo;
select * from jobs;

update cinfo set description="At TCS, we don’t just help businesses transform. We help them 
become perpetually adaptive enterprises, built to evolve continuously and confidently in a 
world of constant change. We deliver excellence and create value for customers and 
communities - everyday. With the best talent and the latest technology we help customers 
turn complexity into opportunities and create meaningful change." where cinfo_id=1;

INSERT INTO company (company_email, password)
VALUES
('hr@techsoft.com', '1234'),
('jobs@finserve.com', '1234'),
('careers@healthplus.com', '1234');

INSERT INTO cinfo (company_id, company_name, location, website, description)
VALUES
(4, 'TechSoft Solutions', 'Pune', 'https://techsoft.com', 'Software development company'),
(2, 'FinServe Pvt Ltd', 'Mumbai', 'https://finserve.com', 'Finance & banking solutions'),
(3, 'HealthPlus', 'Bangalore', 'https://healthplus.com', 'Healthcare technology company');


INSERT INTO jobs
(company_id, title, description, category, candidate_type, experience_years, location, salary, status)
VALUES
(1, 'Java Developer',
 'Work on backend Java applications',
 'IT', 'Fresher', 0,
 'Pune', '3–5 LPA', 'OPEN');
INSERT INTO jobs
(company_id, title, description, category, candidate_type, experience_years, location, salary, status)
VALUES
(1, 'Full Stack Developer',
 'React + Spring Boot projects',
 'IT', 'Experienced', 3,
 'Remote', '8–12 LPA', 'OPEN');
INSERT INTO jobs
(company_id, title, description, category, candidate_type, experience_years, location, salary, status)
VALUES
(2, 'Financial Analyst',
 'Analyze financial reports and data',
 'Finance', 'Experienced', 2,
 'Mumbai', '6–8 LPA', 'OPEN');

INSERT INTO jobs
(company_id, title, description, category, candidate_type, experience_years, location, salary, status)
VALUES
(2, 'HR Executive',
 'Employee engagement and recruitment',
 'HR', 'Fresher', 0,
 'Mumbai', '2.5–4 LPA', 'OPEN');


INSERT INTO jobs
(company_id, title, description, category, candidate_type, experience_years, location, salary, status)
VALUES
(3, 'Digital Marketing Manager',
 'SEO, SEM, Campaign planning',
 'Marketing', 'Experienced', 4,
 'Bangalore', '7–10 LPA', 'OPEN');

INSERT INTO jobs
(company_id, title, description, category, candidate_type, experience_years, location, salary, status)
VALUES
(3, 'Digital Marketing Manager',
 'SEO, SEM, Campaign planning',
 'Marketing', 'Experienced', 4,
 'Bangalore', '7–10 LPA', 'OPEN');

INSERT INTO jobs
(company_id, title, description, category, candidate_type, experience_years, location, salary, status)
VALUES
(3, 'Medical Data Analyst',
 'Healthcare data processing',
 'IT', 'Experienced', 5,
 'Bangalore', '10–14 LPA', 'CLOSED');
