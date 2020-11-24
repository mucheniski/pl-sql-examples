# pl-sql-examples

Criar o container
docker login // faz o login no dockerhub
docker run -d -it --name oracledatabase -p 1521:1521 -p 5500:5500 store/oracle/database-enterprise:12.2.0.1
The default password to connect to the database with sys user is Oradoc_db1


tnsnames.ora

oracledatabasecontainer =
    (
        DESCRIPTION=(
            ADDRESS=
                (PROTOCOL=TCP)
                (HOST=localhost)
                (PORT=1521)
        )
        (
            CONNECT_DATA=
                (SERVER=DEDICATED)
                (SERVICE_NAME=ORCLCDB.localdomain)
        )
    )

SET SERVEROUTPUT ON -- Habilita o dbms_output
SET VERIFY OFF -- Não imprime o bloco ou procedure, apenas o que está no output


https://www.udemy.com/course/oracle-plsql-especialista-do-basico-ao-avancado-completo/

Convensões de codificação Oracle.
![](/img/ConvensoesDeCodificacaoOracle.png)


Criação das tabelas Employees e Department
https://download.oracle.com/oll/tutorials/DBXETutorial/html/module2/les02_load_data_sql.htm 


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

Uma variáve RECORD é uma estrutura de campos na memória, como por exemplo endereço que tem rua varchar2, numero varchar2, cidade varchar2, etc...

A diferença de sintaxe entre Nested Table e Associative Array é o INDEX BY, quando tem o INDEX BY é um Associative Array, quando não tem é uma Nested Table.