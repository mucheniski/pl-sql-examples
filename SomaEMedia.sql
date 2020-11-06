set SERVEROUT ON;
declare
    vNumero1 number(11,2) := 500;
    vNumero2 number(11,2) := 400;
    vMedia   number(11,2); -- Quando a vari�vel n�o � inicializada ela fica com valor default null
begin    
    vMedia := (vNumero1 + vNumero2) / 2;
    dbms_output.put_line('M�dia = ' || vMedia);
exception
    when others then
        dbms_output.put_line('Erro Oracle - C�digo: ' || sqlcode || ' - Mensagem: ' || sqlerrm);
end;