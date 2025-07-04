-- generated as: /home/jan/o2/bimeta/bin/pdc-generate.pl --cleaningdir o2_bin --curdate_related=1 -e 69 -n VODWH_A69 -s NTINFOT401_A69 --no-partitions --no-retence --no-stats --tick_length 5


-- SYSTEM_NAME = NTINFOT401_A69 -- pro produkci přepsat na správný produkční!
alter session set  nls_date_format = "YYYY-MM-DD";
alter session set  nls_timestamp_format = "YYYY-MM-DD hh:mi:ss";
--set echo on;
------------------------------------------------------------------------------------------------------------------------
--
-- Likvidace prostedi, opakovatelnost davky
--
------------------------------------------------------------------------------------------------------------------------
DELETE from CTRL_JOB_DEPENDENCY WHERE JOB_NAME IN ( SELECT JOB_NAME FROM CTRL_JOB WHERE ENGINE_ID = 69 );
DELETE from CTRL_JOB_TABLE_REF WHERE JOB_NAME IN ( SELECT JOB_NAME FROM CTRL_JOB WHERE ENGINE_ID = 69 );
DELETE from CTRL_JOB WHERE ENGINE_ID = 69;
DELETE from CTRL_STREAM WHERE STREAM_NAME LIKE '%.69' OR STREAM_NAME IN('INITIALIZATION_069', 'MAINT_069' , 'START_069', 'FINAL_069');
DELETE from CTRL_STREAM_DEPENDENCY WHERE STREAM_NAME LIKE '%.69' OR STREAM_NAME IN('INITIALIZATION_069', 'MAINT_069', 'START_069', 'FINAL_069' );
DELETE from CTRL_STREAM_DEPENDENCY WHERE PARENT_STREAM_NAME LIKE '%.69' OR PARENT_STREAM_NAME IN('INITIALIZATION_069', 'MAINT_069', 'START_069', 'FINAL_069' );
DELETE from CTRL_STREAM_PLAN_REF WHERE STREAM_NAME LIKE '%.69' OR STREAM_NAME IN('INITIALIZATION_069', 'MAINT_069', 'START_069', 'FINAL_069' );

DELETE FROM CTRL_PARAMETERS where param_cd = 69;
DELETE FROM CTRL_TASK_PARAMETERS where ENGINE_ID = 69;
DELETE FROM SESS_QUEUE where ENGINE_ID = 69;
commit;

DELETE from LKP_JOB_CATEGORY WHERE JOB_CATEGORY='COMMAND_E69';
INSERT INTO LKP_JOB_CATEGORY VALUES ('COMMAND_E69','COMMAND_E69 - VODWH_A69',0);

