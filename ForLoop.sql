SET SERVEROUTPUT ON
ACCEPT pLimite PROMPT 'Digite o valor do limite: '
DECLARE
  vInicio  INTEGER(3) := 1;
  vFim     NUMBER(38) := &pLimite;
BEGIN
    FOR i IN vinicio..vfim  LOOP -- O indice no caso "i" é declarado automáticamente como binary integer com escopo no FOR LOOP
      DBMS_OUTPUT.PUT_LINE('Número = ' || to_char(i) );
    END LOOP;
END;


-- O REVERSE faz com que o LOOP seja executado ao contrário, do último para começo (do vFim para vInicio).
SET SERVEROUTPUT ON
ACCEPT pLimite PROMPT 'Digite o valor do limite: '
DECLARE
  vInicio  INTEGER(3) := 1;
  vFim     NUMBER(38) := &pLimite;
BEGIN
    FOR i IN REVERSE vinicio..vfim  LOOP -- O indice no caso "i" é declarado automáticamente como binary integer com escopo no FOR LOOP
      DBMS_OUTPUT.PUT_LINE('Número = ' || to_char(i) );
    END LOOP;
END;