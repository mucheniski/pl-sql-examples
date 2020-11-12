SET SERVEROUTPUT ON
DECLARE
  vTotal   NUMBER(38) :=  1;
BEGIN
    <<LOOP1>>
    FOR i IN 1..8 LOOP
        DBMS_OUTPUT.PUT_LINE('----------------------------------');
        DBMS_OUTPUT.PUT_LINE('LOOP1 I =  ' || to_char(i));
        <<LOOP2>>
        FOR j IN 1..8 LOOP
          DBMS_OUTPUT.PUT_LINE('LOOP2 J =  ' || to_char(j));
          DBMS_OUTPUT.PUT_LINE('Total =  ' || to_char(vTotal,'99G999G999G999G999G999G999G999D99'));
          vTotal := vTotal * 2;
          -- EXIT LOOP1 WHEN vtotal > 1000000000000000;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Total Final =  ' || to_char(vTotal,'99G999G999G999G999G999G999G999D99'));
END;

-- Utilizando EXIT com Label

SET SERVEROUTPUT ON
DECLARE
  vTotal   NUMBER(38) :=  1;
BEGIN
    <<LOOP1>>
    FOR i IN 1..8 LOOP
        DBMS_OUTPUT.PUT_LINE('I =  ' || to_char(i));
        <<LOOP2>>
        FOR j IN 1..8 LOOP
          DBMS_OUTPUT.PUT_LINE('J =  ' || to_char(j));
          DBMS_OUTPUT.PUT_LINE('Total =  ' || to_char(vTotal,'99G999G999G999G999G999G999G999D99'));
          vTotal := vTotal * 2;
          EXIT LOOP1 WHEN vtotal > 1000000000000000; -- Aqui sai dos dois loops porque está com a label do Loop1, sem essa label sairia apenas do loop2 que é o corrente
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Total Final =  ' || to_char(vTotal,'99G999G999G999G999G999G999G999D99'));
END;