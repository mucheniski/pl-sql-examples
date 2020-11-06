set SERVEROUT ON;
declare
    vTexto varchar2(100) := 'Exemplo de bloco an�nimo em PL/SQL';
begin
    dbms_output.put_line(vTexto);
exception
    when others then
        dbms_output.put_line('Erro Oracle - C�digo: ' || sqlcode || ' - Mensagem: ' || sqlerrm);
end;