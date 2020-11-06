-- Utilizando Fun��es no bloco PL/SQL

SET SERVEROUTPUT ON
DECLARE
  vNumero1  NUMBER(13,2);  -- Declara��o de vari�vel para o Primeiro n�mero
  vNumero2  NUMBER(13,2);  -- Declara��o de vari�vel para o Segundo n�mero
  vMedia    NUMBER(13,2);  -- Declara��o de vari�vel para a M�dia
BEGIN
  /* C�lculo do valor da m�dia entre dois n�meros
     Autor: Em�lio Scudero
     Data: 05/05/2020 */
	 
  vNumero1  :=  5000.8888;
  vNumero2  :=  3000.4444;
  vMedia    :=  ROUND((vNumero1 + vNumero2) / 2, 2); -- Fun��o de manipula��o de n�meros para arredondar com 2 decimais
  DBMS_OUTPUT.PUT_LINE('vnumero1 = ' || vnumero1);  -- Impress�o do Primeiro N�mero
  DBMS_OUTPUT.PUT_LINE('vnumero2 = ' || vnumero2);  -- Impress�o do Segundo N�mero
  DBMS_OUTPUT.PUT_LINE('Media = ' || TO_CHAR(vMedia,'99G999G999D99'));     -- Impress�o da M�dia calculada 
END;