/*
 * File: openVpnRemoteNetworks.js
 * Created on 22nd nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method openVpnRemoteNetworksValidate
 */
function openVpnRemoteNetworksValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_txtCommonName,"+LANG_LOCALE['12241'];
    txtFieldIdArr[1] = "tf1_txtRemoteNetwork,"+LANG_LOCALE['12357'];
    txtFieldIdArr[2] = "tf1_txtSnetMask,"+LANG_LOCALE['12402'];
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;     
    
    if (ipv4Validate('tf1_txtRemoteNetwork', 'SN', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    if (validNetMask('tf1_txtSnetMask') == false) 
        return false;

    /*
    Add a check for correct network address
    */
    
    var ipAddrObj = document.getElementById ('tf1_txtRemoteNetwork');
    var ipSubnetmaskObj = document.getElementById ('tf1_txtSnetMask');
    if(checkCorrectNetworkAddress (ipAddrObj, ipSubnetmaskObj) == false)
        {
        alert (LANG_LOCALE['12066']);
        ipAddrObj.focus ();
        return false;
        }
    
    return true;
}
