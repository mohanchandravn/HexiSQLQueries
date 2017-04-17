--------------------------------------------------------
--  DDL for Package PKG_USER_NAV_AUDIT
--------------------------------------------------------

create or replace PACKAGE PKG_CLM
IS
  --
  -- Procedure to checkt the audit and push the data from temp to CLM_DATA
  --
  PROCEDURE PRC_COPY_TEMP_TO_CLM(
      OUT_STATUS OUT CLM_DATA_AUDIT.STATUS%TYPE);
 
END PKG_CLM;

/

create or replace PACKAGE BODY PKG_CLM
IS
  PROCEDURE PRC_COPY_TEMP_TO_CLM(
      OUT_STATUS OUT CLM_DATA_AUDIT.STATUS%TYPE)
  IS
    CSC_LEAD_EMAIL_V     VARCHAR2(40); 
    PORTAL_NOTIF_EMAIL_V VARCHAR2(40);
    CLM_PUSH_ROW CLM_DATA_AUDIT%ROWTYPE;
    PORTAL_PUSH_ROW CLM_DATA_AUDIT%ROWTYPE;
    SUBJECT       VARCHAR2(400)  := '';
    MESSAGE       VARCHAR2(4000) := '';
    EMAIL_SUCCESS VARCHAR2(1)    := 'N';
    CUR_AUDIT_ID CLM_DATA_AUDIT.AUDIT_ID%TYPE;
    FAILED_MESSAGE CLM_DATA_AUDIT.FAILURE_REASON%TYPE := '';
    OUT_STATUS_V CLM_DATA_AUDIT.STATUS%TYPE           := '';
    NO_DATA_FOUND_CLM_AUDIT    VARCHAR2(1)               := 'N';
    NO_DATA_FOUND_PORTAL_AUDIT VARCHAR2(1)               := 'N';
  BEGIN
    BEGIN
      SELECT *
      INTO CLM_PUSH_ROW
      FROM CLM_DATA_AUDIT
      WHERE CODE = 'CLM_TO_TEMP'
      AND ROWNUM = 1
      ORDER BY AUDIT_ID DESC;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      NO_DATA_FOUND_CLM_AUDIT := 'Y';
    END;
    BEGIN
      SELECT *
      INTO PORTAL_PUSH_ROW
      FROM CLM_DATA_AUDIT
      WHERE CODE = 'TEMP_TO_PORTAL_CLM'
      AND ROWNUM = 1
      ORDER BY AUDIT_ID DESC;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      NO_DATA_FOUND_PORTAL_AUDIT := 'Y';
    END;
    IF NO_DATA_FOUND_CLM_AUDIT = 'N' THEN
      IF CLM_PUSH_ROW.STATUS   = 'FAILURE' THEN
        SUBJECT               := 'CLM push to portal temp table failed ' || CLM_PUSH_ROW.AUDIT_ID;
        MESSAGE               := 'Hi<br/> <br/>' || 'There was a issue in CLM pushing the data to the temp table. Audit Id is : ' || CLM_PUSH_ROW.AUDIT_ID;
        MESSAGE               := MESSAGE || '<br/><br/>' || 'Failure reason is :   <br/>' || CLM_PUSH_ROW.FAILURE_REASON;
        PKG_EMAIL.PRC_EMAIL_CSM_LEAD(SUBJECT, MESSAGE, EMAIL_SUCCESS);
        OUT_STATUS_V                 := 'No Run';
      ELSIF CLM_PUSH_ROW.STATUS       = 'SUCCESS' THEN
        IF NO_DATA_FOUND_PORTAL_AUDIT = 'N' AND PORTAL_PUSH_ROW.LAST_INSERTED_AUDIT_ID = CLM_PUSH_ROW.AUDIT_ID THEN
          SUBJECT                    := 'CLM push to portal temp did not happen ';
          MESSAGE                    := 'Hi<br/><br/>' || 'The CLM data was not pushed to the temp table, so not refreshing the data in the portal database, last push from CLM was done with id : ' || CLM_PUSH_ROW.AUDIT_ID ;
          PKG_EMAIL.PRC_EMAIL_CSM_LEAD(SUBJECT, MESSAGE, EMAIL_SUCCESS);
          OUT_STATUS_V := 'No Run';
        ELSE
          BEGIN
            INSERT
            INTO CLM_DATA_AUDIT
              (
                START_DATE_TIME,
                STATUS,
                CODE
              )
              VALUES
              (
                SYSDATE,
                'IN PROGRESS',
                'TEMP_TO_PORTAL_CLM'
              )
            RETURNING AUDIT_ID
            INTO CUR_AUDIT_ID;
            
            COMMIT;
            
            DELETE FROM CLM_DATA;
             
            COMMIT;
            
            INSERT INTO CLM_DATA
            SELECT *
              FROM CLM_DATA_TEMP
              WHERE UPPER(FPH_DESCRIPTION_TIER_4) = 'PUBLIC CLOUD - IAAS'
              AND UPPER(SUB_LINE_STATUS)        = 'ACTIVE'
              AND UPPER(FPH_DESCRIPTION_TIER_6) NOT LIKE 'IAAS PUBLIC CLOUD%'
              AND UPPER(FPH_DESCRIPTION_TIER_7) NOT LIKE 'DIVA CLOUD SERVICE%'
              AND UPPER(FPH_DESCRIPTION_TIER_6) LIKE '%NON METERED%';
            
            COMMIT;
            
            UPDATE CLM_DATA_AUDIT
            SET END_DATE_TIME        = SYSDATE,
              STATUS                 = 'SUCCESS',
              LAST_INSERTED_AUDIT_ID = CLM_PUSH_ROW.AUDIT_ID
            WHERE AUDIT_ID           = CUR_AUDIT_ID;
            
            COMMIT;
            
            OUT_STATUS_V := 'SUCCESS';
            
          EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
            FAILED_MESSAGE := 'Error Code : ' || SQLCODE || ', Message is : ' || SQLERRM;
            UPDATE CLM_DATA_AUDIT
            SET END_DATE_TIME        = SYSDATE,
              STATUS                 = 'FAILURE',
              LAST_INSERTED_AUDIT_ID = CLM_PUSH_ROW.AUDIT_ID,
              FAILURE_REASON         = FAILED_MESSAGE
            WHERE AUDIT_ID           = CUR_AUDIT_ID;
            COMMIT;
            SUBJECT := 'CLM push to portal table from  temp failed';
            MESSAGE := 'Hi<br/> <br/>' || 'The CLM data push from temp table to portal table failed, so not refreshing the data in the portal database, failure reason : ' || FAILED_MESSAGE;
            PKG_EMAIL.PRC_EMAIL_CSM_LEAD(SUBJECT, MESSAGE, EMAIL_SUCCESS);
            OUT_STATUS_V := 'FAILURE';
          END;
        END IF;
      END IF;
    ELSE
      SUBJECT := 'CLM Push to the temp table is not done ';
      MESSAGE := 'Hi<br/><br/>' || 'The attempt to push the data from the CLM to the temp table is not done. Could not find any audit record';
      PKG_EMAIL.PRC_EMAIL_CSM_LEAD(SUBJECT, MESSAGE, EMAIL_SUCCESS);
      OUT_STATUS_V := 'No Run';
    END IF;
    OUT_STATUS := OUT_STATUS_V;
  END PRC_COPY_TEMP_TO_CLM;
END PKG_CLM;