-- 00_setup/create_tables.sql
-- Tables and sample data used by all other scripts.
-- Note: monthly_salary is MONTHLY pay (used by fn_annual_salary).

BEGIN EXECUTE IMMEDIATE 'DROP TABLE employees PURGE';   EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE departments PURGE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

CREATE TABLE departments (
  department_id   NUMBER        PRIMARY KEY,
  department_name VARCHAR2(50)  NOT NULL
);

CREATE TABLE employees (
  employee_id    NUMBER        PRIMARY KEY,
  first_name     VARCHAR2(30)  NOT NULL,
  last_name      VARCHAR2(30)  NOT NULL,
  monthly_salary NUMBER(10,2),
  hire_date      DATE          NOT NULL,
  department_id  NUMBER        REFERENCES departments(department_id)
);

INSERT INTO departments VALUES (10, 'Finance');
INSERT INTO departments VALUES (20, 'IT');
INSERT INTO departments VALUES (30, 'HR');

INSERT INTO employees VALUES (1, 'Alice', 'Uwase',  450000, DATE '2018-03-01', 10);
INSERT INTO employees VALUES (2, 'Bob',   'Mugisha', 80000, DATE '2022-07-15', 20);
INSERT INTO employees VALUES (3, 'Chloe', 'Keza',   900000, DATE '2015-01-10', 20);
INSERT INTO employees VALUES (4, 'David', 'Niyonzima', 0,   DATE '2024-02-01', 30);
INSERT INTO employees VALUES (5, 'Eve',   'Ineza',   NULL,  DATE '2023-05-20', NULL);
COMMIT;
