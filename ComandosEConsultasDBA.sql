--Check all tables
SELECT owner, table_name
  FROM all_tables;
/  
 
SELECT *
  FROM all_tables; 
/

-- Consutar tabela por nome de coluna
SELECT *
  FROM all_tab_columns
WHERE upper(column_name)  LIKE '%ID_MONITORA_LOG_DETALHE%';
/

-- Check all_views
select * 
from all_views;


-- Check all_views
SELECT * 
  FROM all_dependencies 
 WHERE type = 'VIEW' 
   AND referenced_owner = 'TABLE_OWNER'
   AND referenced_name = 'YOUR_TABLE';


--ChecK all functions, procedures and packages
SELECT * 
  FROM ALL_OBJECTS 
 WHERE OBJECT_TYPE IN ('FUNCTION','PROCEDURE','PACKAGE');
/


--Check object by name
SELECT *
  FROM ALL_Objects
 WHERE OBJECT_NAME LIKE UPPER('%BC_POSIT_OUT_CRED%')
   AND STATUS = 'VALID';
/



--Check all texts in objects
SELECT *
  FROM ALL_SOURCE
 WHERE UPPER(TEXT) LIKE '%BC_GTP_EFINANC_PROC_SELETIVO%'; 
/


-- Recover recent data
select * 
  from table 
  as of timestamp systimestamp - interval '4' hour; -- max 4 hours
/


-- or
SELECT * 
  from table 
  as of timestamp to_timestamp('27-FEV-2020 12:00:00', 'DD-MON-YYYY HH24:MI:SS');
/


-- Verificar permissoes do usuário
SELECT * 
   FROM DBA_SYS_PRIVS 
 WHERE GRANTEE 
     LIKE 'SDBANCO';
/


-- Select para ver os locks no banco de dados
SELECT  S.SID, S.SERIAL#, P.SPID, S.USERNAME,
	S.STATUS, S.OSUSER, S.MACHINE,
	S.PROGRAM, S.MODULE,
	TO_CHAR(S.LOGON_TIME, 'dd/mm/yyyy hh24:mi:ss') LOGON_TIME,
	S.blocking_session, -- id da sessao bloqueadora (qdo for o caso)
	DBMS_LOB.SUBSTR(a.SQL_FULLTEXT, 4000,1) sql_text
FROM    V$SESSION S
JOIN    V$PROCESS P
  ON    P.addr = S.paddr
JOIN    V$SQLAREA A
  ON   s.sql_hash_value = a.hash_value
WHERE   TYPE = 'USER';
-- AND  S.USERNAME = 'X1' -- substituir X1 pelo nome do usuario no BD
-- AND  S.OSUSER = 'X2'  -- substituir X2 pelo nome do usuario no SO
-- AND  S.MACHINE = 'X3' -- subst. X3 pelo nome da máquina q está se conectando no BD
-- AND  S.PROGRAM = 'X4' -- subst. X4 pelo nome do programa q está se conectando no BD
-- AND  A.sql_text like '%X5%' -- subst. X5 por parte do SQL desejado
       

--ALTER SYSTEM KILL SESSION 'sid, serial# unlock session';
ALTER SYSTEM KILL SESSION '99, 7#' IMMEDIATE;


--Desabilitar triggers da tabela
ALTER TABLE table_name DISABLE ALL TRIGGERS;

--Habilitar triggers da tabela
ALTER TABLE table_name ENABLE ALL TRIGGERS;


-- TUNNING DE PL SQL
-- Verificar o plano de execução do comando SQL
EXPLAIN PLAN FOR select * from table;

--Depois de executado o comando acima, o display mostra o plano de execução
SELECT * FROM table(dbms_xplan.display);


-- Verificar o encode
SELECT * FROM nls_database_parameters WHERE parameter = 'NLS_CHARACTERSET';



/*
Consulta para identificar objetos descompilados na base de dados
*/
select 'alter '||decode( object_type , 'PACKAGE BODY' ,'PACKAGE' , OBJECT_TYPE) ||' '||object_name||
decode( object_type , 'PACKAGE BODY' ,' compile body;' , ' compile;')
from dba_objects
where status='INVALID' and owner in ( select user from dual)
order by object_type;

