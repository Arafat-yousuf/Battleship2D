SET VERIFY OFF;
SET SERVEROUTPUT ON;

ACCEPT X CHAR PROMPT "ENTER YOUR NAME= "

DECLARE
    pnam PLAYER.pname@site2%TYPE;
    cnt PLAYER.pid@site2%TYPE;
BEGIN
    pnam := '&X';
    select COUNT(pid) into cnt from PLAYER@site2;
    if (cnt<2) then
    insert into PLAYER@site2 (pid,pname,played,won,lost) values(cnt+1,pnam,0,0,0);
    DBMS_OUTPUT.PUT_LINE('WELCOME ' || pnam || '!! YOUR ID IS -- ' || (cnt+1));
    else 
        DBMS_OUTPUT.PUT_LINE('ACCOUNT ALREADY EXISTS!!');
    end if;
END;
/

commit;
select * from PLAYER@site2;