------------------------------------------------------------------------------------------------------------------------
--
-- Odvozeno z puvodni sablony od Teradaty (excel)
--
------------------------------------------------------------------------------------------------------------------------
INSERT INTO CTRL_PARAMETERS VALUES('APPLICATION_ID',69,'SCHEDULER',0,NULL,NULL,NULL,'Hodnota application_id prave probihajiciho zpracovani');
INSERT INTO CTRL_PARAMETERS VALUES('DQ_ACTIVE',69,'DATA_QUALITY',0,NULL,NULL,NULL,'Zapinani kontroly datove kvality');
INSERT INTO CTRL_PARAMETERS VALUES('DQ_EXPIRATION_DAYS',69,'DATA_QUALITY',30,NULL,NULL,NULL,'Po kolika dnech expiruji vysledky kontrol datove kvality');
INSERT INTO CTRL_PARAMETERS VALUES('ENGINE_STATUS',69,'SCHEDULER',NULL,'NTINFOT401_A69',NULL,'2000-01-01','Timestamp posledni otacky Engine');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_BEGIN',69,'SCHEDULER',NULL,NULL,NULL,'2000-01-01','Timestamp zacatku inicializace');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_DELAY_DAYS',69,'SCHEDULER',0,NULL,NULL,NULL,'O kolik dni je inicializace opozdena, pro D-1 je hodnota 0');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_DURATION_MINUTES',69,'SCHEDULER',20,NULL,NULL,NULL,'Maximalni tolerovana doba behu inicializace');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_END',69,'SCHEDULER',NULL,NULL,NULL,'2000-01-01','Timestamp konce inicializace');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_HOUR',69,'SCHEDULER',0,NULL,NULL,NULL,'Na kolikatou hodinu je nacasovana inicializace, hodnota slouzi pro Framework checker k hlidani, zda inicializace byla provedena');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_IS_RUNNING',69,'SCHEDULER',0,NULL,NULL,NULL,'Informace, zda prave probiha inicializace, 1=probiha');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_MUST_RUN',69,'SCHEDULER',1,NULL,NULL,NULL,'Zda musi byt inicializace provedena, pro denni load je 1, pro interday je 0');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_RETENTION_PERIOD',69,'SCHEDULER',5,NULL,NULL,NULL,'Po kolika minutach se provadi inicializace');
INSERT INTO CTRL_PARAMETERS VALUES('INITIALIZATION_CURRDATE_RELATED',69,'SCHEDULER',1,NULL,NULL,NULL,'Jestli inicializace vychazi z curr_date');
INSERT INTO CTRL_PARAMETERS VALUES('LOAD_DATE',69,'SCHEDULER',NULL,NULL,'2000-01-01','2000-01-01',NULL);
INSERT INTO CTRL_PARAMETERS VALUES('LOAD_SEQ_NUM',69,'SCHEDULER',0,NULL,NULL,NULL,'Sekvencni cislo loadu');
INSERT INTO CTRL_PARAMETERS VALUES('MANUAL_BATCH_LOAD_DATE',69,'SCHEDULER',NULL,NULL,NULL,NULL,'Load date probihajici rucni davky');
INSERT INTO CTRL_PARAMETERS VALUES('MAX_CONCURRENT_JOBS',69,'SCHEDULER',10,NULL,NULL,NULL,NULL);
INSERT INTO CTRL_PARAMETERS VALUES('MAX_CONCURRENT_JOBS_BCKP',69,'SCHEDULER',10,NULL,NULL,NULL,'Ulozeni nastaveneho poctu maximalne bezicich uloh');
INSERT INTO CTRL_PARAMETERS VALUES('MAX_CONCURRENT_JOBS_DFLT',69,'SCHEDULER',10,NULL,NULL,NULL,'Defaultni hodnota nastaveni maximalniho poctu uloh, hodnota se pouzije po inicializace');
INSERT INTO CTRL_PARAMETERS VALUES('MAX_LOAD_DATE',69,'SCHEDULER',NULL,NULL,'2119-12-31',NULL,'Maximalni hodnota Load date, tento datum bude poslednim, ktery se inicializuje');
INSERT INTO CTRL_PARAMETERS VALUES('PREV_LOAD_DATE',69,'SCHEDULER',NULL,NULL,'1999-12-31','1999-12-31','Load date za ktery probehlo minule zpracovani');
INSERT INTO CTRL_PARAMETERS VALUES('SCHEDULER_PROVIDED_BY',69,'SCHEDULER',NULL,'SCHEDULER',NULL,NULL,NULL);
INSERT INTO CTRL_PARAMETERS VALUES('ENGINE_NAME',69,'SCHEDULER',NULL,'VODWH_A69',NULL,NULL,'Oznaceni enginu');
INSERT INTO CTRL_PARAMETERS VALUES('ENGINE_CONTROL',69,'SCHEDULER',0,'NTINFOT401_A69',NULL,NULL,'Engine control 0=give control, 1=take control for system param_val_char');