-- Compilar individualmente ALTER tipo_do_objeto nome_do_objeto COMPILE [ou compile body para o caso de packages];
ALTER PACKAGE PBCPOSIT COMPILE;


/*
Objetivo: Coletar estatísticas de tabelas específicas e seus índices
Parâmetros: 
Descrição: 1- Este script deve ser executado com o usuário SYS ou um usuário que tenha permissão de EXECUTE na procedure dbms_stats.gather_table_stats()
           2- Substituir &Modulo_Procurado pelo inicio das tabelas que devem ser geradas estatísticas. Ex: EM ou OP
Dicas de análise do log: 
--------------------------------------------------------------------------
27/12/2011 RSVA Criação do script
*/

prompt ====================================================
prompt Coletando Estatísticas de Tabelas e seus Índices
prompt 
prompt ====================================================
declare
  --
  cursor stats_cursor is
  select owner, table_name
  from all_tables
  where table_name LIKE (upper('BC_LOG_VALIDACAO_BASE_HIST'));
  --
begin
  --
  for tabela in stats_cursor loop
    dbms_stats.gather_table_stats(ownname => tabela.owner, tabname => tabela.table_name, cascade => true);
  end loop;
  --
end;
/


/* Verificar se coletou as estatística com o template Coletar_Estatisticas
   A coleta de estatísticas serve como um desfragmentador de dados.
   Toda vez que é executado ele faz como uma recompilação da base para 
   melhorar a performance. */
 SELECT STAT.OWNER         AS "Schema proprietário",
         STAT.TABLE_NAME    AS "Nome do objeto",
         STAT.OBJECT_TYPE   AS "Tipo do objeto",
         STAT.NUM_ROWS      AS "Quant. de Linhas",
         STAT.LAST_ANALYZED AS "Última coleta das estatísticas"
    FROM SYS.DBA_TAB_STATISTICS STAT
   WHERE STAT.OWNER = 'SDBANCO'
   and   STAT.TABLE_NAME in ('BC_LOG_VALIDACAO_BASE_HIST');


--================================ INDEX | INDICES =============================================

-- Exemplo da criação de índice no Oracle
CREATE INDEX nome_do_indice
ON nome_da_tabela (nome_do_campo_onde_ficara_o_indice);

-- Exemplo da criação de índice no Oracle em mais de um campo na tabela
CREATE INDEX nome_do_indice
ON nome_da_tabela (nome_do_campo_onde_ficara_o_indice, nome_do_campo_onde_ficara_o_indice);

-- Exemplo da alteração de índice no Oracle
ALTER INDEX nome_do_indice_atual
RENAME TO nome_do_novo_indice;

--Exemplo para checar a quantidade de índices em uma tabela no Oracle
SELECT nome_da_tabela as "NOME DA TABELA", count(*) as "QTDE. DE INDICES" FROM
dba_indexes WHERE owner=''''USUARIO'''' GROUP BY nome_da_tabela;

-- Exemplo da exclusão de índice no Oracle
DROP INDEX nome_do_indice;

-- Exemplo de uma consulta forçando a utilização de índice no Oracle
SELECT INDEX (nome_do_indice)
campos_da_tabela
FROM nome_dos_campos
WHERE cláusulas;

-- ================================USUÁRIO=======================================================

--Desbloquear conta de usuário
alter nome_user account unlock.

--Alterar a senha do usuário
alter user_name identified by password

-- ==============================================================================================

-- Habilitar o dbms_output.put_line para a seção
set serveroutput on;

-- Verificar o padrão de formato de data definido no banco de dados pela constant NLS_DATE_FORMAT
select sysdate from dual;

-- Caso precise alterar
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY MM DD';
select sysdate from dual;

ALTER SESSION SET NLS_DATE_FORMAT = 'HH24:MI:SS';
select sysdate from dual;




