# pl-sql-examples

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