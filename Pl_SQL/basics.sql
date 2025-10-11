--pl/sql is only for oracle 

--DECLARE (Optional)
--BEGIN (Mandetory)
--EXCEPTION (Optional)
SET SERVEROUTPUT ON; -- use this to fetch output from the sql server else the pl will not exicute

BEGIN
    DBMS_OUTPUT.PUT_LINE('HELLO WORLD');
    DBMS_OUTPUT.PUT_LINE('hello');
END;
/

DECLARE
    Radius NUMBER;
    Area NUMBER;
    Perimeter NUMBER;
BEGIN
    Radius := &val3;
    Area := 3.14 * Radius * Radius;
    Perimeter := 2 * 3.14 * Radius;
    DBMS_OUTPUT.PUT_LINE('Area : ' || Area);
    DBMS_OUTPUT.PUT_LINE('Perimeter : ' || Perimeter);
END;
/

select * from EMPLOYEE;

--pl sql in tables
DECLARE
    sal1 NUMBER;
    sal2 NUMBER;
    sal_sum NUMBER;
BEGIN
    SELECT salary INTO sal1 FROM employee WHERE id = 1;
    SELECT salary INTO sal2 FROM employee WHERE id = 2;
    sal_sum := sal1 + sal2;
    DBMS_OUTPUT.PUT_LINE('sum is ' || sal_sum);
END;
/

DECLARE
    num number;
    name varchar2(40);
    join_date date;
    birth_date date;
    days number;
BEGIN
    num := 190;
    name := 'Anurag';
    join_date := CURRENT_DATE;
    birth_date := to_date('01-01-1999','dd-mm-yyyy');
    dbms_output.put_line('number : ' || num);
    dbms_output.put_line('Name : ' || name);
    dbms_output.put_line('Joining Date : ' || join_date);
    dbms_output.put_line('birht Date : ' || birth_date);
    dbms_output.put_line('Joining year : ' || TO_CHAR (join_date, 'YYYY'));
    days := CURRENT_DATE - birth_date;
    DBMS_OUTPUT.PUT_LINE('AGE : ' || round(days/365,2));
END;
/

--if else
DECLARE
    age number;
BEGIN
    age := 19;
    if(age > 18) THEN
        DBMS_OUTPUT.PUT_LINE('You can vote');
    end if;
END;
/

--smallest of 3 number
DECLARE
    a number;
    b number;
    c number;
    min number;
BEGIN
    a := 1;
    b := 10;
    c := 5;
    if(a < b and a < c) then
        min := a;
    ELSIF(b < c and b < a) then
        min := b;
    ELSIF(c < b and c < a) THEN
        min := c;
    END IF;
    DBMS_OUTPUT.PUT_LINE('Minimun : ' || min);
END;
/

--even odd
DECLARE
    n number;
BEGIN
    n := 11;
    if (mod(n,2) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('Even');
    else 
        DBMS_OUTPUT.PUT_LINE('odd');
    end if;
end;
/

--loop
DECLARE
    i number;
    n number;
BEGIN
    i := 2;
    n := 100;
    DBMS_OUTPUT.PUT_LINE('1');
    while (i <= n/2) LOOP
        if(mod(n,i) = 0) THEN
            DBMS_OUTPUT.PUT_LINE(i);
        end if;
        i := i + 1;
    end loop;
end;
/
--palindrom
DECLARE
    n number;
    m number;
    dig number;
    temp NUMBER;
BEGIN
    n := 121;
    temp := n;
    m := 0;
    while(temp != 0) LOOP
        dig := mod(temp,10);
        m := m*10 + dig;
        temp := temp /  10;
    end loop;
    if(n = m) THEN
        DBMS_OUTPUT.PUT_LINE('Palindrom');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('not palindrome');
    end if;
end;
/