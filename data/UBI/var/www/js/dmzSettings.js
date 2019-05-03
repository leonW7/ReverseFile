/*
 * File: dmzSetup.js
 * Created on 22nd Oct 2012 - Bala Krishna G
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
var IP_ADDRESS = LANG_LOCALE['11281'];
var FOR_OCTET = LANG_LOCALE['11031'];
var MESSAGE_1 = LANG_LOCALE['13496'];
var INVALID_TIME = LANG_LOCALE['13489'];
var HOURS = LANG_LOCALE['11126'];

/****
 * validate the form
 * @method dmzSetupValidate
 */
function dmzSetupValidate(frmId){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_ipv4_addr, "+LANG_LOCALE['12028'];
    txtFieldIdArr[1] = "tf1_snet, "+LANG_LOCALE['12133'];
    txtFieldIdArr[2] = "tf1_ipv4_start, "+LANG_LOCALE['12392'];
    txtFieldIdArr[3] = "tf1_ipv4_end, "+LANG_LOCALE['12269'];
    txtFieldIdArr[4] = "tf1_lease_time,"+LANG_LOCALE['12041'];
    txtFieldIdArr[5] = "tf1_gateway,"+LANG_LOCALE['11966'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

	  if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;  
    
    if (ipv4Validate('tf1_ipv4_addr', 'NSN', false, true, IP_ADDRESS+'.', FOR_OCTET, true) == false) 
        return false;
    
    if (validNetMask('tf1_snet') == false) 
        return false;
    
    if (ipv4Validate('tf1_ipv4_start', 'NSN', false, true, IP_ADDRESS+'.', FOR_OCTET, true) == false) 
        return false;
    
    if (ipv4Validate('tf1_ipv4_end', 'NSN', false, true, IP_ADDRESS+'.', FOR_OCTET, true) == false) 
        return false;
    
    if(checkIPAddrRange('tf1_ipv4_start','tf1_ipv4_end')==false)
        return false;
    
    var objAddr = document.getElementById('tf1_ipv4_gateway');
    if(objAddr.value != ''){
    if (ipv4Validate('tf1_ipv4_gateway', 'NSN', true, true, IP_ADDRESS+'.', FOR_OCTET, true) == false) 
        return false;
    }

    var domainNameObj = document.getElementById("tf1_domain");
    if (domainNameObj && !domainNameObj.disabled && domainNameObj.value != "") {
        if (alphaNumericValueCheck('tf1_domain', '-.', LANG_LOCALE['11251']+" ") == false)	
    	    return false;

        var domainName = domainNameObj.value;
        // If domain name is starting with . or - then we should throw error message. 
        if (domainName.charAt(0) == '.' || domainName.charAt(0) == '-') {
            alert('Domain name should not starts with dot (.) and hyphen (-)');
            domainNameObj.focus();
            return false;
        }
    }
    
    var objAddr = document.getElementById('tf1_ipv4_primary');
    if(objAddr.value != ''){
    if (ipv4Validate('tf1_ipv4_primary', 'IP', false, true, LANG_LOCALE['11324']+'.', FOR_OCTET, true) == false) 
        return false;
    }

    var objAddr = document.getElementById('tf1_ipv4_secondary');
    if(objAddr.value != ''){
    if (ipv4Validate('tf1_ipv4_secondary', 'IP', false, true, LANG_LOCALE['11346']+'.', FOR_OCTET, true) == false) 
        return false;
    }

    var objAddr = document.getElementById('tf1_wins_server');
    if(objAddr.value != ''){    
    if (ipv4Validate('tf1_wins_server', 'IP', false, true, LANG_LOCALE['11379']+'.', FOR_OCTET, true) == false) 
        return false;
    }

    if (ipv4Validate('tf1_gateway', 'IP', false, true, IP_ADDRESS+'.', FOR_OCTET, true) == false) 
        return false;
    
    var leaseTimeObj = document.getElementById('tf1_lease_time');
    if (leaseTimeObj && !leaseTimeObj.disabled) {
        if (numericValueRangeCheck(leaseTimeObj, '', '', 1, 262800, true, INVALID_TIME+'.', HOURS) == false) 
            return false;
    }

    if (checkIPAddrRange () == false) {
        return false;
    }

    var lanIp = document.getElementById('tf1_ipv4_addr').value;
    var netmask = document.getElementById('tf1_snet').value;
    var sslVpnStAddr = document.getElementById('hdSslVpnStAddr').value;
    var sslVpnEndAddr = document.getElementById('hdSslVpnEndAddr').value;
    if(sslVpnStAddr != "" && sslVpnEndAddr != "")
	{
	    if(isInSubnetStr(sslVpnStAddr,lanIp,netmask) || isInSubnetStr(sslVpnEndAddr,lanIp,netmask))
		{
            	    var errorstr = LANG_LOCALE['12956'];
            	    alert (errorstr);
		    return false;
		}
	}
    setHiddenChks(frmId);    
    return true;
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
			alert ("Ending IP Address should be higher than Starting IP Address");
			document.getElementById(startIP).focus ();
			return false;
		}
	}else{
		return true;
	}
}

