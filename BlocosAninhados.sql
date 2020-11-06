-- Escopo de Identificadores e Blocos Aninhados

SET SERVEROUTPUT ON
DECLARE
  vbloco1 VARCHAR2(20) := 'Bloco 1';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Referenciando vari�vel do Bloco 1: ' || vbloco1);
  -- Se voce referencia vbloco2 aqui ocorrer� Erro
  DECLARE
    vbloco2 VARCHAR2(20) := 'Bloco 2';
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Referenciando vari�vel do Bloco 1: ' || vbloco1);
    DBMS_OUTPUT.PUT_LINE('Referenciando vari�vel do Bloco 2: ' || vbloco2);
  END;
  DBMS_OUTPUT.PUT_LINE('Referenciando vari�vel do Bloco 1: ' || vbloco1);
  -- Se voce referencia vbloco2 aqui ocorrer� Erro
END;

-- Identificando Blocos atrav�s de Labels

SET SERVEROUTPUT ON
<<BLOCO1>> -- Label para identificar o bloco
DECLARE
  vbloco1 VARCHAR2(20) := 'Bloco 1';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Referenciando vari�vel do Bloco 1: ' || bloco1.vbloco1);
  -- Se voce referencia vbloco2 aqui ocorrer� Erro
  <<BLOCO2>>
  DECLARE
    vbloco2 VARCHAR2(20) := 'Bloco 2';
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Referenciando vari�vel do Bloco 1: ' || bloco1.vbloco1);
    DBMS_OUTPUT.PUT_LINE('Referenciando vari�vel do Bloco 2: ' || bloco2.vbloco2);
  END;
  DBMS_OUTPUT.PUT_LINE('Referenciando vari�vel do Bloco 1: ' || bloco1.vbloco1);
  -- Se voce referencia vbloco2 aqui ocorrer� Erro
END;