-- REM INSERTING into PDC.CTRL_TASK_PARAMETERS
-- SET DEFINE OFF;
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values (null,'PARALLELISM_CONTROL','0','150','150',null,'COMMAND_GROUP','COMMAND_GROUP','0','99999999','69','NTINFOT401_A69',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values (null,'TASK_MIN_CONTROL','0','6','6',null,'COMMAND_GROUP','COMMAND_GROUP','0','99999999','69','NTINFOT401_A69',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values (null,'PARALLELISM_CONTROL','0','150','150',null,'COMMAND','COMMAND_GROUP','0','99999999','69','NTINFOT401_A69',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values (null,'TASK_MIN_CONTROL','0','6','6',null,'COMMAND','COMMAND_GROUP','0','99999999','69','NTINFOT401_A69',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values ('SMALL','TOUGH_CATEGORY_CONTROL','0','10','10',null,'COMMAND',null,'0','99999999','69','NTINFOT401_A69',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values ('MEDIUM','TOUGH_CATEGORY_CONTROL','0','20','20',null,'COMMAND',null,'0','99999999','69','NTINFOT401_A69',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values ('LARGE','TOUGH_CATEGORY_CONTROL','0','40','40',null,'COMMAND',null,'0','99999999','69','NTINFOT401_A69',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values ('EXCEPTIONAL','TOUGH_CATEGORY_CONTROL','0','80','80',null,'COMMAND',null,'0','99999999','69','NTINFOT401_A69',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values (null,'PARALLELISM_CONTROL','0','150','150',null,'COMMAND_GROUP_E69','COMMAND_GROUP_E69','0','99999999','69','NTINFOT401_A69',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values (null,'TASK_MIN_CONTROL','0','6','6',null,'COMMAND_GROUP_E69','COMMAND_GROUP_E69','0','99999999','69','NTINFOT401_A69',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values (null,'PARALLELISM_CONTROL','0','150','150',null,'COMMAND_E69','COMMAND_GROUP_E69','0','99999999','69','NTINFOT401_A69',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values (null,'TASK_MIN_CONTROL','0','6','6',null,'COMMAND_E69','COMMAND_GROUP_E69','0','99999999','69','NTINFOT401_A69',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values ('SMALL','TOUGH_CATEGORY_CONTROL','0','10','10',null,'COMMAND_E69',null,'0','99999999','69','NTINFOT401_A69',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values ('MEDIUM','TOUGH_CATEGORY_CONTROL','0','20','20',null,'COMMAND_E69',null,'0','99999999','69','NTINFOT401_A69',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values ('LARGE','TOUGH_CATEGORY_CONTROL','0','40','40',null,'COMMAND_E69',null,'0','99999999','69','NTINFOT401_A69',null);
Insert into CTRL_TASK_PARAMETERS (PARAM_NAME,PARAM_TYPE,PARAM_VAL_INT_CURR,PARAM_VAL_INT_MAX,PARAM_VAL_INT_DEFAULT,PARAM_DIMENSION,TASK_TYPE,PARENT_TASK_TYPE,VALID_FROM,VALID_TO,ENGINE_ID,SYSTEM_NAME,DESCRIPTION) values ('EXCEPTIONAL','TOUGH_CATEGORY_CONTROL','0','80','80',null,'COMMAND_E69',null,'0','99999999','69','NTINFOT401_A69',null);

commit;

--INSERT INTO CTRL_STREAM VALUES(stream_name,stream_desc,note);


INSERT INTO CTRL_STREAM VALUES('INITIALIZATION_069','Stream contains jobs for initialization',NULL);
--INSERT INTO CTRL_STREAM VALUES('ABORT_INFA_069','Abort stream for informatica jobs',NULL);

--INSERT INTO CTRL_JOB VALUES(job_name,stream_name,priority,cmd_line,src_sys_id,phase,table_name,job_category,job_type,cont_anyway,max_runs,always_restart,status_begin,waiting_hr,deadline_hr,engine_id,job_desc,author,note);


INSERT INTO CTRL_JOB VALUES('Initialize_part_1_069','INITIALIZATION_069',1000,'perl %PMRootDir%/Bin/Framework/Init_Initialize.pl -engine 69 -x 9 -debug',NULL,'INITIALIZATION',NULL,'COMMAND','ORACLE_PROCEDURE','SMALL',0,3,1,NULL,NULL,NULL,69,NULL,NULL,NULL);
INSERT INTO CTRL_JOB VALUES('Initialize_part_2_069','INITIALIZATION_069',1000,'perl %PMRootDir%/Bin/Framework/Init_Initialize_end.pl -engine 69 -x 9 -debug',NULL,'INITIALIZATION',NULL,'COMMAND','ORACLE_PROCEDURE','SMALL',0,3,1,NULL,NULL,NULL,69,NULL,NULL,NULL);
INSERT INTO CTRL_JOB VALUES('Cleaning_069','INITIALIZATION_069',1000,'perl %PMRootDir%/o2_bin/cleaning.pl -engine 69 -x 9 -debug',NULL,'INITIALIZATION',NULL,'COMMAND','COMMAND','SMALL',0,3,1,NULL,NULL,NULL,69,NULL,NULL,NULL);

--INSERT INTO CTRL_JOB_DEPENDENCY VALUES(job_name,parent_job_name,rel_type);


INSERT INTO CTRL_JOB_DEPENDENCY VALUES('Cleaning_069','Initialize_part_1_069',NULL);
INSERT INTO CTRL_JOB_DEPENDENCY VALUES('Initialize_part_2_069','Cleaning_069',NULL);

--INSERT INTO CTRL_STREAM_PLAN_REF VALUES(stream_name,runplan,country_cd);


INSERT INTO CTRL_STREAM_PLAN_REF VALUES('INITIALIZATION_069','WR001007E',NULL);


------------------------------------------------------------------------------------------------------------------------
--
-- Doplnujici zmeny nad ramec puvodni XLS sablony
--
-- virtulni uzly
-- INITIALIZATION => MAINT => START => FINAL
--
------------------------------------------------------------------------------------------------------------------------
INSERT INTO CTRL_STREAM VALUES('MAINT_069','MAINT_069','Maintenance tasky spoustene pred uzlem START_069');
INSERT INTO CTRL_STREAM_PLAN_REF VALUES ('MAINT_069', 'WR001007E', NULL);

INSERT INTO CTRL_STREAM VALUES('START_069','START_069','Tento uzel startuje load pro PMRootDir_E69');
INSERT INTO CTRL_STREAM_PLAN_REF VALUES('START_069','WR001007E',NULL);

INSERT INTO CTRL_STREAM VALUES('FINAL_069','FINAL_069','Tento uzel konci load pro PMRootDir_E69');
INSERT INTO CTRL_STREAM_PLAN_REF VALUES ('FINAL_069', 'WR001007E', NULL);

INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('MAINT_069', 'INITIALIZATION_069', NULL);
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('FINAL_069', 'START_069', NULL);
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('START_069', 'MAINT_069', NULL);
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('FINAL_069', 'MAINT_069', NULL);


-- Kazdy uzel musi obsahovat aspon jeden job
MERGE INTO CTRL_JOB t
USING (
        SELECT
            'MAINT_069_ECHO_ON'         as JOB_NAME
          , 'MAINT_069' as STREAM_NAME
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
          , 69                   as ENGINE_ID
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
            'START_069_ECHO_ON'         as JOB_NAME
          , 'START_069' as STREAM_NAME
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
          , 69                   as ENGINE_ID
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
            'FINAL_069_ECHO_ON'         as JOB_NAME
          , 'FINAL_069' as STREAM_NAME
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
          , 69                   as ENGINE_ID
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
-- START_069 => VO_LND.MICROBATCH.69 => FINAL_069
DELETE FROM CTRL_STREAM WHERE STREAM_NAME = 'VO_LND.MICROBATCH.69';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE STREAM_NAME = 'VO_LND.MICROBATCH.69';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE PARENT_STREAM_NAME = 'VO_LND.MICROBATCH.69';

INSERT INTO CTRL_STREAM VALUES('VO_LND.MICROBATCH.69','VO_LND.MICROBATCH.69','Pod timto streamem pobezi jednotlive datovu ulohy');
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('FINAL_069', 'VO_LND.MICROBATCH.69', NULL);
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('VO_LND.MICROBATCH.69', 'START_069', NULL);
INSERT INTO CTRL_STREAM_PLAN_REF VALUES('VO_LND.MICROBATCH.69','WR001007E',NULL);

-----------------------------------------------
-- director, checker
-----------------------------------------------
-- START_069 => DIRECTOR_RUN_069 => FINAL_069
DELETE FROM CTRL_STREAM WHERE STREAM_NAME = 'DIRECTOR_RUN_069';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE STREAM_NAME = 'DIRECTOR_RUN_069';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE PARENT_STREAM_NAME = 'DIRECTOR_RUN_069';
INSERT INTO CTRL_STREAM VALUES('DIRECTOR_RUN_069','DIRECTOR_RUN_069','Pod timto streamem pobezi director');
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('FINAL_069', 'DIRECTOR_RUN_069', NULL);
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('DIRECTOR_RUN_069', 'START_069', NULL);
INSERT INTO CTRL_STREAM_PLAN_REF VALUES('DIRECTOR_RUN_069','WR001007E',NULL);


DELETE FROM CTRL_STREAM WHERE STREAM_NAME = 'CHECKER_RUN_069';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE STREAM_NAME = 'CHECKER_RUN_069';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE PARENT_STREAM_NAME = 'CHECKER_RUN_069';
INSERT INTO CTRL_STREAM VALUES('CHECKER_RUN_069','CHECKER_RUN_069','Pod timto streamem pobezi CHECKER');
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('FINAL_069', 'CHECKER_RUN_069', NULL);
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('CHECKER_RUN_069', 'START_069', NULL);
INSERT INTO CTRL_STREAM_PLAN_REF VALUES('CHECKER_RUN_069','WR001007E',NULL);

commit;

-----------------------------------------------
-- CHECKER
-----------------------------------------------
/*
MERGE
INTO
    CTRL_JOB T
USING (
        SELECT
            'CHECKER_RUN_069_CHECK_ARCH_JOBS.69' AS JOB_NAME
          ,'CHECKER_RUN_069'                     AS STREAM_NAME
          , 9000                                 AS PRIORITY
          ,'maint.arch.arch_checker.py'          AS CMD_LINE
          , NULL                                 AS SRC_SYS_ID
          ,'LL_LOAD'                             AS PHASE
          , NULL                                 AS TABLE_NAME
          ,'COMMAND_E69'   AS JOB_CATEGORY
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
*/
-----------------------------------------------
-- DIRECTOR
-----------------------------------------------
--update ctrl_job 
--set job_type='PYTHON_SCRIPT', cmd_line='director.director.py'
--where job_name = 'AP_STG.DIRECTOR.69';
--commit;

MERGE 
INTO 
                 CTRL_JOB T 
USING 
                 ( SELECT
                        'VP_STG.DIRECTOR.69'                     AS JOB_NAME
                       ,'DIRECTOR_RUN_069'                       AS STREAM_NAME                       
                       , 9000                                    AS PRIORITY
                       ,'director.director.py'                   AS CMD_LINE
                       , NULL                                    AS SRC_SYS_ID
                       ,'LL_LOAD'                                AS PHASE
                       ,NULL                                     AS TABLE_NAME
                       ,'COMMAND_E69'                            AS JOB_CATEGORY
                       ,'PYTHON_SCRIPT'                          AS JOB_TYPE
                       , 0                                       AS CONT_ANYWAY
                       , 9999                                    AS MAX_RUNS
                       , 1                                       AS ALWAYS_RESTART
                       , NULL                                    AS STATUS_BEGIN
                       , NULL                                    AS WAITING_HR
                       , NULL                                    AS DEADLINE_HR
                       ,  69                                     AS ENGINE_ID
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
DELETE FROM CTRL_STREAM WHERE STREAM_NAME = 'MAINT_TASKS_069';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE STREAM_NAME = 'MAINT_TASKS_069';
DELETE FROM CTRL_STREAM_DEPENDENCY WHERE PARENT_STREAM_NAME = 'MAINT_TASKS_069';

INSERT INTO CTRL_STREAM VALUES('MAINT_TASKS_069','MAINT_TASKS_069','Pod timto streamem pobezi maintenance ulohy');
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('FINAL_069', 'MAINT_TASKS_069', NULL);
INSERT INTO CTRL_STREAM_DEPENDENCY VALUES ('MAINT_TASKS_069', 'START_069', NULL);
INSERT INTO CTRL_STREAM_PLAN_REF VALUES('MAINT_TASKS_069','WR001007E',NULL);

MERGE 
INTO 
                 CTRL_JOB T 
USING 
                 ( SELECT
                        'MAINT_TASKS_069_CLEANING.69'            AS JOB_NAME
                       ,'MAINT_TASKS_069'                        AS STREAM_NAME                       
                       , 9000                                    AS PRIORITY
                       ,'perl %PMRootDir%/o2_bin/director_cleaning.pl -engine 69 -x 69 -debug' AS CMD_LINE
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
                       ,  69                                     AS ENGINE_ID
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
            'MAINT_TASKS_069_DQ_10000_LOAD.69' AS JOB_NAME
          ,'MAINT_TASKS_069'                   AS STREAM_NAME
          , 9000                               AS PRIORITY
          ,'daq.ll_dq_load.dq_10000_load.py'   AS CMD_LINE
          , NULL                               AS SRC_SYS_ID
          ,'LL_LOAD'                           AS PHASE
          , NULL                               AS TABLE_NAME
          ,'COMMAND_E69'   AS JOB_CATEGORY
          ,'PYTHON_SCRIPT' AS JOB_TYPE
          , 0              AS CONT_ANYWAY
          , 3              AS MAX_RUNS
          , 1              AS ALWAYS_RESTART
          , 1000       AS STATUS_BEGIN
          , NULL       AS WAITING_HR
          , NULL       AS DEADLINE_HR
          , 69          AS ENGINE_ID
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
            'MAINT_TASKS_069_DQ_20000_LOAD.69' AS JOB_NAME
          ,'MAINT_TASKS_069'                   AS STREAM_NAME
          , 9000                               AS PRIORITY
          ,'daq.ll_dq_load.dq_20000_load.py'   AS CMD_LINE
          , NULL                               AS SRC_SYS_ID
          ,'LL_LOAD'                           AS PHASE
          , NULL                               AS TABLE_NAME
          ,'COMMAND_E69'   AS JOB_CATEGORY
          ,'PYTHON_SCRIPT' AS JOB_TYPE
          , 0              AS CONT_ANYWAY
          , 3              AS MAX_RUNS
          , 1              AS ALWAYS_RESTART
          , 1000       AS STATUS_BEGIN
          , NULL       AS WAITING_HR
          , NULL       AS DEADLINE_HR
          , 69          AS ENGINE_ID
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
            'MAINT_TASKS_069_ERR_TABLES.69'    AS JOB_NAME
          ,'MAINT_TASKS_069'                   AS STREAM_NAME
          , 9000                               AS PRIORITY
          ,'MAINT.ERR.tables.py'               AS CMD_LINE
          , NULL                               AS SRC_SYS_ID
          ,'LL_LOAD'                           AS PHASE
          , NULL                               AS TABLE_NAME
          ,'COMMAND_E69'   AS JOB_CATEGORY
          ,'PYTHON_SCRIPT' AS JOB_TYPE
          , 0              AS CONT_ANYWAY
          , 3              AS MAX_RUNS
          , 1              AS ALWAYS_RESTART
          , 1000       AS STATUS_BEGIN
          , NULL       AS WAITING_HR
          , NULL       AS DEADLINE_HR
          , 69          AS ENGINE_ID
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
            'MAINT_TASKS_069_ARCH_FIRE_AND_FORGET.69'   AS JOB_NAME
          ,'MAINT_TASKS_069'                            AS STREAM_NAME
          , 9000                                        AS PRIORITY
          ,'maint.arch.arch_fire_and_forget.py'         AS CMD_LINE
          , NULL                                        AS SRC_SYS_ID
          ,'LL_LOAD'                                    AS PHASE
          , NULL                                        AS TABLE_NAME
          ,'COMMAND_E69'                                AS JOB_CATEGORY
          ,'PYTHON_SCRIPT'                              AS JOB_TYPE
          , 0                                           AS CONT_ANYWAY
          , 1                                           AS MAX_RUNS
          , 1                                           AS ALWAYS_RESTART
          , 1000       AS STATUS_BEGIN
          , NULL       AS WAITING_HR
          , NULL       AS DEADLINE_HR
          , 69         AS ENGINE_ID
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
INSERT INTO CTRL_STREAM_PLAN_REF VALUES('FINAL_069','WR001007E',NULL);

commit;


----------------------------------
-------- PDC obálka --------------
----------------------------------
MERGE
INTO
    CTRL_JOB T
USING (
        SELECT
            'MAINT_TASKS_069_ASG_DATA_STAT_RET.09' AS JOB_NAME
          ,'MAINT_TASKS_069'                   AS STREAM_NAME
          , 9000                               AS PRIORITY
          ,'maint.arch.asg_data_stat_ret.py'   AS CMD_LINE
          , NULL                               AS SRC_SYS_ID
          ,'LL_LOAD'                           AS PHASE
          , NULL                               AS TABLE_NAME
          ,'COMMAND_E69'   AS JOB_CATEGORY
          ,'PYTHON_SCRIPT' AS JOB_TYPE
          , 0              AS CONT_ANYWAY
          , 3              AS MAX_RUNS
          , 1              AS ALWAYS_RESTART
          , 1000       AS STATUS_BEGIN
          , NULL       AS WAITING_HR
          , NULL       AS DEADLINE_HR
          , 69         AS ENGINE_ID
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
            'MAINT_TASKS_069_ASG_MART_DIRECTOR_H_RET.09' AS JOB_NAME
          ,'MAINT_TASKS_069'                   AS STREAM_NAME
          , 9000                               AS PRIORITY
          ,'maint.arch.asg_mart_director_ret.py'   AS CMD_LINE
          , NULL                               AS SRC_SYS_ID
          ,'LL_LOAD'                           AS PHASE
          , NULL                               AS TABLE_NAME
          ,'COMMAND_E69'   AS JOB_CATEGORY
          ,'PYTHON_SCRIPT' AS JOB_TYPE
          , 0              AS CONT_ANYWAY
          , 3              AS MAX_RUNS
          , 1              AS ALWAYS_RESTART
          , 1000       AS STATUS_BEGIN
          , NULL       AS WAITING_HR
          , NULL       AS DEADLINE_HR
          , 69         AS ENGINE_ID
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

commit
;

delete from sess_job where engine_id = 69;