--
-- Se��o 6 - Declara��o de Identificadores - Vari�veis e Constantes
--
-- Aula 2 - Definindo Identificadores � Constantes
--
-- O valor de uma constante n�o muda durante toda a sua exist�ncia no bloco, por isso ela precisa ser inicializada.

-- Declarando Constantes

-- Declarando uma Constante Tipo NUMBER

SET SERVEROUTPUT ON

DECLARE
  vPi    CONSTANT NUMBER(38,15) := 3.141592653589793;
  
BEGIN
  DBMS_OUTPUT.PUT_LINE('Pi = ' ||   vPi);

END;

-- Declarando Constante Tipo CHAR e VARCHAR2
DECLARE
  vCaracterTamFixo     CONSTANT CHAR(2) := 'RS';
  vCaracterTamVariavel CONSTANT VARCHAR2(100) := 'Porto Alegre, RS';
BEGIN
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Fixo = ' || vCaracterTamFixo );
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Vari�vel = ' || vCaracterTamVariavel );
  
END;