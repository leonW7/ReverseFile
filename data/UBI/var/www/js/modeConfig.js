/*
 * File: dmzSetup.js - API library for Mode Config configuration
 * Created on 30nd Oct 2012 - Bala Krishna G
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 Function: pageValidate
 Purpose: Validates fields in the page
 Returns: true or false
 **/
var FOR_OCTET = LANG_LOCALE['11031'];

function pageValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_vpn_startIpAddr,"+LANG_LOCALE['12127'];
    txtFieldIdArr[1] = "tf1_vpn_endIpAdde,"+LANG_LOCALE['12007'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv4Validate('tf1_vpn_startIpAddr', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if (ipv4Validate('tf1_vpn_endIpAdde', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
        
    if(checkIPAddrRange('tf1_vpn_startIpAddr', 'tf1_vpn_endIpAdde')==false)
        return false;
    
    if (ipv4Validate('tf1_vpn_primaryDNS', 'IP', true, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if (ipv4Validate('tf1_vpn_secondaryDNS', 'IP', true, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    
    if (ipv4Validate('tf1_vpn_priWINServer', 'IP', true, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if (ipv4Validate('tf1_vpn_secWINServer', 'IP', true, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
        
}
/**
* This function calls to check ip address range
* @method checkIPAddrRange
*/
function checkIPAddrRange(startIP, endIP){
	var startIpObj=document.getElementById (startIP);
	var endIpObj=document.getElementById (endIP);

	if(startIpObj && !startIpObj.disabled && endIpObj && !endIpObj.disabled){
		var dhcpStart = getIPInt1(startIP)
		var dhcpEnd = getIPInt1(endIP);
		if (compareIP(dhcpStart, dhcpEnd) > 0){
			alert (LANG_LOCALE['10934']);
			document.getElementById(startIP).focus ();
			return false;
		}
	}else{
		return true;
	}
}


