SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER SHIP1
AFTER UPDATE 
OF scnt
ON SHIP

DECLARE
BEGIN
    DBMS_OUTPUT.PUT_LINE('SHIP SUCCESSFULLY PLACED!!!');
END;
/

CREATE OR REPLACE TRIGGER BOARD1
AFTER INSERT
ON GAME@site2

DECLARE
BEGIN
    DBMS_OUTPUT.PUT_LINE('GAME STARTED!!!');
END;
/