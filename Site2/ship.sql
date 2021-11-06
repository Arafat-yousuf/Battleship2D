SET VERIFY OFF;
SET SERVEROUTPUT ON;
BEGIN
    DBMS_OUTPUT.PUT_LINE('1. Frigate');
    DBMS_OUTPUT.PUT_LINE('2. Submarine');
    DBMS_OUTPUT.PUT_LINE('3. Cruiser');
    DBMS_OUTPUT.PUT_LINE('4. U-Boat');
END;
/
ACCEPT Z NUMBER PROMPT "Select Ship you want to place = "
ACCEPT X CHAR PROMPT "Insert Ship's Column Position = "
ACCEPT Y NUMBER PROMPT "Insert Ship's Row Position = "
DECLARE
    Cp BOARD.A%TYPE;
    test BOARD.A%TYPE;
    Rp BOARD.rid%TYPE;
    flag BOARD.rid%TYPE;
    shId SHIP.sid%TYPE;
    shLen SHIP.slen%TYPE;
    sflag SHIP.scnt%TYPE;

BEGIN
    shId := &Z;
    Cp := '&X';
    Rp := &Y;
    flag :=0;
    select SHIP.slen into shLen from SHIP where sid = shId;
    shLen:=shLen-1;
    select SHIP.scnt into sFlag from SHIP where sid = shId;
    if (Rp+shLen)>6 then
        DBMS_OUTPUT.PUT_LINE('ERROR! SHIP WILL EXCEED THE BOARD!');
    elsif Cp='A' then
        -- DBMS_OUTPUT.PUT_LINE(C);
        for j in Rp..Rp+shLen loop
            select BOARD.A into test from Board where rid = j;
            if test != '-' then
                flag := 1;
                exit;
            end if;
        end loop;
        if flag = 1 then
            DBMS_OUTPUT.PUT_LINE('ERROR! ANOTHER SHIP EXISTS!');
        elsif sflag=1 then
            DBMS_OUTPUT.PUT_LINE('ERROR! SHIP ALREADY EXISTS!');
        else 
            for i in Rp..Rp+shLen loop
            update BOARD set A=(select SHIP.snick from SHIP where sid = shId) where rid = i;
            end loop;
            update SHIP set scnt=1 where sid=shId;
        end if;
    elsif Cp='B' then
        for j in Rp..Rp+shLen loop
            select BOARD.B into test from Board where rid = j;
            if test != '-' then
                flag := 1;
                exit;
            end if;
        end loop;
        if flag = 1 then
            DBMS_OUTPUT.PUT_LINE('ERROR! ANOTHER SHIP EXISTS!');
        elsif sflag=1 then
            DBMS_OUTPUT.PUT_LINE('ERROR! SHIP ALREADY EXISTS!');
        else 
            for i in Rp..Rp+shLen loop
            update BOARD set B=(select SHIP.snick from SHIP where sid = shId) where rid = i;
            end loop;
            update SHIP set scnt=1 where sid=shId;
        end if;
    elsif Cp='C' then
        for j in Rp..Rp+shLen loop
            select BOARD.C into test from Board where rid = j;
            if test != '-' then
                flag := 1;
                exit;
            end if;
        end loop;
        if flag = 1 then
            DBMS_OUTPUT.PUT_LINE('ERROR! ANOTHER SHIP EXISTS!');
        elsif sflag=1 then
            DBMS_OUTPUT.PUT_LINE('ERROR! SHIP ALREADY EXISTS!');
        else 
            for i in Rp..Rp+shLen loop
            update BOARD set C=(select SHIP.snick from SHIP where sid = shId) where rid = i;
            end loop;
            update SHIP set scnt=1 where sid=shId;
        end if;
    elsif Cp='D' then
        for j in Rp..Rp+shLen loop
            select BOARD.D into test from Board where rid = j;
            if test != '-' then
                flag := 1;
                exit;
            end if;
        end loop;
        if flag = 1 then
            DBMS_OUTPUT.PUT_LINE('ERROR! ANOTHER SHIP EXISTS!');
        elsif sflag=1 then
            DBMS_OUTPUT.PUT_LINE('ERROR! SHIP ALREADY EXISTS!');
        else 
            for i in Rp..Rp+shLen loop
            update BOARD set D=(select SHIP.snick from SHIP where sid = shId) where rid = i;
            end loop;
            update SHIP set scnt=1 where sid=shId;
        end if;
    elsif Cp='E' then
        for j in Rp..Rp+shLen loop
            select BOARD.E into test from Board where rid = j;
            if test != '-' then
                flag := 1;
                exit;
            end if;
        end loop;
        if flag = 1 then
            DBMS_OUTPUT.PUT_LINE('ERROR! ANOTHER SHIP EXISTS!');
        elsif sflag=1 then
            DBMS_OUTPUT.PUT_LINE('ERROR! SHIP ALREADY EXISTS!');
        else 
            for i in Rp..Rp+shLen loop
            update BOARD set E=(select SHIP.snick from SHIP where sid = shId) where rid = i;
            end loop;
            update SHIP set scnt=1 where sid=shId;
        end if;
    elsif Cp='F' then
        for j in Rp..Rp+shLen loop
            select BOARD.F into test from Board where rid = j;
            if test != '-' then
                flag := 1;
                exit;
            end if;
        end loop;
        if flag = 1 then
            DBMS_OUTPUT.PUT_LINE('ERROR! ANOTHER SHIP EXISTS!');
        elsif sflag=1 then
            DBMS_OUTPUT.PUT_LINE('ERROR! SHIP ALREADY EXISTS!');
        else 
            for i in Rp..Rp+shLen loop
            update BOARD set F=(select SHIP.snick from SHIP where sid = shId) where rid = i;
            end loop;
            update SHIP set scnt=1 where sid=shId;
        end if;
    end if;
    -- DBMS_OUTPUT.PUT_LINE(C);
    /*else 
        for i in Rp..Rp+3 loop
        select BOARD.Cp into test from Board where rid = i;
        if test!='-' then
        flag :=1;
        DBMS_OUTPUT.PUT_LINE('ERROR! SHIP WILL EXCEED THE BOARD!');
        end if;
        exit;
        end loop; 
    end if;
    
*/
END;
/
commit;
select * from BOARD;