function changeDhcpMode(radioId){
    var selValue = radioCheckedValueGet(radioId);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* None */
            fieldStateChangeWr('tf1_lease_time tf1_ipv4_start tf1_ipv4_end tf1_wins_server tf1_domain tf1_ipv4_secondary tf1_ipv4_gateway tf1_ipv4_primary tf1_gateway', '', '', '')
            vidualDisplay('tf1_lease_time tf1_ipv4_start tf1_ipv4_end tf1_wins_server tf1_domain tf1_ipv4_secondary tf1_ipv4_gateway tf1_ipv4_primary tf1_gateway break4 break5 break6 break8 break10 break11 break12', 'hide');
            vidualDisplay('break7', 'break');            
            break;
            
        case 2: /* Dhcp Server */
            fieldStateChangeWr('tf1_gateway', '', 'tf1_ipv4_start tf1_ipv4_end tf1_domain tf1_ipv4_gateway tf1_lease_time tf1_ipv4_primary tf1_ipv4_secondary tf1_wins_server')
            vidualDisplay('tf1_gateway', 'hide');
            vidualDisplay('tf1_lease_time tf1_ipv4_start tf1_ipv4_end tf1_wins_server tf1_domain tf1_ipv4_secondary tf1_ipv4_gateway tf1_ipv4_primary break4 break5 break6 break8 break10 break11', 'break');
            vidualDisplay('tf1_ipv4_start tf1_ipv4_end tf1_domain tf1_ipv4_gateway tf1_lease_time tf1_ipv4_primary tf1_ipv4_secondary tf1_wins_server', 'configRow');
            /*
            enableTextFieldByAnchorClick('tf1_dns_wins','tf1_ipv4_primary tf1_ipv4_secondary tf1_wins_server','break9 break10 break11');
*/
            break;
            
        case 3: /* Dhcp Relay */
            fieldStateChangeWr('tf1_lease_time tf1_ipv4_start tf1_ipv4_end tf1_wins_server tf1_domain tf1_ipv4_secondary tf1_ipv4_gateway tf1_ipv4_primary tf1_gateway tf1_ipv4_primary', '', 'tf1_gateway');
            vidualDisplay('tf1_lease_time tf1_ipv4_start tf1_ipv4_end tf1_wins_server tf1_domain tf1_ipv4_secondary tf1_ipv4_gateway tf1_ipv4_primary tf1_gateway tf1_ipv4_primary break4 break5 break6 break6 break8 break10 break11', 'hide');
            vidualDisplay('break12', 'break');
            vidualDisplay('tf1_gateway', 'configRow');
            break;
    }
}



/**
* displays corresponding fields on ImageToggle
* @method enableDisableFieldsByImageClick
* @param data - image data
* @param thisObj - currtent image id
*/
function enableDisableFieldsByImageClick(data, thisObj) { 
    onAnchorToggle (data);
    var imgId=thisObj.id;

    switch(imgId){
	/*
    	case 'tf1_dns_wins':
    		enableTextFieldByAnchorClick('tf1_dns_wins','tf1_ipv4_primary tf1_ipv4_secondary tf1_wins_server','break9 break10 break11');    		
    	break;
	*/
	case 'tf1_enableDmz':
    		enableTextFieldByAnchorClick('tf1_enableDmz','tf1_ipv4_addr tf1_snet tf1_radNtp1 tf1_radNtp2 tf1_radNtp3 tf1_ipv4_start tf1_ipv4_end tf1_ipv4_gateway tf1_domain tf1_lease_time tf1_hid_dns_wins tf1_ipv4_primary tf1_ipv4_secondary tf1_wins_server tf1_gateway','break9 break1 break2 break3 break4 break5 break6 break7 break8  break10 break11 break12 break13','tf1_dmzBlock');
	changeDhcpMode('tf1_radNtp1'); 
	/*enableTextFieldByAnchorClick('tf1_dns_wins','tf1_ipv4_primary tf1_ipv4_secondary tf1_wins_server','break10 break11');*/		
    	break; 
    }
}

