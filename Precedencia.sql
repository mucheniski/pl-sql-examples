SET SERVEROUTPUT ON
DECLARE
   vNota1     NUMBER(11,2) := 7.0;
   vNota2     NUMBER(11,2) := 6.0;
   vNota3     NUMBER(11,2) := 9.0;
   vNota4     NUMBER(11,2) := 6.0;
   vMedia     NUMBER(11,2);
   
BEGIN
  vMedia := vNota1 + vNota2 + vNota3 + vNota4 / 4; -- Errado 23.5 a divis�o � feita primeiro pois tem preced�ncia
  DBMS_OUTPUT.PUT_LINE('Media = ' || vMedia);   
END;

-- Corrigindo o c�lculo da m�dia sobrepondo a regra de preced�ncia utilizando parenteses

SET SERVEROUTPUT ON
DECLARE
   vNota1     NUMBER(11,2) := 7.0;
   vNota2     NUMBER(11,2) := 6.0;
   vNota3     NUMBER(11,2) := 9.0;
   vNota4     NUMBER(11,2) := 6.0;
   vMedia     NUMBER(11,2);
   
BEGIN
  vMedia := (vNota1 + vNota2 + vNota3 + vNota4) / 4; -- Correto 7
  DBMS_OUTPUT.PUT_LINE('Media = ' || vMedia);   
END;