drop table costumer;
create table costumer(
    c_id number PRIMARY key,
    c_name VARCHAR2(60)
);
create table product(
    p_id NUMBER PRIMARY KEY,
    p_name VARCHAR2(50),
    price NUMBER
);
insert into COSTUMER VALUES(1,'Alice');
insert into COSTUMER VALUES(2,'Bob');
insert into COSTUMER VALUES(3,'charlie');

insert into product values(101,'Laptop',56000);
insert into product values(102,'Table',8000);
insert into product values(103,'Mouse',500);

SELECT * from PRODUCT;
-- drop table orders;
create table orders(
    ord_id VARCHAR2(15) PRIMARY  key,
    costumer_id number REFERENCES costumer(c_id),
    product_id number REFERENCES product(p_id),
    ord_date date DEFAULT CURRENT_DATE
);

-- Sequence 
-- it's used to make a sequence and help us to generate the number without much manual hustal
create sequence my_sq start with 1 increment by 1;
alter SEQUENCE my_sq restart start with 1;

select 'ORD-' || LPAD(my_sq.NEXTVAL, 5, 0); --checking

--function for the new order id's
CREATE FUNCTION new_ordId
RETURN varchar2 is
BEGIN
    return 'ORD-' || LPAD(my_sq.NEXTVAL, 5, 0);
END;
/

insert into orders (ORD_ID,COSTUMER_ID,PRODUCT_ID) VALUES
(new_ordId(),1,102),
(new_ordId(),2,101),
(new_ordId(),2,103);

select * from orders;
 
--Procedures are just like funtions but without a return statement
--and same as functions procedure are premanently stored in the database
CREATE OR REPLACE PROCEDURE first_procedure (a IN NUMBER) IS
BEGIN
    for i in 1..a loop
        DBMS_OUTPUT.put(i || ' ');
    end loop;
    DBMS_OUTPUT.NEW_LINE();
end;
/

EXEC FIRST_PROCEDURE(100); -- bow to execute a procedure

--alternate for return in procedure ( in can't be changed but out can and it'll change accoring to the procedure)
create or replace PROCEDURE pow(a in number, b out number) IS
BEGIN
    b := a * a;
end;
/

DECLARE
    input number;
    output number;
begin
    input := 10;
    pow(input,output);
    dbms_output.put_line(output);
end;
/


select * from EMPLOYEE;

-- real use case of a procedure
create or replace PROCEDURE update_sal(empid in number, sal in number) IS
begin 
    UPDATE employee 
    set SALARY = sal
    where ID = empid;
end;
/
--drop procedure <procedure_name>
--same for a funtion too


exec UPDATE_SAL(1,60000);