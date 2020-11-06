/*
    è declarada externamente ao bloco, então utilizada para passar valores em tempo de execução
    Usada para compiladores como em COBOL por exemplo que aceitam código PL/SQL
*/

SET SERVEROUTPUT ON

VARIABLE gmedia NUMBER
DECLARE
  vnumero1  NUMBER(11,2) := 2000;
  vnumero2  NUMBER(11,2) := 5000;
BEGIN  
  :gmedia := (vnumero1 + vnumero2) / 2;
  DBMS_OUTPUT.PUT_LINE('Media = ' || TO_CHAR(:gmedia));
EXCEPTION
  WHEN OTHERS 
  THEN 
    DBMS_OUTPUT.PUT_LINE('Erro Oracle: ' || SQLCODE || SQLERRM);
END;