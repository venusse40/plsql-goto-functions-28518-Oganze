-- A2 - Salary Review (uses GOTO)
-- Reviews one employee's monthly salary and jumps to the matching review outcome.
-- Display only: no data is changed, so the script can be re-run.
SET SERVEROUTPUT ON;

DECLARE
  v_emp_id  employees.employee_id%TYPE := 1;   -- change to 2, 3 to test other bands
  v_name    VARCHAR2(70);
  v_salary  employees.monthly_salary%TYPE;
BEGIN
  SELECT first_name || ' ' || last_name, monthly_salary
    INTO v_name, v_salary
    FROM employees
   WHERE employee_id = v_emp_id;

  IF v_salary IS NULL OR v_salary <= 0 THEN
    GOTO invalid_salary;
  ELSIF v_salary < 100000 THEN
    GOTO low_band;
  ELSIF v_salary < 500000 THEN
    GOTO mid_band;
  ELSE
    GOTO high_band;
  END IF;

  <<invalid_salary>>
  DBMS_OUTPUT.PUT_LINE(v_name || ': invalid salary, needs HR correction');
  GOTO finish;

  <<low_band>>
  DBMS_OUTPUT.PUT_LINE(v_name || ': low band, recommended raise 10% -> ' || v_salary * 1.10);
  GOTO finish;

  <<mid_band>>
  DBMS_OUTPUT.PUT_LINE(v_name || ': mid band, recommended raise 5% -> ' || v_salary * 1.05);
  GOTO finish;

  <<high_band>>
  DBMS_OUTPUT.PUT_LINE(v_name || ': high band, no raise recommended -> ' || v_salary);

  <<finish>>
  NULL;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Employee ' || v_emp_id || ' not found');
END;
/
