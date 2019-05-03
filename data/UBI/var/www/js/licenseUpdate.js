/*
 * File: licenseUpdate.js
 * Created on 31st Oct 2012 - Bala Krishna G
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/****
 * Validating the IP related fields
 * @method pageValidate
 *
 */
function pageValidate(frmId){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_licenseUpdate,"+LANG_LOCALE['12042'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (alphaNumericValueCheck("tf1_licenseUpdate", '', LANG_LOCALE['13492']) == false) 

        return false;
    
    if (fieldLengthCheck('tf1_licenseUpdate', 25, 25, LANG_LOCALE['11203']) == false) 
        return false;
    
    setHiddenChks(frmId); 
    return true;
}
