SET SERVEROUTPUT ON;
SET VERIFY OFF;
--
DECLARE
  TYPE Numero_Table_Type IS TABLE OF INTEGER(2); -- Sem index by � um Nested Table
  Numero_table numero_table_type := numero_table_type(); -- Inicializado
BEGIN
  -- Armazena n�meros de 1 a 10 em um Nested Table
  FOR i IN 1..10
  LOOP
    Numero_Table.extend; -- Alocada a ocorr�ncia, no Nested Table precisa ser feito assim antes de atribuir
    Numero_Table(i) := i;
  END LOOP;
  --
  -- O programa vai fazer muitas coisas...
  --
  -- L� o Nested Table e imprime os n�meros armazenados
  FOR I IN 1..10
  LOOP
    DBMS_OUTPUT.PUT_LINE('Nested Table: Indice = ' || TO_CHAR(i) || ', Valor = ' || TO_CHAR(Numero_Table(i)));
  END LOOP;
  --
END;