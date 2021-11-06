create or replace procedure checkship (sn in SHIP.snick%TYPE)
is
--DECLARE
    shlth SHIP.shealth%TYPE;
    name SHIP.sname%TYPE;

BEGIN
    select SHIP.shealth,SHIP.sname  into shlth, name from SHIP@site2 where snick=sn;
    if shlth=0 then
        DBMS_OUTPUT.PUT_LINE('YOU HAVE SUNK THE ' || name || '!!');
    end if;
    --DBMS_OUTPUT.PUT_LINE(sn);
END;
/

