/*
 * File: adminSettings.js
 * Created on 31nd Oct 2012 - Bala Krishna G
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 Function: pageValidate - AdminSettings Form Fields validation
 Purpose: Validates fields in the page
 Returns: true or false
 **/
function pageValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_SysName,"+LANG_LOCALE['12134'];
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    if (alphaNumericValueCheck ("tf1_SysName", '-', '') == false)    
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
}
