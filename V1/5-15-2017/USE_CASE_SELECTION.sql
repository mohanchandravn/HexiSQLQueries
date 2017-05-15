-- Removing the un used table
drop table CLM_REPORT cascade constraints PURGE;

--------------------------------------------------------
--  DDL for Sequence USE_CASES_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "USE_CASES_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence BENEFIT_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BENEFIT_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
   

CREATE TABLE "BENEFITS" 
   (	"BENEFIT_ID" NUMBER NOT NULL ENABLE, 
	"TITLE" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"SHORT_DESC" VARCHAR2(400 BYTE), 
	"LONG_DESC" VARCHAR2(4000 BYTE), 
	"IMAGE" VARCHAR2(400 BYTE), 
	"IMAGE_LINK" VARCHAR2(4000 BYTE), 
	 CONSTRAINT "BENEFITS_PK" PRIMARY KEY ("BENEFIT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

  CREATE OR REPLACE EDITIONABLE TRIGGER "BENEFITS_TRG" 
BEFORE INSERT ON BENEFITS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.BENEFIT_ID IS NULL THEN
      SELECT BENEFIT_ID_SEQ.NEXTVAL INTO :NEW.BENEFIT_ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "BENEFITS_TRG" ENABLE;


REM INSERTING into BENEFITS
SET DEFINE OFF;
Insert into BENEFITS (BENEFIT_ID,TITLE,SHORT_DESC,LONG_DESC,IMAGE,IMAGE_LINK) values (1,'Cost reduction',null,null,null,null);
Insert into BENEFITS (BENEFIT_ID,TITLE,SHORT_DESC,LONG_DESC,IMAGE,IMAGE_LINK) values (2,'Time reduction / Faster Deployment',null,null,null,null);
Insert into BENEFITS (BENEFIT_ID,TITLE,SHORT_DESC,LONG_DESC,IMAGE,IMAGE_LINK) values (3,'Zero Administration',null,null,null,null);
Insert into BENEFITS (BENEFIT_ID,TITLE,SHORT_DESC,LONG_DESC,IMAGE,IMAGE_LINK) values (4,'Easy integration',null,null,null,null);
Insert into BENEFITS (BENEFIT_ID,TITLE,SHORT_DESC,LONG_DESC,IMAGE,IMAGE_LINK) values (5,'ROI Increase',null,null,null,null);
Insert into BENEFITS (BENEFIT_ID,TITLE,SHORT_DESC,LONG_DESC,IMAGE,IMAGE_LINK) values (6,'Flexibility',null,null,null,null);
Insert into BENEFITS (BENEFIT_ID,TITLE,SHORT_DESC,LONG_DESC,IMAGE,IMAGE_LINK) values (7,'Scalability',null,null,null,null);
Insert into BENEFITS (BENEFIT_ID,TITLE,SHORT_DESC,LONG_DESC,IMAGE,IMAGE_LINK) values (8,'Others',null,null,null,null);
Insert into BENEFITS (BENEFIT_ID,TITLE,SHORT_DESC,LONG_DESC,IMAGE,IMAGE_LINK) values (9,'TECHNICAL','Modern User Experience','Modern User Experience','Modern User Experience.svg',null);
Insert into BENEFITS (BENEFIT_ID,TITLE,SHORT_DESC,LONG_DESC,IMAGE,IMAGE_LINK) values (10,'FINANCIAL','Lower TCO','Lower TCO','Lower TCO.svg',null);
Insert into BENEFITS (BENEFIT_ID,TITLE,SHORT_DESC,LONG_DESC,IMAGE,IMAGE_LINK) values (11,'BUSINESS','Industry and Functional Enhancements','Industry and Functional Enhancements','Industry and Functional Enhancements.svg',null);

COMMIT;


  CREATE TABLE "HEXICLOUDDEV"."SERVICES" 
   (	"SERVICE_ID" VARCHAR2(40 BYTE) NOT NULL ENABLE, 
	"LABEL" VARCHAR2(80 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "SERVICES_PK" PRIMARY KEY ("SERVICE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  
  
REM INSERTING into SERVICES
SET DEFINE OFF;
Insert into SERVICES (SERVICE_ID,LABEL) values ('COMPUTE','Compute');
Insert into SERVICES (SERVICE_ID,LABEL) values ('STORAGE','Storage');
Insert into SERVICES (SERVICE_ID,LABEL) values ('NETWORK','Network');
Insert into SERVICES (SERVICE_ID,LABEL) values ('CONTAINER','Container');
Insert into SERVICES (SERVICE_ID,LABEL) values ('RAVELLO','Ravello');
Insert into SERVICES (SERVICE_ID,LABEL) values ('CLOUDMACHINE','Cloud Machine');

COMMIT;



  CREATE TABLE "HEXICLOUDDEV"."USE_CASES" 
   (	"USECASE_ID" NUMBER NOT NULL ENABLE, 
	"TITLE" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"SHORT_DESC" VARCHAR2(400 BYTE), 
	"LONG_DESC" VARCHAR2(4000 BYTE), 
	"IMAGE" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"STATUS" VARCHAR2(20 BYTE) DEFAULT 'ACTIVE' NOT NULL ENABLE, 
	 CONSTRAINT "USE_CASES_PK" PRIMARY KEY ("USECASE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "USE_CASES_CHK1" CHECK (STATUS IN ('ACTIVE', 'INACTIVE', 'OTHER')) ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

  CREATE OR REPLACE EDITIONABLE TRIGGER "HEXICLOUDDEV"."USE_CASES_TRG" 
BEFORE INSERT ON USE_CASES 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.USECASE_ID IS NULL THEN
      SELECT USE_CASES_ID_SEQ.NEXTVAL INTO :NEW.USECASE_ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "HEXICLOUDDEV"."USE_CASES_TRG" ENABLE;


REM INSERTING into USE_CASES
SET DEFINE OFF;
Insert into USE_CASES (USECASE_ID,TITLE,SHORT_DESC,LONG_DESC,IMAGE,STATUS) values (10,'Other',null,null,'other.png','OTHER');
Insert into USE_CASES (USECASE_ID,TITLE,SHORT_DESC,LONG_DESC,IMAGE,STATUS) values (1,'Migrate Oracle Applications Unlimited Workloads','Apps Unlimited on Compute Cloud Service certifies Oracle applications to run in the most optimized fashion with automation for deployment, migration, and management of the applications on Oracle Compute Cloud Service.','Apps Unlimited on Compute Cloud Service certifies Oracle applications to run in the most optimized fashion with automation for deployment, migration, and management of the applications on Oracle Compute Cloud Service.','Migrate Oracle Applications.jpg','ACTIVE');
Insert into USE_CASES (USECASE_ID,TITLE,SHORT_DESC,LONG_DESC,IMAGE,STATUS) values (2,'Lift & Shift Oracle applications Mixed Workloads','Use Oracle Compute Cloud Service to migrate your on-premises workloads to the cloud and reap the many cloud benefits.','Use Oracle Compute Cloud Service to migrate your on-premises workloads to the cloud and reap the many cloud benefits.','L&S_Oracle Applications Mixed Workloads.jpg','ACTIVE');
Insert into USE_CASES (USECASE_ID,TITLE,SHORT_DESC,LONG_DESC,IMAGE,STATUS) values (3,'Lift & Shift Virtualized Workloads(Vmware/KVM)','Enables enterprises to run their VMware and KVM workloads with DC-like (L2) networking ‘as-is’ on public cloud without any modifications.','Enables enterprises to run their VMware and KVM workloads with DC-like (L2) networking ‘as-is’ on public cloud without any modifications.','L&S_Virtualized.jpg','INACTIVE');
Insert into USE_CASES (USECASE_ID,TITLE,SHORT_DESC,LONG_DESC,IMAGE,STATUS) values (4,'Lift & Shift  Non-Oracle Workloads','Lorem ipsum dolor sit amet','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dictum nisl eu pretium fermentum. Nulla eu fermentum sapien, non auctor ligula. Donec quis leo suscipit, aliquet arcu et, congue lectus. Nulla vel dolor ut justo accumsan pharetra. Etiam ac iaculis ex, vel ornare magna. Integer fermentum tempus eros, in eleifend erat placerat eu. Nam iaculis imperdiet tortor id elementum. Pellentesque ornare eu nibh eget consectetur. Mauris elementum libero augue, sit amet pharetra turpis venenatis quis. Integer molestie arcu magna, non hendrerit ante semper quis. Aliquam dignissim semper risus, nec pulvinar diam rhoncus in. Fusce orci ex, maximus quis scelerisque eget, commodo a tellus. Aenean interdum convallis tortor vel tristique. Donec ut tincidunt elit. Aenean et nunc purus.','L&S_Non-Oracle Workloads.jpg','ACTIVE');
Insert into USE_CASES (USECASE_ID,TITLE,SHORT_DESC,LONG_DESC,IMAGE,STATUS) values (5,'DevOps in the Cloud Agility for Development, Testing & Deployment','"Arm" your DevOps teams with the all the needed tools for best performance: look beyond the IaaS advantage on reducing only the infrastructure costs and maintenance of the hardware, to take maximum advantage inside your DevOps teams','"Arm" your DevOps teams with the all the needed tools for best performance: look beyond the IaaS advantage on reducing only the infrastructure costs and maintenance of the hardware, to take maximum advantage inside your DevOps teams','Devops_in the cloud.jpg','ACTIVE');
Insert into USE_CASES (USECASE_ID,TITLE,SHORT_DESC,LONG_DESC,IMAGE,STATUS) values (6,'Dockers','Provides an easy and quick way to create an enterprise-grade container infrastructure.','Provides an easy and quick way to create an enterprise-grade container infrastructure.','dockers.jpg','INACTIVE');
Insert into USE_CASES (USECASE_ID,TITLE,SHORT_DESC,LONG_DESC,IMAGE,STATUS) values (7,'Develop, Test & Deploy Cloud Native & Mobile Applications','Lorem ipsum dolor sit amet','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dictum nisl eu pretium fermentum. Nulla eu fermentum sapien, non auctor ligula. Donec quis leo suscipit, aliquet arcu et, congue lectus. Nulla vel dolor ut justo accumsan pharetra. Etiam ac iaculis ex, vel ornare magna. Integer fermentum tempus eros, in eleifend erat placerat eu. Nam iaculis imperdiet tortor id elementum. Pellentesque ornare eu nibh eget consectetur. Mauris elementum libero augue, sit amet pharetra turpis venenatis quis. Integer molestie arcu magna, non hendrerit ante semper quis. Aliquam dignissim semper risus, nec pulvinar diam rhoncus in. Fusce orci ex, maximus quis scelerisque eget, commodo a tellus. Aenean interdum convallis tortor vel tristique. Donec ut tincidunt elit. Aenean et nunc purus.','Develop Test & Deploy.jpg','ACTIVE');
Insert into USE_CASES (USECASE_ID,TITLE,SHORT_DESC,LONG_DESC,IMAGE,STATUS) values (8,'Run Oracle Database Backup in the Cloud','Lorem ipsum dolor sit amet','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dictum nisl eu pretium fermentum. Nulla eu fermentum sapien, non auctor ligula. Donec quis leo suscipit, aliquet arcu et, congue lectus. Nulla vel dolor ut justo accumsan pharetra. Etiam ac iaculis ex, vel ornare magna. Integer fermentum tempus eros, in eleifend erat placerat eu. Nam iaculis imperdiet tortor id elementum. Pellentesque ornare eu nibh eget consectetur. Mauris elementum libero augue, sit amet pharetra turpis venenatis quis. Integer molestie arcu magna, non hendrerit ante semper quis. Aliquam dignissim semper risus, nec pulvinar diam rhoncus in. Fusce orci ex, maximus quis scelerisque eget, commodo a tellus. Aenean interdum convallis tortor vel tristique. Donec ut tincidunt elit. Aenean et nunc purus.','Run Oracle Database.jpg','ACTIVE');
Insert into USE_CASES (USECASE_ID,TITLE,SHORT_DESC,LONG_DESC,IMAGE,STATUS) values (9,'Security - VPN','Site-to-Site VPN securely extends your on-premises network to your dedicated Oracle Compute zone.','Site-to-Site VPN securely extends your on-premises network to your dedicated Oracle Compute zone.','Security_VPN.jpg','ACTIVE');

COMMIT;


  CREATE TABLE "HEXICLOUDDEV"."USE_CASE_BENEFITS" 
   (	"BENEFIT_ID" NUMBER NOT NULL ENABLE, 
	"USECASE_ID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "USE_CASE_BENEFITS_PK" PRIMARY KEY ("BENEFIT_ID", "USECASE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "USE_CASE_BENEFITS_FK1" FOREIGN KEY ("USECASE_ID")
	  REFERENCES "HEXICLOUDDEV"."USE_CASES" ("USECASE_ID") ENABLE, 
	 CONSTRAINT "USE_CASE_BENEFITS_FK2" FOREIGN KEY ("BENEFIT_ID")
	  REFERENCES "HEXICLOUDDEV"."BENEFITS" ("BENEFIT_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

  
REM INSERTING into USE_CASE_BENEFITS
SET DEFINE OFF;
Insert into USE_CASE_BENEFITS (BENEFIT_ID,USECASE_ID) values (1,10);
Insert into USE_CASE_BENEFITS (BENEFIT_ID,USECASE_ID) values (2,10);
Insert into USE_CASE_BENEFITS (BENEFIT_ID,USECASE_ID) values (3,10);
Insert into USE_CASE_BENEFITS (BENEFIT_ID,USECASE_ID) values (4,10);
Insert into USE_CASE_BENEFITS (BENEFIT_ID,USECASE_ID) values (5,10);
Insert into USE_CASE_BENEFITS (BENEFIT_ID,USECASE_ID) values (6,10);
Insert into USE_CASE_BENEFITS (BENEFIT_ID,USECASE_ID) values (7,10);
Insert into USE_CASE_BENEFITS (BENEFIT_ID,USECASE_ID) values (8,10);
Insert into USE_CASE_BENEFITS (BENEFIT_ID,USECASE_ID) values (9,2);
Insert into USE_CASE_BENEFITS (BENEFIT_ID,USECASE_ID) values (9,5);
Insert into USE_CASE_BENEFITS (BENEFIT_ID,USECASE_ID) values (10,1);
Insert into USE_CASE_BENEFITS (BENEFIT_ID,USECASE_ID) values (10,2);
Insert into USE_CASE_BENEFITS (BENEFIT_ID,USECASE_ID) values (10,5);
Insert into USE_CASE_BENEFITS (BENEFIT_ID,USECASE_ID) values (11,1);
Insert into USE_CASE_BENEFITS (BENEFIT_ID,USECASE_ID) values (11,5);

COMMIT;


CREATE TABLE "HEXICLOUDDEV"."USE_CASE_SERVICES" 
   (	"USECASE_ID" NUMBER NOT NULL ENABLE, 
	"SERVICE_ID" VARCHAR2(40 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "USE_CASE_SERVICES_PK" PRIMARY KEY ("USECASE_ID", "SERVICE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "USE_CASE_SERVICES_FK1" FOREIGN KEY ("USECASE_ID")
	  REFERENCES "HEXICLOUDDEV"."USE_CASES" ("USECASE_ID") ON DELETE CASCADE ENABLE, 
	 CONSTRAINT "USE_CASE_SERVICES_FK2" FOREIGN KEY ("SERVICE_ID")
	  REFERENCES "HEXICLOUDDEV"."SERVICES" ("SERVICE_ID") ON DELETE CASCADE ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  
  
REM INSERTING into USE_CASE_SERVICES
SET DEFINE OFF;
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (1,'COMPUTE');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (1,'CONTAINER');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (1,'NETWORK');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (1,'RAVELLO');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (1,'STORAGE');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (2,'COMPUTE');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (2,'CONTAINER');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (2,'NETWORK');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (2,'RAVELLO');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (2,'STORAGE');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (3,'COMPUTE');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (3,'RAVELLO');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (4,'COMPUTE');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (4,'CONTAINER');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (4,'NETWORK');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (4,'RAVELLO');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (4,'STORAGE');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (5,'COMPUTE');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (5,'CONTAINER');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (5,'NETWORK');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (5,'RAVELLO');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (5,'STORAGE');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (6,'CONTAINER');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (7,'COMPUTE');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (7,'CONTAINER');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (7,'NETWORK');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (7,'STORAGE');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (8,'COMPUTE');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (8,'NETWORK');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (8,'STORAGE');
Insert into USE_CASE_SERVICES (USECASE_ID,SERVICE_ID) values (9,'NETWORK');

COMMIT;



  CREATE TABLE "HEXICLOUDDEV"."USER_USECASES" 
   (	"USER_ID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"USECASE_ID" NUMBER NOT NULL ENABLE, 
	"CODE" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"SUMMARY" VARCHAR2(2000 BYTE), 
	"SERVICES" VARCHAR2(200 BYTE), 
	"BENEFITS" VARCHAR2(4000 BYTE), 
	 CONSTRAINT "USER_USECASES_CHK1" CHECK (CODE IN ('I', 'T')) ENABLE, 
	 CONSTRAINT "USER_USECASES_FK1" FOREIGN KEY ("USER_ID")
	  REFERENCES "HEXICLOUDDEV"."USERS" ("USER_ID") ON DELETE CASCADE ENABLE, 
	 CONSTRAINT "USER_USECASES_FK2" FOREIGN KEY ("USECASE_ID")
	  REFERENCES "HEXICLOUDDEV"."USE_CASES" ("USECASE_ID") ON DELETE CASCADE ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

  
ALTER TABLE USER_PHASE_COMPLETETION ADD CONSTRAINT U_P_C_ALT_KEY UNIQUE (USER_ID, PHASE);


--------------------------------------------------------
--  DDL for Package PKG_USER_NAV_AUDIT
--------------------------------------------------------

CREATE OR REPLACE EDITIONABLE PACKAGE "PKG_USER_NAV_AUDIT" IS
 PROCEDURE PRC_SAVE_USER_NAV_AUDIT(IN_USER_ID IN USER_NAVIGATION_AUDIT.USER_ID%TYPE,
									IN_STEP_ID IN STEPS.STEP_ID%TYPE,
                  IN_CUR_STEP_LABEL STEPS.STEP_CODE%TYPE,
									IN_ACTION IN USER_EMAILS.MESSAGE%TYPE);
                  
PROCEDURE PRC_DELETE_USERS_NAV(IN_USER_ID IN USERS.USER_ID%TYPE) ;                 
END PKG_USER_NAV_AUDIT;

/
--------------------------------------------------------
--  DDL for Package Body PKG_USER_NAV_AUDIT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PKG_USER_NAV_AUDIT" 
IS
  PROCEDURE PRC_SAVE_USER_NAV_AUDIT(IN_USER_ID IN USER_NAVIGATION_AUDIT.USER_ID%TYPE,
									IN_STEP_ID IN STEPS.STEP_ID%TYPE,
									IN_CUR_STEP_LABEL STEPS.STEP_CODE%TYPE,
									IN_ACTION IN USER_EMAILS.MESSAGE%TYPE)
  IS

    ON_BOARD_COMPLETION_EMAIL_SENT VARCHAR2(1):= 'N';
    USER_EMAIL USERS.EMAIL%TYPE := '';
    USER_FIRST_NAME  USERS.FIRST_NAME%TYPE:= '';
    MESSAGE VARCHAR2(8000) :='';
    SUBJECT VARCHAR2(600) :='';
    email_success VARCHAR2(1)         := 'N';
	PORTAL_NOTIF_EMAIL VARCHAR2(80) := '';
   
  BEGIN
  

		INSERT INTO USER_NAVIGATION_AUDIT (USER_ID, STEP_ID, ACTION, CREATED_DATE) VALUES (IN_USER_ID, IN_STEP_ID, IN_ACTION, SYSDATE);

	
	IF IN_CUR_STEP_LABEL = 'dashboard' THEN
	

		BEGIN
			SELECT COMPLETION_EMAIL_SENT INTO ON_BOARD_COMPLETION_EMAIL_SENT
			FROM USER_PHASE_COMPLETETION 
			WHERE USER_ID = IN_USER_ID AND PHASE = 'onboarding';
		EXCEPTION
		WHEN NO_DATA_FOUND THEN
		  ON_BOARD_COMPLETION_EMAIL_SENT := 'N';
		END;
		
		IF ON_BOARD_COMPLETION_EMAIL_SENT = 'N' THEN

		  SELECT EMAIL, FIRST_NAME   INTO USER_EMAIL, USER_FIRST_NAME
		  FROM USERS 
		  WHERE USER_ID = IN_USER_ID;
      
		  SELECT RULE_VALUE INTO SUBJECT FROM RULE_CONFIGURATION WHERE RULE_KEY = 'ON_BOARDING_COMPLETION_EMAIL_SUBJECT';
		  SELECT RULE_VALUE INTO MESSAGE FROM RULE_CONFIGURATION WHERE RULE_KEY = 'ON_BOARDING_COMPLETION_EMAIL_BODY';
		  SELECT RULE_VALUE INTO PORTAL_NOTIF_EMAIL FROM RULE_CONFIGURATION WHERE RULE_KEY = 'PORTAL_NOTIFICATION_EMAIL_ID';

			MESSAGE := REPLACE(MESSAGE, '<<FIRST_NAME>>', USER_FIRST_NAME);
			
			send_email(PORTAL_NOTIF_EMAIL, USER_EMAIL, SUBJECT, MESSAGE, email_success);
			IF email_success = 'Y' THEN
			 INSERT INTO USER_PHASE_COMPLETETION (USER_ID, PHASE, COMPLETED_DATE, COMPLETION_EMAIL_SENT, SENT_EMAIL_COUNT) VALUES (IN_USER_ID, 'onboarding', SYSDATE, 'Y', 1);
			END IF;
			
		END IF;
			
	
	END IF;
   COMMIT;
    
  END PRC_SAVE_USER_NAV_AUDIT;

----------------------------------------------------------
-- Procedure to delete users navigation, audit, emails
----------------------------------------------------------
PROCEDURE PRC_DELETE_USERS_NAV(
    IN_USER_ID IN USERS.USER_ID%TYPE)
IS
BEGIN
  BEGIN
    DELETE FROM USER_USECASES WHERE USER_ID = IN_USER_ID;
    DELETE FROM USER_PHASE_COMPLETETION WHERE USER_ID = IN_USER_ID;
    DELETE FROM USER_NAVIGATION_AUDIT WHERE USER_ID = IN_USER_ID;
    DELETE FROM USER_EMAILS WHERE USER_ID = IN_USER_ID;
    DELETE FROM USER_STEPS WHERE USER_ID = IN_USER_ID;
    COMMIT;
   EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
    END;
END PRC_DELETE_USERS_NAV;

END PKG_USER_NAV_AUDIT;

/


--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "HEXICLOUDDEV"."USERS" 
   (	"USER_ID" VARCHAR2(20 CHAR), 
	"PASSWORD" VARCHAR2(300 CHAR), 
	"EMAIL" VARCHAR2(50 CHAR), 
	"USER_ROLE" VARCHAR2(30 CHAR), 
	"FIRST_NAME" VARCHAR2(60 CHAR), 
	"LAST_NAME" VARCHAR2(60 CHAR), 
	"ACTIVE" NUMBER(1,0) DEFAULT 1, 
	"PWD_LAST_CHANGED" TIMESTAMP (6), 
	"LAST_LOGGED_IN" TIMESTAMP (6), 
	"REGISTRY_ID" VARCHAR2(240 CHAR), 
	"AUTHORITY" VARCHAR2(20 CHAR) DEFAULT 'ROLE_USER', 
	"PHONE" VARCHAR2(20 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HEXICLOUDDEV"."USERS"."USER_ID" IS 'User id used for log in';
   COMMENT ON COLUMN "HEXICLOUDDEV"."USERS"."PASSWORD" IS 'password of the user';
   COMMENT ON COLUMN "HEXICLOUDDEV"."USERS"."EMAIL" IS 'Email id of the user';
   COMMENT ON COLUMN "HEXICLOUDDEV"."USERS"."USER_ROLE" IS 'Role of the user';
   COMMENT ON COLUMN "HEXICLOUDDEV"."USERS"."FIRST_NAME" IS 'First name of the user';
   COMMENT ON COLUMN "HEXICLOUDDEV"."USERS"."LAST_NAME" IS 'Last name of the user';
   COMMENT ON COLUMN "HEXICLOUDDEV"."USERS"."ACTIVE" IS 'flag indicating if the user is active';
   COMMENT ON COLUMN "HEXICLOUDDEV"."USERS"."PWD_LAST_CHANGED" IS 'Date of the last password change';
   COMMENT ON COLUMN "HEXICLOUDDEV"."USERS"."LAST_LOGGED_IN" IS 'Date last logged in';
--------------------------------------------------------
--  DDL for Table USER_EMAILS
--------------------------------------------------------

  CREATE TABLE "HEXICLOUDDEV"."USER_EMAILS" 
   (	"SR_ID" NUMBER, 
	"USER_ID" VARCHAR2(80 BYTE), 
	"SUBJECT" VARCHAR2(250 BYTE), 
	"MESSAGE" VARCHAR2(4000 BYTE), 
	"CREATED_DATE" TIMESTAMP (6), 
	"SENT_TO" VARCHAR2(80 BYTE), 
	"SENT_CC" VARCHAR2(80 BYTE), 
	"SENT_BCC" VARCHAR2(80 BYTE), 
	"IS_RESOLVED" NUMBER(1,0) DEFAULT 0, 
	"CSM_MAIL_COUNT" NUMBER DEFAULT 0, 
	"REQUEST_SENT_ON" DATE, 
	"RESOLUTION_COMMENTS" VARCHAR2(4000 BYTE), 
	"CALL_BACK_REQUEST" VARCHAR2(1 CHAR) DEFAULT 'N'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Package PKG_EMAIL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "HEXICLOUDDEV"."PKG_EMAIL" 
IS
  --
  -- Procedure to return the SR_ID after user has sent an email
  --
  PROCEDURE PRC_SAVE_USER_EMAIL(
      IN_USER_ID  IN USER_EMAILS.USER_ID%TYPE,
      IN_SUBJECT  IN USER_EMAILS.SUBJECT%TYPE,
      IN_MESSAGE  IN USER_EMAILS.MESSAGE%TYPE,
      IN_SENT_TO  IN USER_EMAILS.SENT_TO%TYPE,
      IN_SENT_CC  IN USER_EMAILS.SENT_CC%TYPE,
      IN_SENT_BCC IN USER_EMAILS.SENT_BCC%TYPE,
      OUT_SR_ID OUT USER_EMAILS.SR_ID%TYPE);
  --
  -- Procedure to return the SR_ID after user has requested a call back
  --
  PROCEDURE PRC_REQUEST_CALL_BACK(
      IN_USER_ID IN USER_EMAILS.USER_ID%TYPE,
      IN_PHONE   IN USERS.PHONE%TYPE,
      IN_MESSAGE IN USER_EMAILS.MESSAGE%TYPE,
      OUT_SR_ID OUT USER_EMAILS.SR_ID%TYPE);
      
--
-- Procedure to send email to csm email list with cc to lead
-- 
   PROCEDURE PRC_EMAIL_CSM_MAILING_LIST(
      IN_SUBJECT IN VARCHAR2,
      IN_MESSAGE IN VARCHAR2,
      OUT_EMAIL_SUCCESS OUT VARCHAR2);
      
--
-- Procedure to send email to CSM lead 
--
 PROCEDURE PRC_EMAIL_CSM_LEAD(
      IN_SUBJECT IN VARCHAR2,
      IN_MESSAGE IN VARCHAR2,
      OUT_EMAIL_SUCCESS OUT VARCHAR2);
      
--
-- Procedure to send welcome email to the customer
--      
  PROCEDURE PRC_SEND_WELCOME_EMAIL(
      IN_USER_ID IN USERS.USER_ID%TYPE,
      IN_PASSWORD IN USERS.PASSWORD%TYPE,
      IN_FIRST_NAME IN USERS.FIRST_NAME%TYPE,
	  IN_USER_EMAIL IN USERS.EMAIL%TYPE,
	  OUT_EMAIL_SENT OUT VARCHAR2);

--
-- Procedure to send tailored usecases to the user
-- 
  PROCEDURE PRC_SEND_TAILORED_USE_CASES(
      IN_USER_ID IN USERS.USER_ID%TYPE,
	  OUT_EMAIL_SENT OUT VARCHAR2);

END PKG_EMAIL;

/

  --------------------------------------------------------
--  DDL for Package Body PKG_EMAIL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PKG_EMAIL" 
IS 
  PROCEDURE PRC_SAVE_USER_EMAIL(
      IN_USER_ID  IN USER_EMAILS.USER_ID%TYPE,
      IN_SUBJECT  IN USER_EMAILS.SUBJECT%TYPE,
      IN_MESSAGE  IN USER_EMAILS.MESSAGE%TYPE,
      IN_SENT_TO  IN USER_EMAILS.SENT_TO%TYPE,
      IN_SENT_CC  IN USER_EMAILS.SENT_CC%TYPE,
      IN_SENT_BCC IN USER_EMAILS.SENT_BCC%TYPE,
      OUT_SR_ID OUT USER_EMAILS.SR_ID%TYPE)
  IS
    sr_id_temp    NUMBER      := 0;
    email_success VARCHAR2(1) := 'N';
    PRE_STEP USER_STEPS.PRE_STEP_CODE%TYPE;
    MESSAGE                        VARCHAR2(4000) :=''; 
    SUBJECT                        VARCHAR2(600)  :='';
    CSM_EMAIL_LIST                 VARCHAR2(200)   :=''; 
    CURSOR PRE_STEP_C
    IS
      SELECT CUR_STEP_CODE FROM USER_STEPS WHERE USER_ID = IN_USER_ID;
    
  BEGIN
    SELECT RULE_VALUE INTO CSM_EMAIL_LIST FROM RULE_CONFIGURATION WHERE RULE_KEY = 'PORTAL_NOTIFICATION_EMAIL_ID';
    INSERT
    INTO USER_EMAILS
      (USER_ID, SUBJECT, MESSAGE, CREATED_DATE, SENT_TO, SENT_CC, SENT_BCC)
      VALUES
      (IN_USER_ID, IN_SUBJECT, IN_MESSAGE, SYSDATE, CSM_EMAIL_LIST, IN_SENT_CC, IN_SENT_BCC)
    RETURNING SR_ID INTO sr_id_temp;
    
    
    OPEN PRE_STEP_C;
    FETCH PRE_STEP_C INTO PRE_STEP;
    CLOSE PRE_STEP_C;
    
    SUBJECT := IN_SUBJECT || '- recieved with Email Request id : #' || sr_id_temp;
    
    MESSAGE := IN_MESSAGE || '<br/><br/><br/>' || '<font style="font-weight: bold; font-size: 14pt;"> Info from the portal: </font><br/><br/> User faced issue in the step: ' || PRE_STEP;
    
    PRC_EMAIL_CSM_MAILING_LIST(SUBJECT, MESSAGE, email_success);
    
    COMMIT;
    
    OUT_SR_ID := sr_id_temp;
  
  END PRC_SAVE_USER_EMAIL;
  
  
  PROCEDURE PRC_REQUEST_CALL_BACK(
      IN_USER_ID IN USER_EMAILS.USER_ID%TYPE,
      IN_PHONE   IN USERS.PHONE%TYPE,
      IN_MESSAGE IN USER_EMAILS.MESSAGE%TYPE,
      OUT_SR_ID OUT USER_EMAILS.SR_ID%TYPE)
  IS
    sr_id_temp     NUMBER                        := 0;
    email_success  VARCHAR2(1)                   := 'N';
    MESSAGE        VARCHAR2(4000)                :='';
    SUBJECT_V      VARCHAR2(600)                 :='';
    PHONE_V USERS.PHONE%TYPE                     := '';
    FIRST_NAME_V USERS.FIRST_NAME%TYPE           := '';
    CSM_EMAIL_LIST                 VARCHAR2(200)   :=''; 
    
    CURSOR GET_PHONE_C
    IS
      SELECT PHONE, FIRST_NAME FROM USERS WHERE USER_ID = IN_USER_ID;
    
  
  BEGIN
    
    OPEN GET_PHONE_C;
    FETCH GET_PHONE_C INTO PHONE_V, FIRST_NAME_V;
    CLOSE GET_PHONE_C;
        
    SUBJECT_V := 'Callback Requested by ' || FIRST_NAME_V || ' with user id : ' || IN_USER_ID;
    
    SELECT RULE_VALUE INTO CSM_EMAIL_LIST FROM RULE_CONFIGURATION WHERE RULE_KEY = 'PORTAL_NOTIFICATION_EMAIL_ID';
    
    INSERT
    INTO USER_EMAILS
      (USER_ID, SUBJECT, MESSAGE, CREATED_DATE, SENT_TO, CALL_BACK_REQUEST)
      VALUES
      (IN_USER_ID, SUBJECT_V, IN_MESSAGE, SYSDATE, CSM_EMAIL_LIST, 'Y')
    RETURNING SR_ID INTO sr_id_temp;
    
    IF IN_PHONE IS NOT NULL THEN
      PHONE_V   := IN_PHONE;
      UPDATE USERS SET PHONE = IN_PHONE WHERE USER_ID = IN_USER_ID;
    END IF;
    
    SUBJECT_V := SUBJECT_V || ', request id : #' || sr_id_temp;
    
    MESSAGE   := IN_MESSAGE || '<br/><br/><br/>' || '<font style="font-weight: bold; font-size: 14pt;"> Customer phone number: </font> '|| PHONE_V;
    
    PRC_EMAIL_CSM_MAILING_LIST(SUBJECT_V, MESSAGE, email_success);
    
    COMMIT;
    
    OUT_SR_ID := sr_id_temp;
  
  END PRC_REQUEST_CALL_BACK;
  
  PROCEDURE PRC_EMAIL_CSM_MAILING_LIST(
        IN_SUBJECT IN VARCHAR2,
      IN_MESSAGE IN VARCHAR2,
      OUT_EMAIL_SUCCESS OUT VARCHAR2)
    IS
    PORTAL_NOTIF_EMAIL_V VARCHAR2(40);
    CSM_EMAIL_LIST_V     VARCHAR2(200);
    LEAD_EMAIL_V         VARCHAR2(200);
    EMAIL_SUCESS_V       VARCHAR2(1) := 'N';
    CURSOR GET_EMAILS_C
    IS
      SELECT * FROM RULE_CONFIGURATION WHERE RULE_TYPE = 'SEND_EMAIL_TYPE';
  BEGIN
    FOR EMAIL_REC IN GET_EMAILS_C
    LOOP
      IF EMAIL_REC.RULE_KEY    = 'PORTAL_NOTIFICATION_EMAIL_ID' THEN
        PORTAL_NOTIF_EMAIL_V  := EMAIL_REC.RULE_VALUE;
      ELSIF EMAIL_REC.RULE_KEY = 'CSM_EMAIL_LIST' THEN
        CSM_EMAIL_LIST_V      := EMAIL_REC.RULE_VALUE;
      ELSIF EMAIL_REC.RULE_KEY = 'CSM_LEAD_EMAIL' THEN
        LEAD_EMAIL_V          := EMAIL_REC.RULE_VALUE;
      END IF;
    END LOOP;

    send_email(PORTAL_NOTIF_EMAIL_V, CSM_EMAIL_LIST_V, IN_SUBJECT, IN_MESSAGE, EMAIL_SUCESS_V, LEAD_EMAIL_V);
    OUT_EMAIL_SUCCESS := EMAIL_SUCESS_V;
  END PRC_EMAIL_CSM_MAILING_LIST;


  PROCEDURE PRC_EMAIL_CSM_LEAD(
      IN_SUBJECT IN VARCHAR2,
      IN_MESSAGE IN VARCHAR2,
      OUT_EMAIL_SUCCESS OUT VARCHAR2)
  IS
    PORTAL_NOTIF_EMAIL_V VARCHAR2(40);
    CSM_EMAIL_LIST_V     VARCHAR2(200);
    LEAD_EMAIL_V         VARCHAR2(200);
    EMAIL_SUCESS_V       VARCHAR2(1) := 'N';
    CURSOR GET_EMAILS_C
    IS
      SELECT * FROM RULE_CONFIGURATION WHERE RULE_TYPE = 'SEND_EMAIL_TYPE';
  BEGIN
    FOR EMAIL_REC IN GET_EMAILS_C
    LOOP
      IF EMAIL_REC.RULE_KEY    = 'PORTAL_NOTIFICATION_EMAIL_ID' THEN
        PORTAL_NOTIF_EMAIL_V  := EMAIL_REC.RULE_VALUE;
      ELSIF EMAIL_REC.RULE_KEY = 'CSM_EMAIL_LIST' THEN
        CSM_EMAIL_LIST_V      := EMAIL_REC.RULE_VALUE;
      ELSIF EMAIL_REC.RULE_KEY = 'CSM_LEAD_EMAIL' THEN
        LEAD_EMAIL_V          := EMAIL_REC.RULE_VALUE;
      END IF;
    END LOOP;
    send_email(PORTAL_NOTIF_EMAIL_V, LEAD_EMAIL_V, IN_SUBJECT, IN_MESSAGE, EMAIL_SUCESS_V);
    OUT_EMAIL_SUCCESS := EMAIL_SUCESS_V;
  END PRC_EMAIL_CSM_LEAD;
 
  
--
-- Procedure to send welcome email to the customer
-- 
  PROCEDURE PRC_SEND_WELCOME_EMAIL(
      IN_USER_ID IN USERS.USER_ID%TYPE,
      IN_PASSWORD IN USERS.PASSWORD%TYPE,
      IN_FIRST_NAME IN USERS.FIRST_NAME%TYPE,
	  IN_USER_EMAIL IN USERS.EMAIL%TYPE,
	  OUT_EMAIL_SENT OUT VARCHAR2)
	IS
	
	SUBJECT_V VARCHAR2(600) := '';
	BODY_V VARCHAR2(20000) := '';
	EMAIL_SUCCESS_V VARCHAR2(1) := 'N';
	
	CURSOR GET_BODY
    IS
      SELECT * FROM RULE_CONFIGURATION WHERE RULE_TYPE = 'CUS_WEL_BODY' ORDER BY RULE_KEY;
	
	BEGIN
	
		SELECT RULE_VALUE INTO SUBJECT_V FROM RULE_CONFIGURATION WHERE RULE_KEY = 'CUSTOMER_WELCOME_EMAIL_SUB';
	
		FOR RULE_REC IN GET_BODY
		LOOP
			BODY_V := BODY_V || RULE_REC.RULE_VALUE;
		END LOOP;
		
		BODY_V := REPLACE(BODY_V, '<<FIRST_NAME>>', IN_FIRST_NAME);
		BODY_V := REPLACE(BODY_V, '<<USER_ID>>', IN_USER_ID);
		BODY_V := REPLACE(BODY_V, '<<PASSWORD>>', IN_PASSWORD);
		
		send_email(NULL, IN_USER_EMAIL, SUBJECT_V, BODY_V, EMAIL_SUCCESS_V);
		
		OUT_EMAIL_SENT := EMAIL_SUCCESS_V;
	END  PRC_SEND_WELCOME_EMAIL;
  
  --
-- Procedure to send tailored usecases to the user
-- 
  PROCEDURE PRC_SEND_TAILORED_USE_CASES(
      IN_USER_ID IN USERS.USER_ID%TYPE,
	  OUT_EMAIL_SENT OUT VARCHAR2)
	IS
	
	SEND_EMAIL_V VARCHAR2(1) := 'N';
	FIRST_NAME_V USERS.FIRST_NAME%TYPE := '';
	USER_EMAIL_V USERS.EMAIL%TYPE := '';
	SUBJECT_V VARCHAR2(600) := '';
	BODY_V VARCHAR2(20000) := '';
	BODY_LI_V VARCHAR2(400) := '';
	EMAIL_SUCCESS_V VARCHAR2(1) := 'N';
	USECASES_LI_V VARCHAR2(2000) := '';
	
	CURSOR GET_USECASES
    IS
      SELECT UC.TITLE FROM USER_USECASES UUC, USE_CASES UC WHERE UUC.USER_ID = IN_USER_ID AND UUC.CODE = 'T' AND UUC.USECASE_ID = UC.USECASE_ID;
	
	BEGIN
	
		SELECT RULE_VALUE INTO SUBJECT_V FROM RULE_CONFIGURATION WHERE RULE_KEY = 'TAILORED_USECASES_EMAIL_SUBJECT';
		SELECT RULE_VALUE INTO BODY_V FROM RULE_CONFIGURATION WHERE RULE_KEY = 'TAILORED_USECASES_EMAIL_BODY';
		SELECT RULE_VALUE INTO BODY_LI_V FROM RULE_CONFIGURATION WHERE RULE_KEY = 'TAILORED_USECASES_EMAIL_BODY_LI';
		SELECT RULE_VALUE INTO SEND_EMAIL_V FROM RULE_CONFIGURATION WHERE RULE_KEY = 'TAILORED_USECASES_EMAIL_FLAG';
		SELECT FIRST_NAME, EMAIL INTO FIRST_NAME_V, USER_EMAIL_V FROM USERS WHERE USER_ID = IN_USER_ID;
		
		IF SEND_EMAIL_V = 'Y' THEN
		
			BODY_V := REPLACE(BODY_V, '<<FIRST_NAME>>', FIRST_NAME_V);
			FOR USECASE IN GET_USECASES
			LOOP
				USECASES_LI_V := USECASES_LI_V || REPLACE(BODY_LI_V, '<<USE_CASE>>', USECASE.TITLE);
			END LOOP;
			BODY_V := REPLACE(BODY_V, '<<USE_CASES>>', USECASES_LI_V);
		END IF;
		send_email(NULL, USER_EMAIL_V, SUBJECT_V, BODY_V, EMAIL_SUCCESS_V);
		
		OUT_EMAIL_SENT := EMAIL_SUCCESS_V;
	END  PRC_SEND_TAILORED_USE_CASES;
  
END PKG_EMAIL;

/


REM INSERTING into HEXICLOUDDEV.RULE_CONFIGURATION
SET DEFINE OFF;
REM INSERTING into EXPORT_TABLE
SET DEFINE OFF;
Insert into EXPORT_TABLE (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('USECASE_SELECTION_IGNORED_SUBJECT','UC_SEL_IGN_EMAIL','<<FIRST_NAME>> has ignored Use Case selection','Y',null,'USECASE_SELECTION_IGNORED_SUBJECT','text');
Insert into EXPORT_TABLE (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('USECASE_SELECTION_IGNORED_BODY','UC_SEL_IGN_EMAIL','Hi,  <br/> <p> User <<FIRST_NAME>> with user id <<USER_ID>> has ignored the Use Case Selection. Please follow up.','Y',null,'USECASE_SELECTION_IGNORED_BODY','text');
Insert into EXPORT_TABLE (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('TAILORED_USECASES_EMAIL_FLAG','Text','Y','Y',null,'TAILORED_USECASES_EMAIL_FLAG','text');
Insert into EXPORT_TABLE (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('TAILORED_USECASES_EMAIL_SUBJECT','Text','Here are your Tailored Use Cases','Y',null,'TAILORED_USECASES_EMAIL_SUBJECT','text');
Insert into EXPORT_TABLE (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('TAILORED_USECASES_EMAIL_BODY','Text','<!DOCTYPE html><html lang=en><meta charset=utf-8><meta content="width=device-width"name=viewport><meta content="IE=edge"http-equiv=X-UA-Compatible><title></title><style>#bodyTable,body{height:100%!important;width:100%!important;margin:0;padding:0}a,blockquote,body,li,p,table,td{-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%}.msg-body,.thread-item.expanded .thread-body .body{width:100%!important;display:block!important}.ExternalClass,.ReadMsgBody{width:100%;background-color:#f4f4f4}.ExternalClass,.ExternalClass div,.ExternalClass font,.ExternalClass p,.ExternalClass span,.ExternalClass td{line-height:100%}table{border-spacing:0}table,td{border-collapse:collapse;mso-table-lspace:0;mso-table-rspace:0}img{-ms-interpolation-mode:bicubic}a img,img{border:0;outline:0;text-decoration:none}.yshortcuts a{border-bottom:none!important}.mobile_link,.mobile_link a,a[href^=tel]{color:#222!important;text-decoration:underline!important}@media screen and (max-device-width:600px),screen and (max-width:600px){table[class=email-container]{width:100%!important}table[class=fluid]{width:100%!important}img[class=fluid],img[class=force-col-center]{width:100%!important;max-width:100%!important;height:auto!important}img[class=force-col-center]{margin:auto!important}td[class=force-col-center],td[class=force-col]{display:block!important;width:100%!important;clear:both}td[class=force-col-center]{text-align:center!important}img[class=col-3-img-l]{float:left;margin:0 15px 15px 0}img[class=col-3-img-r]{float:right;margin:0 0 15px 15px}table[class=button]{width:100%!important}}@media screen and (max-device-width:425px),screen and (max-width:425px){div[class=hh-visible]{display:block!important}div[class=hh-center]{text-align:center;width:100%!important}table[class=hh-fluid]{width:100%!important}img[class=hh-fluid],img[class=hh-force-col-center]{width:100%!important;max-width:100%!important;height:auto!important}img[class=hh-force-col-center]{margin:auto!important}td[class=hh-force-col-center],td[class=hh-force-col]{display:block!important;width:100%!important;clear:both}td[class=hh-force-col-center]{text-align:center!important}img[class=col-3-img-l],img[class=col-3-img-r]{float:none!important;margin:15px auto!important;text-align:center!important}}</style><body bgcolor=#f4f4f4 leftmargin=0 marginheight=0 marginwidth=0 style=margin:0;padding:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none topmargin=0><table border=0 cellpadding=0 cellspacing=0 width=100% style="border-collapse:collapse;table-layout:fixed;margin:0 auto"bgcolor=#f4f4f4 height=100% id=bodyTable><tr><td><div style=display:none;visibility:hidden;opacity:0;color:transparent;height:0;width:0;line-height:0;overflow:hidden;mso-hide:all>Visually hidden preheader text.</div><table border=0 cellpadding=0 cellspacing=0 width=600 align=center class=email-container style=margin:auto><tr><td style=font-size:0;line-height:0 height=30> <tr><td style="padding:20px 0;text-align:center"class=force-col-center valign=middle><img alt="alt text"border=0 height=75 src=https://www.hexicloud.com/css/img/hexicloud_email_logo.png width=300><tr><td style=font-size:0;line-height:0 height=30> </table><table border=0 cellpadding=0 cellspacing=0 width=90% align=center class=email-container style="border:1px solid #e5e5e5;margin:auto"bgcolor=#ffffff><tr><td style="border-bottom:1px solid #e5e5e5"><table border=0 cellpadding=0 cellspacing=0 width=100% align=center><tr><td style=padding:30px;font-family:Calibri;font-size:12pt;line-height:22px;color:#444>Hello <<FIRST_NAME>>,<br><br>Based on your inputs, we have the following tailored use cases best fit for your services and needs.<br><br>Please visit the dashboard to start implementing your use cases or to know more about implementing your use cases.<br><br><ul><<USE_CASES>></ul><br><br>EMEA IaaS Customer Success</table></table></table>','Y',null,'TAILORED_USECASES_EMAIL_BODY','text');
Insert into EXPORT_TABLE (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('TAILORED_USECASES_EMAIL_BODY_LI','Text','<li> <<USE_CASE>></li>','Y',null,'TAILORED_USECASES_EMAIL_BODY_LI','text');


COMMIT;
  

