set linesize 300;
SET VERIFY OFF;
SET SERVEROUTPUT ON;

ACCEPT X NUMBER PROMPT "ENTER YOUR ID= "

DECLARE
    cnt CPLAYER.pid@site2%TYPE;
    cnt2 CPLAYER.pid@site2%TYPE;
    gcnt CPLAYER.pid@site2%TYPE;
    plid CPLAYER.pid@site2%TYPE;
    opid CPLAYER.pid@site2%TYPE;
    chk CPLAYER.pid@site2%TYPE;
    pnam PLAYER.pname@site2%TYPE;
    opnam PLAYER.pname@site2%TYPE;
BEGIN
    plid:=&X;
    select COUNT(pone),COUNT(gid),COUNT(ptwo) into cnt,gcnt,cnt2 from GAME@site2;
    --DBMS_OUTPUT.PUT_LINE(pnam);
    if cnt=cnt2 then
        select pname into pnam from PLAYER@site2 where pid=plid;
        select count(gid) into chk from GAME@site2 where won='N/A';
        if chk > 0 then
            DBMS_OUTPUT.PUT_LINE('ERROR!! YOU HAVE UNFINISHED GAME!');
        else
        insert into GAME@site2 (gid,pone,ponen) values(gcnt+1,plid,pnam);
        insert into CPLAYER@site2 (pid,phealth,pmiss,phit,turn) values(plid,2,0,0,0);
        DBMS_OUTPUT.PUT_LINE(pnam || ', PLEASE WAIT FOR OPPONENT PLAYER');
        end if;
    elsif cnt>cnt2 then
        select pone into opid from GAME@site2 where gid = gcnt;
        select pname into pnam from PLAYER@site2 where pid=plid;
        select pname into opnam from PLAYER@site2 where pid=opid;
        insert into CPLAYER@site2 (pid,phealth,pmiss,phit,turn) values(plid,2,0,0,1);
        update GAME@site2 set ptwo = plid,ptwon=pnam,time = (SELECT TO_CHAR (Sysdate, 'DD-MON-YYYY HH24:MI:SS') FROM Dual), won='N/A' where gid = gcnt;
        DBMS_OUTPUT.PUT_LINE('GET READY, '|| pnam || '!! YOUR GAME STARTED WITH ' || opnam);
    end if;

    /*EXCEPTION
	    WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('YOU ARE NOT REGISTERED!!!');*/
    --insert into PLAYER (pid,pname,played,won,lost,accuracy) values(cnt+1,pnam,0,0,0,0);
    --DBMS_OUTPUT.PUT_LINE(sysdate);
END;
/

commit;
select * from PLAYER@site2;
select * from CPLAYER@site2;
select * from GAME@site2;
@"C:\Development\Battleship2D\Site2\createboard.sql"