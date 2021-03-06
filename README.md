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

Métodos de Collections
![](/img/MetodosDeCollections.png)

![](/img/MetodosDeCollections2.png)

Tipos de Cursor
![](/img/TiposCursores.png)
Utilize cursores explicitos para individualmente processar cada linha retonrada por um comando SELECT multi-row.
A ordem de execução é: Abrir o cursor, Processar as linhas com o fetch, Fechar o cursor com close.

Controlando cursor explícito.
![](/img/ControlandoCursorExplicito.png)

Atributos de cursor explícito.
![](/img/AtributosDeCursorExplicito.png)

for update: Quando usando em um select, as linhas retornadas ficam em lock, ou seja, ninguém pode editar, são voltam ao estado de unloked quando a sessão for encerrada.
O objetivo é bloquear os dados por exemplo quando deve ser feito um cálculo e ninguém pode utilizar as linhas do cursor.
Deve ser usado com cuidado, caso o cursor com for update retorne muitas linhas vai travar todos os dados, deve ser usado com cursores pequenos.
O ideal é usar com WHERE CURRENT OF, assim só vai tratar a linha corrente do cursor.

Tratamento de exceções: Se a exceção não for tratada no bloco PL/SQL ela é propagada até o fim do programa, no caso pode estourar no programa que fez a chamada dela, como no caso um programa Java.
O ideal é que seja tratada no bloco mesmo.
![](/img/TratamentoExcecao.png)

Exceções pré-definidas Oracle
![](/img/ExcecoesPreDefinidasOracle.png)
![](/img/ExcecoesPreDefinidasOracle2.png)
![](/img/ExcecoesPreDefinidasOracle3.png)

RAISE_APPLICATION_ERROR: Caso queira parar o processamento na tratativa de exceção pode ser usada essa procedure Oracle
possui 3 parametros (numero, string, boolean) o número é o código e precisa estar no intervalo -20000. -20999, a string é o texto do erro, o boolean se dor true coloca o erro na pilha de erros prévios, se for false(default) o erro sobrepõe outros erros.