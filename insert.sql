use edusync;

INSERT INTO roles(label)
VALUES ("admin"),("student"),("professeur");
INSERT INTO users(firstname,lastname,id_roles,email)
VALUES("sara","sarawi",1,"sara@gmail.com"),
("ahmed","hamdawi",2,"ahmad@gamial.com"),
("ilham","ilhami",3,"ilhami@gmail.com");
SELECT * FROM users;
SELECT * from roles;
INSERT INTO courses(title,description,id_prof)
VALUES("JS","description de title1",2),
("BD","description de 2",1);

INSERT INTO classes(name,classrom_number)
VALUES("malak",3),
("inass",5);
INSERT INTO students (dateofnirth, student_number, id_classes, id_users)
VALUES ('2005-02-15', 1, 2, 3);
INSERT INTO enrollements (enrolled_at_date,status,id_students,id_courses)
VALUES('2020-12-02','actif',5,1);


