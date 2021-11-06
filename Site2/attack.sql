SET VERIFY OFF;
SET SERVEROUTPUT ON;

ACCEPT X CHAR PROMPT "Select Column of Your Desired Attack Slot= "
ACCEPT Y NUMBER PROMPT "Select Row of Your Desired Attack Slot= "

DECLARE
    Ac BOARD.A%TYPE;
    Ar BOARD.rid%TYPE;
    pos BOARD.A%TYPE;
    flag BOARD.A%TYPE;
    pi BOARD.rid%TYPE;
    opi BOARD.rid%TYPE;
    pturn BOARD.rid%TYPE;
BEGIN
    Ac := '&X';
    Ar := &Y;
    pi := 2;
    opi := 1;
    flag := '-';
    select turn into pturn from CPLAYER@site2 where pid = pi;
    if pturn = 0 then
        DBMS_OUTPUT.PUT_LINE('NOT YOUR TURN!!!');
    elsif Ac='A' then
    select BOARD.A into pos from Board@site2 where rid = Ar;
        if pos = 'X' or pos = 'O' then
            DBMS_OUTPUT.PUT_LINE('ERROR! YOU HAVE ALREADY ATTACKED THIS SLOT!');
        elsif pos= '-' then
            update BOARD@site2 set A='O' where rid=Ar;
            DBMS_OUTPUT.PUT_LINE('MISS!!');
            flag:='O';
            gamepack.updateplayerstat(flag,pi,opi);
            gamepack.viewboard(flag,Ac,Ar);
        else
            update BOARD@site2 set A='X' where rid=Ar;
            flag:='X';
            gamepack.hitship(pos);
            gamepack.checkship(pos);
            gamepack.updateplayerstat(flag,pi,opi);
            gamepack.viewboard(flag,Ac,Ar);
        end if;
    elsif Ac='B' then
    select BOARD.B into pos from Board@site2 where rid = Ar;
        if pos = 'X' or pos = 'O' then
            DBMS_OUTPUT.PUT_LINE('ERROR! YOU HAVE ALREADY ATTACKED THIS SLOT!');
        elsif pos= '-' then
            update BOARD@site2 set B='O' where rid=Ar;
            DBMS_OUTPUT.PUT_LINE('MISS!!');
            flag:='O';
            gamepack.updateplayerstat(flag,pi,opi);
            gamepack.viewboard(flag,Ac,Ar);
        else
            update BOARD@site2 set B='X' where rid=Ar;
            flag:='X';
            gamepack.hitship(pos);
            gamepack.checkship(pos);
            gamepack.updateplayerstat(flag,pi,opi);
            gamepack.viewboard(flag,Ac,Ar);
        end if;
    elsif Ac='C' then
    select BOARD.C into pos from Board@site2 where rid = Ar;
        if pos = 'X' or pos = 'O' then
            DBMS_OUTPUT.PUT_LINE('ERROR! YOU HAVE ALREADY ATTACKED THIS SLOT!');
        elsif pos= '-' then
            update BOARD@site2 set C='O' where rid=Ar;
            DBMS_OUTPUT.PUT_LINE('MISS!!');
            flag:='O';
            gamepack.updateplayerstat(flag,pi,opi);
            gamepack.viewboard(flag,Ac,Ar);
        else
            update BOARD@site2 set C='X' where rid=Ar;
            flag:='X';
            gamepack.hitship(pos);
            gamepack.checkship(pos);
            gamepack.updateplayerstat(flag,pi,opi);
            gamepack.viewboard(flag,Ac,Ar);
        end if;
    elsif Ac='D' then
    select BOARD.D into pos from Board@site2 where rid = Ar;
        if pos = 'X' or pos = 'O' then
            DBMS_OUTPUT.PUT_LINE('ERROR! YOU HAVE ALREADY ATTACKED THIS SLOT!');
        elsif pos= '-' then
            update BOARD@site2 set D='O' where rid=Ar;
            DBMS_OUTPUT.PUT_LINE('MISS!!');
            flag:='O';
            gamepack.updateplayerstat(flag,pi,opi);
            gamepack.viewboard(flag,Ac,Ar);
        else
            update BOARD@site2 set D='X' where rid=Ar;
            flag:='X';
            gamepack.hitship(pos);
            gamepack.checkship(pos);
            gamepack.updateplayerstat(flag,pi,opi);
            gamepack.viewboard(flag,Ac,Ar);
        end if;
    elsif Ac='E' then
    select BOARD.E into pos from Board@site2 where rid = Ar;
        if pos = 'X' or pos = 'O' then
            DBMS_OUTPUT.PUT_LINE('ERROR! YOU HAVE ALREADY ATTACKED THIS SLOT!');
        elsif pos= '-' then
            update BOARD@site2 set E='O' where rid=Ar;
            DBMS_OUTPUT.PUT_LINE('MISS!!');
            flag:='O';
            gamepack.updateplayerstat(flag,pi,opi);
            gamepack.viewboard(flag,Ac,Ar);
        else
            update BOARD@site2 set E='X' where rid=Ar;
            flag:='X';
            gamepack.hitship(pos);
            gamepack.checkship(pos);
            gamepack.updateplayerstat(flag,pi,opi);
            gamepack.viewboard(flag,Ac,Ar);
        end if;
    elsif Ac='F' then
    select BOARD.F into pos from Board@site2 where rid = Ar;
        if pos = 'X' or pos = 'O' then
            DBMS_OUTPUT.PUT_LINE('ERROR! YOU HAVE ALREADY ATTACKED THIS SLOT!');
        elsif pos= '-' then
            update BOARD@site2 set F='O' where rid=Ar;
            DBMS_OUTPUT.PUT_LINE('MISS!!');
            flag:='O';
            gamepack.updateplayerstat(flag,pi,opi);
            gamepack.viewboard(flag,Ac,Ar);
        else
            update BOARD@site2 set F='X' where rid=Ar;
            flag:='X';
            gamepack.hitship(pos);
            gamepack.checkship(pos);
            gamepack.updateplayerstat(flag,pi,opi);
            gamepack.viewboard(flag,Ac,Ar);
        end if;
    end if;


END;
/

commit;
select * from BOARD;
select * from OBOARD;
select * from SHIP;
select * from PLAYER@site2;
select * from CPLAYER@site2;
select * from GAME@site2;