# pl-sql-examples

Convensões de codificação Oracle.
![](/img/ConvensoesDeCodificacaoOracle.png)


Criação das tabelas Employee e Department

CREATE TABLE EMPLOYEE
      (EMPNO       CHAR(6)         NOT NULL,
       FIRSTNME    VARCHAR(12)     NOT NULL,
       MIDINIT     CHAR(1)         NOT NULL,
       LASTNAME    VARCHAR(15)     NOT NULL,
       DEPTNO      CHAR(3)                 ,
       PHONENO     CHAR(4)                 ,
       HIREDATE    DATE                    ,
       JOB         CHAR(8)                 ,
       EDLEVEL     SMALLINT        NOT NULL,
       SEX         CHAR(1)                 ,
       BIRTHDATE   DATE                    ,
       SALARY      DECIMAL(9,2)            ,
       BONUS       DECIMAL(9,2)            ,
       COMM        DECIMAL(9,2)            ,      
       PRIMARY KEY (EMPNO));

CREATE TABLE DEPARTMENT
      (DEPTNO    CHAR(3)           NOT NULL,
       DEPTNAME  VARCHAR(36)       NOT NULL,
       MGRNO     CHAR(6)                   ,
       ADMRDEPT  CHAR(3)           NOT NULL, 
       LOCATION  CHAR(16)                  ,
       PRIMARY KEY (DEPTNO));

ALTER TABLE EMPLOYEE 
ADD CONSTRAINT EMP_DEPT_FK
FOREIGN KEY (DEPTNO)
REFERENCES DEPARTMENT(DEPTNO);


Cursor Implícito
Sempre que você executa um comando SQL, o Servidor Oracle abre uma área de memória na qual o comando é analisado e executado. Esta área é chamada de cursor.
Quando a parte executável (seção BEGIN) de um bloco emite um comando SQL, o PL/SQL cria um cursor implícito. O PL/SQL administra este cursor automaticamente.

Parametros do Cursor
![](/img/AtributosDoCursor.png)