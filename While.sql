SET SERVEROUTPUT ON
ACCEPT pLimite PROMPT 'Digite o valor do limite: '
DECLARE
  vNumero  NUMBER(38) :=  1;
  vLimite  NUMBER(38) := &pLimite;
BEGIN
-- Variaveis inicializadas na se��o Declare
    WHILE  vNumero <= vLimite LOOP
        DBMS_OUTPUT.PUT_LINE('N�mero =  ' || to_char(vNumero));
        vNumero := vNUmero + 1;
    END LOOP;
END;