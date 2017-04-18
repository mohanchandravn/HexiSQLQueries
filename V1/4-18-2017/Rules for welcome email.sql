
SET DEFINE OFF;
Insert into HEXICLOUD.RULE_CONFIGURATION (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('CUSTOMER_WELCOME_EMAIL_SUB','Text','Welcome to HexiCloud - Oracle''s IaaS On-Boarding portal','Y',null,'CUSTOMER_WELCOME_EMAIL_SUB','text');

Insert into HEXICLOUD.RULE_CONFIGURATION (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('CUSTOMER_WELCOME_EMAIL_BODY1','CUS_WEL_BODY','<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"> <!-- utf-8 works for most cases -->
	<meta name="viewport" content="width=device-width"> <!-- Forcing initial-scale shouldn''t be necessary -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge"> <!-- Use the latest (edge) version of IE rendering engine -->
  <title></title> <!-- the <title> tag shows on email notifications on Android 4.4. -->
  <style type="text/css">
  	
  	/* ensure that clients don''t add any padding or spaces around the email design and allow us to style emails for the entire width of the preview pane */
		body,
		#bodyTable {
			height:100% !important;
			width:100% !important;
			margin:0;
			padding:0;
		}
		
		/* Ensures Webkit- and Windows-based clients don''t automatically resize the email text. */
		body,
		table,
		td,
		p,
		a,
		li,
		blockquote {
			-ms-text-size-adjust:100%;
			-webkit-text-size-adjust:100%;
		}
		
		/* Forces Yahoo! to display emails at full width */
		.thread-item.expanded .thread-body .body, .msg-body {
			width: 100% !important;
			display: block !important;
		}

    /* Forces Hotmail to display emails at full width */
    .ReadMsgBody,
    .ExternalClass {
			width: 100%;
			background-color: #f4f4f4;
    }

    /* Forces Hotmail to display normal line spacing. */
		.ExternalClass,
		.ExternalClass p,
		.ExternalClass span,
		.ExternalClass font,
		.ExternalClass td,
		.ExternalClass div {
			line-height:100%;
    }

    /* Resolves webkit padding issue. */
    table {
			border-spacing:0;
    }

    /* Resolves the Outlook 2007, 2010, and Gmail td padding issue, and removes spacing around tables that Outlook adds. */
    table,
    td {
			border-collapse:collapse;
			mso-table-lspace:0pt;
			mso-table-rspace:0pt;
    }
    
    /* Corrects the way Internet Explorer renders resized images in emails. */
    img {
    	-ms-interpolation-mode: bicubic;
    }
    
    /* Ensures images don''t have borders or text-decorations applied to them by default. */
    img,
    a img {
    	border:0;
    	outline:none;
    	text-decoration:none;	    
    }

    /* Styles Yahoo''s auto-sensing link color and border */
    .yshortcuts a {
			border-bottom: none !important;
    }
    
    /* Styles the tel URL scheme */
    a[href^=tel],
		.mobile_link,
		.mobile_link a {
	    color:#222222 !important;
			text-decoration: underline !important;
    }
  
    /* Media queries for when the viewport is smaller than the default email width but not too narrow. */
    @media screen and (max-device-width: 600px), screen and (max-width: 600px) {

			/* Constrains email width for small screens */
			table[class="email-container"] {
				width: 100% !important;
			}
			/* Constrains tables for small screens */
			table[class="fluid"] {
				width: 100% !important;
			}
			
			/* Forces images to resize to full width of their container */
			img[class="fluid"],
			img[class="force-col-center"] {
				width: 100% !important;
				max-width: 100% !important;
				height: auto !important;
			}
			/* And centers these ones */
				img[class="force-col-center"] {
				margin: auto !important;
			}
			
			/* Forces table cells into rows */
			td[class="force-col"],
			td[class="force-col-center"] {
				display: block !important;
				width: 100% !important;
				clear: both;
			}
			/* And centers these ones */
			td[class="force-col-center"] {
				text-align: center !important;
			}','Y',null,'CUSTOMER_WELCOME_EMAIL_BODY1','textarea');

Insert into HEXICLOUD.RULE_CONFIGURATION (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('CUSTOMER_WELCOME_EMAIL_BODY2','CUS_WEL_BODY','			/* Forces table cells into rows */
			/* Floats a previously stacked image to the left */
			img[class="col-3-img-l"] {
				float: left;
				margin: 0 15px 15px 0;
			}
			/* Floats a previously stacked image to the right */
			img[class="col-3-img-r"] {
				float: right;
				margin: 0 0 15px 15px;
			}
			
			/* Makes buttons full width */
			table[class="button"] {
				width: 100% !important;
			}
         
    }

    /* Media queries for when the viewport is narrow. */
    /* Rules prefixed with ''hh-'' (for ''handheld'') repeat much of what''s above, but these don''t trigger until the smaller screen width. */
    @media screen and (max-device-width: 425px), screen and (max-width: 425px) {

			/* Helper only visible on handhelds. All styles are inline along with a `display:none`, which this class overrides */
			div[class="hh-visible"] {
				display: block !important;
			}
			
			/* Center stuff */
			div[class="hh-center"] {
				text-align: center;
				width: 100% !important;
			}
			
			/* Constrain tables for small screens */
			table[class="hh-fluid"] {
				width: 100% !important;
			}
			
			/* Force images to resize to full width of their container */
			img[class="hh-fluid"],
			img[class="hh-force-col-center"] {
				width: 100% !important;
				max-width: 100% !important;
				height: auto !important;
			}
			/* And center these ones */
			img[class="hh-force-col-center"] {
				margin: auto !important;
			}
			
			/* Force table cells into rows */
			td[class="hh-force-col"],
			td[class="hh-force-col-center"] {
				display: block !important;
				width: 100% !important;
				clear: both;
			}
			/* And center these ones */
			td[class="hh-force-col-center"] {
				text-align: center !important;
			}
			
			/* Stack the previously floated images */
			img[class="col-3-img-l"],
			img[class="col-3-img-r"] {
				float: none !important;
				margin: 15px auto !important;
				text-align: center !important;
			}

    }
          
  </style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#f4f4f4" style="margin:0; padding:0; -webkit-text-size-adjust:none; -ms-text-size-adjust:none;">
<table cellpadding="0" cellspacing="0" border="0" height="100%" width="100%" bgcolor="#f4f4f4" id="bodyTable" style="border-collapse: collapse;table-layout: fixed;margin:0 auto;"><tr><td>

	<!-- Hidden Preheader Text : BEGIN -->
	<div style="display:none; visibility:hidden; opacity:0; color:transparent; height:0; width:0;line-height:0; overflow:hidden;mso-hide: all;">
		Visually hidden preheader text.
	</div>
	<!-- Hidden Preheader Text : END -->
  
  <!-- Logo Left Nav Right + Vertical Padding : BEGIN -->
  <table border="0" width="600" cellpadding="0" cellspacing="0" align="center" class="email-container" style="margin: auto;">
    <tr>
      <td height="30" style="font-size: 0; line-height: 0;">&nbsp;</td>
    </tr>
    <tr>
      <td class="force-col-center" valign="middle" style="padding: 20px 0;text-align:center;">
        <img src="https://www.hexicloud.com/css/img/hexicloud_email_logo.png" alt="alt text" height="75" width="300" border="0">
      </td>
    </tr>
    <tr>
      <td height="30" style="font-size: 0; line-height: 0;">&nbsp;</td>
    </tr>
  </table>
  <!-- Logo Left Nav Right + Vertical Padding : END -->
 
  <!-- Email Container : BEGIN -->
  <!-- This table wraps the whole body email within it''s width (600px), sets the background color (white) and border (thin, gray, solid) -->','Y',null,'CUSTOMER_WELCOME_EMAIL_BODY2','textarea');

  Insert into HEXICLOUD.RULE_CONFIGURATION (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('CUSTOMER_WELCOME_EMAIL_BODY3','CUS_WEL_BODY','    <table border="0" width="90%" cellpadding="0" cellspacing="0" align="center" bgcolor="#ffffff" style="border: 1px solid #e5e5e5;margin: auto;" class="email-container">

      <!-- Full Width, Fluid Column : BEGIN -->
      <tr>
        <td style="border-bottom: 1px solid #e5e5e5;">
          <table border="0" width="100%" cellpadding="0" cellspacing="0" align="center">
            <tr>
              <td style="padding: 30px; font-family: Calibri; font-size: 12pt; line-height: 22px; color: #444444;">
                Hello <<FIRST_NAME>>,
                <br><br>
                Thank you for your recent purchase of IaaS services. <b>We would like to take this opportunity to invite you to contribute to our Guided Adoption Portal – HexiCloud</b>. As one of the first customers to pilot the on-boarding section of the portal we very much appreciate your feedback.
                <br><br>
                <b>The HexiCloud portal will enable you to be more efficient throughout the adoption of your services.</b>
                <br><br>
                <b>Please go to <a href="https://www.hexicloud.com">HexiCloud.com</a> and start your Cloud Journey today, using the following for login:</b>
                <br></br>
                &nbsp;&nbsp; <b>Username: </b><<USER_ID>>
                <br>
                &nbsp;&nbsp; <b>Password: </b><<PASSWORD>>
                <br><br>
                After you log in and confirm your role within the organization, you’ll be guided through various <b>intuitive screens</b> designed to make your first approach to IaaS services much easier:
                <ul>
                  <li><b>#1</b>: You’ll be able to check the status of your current Cloud environment</li>
                  <li><b>#2</b>: You can learn more about the benefits of your IaaS services</li>
                  <li><b>#3</b>: You can discover what potential Use Cases you can further adopt.</li>
                </ul>
                At the end of this short and comprehensive onboarding stage, the Dashboard page will allow you not only to monitor your services, but will also give you access to our Use Case discovery. After you have on-boarded we will contact you and request you complete a questionnaire to complete.
                <br><br>
                We look forward to engaging with you during your experience thus ensuring we provide you with an innovative and relevant experience.
                <br><br>
                EMEA IaaS Customer Success
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <!-- Full Width, Fluid Column : END -->

  </table>
  <!-- Email Container : END -->


</td></tr></table>
</body>
</html>','Y',null,'CUSTOMER_WELCOME_EMAIL_BODY3','textarea');

Insert into HEXICLOUD.RULE_CONFIGURATION (RULE_KEY,RULE_TYPE,RULE_VALUE,IS_UPDATABLE,JOB_ID,UI_LABEL,INPUT_FIELD_TYPE) values ('CUSTOMER_WELCOME_EMAIL_FLAG','Text','Y','Y',null,'CUSTOMER_WELCOME_EMAIL_FLAG','text');

COMMIT;