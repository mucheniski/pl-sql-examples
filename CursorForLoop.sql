SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  CURSOR  employees_cursor  IS
  SELECT  *
  FROM    employees;
BEGIN
  FOR employees_record IN  employees_cursor -- vari�vel record employees_record � declarada autom�ticamente.
  LOOP
    -- O open do cursor e o fatch do cursor est�o impl�citos, n�o � preciso declarar.
    DBMS_OUTPUT.PUT_LINE(employees_record.employee_id || ' - ' ||
                         employees_record.first_name || ' ' || 
                         employees_record.last_name || ' - ' ||
                         employees_record.department_id || ' - ' ||
                         employees_record.job_id || ' - ' ||
                         employees_record.phone_number || ' - ' ||
                         LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));
    -- Close autom�tico do cursor quando sai do loop
  END LOOP;
END;

-- CURSOR FOR LOOP utilizando Sub-consulta

SET SERVEROUTPUT ON
SET VERIFY OFF
BEGIN
  FOR employees_record IN  (SELECT  *
                            FROM    employees)
  LOOP
    DBMS_OUTPUT.PUT_LINE(employees_record.employee_id || ' - ' ||
                         employees_record.first_name || ' ' || 
                         employees_record.last_name || ' - ' ||
                         employees_record.department_id || ' - ' ||
                         employees_record.job_id || ' - ' ||
                         employees_record.phone_number || ' - ' ||
                         LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));

  END LOOP;
END;