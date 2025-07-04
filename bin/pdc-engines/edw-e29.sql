-- generated as: C:\apps\bin.scripts\bin\pdc-generate.pl --cleaningdir o2_bin --curdate_related=1 -e 29 -n EDW_A29 -s NTINFOT401_A29 --no-partitions --no-retence --no-stats --tick_length 5 --command COMMAND_A29



-- SYSTEM_NAME = NTINFOT401_A29 -- pro produkci přepsat na správný produkční!
alter session set  nls_date_format = "YYYY-MM-DD";
alter session set  nls_timestamp_format = "YYYY-MM-DD hh:mi:ss";
--set echo on;
------------------------------------------------------------------------------------------------------------------------
--
-- Likvidace prostedi, opakovatelnost davky
--
------------------------------------------------------------------------------------------------------------------------
DELETE from CTRL_JOB_DEPENDENCY WHERE JOB_NAME IN ( SELECT JOB_NAME FROM CTRL_JOB WHERE ENGINE_ID = 29 );
DELETE from CTRL_JOB_TABLE_REF WHERE JOB_NAME IN ( SELECT JOB_NAME FROM CTRL_JOB WHERE ENGINE_ID = 29 );
DELETE from CTRL_JOB WHERE ENGINE_ID = 29;
DELETE from CTRL_STREAM WHERE STREAM_NAME LIKE '%.29' OR STREAM_NAME IN('INITIALIZATION_029', 'MAINT_029' , 'START_029', 'FINAL_029');
DELETE from CTRL_STREAM_DEPENDENCY WHERE STREAM_NAME LIKE '%.29' OR STREAM_NAME IN('INITIALIZATION_029', 'MAINT_029', 'START_029', 'FINAL_029' );
DELETE from CTRL_STREAM_DEPENDENCY WHERE PARENT_STREAM_NAME LIKE '%.29' OR PARENT_STREAM_NAME IN('INITIALIZATION_029', 'MAINT_029', 'START_029', 'FINAL_029' );
DELETE from CTRL_STREAM_PLAN_REF WHERE STREAM_NAME LIKE '%.29' OR STREAM_NAME IN('INITIALIZATION_029', 'MAINT_029', 'START_029', 'FINAL_029' );

DELETE FROM CTRL_PARAMETERS where param_cd = 29;
DELETE FROM CTRL_TASK_PARAMETERS where ENGINE_ID = 29;
DELETE FROM SESS_QUEUE where ENGINE_ID = 29;
commit;

DELETE from LKP_JOB_CATEGORY WHERE JOB_CATEGORY='COMMAND_A29';
INSERT INTO LKP_JOB_CATEGORY VALUES ('COMMAND_A29','COMMAND_A29 - EDW_A29',0);

------------------------------------------------------------------------------------------------------------------------
--
-- Odvozeno z puvodni sablony od Teradaty (excel)
--
------------------------------------------------------------------------------------------------------------------------
INSERT INTO CTRL_PARAMETERS VALUES('APPLICATION_ID',29,'SCHEDULER',0,NULL,NULL,NULL,'Hodnota application_id prave probihajiciho zpracovani');
INSERT INTO CTRL_PARAMETERS VALUES('DQ_ACTIVE',29,'DATA_QUALITY',0,NULL,NULL,NULL,'Zapinani kontroly datove kvality');
INSERT INTO CTRL_PARAMETERS VALUES('DQ_EXPIRATION_DAYS',29,'DATA_QUALITY',30,NULL,NULL,NULL,'Po kolika dnech expiruji vysledky kontrol datove kvality');
INSERT INTO CTRL_PARAMETERS VALUES('ENGINE_STATUS',29,'SCHEDULER',NULL,'NTINFOT401_A29',NULL,'2000-01-01','Timestamp posledni otacky Engine');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_BEGIN',29,'SCHEDULER',NULL,NULL,NULL,'2000-01-01','Timestamp zacatku inicializace');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_DELAY_DAYS',29,'SCHEDULER',0,NULL,NULL,NULL,'O kolik dni je inicializace opozdena, pro D-1 je hodnota 0');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_DURATION_MINUTES',29,'SCHEDULER',20,NULL,NULL,NULL,'Maximalni tolerovana doba behu inicializace');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_END',29,'SCHEDULER',NULL,NULL,NULL,'2000-01-01','Timestamp konce inicializace');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_HOUR',29,'SCHEDULER',0,NULL,NULL,NULL,'Na kolikatou hodinu je nacasovana inicializace, hodnota slouzi pro Framework checker k hlidani, zda inicializace byla provedena');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_IS_RUNNING',29,'SCHEDULER',0,NULL,NULL,NULL,'Informace, zda prave probiha inicializace, 1=probiha');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_MUST_RUN',29,'SCHEDULER',1,NULL,NULL,NULL,'Zda musi byt inicializace provedena, pro denni load je 1, pro interday je 0');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_RETENTION_PERIOD',29,'SCHEDULER',5,NULL,NULL,NULL,'Po kolika minutach se provadi inicializace');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_CURRDATE_RELATED',29,'SCHEDULER',1,NULL,NULL,NULL,'Jestli inicializace vychazi z curr_date');
INSERT INTO CTRL_PARAMETERS VALUES('LOAD_DATE',29,'SCHEDULER',NULL,NULL,'2000-01-01','2000-01-01',NULL);
INSERT INTO CTRL_PARAMETERS VALUES('LOAD_SEQ_NUM',29,'SCHEDULER',0,NULL,NULL,NULL,'Sekvencni cislo loadu');
INSERT INTO CTRL_PARAMETERS VALUES('MANUAL_BATCH_LOAD_DATE',29,'SCHEDULER',NULL,NULL,NULL,NULL,'Load date probihajici rucni davky');
INSERT INTO CTRL_PARAMETERS VALUES('MAX_CONCURRENT_JOBS',29,'SCHEDULER',10,NULL,NULL,NULL,NULL);
INSERT INTO CTRL_PARAMETERS VALUES('MAX_CONCURRENT_JOBS_BCKP',29,'SCHEDULER',10,NULL,NULL,NULL,'Ulozeni nastaveneho poctu maximalne bezicich uloh');
INSERT INTO CTRL_PARAMETERS VALUES('MAX_CONCURRENT_JOBS_DFLT',29,'SCHEDULER',10,NULL,NULL,NULL,'Defaultni hodnota nastaveni maximalniho poctu uloh, hodnota se pouzije po inicializace');
INSERT INTO CTRL_PARAMETERS VALUES('MAX_LOAD_DATE',29,'SCHEDULER',NULL,NULL,'2119-12-31',NULL,'Maximalni hodnota Load date, tento datum bude poslednim, ktery se inicializuje');
INSERT INTO CTRL_PARAMETERS VALUES('PREV_LOAD_DATE',29,'SCHEDULER',NULL,NULL,'1999-12-31','1999-12-31','Load date za ktery probehlo minule zpracovani');
INSERT INTO CTRL_PARAMETERS VALUES('SCHEDULER_PROVIDED_BY',29,'SCHEDULER',NULL,'SCHEDULER',NULL,NULL,NULL);
INSERT INTO CTRL_PARAMETERS VALUES('ENGINE_NAME',29,'SCHEDULER',NULL,'EDW_A29',NULL,NULL,'Oznaceni enginu');
INSERT INTO CTRL_PARAMETERS VALUES('ENGINE_CONTROL',29,'SCHEDULER',0,'NTINFOT401_A29',NULL,NULL,'Engine control 0=give control, 1=take control for system param_val_char');

