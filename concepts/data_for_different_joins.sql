-- DROP TABLE department;
CREATE TABLE department(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- DROP TABLE employee;
CREATE TABLE employee(
    emp_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    d_id INT 
);

-- DROP TABLE professor;
CREATE TABLE professor(
    pro_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    hod_id INT
);

-- DROP TABLE worker;
CREATE TABLE worker(
    worker_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    salary INT NOT NULL
);
-- DROP TABLE payment;
CREATE TABLE payment(
    min_salary INT,
    max_salary INT,
    grade VARCHAR(2)
);

-- INSERTS on department table
INSERT INTO department VALUES(101, 'HR');
INSERT INTO department VALUES(102, 'IT');
INSERT INTO department VALUES(103, 'Finance');
INSERT INTO department VALUES(104, 'Marketing');

-- INSERTS on employee table
INSERT INTO employee VALUES(1, 'Alice', 50000, 101);
INSERT INTO employee VALUES(2, 'Bob', 45000, 102);
INSERT INTO employee VALUES(3, 'Charlie', 60000, NULL);
INSERT INTO employee VALUES(4, 'Diana', 48000, 101);
INSERT INTO employee VALUES(5, 'Eve', 70000, 103);
INSERT INTO employee VALUES(6, 'Frank', 65000, 105);

-- INSERTS on professor table
INSERT INTO professor VALUES(1, 'Alice', 50000, 3);
INSERT INTO professor VALUES(2, 'Bob', 45000, NULL);
INSERT INTO professor VALUES(3, 'Charlie', 60000, NULL);
INSERT INTO professor VALUES(4, 'Diana', 48000, 2);
INSERT INTO professor VALUES(5, 'Eve', 70000, NULL);
INSERT INTO professor VALUES(6, 'Frank', 65000, 5);
INSERT INTO professor VALUES(7, 'Henry', 55000, 3);

-- INSERTs on worker table
INSERT INTO worker VALUES(1, 'Alice', 24500);
INSERT INTO worker VALUES(2, 'Bob', 16900);
INSERT INTO worker VALUES(3, 'Charlie', 40000);
INSERT INTO worker VALUES(4, 'Diana', 35650);
INSERT INTO worker VALUES(5, 'Eve', 12000);
INSERT INTO worker VALUES(6, 'Frank', 29990);
INSERT INTO worker VALUES(7, 'Henry', 47670);

-- INSERTs on payment table
INSERT INTO payment VALUES(40000, 49999, 'A');
INSERT INTO payment VALUES(30000, 39999, 'B');
INSERT INTO payment VALUES(20000, 29999, 'C');
INSERT INTO payment VALUES(10000, 19999, 'D');

SELECT * FROM employee;
SELECT * FROM department;
SELECT * FROM professor;
SELECT * FROM worker;
SELECT * FROM payment;


--joins

--inner join
SELECT * FROM 
employee JOIN department ON employee.d_id = department.dept_id;

SELECT employee.name , employee.d_id, department.dept_name FROM 
employee JOIN department ON employee.d_id = department.dept_id;

select d.dept_name,COUNT(*) 
from employee e join department d 
on e.d_id = d.dept_id 
group by d.dept_name;

--left outer join
--joins the left and right table but displays null,
--where data is not present in left table
select * from 
employee e left join department d 
on e.d_id = d.dept_id;

--right outer join
--joins the left and right table but displays null,
--where data is not present in right table
select * from 
employee e right join department d 
on e.d_id = d.dept_id;

--full outer join
--join left and right lefts displaing all the data and null,
--where data is not present on both
select * from 
employee e full outer join department d 
on e.d_id = d.dept_id;


--self join
--joins the table to itself
select p1.pro_id as Professor_id, p1.name as Professor_name, p2.pro_id as HOD_id, p2.name as HOD_name from 
professor p1 join professor p2 
on p1.hod_id = p2.pro_id;

select * from professor;

--theta join
--joins based on conditons 
select * from worker;
select * from payment;

SELECT w.WORKER_ID, w.name, w.salary, p.GRADE FROM
worker w, payment p
WHERE w.salary >= p.min_salary 
AND w.salary <= p.max_salary;

SELECT p.grade , count(w.WORKER_ID) FROM
worker w join payment p
ON w.salary >= p.min_salary 
AND w.salary <= p.max_salary
GROUP BY p.grade;