--Views are virtual tables
--used to shorten the query
select * from EMPLOYEE;


-- a temp table 
with cte as(
    select id, name, salary, department, 
rank() over(PARTITION by department order BY salary DESC)
as rank from EMPLOYEE
where SALARY is not null
)
select * from cte;

-- now storing the whole temp table under one name
create view highest_salary AS
with cte as(
    select id, name, salary, department, 
rank() over(PARTITION by department order BY salary DESC)
as rank from EMPLOYEE
where SALARY is not null
)
select * from cte where rank = 1;

-- now fetch data
select * from HIGHEST_SALARY;
-- this will automatic exicute the above table not just store it statically


--Views for orders

create or replace view order_cnt as
select c.c_name, p.p_name, COUNT(*) as cnt from 
orders o join customers c 
on o.CUSTOMER_ID = c.C_ID
join 
products p
on p.p_id = o.PRODUCT_ID
group by c.c_name, p.p_name;

select * from order_cnt;

--Types of Views
--Updatable views
--Views that allow you to write update statement on an table through view
-- this can only be done in a view that is plain view (no join, no group by, nothing will work)
create or replace view ops_emp as 
select id, name, salary, department, gender -- this kind of simple view comes under updatable view
from EMPLOYEE where department = 'Operations';

select * from ops_emp;

UPDATE OPS_EMP  -- we are performing update on a view but it'll effect the main table
set GENDER = 'Male' 
where id = 17;

--Non updatable view
-- view having group by and order by or is a adv view is non-updatable view

create or replace view dept_cnt AS
SELECT department , COUNT(*) as cnt from EMPLOYEE
group by department; -- views having group by or any deraived column is non-updatable view
-- view having group by and order by or is a adv view is non-updatable view
select * from dept_cnt;

--Materialzed view
--views that permanenty stores your data in the form of a table dosn't refreshs until we do it mannually
create MATERIALIZED view dept_cnt_per AS
SELECT department , COUNT(*) as cnt from EMPLOYEE
group by department;

SELECT * from dept_cnt_per;
update EMPLOYEE
set department = 'HR' where id = 2;

SELECT * from dept_cnt_per; -- even after updating it still shows the prev values to udate it you need to refresh it by a PL/SQL procedure

BEGIN
    DBMS_MVIEW.REFRESH('dept_cnt_per');
END;
/

SELECT * from dept_cnt_per; -- now it'll be updated