-- REM INSERTING into PDC.CTRL_TASK_PARAMETERS
-- SET DEFINE OFF;
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values (null,'PARALLELISM_CONTROL','0','150','150',null,'COMMAND_GROUP','COMMAND_GROUP','0','99999999','29','NTINFOT401_A29',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values (null,'TASK_MIN_CONTROL','0','6','6',null,'COMMAND_GROUP','COMMAND_GROUP','0','99999999','29','NTINFOT401_A29',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values (null,'PARALLELISM_CONTROL','0','150','150',null,'COMMAND','COMMAND_GROUP','0','99999999','29','NTINFOT401_A29',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values (null,'TASK_MIN_CONTROL','0','6','6',null,'COMMAND','COMMAND_GROUP','0','99999999','29','NTINFOT401_A29',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values ('SMALL','TOUGH_CATEGORY_CONTROL','0','10','10',null,'COMMAND',null,'0','99999999','29','NTINFOT401_A29',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values ('MEDIUM','TOUGH_CATEGORY_CONTROL','0','20','20',null,'COMMAND',null,'0','99999999','29','NTINFOT401_A29',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values ('LARGE','TOUGH_CATEGORY_CONTROL','0','40','40',null,'COMMAND',null,'0','99999999','29','NTINFOT401_A29',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values ('EXCEPTIONAL','TOUGH_CATEGORY_CONTROL','0','80','80',null,'COMMAND',null,'0','99999999','29','NTINFOT401_A29',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values (null,'PARALLELISM_CONTROL','0','150','150',null,'COMMAND_GROUP_E29','COMMAND_GROUP_E29','0','99999999','29','NTINFOT401_A29',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values (null,'TASK_MIN_CONTROL','0','6','6',null,'COMMAND_GROUP_E29','COMMAND_GROUP_E29','0','99999999','29','NTINFOT401_A29',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values (null,'PARALLELISM_CONTROL','0','150','150',null,'COMMAND_A29','COMMAND_GROUP_E29','0','99999999','29','NTINFOT401_A29',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values (null,'TASK_MIN_CONTROL','0','6','6',null,'COMMAND_A29','COMMAND_GROUP_E29','0','99999999','29','NTINFOT401_A29',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values ('SMALL','TOUGH_CATEGORY_CONTROL','0','10','10',null,'COMMAND_A29',null,'0','99999999','29','NTINFOT401_A29',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values ('MEDIUM','TOUGH_CATEGORY_CONTROL','0','20','20',null,'COMMAND_A29',null,'0','99999999','29','NTINFOT401_A29',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values ('LARGE','TOUGH_CATEGORY_CONTROL','0','40','40',null,'COMMAND_A29',null,'0','99999999','29','NTINFOT401_A29',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values ('EXCEPTIONAL','TOUGH_CATEGORY_CONTROL','0','80','80',null,'COMMAND_A29',null,'0','99999999','29','NTINFOT401_A29',null);

commit;

--INSERT INTO CTRL_STREAM VALUES(stream_name,stream_desc,note);


INSERT INTO CTRL_STREAM VALUES('INITIALIZATION_029','Stream contains jobs for initialization',NULL);
--INSERT INTO CTRL_STREAM VALUES('ABORT_INFA_029','Abort stream for informatica jobs',NULL);

--INSERT INTO CTRL_JOB VALUES(job_name,stream_name,priority,cmd_line,src_sys_id,phase,table_name,job_category,job_type,cont_anyway,max_runs,always_restart,status_begin,waiting_hr,deadline_hr,engine_id,job_desc,author,note);


INSERT INTO CTRL_JOB VALUES('Initialize_part_1_029','INITIALIZATION_029',1000,'perl %PMRootDir%/Bin/Framework/Init_Initialize.pl -engine 29 -x 9 -debug',NULL,'INITIALIZATION',NULL,'COMMAND','ORACLE_PROCEDURE','SMALL',0,3,1,NULL,NULL,NULL,29,NULL,NULL,NULL);
INSERT INTO CTRL_JOB VALUES('Initialize_part_2_029','INITIALIZATION_029',1000,'perl %PMRootDir%/Bin/Framework/Init_Initialize_end.pl -engine 29 -x 9 -debug',NULL,'INITIALIZATION',NULL,'COMMAND','ORACLE_PROCEDURE','SMALL',0,3,1,NULL,NULL,NULL,29,NULL,NULL,NULL);
INSERT INTO CTRL_JOB VALUES('Cleaning_029','INITIALIZATION_029',1000,'perl %PMRootDir%/o2_bin/cleaning.pl -engine 29 -x 9 -debug',NULL,'INITIALIZATION',NULL,'COMMAND','COMMAND','SMALL',0,3,1,NULL,NULL,NULL,29,NULL,NULL,NULL);

--INSERT INTO CTRL_JOB_DEPENDENCY VALUES(job_name,parent_job_name,rel_type);


INSERT INTO CTRL_JOB_DEPENDENCY VALUES('Cleaning_029','Initialize_part_1_029',NULL);
INSERT INTO CTRL_JOB_DEPENDENCY VALUES('Initialize_part_2_029','Cleaning_029',NULL);

--INSERT INTO CTRL_STREAM_PLAN_REF VALUES(stream_name,runplan,country_cd);


INSERT INTO CTRL_STREAM_PLAN_REF VALUES('INITIALIZATION_029','WR001007E',NULL);


------------------------------------------------------------------------------------------------------------------------
--
-- Doplnujici zmeny nad ramec puvodni XLS sablony
--
-- virtulni uzly
-- INITIALIZATION => MAINT => START => FINAL
--
------------------------------------------------------------------------------------------------------------------------
INSERT INTO CTRL_STREAM VALUES('MAINT_029','MAINT_029','Maintenance tasky spoustene pred uzlem START_029');
INSERT INTO CTRL_STREAM_PLAN_REF VALUES ('MAINT_029', 'WR001007E', NULL);

INSERT INTO CTRL_STREAM VALUES('START_029','START_029','Tento uzel startuje load pro PMRootDir_E29');
INSERT INTO CTRL_STREAM_PLAN_REF VALUES('START_029','WR001007E',NULL);

INSERT INTO CTRL_STREAM VALUES('FINAL_029','FINAL_029','Tento uzel konci load pro PMRootDir_E29');
INSERT INTO CTRL_STREAM_PLAN_REF VALUES ('FINAL_029', 'WR001007E', NULL);

INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('MAINT_029', 'INITIALIZATION_029', NULL);
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('FINAL_029', 'START_029', NULL);
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('START_029', 'MAINT_029', NULL);
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('FINAL_029', 'MAINT_029', NULL);


-- Kazdy uzel musi obsahovat aspon jeden job
MERGE INTO CTRL_JOB t
USING (
        SELECT
            'MAINT_029_ECHO_ON'         as JOB_NAME
          , 'MAINT_029' as STREAM_NAME
          , 1000                as PRIORITY
          , 'echo on'           as CMD_LINE
          , NULL                as SRC_SYS_ID
          , 'INIT'              as PHASE
          , NULL                as TABLE_NAME
          , 'COMMAND'           as JOB_CATEGORY
          , 'COMMAND'           as JOB_TYPE
          , 'SMALL'             as TOUGHNESS
          , 0                   as CONT_ANYWAY
          , 3                   as MAX_RUNS
          , 1                   as ALWAYS_RESTART
          , NULL                as STATUS_BEGIN
          , NULL                as WAITING_HR
          , NULL                as DEADLINE_HR
          , 29                   as ENGINE_ID
          , NULL                as JOB_DESC
          , NULL                as AUTHOR
          , NULL                as NOTE
        FROM DUAL
    )
    s
ON (
        s.JOB_NAME = t.JOB_NAME
    )
WHEN MATCHED THEN
UPDATE
SET STREAM_NAME    = s.STREAM_NAME
  , PRIORITY       = s.PRIORITY
  , CMD_LINE       = s.CMD_LINE
  , SRC_SYS_ID     = s.SRC_SYS_ID
  , PHASE          = s.PHASE
  , TABLE_NAME     = s.TABLE_NAME
  , JOB_CATEGORY   = s.JOB_CATEGORY
  , JOB_TYPE       = s.JOB_TYPE
  , TOUGHNESS      = s.TOUGHNESS
  , CONT_ANYWAY    = s.CONT_ANYWAY
  , MAX_RUNS       = s.MAX_RUNS
  , ALWAYS_RESTART = s.ALWAYS_RESTART
  , STATUS_BEGIN   = s.STATUS_BEGIN
  , WAITING_HR     = s.WAITING_HR
  , DEADLINE_HR    = s.DEADLINE_HR
  , ENGINE_ID      = s.ENGINE_ID
  , JOB_DESC       = s.JOB_DESC
  , AUTHOR         = s.AUTHOR
  , NOTE           = s.NOTE
WHEN NOT MATCHED THEN
INSERT VALUES (
        s.JOB_NAME
      , s.STREAM_NAME
      , s.PRIORITY
      , s.CMD_LINE
      , s.SRC_SYS_ID
      , s.PHASE
      , s.TABLE_NAME
      , s.JOB_CATEGORY
      , s.JOB_TYPE
      , s.TOUGHNESS
      , s.CONT_ANYWAY
      , s.MAX_RUNS
      , s.ALWAYS_RESTART
      , s.STATUS_BEGIN
      , s.WAITING_HR
      , s.DEADLINE_HR
      , s.ENGINE_ID
      , s.JOB_DESC
      , s.AUTHOR
      , s.NOTE)
;

MERGE INTO CTRL_JOB t
USING (
        SELECT
            'START_029_ECHO_ON'         as JOB_NAME
          , 'START_029' as STREAM_NAME
          , 1000                as PRIORITY
          , 'echo on'           as CMD_LINE
          , NULL                as SRC_SYS_ID
          , 'INIT'              as PHASE
          , NULL                as TABLE_NAME
          , 'COMMAND'           as JOB_CATEGORY
          , 'COMMAND'           as JOB_TYPE
          , 'SMALL'             as TOUGHNESS
          , 0                   as CONT_ANYWAY
          , 3                   as MAX_RUNS
          , 1                   as ALWAYS_RESTART
          , NULL                as STATUS_BEGIN
          , NULL                as WAITING_HR
          , NULL                as DEADLINE_HR
          , 29                   as ENGINE_ID
          , NULL                as JOB_DESC
          , NULL                as AUTHOR
          , NULL                as NOTE
        FROM DUAL
    )
    s
ON (
        s.JOB_NAME = t.JOB_NAME
    )
WHEN MATCHED THEN
UPDATE
SET STREAM_NAME    = s.STREAM_NAME
  , PRIORITY       = s.PRIORITY
  , CMD_LINE       = s.CMD_LINE
  , SRC_SYS_ID     = s.SRC_SYS_ID
  , PHASE          = s.PHASE
  , TABLE_NAME     = s.TABLE_NAME
  , JOB_CATEGORY   = s.JOB_CATEGORY
  , JOB_TYPE       = s.JOB_TYPE
  , TOUGHNESS      = s.TOUGHNESS
  , CONT_ANYWAY    = s.CONT_ANYWAY
  , MAX_RUNS       = s.MAX_RUNS
  , ALWAYS_RESTART = s.ALWAYS_RESTART
  , STATUS_BEGIN   = s.STATUS_BEGIN
  , WAITING_HR     = s.WAITING_HR
  , DEADLINE_HR    = s.DEADLINE_HR
  , ENGINE_ID      = s.ENGINE_ID
  , JOB_DESC       = s.JOB_DESC
  , AUTHOR         = s.AUTHOR
  , NOTE           = s.NOTE
WHEN NOT MATCHED THEN
INSERT VALUES (
        s.JOB_NAME
      , s.STREAM_NAME
      , s.PRIORITY
      , s.CMD_LINE
      , s.SRC_SYS_ID
      , s.PHASE
      , s.TABLE_NAME
      , s.JOB_CATEGORY
      , s.JOB_TYPE
      , s.TOUGHNESS
      , s.CONT_ANYWAY
      , s.MAX_RUNS
      , s.ALWAYS_RESTART
      , s.STATUS_BEGIN
      , s.WAITING_HR
      , s.DEADLINE_HR
      , s.ENGINE_ID
      , s.JOB_DESC
      , s.AUTHOR
      , s.NOTE)
;

MERGE INTO CTRL_JOB t
USING (
        SELECT
            'FINAL_029_ECHO_ON'         as JOB_NAME
          , 'FINAL_029' as STREAM_NAME
          , 1000                as PRIORITY
          , 'echo on'           as CMD_LINE
          , NULL                as SRC_SYS_ID
          , 'INIT'              as PHASE
          , NULL                as TABLE_NAME
          , 'COMMAND'           as JOB_CATEGORY
          , 'COMMAND'           as JOB_TYPE
          , 'SMALL'             as TOUGHNESS
          , 0                   as CONT_ANYWAY
          , 3                   as MAX_RUNS
          , 1                   as ALWAYS_RESTART
          , NULL                as STATUS_BEGIN
          , NULL                as WAITING_HR
          , NULL                as DEADLINE_HR
          , 29                   as ENGINE_ID
          , NULL                as JOB_DESC
          , NULL                as AUTHOR
          , NULL                as NOTE
        FROM DUAL
    )
    s
ON (
        s.JOB_NAME = t.JOB_NAME
    )
WHEN MATCHED THEN
UPDATE
SET STREAM_NAME    = s.STREAM_NAME
  , PRIORITY       = s.PRIORITY
  , CMD_LINE       = s.CMD_LINE
  , SRC_SYS_ID     = s.SRC_SYS_ID
  , PHASE          = s.PHASE
  , TABLE_NAME     = s.TABLE_NAME
  , JOB_CATEGORY   = s.JOB_CATEGORY
  , JOB_TYPE       = s.JOB_TYPE
  , TOUGHNESS      = s.TOUGHNESS
  , CONT_ANYWAY    = s.CONT_ANYWAY
  , MAX_RUNS       = s.MAX_RUNS
  , ALWAYS_RESTART = s.ALWAYS_RESTART
  , STATUS_BEGIN   = s.STATUS_BEGIN
  , WAITING_HR     = s.WAITING_HR
  , DEADLINE_HR    = s.DEADLINE_HR
  , ENGINE_ID      = s.ENGINE_ID
  , JOB_DESC       = s.JOB_DESC
  , AUTHOR         = s.AUTHOR
  , NOTE           = s.NOTE
WHEN NOT MATCHED THEN
INSERT VALUES (
        s.JOB_NAME
      , s.STREAM_NAME
      , s.PRIORITY
      , s.CMD_LINE
      , s.SRC_SYS_ID
      , s.PHASE
      , s.TABLE_NAME
      , s.JOB_CATEGORY
      , s.JOB_TYPE
      , s.TOUGHNESS
      , s.CONT_ANYWAY
      , s.MAX_RUNS
      , s.ALWAYS_RESTART
      , s.STATUS_BEGIN
      , s.WAITING_HR
      , s.DEADLINE_HR
      , s.ENGINE_ID
      , s.JOB_DESC
      , s.AUTHOR
      , s.NOTE)
;
commit;

-----------------------------------------------
-- director, checker
-----------------------------------------------
-- START_029 => DIRECTOR_RUN_029 => FINAL_029
DELETE FROM CTRL_STREAM WHERE STREAM_NAME = 'DIRECTOR_RUN_029';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE STREAM_NAME = 'DIRECTOR_RUN_029';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE PARENT_STREAM_NAME = 'DIRECTOR_RUN_029';
INSERT INTO CTRL_STREAM VALUES('DIRECTOR_RUN_029','DIRECTOR_RUN_029','Pod timto streamem pobezi director');
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('FINAL_029', 'DIRECTOR_RUN_029', NULL);
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('DIRECTOR_RUN_029', 'START_029', NULL);
INSERT INTO CTRL_STREAM_PLAN_REF VALUES('DIRECTOR_RUN_029','WR001007E',NULL);


DELETE FROM CTRL_STREAM WHERE STREAM_NAME = 'CHECKER_RUN_029';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE STREAM_NAME = 'CHECKER_RUN_029';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE PARENT_STREAM_NAME = 'CHECKER_RUN_029';
INSERT INTO CTRL_STREAM VALUES('CHECKER_RUN_029','CHECKER_RUN_029','Pod timto streamem pobezi CHECKER');
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('FINAL_029', 'CHECKER_RUN_029', NULL);
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('CHECKER_RUN_029', 'START_029', NULL);
INSERT INTO CTRL_STREAM_PLAN_REF VALUES('CHECKER_RUN_029','WR001007E',NULL);

commit;
-----------------------------------------------
-- DIRECTOR
-----------------------------------------------
MERGE 
INTO 
                 CTRL_JOB T 
USING 
                 ( SELECT
                        'DIRECTOR_A29'                           AS JOB_NAME
                       ,'DIRECTOR_RUN_029'                       AS STREAM_NAME                       
                       , 9000                                    AS PRIORITY
                       ,'director.director.py'                   AS CMD_LINE
                       , NULL                                    AS SRC_SYS_ID
                       ,'LL_LOAD'                                AS PHASE
                       ,NULL                                     AS TABLE_NAME
                       ,'COMMAND_A29'                            AS JOB_CATEGORY
                       ,'PYTHON_SCRIPT'                          AS JOB_TYPE
                       , 0                                       AS CONT_ANYWAY
                       , 9999                                    AS MAX_RUNS
                       , 1                                       AS ALWAYS_RESTART
                       , NULL                                    AS STATUS_BEGIN
                       , NULL                                    AS WAITING_HR
                       , NULL                                    AS DEADLINE_HR
                       ,  29                                     AS ENGINE_ID
                       , NULL                                    AS JOB_DESC
                       ,'GENERATED'                              AS AUTHOR
                       , NULL                                    AS NOTE
                       ,'LARGE'                                  AS TOUGHNESS
                 FROM 
                         DUAL ) 
                 S 
ON 
                 ( 
                                  S.JOB_NAME = T.JOB_NAME 
                 )
WHEN NOT MATCHED 
                 THEN
INSERT 
             ( 
                          JOB_NAME 
                        , STREAM_NAME 
                        , PRIORITY 
                        , CMD_LINE 
                        , SRC_SYS_ID 
                        , PHASE 
                        , TABLE_NAME 
                        , JOB_CATEGORY 
                        , JOB_TYPE 
                        , CONT_ANYWAY 
                        , MAX_RUNS 
                        , ALWAYS_RESTART 
                        , STATUS_BEGIN 
                        , WAITING_HR 
                        , DEADLINE_HR 
                        , ENGINE_ID 
                        , JOB_DESC 
                        , AUTHOR 
                        , NOTE 
                        , TOUGHNESS 
             )
             VALUES ( 
                          S.JOB_NAME 
                        , S.STREAM_NAME 
                        , S.PRIORITY 
                        , S.CMD_LINE 
                        , S.SRC_SYS_ID 
                        , S.PHASE 
                        , S.TABLE_NAME 
                        , S.JOB_CATEGORY 
                        , S.JOB_TYPE 
                        , S.CONT_ANYWAY 
                        , S.MAX_RUNS 
                        , S.ALWAYS_RESTART 
                        , S.STATUS_BEGIN 
                        , S.WAITING_HR 
                        , S.DEADLINE_HR 
                        , S.ENGINE_ID 
                        , S.JOB_DESC 
                        , S.AUTHOR 
                        , S.NOTE 
                        , S.TOUGHNESS 
             )
WHEN MATCHED 
             THEN
UPDATE 
SET
       STREAM_NAME    = S.STREAM_NAME
     , PRIORITY       = S.PRIORITY
     , CMD_LINE       = S.CMD_LINE
     , SRC_SYS_ID     = S.SRC_SYS_ID
     , PHASE          = S.PHASE
     , TABLE_NAME     = S.TABLE_NAME
     , JOB_CATEGORY   = S.JOB_CATEGORY
     , JOB_TYPE       = S.JOB_TYPE
     , CONT_ANYWAY    = S.CONT_ANYWAY
     , MAX_RUNS       = S.MAX_RUNS
     , ALWAYS_RESTART = S.ALWAYS_RESTART
     , STATUS_BEGIN   = S.STATUS_BEGIN
     , WAITING_HR     = S.WAITING_HR
     , DEADLINE_HR    = S.DEADLINE_HR
     , ENGINE_ID      = S.ENGINE_ID
     , JOB_DESC       = S.JOB_DESC
     , AUTHOR         = S.AUTHOR
     , NOTE           = S.NOTE
     , TOUGHNESS      = S.TOUGHNESS;
     
     
-----------------------------------------------
-- CLEANING, DQ LOAD, archivace extraktů
-----------------------------------------------
DELETE FROM CTRL_STREAM WHERE STREAM_NAME = 'MAINT_TASKS_029';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE STREAM_NAME = 'MAINT_TASKS_029';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE PARENT_STREAM_NAME = 'MAINT_TASKS_029';

INSERT INTO CTRL_STREAM VALUES('MAINT_TASKS_029','MAINT_TASKS_029','Pod timto streamem pobezi maintenance ulohy');
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('FINAL_029', 'MAINT_TASKS_029', NULL);
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('MAINT_TASKS_029', 'START_029', NULL);
INSERT INTO CTRL_STREAM_PLAN_REF VALUES('MAINT_TASKS_029','WR001007E',NULL);

MERGE 
INTO 
                 CTRL_JOB T 
USING 
                 ( SELECT
                        'MAINT_TASKS_029_CLEANING'               AS JOB_NAME
                       ,'MAINT_TASKS_029'                        AS STREAM_NAME                       
                       , 9000                                    AS PRIORITY
                       ,'perl %PMRootDir%/o2_bin/director_cleaning.pl -engine 29 -x 9 -debug' AS CMD_LINE
                       , NULL                                    AS SRC_SYS_ID
                       ,'LL_LOAD'                                AS PHASE
                       ,NULL                                     AS TABLE_NAME
                       ,'COMMAND'                                AS JOB_CATEGORY
                       ,'COMMAND'                                AS JOB_TYPE
                       , 0                                       AS CONT_ANYWAY
                       , 3                                       AS MAX_RUNS
                       , 1                                       AS ALWAYS_RESTART
                       , 1000                                    AS STATUS_BEGIN
                       , NULL                                    AS WAITING_HR
                       , NULL                                    AS DEADLINE_HR
                       ,  29                                      AS ENGINE_ID
                       , NULL                                    AS JOB_DESC
                       ,'GENERATED'                              AS AUTHOR
                       , NULL                                    AS NOTE
                       ,'LARGE'                                  AS TOUGHNESS
                 FROM 
                         DUAL ) 
                 S 
ON 
                 ( 
                                  S.JOB_NAME = T.JOB_NAME 
                 )
WHEN NOT MATCHED 
                 THEN
INSERT 
             ( 
                          JOB_NAME 
                        , STREAM_NAME 
                        , PRIORITY 
                        , CMD_LINE 
                        , SRC_SYS_ID 
                        , PHASE 
                        , TABLE_NAME 
                        , JOB_CATEGORY 
                        , JOB_TYPE 
                        , CONT_ANYWAY 
                        , MAX_RUNS 
                        , ALWAYS_RESTART 
                        , STATUS_BEGIN 
                        , WAITING_HR 
                        , DEADLINE_HR 
                        , ENGINE_ID 
                        , JOB_DESC 
                        , AUTHOR 
                        , NOTE 
                        , TOUGHNESS 
             )
             VALUES ( 
                          S.JOB_NAME 
                        , S.STREAM_NAME 
                        , S.PRIORITY 
                        , S.CMD_LINE 
                        , S.SRC_SYS_ID 
                        , S.PHASE 
                        , S.TABLE_NAME 
                        , S.JOB_CATEGORY 
                        , S.JOB_TYPE 
                        , S.CONT_ANYWAY 
                        , S.MAX_RUNS 
                        , S.ALWAYS_RESTART 
                        , S.STATUS_BEGIN 
                        , S.WAITING_HR 
                        , S.DEADLINE_HR 
                        , S.ENGINE_ID 
                        , S.JOB_DESC 
                        , S.AUTHOR 
                        , S.NOTE 
                        , S.TOUGHNESS 
             )
WHEN MATCHED 
             THEN
UPDATE 
SET
       STREAM_NAME    = S.STREAM_NAME
     , PRIORITY       = S.PRIORITY
     , CMD_LINE       = S.CMD_LINE
     , SRC_SYS_ID     = S.SRC_SYS_ID
     , PHASE          = S.PHASE
     , TABLE_NAME     = S.TABLE_NAME
     , JOB_CATEGORY   = S.JOB_CATEGORY
     , JOB_TYPE       = S.JOB_TYPE
     , CONT_ANYWAY    = S.CONT_ANYWAY
     , MAX_RUNS       = S.MAX_RUNS
     , ALWAYS_RESTART = S.ALWAYS_RESTART
     , STATUS_BEGIN   = S.STATUS_BEGIN
     , WAITING_HR     = S.WAITING_HR
     , DEADLINE_HR    = S.DEADLINE_HR
     , ENGINE_ID      = S.ENGINE_ID
     , JOB_DESC       = S.JOB_DESC
     , AUTHOR         = S.AUTHOR
     , NOTE           = S.NOTE
     , TOUGHNESS      = S.TOUGHNESS;     
     
     

-- nemame vstupni extrakty, nespoustej to -- MERGE
-- nemame vstupni extrakty, nespoustej to -- INTO
-- nemame vstupni extrakty, nespoustej to --     CTRL_JOB T
-- nemame vstupni extrakty, nespoustej to -- USING (
-- nemame vstupni extrakty, nespoustej to --         SELECT
-- nemame vstupni extrakty, nespoustej to --             'MAINT_TASKS_029_ARCH_FIRE_AND_FORGET'      AS JOB_NAME
-- nemame vstupni extrakty, nespoustej to --           ,'MAINT_TASKS_029'                            AS STREAM_NAME
-- nemame vstupni extrakty, nespoustej to --           , 9000                                        AS PRIORITY
-- nemame vstupni extrakty, nespoustej to --           ,'maint.arch.arch_fire_and_forget.py'         AS CMD_LINE
-- nemame vstupni extrakty, nespoustej to --           , NULL                                        AS SRC_SYS_ID
-- nemame vstupni extrakty, nespoustej to --           ,'LL_LOAD'                                    AS PHASE
-- nemame vstupni extrakty, nespoustej to --           , NULL                                        AS TABLE_NAME
-- nemame vstupni extrakty, nespoustej to --           ,'COMMAND_A29'                                AS JOB_CATEGORY
-- nemame vstupni extrakty, nespoustej to --           ,'PYTHON_SCRIPT'                              AS JOB_TYPE
-- nemame vstupni extrakty, nespoustej to --           , 0                                           AS CONT_ANYWAY
-- nemame vstupni extrakty, nespoustej to --           , 1                                           AS MAX_RUNS
-- nemame vstupni extrakty, nespoustej to --           , 1                                           AS ALWAYS_RESTART
-- nemame vstupni extrakty, nespoustej to --           , 1000       AS STATUS_BEGIN
-- nemame vstupni extrakty, nespoustej to --           , NULL       AS WAITING_HR
-- nemame vstupni extrakty, nespoustej to --           , NULL       AS DEADLINE_HR
-- nemame vstupni extrakty, nespoustej to --           , 9          AS ENGINE_ID
-- nemame vstupni extrakty, nespoustej to --           , NULL       AS JOB_DESC
-- nemame vstupni extrakty, nespoustej to --           ,'GENERATED' AS AUTHOR
-- nemame vstupni extrakty, nespoustej to --           , NULL       AS NOTE
-- nemame vstupni extrakty, nespoustej to --           ,'LARGE'     AS TOUGHNESS
-- nemame vstupni extrakty, nespoustej to --         FROM DUAL
-- nemame vstupni extrakty, nespoustej to --     )
-- nemame vstupni extrakty, nespoustej to --     S
-- nemame vstupni extrakty, nespoustej to -- ON (
-- nemame vstupni extrakty, nespoustej to --         S.JOB_NAME = T.JOB_NAME
-- nemame vstupni extrakty, nespoustej to --     )
-- nemame vstupni extrakty, nespoustej to -- WHEN NOT MATCHED THEN
-- nemame vstupni extrakty, nespoustej to -- INSERT (
-- nemame vstupni extrakty, nespoustej to --         JOB_NAME
-- nemame vstupni extrakty, nespoustej to --       , STREAM_NAME
-- nemame vstupni extrakty, nespoustej to --       , PRIORITY
-- nemame vstupni extrakty, nespoustej to --       , CMD_LINE
-- nemame vstupni extrakty, nespoustej to --       , SRC_SYS_ID
-- nemame vstupni extrakty, nespoustej to --       , PHASE
-- nemame vstupni extrakty, nespoustej to --       , TABLE_NAME
-- nemame vstupni extrakty, nespoustej to --       , JOB_CATEGORY
-- nemame vstupni extrakty, nespoustej to --       , JOB_TYPE
-- nemame vstupni extrakty, nespoustej to --       , CONT_ANYWAY
-- nemame vstupni extrakty, nespoustej to --       , MAX_RUNS
-- nemame vstupni extrakty, nespoustej to --       , ALWAYS_RESTART
-- nemame vstupni extrakty, nespoustej to --       , STATUS_BEGIN
-- nemame vstupni extrakty, nespoustej to --       , WAITING_HR
-- nemame vstupni extrakty, nespoustej to --       , DEADLINE_HR
-- nemame vstupni extrakty, nespoustej to --       , ENGINE_ID
-- nemame vstupni extrakty, nespoustej to --       , JOB_DESC
-- nemame vstupni extrakty, nespoustej to --       , AUTHOR
-- nemame vstupni extrakty, nespoustej to --       , NOTE
-- nemame vstupni extrakty, nespoustej to --       , TOUGHNESS )
-- nemame vstupni extrakty, nespoustej to --     VALUES (
-- nemame vstupni extrakty, nespoustej to --         S.JOB_NAME
-- nemame vstupni extrakty, nespoustej to --       , S.STREAM_NAME
-- nemame vstupni extrakty, nespoustej to --       , S.PRIORITY
-- nemame vstupni extrakty, nespoustej to --       , S.CMD_LINE
-- nemame vstupni extrakty, nespoustej to --       , S.SRC_SYS_ID
-- nemame vstupni extrakty, nespoustej to --       , S.PHASE
-- nemame vstupni extrakty, nespoustej to --       , S.TABLE_NAME
-- nemame vstupni extrakty, nespoustej to --       , S.JOB_CATEGORY
-- nemame vstupni extrakty, nespoustej to --       , S.JOB_TYPE
-- nemame vstupni extrakty, nespoustej to --       , S.CONT_ANYWAY
-- nemame vstupni extrakty, nespoustej to --       , S.MAX_RUNS
-- nemame vstupni extrakty, nespoustej to --       , S.ALWAYS_RESTART
-- nemame vstupni extrakty, nespoustej to --       , S.STATUS_BEGIN
-- nemame vstupni extrakty, nespoustej to --       , S.WAITING_HR
-- nemame vstupni extrakty, nespoustej to --       , S.DEADLINE_HR
-- nemame vstupni extrakty, nespoustej to --       , S.ENGINE_ID
-- nemame vstupni extrakty, nespoustej to --       , S.JOB_DESC
-- nemame vstupni extrakty, nespoustej to --       , S.AUTHOR
-- nemame vstupni extrakty, nespoustej to --       , S.NOTE
-- nemame vstupni extrakty, nespoustej to --       , S.TOUGHNESS )
-- nemame vstupni extrakty, nespoustej to -- WHEN MATCHED THEN
-- nemame vstupni extrakty, nespoustej to -- UPDATE
-- nemame vstupni extrakty, nespoustej to -- SET STREAM_NAME    = S.STREAM_NAME
-- nemame vstupni extrakty, nespoustej to --   , PRIORITY       = S.PRIORITY
-- nemame vstupni extrakty, nespoustej to --   , CMD_LINE       = S.CMD_LINE
-- nemame vstupni extrakty, nespoustej to --   , SRC_SYS_ID     = S.SRC_SYS_ID
-- nemame vstupni extrakty, nespoustej to --   , PHASE          = S.PHASE
-- nemame vstupni extrakty, nespoustej to --   , TABLE_NAME     = S.TABLE_NAME
-- nemame vstupni extrakty, nespoustej to --   , JOB_CATEGORY   = S.JOB_CATEGORY
-- nemame vstupni extrakty, nespoustej to --   , JOB_TYPE       = S.JOB_TYPE
-- nemame vstupni extrakty, nespoustej to --   , CONT_ANYWAY    = S.CONT_ANYWAY
-- nemame vstupni extrakty, nespoustej to --   , MAX_RUNS       = S.MAX_RUNS
-- nemame vstupni extrakty, nespoustej to --   , ALWAYS_RESTART = S.ALWAYS_RESTART
-- nemame vstupni extrakty, nespoustej to --   , STATUS_BEGIN   = S.STATUS_BEGIN
-- nemame vstupni extrakty, nespoustej to --   , WAITING_HR     = S.WAITING_HR
-- nemame vstupni extrakty, nespoustej to --   , DEADLINE_HR    = S.DEADLINE_HR
-- nemame vstupni extrakty, nespoustej to --   , ENGINE_ID      = S.ENGINE_ID
-- nemame vstupni extrakty, nespoustej to --   , JOB_DESC       = S.JOB_DESC
-- nemame vstupni extrakty, nespoustej to --   , AUTHOR         = S.AUTHOR
-- nemame vstupni extrakty, nespoustej to --   , NOTE           = S.NOTE
-- nemame vstupni extrakty, nespoustej to --   , TOUGHNESS      = S.TOUGHNESS
-- nemame vstupni extrakty, nespoustej to -- ;

-----------------------------------------------
-- FINAL
-----------------------------------------------
INSERT INTO CTRL_STREAM_PLAN_REF VALUES('FINAL_029','WR001007E',NULL);

commit;

DELETE FROM CTRL_STREAM WHERE STREAM_NAME = 'MART_CONDUCTOR_029';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE STREAM_NAME = 'MART_CONDUCTOR_029';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE PARENT_STREAM_NAME = 'MART_CONDUCTOR_029';
INSERT INTO CTRL_STREAM VALUES('MART_CONDUCTOR_029','MART_CONDUCTOR_029','Pod timto streamem pobezi datamart conductor');
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('FINAL_029', 'MART_CONDUCTOR_029', NULL);
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('MART_CONDUCTOR_029', 'START_029', NULL);
INSERT INTO CTRL_STREAM_PLAN_REF VALUES('MART_CONDUCTOR_029','WR001007E',NULL);


-----------------------------------------------
-- DIRECTOR
-----------------------------------------------
MERGE 
INTO 
                 CTRL_JOB T 
USING 
                 ( SELECT
                        'MART_CONDUCTOR_029'                     AS JOB_NAME        -- přes něj se restartuje. "MART_CONDUCTOR_" + str(ctx.engine_id).zfill(3)
                       ,'MART_CONDUCTOR_029'                     AS STREAM_NAME                       
                       , 9000                                    AS PRIORITY
                       ,'director.mart_conductor.py'             AS CMD_LINE
                       , NULL                                    AS SRC_SYS_ID
                       ,'LL_LOAD'                                AS PHASE
                       ,NULL                                     AS TABLE_NAME
                       ,'COMMAND_A29'                            AS JOB_CATEGORY
                       ,'PYTHON_SCRIPT'                          AS JOB_TYPE
                       , 0                                       AS CONT_ANYWAY
                       , 3                                       AS MAX_RUNS
                       , 1                                       AS ALWAYS_RESTART
                       , NULL                                    AS STATUS_BEGIN
                       , NULL                                    AS WAITING_HR
                       , NULL                                    AS DEADLINE_HR
                       ,  29                                     AS ENGINE_ID
                       , NULL                                    AS JOB_DESC
                       ,'GENERATED'                              AS AUTHOR
                       , NULL                                    AS NOTE
                       ,'LARGE'                                  AS TOUGHNESS
                 FROM 
                         DUAL ) 
                 S 
ON 
                 ( 
                                  S.JOB_NAME = T.JOB_NAME 
                 )
WHEN NOT MATCHED 
                 THEN
INSERT 
             ( 
                          JOB_NAME 
                        , STREAM_NAME 
                        , PRIORITY 
                        , CMD_LINE 
                        , SRC_SYS_ID 
                        , PHASE 
                        , TABLE_NAME 
                        , JOB_CATEGORY 
                        , JOB_TYPE 
                        , CONT_ANYWAY 
                        , MAX_RUNS 
                        , ALWAYS_RESTART 
                        , STATUS_BEGIN 
                        , WAITING_HR 
                        , DEADLINE_HR 
                        , ENGINE_ID 
                        , JOB_DESC 
                        , AUTHOR 
                        , NOTE 
                        , TOUGHNESS 
             )
             VALUES ( 
                          S.JOB_NAME 
                        , S.STREAM_NAME 
                        , S.PRIORITY 
                        , S.CMD_LINE 
                        , S.SRC_SYS_ID 
                        , S.PHASE 
                        , S.TABLE_NAME 
                        , S.JOB_CATEGORY 
                        , S.JOB_TYPE 
                        , S.CONT_ANYWAY 
                        , S.MAX_RUNS 
                        , S.ALWAYS_RESTART 
                        , S.STATUS_BEGIN 
                        , S.WAITING_HR 
                        , S.DEADLINE_HR 
                        , S.ENGINE_ID 
                        , S.JOB_DESC 
                        , S.AUTHOR 
                        , S.NOTE 
                        , S.TOUGHNESS 
             )
WHEN MATCHED 
             THEN
UPDATE 
SET
       STREAM_NAME    = S.STREAM_NAME
     , PRIORITY       = S.PRIORITY
     , CMD_LINE       = S.CMD_LINE
     , SRC_SYS_ID     = S.SRC_SYS_ID
     , PHASE          = S.PHASE
     , TABLE_NAME     = S.TABLE_NAME
     , JOB_CATEGORY   = S.JOB_CATEGORY
     , JOB_TYPE       = S.JOB_TYPE
     , CONT_ANYWAY    = S.CONT_ANYWAY
     , MAX_RUNS       = S.MAX_RUNS
     , ALWAYS_RESTART = S.ALWAYS_RESTART
     , STATUS_BEGIN   = S.STATUS_BEGIN
     , WAITING_HR     = S.WAITING_HR
     , DEADLINE_HR    = S.DEADLINE_HR
     , ENGINE_ID      = S.ENGINE_ID
     , JOB_DESC       = S.JOB_DESC
     , AUTHOR         = S.AUTHOR
     , NOTE           = S.NOTE
     , TOUGHNESS      = S.TOUGHNESS;
     
commit;

delete from sess_job where engine_id = 29;