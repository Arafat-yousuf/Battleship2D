create or replace procedure updateplayerstat (res in BOARD.A%TYPE, pi in BOARD.rid%TYPE, opi in BOARD.rid%TYPE)
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
        DBMS_OUTPUT.PUT_LINE(pam || ' WINS THE GAME!!!');
        DBMS_OUTPUT.PUT_LINE('-----------------------');
        DBMS_OUTPUT.PUT_LINE('****GAME OVER***');
    end if;
    --DBMS_OUTPUT.PUT_LINE('A');
END;
/