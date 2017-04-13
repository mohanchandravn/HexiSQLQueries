create or replace PROCEDURE SEND_EMAIL(
    from_email_address IN VARCHAR2 DEFAULT NULL,
    to_email_address   IN VARCHAR2 ,
    email_subject      IN VARCHAR2 ,
    email_body         IN VARCHAR2 ,
    email_success OUT VARCHAR2,
    cc_email_address  IN  VARCHAR2  DEFAULT NULL)
AS
from_email varchar2(200) := '';
BEGIN
  email_success         :='N';
  from_email := from_email_address;

  IF from_email_address IS NULL THEN
    begin
      SELECT RULE_VALUE INTO from_email FROM RULE_CONFIGURATION WHERE RULE_KEY = 'PORTAL_NOTIFICATION_EMAIL_ID';
    
    EXCEPTION
		WHEN NO_DATA_FOUND THEN
		  raise_application_error(-20001,'From email address cannot be null');
		END;
  END IF;
  IF to_email_address IS NULL THEN
    raise_application_error(-20002,'To email address cannot be null');
  END IF;
  IF email_subject IS NULL THEN
    raise_application_error(-20003,'Email subject cannot be null');
  END IF;
  IF email_body IS NULL THEN
    raise_application_error(-20004,'Email body cannot be null');
  END IF;
  APEX_UTIL.SET_SECURITY_GROUP_ID(P_SECURITY_GROUP_ID => '12');
  IF cc_email_address IS NULL THEN
  apex_mail.send( p_to => to_email_address, p_from => from_email, p_body => email_body, p_body_html => email_body, P_SUBJ => email_subject);
  ELSE
  apex_mail.send( p_to => to_email_address,p_cc => cc_email_address, p_from => from_email, p_body => email_body, p_body_html => email_body, P_SUBJ => email_subject);
  END IF;
  apex_mail.push_queue;
    EMAIL_SUCCESS:='Y';
END send_email;