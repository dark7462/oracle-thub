CREATE TABLE teams (
    team_code VARCHAR2(5) PRIMARY KEY,
    team_name VARCHAR2(50) UNIQUE,
    team_leader VARCHAR2(50),
    team_id NUMBER CHECK (team_id > 100)
);

INSERT INTO teams VALUES('SDE','Software_devloping_team','Vishnu',101);
INSERT INTO teams VALUES('SRE','Site_Relibility_team','Priyansh',102);
INSERT INTO teams VALUES('UIUX','Front_end_team','Anurag',103);

SELECT * FROM teams;

CREATE TABLE emp (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(100),
    emp_team_code VARCHAR2(5) REFERENCES teams (team_code)
);

INSERT INTO emp VALUES
    (20251,'Anurag','UIUX'),
    (20252,'Renuka','SDE'),
    (20253,'Piyush','SRE')
;

SELECT * FROM emp;
drop table teams;