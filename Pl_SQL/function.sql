--functions are permanent in sql once created can be used for lifetime
create FUNCTION wish(name VARCHAR2, gender VARCHAR2)
RETURN VARCHAR2 IS
    res VARCHAR2(200);
BEGIN
    IF (gender = 'Male') THEN
        res := 'Hello Mr. ' || name;
    ELSE
        res := 'Hello Ms. ' || name;
    END IF;
    RETURN res;
END;
/

create FUNCTION add_two(a NUMBER, b NUMBER) 
RETURN NUMBER IS --DECLARE
    c NUMBER;
BEGIN
    c := a+b;
    RETURN c;
END;
/