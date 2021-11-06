set linesize 300;
SET VERIFY OFF;
SET SERVEROUTPUT ON;

ACCEPT X NUMBER PROMPT "ENTER YOUR ID= "

DECLARE
    cnt CPLAYER.pid%TYPE;
    cnt2 CPLAYER.pid%TYPE;
    gcnt CPLAYER.pid%TYPE;
    plid CPLAYER.pid%TYPE;
    opid CPLAYER.pid%TYPE;
    chk CPLAYER.pid%TYPE;
    pnam PLAYER.pname%TYPE;
    opnam PLAYER.pname%TYPE;
BEGIN
    plid:=&X;
    select COUNT(pone),COUNT(gid),COUNT(ptwo) into cnt,gcnt,cnt2 from GAME;
    --DBMS_OUTPUT.PUT_LINE(pnam);
    if cnt=cnt2 then
        select pname into pnam from PLAYER where pid=plid;
        select count(gid) into chk from GAME where won='N/A';
        if chk > 0 then
            DBMS_OUTPUT.PUT_LINE('ERROR!! YOU HAVE UNFINISHED GAME!');
        else
        insert into GAME (gid,pone,ponen) values(gcnt+1,plid,pnam);
        insert into CPLAYER (pid,phealth,pmiss,phit,turn) values(plid,2,0,0,0);
        DBMS_OUTPUT.PUT_LINE(pnam || ', PLEASE WAIT FOR OPPONENT PLAYER');
        end if;
    elsif cnt>cnt2 then
        select pone into opid from GAME where gid = gcnt;
        select pname into pnam from PLAYER where pid=plid;
        select pname into opnam from PLAYER where pid=opid;
        insert into CPLAYER (pid,phealth,pmiss,phit,turn) values(plid,2,0,0,1);
        update GAME set ptwo = plid,ptwon=pnam,time = (SELECT TO_CHAR (Sysdate, 'DD-MON-YYYY HH24:MI:SS') FROM Dual), won='N/A' where gid = gcnt;
        DBMS_OUTPUT.PUT_LINE('GET READY, '|| pnam || '!! YOUR GAME STARTED WITH ' || opnam);
    end if;

    EXCEPTION
	    WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('YOU ARE NOT REGISTERED!!!');
    --insert into PLAYER (pid,pname,played,won,lost,accuracy) values(cnt+1,pnam,0,0,0,0);
    --DBMS_OUTPUT.PUT_LINE(sysdate);
END;
/

commit;
select * from PLAYER;
select * from CPLAYER;
select * from GAME;

@"C:\Development\Battleship2D\Site1\createboard.sql"