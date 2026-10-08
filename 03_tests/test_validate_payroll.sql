-- Tests for C1 fn_validate_payroll
SELECT employee_id AS id,
       first_name,
       fn_validate_payroll(employee_id) AS payroll_status
  FROM employees
UNION ALL
SELECT 999, 'Missing', fn_validate_payroll(999) FROM dual
 ORDER BY 1;
-- Expected: 1,2,3 -> VALID ; 4 -> salary must be greater than zero ;
--           5 -> salary is missing ; 999 -> employee not found
