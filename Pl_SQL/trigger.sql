-- CREATE OR REPLACE TRIGGER
-- trigger_name
-- [BEFORE | AFTER] -- firing action
-- [INSERT | UPDATE | DELETE] -- DML Operation
-- [FOR EACH ROW] -- ROW LEVEL trigger
drop table customers;
CREATE TABLE customers(
    c_id number PRIMARY key,
    c_name VARCHAR2(40),
    email VARCHAR2(50)
);
INSERT INTO CUSTOMERS VALUES
(1,'alice','alice@gmail.com'),
(2,'bob','bob@gmail.com'),
(3,'charlie','charlie@gmail.com'),
(4,'daina','daina@gmail.com'),
(5,'frank','frank@gmail.com');

SELECT * from CUSTOMERS;

CREATE TABLE products(
    p_id number PRIMARY key,
    p_name VARCHAR2(40) not null,
    price number not null
);
insert into PRODUCTs VALUES
(1,'laptop',60000),
(2,'table',8000),
(3,'mouse',1000),
(4,'keyboard',3000),
(5,'tablet',36000);


SELECT * from PRODUCTs;
-- drop TABLE orders;
create table orders(
    ord_id number PRIMARY key,
    customer_id NUMBER REFERENCES customers(c_id),
    product_id NUMBER REFERENCES products(p_id),
    quantity NUMBER not null
);

create table invoices(
    inv_id varchar2(12),
    order_id number REFERENCES orders(ord_id),
    invoice_date date DEFAULT CURRENT_DATE,
    total_amount number not null
);

-- for preety strinng
--number generations
create sequence inv start with 1 increment by 1;
-- alter SEQUENCE inv restart start with 1;


-- funtion
create or REPLACE function
getInvoiceId RETURN VARCHAR2 IS
BEGIN
    RETURN 'INV-' || LPAD(inv.NEXTVAL, 5, 0);
end;
/
-- SELECT GETINVOICEID() from dual;

--trigger
CREATE or replace trigger 
inv_gen After INSERT on orders
for each ROW
BEGIN
    --body
    insert into INVOICES(INV_ID,ORDER_ID,TOTAL_AMOUNT)
    VALUES(GETINVOICEID(),
    :new.ord_id,
    :new.quantity * (select price from PRODUCTS where 
    PRODUCTS.P_ID = :new.product_id));
end;
/

SELECT * from orders;
select * from INVOICES;

INSERT into orders values(101,1,3,10);
INSERT into orders values(102,4,1,15);
INSERT into orders values(103,3,4,100);
INSERT into orders values(104,1,2,1);

-- create a view which fetch the customer name and number of order they place
create or replace view number_of_orders as
with cte as (
SELECT o.CUSTOMER_ID,c.C_NAME , COUNT(*) from
orders o join customers c on
customer_id = c_id
group by o.CUSTOMER_ID,c.C_NAME
) select * from cte;
-- drop view number_of_orders;


select * from NUMBER_OF_ORDERS;
