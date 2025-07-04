

-- generated as: C:\apps\bin.scripts\bin\pdc-generate.pl --cleaningdir o2_bin --curdate_related=1 -e 09 -n EDW_ASG -s NTINFOT401_ASG --no-partitions --no-retence --no-stats --tick_length 5

/*
 * pozor na konci máš výmaz conductor jobu
 */



-- SYSTEM_NAME = NTINFOT401_ASG -- pro produkci přepsat na správný produkční!
alter session set  nls_date_format = "YYYY-MM-DD";
alter session set  nls_timestamp_format = "YYYY-MM-DD hh:mi:ss";
--set echo on;
------------------------------------------------------------------------------------------------------------------------
--
-- Likvidace prostedi, opakovatelnost davky
--
------------------------------------------------------------------------------------------------------------------------
DELETE from CTRL_JOB_DEPENDENCY WHERE JOB_NAME IN ( SELECT JOB_NAME FROM CTRL_JOB WHERE ENGINE_ID = 09 );
DELETE from CTRL_JOB_TABLE_REF WHERE JOB_NAME IN ( SELECT JOB_NAME FROM CTRL_JOB WHERE ENGINE_ID = 09 );
DELETE from CTRL_JOB WHERE ENGINE_ID = 09;
DELETE from CTRL_STREAM WHERE STREAM_NAME LIKE '%.09' OR STREAM_NAME IN('INITIALIZATION_009', 'MAINT_009' , 'START_009', 'FINAL_009');
DELETE from CTRL_STREAM_DEPENDENCY WHERE STREAM_NAME LIKE '%.09' OR STREAM_NAME IN('INITIALIZATION_009', 'MAINT_009', 'START_009', 'FINAL_009' );
DELETE from CTRL_STREAM_DEPENDENCY WHERE PARENT_STREAM_NAME LIKE '%.09' OR PARENT_STREAM_NAME IN('INITIALIZATION_009', 'MAINT_009', 'START_009', 'FINAL_009' );
DELETE from CTRL_STREAM_PLAN_REF WHERE STREAM_NAME LIKE '%.09' OR STREAM_NAME IN('INITIALIZATION_009', 'MAINT_009', 'START_009', 'FINAL_009' );

DELETE FROM CTRL_PARAMETERS where param_cd = 09;
DELETE FROM CTRL_TASK_PARAMETERS where ENGINE_ID = 09;
DELETE FROM SESS_QUEUE where ENGINE_ID = 09;
commit;

DELETE from LKP_JOB_CATEGORY WHERE JOB_CATEGORY='COMMAND_E09';
INSERT INTO LKP_JOB_CATEGORY VALUES ('COMMAND_E09','COMMAND_E09 - EDW_ASG',0);

