/*
 * File: sessionSettings.js
 * Created on 31st Oct 2012 - Bala Krishna G
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 Function: pageValidate
 Purpose: Validates fields in the page
 Returns: true or false
 **/
function pageValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_admin,"+LANG_LOCALE['12140'];
    txtFieldIdArr[1] = "tf1_guest,"+LANG_LOCALE['12141'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    var myObj = document.getElementById('tf1_admin');
    if (numericValueRangeCheck(myObj, '', '', 0, 999, true, LANG_LOCALE['11205'], '') == false) 
        return false;
    
    myObj = document.getElementById('tf1_guest');
    if (numericValueRangeCheck(myObj, '', '', 0, 999, true, LANG_LOCALE['11270'], '') == false) 
        return false;
    
    return true;
    
}