function dmzSettingsOnRest(frmId){
   	resetImgOnOff(frmId);
    enableTextFieldByAnchorClick('tf1_enableDmz','tf1_ipv4_addr tf1_snet tf1_radNtp1 tf1_radNtp2 tf1_radNtp3 tf1_ipv4_start tf1_ipv4_end tf1_ipv4_gateway tf1_domain tf1_lease_time tf1_hid_dns_wins tf1_ipv4_primary tf1_ipv4_secondary tf1_wins_server tf1_gateway','break9 break1 break2 break3 break4 break5 break6 break7 break8  break10 break11 break12 break13','tf1_dmzBlock');
	changeDhcpMode('tf1_radNtp1');
}



/**
* This function calls to check ip address range
* @method checkIPAddrRange
*/
function checkIPAddrRange () 
    {
    /* declare or define your variables here */
    var errorStr;
    var lanIp = getIPInt1('tf1_ipv4_addr');
    var lanIpMask = getIPInt1('tf1_snet');
    var ipv4AddrAttributes = false;
    var isDhcpEnabled = parseInt (radioCheckedValueGet ('tf1_radNtp1'), 10);

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

    /* if only DHCP server is enabled */
    if (isDhcpEnabled == 2) 
        {
        var dhcpStart = getIPInt1 ('tf1_ipv4_start');
        var dhcpEnd = getIPInt1 ('tf1_ipv4_end');
        var dmzIpStr = getIPStr1('tf1_ipv4_addr');
        var dmzIpMaskStr = getIPStr1('tf1_snet');
        var dmzSubnetStr = dmzIpStr + "/" + dmzIpMaskStr;
        var gatewayAddr = document.getElementById('tf1_ipv4_gateway');
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
            errorstr = LANG_LOCALE['30630']+": " + dmzSubnetStr;
            alert (errorstr);
            return false;
            }

        /* end IP should fall under specified range */
        if ((dhcpEnd < ipv4AsciitoNum(ipv4AddrAttributes[2])) || 
            (dhcpEnd > ipv4AsciitoNum(ipv4AddrAttributes[3])))
            {
            errorstr = LANG_LOCALE['30631']+": " + dmzSubnetStr;
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
            errorstr = LANG_LOCALE['30632']+" " + allowedAddrRange + " " + LANG_LOCALE['30633'];
            alert (errorstr);
            return false;
            }

        /* end IP should fall under specified range */
        if(gatewayAddr.value != '')
            {
            gatewayAddr = getIPInt1 ('tf1_ipv4_gateway');
            if ((gatewayAddr < ipv4AsciitoNum(ipv4AddrAttributes[2])) || 
                (gatewayAddr > ipv4AsciitoNum(ipv4AddrAttributes[3])))
                {
                errorstr = LANG_LOCALE['30634']+": " + dmzSubnetStr;
                alert (errorstr);
                return false;
                }
            }
        }
    return true;
    }

/* 
 * funcName    : dhcpDMZRangeAutoFill.
 * In Arg      : IP/subnet check.
 * out Arg     : auto fills.
 * Description : Auto fills the start and end address.
 */ 
function dhcpDMZRangeAutoFill ()
    {
    /* declare or define your variables here */
    var ipObj = document.getElementById ('tf1_ipv4_addr');
    var maskObj = document.getElementById ('tf1_snet');
    var startIPObj = document.getElementById ('tf1_ipv4_start');
    var endIPObj = document.getElementById ('tf1_ipv4_end');
    var unitName = document.getElementById('hdUnitName').value;        
    var allowedAddrRange = 1024;
    var tempVar = false;
    var ipv4AddrAttributes;

    /* sanity check is needed */
    if (!ipObj || ipObj.disabled || ipObj.value == '' || !maskObj || maskObj.disabled || maskObj.value == '') 
        return false;

    /* set the default gateway to this IP address*/
    document.getElementById ("tf1_ipv4_gateway").value = ipObj.value;

    /* validate the IP address */
    if (ipv4Validate ('tf1_ipv4_addr', 'NSN', false, false, '', '', true) == false)
        {
        ipObj.focus();
        return false;
        }

    /* validate the subnet */
    if (validNetMask ('tf1_snet') == false)
        {
        maskObj.focus();
        return false;
        }

    /* Now get the IPv4 attributes for this IP/subnet */
    ipv4AddrAttributes = getIPv4RangeAttr (getIPInt1('tf1_ipv4_addr'), getIPInt1 ('tf1_snet'));

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
        var ipObj = document.getElementById ('tf1_ipv4_addr');
        var maskObj = document.getElementById ('tf1_snet');

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

			var startIPObj = document.getElementById ('tf1_ipv4_start');
			var endIPObj = document.getElementById ('tf1_ipv4_end');

			document.getElementById ("tf1_ipv4_gateway").value = ipObj.value;
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
