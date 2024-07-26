
DROP DATABASE USERSDB;

CREATE DATABASE USERSDB;
USE DATABASE USERSDB;




CREATE TABLE a21126510026 (
  cname varchar(255) DEFAULT NULL,
  status int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO a21126510026 (cname, status) VALUES
('Machine Learning', 0),
('Cryptography & Neural Security', 0),
('Object Oriented Software Engineering', 0),
('Neural Networks and Deep Learning', 0),
('Web Technologies', 0),
('Introduction to Renewable Energy', 0);




CREATE TABLE threetwo (
  cname varchar(255) DEFAULT NULL,
  fname varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table threetwo
--

INSERT INTO threetwo (cname, fname) VALUES
('Machine Learning', 'Dr.V.Sangeetha'),
('Cryptography & Neural Security', 'Ms.P.Spandana Valli'),
('Object Oriented Software Engineering', 'Mr.P.Krishnanjaneyulu'),
('Neural Networks and Deep Learning', 'Mrs.D.Anusha'),
('Web Technologies', 'Mr.Bose Babu'),
('Introduction to Renewable Energy', 'Mr.K.Trinadh');



CREATE TABLE udetail (
  AcYear varchar(30) NOT NULL,
  course varchar(30) NOT NULL,
  name varchar(255) NOT NULL,
  mail varchar(255) NOT NULL,
  year int(11) NOT NULL,
  dept varchar(255) NOT NULL,
  roll varchar(30) NOT NULL,
  phn varchar(20) NOT NULL,
  section varchar(2) NOT NULL,
  sem int(11) NOT NULL,
  uname varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO udetail (AcYear, course, name, mail, year, dept, roll, phn, section, sem, uname) VALUES

('2022-2023', 'B.Tech', 'xyz', 'xyz.21.cse@anits.edu.in', 3, 'COMPUTER SCIENCE & ENGINEERING', 'A21126510026', '6987532145', 'A', 2, 'A21126510026');



CREATE TABLE users (
  username varchar(30) NOT NULL,
  password varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO users (username, password) VALUES
('admin', 'anits'),
('A21126510026', '123');
COMMIT;


CREATE TABLE sem32(rollno varchar(255),name varchar(255),branch varchar(255),gender varchar(255),phno varchar(11),DOB Date,status int(2));

insert into sem32 values('A21126510026','XYZ','CSE','M','9638745213','2004-01-01',0);


CREATE table feedback(cname varchar(255), fname varchar(255), roll varchar(255), qname varchar(255), value int);