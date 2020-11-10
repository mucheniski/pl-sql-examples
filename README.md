# pl-sql-examples

Convensões de codificação Oracle.
![](/img/ConvensoesDeCodificacaoOracle.png)


Criação das tabelas Employee e Department

CREATE TABLE DEPARTMENT
      (DEPARTMENT_ID    NUMBER           NOT NULL,
       NAME             VARCHAR(36)      NOT NULL,
       MGRNO            CHAR(6)                  ,
       ADMRDEPT         CHAR(3)          NOT NULL, 
       LOCATION         CHAR(16)                 ,
       PRIMARY KEY (DEPARTMENT_ID));

CREATE TABLE EMPLOYEES
      (EMPLOYEE_ID      NUMBER          NOT NULL,
       FIRSTNME         VARCHAR(12)     NOT NULL,
       MIDINIT          CHAR(1)         NOT NULL,
       LASTNAME         VARCHAR(15)     NOT NULL,
       DEPARTMENT_ID    NUMBER                  ,
       PHONENO          CHAR(4)                 ,
       HIREDATE         DATE                    ,
       JOB              CHAR(8)                 ,
       EDLEVEL          SMALLINT        NOT NULL,
       SEX              CHAR(1)                 ,
       BIRTHDATE        DATE                    ,
       SALARY           DECIMAL(9,2)            ,
       BONUS            DECIMAL(9,2)            ,
       COMM             DECIMAL(9,2)            ,      
       PRIMARY KEY (EMPLOYEE_ID));

ALTER TABLE EMPLOYEES 
ADD CONSTRAINT EMP_DEPT_FK
FOREIGN KEY (DEPARTMENT_ID)
REFERENCES DEPARTMENT(DEPARTMENT_ID);


Cursor Implícito
Sempre que você executa um comando SQL, o Servidor Oracle abre uma área de memória na qual o comando é analisado e executado. Esta área é chamada de cursor.
Quando a parte executável (seção BEGIN) de um bloco emite um comando SQL, o PL/SQL cria um cursor implícito. O PL/SQL administra este cursor automaticamente.

Parametros do Cursor
![](/img/AtributosDoCursor.png)

Operadores
![](/img/Operadores.png)

Regras de Precedência
![](/img/RegraDePrecedencia.png)

Regras de comparação com IF.
Qualquer comparação que possui o valor nulo, retorna NULL como se fosse false, para comparar valor nulo usamos NVL, ou IS NULL ou IS NOT NULL.