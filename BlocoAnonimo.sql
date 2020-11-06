set SERVEROUT ON;
declare
    vTexto varchar2(100) := 'Exemplo de bloco anônimo em PL/SQL';
begin
    dbms_output.put_line(vTexto);
exception
    when others then
        dbms_output.put_line('Erro Oracle - Código: ' || sqlcode || ' - Mensagem: ' || sqlerrm);
end;