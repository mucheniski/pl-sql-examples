begin

    insert into employees(employee_id, last_name, email, hire_date, job_id)
                   values(employee_seq.nextval, 'Mucheniski', 'mucheniski@teste.com', to_date('06/01/2020','dd/mm/yyyy'), 'it_prog' );

    savepoint insertok;
    
    update employees
    set    salary = 30000
    where  job_id = 'it_prog';
    
    rollback to insertok; -- Faz o rollback até onde está o savepoint, nesse caso o update que está abaixo vai ser
                          -- desfeito e o insert vai permanecer na seção até que seja feito o commit.
                          
    commit;

end;