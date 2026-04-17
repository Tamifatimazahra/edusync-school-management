CREATE DATABASE edusync;
USE edusync;
CREATE TABLE roles(id_roles int  AUTO_INCREMENT PRIMARY KEY ,
label VARCHAR(50)  );
SELECT * from roles;
CREATE TABLE users(id_users int AUTO_INCREMENT PRIMARY KEY,
firstname VARCHAR(50),
lastname VARCHAR(50),
id_roles INT,
FOREIGN KEY(id_roles)REFERENCES roles(id_roles));
SELECT * FROM users;
CREATE TABLE courses(id_courses INT AUTO_INCREMENT PRIMARY KEY ,
title VARCHAR(50),
description text ,
id_prof INT,
Foreign Key (id_prof) REFERENCES users (id_users));
ALTER TABLE roles
MODIFY label VARCHAR (50) NOT NULL;
ALTER TABLE users
MODIFY firstname VARCHAR(50) NOT NULL,
MODIFY lastname VARCHAR(50) NOT NULL;
ALTER TABLE courses
MODIFY title VARCHAR(50) NOT NULL;
ALTER TABLE users
ADD email VARCHAR (100) NOT NULL UNIQUE;
SELECT * from users;
CREATE TABLE classes(id_classes INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
classrom_number  INT NOT NULL UNIQUE );
CREATE TABLE students (id_students int AUTO_INCREMENT PRIMARY KEY,
dateofnirth DATE NOT NULL,
student_number int NOT NULL UNIQUE,
id_classes INT,
id_users INT,
Foreign Key (id_classes) REFERENCES classes (id_classes),
Foreign Key (id_users) REFERENCES users(id_users)
ON DELETE CASCADE
);
CREATE TABLE enrollements(id_enrollements INT AUTO_INCREMENT PRIMARY KEY,
enrolled_at_date DATE ,
status VARCHAR(50) NOT NULL,
id_students INT,
id_courses INT,
Foreign Key (id_students) REFERENCES students(id_students)
on delete CASCADE,
Foreign Key (id_courses) REFERENCES courses(id_courses) 
on delete CASCADE );
SELECT * from enrollements;

DESCRIBE users;
ALTER Table users MODIFY email  varchar(100) UNIQUE not null;

SELECT * FROM courses;


