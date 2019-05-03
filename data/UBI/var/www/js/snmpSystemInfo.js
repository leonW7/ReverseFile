/*
 * File: snmpSystemInfo.js
 * Created on 31nd Oct 2012 - Bala Krishna G
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 Function: pageValidate - SNMP System Info Form Fields validation
 Purpose: Validates fields in the page
 Returns: true or false
 **/
function pageValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_sysContact,"+LANG_LOCALE['12190'];
    txtFieldIdArr[1] = "tf1_sysLocation,"+LANG_LOCALE['12191'];
    txtFieldIdArr[2] = "tf1_sysName,"+LANG_LOCALE['12192'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    if (alphaNumericValueCheck ("tf1_sysName", '-', '') == false)    
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
}
