BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
            job_name => '"HEXICLOUD"."COPY_TEMP_TO_CLM_JOB"',
            job_type => 'STORED_PROCEDURE',
            job_action => 'HEXICLOUD.PKG_CLM.PRC_COPY_TEMP_TO_CLM',
            number_of_arguments => 1,
            start_date => TO_TIMESTAMP_TZ('2017-04-13 02:00:00.000000000 CET','YYYY-MM-DD HH24:MI:SS.FF TZR'),
            repeat_interval => 'FREQ=DAILY;BYTIME=020000;BYDAY=MON,TUE,WED,THU,FRI,SAT,SUN',
            end_date => NULL,
            enabled => FALSE,
            auto_drop => FALSE,
            comments => 'Job to copy from temp table to CLM data table');

         
     
 
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"HEXICLOUD"."COPY_TEMP_TO_CLM_JOB"', 
             attribute => 'store_output', value => TRUE);
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"HEXICLOUD"."COPY_TEMP_TO_CLM_JOB"', 
             attribute => 'logging_level', value => DBMS_SCHEDULER.LOGGING_OFF);
      
   
  
    
    DBMS_SCHEDULER.enable(
             name => '"HEXICLOUD"."COPY_TEMP_TO_CLM_JOB"');
END;
