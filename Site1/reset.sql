set linesize 300;
DROP TABLE PLAYER CASCADE CONSTRAINTS;
DROP TABLE GAME CASCADE CONSTRAINTS;
DROP TABLE CPLAYER CASCADE CONSTRAINTS;


CREATE TABLE PLAYER(
	pid number, 
	pname varchar2(20),
    played number,
    won number,
    lost number, 	
        PRIMARY KEY(pid));


CREATE TABLE CPLAYER(
    pid number,
    phealth number,
    phit number,
    pmiss number,
    turn number,
        FOREIGN KEY(pid) REFERENCES PLAYER(pid)
);


CREATE TABLE GAME(
    gid number,
    pone number,
    ponen varchar2(20),
    ptwo number,
    ptwon varchar2(20),
    time varchar2(30),
    won varchar2(20),
        FOREIGN KEY(pone) REFERENCES PLAYER(pid),
        FOREIGN KEY(ptwo) REFERENCES PLAYER(pid)
);



commit;