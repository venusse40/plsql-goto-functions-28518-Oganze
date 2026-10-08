-- C1 - Payroll Validator (combined task)
-- Uses fn_annual_salary and fn_calculate_tax (run B1 and B3 first).
-- Returns 'VALID' or a message describing the first problem found.
CREATE OR REPLACE FUNCTION fn_validate_payroll(p_employee_id IN NUMBER)
RETURN VARCHAR2
IS
  v_monthly employees.monthly_salary%TYPE;
  v_dept_id employees.department_id%TYPE;
  v_annual  NUMBER;
  v_tax     NUMBER;
BEGIN
  SELECT monthly_salary, department_id
    INTO v_monthly, v_dept_id
    FROM employees
   WHERE employee_id = p_employee_id;

  IF v_monthly IS NULL THEN
    RETURN 'INVALID: salary is missing';
  ELSIF v_monthly <= 0 THEN
    RETURN 'INVALID: salary must be greater than zero';
  ELSIF v_dept_id IS NULL THEN
    RETURN 'INVALID: employee has no department';
  END IF;

  v_annual := fn_annual_salary(p_employee_id);
  v_tax    := fn_calculate_tax(v_annual);

  IF v_tax IS NULL OR v_tax >= v_annual THEN
    RETURN 'INVALID: tax calculation error';
  END IF;

  RETURN 'VALID';
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'INVALID: employee not found';
  WHEN OTHERS THEN
    RETURN 'INVALID: unexpected error ' || SQLCODE;
END fn_validate_payroll;
/
SHOW ERRORS
