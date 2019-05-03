/*
 * File: sslVpnResources.js
 * Created on 22nd nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
 
 
 /*
* onload call 
 */
$(document).ready(function() {
	onloadCall(); 	
});
function resourceObjectOnloadCallFn(){
ipNetworkChk();
}
/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method sslVpnResourcesConfigurationValidate
 */
function sslVpnResourcesConfigurationValidate(frmId){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_resourceName, "+LANG_LOCALE['12361'];
    txtFieldIdArr[1] = "tf1_txtIpAddr,"+LANG_LOCALE['12068'];
    txtFieldIdArr[2] = "tf1_txtMaskLen,"+LANG_LOCALE['12050'];
    txtFieldIdArr[3] = "tf1_txtStrPort,"+LANG_LOCALE['12198'];
    txtFieldIdArr[4] = "tf1_txtEndPort,"+LANG_LOCALE['12195'];

    if (txtFieldArrayCheck (txtFieldIdArr) == false)
         return false;

    if (alphaNumericValueCheck ("tf1_resourceName", '', '') == false)    
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;

	if (objTypeCheck() == false)
    	return false;

    var maskLenObj = document.getElementById ('tf1_txtMaskLen');
    if (numericValueRangeCheck (maskLenObj, '', '', 0, 32, true, '', '') == false)
    	return false
         
    var strPortObj = document.getElementById ('tf1_txtStrPort');
    if (numericValueRangeCheck (strPortObj, '', '', 0, 65535, true, '', '') == false)
    	return false

    var endPortObj = document.getElementById ('tf1_txtEndPort');
    if (numericValueRangeCheck (endPortObj, '', '', 0, 65535, true, '', '') == false)
    	return false

    if (checkPortRange ('tf1_txtStrPort', 'tf1_txtEndPort') == false)
    	return false  
    
    setHiddenChks(frmId);
    return true;
}

function ipNetworkChk()	{
	var selValue = comboSelectedValueGet('tf1_addType');
 	switch (parseInt(selValue, 10))		{
		case 1:	/* */
			fieldStateChangeWr ('tf1_txtMaskLen','','','');
			vidualDisplay('tf1_txtMaskLen', 'hide');
			break;
		case 0:	/*  */
		default:
			fieldStateChangeWr ('','','tf1_txtMaskLen','');
			vidualDisplay('tf1_txtMaskLen', 'configRow');
		break;
	}
}
function objTypeCheck()	{
	if(document.getElementById('tf1_addType').value == "2")
		return ipv4AddrValidate (document.getElementById('tf1_txtIpAddr'), 'SN', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true)
	else
		return ipv4AddrValidate (document.getElementById('tf1_txtIpAddr'), 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true)
}


 /****
 * validate the form  
 * @method pageValidate 
 */
function pageValidate(){
    var txtFieldIdArr = new Array ();    
    txtFieldIdArr[0] = "tf1_ipAddress,"+LANG_LOCALE['13501'];
    txtFieldIdArr[1] = "tf1_port,"+LANG_LOCALE['13502'];
    
    if (txtFieldArrayCheck (txtFieldIdArr) == false)
         return false;

    if(ipv4AddrValidate (document.getElementById("tf1_ipAddress"), 'SN', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 	
		return false;
   
    if (numericValueRangeCheck (document.getElementById ('tf1_port'), '', '', 0, 65535, true, LANG_LOCALE['13503'], '') == false)
       return false;
 
	return true;
}

 /****
 * validate the form  
 * @method pageValidate2 
 */
function pageValidate2(){
    var txtFieldIdArr = new Array ();
    txtFieldIdArr[0] = "tf1_localSeripAddress,"+LANG_LOCALE['13501'];   
    txtFieldIdArr[1] = "tf1_domainNameHostConfig,"+LANG_LOCALE['13504'];
    
    if (txtFieldArrayCheck (txtFieldIdArr) == false)
        return false;
        
    if(checkHostName('tf1_domainNameHostConfig','', LANG_LOCALE['11251'],'') == false)
    	return false;

	if(ipv4AddrValidate (document.getElementById("tf1_localSeripAddress"), 'SN', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 			
		return false;

	return true;
}
