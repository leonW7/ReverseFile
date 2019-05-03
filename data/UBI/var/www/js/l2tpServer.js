/*
 * File: l2tpServer.js    
 * Created on 21st nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * This function calls at the time of page loads
 * OnLoad validation
 * @method pptServerOnload
 */
$(document).ready(function(){    

    onloadCall(l2tpServerOnload, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
    enableTextFieldByAnchorClick('tf1_authSecKey','tf1_authSecKeyValue', 'break_authSecKey');
    enableTextFieldByAnchorClick('tf1_netbiosSetup','tf1_priWinsServer tf1_secWinsServer','break_priWinsServer break_secWinsServer');
    changeL2TPServerMode('tf1_l2tpServerMode');
   
});

/****
 * This function calls when user selects an option from select box
 * OnChange event
 * @method changePPTPServerMode
 * @param selName - Select box Name
 */
function changeL2TPServerMode(selId){
	var selValue = comboSelectedValueGet (selId);
    if (!selValue) return;	
    switch (parseInt (selValue, 10)){
        case 1: /* Enable IPv4 */
        	fieldStateChangeWr ('tf1_ipv6Addr tf1_ipv6Length', 'tf1_rangeIpAddressIPv6Block_div', 'tf1_routingMode tf1_startIpAddr tf1_endIpAddr tf1_authType tf1_pap tf1_chap tf1_msChap tf1_msChapv2 tf1_authSecKey tf1_authSecKeyValue tf1_timeOut ', '');
        	enableTextFieldByAnchorClick('tf1_authSecKey','tf1_authSecKeyValue','break_authSecKey');

        	vidualDisplay ('tf1_routingMode tf1_rangeIpAddressIPv4Block tf1_authTypeDBBlock tf1_authentication tf1_authSecKey tf1_userTimeout ', 'configRow');
        	vidualDisplay ('break_pptpServerMode break_routingMode break_rangeIpAddressIPv4Block break_authTypeDBBlock break_authentication break_msChapv2 break_authSecKey break_userTimeout break_timeOut ', 'break');
        	vidualDisplay ('tf1_rangeIpAddressIPv6Block break_rangeIpAddressIPv6Block', 'hide');
       		break;
        case 2: /* Enable IPv6 */
        	fieldStateChangeWr ('', '', 'tf1_routingMode tf1_startIpAddr tf1_endIpAddr tf1_ipv6Addr tf1_ipv6Length tf1_authType tf1_pap tf1_chap tf1_msChap tf1_msChapv2 tf1_authSecKey tf1_authSecKeyValue tf1_timeOut ', '');
        	enableTextFieldByAnchorClick('tf1_authSecKey','tf1_authSecKeyValue','break_authSecKey');

        	vidualDisplay ('tf1_routingMode tf1_rangeIpAddressIPv4Block tf1_rangeIpAddressIPv6Block tf1_authTypeDBBlock tf1_authentication tf1_authSecKey tf1_userTimeout ', 'configRow');
        	vidualDisplay ('break_pptpServerMode break_routingMode break_rangeIpAddressIPv4Block break_rangeIpAddressIPv6Block break_authTypeDBBlock break_authentication break_msChapv2 break_authSecKey break_userTimeout break_timeOut ', 'break');
        	break;
	    case 3: /* Disable */
        	fieldStateChangeWr ('tf1_routingMode tf1_startIpAddr tf1_endIpAddr tf1_ipv6Addr tf1_ipv6Length tf1_authType tf1_pap tf1_chap tf1_msChap tf1_msChapv2 tf1_authSecKey tf1_authSecKeyValue tf1_timeOut ', '', '');
        	vidualDisplay ('tf1_routingMode tf1_rangeIpAddressIPv4Block tf1_rangeIpAddressIPv6Block tf1_authTypeDBBlock tf1_authentication tf1_authSecKey tf1_authSecKeyValue tf1_userTimeout ', 'hide');
        	vidualDisplay ('break_pptpServerMode break_routingMode break_rangeIpAddressIPv4Block break_rangeIpAddressIPv6Block break_authTypeDBBlock break_authentication break_msChapv2 break_authSecKey break_userTimeout break_timeOut ', 'hide');
       		break;
	}
	changeAuthSupported ();
}

/**
 * This function calls when user selects Authentication Database to show behavior of Authentication support
 * OnChange event
 * @method changeAuthSupported
*/
function changeAuthSupported () {
    var selAuthTypeObj = document.getElementById ('tf1_authType');
    if (selAuthTypeObj && !selAuthTypeObj.disabled) {
        if (selAuthTypeObj.value == "3" || selAuthTypeObj.value == "4") {
            // grey out PAP and CHAP protocols for AD and NT Domain Auth
            fieldStateChangeWr ('tf1_pap tf1_chap', '', 'tf1_msChap tf1_msChapv2', '');
	    	vidualDisplay('tf1_authentication tf1_msChap tf1_msChapv2','configRow');
	    	vidualDisplay('break_msChap break_msChapv2 break_encryption','break');
	    	vidualDisplay('tf1_pap tf1_chap break_pap break_chap','hide');
        }
        else if (selAuthTypeObj.value == "5" || selAuthTypeObj.value == "6") {
	        fieldStateChangeWr ('', 'tf1_authentication tf1_encryption', '', '');
	    	vidualDisplay('tf1_authentication tf1_encryption break_encryption break_authentication','hide');
	    }
	    else {
            fieldStateChangeWr ('', '', 'tf1_pap tf1_chap tf1_msChap tf1_msChapv2', 'tf1_authentication');
	    	vidualDisplay('tf1_authentication tf1_pap tf1_chap tf1_msChap tf1_msChapv2','configRow');
	    	vidualDisplay('break_authentication break_pap break_chap break_msChap break_msChapv2','break');
	    }
    }
}

/**
 * Onload function
 * @method l2tpServerOnload
 * @param toggleObj - object
 */
function l2tpServerOnload(data, thisObj){
    onAnchorToggle(data);
    var imgId=thisObj.id;
    
    switch(imgId){
    	case 'tf1_authSecKey':  		
    		enableTextFieldByAnchorClick(imgId,'tf1_authSecKeyValue','');
    	break;	
	}
}

/**
* function for validate form when user clicks on submit button
* OnSubmit event
* @method l2tpServerValidate 
*/ 
function l2tpServerValidate (frmId){

	var txtFieldIdArr = new Array ();
    txtFieldIdArr[0] = "tf1_startIpAddr, "+LANG_LOCALE['12127'];
    txtFieldIdArr[1] = "tf1_endIpAddr, "+LANG_LOCALE['12007'];
    txtFieldIdArr[2] = "tf1_authSecKeyValue, "+LANG_LOCALE['12111'];
    txtFieldIdArr[3] = "tf1_timeOut, "+LANG_LOCALE['12022'];
    
    if (txtFieldArrayCheck (txtFieldIdArr) == false)
       return false;
       
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
   
    
	if (ipv4Validate ('tf1_startIpAddr', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
    	return false;
    	
	if (ipv4Validate ('tf1_endIpAddr', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
    	return false;	

    if (ipv6Validate('tf1_ipv6Addr', false, true, '') == false) 
        return false;
    
    var startObj = document.getElementById ('tf1_startIpAddr');	
    var endObj = document.getElementById ('tf1_endIpAddr');
	if (startObj && !startObj.disabled && endObj && !endObj.disabled) {

        var alreadyCofigMsg = LANG_LOCALE['30461'];
        var diffSubnetMsg = LANG_LOCALE['30462'];
        
        /*Begin:Subnet Checking for Dmz*/
        if(document.getElementById('dmzIp') && document.getElementById('dmzSnet'))
            {
	            if(document.getElementById('dmzIp').value != '0.0.0.0' && document.getElementById('dmzSnet').value != '0.0.0.0')
			        {
			            if (subnetValidation ('tf1_startIpAddr', 'dmzSnet', 'dmzIp', 'dmzSnet') || subnetValidation ('tf1_endIpAddr', 'dmzSnet', 'dmzIp', 'dmzSnet'))
				            {
				                var errorstr = alreadyCofigMsg+ "(" + LANG_LOCALE['10777'] + ")." +diffSubnetMsg;
		                        alert (errorstr);
		                        startObj.focus ();
		                        return false;
				            }
				    }
	        }
	    /*End:Subnet Checking for Dmz*/
    
        /* SSL-VPN Client pool range Starts */
        var netmask = document.getElementById('hdSnetMask').value;
        var startIp = startObj.value;
        var sslVpnStAddrObj = document.getElementById('hdSslVpnStAddr');
        var sslVpnEndAddrObj = document.getElementById('hdSslVpnEndAddr');
        if (sslVpnStAddrObj && sslVpnEndAddrObj) 
            {
                var sslVpnStAddr = sslVpnStAddrObj.value; 
                var sslVpnEndAddr = sslVpnEndAddrObj.value;
                if(sslVpnStAddr != "" && sslVpnEndAddr != "")
	                {
	                    if(isInSubnetStr(sslVpnStAddr,startIp,netmask) || isInSubnetStr(sslVpnEndAddr,startIp,netmask))
		                    {
            	                var errorstr = "SSL-VPN client pool is also in the same range. Please configure different IP.";
            	                alert (errorstr);
                                startObj.focus();
    		                    return false;
	    	                }
	                }
            }
        /* SSL-VPN Client pool range Ends */

        /* Begin:Subnet Checking for Dhcp Range Over IPSec IPs */
        var startIpAddressObj = document.getElementById('hdstartIpAddress');
        var endIpAddressObj = document.getElementById('hdendIpAddress');
        var subnetmaskObj = document.getElementById('hdsubnetmask');
        if (startIpAddressObj && endIpAddressObj) 
            {
                var startIpAddress = startIpAddressObj.value; 
                var endIpAddress = endIpAddressObj.value;
                var subnetmask = subnetmaskObj.value;
                if(startIpAddress != "" && endIpAddress != "")
	                {
	                    if(isInSubnetStr(startIpAddress,startIp,subnetmask) || isInSubnetStr(endIpAddress,startIp,subnetmask))
		                    {
            	                var errorstr = "DHCP Range Over IpSec is in the same subnet.Please specify IP address in a different subnet.";
            	                alert (errorstr);
                                startObj.focus();
	    	                    return false;
		                    }
	                }
            }
        /* End:Subnet Checking for Dhcp Range Over IPSec IPs */

    var stIpAddr = getIPInt1("tf1_startIpAddr");
	var endIpAddr = getIPInt1("tf1_endIpAddr");
	var snetMask = getIPInt1("hdSnetMask");
	if (!isInSubnet(endIpAddr, stIpAddr, snetMask))	{
		var errorstr = LANG_LOCALE['12975'];
 		alert (errorstr)
	   	return false;
	}
	if (endIpAddr - stIpAddr < 0){
		var errorstr = LANG_LOCALE['10935'];
	   		alert (errorstr)
	   		return false;
	}
	else if(endIpAddr - stIpAddr == 0){
        var errorstr = LANG_LOCALE['13485'];
	   		alert (errorstr);
	   	return false;
    }
    var unitName = document.getElementById("hdUnitName").value;
        
    if (unitName == "DSR-150N" || unitName == "DSR-150") {
        if (endIpAddr - stIpAddr > 5){
            var errorstr = LANG_LOCALE['50071'];
            alert (errorstr);
            return false;
        }
    } else if (unitName == "DSR-250N" || unitName == "DSR-250"){
        if (endIpAddr - stIpAddr > 10){
            var errorstr = LANG_LOCALE['50049'];
            alert (errorstr);
            return false;
        }
    } else if (unitName == "DSR-500N" || unitName == "DSR-500" || unitName == "DSR-500AC"){
        if (endIpAddr - stIpAddr > 15){
            var errorstr = LANG_LOCALE['50072'];
            alert (errorstr);
            return false;
        }
    }else {
        if (endIpAddr - stIpAddr > 25){
            var errorstr = LANG_LOCALE['12976'];
            alert (errorstr);
            return false;
        }
    }
	  
	var timeOutObj = document.getElementById ('tf1_timeOut');
	if(timeOutObj && !timeOutObj.disabled){
		if (numericValueRangeCheck (timeOutObj, '', '', 300, 1800, true, LANG_LOCALE['11274']+': ', LANG_LOCALE['12732']) == false)
		return false;
	}
	}
	var ipv6LenObj = document.getElementById ('tf1_ipv6Length');
	if(ipv6LenObj && !ipv6LenObj.disabled){
		if(numericValueRangeCheck(ipv6LenObj, '', '',0, 128,true, '','') == false)
	     	    return false;
	}

	var selAuthTypeObj = document.getElementById ('tf1_authType');
	if (selAuthTypeObj && !selAuthTypeObj.disabled) {
	    if (selAuthTypeObj.value == "0" || selAuthTypeObj.value == "1" || selAuthTypeObj.value == "2") {
	        if (!atleastOneAuthSupport ('tf1_pap tf1_chap tf1_msChap tf1_msChapv2')) {
	            alert (LANG_LOCALE['30222']);
	            return false;      
	        }
	    } else {
		if (selAuthTypeObj.value == "3" || selAuthTypeObj.value == "4") {
	            if (!atleastOneAuthSupport ('tf1_msChap tf1_msChapv2')) {
	                alert (LANG_LOCALE['30222']);
	                return false;      
	            }
	    	}
	    }
	}

    setHiddenChks(frmId);     
	return true;
}

/** For cancel button action*/

function l2tpServerOnReset(frmId) {

	resetImgOnOff(frmId);
	onloadCall(l2tpServerOnload, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
    changeL2TPServerMode('tf1_l2tpServerMode');
    enableTextFieldByAnchorClick('tf1_authSecKey','tf1_authSecKeyValue', '');
	
}

