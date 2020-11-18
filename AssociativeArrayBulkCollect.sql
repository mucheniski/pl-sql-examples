SET SERVEROUTPUT ON
SET VERIFY OFF
--
DECLARE
  TYPE employees_table_type IS TABLE OF employees%rowtype INDEX BY BINARY_INTEGER;  -- Obrigat�rio para Associative Array
  employees_table  employees_table_type; -- employees_table � uma vari�vel do tipo employees_table_type;
BEGIN
  --
  SELECT * 
  BULK COLLECT INTO employees_table -- Bulk Collect serve para carregar todos os campos da tabela employees dentro da vari�vel employees_table
  FROM employees;
  /* Para tabelas muito grandes � recomend�vel usar cursor e n�o bulk collect porque pode ocasionar
     problemas de performance devido ao grande consumo de mem�ria usada no processo porque toda a tabela
     vai ficar armazenada dentro da collection */
  --
  FOR i IN employees_table.first..employees_table.last  
  LOOP
    --
    DBMS_OUTPUT.PUT_LINE(employees_table(i).employee_id || ' - ' || 
                         employees_table(i).first_name || ' - ' || 
                         employees_table(i).last_name || ' - ' ||
                         employees_table(i).phone_number || ' - ' ||
                         employees_table(i).job_id || ' - ' ||
                         TO_CHAR(employees_table(i).salary,'99G999G999D99'));  
    --
  END LOOP;
  --
END;