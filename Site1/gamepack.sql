SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE gamepack AS
    procedure updateplayerstat (res in BOARD.A%TYPE, pi in BOARD.rid%TYPE, opi in BOARD.rid%TYPE);
    procedure viewboard (res in BOARD.A%TYPE, co in BOARD.A%TYPE, ro in BOARD.rid%TYPE);
    procedure hitship (sn in SHIP.snick%TYPE);
    procedure checkship (sn in SHIP.snick%TYPE);

END gamepack;
/

CREATE OR REPLACE PACKAGE BODY gamepack AS

    
    
    procedure updateplayerstat (res in BOARD.A%TYPE, pi in BOARD.rid%TYPE, opi in BOARD.rid%TYPE)
is
    thealth CPLAYER.phealth%type;
    pam PLAYER.pname%type;
    gaid PLAYER.pid%type;

BEGIN 

    
    if res='X' then
        update CPLAYER set phealth=phealth-1,turn=turn+1 where pid = opi;
        update CPLAYER set phit=phit+1,turn=turn-1 where pid = pi;
    elsif res='O' then
        update CPLAYER set  pmiss=pmiss+1,turn=turn-1 where pid = pi;
        update CPLAYER set turn=turn+1 where pid = opi;
    end if;

    select phealth into thealth from CPLAYER where pid = opi;
    if thealth = 0 then
        select pname into pam from PLAYER where pid = pi;
        select gid into gaid from GAME where won = 'N/A';
        update GAME set won = pam where gid = gaid;
        update PLAYER set played = played+1, won=won+1 where pid = pi;
        update PLAYER set played = played+1, lost=lost+1 where pid = opi;
        delete from CPLAYER;
        DBMS_OUTPUT.PUT_LINE(pam || ' WINS THE GAME!!!');
        DBMS_OUTPUT.PUT_LINE('-----------------------');
        DBMS_OUTPUT.PUT_LINE('****GAME OVER***');
    end if;
    --DBMS_OUTPUT.PUT_LINE('A');
END updateplayerstat;

    
    
    
    procedure viewboard (res in BOARD.A%TYPE, co in BOARD.A%TYPE, ro in BOARD.rid%TYPE)
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


    
    
    procedure hitship (sn in SHIP.snick%TYPE)
is

BEGIN    
    update SHIP@site1 set shealth = shealth-1 where snick = sn;
    DBMS_OUTPUT.PUT_LINE('HIT!!');
END hitship;

    
    
    
    
    
    procedure checkship (sn in SHIP.snick%TYPE)
is
--DECLARE
    shlth SHIP.shealth%TYPE;
    name SHIP.sname%TYPE;

BEGIN
    select SHIP.shealth,SHIP.sname  into shlth, name from SHIP@site1 where snick=sn;    
    if shlth=0 then
        DBMS_OUTPUT.PUT_LINE('YOU HAVE SUNK THE ' || name || '!!');
    end if;
    --DBMS_OUTPUT.PUT_LINE(sn);
END checkship;

END gamepack;
/

@"C:\Development\Battleship2D\Site1\trigger.sql"