/*
 * File: lanSettings.js
 * Created on 5th Nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * On submit validation
 * @method validateLansettings
 * This function calls when user clicks on submit button
 */
function validateLansettings(frmId){
    var txtValidArray = new Array();
    txtValidArray[0] = "tf1_ipAddr, "+LANG_LOCALE['12028'];
    txtValidArray[1] = "tf1_subnetmask, "+LANG_LOCALE['12133'];
    txtValidArray[2] = "tf1_dhcpStartIp, "+LANG_LOCALE['12392'];
    txtValidArray[3] = "tf1_dhcpEndIp, "+LANG_LOCALE['12269'];
   // txtValidArray[4] = "tf1_defaultGateway, Please enter a valid Defalut Gateway";
    txtValidArray[4] = "tf1_dhcpLeaseTime, "+LANG_LOCALE['12041'];
    txtValidArray[5] = "tf1_dhcpRelayGw, "+LANG_LOCALE['12097'];
    
    txtValidArray[6] = "tf1_lanDefaultRouteGateway, "+LANG_LOCALE['12016'];
    txtValidArray[7] = "tf1_lanDefaultRouteDnsServer, "+LANG_LOCALE['11995']; 
    
    
    if (txtFieldArrayCheck(txtValidArray) == false) 
        return false;

    if (isProblemCharArrayCheck(txtValidArray, "'\" ", NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv4Validate('tf1_ipAddr', 'NSN', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if (validNetMask('tf1_subnetmask') == false) 
        return false;
    
    if (ipv4Validate('tf1_dhcpStartIp', 'NSN', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if (ipv4Validate('tf1_dhcpEndIp', 'NSN', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if(checkIPAddrRange()==false)
        return false;
    
    var gatewayAddr = document.getElementById('tf1_defaultGateway');
    if(gatewayAddr.value != ''){
    if (ipv4Validate('tf1_defaultGateway', 'NSN', false, true, LANG_LOCALE['11244'], LANG_LOCALE['11031'], true) == false) 
      return false;
    }
    
    var domainNameObj = document.getElementById("tf1_dhcpDomainName");
    if (domainNameObj && !domainNameObj.disabled && domainNameObj.value != "") {
        if (alphaNumericValueCheck('tf1_dhcpDomainName', '-.', LANG_LOCALE['11251']+" ") == false)	
    	    return false;

        var domainName = domainNameObj.value;
        // If domain name is starting with . or - then we should throw error message. 
        if (domainName.charAt(0) == '.' || domainName.charAt(0) == '-') {
            alert('Domain name should not starts with dot (.) and hyphen (-)');
            domainNameObj.focus();
            return false;
        }
    }

    var leaseTimeObj = document.getElementById('tf1_dhcpLeaseTime');     
    if (leaseTimeObj && !leaseTimeObj.disabled) {
        if (numericValueRangeCheck(leaseTimeObj, '', '', 1, 262800, true, LANG_LOCALE['13489']+': ', LANG_LOCALE['11126']) == false) 
            return false;
    }
    
    if (ipv4Validate('tf1_priDnsServer', 'IP', true, true, LANG_LOCALE['11324']+'.', LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if (ipv4Validate('tf1_secDnsServer', 'IP', true, true, LANG_LOCALE['11346']+'.', LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if (ipv4Validate('tf1_dhcpWinsSer', 'IP', true, true, LANG_LOCALE['11379']+'.', LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if (ipv4Validate('tf1_dhcpRelayGw', 'IP', false, true, LANG_LOCALE['11266']+'.', LANG_LOCALE['11031'], true) == false) 
        return false;        
        
    if (ipv4Validate('tf1_lanDefaultRouteGateway', 'IP', false, true, LANG_LOCALE['11265']+'.', LANG_LOCALE['11031'], true) == false) 
        return false;
    
	if (ipv4Validate('tf1_lanDefaultRouteDnsServer', 'IP', false, true, LANG_LOCALE['11265']+'.', LANG_LOCALE['11031'], true) == false) 
        return false;
        
    if (hostIpValidate () == false)
    	return false;

    var lanIp = document.getElementById('tf1_ipAddr').value;
    var netmask = document.getElementById('tf1_subnetmask').value;
    var sslVpnStAddrObj = document.getElementById('hdSslVpnStAddr');
    var sslVpnEndAddrObj = document.getElementById('hdSslVpnEndAddr');
    if (sslVpnStAddrObj && sslVpnEndAddrObj) 
        {
        var sslVpnStAddr = sslVpnStAddrObj.value; 
        var sslVpnEndAddr = sslVpnEndAddrObj.value;
        if(sslVpnStAddr != "" && sslVpnEndAddr != "")
	    {
	        if(isInSubnetStr(sslVpnStAddr,lanIp,netmask) || isInSubnetStr(sslVpnEndAddr,lanIp,netmask))
		    {
            	        var errorstr = LANG_LOCALE['12956'];
            	        alert (errorstr);
		        return false;
		    }
	    }
        }
    setHiddenChks(frmId);
    return true;
    
}

function validateDNSMappingHosting(host){
	var hostVal = document.getElementById(host).value;    
	
	if(!hostVal) return;
    if (validateHostName(dnsMapHost1, '') == false) 
        return false;	    
}

/**
* This function calls to check ip address range
* @method checkIPAddrRange
*/
function checkIPAddrRange () 
    {
    /* declare or define your variables here */
    var errorStr;
    var lanIp = getIPInt1('tf1_ipAddr');
    var lanIpMask = getIPInt1('tf1_subnetmask');
    var ipv4AddrAttributes = false;
    var isDhcpEnabled = parseInt (comboSelectedValueGet ('tf1_dhcpModel'), 10);
    
    /* check if the configured addresses fall under same subnet or not */
    var ipv4AddrAttributes = getIPv4RangeAttr (lanIp, lanIpMask);

    /* 0.0.0.0 network is not a valid network */
    tempVar = ipv4AddrAttributes[0].split(".");
    if (tempVar[0] == '0')
        {
        alert (LANG_LOCALE['30626']);
        return false;
        }
    
    /* IP address should not be network address */
    if (lanIp == ipv4AsciitoNum(ipv4AddrAttributes[0])) 
        {
        errorstr = LANG_LOCALE['30627'];
        alert (errorstr);
        return false;
        }

    /* IP address should not be broadcast address */
    if (lanIp == ipv4AsciitoNum(ipv4AddrAttributes[1])) 
        {
        errorstr = LANG_LOCALE['30628'];
        alert (errorstr);
        return false;
        }

    /* if only the DHCP is enabled */
    if (isDhcpEnabled == 1) 
        {
        var dhcpStart = getIPInt1 ('tf1_dhcpStartIp');
        var dhcpEnd = getIPInt1 ('tf1_dhcpEndIp');
        var lanIpStr = getIPStr1('tf1_ipAddr');
        var lanIpMaskStr = getIPStr1('tf1_subnetmask');
        var lanSubnetStr = lanIpStr + "/" + lanIpMaskStr;
        var gatewayAddr = document.getElementById('tf1_defaultGateway');
        var unitName = document.getElementById('hdUnitName').value;        
        var tempVar = false;
        var allowedAddrRange = 1024;

        /* end IP should be greater or equal to start IP */
        if (dhcpStart > dhcpEnd) 
            {
            errorstr = LANG_LOCALE['30629'];
            alert (errorstr);
            return false;
            }

        /* start IP should fall under specified range */
        if ((dhcpStart < ipv4AsciitoNum(ipv4AddrAttributes[2])) || 
            (dhcpStart > ipv4AsciitoNum(ipv4AddrAttributes[3])))
            {
            errorstr = LANG_LOCALE['30630']+": " + lanSubnetStr;
            alert (errorstr);
            return false;
            }

        /* end IP should fall under specified range */
        if ((dhcpEnd < ipv4AsciitoNum(ipv4AddrAttributes[2])) || 
            (dhcpEnd > ipv4AsciitoNum(ipv4AddrAttributes[3])))
            {
            errorstr = LANG_LOCALE['30631']+": " + lanSubnetStr;
            alert (errorstr);
            return false;
            }

        /* we allow only Different ranges for IP addresses for Different DSR
         * devices */
        if (unitName == "DSR-500AC" || unitName == "DSR-500N" || unitName == "DSR-500") {
            allowedAddrRange = 512;
            }
        else 
            if (unitName == "DSR-250N" || unitName == "DSR-250") {
            allowedAddrRange = 256;
            }
        else 
            if (unitName == "DSR-150N" || unitName == "DSR-150") {
            allowedAddrRange = 128;
        }

        /* We specify DHCP range for different DUT's */
        if ((dhcpEnd - dhcpStart) > (allowedAddrRange - 1))
            {
            errorstr = LANG_LOCALE['30632'] + " " + allowedAddrRange + " " + LANG_LOCALE['30633'];
            alert (errorstr);
            return false;
            }

        /* end IP should fall under specified range */
        if(gatewayAddr.value != '')
            {
            gatewayAddr = getIPInt1 ('tf1_defaultGateway');
            if ((gatewayAddr < ipv4AsciitoNum(ipv4AddrAttributes[2])) || 
                (gatewayAddr > ipv4AsciitoNum(ipv4AddrAttributes[3])))
               {
               errorstr = LANG_LOCALE['30634']+": " + lanSubnetStr;
               alert (errorstr);
               return false;
               }
            }

        /*
           Adding check for dhcp reserved ip
           */
        var reservedIpMsg = LANG_LOCALE['30097'];
        if (isIpInRange ('tf1_dhcpStartIp', 'tf1_dhcpEndIp', 'hdNumFixedIpAddr', 'hdResIPAddr', reservedIpMsg) == false) return false;
        }
    return true;
    }

/**
 * Select box onchange event
 * @method dhcpCheck
 * This function calls when user selects drop down item from "DHCP Mode" select box
 */
function dhcpCheck(){
    var isDhcpEnabled = parseInt(comboSelectedValueGet('tf1_dhcpModel'), 10);
    if (isDhcpEnabled == 1) {//DHCP Server
        fieldStateChangeWr('tf1_dhcpRelayGw', '', 'tf1_dhcpLeaseTime tf1_dhcpStartIp tf1_dhcpEndIp tf1_defaultGateway tf1_priDnsServer tf1_secDnsServer tf1_dhcpWinsSer', '');
        vidualDisplay('tf1_dhcpRelayGw', 'hide');
        vidualDisplay('tf1_dhcpLeaseTime tf1_dhcpStartIp tf1_dhcpEndIp tf1_priDnsServer tf1_secDnsServer tf1_dhcpWinsSer tf1_configuredns tf1_defaultGateway', 'configRow');
        vidualDisplay('break3 break4 break5 break7 break8 break9 break10 break11 break12', 'break');
        
        enableTextFieldByAnchorClick('tf1_configuredns','tf1_priDnsServer tf1_secDnsServer tf1_dhcpWinsSer','break9 break10 break11');  
    }
    else 
        if (isDhcpEnabled == 3) {//DHCP Relay
            fieldStateChangeWr('tf1_dhcpLeaseTime tf1_dhcpStartIp tf1_dhcpEndIp tf1_priDnsServer tf1_secDnsServer tf1_dhcpWinsSer tf1_defaultGateway', '', 'tf1_dhcpRelayGw', '');
            vidualDisplay('tf1_dhcpLeaseTime tf1_dhcpStartIp tf1_dhcpEndIp tf1_priDnsServer tf1_secDnsServer tf1_dhcpWinsSer tf1_configuredns tf1_defaultGateway', 'hide');
            vidualDisplay(' break3 break4 break5 break7 break8 break9 break10 break11 break12', 'hide');
            vidualDisplay('tf1_dhcpRelayGw', 'configRow');
            vidualDisplay('break12', 'break');
            
        }
        else {
            fieldStateChangeWr('tf1_dhcpLeaseTime tf1_dhcpStartIp tf1_dhcpEndIp tf1_priDnsServer tf1_secDnsServer tf1_dhcpWinsSer tf1_dhcpRelayGw tf1_defaultGateway', '', '', '');
            vidualDisplay('tf1_dhcpLeaseTime tf1_dhcpStartIp tf1_dhcpEndIp tf1_priDnsServer tf1_secDnsServer tf1_dhcpWinsSer tf1_dhcpRelayGw tf1_configuredns tf1_defaultGateway', 'hide');
            vidualDisplay('break3 break4 break5 break7 break8 break9 break10 break11 break12', 'hide');
        }
}

/**
 This function is called always when image is clicked
 **/
function onConfigureDnsChange(data, thisObj){
    /*if (!thisObj || thisObj.id == "tf1_configuredns") {
        onAnchorToggle(data);
    }*/
    onAnchorToggle (data);
    var imgId=thisObj.id;
    
    switch(imgId){
    	case 'tf1_configuredns':
    		enableTextFieldByAnchorClick(imgId,'tf1_priDnsServer tf1_secDnsServer tf1_dhcpWinsSer','break9 break10 break11');    		
    	break;
    	case 'tf1_enableDefaultRoute':
    		enableTextFieldByAnchorClick('tf1_enableDefaultRoute','tf1_lanDefaultRouteGateway tf1_lanDefaultRouteDnsServer','break_lanDefaultRouteGateway break_lanDefaultRouteDnsServer');    		
    	break;  
    } 	

}

/**
 Set jQuery function call
 **/
jQuery(function(){
	onloadCall(onConfigureDnsChange, {imageId: '', disableIndividual: '', disableGrp: '', enableIndividual: '', enableGrp: '', hideClass: 'hide', showClass: 'configRow',  breakDivs: '', breakClass: 'break', imagesInfo: {disableImages: '', enableImages: '', disableClass: '', enableClass: ''}});
    enableTextFieldByAnchorClick('tf1_enableDefaultRoute','tf1_lanDefaultRouteGateway tf1_lanDefaultRouteDnsServer','break_lanDefaultRouteGateway break_lanDefaultRouteDnsServer');
    dhcpCheck();

});

function validateLanOnReset(frmId) {
	resetImgOnOff(frmId);
	enableTextFieldByAnchorClick('tf1_enableDefaultRoute','tf1_lanDefaultRouteGateway tf1_lanDefaultRouteDnsServer','break_lanDefaultRouteGateway break_lanDefaultRouteDnsServer');
	dhcpCheck();
}

/* 
 * funcName    : dhcpLANRangeAutoFill.
 * In Arg      : IP/subnet check.
 * out Arg     : auto fills.
 * Description : Auto fills the start and end address.
 */ 
function dhcpLANRangeAutoFill ()
    {
    /* declare or define your variables here */
    var ipObj = document.getElementById ('tf1_ipAddr');
    var maskObj = document.getElementById ('tf1_subnetmask');     
    var startIPObj = document.getElementById ('tf1_dhcpStartIp');
    var endIPObj = document.getElementById ('tf1_dhcpEndIp');    
    var unitName = document.getElementById('hdUnitName').value;        
    var allowedAddrRange = 1024;
    var tempVar = false;
    var ipv4AddrAttributes;

    /* sanity check is needed */
    if (!ipObj || ipObj.disabled || ipObj.value == '' || !maskObj || maskObj.disabled || maskObj.value == '') 
        return false;

    /* set the default gateway to this IP address*/
    document.getElementById ("tf1_defaultGateway").value = ipObj.value;

    if (ipv4Validate ('tf1_ipAddr', 'NSN', false, false, '', '', true) == false)
        {
        ipObj.focus();
        return false;
        }

    /* validate the subnet */
    if (validNetMask ('tf1_subnetmask') == false)
        {
        maskObj.focus();
        return false;
        }

    /* Now get the IPv4 attributes for this IP/subnet */
    ipv4AddrAttributes = getIPv4RangeAttr (getIPInt1('tf1_ipAddr'), getIPInt1 ('tf1_subnetmask'));

    /* 0.0.0.0 network is not a valid network */
	tempVar = ipv4AddrAttributes[0].split(".");
    if (tempVar[0] == '0')
        {
        alert (LANG_LOCALE['30626']);
        return false;
        }

    /* set the start and end IP address */
    startIPObj.value = ipv4AddrAttributes[2];

    /* we allow only Different ranges for IP addresses for Different DSR
         * devices */
        if (unitName == "DSR-500AC" || unitName == "DSR-500N" || unitName == "DSR-500") {
            allowedAddrRange = 512;
            }
        else 
            if (unitName == "DSR-250N" || unitName == "DSR-250") {
            allowedAddrRange = 256;
            }
        else 
            if (unitName == "DSR-150N" || unitName == "DSR-150") {
            allowedAddrRange = 128;
        }

    /* if only we exceed the range */
    if ((ipv4AsciitoNum(ipv4AddrAttributes[3]) - ipv4AsciitoNum(ipv4AddrAttributes[2])) > allowedAddrRange)
        /* network address + allowed range */
        endIPObj.value = ipv4NumtoAscii(ipv4AsciitoNum(ipv4AddrAttributes[0]) + allowedAddrRange);
    else
        endIPObj.value = ipv4AddrAttributes[3];
    }

/*
  This function tells, the start IP Address and end IP Address fill automatically when based on IP address
  and Subnet Mask of last octet given by user.
 */

function dhcpAutoFill ()
    {
        var ipObj = document.getElementById ('tf1_ipAddr');
        var maskObj = document.getElementById ('tf1_subnetmask');

		var objArr = ipObj.value.split(".");
		var loopIP = objArr[0]+"."+objArr[1]+"."+objArr[2];
		var flag;
		if (objArr[0] == '0' || objArr[3] == '0')
			{
				flag = "1";
			}
		/* Before autofilling check whether the IP address is loop back IP or not */
		if (loopIP == "127.0.0" || flag == "1") {}
		else
		{
			var count = 0;
			var s1, s2, s3, s4, s5, s6;

			var startIPObj = document.getElementById ('tf1_dhcpStartIp');
			var endIPObj = document.getElementById ('tf1_dhcpEndIp');

			document.getElementById ("tf1_defaultGateway").value = ipObj.value;
			if (!ipObj || ipObj.disabled || ipObj.value == '' || !maskObj || maskObj.disabled || maskObj.value == '') return false;

			var ipObjArr = ipObj.value.split ('.');
			if (ipObjArr.length != 4) return false;

			var maskObjArr = maskObj.value.split ('.');
			if (maskObjArr.length != 4) return false;

			s1 = ipObjArr[0]; s2 = ipObjArr[1]; s3 = ipObjArr[2]; s4 = ipObjArr[3];
			for (var i = 0; i<ipObjArr.length; i++)
				{
					var octet = ipObjArr[i];
					if (octet == "" || isNaN (octet))
						return false;
				}

			for (var i = 0; i<maskObjArr.length; i++)
				{
					var octet = maskObjArr[i];
					if (octet == 255)
						count++;
					if (octet == "" || isNaN (octet))
						return false;
				}

			if (maskObj.value == '255.0.0.0' || maskObj.value == '255.255.0.0' || maskObj.value == '255.255.255.0')
				{
					if (parseInt(ipObjArr[3],10) == 254)
						{
							s4 = 1;
							s5 = 253;
						}
					else
						{
							s4 = parseInt(ipObjArr[3], 10)+1;
							s5 = 254;
						}

						startIPObj.value = s1+'.'+s2+'.'+s3+'.'+s4;
						endIPObj.value = s1+'.'+s2+'.'+s3+'.'+s5;
				}
				else
				{
						if (count == 3 && (maskObjArr[3] == 128 || maskObjArr[3] == 192 || maskObjArr[3] == 224 || maskObjArr[3] == 240 || maskObjArr[3] == 248 || maskObjArr[3] == 252))
						{
								s6 = (ipObjArr[3] & 0xFF) | (~maskObjArr[3] & 0xFF);

								if (parseInt(ipObjArr[3],10) == 254)
								{
										s4 = (ipObjArr[3] & 0xFF) & (maskObjArr[3] & 0xFF);
										s6 = s6-1;
								}

								startIPObj.value = s1+'.'+s2+'.'+s3+'.'+(parseInt(s4, 10)+1);
								endIPObj.value = s1+'.'+s2+'.'+s3+'.'+(s6-1);

								if (ipObj.value == endIPObj.value)
								{
										s4 = (ipObjArr[3] & 0xFF) & (maskObjArr[3] & 0xFF);

										startIPObj.value = s1+'.'+s2+'.'+s3+'.'+(s4+1);
										endIPObj.value = s1+'.'+s2+'.'+s3+'.'+(s6-2);
								}

								if (s4 > (s6-1))
								{
										s4 = (ipObjArr[3] & 0xFF) & (maskObjArr[3] & 0xFF);

										startIPObj.value = s1+'.'+s2+'.'+s3+'.'+(s4+1);
								}
						}
				}
		}
                
    }

/* Dns Host Name mapping validations of lanSettings page*/
function hostIpValidate ()
    {
    
        for (i=1; i<=8; i++)
		{
		var hostNameId = "tf1_lanDnsHostMappingHost" + i;
		var ipAddrid = "tf1_lanDnsHostMappingIp" + i;
		var hostNameObj = document.getElementById(hostNameId);
		var ipAddrObj = document.getElementById(ipAddrid);
		if (hostNameObj.value != "")
			{
			if (ipAddrObj.value == "")
				{
				errStr = LANG_LOCALE['30098'];
	     		alert(errStr);
	     		ipAddrObj.focus ();
	     		return false;
				}
			else
				{
				if (ipv4Validate (ipAddrid, 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
    				return false;
				}
			}
		else
			{
			if (ipAddrObj.value != "")
				{
				errStr = LANG_LOCALE['30099'];
     			alert(errStr);
     			hostNameObj.focus ();
     			return false;
				}
			}
		}
  return true;
}
