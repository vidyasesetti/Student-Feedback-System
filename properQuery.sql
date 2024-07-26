-- Create the usersdb database
CREATE DATABASE IF NOT EXISTS studentFeedback;

USE studentFeedback;

-- Create the faculty table
CREATE TABLE IF NOT EXISTS faculty (
    faculty_id VARCHAR(100) PRIMARY KEY,
    name VARCHAR(100),
    phno VARCHAR(20),
    password VARCHAR(100),
    ac_year VARCHAR(100),
    email VARCHAR(100),
    qualifications VARCHAR(100),
    department VARCHAR(100),
    experience INT,
    status INT
);

-- Insert data into faculty table
INSERT INTO faculty VALUES ('F12', 'Mr.xyz', '7632458741', '123', '2023-2024', 'xyz@gmail.com', 'M.Tech. Ph.D', 'CSE', 15, 0);
INSERT INTO faculty VALUES ('F11', 'Mrs.V.Sangeetha', '9632458741', '123', '2023-2024', 'sangeetha@gmail.com', 'M.Tech. Ph.D', 'CSE', 25, 0);

-- Create the subject table
CREATE TABLE IF NOT EXISTS subject (
    subject_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(100),
    faculty_id VARCHAR(100),
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
);

-- Insert data into subject table
INSERT INTO subject VALUES (1, 'Machine Learning', 'F11');

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
    year INT,
    status INT
);

-- Insert data into student table
INSERT INTO student VALUES ('A21126510058', 'SESETTI VIDYA SRI', '123', 0, '2023-2024', 'B.TECH', 'sesettividyasri.21.cse@anits.edu.in', '9687324561', '9985084036', 'CSE', 'A', 2, 3, 0);
INSERT INTO student VALUES ('A21126510026', 'KARRI LOHITHA', '123', 0, '2023-2024', 'B.TECH', 'karrilohitha.21.cse@anits.edu.in', '7864218964', '9951793723', 'CSE', 'A', 2, 3, 0);
INSERT INTO student VALUES ('A21126510029', 'SNEHALATHA KILLI', '123', 0, '2023-2024', 'B.TECH', 'snehalatha.21.cse@anits.edu.in', '9687324561', '7459631865', 'CSE', 'A', 2, 3, 0);
INSERT INTO student VALUES ('A21126510031', 'KOMMANA JAYASREE', '123', 1, '2023-2024', 'B.TECH', 'kommanajayasree.21.cse@anits.edu.in', '9687324561', '9985084036', 'CSE', 'A', 2, 3, 0);

-- Create the parent table
CREATE TABLE IF NOT EXISTS parent (
    name VARCHAR(100),
    phn_no VARCHAR(20) PRIMARY KEY,
    student_rollno VARCHAR(20),
    status INT,
    FOREIGN KEY (student_rollno) REFERENCES student(roll_no)
);

-- Insert data into parent table
INSERT INTO parent VALUES ('SESETTI SRINIVAS', '9985084036', 'A21126510058', 0);
INSERT INTO parent VALUES ('SESETTI SRINIVAS', '9985084037', 'A21126510026', 0);
INSERT INTO parent VALUES ('SESETTI SRINIVAS', '9985084035', 'A21126510031', 0);
INSERT INTO parent VALUES ('SESETTI SRINIVAS', '9985084026', 'A21126510029', 0);

-- Create the student_feedback table
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
    faculty_id VARCHAR(100),  -- Adjusted size
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

-- Create the alfeedback table
CREATE TABLE IF NOT EXISTS alfeedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    roll_no VARCHAR(20),
    q1 int,
    q2 int,
    q3 int,
    q4 VARCHAR(255),
    q5 VARCHAR(255),
    q6 VARCHAR(255),
    q7 int,
    FOREIGN KEY (roll_no) REFERENCES student(roll_no)
);

-- Create the p_feedback table
CREATE TABLE IF NOT EXISTS p_feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    roll_no VARCHAR(20),
    q1 int,
    q2 int,
    q3 int,
    q4 VARCHAR(255),
    q5 VARCHAR(255),
    q6 VARCHAR(255),
    q7 int,
    FOREIGN KEY (roll_no) REFERENCES student(roll_no)
);
