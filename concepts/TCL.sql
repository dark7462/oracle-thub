-- ddl commands are auto commited 
-- for dml we have to commit it using (commit;) command


-- by defult yout database will be on CDB
-- change it to PDB (which we use genrally)

-- to change session
-- alter session set container = freepdb1

-- to check your session
-- show con_name; 

select * from emp;

show user; -- to cheak user
commit; -- to commit changes

select table_name from user_tables; -- to view all tables in user
CREATE TABLE temp (id INTEGER,name VARCHAR2(90));
INSERT INTO temp VALUES (1,'anurag');
INSERT INTO temp VALUES (2,'renu');

SELECT * from temp;
COMMIT;

-- rollback can undo things for the chnages after the commit 
-- imidiate rollback after the commit it's of no use
ROLLBACK;

-- will create a save point for the data base were we can rollback
SAVEPOINT a;
-- this is how we can rollback to save points
ROLLBACK to a;

DELETE FROM temp where id = 2; -- just to check how it works