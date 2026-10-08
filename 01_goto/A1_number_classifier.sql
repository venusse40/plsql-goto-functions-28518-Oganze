-- A1 - Number Classifier (uses GOTO)
-- Classifies a number as negative / zero / positive (and even/odd if positive).
SET SERVEROUTPUT ON;

DECLARE
  v_num NUMBER := 15;   -- change this value to test: -7, 0, 15, 20
BEGIN
  IF v_num < 0 THEN
    GOTO negative_num;
  ELSIF v_num = 0 THEN
    GOTO zero_num;
  ELSE
    GOTO positive_num;
  END IF;

  <<negative_num>>
  DBMS_OUTPUT.PUT_LINE(v_num || ' is negative');
  GOTO finish;

  <<zero_num>>
  DBMS_OUTPUT.PUT_LINE(v_num || ' is zero');
  GOTO finish;

  <<positive_num>>
  IF MOD(v_num, 2) = 0 THEN
    DBMS_OUTPUT.PUT_LINE(v_num || ' is positive and even');
  ELSE
    DBMS_OUTPUT.PUT_LINE(v_num || ' is positive and odd');
  END IF;

  <<finish>>
  NULL;  -- a label must be followed by an executable statement
END;
/
