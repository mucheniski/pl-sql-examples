SET SERVEROUTPUT ON
ACCEPT pLimite PROMPT 'Digite o valor do limite: '
DECLARE
  vInicio  INTEGER(3) := 1;
  vFim     NUMBER(38) := &pLimite;
BEGIN
    FOR i IN vinicio..vfim  LOOP -- O indice no caso "i" � declarado autom�ticamente como binary integer com escopo no FOR LOOP
      DBMS_OUTPUT.PUT_LINE('N�mero = ' || to_char(i) );
    END LOOP;
END;


-- O REVERSE faz com que o LOOP seja executado ao contr�rio, do �ltimo para come�o (do vFim para vInicio).
SET SERVEROUTPUT ON
ACCEPT pLimite PROMPT 'Digite o valor do limite: '
DECLARE
  vInicio  INTEGER(3) := 1;
  vFim     NUMBER(38) := &pLimite;
BEGIN
    FOR i IN REVERSE vinicio..vfim  LOOP -- O indice no caso "i" � declarado autom�ticamente como binary integer com escopo no FOR LOOP
      DBMS_OUTPUT.PUT_LINE('N�mero = ' || to_char(i) );
    END LOOP;
END;