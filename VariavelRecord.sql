SET SERVEROUTPUT ON
SET VERIFY OFF -- Não imprime o bloco no dbms_output, apenas o que está no put_line
ACCEPT pemployee_id PROMPT 'Digite o Id do empregado: '
DECLARE
    TYPE  employee_record_type IS RECORD -- Declaração
              (employee_id   employees.employee_id%type,
               first_name    employees.first_name%type,
               last_name     employees.last_name%type,
               email         employees.email%type,
               phone_number  employees.phone_number%type);
    employee_record  employee_record_type; -- Nome TipoDoRecord

BEGIN
    SELECT  employee_id, first_name, last_name, email, phone_number
    INTO    employee_record
    FROM    employees
    WHERE   employee_id = &pemployee_id;
    DBMS_OUTPUT.PUT_LINE(employee_record.employee_id || ' - ' || 
                         employee_record.first_name || ' - ' || 
                         employee_record.last_name || ' - ' || 
                         employee_record.phone_number);
END;