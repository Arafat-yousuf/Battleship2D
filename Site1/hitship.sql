create or replace procedure hitship (sn in SHIP.snick%TYPE)
is

BEGIN    
    update SHIP@site1 set shealth = shealth-1 where snick = sn;
    DBMS_OUTPUT.PUT_LINE('HIT!!');
END;
/