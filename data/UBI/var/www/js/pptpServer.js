/*
 * File: pptpServer.js
 * Created on 5th March 2014 - Ramakrishna Reddy
 * Copyright (c) 2014 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * This function calls at the time of page loads
 * OnLoad validation
 * @method pptServerOnload
 */
$(document).ready(function(){  
	onloadCall (enableDisableFieldsByImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});

	changePPTPServerMode('tf1_selPPTPServerMode');
});

 function  pptpServerOnreset(){

	enableTextFieldByAnchorClick('tf1_msChap','tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe','');
	enableTextFieldByAnchorClick('tf1_msChapv2','tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe','');
	enableTextFieldByAnchorClick('tf1_netbiosSetup','tf1_priWinsServer tf1_secWinsServer',''); 
	changePPTPServerMode('tf1_selPPTPServerMode'); 
 }

/**
 * Onload function
 * @method upnpOnload
 * @param toggleObj - object
 */

/****
 * This function calls when user selects an option from select box
 * OnChange event
 * @method changePPTPServerMode
 * @param selName - Select box Name
 */
function changePPTPServerMode(selId){
	var selValue = comboSelectedValueGet (selId);
    if (!selValue) return;
	var imgObj1 = document.getElementById('tf1_msChap').className;    
	var imgObj2 = document.getElementById('tf1_msChapv2').className;
	var imgEnbleId = '';
	   
	if(imgObj1 == ON_ANCHOR)
	    var imgEnbleId = imgObj1;
	else if(imgObj2 == ON_ANCHOR)
	    var imgEnbleId = imgObj2;
	
    switch (parseInt (selValue, 10)){
        case 1: /* Enable IPv4 */
        	fieldStateChangeWr ('tf1_ipv6Addr tf1_ipv6Length', 'tf1_rangeIpAddressIPv6Block_div', 'tf1_routingMode tf1_startIpAddr tf1_endIpAddr tf1_authType tf1_pap tf1_chap tf1_msChap tf1_msChapv2 tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe tf1_timeOut tf1_netbiosSetup tf1_priWinsServer tf1_secWinsServer', '');
		    	
		if(imgEnbleId != '') {
		    fieldStateChangeWr ('', '', 'tf1_encryption tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe', '');
	       	    vidualDisplay ('tf1_encryption tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe','configRow');
		    vidualDisplay('tf1_encryption','configRow');
    		}
		else {
    		    fieldStateChangeWr ('tf1_encryption tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe', '', '', '');
	       	    vidualDisplay ('tf1_encryption tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe','hide');
		    vidualDisplay('tf1_encryption','hide');
    		}
		enableTextFieldByAnchorClick('tf1_netbiosSetup','tf1_priWinsServer tf1_secWinsServer','');
        	vidualDisplay ('tf1_routingMode tf1_rangeIpAddressIPv4Block tf1_authTypeDBBlock tf1_authentication tf1_userTimeout tf1_netbiosSetup', 'configRow');
        	vidualDisplay ('break_pptpServerMode break_routingMode break_rangeIpAddressIPv4Block break_authTypeDBBlock break_authentication break_msChapv2 break_encryption break_userTimeout break_timeOut break_netbiosSetup', 'break');
        	vidualDisplay ('tf1_rangeIpAddressIPv6Block break_rangeIpAddressIPv6Block', 'hide');

       		break;
        case 2: /* Enable IPv6 */
        	fieldStateChangeWr ('', '', 'tf1_routingMode tf1_startIpAddr tf1_endIpAddr tf1_ipv6Addr tf1_ipv6Length tf1_authType tf1_pap tf1_chap tf1_msChap tf1_msChapv2 tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe tf1_timeOut tf1_netbiosSetup tf1_priWinsServer tf1_secWinsServer', '');

        	if(imgEnbleId != '') {
		    fieldStateChangeWr ('', '', 'tf1_encryption tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe', '');
	       	    vidualDisplay ('tf1_encryption tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe','configRow');
		    	vidualDisplay('tf1_encryption','configRow');
    		}
			else {
    		    fieldStateChangeWr ('tf1_encryption tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe', '', '', '');
	       	    vidualDisplay ('tf1_encryption tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe','hide');
		    	vidualDisplay('tf1_encryption','hide');
    		}
			enableTextFieldByAnchorClick('tf1_netbiosSetup','tf1_priWinsServer tf1_secWinsServer','');
        	vidualDisplay ('tf1_routingMode tf1_rangeIpAddressIPv4Block tf1_rangeIpAddressIPv6Block tf1_authTypeDBBlock tf1_authentication tf1_userTimeout tf1_netbiosSetup', 'configRow');
        	vidualDisplay ('break_pptpServerMode break_routingMode break_rangeIpAddressIPv4Block break_rangeIpAddressIPv6Block break_authTypeDBBlock break_authentication break_msChapv2 break_encryption break_userTimeout break_timeOut break_netbiosSetup', 'break');
        	break;
	    case 3: /* Disable */
        	fieldStateChangeWr ('tf1_routingMode tf1_startIpAddr tf1_endIpAddr tf1_ipv6Addr tf1_ipv6Length tf1_authType tf1_pap tf1_chap tf1_msChap tf1_msChapv2 tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe tf1_timeOut tf1_netbiosSetup tf1_priWinsServer tf1_secWinsServer', '', '');
        	vidualDisplay ('tf1_routingMode tf1_rangeIpAddressIPv4Block tf1_rangeIpAddressIPv6Block tf1_authTypeDBBlock tf1_authentication tf1_encryption tf1_userTimeout tf1_netbiosSetup', 'hide');
        	vidualDisplay ('break_pptpServerMode break_routingMode break_rangeIpAddressIPv4Block break_rangeIpAddressIPv6Block break_authTypeDBBlock break_authentication break_msChapv2 break_encryption break_userTimeout break_timeOut break_netbiosSetup', 'hide');
       		break;
	}
	changeAuthSupported ();        
	enableTextFieldByAnchorClick('tf1_netbiosSetup','tf1_priWinsServer tf1_secWinsServer',''); 
}

