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

-------------------------------------------------------------------------------------------------------------

-- acid principles

-- A-> Automaicity
    -- This states that either all the trancsactions are passed or all are failed
-- C-> Consitency
    -- This esures that any transaction must leaves the database in a consistent state
-- I-> Isolation
    -- Multiple transaction can take place on the database at once
    -- but they must behave in such a way that they have been applied a serial number
    -- database achieve isolation called serializalibity
    -- MAINTAINING LOGs in short
-- D-> Durability
-- all the SQL  vendors (oracle , postgreSQL, sql server) maintain these principle to be the ideal database for the users to use them
