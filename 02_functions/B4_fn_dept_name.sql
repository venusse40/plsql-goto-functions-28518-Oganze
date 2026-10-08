-- B4 - Department Name: returns the employee's department name.
-- 'Unknown employee' if the employee does not exist, 'No department' if none assigned.
CREATE OR REPLACE FUNCTION fn_dept_name(p_employee_id IN NUMBER)
RETURN VARCHAR2
IS
  v_dept  departments.department_name%TYPE;
  v_count NUMBER;
BEGIN
  SELECT d.department_name INTO v_dept
    FROM employees e
    JOIN departments d ON d.department_id = e.department_id
   WHERE e.employee_id = p_employee_id;

  RETURN v_dept;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    SELECT COUNT(*) INTO v_count FROM employees WHERE employee_id = p_employee_id;
    IF v_count = 0 THEN
      RETURN 'Unknown employee';
    ELSE
      RETURN 'No department';
    END IF;
END fn_dept_name;
/
SHOW ERRORS
