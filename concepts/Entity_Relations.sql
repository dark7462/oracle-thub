-- drop table student;
-- Strong Entity
CREATE TABLE student(
    name VARCHAR2(30),
    roll_no NUMBER PRIMARY KEY
);
INSERT INTO student VALUES ('Anurag',014);
INSERT INTO student VALUES ('Piyush',224);
INSERT INTO student VALUES ('Anupam',168);
select * from student;
--Week Entity
CREATE TABLE famliy(
    s_id NUMBER REFERENCES student(roll_no),
    fam_id NUMBER,
    M_name VARCHAR2(50),
    F_NAME vARCHAR(30),
    PRIMARY KEY (fam_id,s_id)
);

INSERT INTO famliy VALUES(014,1,'Sarita Devi','Rakesh kumar');
INSERT INTO famliy VALUES(168,1,'Sarita Devi','Rakesh kumar');
INSERT INTO famliy VALUES(224,2,'Susma Devi','Jagdesh singh');

SELECT * FROM FAMLIY;

SELECT * FROM
STUDENT s join FAMLIY f
ON s.ROLL_NO = f.S_ID;