/*
 * File: dhcpRange.js
 * Created on 30th Oct 2012 - Bala Krishna G
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 Function: dhcpSetupValidate
 Purpose: Validates fields in the page
 Returns: true or false
 **/
var pppSubnetMask = "255.255.255.255";
var FOR_OCTET = LANG_LOCALE['11031'];
var END_BEGIN_IPADDR = LANG_LOCALE['10932'];
var IP_RANGE = LANG_LOCALE['11393'];
var START_END = LANG_LOCALE['10934'];

function dhcpSetupValidate(){
    var dhcpStartObj = document.getElementById('tf1_startIpAddr');
    var dhcpStart = getIPInt1('tf1_startIpAddr')
    var dhcpEnd = getIPInt1('tf1_endIpAddr');
    var ipMask = getIPInt1('tf1_subnetMask');
    
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_startIpAddr, "+LANG_LOCALE['12127'];
    txtFieldIdArr[1] = "tf1_endIpAddr, "+LANG_LOCALE['12007'];
    txtFieldIdArr[2] = "tf1_subnetMask, "+LANG_LOCALE['12133'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv4Validate('tf1_startIpAddr', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if (ipv4Validate('tf1_endIpAddr', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if (validNetMask('tf1_subnetMask') == false) 
        return false;
    
    if (!isInSubnet(dhcpEnd, dhcpStart, ipMask)) {
        var errorstr = END_BEGIN_IPADDR;
        alert(errorstr);
        dhcpStartObj.focus();
        return false;
    }
    
    if (compareIP(dhcpStart, dhcpEnd) > 0) {
        var errorstr = START_END;
        alert(errorstr);
        dhcpStartObj.focus();
        return false;
    }
    
    if (compareIPRange(dhcpStart, dhcpEnd) == 0) {
        var errorstr = IP_RANGE;
        alert(errorstr);
        dhcpStartObj.focus();
        return false;
    }
    
    return true;
}

