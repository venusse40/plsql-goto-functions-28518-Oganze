# PL/SQL GOTO Statements and Functions

**Course:** Database Development with PL/SQL (INSY 8311)
**Instructor:** Eric Maniraguha
**Student:** OGANZE VENUSSE (28518)
**Assignment:** Individual Assignment III

## Contents
| Folder | Files |
|---|---|
| `00_setup/` | `create_tables.sql` (departments, employees, sample data) |
| `01_goto/` | A1 Number Classifier, A2 Salary Review, A3 Illegal GOTO and Fix, A4 Rewrite Without GOTO |
| `02_functions/` | B1 Annual Salary, B2 Years of Service, B3 Tax Calculator, B4 Department Name, C1 Payroll Validator |
| `03_tests/` | B5 Functions in SQL, `test_functions.sql`, `test_validate_payroll.sql` |
| `screenshots/` | Output of A1, A2, A3 (error and fix), A4, B5, C1 |
| `docs/` | `REFLECTION.md` (C2) |

## How to Run
1. Run `00_setup/create_tables.sql`.
2. Run the functions in `02_functions/` (B1, B2, B3, B4, then C1).
3. Run the programs in `01_goto/`.
4. Run the test files in `03_tests/`.
5. Verify your results and screenshots.

## Notes
- `monthly_salary` is a monthly amount, so annual salary = monthly x 12.
- Tax brackets in B3 are example rates held in constants at the top of the function.
- **AI use:** I used an AI assistant (Claude) to help me draft the SQL files and repository layout. I then run every script myself in Oracle, checked the outputs, and i can explain each file.