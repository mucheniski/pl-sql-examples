set serveroutput on;
set verify off;

declare

    type Numero_Table_Type is table of number(2) index by binary_integer;
    Numero_Table Numero_Table_Type; -- Estou declarando que Numero_Table vai ser um associative array de 2 dígitos

begin

    -- Armazena o número de 1 a 10 no array para ser usado no programa
    for i in 1..10 loop
        Numero_Table(i) := i;
    end loop;
    
    -- O programa usa o array para o que for preciso
    
    -- Esse loop lê o array populado e imprime os valores
    for i in 1..10 loop
        dbms_output.put_line('Associativa Array: Indice = ' || to_char(i) || ', Valor = ' || to_char(Numero_Table(i) ) );    
    end loop;

end;