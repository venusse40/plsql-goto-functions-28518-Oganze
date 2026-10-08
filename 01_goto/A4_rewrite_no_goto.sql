-- A4 - Rewrite Without GOTO
-- Same behaviour as A1 using only IF / ELSIF / ELSE (structured control flow).
SET SERVEROUTPUT ON;

DECLARE
  v_num NUMBER := 15;   -- same test values as A1
BEGIN
  IF v_num < 0 THEN
    DBMS_OUTPUT.PUT_LINE(v_num || ' is negative');
  ELSIF v_num = 0 THEN
    DBMS_OUTPUT.PUT_LINE(v_num || ' is zero');
  ELSIF MOD(v_num, 2) = 0 THEN
    DBMS_OUTPUT.PUT_LINE(v_num || ' is positive and even');
  ELSE
    DBMS_OUTPUT.PUT_LINE(v_num || ' is positive and odd');
  END IF;
END;
/
