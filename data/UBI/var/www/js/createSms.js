/*
 * File: createSms.js
 * Created on 13th Mar 2013 - Lakshmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * Validates fields in the page
 * @method localOuiDatabaseValidations
 */
function createSmsValidations(){
    var statusObj = document.getElementById ('hdStatus');
    if (statusObj)
        {
            if (statusObj.value == 'enabled')
                {
                    alert(LANG_LOCALE['30415']);
                    return false;
                }
        }
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_receiver,"+LANG_LOCALE['12060'];
    txtFieldIdArr[1] = "tf1_textMessage,"+LANG_LOCALE['12199'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false; 
            
    var txtMsgObj =  $("#tf1_textMessage");
    if (txtMsgObj && txtMsgObj.val().length > 160)
        {
            alert(LANG_LOCALE['30613']);
            txtMsgObj.focus();
            return false;
        }

 	if (chkPhoneNumber('tf1_receiver') == false) 
         return false;   
     
    return true;
}


function chkPhoneNumber(fldId){
	var phNoObj = document.getElementById(fldId);
	if (phNoObj)
	{
	    var phno = phNoObj.value;	
	    if((phno.length < 11) || (phno.length > 12)){
		alert(LANG_LOCALE['30416']);
		document.getElementById(fldId).focus();
		return false;
	    }else{
		return true;
	    }
	}
}