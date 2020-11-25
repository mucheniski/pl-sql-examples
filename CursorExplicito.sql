-- Controlando com Loop B�sico
SET SERVEROUTPUT ON
SET VERIFY OFF
--
DECLARE
  CURSOR  employees_cursor  IS
  SELECT  *
  FROM    employees;  -- Declara��o do Cursor
  
  employees_record  employees_cursor%rowtype; 
BEGIN
  /* Inicializa */
  
  OPEN  employees_cursor;  -- Abrindo o Cursor
  
  /* Loop */
  
  LOOP  -- Loop B�sico
    FETCH  employees_cursor  
    INTO  employees_record; -- Fetch de cada linha do Cursor
    
    EXIT WHEN employees_cursor%notfound; -- Se a linha cursor est� vazia sai do loop.
    
    DBMS_OUTPUT.PUT_LINE(employees_record.employee_id || ' - ' ||
                         employees_record.first_name || ' ' || 
                         employees_record.last_name || ' - ' ||
                         employees_record.department_id || ' - ' ||
                         employees_record.job_id || ' - ' ||
                         employees_record.phone_number || ' - ' ||
                         LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));
    
  END LOOP;
  
  CLOSE employees_cursor; -- Close do Cursor
END;


-- Controlando um Cursor Expl�cito com WHILE LOOP

SET SERVEROUTPUT ON
SET VERIFY OFF
--
DECLARE
  --
  CURSOR  employees_cursor  IS
  SELECT  *
  FROM    employees; -- Declara��o do Cursor
  employees_record  employees_cursor%rowtype; -- Vari�vel record com a mesma estrutura do cursor.
  --
BEGIN
  /* Inicializa */
  
  OPEN  employees_cursor; -- Abrindo o Cursor
  
  FETCH  employees_cursor  
   INTO  employees_record; -- Fetch da primeira linha do Cursor
	
  /* Loop */
  
  WHILE  employees_cursor%found  LOOP -- se a linha do fetch acima estiver vazia nem entra no loop.
     DBMS_OUTPUT.PUT_LINE(employees_record.employee_id || ' - ' ||
                         employees_record.first_name || ' ' || 
                         employees_record.last_name || ' - ' ||
                         employees_record.department_id || ' - ' ||
                         employees_record.job_id || ' - ' ||
                         employees_record.phone_number || ' - ' ||
                         LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));
    --
    FETCH  employees_cursor  -- Fetch da pr�xima linha do cursor
    INTO   employees_record;
    --
  END LOOP;
  --
  CLOSE employees_cursor; -- Close do Cursor
  --
END;