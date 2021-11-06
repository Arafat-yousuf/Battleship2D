set linesize 300;
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE OBOARD CASCADE CONSTRAINTS;
DROP TABLE SHIP CASCADE CONSTRAINTS;

CREATE TABLE BOARD(
	rid number, 
	A varchar2(2),
    B varchar2(2),
    C varchar2(2),
    D varchar2(2),
    E varchar2(2),
    F varchar2(2), 	
        PRIMARY KEY(rid));

CREATE TABLE OBOARD(
	orid number, 
	A varchar2(2),
    B varchar2(2),
    C varchar2(2),
    D varchar2(2),
    E varchar2(2),
    F varchar2(2), 	
        PRIMARY KEY(orid));

CREATE TABLE SHIP(
	sid number, 
	sname varchar2(20),
    slen number,
    shealth number,
    snick varchar2(2),
    scnt number, 	
        PRIMARY KEY(sid));

insert into BOARD (rid,A,B,C,D,E,F) values(1,'-','-','-','-','-','-');
insert into BOARD (rid,A,B,C,D,E,F) values(2,'-','-','-','-','-','-');
insert into BOARD (rid,A,B,C,D,E,F) values(3,'-','-','-','-','-','-');
insert into BOARD (rid,A,B,C,D,E,F) values(4,'-','-','-','-','-','-');
insert into BOARD (rid,A,B,C,D,E,F) values(5,'-','-','-','-','-','-');
insert into BOARD (rid,A,B,C,D,E,F) values(6,'-','-','-','-','-','-');

insert into OBOARD (orid,A,B,C,D,E,F) values(1,'-','-','-','-','-','-');
insert into OBOARD (orid,A,B,C,D,E,F) values(2,'-','-','-','-','-','-');
insert into OBOARD (orid,A,B,C,D,E,F) values(3,'-','-','-','-','-','-');
insert into OBOARD (orid,A,B,C,D,E,F) values(4,'-','-','-','-','-','-');
insert into OBOARD (orid,A,B,C,D,E,F) values(5,'-','-','-','-','-','-');
insert into OBOARD (orid,A,B,C,D,E,F) values(6,'-','-','-','-','-','-');

insert into SHIP (sid,sname,slen,shealth,snick,scnt) values(1,'frigate',4,4,'F',0);
insert into SHIP (sid,sname,slen,shealth,snick,scnt) values(2,'submarine',3,3,'S',0);
insert into SHIP (sid,sname,slen,shealth,snick,scnt) values(3,'cruiser',2,2,'C',0);
insert into SHIP (sid,sname,slen,shealth,snick,scnt) values(4,'u-boat',1,1,'U',0);

select * from BOARD;

@"C:\Development\Battleship2D\Site2\gamepack.sql"