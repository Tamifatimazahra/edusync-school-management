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
Foreign Key (id_prof) REFERENCES users (id_users))

