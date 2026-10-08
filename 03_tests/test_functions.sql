-- Tests for B1-B4, including an employee that does not exist (id 999).
SET SERVEROUTPUT ON;

BEGIN
  DBMS_OUTPUT.PUT_LINE('--- B1 fn_annual_salary ---');
  DBMS_OUTPUT.PUT_LINE('emp 1   : ' || fn_annual_salary(1)   || ' (expected 5400000)');
  DBMS_OUTPUT.PUT_LINE('emp 999 : ' || NVL(TO_CHAR(fn_annual_salary(999)), 'NULL') || ' (expected NULL)');

  DBMS_OUTPUT.PUT_LINE('--- B2 fn_years_of_service ---');
  DBMS_OUTPUT.PUT_LINE('emp 1   : ' || fn_years_of_service(1));
  DBMS_OUTPUT.PUT_LINE('emp 999 : ' || NVL(TO_CHAR(fn_years_of_service(999)), 'NULL') || ' (expected NULL)');

  DBMS_OUTPUT.PUT_LINE('--- B3 fn_calculate_tax ---');
  DBMS_OUTPUT.PUT_LINE('1,000,000 : ' || fn_calculate_tax(1000000) || ' (expected 0)');
  DBMS_OUTPUT.PUT_LINE('2,000,000 : ' || fn_calculate_tax(2000000) || ' (expected 400000)');
  DBMS_OUTPUT.PUT_LINE('5,000,000 : ' || fn_calculate_tax(5000000) || ' (expected 1500000)');
  DBMS_OUTPUT.PUT_LINE('-1        : ' || NVL(TO_CHAR(fn_calculate_tax(-1)), 'NULL') || ' (expected NULL)');

  DBMS_OUTPUT.PUT_LINE('--- B4 fn_dept_name ---');
  DBMS_OUTPUT.PUT_LINE('emp 1   : ' || fn_dept_name(1)   || ' (expected Finance)');
  DBMS_OUTPUT.PUT_LINE('emp 5   : ' || fn_dept_name(5)   || ' (expected No department)');
  DBMS_OUTPUT.PUT_LINE('emp 999 : ' || fn_dept_name(999) || ' (expected Unknown employee)');
END;
/
