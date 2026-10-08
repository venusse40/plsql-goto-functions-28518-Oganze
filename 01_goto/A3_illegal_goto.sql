-- A3 - Illegal GOTO and Fix
SET SERVEROUTPUT ON;

-- PART 1: ILLEGAL. GOTO cannot jump INTO an IF block.
-- Expected: PLS-00375: illegal GOTO statement; this GOTO cannot branch to label 'INSIDE_IF'
BEGIN
  GOTO inside_if;
  IF 1 = 1 THEN
    <<inside_if>>
    DBMS_OUTPUT.PUT_LINE('Reached label inside IF');
  END IF;
END;
/

-- PART 2: FIX. The label is moved outside the IF block, at the same level as the GOTO.
BEGIN
  GOTO outside_if;
  IF 1 = 1 THEN
    DBMS_OUTPUT.PUT_LINE('This line is skipped');
  END IF;
  <<outside_if>>
  DBMS_OUTPUT.PUT_LINE('Reached label at the same block level: GOTO is legal');
END;
/
