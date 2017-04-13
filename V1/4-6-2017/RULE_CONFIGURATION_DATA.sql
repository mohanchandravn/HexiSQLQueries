--------------------------------------------------------
--  File created - Thursday-April-06-2017   
--------------------------------------------------------
REM INSERTING into HEXICLOUD.RULE_CONFIGURATION
SET DEFINE OFF;
Insert into HEXICLOUD.RULE_CONFIGURATION (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('CSM_EMAIL_TEMPLATE','Text','Hi <<FIRST_NAME>> <<LAST_NAME>>, Customer email request <<SR_ID>> is not yet resolved.This is the gentle reminder.','Y',1,'EMAIL CONTENT','textarea');
Insert into HEXICLOUD.RULE_CONFIGURATION (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('CUSTOMER_EMAIL_TEMPLATE','Text','Hi <<FIRST NAME>> <<LAST NAME>>, Cloud services provisioned for subscription id <<SUBSCRIPTION_ID>>. please access portal to view details.','Y',2,'CUSTOMER SERVICES EMAIL CONTENT','textarea');
Insert into HEXICLOUD.RULE_CONFIGURATION (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('CUSTOMER_EMAIL_SUBJECT','Text','Customer reminder Email','Y',2,'EMAIL SUBJECT','text');
Insert into HEXICLOUD.RULE_CONFIGURATION (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('DAYS_BETWEEN_REMINDERS','Number','2','Y',1,'DAYS BETWEEN REMINDERS','text');
Insert into HEXICLOUD.RULE_CONFIGURATION (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('CSM_EMAIL_SUBJECT','Text','Reminder : <<REMINDER_COUNT>> for email request <<SR_ID>>','Y',1,'EMAIL SUBJECT','text');
Insert into HEXICLOUD.RULE_CONFIGURATION (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('NO_OF_REMINDERS','Number','3','Y',1,'NO OF REMINDERS TO BE SENT','text');
Insert into HEXICLOUD.RULE_CONFIGURATION (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('CUSTOMER_WELCOME_EMAIL_SUBJECT','Text','Visit your guided cloud adoption portal.','Y',3,'EMAIL SUBJECT','text');
Insert into HEXICLOUD.RULE_CONFIGURATION (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('CUSTOMER_WELCOME_EMAIL_TEMPLATE','Text','<htm><body><center><h2>Start Making the Most of the Cloud</h2></center>

<p><center><h3> Welcome to the Hexicloud guided adoption portal
</h3></center>
</p>

<p>Hi Michel,
<br>
<br>


It’s time to harness the platform of possibilities. 
<br><br>
The cloud is a technology of rich opportunity, but do you have access to the skills and knowledge you need to maximise value from your existing cloud services?
 <br>
<br>
 

Your Oracle Hexicloud guided adoption portal is a digital tutor designed to help you improve your relationship with cloud technologies, encourage wider cloud adoption, and extract value from the cloud. 
<br>
<br>

And with a Customer Success Consultant on hand to help you on your way, your cloud journey is just beginning.
<br>
<br>


Visit your <a href="https://129.152.128.105/hexiCloudPortalV5"> Hexicloud portal </a>  to get started.
<br><br></p>


</body></html>','Y',3,'CUSTOMER SERVICES EMAIL CONTENT','textarea');
Insert into HEXICLOUD.RULE_CONFIGURATION (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('DOCUMENT_CLOUD_SERVICE_URL','DCS','https://documents-usoracleam82569.documents.us2.oraclecloud.com/documents/api/1.1','Y',null,'DCS_URL','text');
Insert into HEXICLOUD.RULE_CONFIGURATION (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('DOCUMENT_CLOUD_SERVICE_USER','DCS','cloud.admin','Y',null,'DCS_USER','text');
Insert into HEXICLOUD.RULE_CONFIGURATION (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('DOCUMENT_CLOUD_SERVICE_PWD','DCS','91CnLIcHxxddlPkHsCKj0Q==','Y',null,'DCS_USER_PASSWORD','text');
Insert into HEXICLOUD.RULE_CONFIGURATION (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('FORGOT_PASSWORD_EMAIL_TEMPLATE','FP_EMAIL_TEMP_TYPE','The requested password for user id <<USER_ID>> is <<PASSWORD>>','Y',4,'FORGOT_PASSWORD_EMAIL','text');
Insert into HEXICLOUD.RULE_CONFIGURATION (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('FORGOT_PASSWORD_EMAIL_SUBJECT','FP_EMAIL_SUB_TYPE','Password Details','Y',null,'FP_EMAIL-SUBJECT','text');
Insert into HEXICLOUD.RULE_CONFIGURATION (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('PORTAL_NOTIFICATION_EMAIL_ID','SEND_EMAIL_TYPE','metcs-cloud.admin@oracleads.com','Y',null,'PORTAL_NOTIFICATION_EMAIL_ID','text');
Insert into HEXICLOUD.RULE_CONFIGURATION (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('CSM_EMAIL_LIST','SEND_EMAIL_TYPE','mohan.chandra@oracle.com','Y',null,'CSM_EMAIL_LIST','text');
Insert into HEXICLOUD.RULE_CONFIGURATION (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('CSM_LEAD_EMAIL','SEND_EMAIL_TYPE','mohan.chandra@oracle.com','Y',null,'CSM_LEAD_EMAIL','text');
Insert into HEXICLOUD.RULE_CONFIGURATION (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('ON_BOARDING_COMPLETION_EMAIL_BODY','Text','<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:w="urn:schemas-microsoft-com:office:word" xmlns:m="http://schemas.microsoft.com/office/2004/12/omml" xmlns="http://www.w3.org/TR/REC-html40"><head><META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=us-ascii"><meta name=Generator content="Microsoft Word 14 (filtered medium)"><!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]--></head><body lang=EN-US link=blue vlink=purple><div class=WordSection1><p class=MsoNormal><span style=''''font-size:12.0pt;font-family:"Arial","sans-serif"''''>Hi <<FIRST_NAME>>,<o:p></o:p></span></p><p class=MsoNormal><span style=''''font-size:12.0pt;font-family:"Arial","sans-serif"''''><o:p>&nbsp;</o:p></span></p><p class=MsoNormal><span style=''''font-size:12.0pt;font-family:"Arial","sans-serif"''''>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Congratulations for having completed the on-boarding stage of your Oracle Cloud journey.<o:p></o:p></span></p><p class=MsoNormal><span style=''''font-size:12.0pt;font-family:"Arial","sans-serif"''''><o:p>&nbsp;</o:p></span></p><p class=MsoNormal><span style=''''font-size:12.0pt;font-family:"Arial","sans-serif"''''>Please let me introduce the <b>C</b>ustomer <b>S</b>uccess <b>C</b>onsultants, whos role is to answer questions as they arise, and to provide you with ongoing advice and guidance as needed so you can be successful in adopting our Cloud solutions.<o:p></o:p></span></p><p class=MsoNormal><span style=''''font-size:12.0pt;font-family:"Arial","sans-serif"''''><o:p>&nbsp;</o:p></span></p><p class=MsoNormal><span style=''''font-size:12.0pt;font-family:"Arial","sans-serif"''''>They look forward to getting in touch with you and helping you on your Cloud journey. If you have any questions, please feel free to ask.<o:p></o:p></span></p><p class=MsoNormal><span style=''''font-size:12.0pt;font-family:"Arial","sans-serif"''''><o:p>&nbsp;</o:p></span></p><p class=MsoNormal align=center style=''''text-align:center''''><img width=348 height=203 id="_x0000_i1025" src="https://129.152.128.105/img/csc.png"><span style=''''font-size:12.0pt;font-family:"Arial","sans-serif"''''><o:p></o:p></span></p><p class=MsoNormal><o:p>&nbsp;</o:p></p></div></body></html>','Y',null,'ON_BOARDING_COMPLETION_EMAIL_BODY','text');
Insert into HEXICLOUD.RULE_CONFIGURATION (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('ON_BOARDING_COMPLETION_EMAIL_SUBJECT','Text','You have completed the on-boarding stage of your Oracle Cloud journey','N',null,'ON_BOARDING_COMPLETION_EMAIL_SUBJECT','text');
