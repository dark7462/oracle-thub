-- DROP TABLE students CASCADE CONSTRAINTS;
CREATE TABLE students(
    s_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    age NUMBER,
    d_id NUMBER,
    d_name VARCHAR2(50),
    d_location VARCHAR2(100)
);

INSERT INTO students
VALUES 
(1, 'Alice', 21, 101, 'CSE', 'Billgates'),
(2, 'Bob', 18, 102, 'IT', 'Ratan Tata'),
(3, 'Charlie', 19, 101, 'CSE', 'Billgates'),
(4, 'Diana', 17, 103, 'AIML', 'KL Rao'),
(5, 'Frank', 19, 101, 'CSE', 'Billgates'),
(6, 'Gwen', 20, 103, 'AIML', 'KL Rao'),
(7, 'Harry', 18, 102, 'IT', 'Ratan Tata'),
(8, 'Irina', 19, 104, 'DS', 'Billgates'),
(9, 'Jack', 20, 104, 'DS', 'Billgates');

SELECT * FROM students ORDER BY d_id;

-- CTAS (Create Table as)
create table department as ( -- Same as cte function but it create a legit new table
    SELECT DISTINCT d_id, d_name, d_location from STUDENTS -- it dosn't add primary key or any thing just the values
);
alter table department -- creating the primary key
modify d_id number primary key;

-- now time for the foregin key
-- first remove the extra columns from student table
alter TABLE students
drop (d_name, d_location);

-- now forgein key
alter table students
add CONSTRAINT fd_dept
FOREIGN key(d_id) REFERENCES departments(d_id);

select * from STUDENTs;
desc students;