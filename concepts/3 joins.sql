-- Create the 'client' table
CREATE TABLE client (
    client_id NUMBER(3) PRIMARY KEY,
    client VARCHAR2(50) NOT NULL,
    contact_no VARCHAR2(15)
);

-- Insert values into the 'client' table
INSERT INTO client (client_id, client, contact_no) VALUES (888, 'Microsoft', '1234567890');
INSERT INTO client (client_id, client, contact_no) VALUES (999, 'Meta', '987654321');
INSERT INTO client (client_id, client, contact_no) VALUES (111, 'Google', '4444444444');

-- Create the 'projects' table
CREATE TABLE projects (
    Project_ID NUMBER(3) PRIMARY KEY,
    Project_Name VARCHAR2(100) NOT NULL,
    dead_line DATE,
    manager VARCHAR2(50),
    c_id NUMBER(3) REFERENCES client(client_id)
);

-- Insert values into the 'projects' table
INSERT INTO projects (Project_ID, Project_Name, dead_line, manager, c_id) VALUES (101, 'Excel Clone', TO_DATE('27-11-2025', 'DD-MM-YYYY'), 'ashok', 888);
INSERT INTO projects (Project_ID, Project_Name, dead_line, manager, c_id) VALUES (102, 'Facebook Clone', TO_DATE('01-01-2027', 'DD-MM-YYYY'), 'pawan', 999);
INSERT INTO projects (Project_ID, Project_Name, dead_line, manager, c_id) VALUES (103, 'Chrome clone', TO_DATE('17-03-2026', 'DD-MM-YYYY'), 'shaifu', 111);
INSERT INTO projects (Project_ID, Project_Name, dead_line, manager, c_id) VALUES (104, 'Word Clone', TO_DATE('19-06-2028', 'DD-MM-YYYY'), 'srinu', 888);

-- Create the 'intern' table
CREATE TABLE intern (
    intern_id NUMBER(3) PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    age NUMBER(3),
    email VARCHAR2(100) UNIQUE,
    p_id NUMBER(3) REFERENCES projects(Project_ID)       
);

-- Insert values into the 'intern' table
INSERT INTO intern (intern_id, name, age, email, p_id) VALUES (1, 'alice', 17, 'alice@gmail.com', 101);
INSERT INTO intern (intern_id, name, age, email, p_id) VALUES (2, 'bob', 18, 'bob@gmail.com', 102);
INSERT INTO intern (intern_id, name, age, email, p_id) VALUES (3, 'charlie', 19, 'charlie@gmail.com', 101);
INSERT INTO intern (intern_id, name, age, email, p_id) VALUES (4, 'david', 21, 'david@gmail.com', 102);
INSERT INTO intern (intern_id, name, age, email, p_id) VALUES (5, 'emmy', 22, 'emmy@gmail.com', 103);

SELECT * from client;
SELECT * from projects;
SELECT * from intern;

-- drop TABLE client;
-- drop table projects;
-- drop table intern;

-- 3 Joins
-- Select intername, project name, that is intern is working

SELECT c.CLIENT,count(n.name) FROM
projects p JOIN intern n ON p.project_id = n.p_id
JOIN client c ON p.C_ID = c.CLIENT_ID
group by c.CLIENT;