------------------------------------------------------------------------------------------------------------------------
--
-- Odvozeno z puvodni sablony od Teradaty (excel)
--
------------------------------------------------------------------------------------------------------------------------
INSERT INTO CTRL_PARAMETERS VALUES('APPLICATION_ID',09,'SCHEDULER',0,NULL,NULL,NULL,'Hodnota application_id prave probihajiciho zpracovani');
INSERT INTO CTRL_PARAMETERS VALUES('DQ_ACTIVE',09,'DATA_QUALITY',0,NULL,NULL,NULL,'Zapinani kontroly datove kvality');
INSERT INTO CTRL_PARAMETERS VALUES('DQ_EXPIRATION_DAYS',09,'DATA_QUALITY',30,NULL,NULL,NULL,'Po kolika dnech expiruji vysledky kontrol datove kvality');
INSERT INTO CTRL_PARAMETERS VALUES('ENGINE_STATUS',09,'SCHEDULER',NULL,'NTINFOT401_ASG',NULL,'2000-01-01','Timestamp posledni otacky Engine');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_BEGIN',09,'SCHEDULER',NULL,NULL,NULL,'2000-01-01','Timestamp zacatku inicializace');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_DELAY_DAYS',09,'SCHEDULER',0,NULL,NULL,NULL,'O kolik dni je inicializace opozdena, pro D-1 je hodnota 0');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_DURATION_MINUTES',09,'SCHEDULER',20,NULL,NULL,NULL,'Maximalni tolerovana doba behu inicializace');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_END',09,'SCHEDULER',NULL,NULL,NULL,'2000-01-01','Timestamp konce inicializace');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_HOUR',09,'SCHEDULER',0,NULL,NULL,NULL,'Na kolikatou hodinu je nacasovana inicializace, hodnota slouzi pro Framework checker k hlidani, zda inicializace byla provedena');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_IS_RUNNING',09,'SCHEDULER',0,NULL,NULL,NULL,'Informace, zda prave probiha inicializace, 1=probiha');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_MUST_RUN',09,'SCHEDULER',1,NULL,NULL,NULL,'Zda musi byt inicializace provedena, pro denni load je 1, pro interday je 0');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_RETENTION_PERIOD',09,'SCHEDULER',5,NULL,NULL,NULL,'Po kolika minutach se provadi inicializace');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_CURRDATE_RELATED',09,'SCHEDULER',1,NULL,NULL,NULL,'Jestli inicializace vychazi z curr_date');
INSERT INTO CTRL_PARAMETERS VALUES('LOAD_DATE',09,'SCHEDULER',NULL,NULL,'2000-01-01','2000-01-01',NULL);
INSERT INTO CTRL_PARAMETERS VALUES('LOAD_SEQ_NUM',09,'SCHEDULER',0,NULL,NULL,NULL,'Sekvencni cislo loadu');
INSERT INTO CTRL_PARAMETERS VALUES('MANUAL_BATCH_LOAD_DATE',09,'SCHEDULER',NULL,NULL,NULL,NULL,'Load date probihajici rucni davky');
INSERT INTO CTRL_PARAMETERS VALUES('MAX_CONCURRENT_JOBS',09,'SCHEDULER',10,NULL,NULL,NULL,NULL);
INSERT INTO CTRL_PARAMETERS VALUES('MAX_CONCURRENT_JOBS_BCKP',09,'SCHEDULER',10,NULL,NULL,NULL,'Ulozeni nastaveneho poctu maximalne bezicich uloh');
INSERT INTO CTRL_PARAMETERS VALUES('MAX_CONCURRENT_JOBS_DFLT',09,'SCHEDULER',10,NULL,NULL,NULL,'Defaultni hodnota nastaveni maximalniho poctu uloh, hodnota se pouzije po inicializace');
INSERT INTO CTRL_PARAMETERS VALUES('MAX_LOAD_DATE',09,'SCHEDULER',NULL,NULL,'2119-12-31',NULL,'Maximalni hodnota Load date, tento datum bude poslednim, ktery se inicializuje');
INSERT INTO CTRL_PARAMETERS VALUES('PREV_LOAD_DATE',09,'SCHEDULER',NULL,NULL,'1999-12-31','1999-12-31','Load date za ktery probehlo minule zpracovani');
INSERT INTO CTRL_PARAMETERS VALUES('SCHEDULER_PROVIDED_BY',09,'SCHEDULER',NULL,'SCHEDULER',NULL,NULL,NULL);
INSERT INTO CTRL_PARAMETERS VALUES('ENGINE_NAME',09,'SCHEDULER',NULL,'EDW_ASG',NULL,NULL,'Oznaceni enginu');
INSERT INTO CTRL_PARAMETERS VALUES('ENGINE_CONTROL',09,'SCHEDULER',0,'NTINFOT401_ASG',NULL,NULL,'Engine control 0=give control, 1=take control for system param_val_char');

