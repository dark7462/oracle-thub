CREATE TABLE users(
    u_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    dob DATE,
    gender VARCHAR2(1) CHECK (gender == 'M' OR gender == 'F' OR gender == 'm' OR gender == 'f'),
    rating NUMBER
);
CREATE TABLE contest(
    c_id NUMBER PRIMARY KEY,
    c_type VARCHAR2 NOT NULL,
    c_name VARCHAR2 NOT NULL,
    c_date DATE NOT NULL
);
CREATE TABLE que(
    q_id NUMBER PRIMARY KEY,
    q_name VARCHAR2(30) NOT NULL,
    rating NUMBER NOT NULL,
    con_id NUMBER REFERENCES contest(c_id) NOT NULL
);
CREATE TABLE submissions(
    s_id NUMBER PRIMARY KEY,
    lang_used VARCHAR2(10) NOT NULL,
    status VARCHAR2(20),
    sub_time DATE NOT NULL,
    user_id NUMBER REFERENCES users(u_id) NOT NULL,
    sub_id NUMBER REFERENCES submissions(s_id) NOT NULL
);