-- B3 - Tax Calculator: tax on an ANNUAL salary using a flat rate per bracket.
--   up to 1,200,000       : 0%
--   1,200,001 - 3,600,000 : 20%
--   above 3,600,000       : 30%
-- Brackets are example rates; change the constants if your course gives others.
-- Returns NULL for NULL or negative input.
CREATE OR REPLACE FUNCTION fn_calculate_tax(p_annual_salary IN NUMBER)
RETURN NUMBER
IS
  c_rate_low  CONSTANT NUMBER := 0;
  c_rate_mid  CONSTANT NUMBER := 0.20;
  c_rate_high CONSTANT NUMBER := 0.30;
BEGIN
  IF p_annual_salary IS NULL OR p_annual_salary < 0 THEN
    RETURN NULL;
  ELSIF p_annual_salary <= 1200000 THEN
    RETURN p_annual_salary * c_rate_low;
  ELSIF p_annual_salary <= 3600000 THEN
    RETURN p_annual_salary * c_rate_mid;
  ELSE
    RETURN p_annual_salary * c_rate_high;
  END IF;
END fn_calculate_tax;
/
SHOW ERRORS