-- REM INSERTING into PDC.CTRL_TASK_PARAMETERS
-- SET DEFINE OFF;
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values (null,'PARALLELISM_CONTROL','0','150','150',null,'COMMAND_GROUP','COMMAND_GROUP','0','99999999','09','NTINFOT401_ASG',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values (null,'TASK_MIN_CONTROL','0','6','6',null,'COMMAND_GROUP','COMMAND_GROUP','0','99999999','09','NTINFOT401_ASG',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values (null,'PARALLELISM_CONTROL','0','150','150',null,'COMMAND','COMMAND_GROUP','0','99999999','09','NTINFOT401_ASG',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values (null,'TASK_MIN_CONTROL','0','6','6',null,'COMMAND','COMMAND_GROUP','0','99999999','09','NTINFOT401_ASG',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values ('SMALL','TOUGH_CATEGORY_CONTROL','0','10','10',null,'COMMAND',null,'0','99999999','09','NTINFOT401_ASG',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values ('MEDIUM','TOUGH_CATEGORY_CONTROL','0','20','20',null,'COMMAND',null,'0','99999999','09','NTINFOT401_ASG',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values ('LARGE','TOUGH_CATEGORY_CONTROL','0','40','40',null,'COMMAND',null,'0','99999999','09','NTINFOT401_ASG',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values ('EXCEPTIONAL','TOUGH_CATEGORY_CONTROL','0','80','80',null,'COMMAND',null,'0','99999999','09','NTINFOT401_ASG',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values (null,'PARALLELISM_CONTROL','0','150','150',null,'COMMAND_GROUP_E09','COMMAND_GROUP_E09','0','99999999','09','NTINFOT401_ASG',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values (null,'TASK_MIN_CONTROL','0','6','6',null,'COMMAND_GROUP_E09','COMMAND_GROUP_E09','0','99999999','09','NTINFOT401_ASG',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values (null,'PARALLELISM_CONTROL','0','150','150',null,'COMMAND_E09','COMMAND_GROUP_E09','0','99999999','09','NTINFOT401_ASG',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values (null,'TASK_MIN_CONTROL','0','6','6',null,'COMMAND_E09','COMMAND_GROUP_E09','0','99999999','09','NTINFOT401_ASG',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values ('SMALL','TOUGH_CATEGORY_CONTROL','0','10','10',null,'COMMAND_E09',null,'0','99999999','09','NTINFOT401_ASG',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values ('MEDIUM','TOUGH_CATEGORY_CONTROL','0','20','20',null,'COMMAND_E09',null,'0','99999999','09','NTINFOT401_ASG',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values ('LARGE','TOUGH_CATEGORY_CONTROL','0','40','40',null,'COMMAND_E09',null,'0','99999999','09','NTINFOT401_ASG',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values ('EXCEPTIONAL','TOUGH_CATEGORY_CONTROL','0','80','80',null,'COMMAND_E09',null,'0','99999999','09','NTINFOT401_ASG',null);

commit;

--INSERT INTO CTRL_STREAM VALUES(stream_name,stream_desc,note);


INSERT INTO CTRL_STREAM VALUES('INITIALIZATION_009','Stream contains jobs for initialization',NULL);
--INSERT INTO CTRL_STREAM VALUES('ABORT_INFA_009','Abort stream for informatica jobs',NULL);

--INSERT INTO CTRL_JOB VALUES(job_name,stream_name,priority,cmd_line,src_sys_id,phase,table_name,job_category,job_type,cont_anyway,max_runs,always_restart,status_begin,waiting_hr,deadline_hr,engine_id,job_desc,author,note);


INSERT INTO CTRL_JOB VALUES('Initialize_part_1_009','INITIALIZATION_009',1000,'perl %PMRootDir%/Bin/Framework/Init_Initialize.pl -engine 09 -x 9 -debug',NULL,'INITIALIZATION',NULL,'COMMAND','ORACLE_PROCEDURE','SMALL',0,3,1,NULL,NULL,NULL,09,NULL,NULL,NULL);
INSERT INTO CTRL_JOB VALUES('Initialize_part_2_009','INITIALIZATION_009',1000,'perl %PMRootDir%/Bin/Framework/Init_Initialize_end.pl -engine 09 -x 9 -debug',NULL,'INITIALIZATION',NULL,'COMMAND','ORACLE_PROCEDURE','SMALL',0,3,1,NULL,NULL,NULL,09,NULL,NULL,NULL);
INSERT INTO CTRL_JOB VALUES('Cleaning_009','INITIALIZATION_009',1000,'perl %PMRootDir%/o2_bin/cleaning.pl -engine 09 -x 9 -debug',NULL,'INITIALIZATION',NULL,'COMMAND','COMMAND','SMALL',0,3,1,NULL,NULL,NULL,09,NULL,NULL,NULL);

--INSERT INTO CTRL_JOB_DEPENDENCY VALUES(job_name,parent_job_name,rel_type);


INSERT INTO CTRL_JOB_DEPENDENCY VALUES('Cleaning_009','Initialize_part_1_009',NULL);
INSERT INTO CTRL_JOB_DEPENDENCY VALUES('Initialize_part_2_009','Cleaning_009',NULL);

--INSERT INTO CTRL_STREAM_PLAN_REF VALUES(stream_name,runplan,country_cd);


INSERT INTO CTRL_STREAM_PLAN_REF VALUES('INITIALIZATION_009','WR001007E',NULL);


------------------------------------------------------------------------------------------------------------------------
--
-- Doplnujici zmeny nad ramec puvodni XLS sablony
--
-- virtulni uzly
-- INITIALIZATION => MAINT => START => FINAL
--
------------------------------------------------------------------------------------------------------------------------
INSERT INTO CTRL_STREAM VALUES('MAINT_009','MAINT_009','Maintenance tasky spoustene pred uzlem START_009');
INSERT INTO CTRL_STREAM_PLAN_REF VALUES ('MAINT_009', 'WR001007E', NULL);

INSERT INTO CTRL_STREAM VALUES('START_009','START_009','Tento uzel startuje load pro PMRootDir_E09');
INSERT INTO CTRL_STREAM_PLAN_REF VALUES('START_009','WR001007E',NULL);

INSERT INTO CTRL_STREAM VALUES('FINAL_009','FINAL_009','Tento uzel konci load pro PMRootDir_E09');
INSERT INTO CTRL_STREAM_PLAN_REF VALUES ('FINAL_009', 'WR001007E', NULL);

INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('MAINT_009', 'INITIALIZATION_009', NULL);
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('FINAL_009', 'START_009', NULL);
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('START_009', 'MAINT_009', NULL);
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('FINAL_009', 'MAINT_009', NULL);


-- Kazdy uzel musi obsahovat aspon jeden job
MERGE INTO CTRL_JOB t
USING (
        SELECT
            'MAINT_009_ECHO_ON'         as JOB_NAME
          , 'MAINT_009' as STREAM_NAME
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
          , 09                   as ENGINE_ID
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
            'START_009_ECHO_ON'         as JOB_NAME
          , 'START_009' as STREAM_NAME
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
          , 09                   as ENGINE_ID
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
            'FINAL_009_ECHO_ON'         as JOB_NAME
          , 'FINAL_009' as STREAM_NAME
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
          , 09                   as ENGINE_ID
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
-- stream pro datové úlohy
-----------------------------------------------
-- START_009 => AP_LND.MICROBATCH.09 => FINAL_009
DELETE FROM CTRL_STREAM WHERE STREAM_NAME = 'AP_LND.MICROBATCH.09';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE STREAM_NAME = 'AP_LND.MICROBATCH.09';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE PARENT_STREAM_NAME = 'AP_LND.MICROBATCH.09';

INSERT INTO CTRL_STREAM VALUES('AP_LND.MICROBATCH.09','AP_LND.MICROBATCH.09','Pod timto streamem pobezi jednotlive datovu ulohy');
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('FINAL_009', 'AP_LND.MICROBATCH.09', NULL);
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('AP_LND.MICROBATCH.09', 'START_009', NULL);
INSERT INTO CTRL_STREAM_PLAN_REF VALUES('AP_LND.MICROBATCH.09','WR001007E',NULL);

-----------------------------------------------
-- director, checker
-----------------------------------------------
-- START_009 => DIRECTOR_RUN_009 => FINAL_009
DELETE FROM CTRL_STREAM WHERE STREAM_NAME = 'DIRECTOR_RUN_009';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE STREAM_NAME = 'DIRECTOR_RUN_009';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE PARENT_STREAM_NAME = 'DIRECTOR_RUN_009';
INSERT INTO CTRL_STREAM VALUES('DIRECTOR_RUN_009','DIRECTOR_RUN_009','Pod timto streamem pobezi director');
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('FINAL_009', 'DIRECTOR_RUN_009', NULL);
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('DIRECTOR_RUN_009', 'START_009', NULL);
INSERT INTO CTRL_STREAM_PLAN_REF VALUES('DIRECTOR_RUN_009','WR001007E',NULL);


DELETE FROM CTRL_STREAM WHERE STREAM_NAME = 'CHECKER_RUN_009';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE STREAM_NAME = 'CHECKER_RUN_009';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE PARENT_STREAM_NAME = 'CHECKER_RUN_009';
INSERT INTO CTRL_STREAM VALUES('CHECKER_RUN_009','CHECKER_RUN_009','Pod timto streamem pobezi CHECKER');
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('FINAL_009', 'CHECKER_RUN_009', NULL);
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('CHECKER_RUN_009', 'START_009', NULL);
INSERT INTO CTRL_STREAM_PLAN_REF VALUES('CHECKER_RUN_009','WR001007E',NULL);

commit;

-----------------------------------------------
-- CHECKER
-----------------------------------------------
MERGE
INTO
    CTRL_JOB T
USING (
        SELECT
            'CHECKER_RUN_009_CHECK_ARCH_JOBS.09' AS JOB_NAME
          ,'CHECKER_RUN_009'                     AS STREAM_NAME
          , 9000                                 AS PRIORITY
          ,'maint.arch.arch_checker.py'          AS CMD_LINE
          , NULL                                 AS SRC_SYS_ID
          ,'LL_LOAD'                             AS PHASE
          , NULL                                 AS TABLE_NAME
          ,'COMMAND_E09'   AS JOB_CATEGORY
          ,'PYTHON_SCRIPT' AS JOB_TYPE
          , 0              AS CONT_ANYWAY
          , 3              AS MAX_RUNS
          , 1              AS ALWAYS_RESTART
          , NULL       AS STATUS_BEGIN
          , NULL       AS WAITING_HR
          , NULL       AS DEADLINE_HR
          , 9          AS ENGINE_ID
          , NULL       AS JOB_DESC
          ,'GENERATED' AS AUTHOR
          , NULL       AS NOTE
          ,'LARGE'     AS TOUGHNESS
        FROM DUAL
    )
    S
ON (
        S.JOB_NAME = T.JOB_NAME
    )
WHEN NOT MATCHED THEN
INSERT (
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
      , TOUGHNESS )
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
      , S.TOUGHNESS )
WHEN MATCHED THEN
UPDATE
SET STREAM_NAME    = S.STREAM_NAME
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
  , TOUGHNESS      = S.TOUGHNESS
;

-----------------------------------------------
-- DIRECTOR
-----------------------------------------------
--update ctrl_job 
--set job_type='PYTHON_SCRIPT', cmd_line='director.director.py'
--where job_name = 'AP_STG.DIRECTOR.09';
--commit;

MERGE 
INTO 
                 CTRL_JOB T 
USING 
                 ( SELECT
                        'AP_STG.DIRECTOR.09'                     AS JOB_NAME
                       ,'DIRECTOR_RUN_009'                       AS STREAM_NAME                       
                       , 9000                                    AS PRIORITY
                       ,'director.director.py'                   AS CMD_LINE
                       , NULL                                    AS SRC_SYS_ID
                       ,'LL_LOAD'                                AS PHASE
                       ,NULL                                     AS TABLE_NAME
                       ,'COMMAND_E09'                            AS JOB_CATEGORY
                       ,'PYTHON_SCRIPT'                          AS JOB_TYPE
                       , 0                                       AS CONT_ANYWAY
                       , 9999                                    AS MAX_RUNS
                       , 1                                       AS ALWAYS_RESTART
                       , NULL                                    AS STATUS_BEGIN
                       , NULL                                    AS WAITING_HR
                       , NULL                                    AS DEADLINE_HR
                       ,  9                                      AS ENGINE_ID
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
DELETE FROM CTRL_STREAM WHERE STREAM_NAME = 'MAINT_TASKS_009';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE STREAM_NAME = 'MAINT_TASKS_009';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE PARENT_STREAM_NAME = 'MAINT_TASKS_009';

INSERT INTO CTRL_STREAM VALUES('MAINT_TASKS_009','MAINT_TASKS_009','Pod timto streamem pobezi maintenance ulohy');
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('FINAL_009', 'MAINT_TASKS_009', NULL);
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('MAINT_TASKS_009', 'START_009', NULL);
INSERT INTO CTRL_STREAM_PLAN_REF VALUES('MAINT_TASKS_009','WR001007E',NULL);

MERGE 
INTO 
                 CTRL_JOB T 
USING 
                 ( SELECT
                        'MAINT_TASKS_009_CLEANING.09'            AS JOB_NAME
                       ,'MAINT_TASKS_009'                        AS STREAM_NAME                       
                       , 9000                                    AS PRIORITY
                       ,'perl %PMRootDir%/o2_bin/director_cleaning.pl -engine 09 -x 9 -debug' AS CMD_LINE
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
                       ,  9                                      AS ENGINE_ID
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
     
     
MERGE
INTO
    CTRL_JOB T
USING (
        SELECT
            'MAINT_TASKS_009_DQ_10000_LOAD.09' AS JOB_NAME
          ,'MAINT_TASKS_009'                   AS STREAM_NAME
          , 9000                               AS PRIORITY
          ,'daq.ll_dq_load.dq_10000_load.py'   AS CMD_LINE
          , NULL                               AS SRC_SYS_ID
          ,'LL_LOAD'                           AS PHASE
          , NULL                               AS TABLE_NAME
          ,'COMMAND_E09'   AS JOB_CATEGORY
          ,'PYTHON_SCRIPT' AS JOB_TYPE
          , 0              AS CONT_ANYWAY
          , 3              AS MAX_RUNS
          , 1              AS ALWAYS_RESTART
          , 1000       AS STATUS_BEGIN
          , NULL       AS WAITING_HR
          , NULL       AS DEADLINE_HR
          , 9          AS ENGINE_ID
          , NULL       AS JOB_DESC
          ,'GENERATED' AS AUTHOR
          , NULL       AS NOTE
          ,'LARGE'     AS TOUGHNESS
        FROM DUAL
    )
    S
ON (
        S.JOB_NAME = T.JOB_NAME
    )
WHEN NOT MATCHED THEN
INSERT (
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
      , TOUGHNESS )
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
      , S.TOUGHNESS )
WHEN MATCHED THEN
UPDATE
SET STREAM_NAME    = S.STREAM_NAME
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
  , TOUGHNESS      = S.TOUGHNESS
;

MERGE
INTO
    CTRL_JOB T
USING (
        SELECT
            'MAINT_TASKS_009_ERR_TABLES.09'    AS JOB_NAME
          ,'MAINT_TASKS_009'                   AS STREAM_NAME
          , 9000                               AS PRIORITY
          ,'MAINT.ERR.tables.py'               AS CMD_LINE
          , NULL                               AS SRC_SYS_ID
          ,'LL_LOAD'                           AS PHASE
          , NULL                               AS TABLE_NAME
          ,'COMMAND_E09'   AS JOB_CATEGORY
          ,'PYTHON_SCRIPT' AS JOB_TYPE
          , 0              AS CONT_ANYWAY
          , 3              AS MAX_RUNS
          , 1              AS ALWAYS_RESTART
          , 1000       AS STATUS_BEGIN
          , NULL       AS WAITING_HR
          , NULL       AS DEADLINE_HR
          , 9          AS ENGINE_ID
          , NULL       AS JOB_DESC
          ,'GENERATED' AS AUTHOR
          , NULL       AS NOTE
          ,'LARGE'     AS TOUGHNESS
        FROM DUAL
    )
    S
ON (
        S.JOB_NAME = T.JOB_NAME
    )
WHEN NOT MATCHED THEN
INSERT (
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
      , TOUGHNESS )
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
      , S.TOUGHNESS )
WHEN MATCHED THEN
UPDATE
SET STREAM_NAME    = S.STREAM_NAME
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
  , TOUGHNESS      = S.TOUGHNESS
;

MERGE
INTO
    CTRL_JOB T
USING (
        SELECT
            'MAINT_TASKS_009_ARCH_FIRE_AND_FORGET.09'   AS JOB_NAME
          ,'MAINT_TASKS_009'                            AS STREAM_NAME
          , 9000                                        AS PRIORITY
          ,'maint.arch.arch_fire_and_forget.py'         AS CMD_LINE
          , NULL                                        AS SRC_SYS_ID
          ,'LL_LOAD'                                    AS PHASE
          , NULL                                        AS TABLE_NAME
          ,'COMMAND_E09'                                AS JOB_CATEGORY
          ,'PYTHON_SCRIPT'                              AS JOB_TYPE
          , 0                                           AS CONT_ANYWAY
          , 1                                           AS MAX_RUNS
          , 1                                           AS ALWAYS_RESTART
          , 1000       AS STATUS_BEGIN
          , NULL       AS WAITING_HR
          , NULL       AS DEADLINE_HR
          , 9          AS ENGINE_ID
          , NULL       AS JOB_DESC
          ,'GENERATED' AS AUTHOR
          , NULL       AS NOTE
          ,'LARGE'     AS TOUGHNESS
        FROM DUAL
    )
    S
ON (
        S.JOB_NAME = T.JOB_NAME
    )
WHEN NOT MATCHED THEN
INSERT (
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
      , TOUGHNESS )
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
      , S.TOUGHNESS )
WHEN MATCHED THEN
UPDATE
SET STREAM_NAME    = S.STREAM_NAME
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
  , TOUGHNESS      = S.TOUGHNESS
;

-----------------------------------------------
-- FINAL
-----------------------------------------------
INSERT INTO CTRL_STREAM_PLAN_REF VALUES('FINAL_009','WR001007E',NULL);

commit;

DELETE FROM CTRL_STREAM WHERE STREAM_NAME = 'MART_CONDUCTOR_009';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE STREAM_NAME = 'MART_CONDUCTOR_009';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE PARENT_STREAM_NAME = 'MART_CONDUCTOR_009';
INSERT INTO CTRL_STREAM VALUES('MART_CONDUCTOR_009','MART_CONDUCTOR_009','Pod timto streamem pobezi datamart conductor');
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('FINAL_009', 'MART_CONDUCTOR_009', NULL);
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('MART_CONDUCTOR_009', 'START_009', NULL);
INSERT INTO CTRL_STREAM_PLAN_REF VALUES('MART_CONDUCTOR_009','WR001007E',NULL);


-----------------------------------------------
-- DIRECTOR
-----------------------------------------------
--update ctrl_job 
--set job_type='PYTHON_SCRIPT', cmd_line='director.director.py'
--where job_name = 'EP_ASG.DIRECTOR.09';
--commit;

MERGE 
INTO 
                 CTRL_JOB T 
USING 
                 ( SELECT
                        'MART_CONDUCTOR_009'                     AS JOB_NAME        -- přes něj se restartuje. "MART_CONDUCTOR_" + str(ctx.engine_id).zfill(3)
                       ,'MART_CONDUCTOR_009'                     AS STREAM_NAME                       
                       , 9000                                    AS PRIORITY
                       ,'director.mart_conductor.py'             AS CMD_LINE
                       , NULL                                    AS SRC_SYS_ID
                       ,'LL_LOAD'                                AS PHASE
                       ,NULL                                     AS TABLE_NAME
                       ,'COMMAND_E09'                            AS JOB_CATEGORY
                       ,'PYTHON_SCRIPT'                          AS JOB_TYPE
                       , 0                                       AS CONT_ANYWAY
                       , 3                                       AS MAX_RUNS
                       , 1                                       AS ALWAYS_RESTART
                       , NULL                                    AS STATUS_BEGIN
                       , NULL                                    AS WAITING_HR
                       , NULL                                    AS DEADLINE_HR
                       ,  9                                      AS ENGINE_ID
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

DELETE FROM sess_job WHERE engine_id = 9;
COMMIT;

-- nový job!
MERGE
INTO
    CTRL_JOB T
USING (
        SELECT
            'MAINT_TASKS_009_DQ_20000_LOAD.09' AS JOB_NAME
          ,'MAINT_TASKS_009'                   AS STREAM_NAME
          , 9000                               AS PRIORITY
          ,'daq.ll_dq_load.dq_20000_load.py'   AS CMD_LINE
          , NULL                               AS SRC_SYS_ID
          ,'LL_LOAD'                           AS PHASE
          , NULL                               AS TABLE_NAME
          ,'COMMAND_E09'   AS JOB_CATEGORY
          ,'PYTHON_SCRIPT' AS JOB_TYPE
          , 0              AS CONT_ANYWAY
          , 3              AS MAX_RUNS
          , 1              AS ALWAYS_RESTART
          , 1000       AS STATUS_BEGIN
          , NULL       AS WAITING_HR
          , NULL       AS DEADLINE_HR
          , 9          AS ENGINE_ID
          , NULL       AS JOB_DESC
          ,'GENERATED' AS AUTHOR
          , NULL       AS NOTE
          ,'LARGE'     AS TOUGHNESS
        FROM DUAL
    )
    S
ON (
        S.JOB_NAME = T.JOB_NAME
    )
WHEN NOT MATCHED THEN
INSERT (
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
      , TOUGHNESS )
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
      , S.TOUGHNESS )
WHEN MATCHED THEN
UPDATE
SET STREAM_NAME    = S.STREAM_NAME
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
  , TOUGHNESS      = S.TOUGHNESS
;
COMMIT;

TRUNCATE TABLE CTRL_KEY_VAL_STORE ;


MERGE INTO CTRL_JOB_DEPENDENCY T USING (
  SELECT   
    'MAINT_TASKS_009_CLEANING.09' AS JOB_NAME
    ,'MAINT_TASKS_009_ASG_DATA_STAT_RET.09' AS PARENT_JOB_NAME
    ,NULL                                   AS REL_TYPE
  FROM DUAL ) S ON (S.JOB_NAME = T.JOB_NAME AND S.PARENT_JOB_NAME = T.PARENT_JOB_NAME)
WHEN NOT MATCHED THEN 
  INSERT (JOB_NAME,PARENT_JOB_NAME,REL_TYPE)
  VALUES (S.JOB_NAME,S.PARENT_JOB_NAME,S.REL_TYPE) 
WHEN MATCHED THEN
  UPDATE SET REL_TYPE = S.REL_TYPE;


MERGE INTO CTRL_JOB_DEPENDENCY T USING (
  SELECT   
    'MAINT_TASKS_009_CLEANING.09' AS JOB_NAME
    ,'MAINT_TASKS_009_ASG_MART_DIRECTOR_H_RET.09' AS PARENT_JOB_NAME
    ,NULL                                   AS REL_TYPE
  FROM DUAL ) S ON (S.JOB_NAME = T.JOB_NAME AND S.PARENT_JOB_NAME = T.PARENT_JOB_NAME)
WHEN NOT MATCHED THEN 
  INSERT (JOB_NAME,PARENT_JOB_NAME,REL_TYPE)
  VALUES (S.JOB_NAME,S.PARENT_JOB_NAME,S.REL_TYPE) 
WHEN MATCHED THEN
  UPDATE SET REL_TYPE = S.REL_TYPE;


MERGE INTO CTRL_JOB_DEPENDENCY T USING (
  SELECT   
    'MAINT_TASKS_009_CLEANING.09' AS JOB_NAME
    ,'MAINT_TASKS_009_DQ_10000_LOAD.09' AS PARENT_JOB_NAME
    ,NULL                                   AS REL_TYPE
  FROM DUAL ) S ON (S.JOB_NAME = T.JOB_NAME AND S.PARENT_JOB_NAME = T.PARENT_JOB_NAME)
WHEN NOT MATCHED THEN 
  INSERT (JOB_NAME,PARENT_JOB_NAME,REL_TYPE)
  VALUES (S.JOB_NAME,S.PARENT_JOB_NAME,S.REL_TYPE) 
WHEN MATCHED THEN
  UPDATE SET REL_TYPE = S.REL_TYPE;


MERGE INTO CTRL_JOB_DEPENDENCY T USING (
  SELECT   
    'MAINT_TASKS_009_CLEANING.09' AS JOB_NAME
    ,'MAINT_TASKS_009_ERR_TABLES.09' AS PARENT_JOB_NAME
    ,NULL                                   AS REL_TYPE
  FROM DUAL ) S ON (S.JOB_NAME = T.JOB_NAME AND S.PARENT_JOB_NAME = T.PARENT_JOB_NAME)
WHEN NOT MATCHED THEN 
  INSERT (JOB_NAME,PARENT_JOB_NAME,REL_TYPE)
  VALUES (S.JOB_NAME,S.PARENT_JOB_NAME,S.REL_TYPE) 
WHEN MATCHED THEN
  UPDATE SET REL_TYPE = S.REL_TYPE;


MERGE INTO CTRL_JOB_DEPENDENCY T USING (
  SELECT   
    'MAINT_TASKS_009_CLEANING.09' AS JOB_NAME
    ,'MAINT_TASKS_009_ARCH_FIRE_AND_FORGET.09' AS PARENT_JOB_NAME
    ,NULL                                   AS REL_TYPE
  FROM DUAL ) S ON (S.JOB_NAME = T.JOB_NAME AND S.PARENT_JOB_NAME = T.PARENT_JOB_NAME)
WHEN NOT MATCHED THEN 
  INSERT (JOB_NAME,PARENT_JOB_NAME,REL_TYPE)
  VALUES (S.JOB_NAME,S.PARENT_JOB_NAME,S.REL_TYPE) 
WHEN MATCHED THEN
  UPDATE SET REL_TYPE = S.REL_TYPE;

  

MERGE INTO CTRL_JOB_DEPENDENCY T USING (
  SELECT   
    'MAINT_TASKS_009_CLEANING.09' AS JOB_NAME
    ,'MAINT_TASKS_009_DQ_20000_LOAD.09' AS PARENT_JOB_NAME
    ,NULL                                   AS REL_TYPE
  FROM DUAL ) S ON (S.JOB_NAME = T.JOB_NAME AND S.PARENT_JOB_NAME = T.PARENT_JOB_NAME)
WHEN NOT MATCHED THEN 
  INSERT (JOB_NAME,PARENT_JOB_NAME,REL_TYPE)
  VALUES (S.JOB_NAME,S.PARENT_JOB_NAME,S.REL_TYPE) 
WHEN MATCHED THEN
  UPDATE SET REL_TYPE = S.REL_TYPE;

COMMIT;

UPDATE ctrl_job SET status_begin = 1000 WHERE job_name = 'MART_CONDUCTOR_009';
delete from sess_job where engine_id = 9;
commit;
