create or replace procedure viewboard (res in BOARD.A%TYPE, co in BOARD.A%TYPE, ro in BOARD.rid%TYPE)
is

    --Col BOARD.A%TYPE;

BEGIN
    FOR R in (SELECT A,B,C,D,E,F FROM OBOARD) LOOP
        if co = 'A' then
            update OBOARD set A=res where orid=ro;
        elsif co = 'B' then
            update OBOARD set B=res where orid=ro;
        elsif co = 'C' then
            update OBOARD set C=res where orid=ro;
        elsif co = 'D' then
            update OBOARD set D=res where orid=ro;
        elsif co = 'E' then
            update OBOARD set E=res where orid=ro;
        elsif co = 'F' then
            update OBOARD set F=res where orid=ro;
        end if;
    END LOOP; 
    --DBMS_OUTPUT.PUT_LINE('A');
END viewboard;
/
