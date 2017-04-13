--------------------------------------------------------
--  File created - Thursday-April-06-2017   
--------------------------------------------------------
REM INSERTING into HEXICLOUD.JOB_CONFIGURATION
SET DEFINE OFF;
Insert into HEXICLOUD.JOB_CONFIGURATION (JOB_ID,JOB_NAME,JOB_DESCRIPTION,JOB_FREQUENCY,JOB_FREQUENCY_TYPE,CLASS_NAME,JOB_FREQUENCY_HOUR,JOB_FREQUENCY_MINUTE,JOB_STATUS) values (2,'Customer Reminder Email','Customer Reminder Email on Provisioned Services',1,'H','com.hexicloud.CustomerReminder',0,0,'Stopped');
Insert into HEXICLOUD.JOB_CONFIGURATION (JOB_ID,JOB_NAME,JOB_DESCRIPTION,JOB_FREQUENCY,JOB_FREQUENCY_TYPE,CLASS_NAME,JOB_FREQUENCY_HOUR,JOB_FREQUENCY_MINUTE,JOB_STATUS) values (1,'Reminder Email','CSM Reminder Email on Customer Request',1,'H','com.hexicloud.SendReminder',0,0,'Stopped');
Insert into HEXICLOUD.JOB_CONFIGURATION (JOB_ID,JOB_NAME,JOB_DESCRIPTION,JOB_FREQUENCY,JOB_FREQUENCY_TYPE,CLASS_NAME,JOB_FREQUENCY_HOUR,JOB_FREQUENCY_MINUTE,JOB_STATUS) values (3,'Customer Welcome Email','Customer Welcome Email',1,'H','com.hexicloud.CustomerWelcomeEmail',0,0,'Stopped');
Insert into HEXICLOUD.JOB_CONFIGURATION (JOB_ID,JOB_NAME,JOB_DESCRIPTION,JOB_FREQUENCY,JOB_FREQUENCY_TYPE,CLASS_NAME,JOB_FREQUENCY_HOUR,JOB_FREQUENCY_MINUTE,JOB_STATUS) values (4,'Forgot Password Email','Forgot password email content',0,'NA','NA',0,0,'Stopped');