function changeAuthSupported () {
    var selAuthTypeObj = document.getElementById ('tf1_authType');
    if (selAuthTypeObj && !selAuthTypeObj.disabled) {
        if (selAuthTypeObj.value == "3" || selAuthTypeObj.value == "4") {
            // grey out PAP and CHAP protocols for AD and NT Domain Auth
            fieldStateChangeWr ('tf1_pap tf1_chap', '', 'tf1_msChap tf1_msChapv2', '');
	    vidualDisplay('tf1_authentication tf1_msChap tf1_msChapv2','configRow');
	    vidualDisplay('break_msChap break_msChapv2 break_encryption','break');
	    vidualDisplay('tf1_pap tf1_chap break_pap break_chap','hide');
		enableTextFieldByAnchorClick('tf1_msChap','tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe','');
		enableTextFieldByAnchorClick('tf1_msChapv2','tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe','');
		showEncryptSup ();
        }
        else if (selAuthTypeObj.value == "5" || selAuthTypeObj.value == "6") {
	        fieldStateChangeWr ('', 'tf1_authentication tf1_encryption', '', '');
	    	vidualDisplay('tf1_authentication tf1_encryption break_encryption break_authentication','hide');
	    }
	    else {
            fieldStateChangeWr ('', '', 'tf1_pap tf1_chap tf1_msChap tf1_msChapv2', 'tf1_authentication');
	    	vidualDisplay('tf1_authentication tf1_pap tf1_chap tf1_msChap tf1_msChapv2','configRow');
	    	vidualDisplay('break_authentication break_pap break_chap break_msChap break_msChapv2','break');
			enableTextFieldByAnchorClick('tf1_msChap','tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe','');
			enableTextFieldByAnchorClick('tf1_msChapv2','tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe','');
			showEncryptSup ();
	    }
    }
}

