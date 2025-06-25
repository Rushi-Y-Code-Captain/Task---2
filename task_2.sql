CREATE TABLE students (
    stu_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    gender ENUM('M', 'F', 'O') NOT NULL,
    dob DATE,
    class CHAR(1),
    marks INT CHECK (marks BETWEEN 0 AND 100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT,
    admission_date DATE
);



-- Insert sample data
INSERT INTO students (name, gender, dob, class, marks, email, phone, address)
VALUES 
('Aarav Mehta', 'M', '2005-03-14', 'A', 85, 'aarav@gmail.com', '9998887770', 'Pune, MH'),
('Neha Sharma', 'F', '2006-08-22', 'B', 92, 'neha.sharma@gmail.com', '8887776665', 'Delhi'),
('Rohan Das', 'M', '2004-11-10', 'A', NULL, 'rohan.das@gmail.com', '7776665554', 'Kolkata'), -- NULL marks
('Sneha Iyer', 'F', '2005-01-30', 'C', 76, NULL, '6665554443', 'Chennai'),                   -- NULL email
('Yusuf Khan', 'M', '2006-05-05', 'B', 63, 'yusuf.k@gmail.com', NULL, 'Hyderabad'),          -- NULL phone
('Anjali Patel', 'F', NULL, 'A', 90, 'anjali.p@gmail.com', '9991112233', 'Ahmedabad'),       -- NULL dob
('Kabir Roy', 'M', '2005-07-15', 'C', 48, 'kabir.roy@gmail.com', '9090909090', NULL);        -- NULL address



-- identifying the missing values 
SELECT * FROM students
WHERE dob IS NULL;

SELECT * FROM students
WHERE email IS NULL;

SELECT * FROM students
WHERE marks IS NULL;

SELECT * FROM students
WHERE admission_date IS NULL;


-- column wise
SELECT 
  COUNT(*) AS total_records,
  SUM(dob IS NULL) AS null_dob,
  SUM(email IS NULL) AS null_email,
  SUM(phone IS NULL) AS null_phone,
  SUM(marks IS NULL) AS null_marks,
  SUM(address IS NULL) AS null_address,
  SUM(admission_date IS NULL) AS null_admission_date
FROM students;

-- handling missing values 
UPDATE students
SET marks = 65
WHERE marks IS NULL;

UPDATE students
SET email = CONCAT(LOWER(REPLACE(name, ' ', '')), '@example.com')
WHERE email IS NULL;

UPDATE students
SET phone = '0000000000'
WHERE phone IS NULL;

UPDATE students
SET dob = '2000-01-01'
WHERE dob IS NULL;

UPDATE students
SET address = 'Not Provided'
WHERE address IS NULL;

UPDATE students
SET admission_date = CURDATE()
WHERE admission_date IS NULL;

-- delete

DELETE FROM students
WHERE name = 'Kabir Roy';

DELETE FROM students
WHERE marks = 65
LIMIT 1;

DELETE FROM students
WHERE class = 'C' AND marks < 70
LIMIT 1;


select * from students;
