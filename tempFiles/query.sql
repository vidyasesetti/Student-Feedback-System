-- Create the usersdb database
CREATE DATABASE IF NOT EXISTS studentFeedback;

USE studentFeedback;

CREATE TABLE IF NOT EXISTS faculty (
    faculty_id VARCHAR(100) PRIMARY KEY,
    name VARCHAR(100),
    phno VARCHAR(20),
    password VARCHAR(100),
    ac_year VARCHAR(100),
    email VARCHAR(100),
    qualifications VARCHAR(100),
    department VARCHAR(100),
    experience INT
);
ALTER TABLE faculty
ADD status int(2);
update faculty set status=0 Where 1;
insert into faculty values('F12','Mr.xyz','7632458741','123','2023-2024','xyz@gmail.com','M.Tech. Ph.D','CSE',15);
insert into faculty values('F11','Mrs.V.Sangeetha','9632458741','123','2023-2024','sangeetha@gmail.com','M.Tech. Ph.D','CSE',25);

-- Create the subject table
CREATE TABLE IF NOT EXISTS subject (
    subject_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(100),
    faculty_id VARCHAR(100),
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
);
insert into subject values(1,'Machine Learning','Mrs.V.Sangeetha');
-- insert into subject values(2,'Web ','Mrs.V.Sangeetha');

-- Create the student table
CREATE TABLE IF NOT EXISTS student (
    roll_no VARCHAR(20) PRIMARY KEY,
    name VARCHAR(100),
    password VARCHAR(100),
    passedout_status INT,
    ac_year VARCHAR(100),
    course VARCHAR(100),
    email VARCHAR(100),
    phn_no VARCHAR(20),
    parent_phn_no VARCHAR(20),
    department VARCHAR(100),
    section VARCHAR(10),
    sem INT,
    year INT
);
ALTER TABLE student
ADD status int(2);

update student set status=0;

insert into student values('A21126510058','SESETTI VIDYA SRI','123',0,'2023-2024','B.TECH','sesettividyasri.21.cse@anits.edu.in','9687324561','9985084036','CSE','A',2,3);
insert into student values('A21126510029','ABCD','123',0,'2019-2023','B.TECH','abcd.19.cse@anits.edu.in','7687324561','8985084036','CSE',NULL,NULL,NULL);
insert into student values('A21126510069','xyz','123',1,'2019-2023','B.TECH','xyz.19.cse@anits.edu.in','6687324561','9685084036','CSE',NULL,NULL,NULL,0);
-- Create the feedback table



CREATE TABLE IF NOT EXISTS parent (
    name VARCHAR(100),
    phn_no VARCHAR(20) PRIMARY KEY,
    student_rollno VARCHAR(20),
    FOREIGN KEY (student_rollno) REFERENCES student(roll_no)
);
ALTER TABLE parent
ADD status int(2);
insert into parent values('SESETTI SRINIVAS','9985084036','A21126510058');
insert into parent(name,phn_no,student_rollno,status) values('XYZ','9985084036','A21126510069',0);



CREATE TABLE IF NOT EXISTS student_feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    student_rollno VARCHAR(20),
    subject_id INT,
    status VARCHAR(20),
    FOREIGN KEY (student_rollno) REFERENCES student(roll_no),
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id)
);

-- Create the faculty_feedback table
CREATE TABLE IF NOT EXISTS faculty_feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    faculty_id VARCHAR(255),
    subject_name VARCHAR(255),
    q1 int,
    q2 int,
    q3 VARCHAR(255),
    q4 VARCHAR(255),
    q5 VARCHAR(255),
    q6 VARCHAR(255),
    q7 int,
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
);

CREATE TABLE IF NOT EXISTS alfeedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    roll_no VARCHAR(255),
    q1 int,
    q2 int,
    q3 int,
    q4 VARCHAR(255),
    q5 VARCHAR(255),
    q6 VARCHAR(255),
    q7 int,
    FOREIGN KEY (roll_no) REFERENCES student(roll_no)
);
CREATE TABLE IF NOT EXISTS p_feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    roll_no VARCHAR(255),
    q1 int,
    q2 int,
    q3 int,
    q4 VARCHAR(255),
    q5 VARCHAR(255),
    q6 VARCHAR(255),
    q7 int,
    FOREIGN KEY (roll_no) REFERENCES student(roll_no)
);




-----------------

insert into student values('A21126510058','SESETTI VIDYA SRI','123',0,'2023-2024','B.TECH','sesettividyasri.21.cse@anits.edu.in','9687324561','9985084036','CSE','A',2,3);
insert into student values('A21126510026','KARRI LOHITHA','123',0,'2023-2024','B.TECH','karrilohitha.21.cse@anits.edu.in','7864218964','9951793723','CSE','A',2,3);
insert into student values('A21126510029','SNEHALATHA KILLI','123',0,'2023-2024','B.TECH','snehalatha.21.cse@anits.edu.in','9687324561','7459631865','CSE','A',2,3);
insert into student values('A21126510031','KOMMANA JAYASREE','123',0,'2023-2024','B.TECH','kommanajayasree.21.cse@anits.edu.in','9687324561','9985084036','CSE','A',2,3);


insert into parent values('SESETTI SRINIVAS','9985084036','A21126510058');
insert into parent values('SESETTI SRINIVAS','9985084037','A21126510026');
insert into parent values('SESETTI SRINIVAS','9985084035','A21126510031');
insert into parent values('SESETTI SRINIVAS','9985084026','A21126510029');


insert into faculty values('Mrs.V.Sangeetha','9632458741','sangeetha@gmail.com','M.Tech.,Ph.D',25,'Machine Learning',0);
insert into faculty values('Mr.Bosu Babu','9632458741','bosebabu@gmail.com','M.Tech.,Ph.D',25,'Web Technologies',0);
