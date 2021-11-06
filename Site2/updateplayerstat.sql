create or replace procedure updateplayerstat (res in BOARD.A%TYPE, pi in BOARD.rid%TYPE, opi in BOARD.rid%TYPE)
is
    thealth CPLAYER.phealth@site2%type;
    pam PLAYER.pname@site2%type;
    gaid PLAYER.pid@site2%type;

BEGIN 

    
    if res='X' then
        update CPLAYER@site2 set phealth=phealth-1,turn=1 where pid = opi;
        update CPLAYER@site2 set phit=phit+1,turn=0 where pid = pi;
    elsif res='O' then
        update CPLAYER@site2 set  pmiss=pmiss+1,turn=0 where pid = pi;
        update CPLAYER@site2 set turn=1 where pid = opi;
    end if;

    select phealth into thealth from CPLAYER where pid = opi;
    if thealth = 0 then
        select pname into pam from PLAYER@site2 where pid = pi;
        select gid into gaid from GAME@site2 where won = 'N/A';
        update GAME@site2 set won = pam where gid = gaid;
        update PLAYER@site2 set played = played+1, won=won+1 where pid = pi;
        update PLAYER@site2 set played = played+1, lost=lost+1 where pid = opi;
        DBMS_OUTPUT.PUT_LINE(pam || ' WINS THE GAME!!!');
        DBMS_OUTPUT.PUT_LINE('-----------------------');
        DBMS_OUTPUT.PUT_LINE('****GAME OVER***');
    end if;
    --DBMS_OUTPUT.PUT_LINE('A');
END;
/