function enableDisableFieldsByImageClick(data, thisObj){
    onAnchorToggle(data);
    var imgId=thisObj.id;
    
    switch(imgId){
    	case 'tf1_msChap':    		
    	case 'tf1_msChapv2':
    		var imgObj1 = document.getElementById('tf1_msChap').className;    
		var imgObj2 = document.getElementById('tf1_msChapv2').className;
		var imgEnbleId = '';
		   
		if(imgObj1 == ON_ANCHOR)
		    var imgEnbleId = imgObj1;
		else if(imgObj2 == ON_ANCHOR)
		    var imgEnbleId = imgObj2;
		    	
		if(imgEnbleId != '') {
		    fieldStateChangeWr ('', '', 'tf1_encryption tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe', '');
	       	    vidualDisplay ('tf1_encryption tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe','configRow');
		    vidualDisplay('tf1_encryption','configRow');
		   vidualDisplay('break_encryption','break');
    		}
		else {
    		    fieldStateChangeWr ('tf1_encryption tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe', '', '', '');
	       	    vidualDisplay ('tf1_encryption tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe','hide');
		    vidualDisplay('tf1_encryption break_encryption','hide');
    		}
    	break;	
    	case 'tf1_netbiosSetup':
    		enableTextFieldByAnchorClick(imgId,'tf1_priWinsServer tf1_secWinsServer','break_secWinsServer');
    	break;		
	}
}
function showEncryptSup () {
    var statusStrChap   = $('#tf1_msChap').attr('class');
    var statusStrChapv2 = $('#tf1_msChapv2').attr('class');
    if ((statusStrChap && statusStrChap == 'enable-disable-on') || (statusStrChapv2 && statusStrChapv2 == 'enable-disable-on')) {
	       fieldStateChangeWr ('', '', 'tf1_encryption tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe', '');
	       vidualDisplay ('tf1_encryption tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe','configRow');
		   vidualDisplay('tf1_encryption','configRow');
		   vidualDisplay('break_encryption','break');
        }
        else {
		   fieldStateChangeWr ('tf1_encryption tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe', '', '', '');
	       vidualDisplay ('tf1_encryption tf1_mppe40Bit tf1_mppe128Bit tf1_statefulMppe','hide');
		   vidualDisplay('tf1_encryption break_encryption','hide');
        }
    }
/**
 * This function calls when user clicks on submit button
 * On submit validation
 * @method pptpServerValidate
 */
function pptpServerValidate(frmId){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_startIpAddr, "+LANG_LOCALE['12127'];
    txtFieldIdArr[1] = "tf1_endIpAddr, "+LANG_LOCALE['12007'];
    txtFieldIdArr[2] = "tf1_priWinsServer, "+LANG_LOCALE['12094'];
    txtFieldIdArr[3] = "tf1_secWinsServer, "+LANG_LOCALE['30621'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv4Validate('tf1_startIpAddr', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if (ipv4Validate('tf1_endIpAddr', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;

    if (ipv6Validate('tf1_ipv6Addr', false, true, '') == false) 
        return false;
    
    var startObj = document.getElementById ('tf1_startIpAddr');	
    var endObj = document.getElementById ('tf1_endIpAddr');
	if (startObj && !startObj.disabled && endObj && !endObj.disabled) {
        
        var alreadyCofigMsg = LANG_LOCALE['30461'] + " ";
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
            	                var errorstr = LANG_LOCALE['12956'];
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
            	                var errorstr = LANG_LOCALE['19'];
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
	 		alert (errorstr);
		   	return false;
		}
		if (endIpAddr - stIpAddr < 0){
			var errorstr = LANG_LOCALE['10935'];
		   		alert (errorstr);
		   	return false;
		}
		else if(endIpAddr - stIpAddr == 0){
	        var errorstr = LANG_LOCALE['13485'];
		   		alert (errorstr);
		   		ipAddrObj.focus ();
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
	}    
    var myObj = document.getElementById('tf1_timeOut');
    if(myObj.value != '' && !myObj.disabled){
    if (numericValueRangeCheck(myObj, '', '', 300, 1800, true, LANG_LOCALE['11274']+': ', LANG_LOCALE['12732']) == false) 
        return false;
    }
    
    if (ipv4Validate('tf1_priWinsServer', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if (ipv4Validate('tf1_secWinsServer', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;

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

    if ( $("#tf1_msChap").hasClass('enable-disable-on') && $("#tf1_msChapv2").hasClass('enable-disable-on') && $("#tf1_mppe40Bit").hasClass('enable-disable-on') && $("#tf1_mppe128Bit").hasClass('enable-disable-off') && $("#tf1_statefulMppe").hasClass('enable-disable-off') ) { //You can also use $(this).hasClass
		alert("MS-CHAP authentication requires either of MPPE 128-bit or Stateful MPPE to be enabled");
		return false;
	}

    setHiddenChks(frmId);        
    return true;
}
