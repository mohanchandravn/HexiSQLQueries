create or replace PACKAGE PKG_EMAIL
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

END PKG_EMAIL;

/

create or replace PACKAGE BODY PKG_EMAIL
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
  
END PKG_EMAIL;