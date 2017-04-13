--------------------------------------------------------
--  File created - Thursday-April-06-2017   
--------------------------------------------------------
REM INSERTING into HEXICLOUD.STEPS
SET DEFINE OFF;
Insert into HEXICLOUD.STEPS (STEP_ID,STEP_CODE,DESCRIPTION,IS_ROLE_SELELCTION,IS_DECISION_MAKING,NON_REDIRECT_STEP,STEP_LABEL,HAS_SUB_STEP,SUB_STEP_LABEL) values (1,'home','Home Page of the application',0,0,0,'Home Page','N',null);
Insert into HEXICLOUD.STEPS (STEP_ID,STEP_CODE,DESCRIPTION,IS_ROLE_SELELCTION,IS_DECISION_MAKING,NON_REDIRECT_STEP,STEP_LABEL,HAS_SUB_STEP,SUB_STEP_LABEL) values (2,'login','Login page of the application',0,0,0,'Login','N',null);
Insert into HEXICLOUD.STEPS (STEP_ID,STEP_CODE,DESCRIPTION,IS_ROLE_SELELCTION,IS_DECISION_MAKING,NON_REDIRECT_STEP,STEP_LABEL,HAS_SUB_STEP,SUB_STEP_LABEL) values (3,'hello','Welcome Page of the application',0,0,0,'Hello','N',null);
Insert into HEXICLOUD.STEPS (STEP_ID,STEP_CODE,DESCRIPTION,IS_ROLE_SELELCTION,IS_DECISION_MAKING,NON_REDIRECT_STEP,STEP_LABEL,HAS_SUB_STEP,SUB_STEP_LABEL) values (4,'roleIdentified','Page showing the user role',0,0,0,'Role Identified','N',null);
Insert into HEXICLOUD.STEPS (STEP_ID,STEP_CODE,DESCRIPTION,IS_ROLE_SELELCTION,IS_DECISION_MAKING,NON_REDIRECT_STEP,STEP_LABEL,HAS_SUB_STEP,SUB_STEP_LABEL) values (5,'chooseRole','Page for allowing the user to select a role',1,0,1,'Choose Role','N',null);
Insert into HEXICLOUD.STEPS (STEP_ID,STEP_CODE,DESCRIPTION,IS_ROLE_SELELCTION,IS_DECISION_MAKING,NON_REDIRECT_STEP,STEP_LABEL,HAS_SUB_STEP,SUB_STEP_LABEL) values (6,'addAdditionalUsers','Page asking if extra users to be created',0,1,0,'Add Additional Users','N',null);
Insert into HEXICLOUD.STEPS (STEP_ID,STEP_CODE,DESCRIPTION,IS_ROLE_SELELCTION,IS_DECISION_MAKING,NON_REDIRECT_STEP,STEP_LABEL,HAS_SUB_STEP,SUB_STEP_LABEL) values (7,'createUsers','Page showing how to create users',0,0,0,'Create Users','Y','Choose Role');
Insert into HEXICLOUD.STEPS (STEP_ID,STEP_CODE,DESCRIPTION,IS_ROLE_SELELCTION,IS_DECISION_MAKING,NON_REDIRECT_STEP,STEP_LABEL,HAS_SUB_STEP,SUB_STEP_LABEL) values (8,'servicesMini','Page to show the provisioned services',0,1,0,'Mini Services-Provisioned','N',null);
Insert into HEXICLOUD.STEPS (STEP_ID,STEP_CODE,DESCRIPTION,IS_ROLE_SELELCTION,IS_DECISION_MAKING,NON_REDIRECT_STEP,STEP_LABEL,HAS_SUB_STEP,SUB_STEP_LABEL) values (9,'guidedPathsMini','Shows the guided paths for the User',0,0,0,'Mini Guided Paths','N',null);
Insert into HEXICLOUD.STEPS (STEP_ID,STEP_CODE,DESCRIPTION,IS_ROLE_SELELCTION,IS_DECISION_MAKING,NON_REDIRECT_STEP,STEP_LABEL,HAS_SUB_STEP,SUB_STEP_LABEL) values (10,'dashboard','Dashboard page, shows the Services and Leaning paths',0,0,0,'Dashboard','N',null);
Insert into HEXICLOUD.STEPS (STEP_ID,STEP_CODE,DESCRIPTION,IS_ROLE_SELELCTION,IS_DECISION_MAKING,NON_REDIRECT_STEP,STEP_LABEL,HAS_SUB_STEP,SUB_STEP_LABEL) values (11,'service','Shows all the assoicated services',0,0,0,'Services','N',null);
Insert into HEXICLOUD.STEPS (STEP_ID,STEP_CODE,DESCRIPTION,IS_ROLE_SELELCTION,IS_DECISION_MAKING,NON_REDIRECT_STEP,STEP_LABEL,HAS_SUB_STEP,SUB_STEP_LABEL) values (12,'learning','Shows all the guided paths for the user',0,0,0,'Learning','N',null);
Insert into HEXICLOUD.STEPS (STEP_ID,STEP_CODE,DESCRIPTION,IS_ROLE_SELELCTION,IS_DECISION_MAKING,NON_REDIRECT_STEP,STEP_LABEL,HAS_SUB_STEP,SUB_STEP_LABEL) values (13,'settings','Shows the user related settings',0,0,0,'Settings','N',null);
Insert into HEXICLOUD.STEPS (STEP_ID,STEP_CODE,DESCRIPTION,IS_ROLE_SELELCTION,IS_DECISION_MAKING,NON_REDIRECT_STEP,STEP_LABEL,HAS_SUB_STEP,SUB_STEP_LABEL) values (14,'learningFlow','Train page showing all the documents for a guided path',0,0,0,'Guided Learning Path Train','N',null);
Insert into HEXICLOUD.STEPS (STEP_ID,STEP_CODE,DESCRIPTION,IS_ROLE_SELELCTION,IS_DECISION_MAKING,NON_REDIRECT_STEP,STEP_LABEL,HAS_SUB_STEP,SUB_STEP_LABEL) values (15,'raiseSR','Allows user to send a email to the CSM',0,0,1,'Send Email Page','N',null);
