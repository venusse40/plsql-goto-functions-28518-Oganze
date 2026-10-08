-- B5 - Functions in SQL: call the stored functions directly inside a SELECT.
SELECT e.employee_id,
       e.first_name || ' ' || e.last_name AS employee,
       fn_dept_name(e.employee_id)        AS department,
       fn_annual_salary(e.employee_id)    AS annual_salary,
       fn_calculate_tax(fn_annual_salary(e.employee_id)) AS tax,
       fn_years_of_service(e.employee_id) AS years_of_service
  FROM employees e
 ORDER BY e.employee_id;
