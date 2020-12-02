DECLARE
   --
   vemployee_id    employees.employee_id%TYPE := 300;
   vfirst_name     employees.first_name%TYPE := 'Robert';
   vlast_name      employees.last_name%TYPE := 'Ford';
   vjob_id         employees.job_id%TYPE := 'XX_YYYY';
   vphone_number   employees.phone_number%TYPE := '650.511.9844';
   vemail          employees.email%TYPE := 'RFORD';
   --
   efk_inexistente EXCEPTION; -- Crio a exception
   PRAGMA EXCEPTION_INIT(efk_inexistente, -2291); -- Associo a exception criada ao erro ora -2291 restrição de constraint
   --
BEGIN
   --
   INSERT INTO employees (employee_id, first_name, last_name, phone_number, email, hire_date,job_id)
   VALUES (vemployee_id, vfirst_name, vlast_name, vphone_number, vemail, sysdate, vjob_id);
   --
EXCEPTION
   --
   WHEN  efk_inexistente THEN
         /*
            Vai acontecer esse erro porque o vjob_id         employees.job_id%TYPE := 'XX_YYYY';
            sendo inserido não existe na tabela jobs.
         */
         RAISE_APPLICATION_ERROR(-20003, 'Job inexistente!');
   --
   WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle ' || SQLCODE || SQLERRM);
END;

-- Forçando o Erro para descobrir o código de Erro a ser tratado

   INSERT INTO employees (employee_id, first_name, last_name, phone_number, email, hire_date, job_id)
   VALUES (employees_seq.nextval, 'Joseph', 'Smith', '3333333', 'JSMITH', sysdate, 'ZZZZ_XX');