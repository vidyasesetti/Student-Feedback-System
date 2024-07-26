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
INSERT INTO faculty VALUES ('F11', 'Mrs.abc', '9632458741', '123', '2023-2024', 'abc@gmail.com', 'M.Tech. Ph.D', 'CSE', 25, 0);

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
INSERT INTO student VALUES ('cs58', 'olivia', '123', 0, '2023-2024', 'B.TECH', 'olivia@gmail.com', '9874568753', '6398745687', 'CSE', 'A', 2, 3, 0);
INSERT INTO student VALUES ('cs26', 'kate', '123', 0, '2023-2024', 'B.TECH', 'kate@gmail.com', '7689458756', '9951793723', 'CSE', 'A', 2, 3, 0);
INSERT INTO student VALUES ('cs29', 'lily', '123', 0, '2023-2024', 'B.TECH', 'lily@gmail.com', '9874568753', '7459631865', 'CSE', 'A', 2, 3, 0);
INSERT INTO student VALUES ('cs31', 'rose', '123', 1, '2023-2024', 'B.TECH', 'rose@gmail.com', '9874568753', '6398745687', 'CSE', 'A', 2, 3, 0);

-- Create the parent table
CREATE TABLE IF NOT EXISTS parent (
    name VARCHAR(100),
    phn_no VARCHAR(20) PRIMARY KEY,
    student_rollno VARCHAR(20),
    status INT,
    FOREIGN KEY (student_rollno) REFERENCES student(roll_no)
);

-- Insert data into parent table
INSERT INTO parent VALUES ('bhgy', '6398745687', 'cs58', 0);
INSERT INTO parent VALUES ('asdse', '54987989656', 'cs26', 0);
INSERT INTO parent VALUES ('tyre5', '8978564946', 'cs31', 0);
INSERT INTO parent VALUES ('njhh', '945929262', 'cs29', 0);

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
