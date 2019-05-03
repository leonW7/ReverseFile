/*
 * File: vlanSettingsConfig.js
 * Created on 19th nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */

/**
 * This function calls Page loads
 * Onload validation
 * @method onloadCall
 */   
function onLoadVlanSettingsFn() {
	onloadCall (enableDisableFieldsByImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
	
	enableTextFieldByAnchorClick ('tf1_activateCaptivePortal', 'tf1_configurationName tf1_redirectType tf1_captcha tf1_authenticationServer tf1_authenticationType','break_configurationName break_redirectType break_captcha break_authenticationServer break_authenticationType');
	enableTextFieldByAnchorClick ('tf1_vlanIPv6', 'tf1_lanTCPIPSetup tf1_ipv6_addr tf1_ipv6_maxlength tf1_dhcpv6','break_lanTCPIPSetup break_dhcpv6');
    enableTextFieldByAnchorClick('tf1_dhcpState','tf1_stateless tf1_ipv6_DomName tf1_serpre tf1_DnsSvrs tf1_ipv6_PriDnsServer tf1_ipv6_SecDnsServer tf1_ipv6_leasetime tf1_prefix_del','break_stateless break_ipv6_DomName break_serpre break_DnsSvrs break_ipv6_PriDnsServer break_ipv6_SecDnsServer break_ipv6_leasetime break_prefix_del');
	authServerChangeMode('tf1_authenticationServer');
	captivePortalChangeMode('tf1_captivePortal');
	dhcpChangeMode('tf1_dhcpModeRadio1');
    dnsServerChange ();
    modeChange('tf1_stateless');
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
    	case 'tf1_activateCaptivePortal':
    		enableTextFieldByAnchorClick(imgId,'tf1_configurationName tf1_redirectType tf1_captcha tf1_authenticationServer tf1_authenticationType','break_configurationName break_redirectType break_captcha break_authenticationServer break_authenticationType');
		authServerChangeMode('tf1_authenticationServer');
    	break;
        case 'tf1_vlanIPv6':
    		enableTextFieldByAnchorClick(imgId,'tf1_lanTCPIPSetup tf1_ipv6_addr tf1_ipv6_maxlength tf1_dhcpv6','break_lanTCPIPSetup break_dhcpv6');
        break;
        case 'tf1_dhcpState':
    		enableTextFieldByAnchorClick(imgId,'tf1_stateless tf1_ipv6_DomName tf1_serpre tf1_DnsSvrs tf1_ipv6_PriDnsServer tf1_ipv6_SecDnsServer tf1_ipv6_leasetime tf1_prefix_del','break_stateless break_ipv6_DomName break_serpre break_DnsSvrs break_ipv6_PriDnsServer break_ipv6_SecDnsServer break_ipv6_leasetime break_prefix_del');
            dnsServerChange ();
        break;

        }
    }
/**
 * This function calls when user clicks on submit button.
 * OnSubmit validation
 * @method validateVlanSettingsConfig
 */
function validateVlanSettingsConfig(frmId) {
	var txtFieldIdArr = new Array();
	txtFieldIdArr[0] = "tf1_vlanId, "+LANG_LOCALE['12414'];
	txtFieldIdArr[1] = "tf1_vlanName, "+LANG_LOCALE['12326'];	
	txtFieldIdArr[2] = "tf1_vlanSubnetIpAddress, "+LANG_LOCALE['12290'];
    txtFieldIdArr[3] = "tf1_vlanSubnetMask, "+LANG_LOCALE['12402'];
    txtFieldIdArr[4] = "tf1_dhcpStartIp, "+LANG_LOCALE['12392'];
    txtFieldIdArr[5] = "tf1_dhcpEndIp, "+LANG_LOCALE['12269'];
    txtFieldIdArr[6] = "tf1_dhcpLeaseTime, "+LANG_LOCALE['12302'];
    txtFieldIdArr[7] = "tf1_dhcpRelayGateway, "+LANG_LOCALE['12353'];
    txtFieldIdArr[8] = "tf1_ipv6_addr, "+LANG_LOCALE['12034'];
    txtFieldIdArr[9] = "tf1_ipv6_maxlength, "+LANG_LOCALE['12036'];
    txtFieldIdArr[10] = "tf1_ipv6_DomName, "+LANG_LOCALE['12002'];
    txtFieldIdArr[11] = "tf1_serpre, "+LANG_LOCALE['12119'];
    txtFieldIdArr[12] = "tf1_ipv6_PriDnsServer,"+LANG_LOCALE['12091'];
    txtFieldIdArr[13] = "tf1_ipv6_SecDnsServer,"+LANG_LOCALE['12108'];
    txtFieldIdArr[14] = "tf1_ipv6_leasetime,"+LANG_LOCALE['12040'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false)
	    return false;

    if (alphaNumericValueCheck ("tf1_vlanName", '', '') == false)    
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;

    var vlanId1Obj = document.getElementById('tf1_vlanId');
    if (vlanId1Obj && !vlanId1Obj.disabled) {
        var unitName = $('#hdUnitName').val();
        if (unitName == 'DSR-150' || unitName == 'DSR-150N') {
            if (numericValueRangeCheck(vlanId1Obj , "", "", 2, 15, true, LANG_LOCALE['11374']+': ', "") == false)
                return false;
        } else {
            if (numericValueRangeCheck(vlanId1Obj , "", "", 2, 4093, true, LANG_LOCALE['11374']+': ', "") == false)
                return false;
        }
    }
    
    if (ipv4AddrValidate (document.getElementById('tf1_vlanSubnetIpAddress'), 'NSN', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if (validNetMask('tf1_vlanSubnetMask') == false) 
        return false;
    
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
    
    var StartIpObj = document.getElementById("tf1_dhcpStartIp");
    if (StartIpObj && !StartIpObj.disabled){
	    if (ipv4Validate("tf1_dhcpStartIp" , 'NSN', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
	        return false;
	}
    
    var EndIpObj = document.getElementById("tf1_dhcpEndIp");
    if (EndIpObj && !EndIpObj.disabled){
	    if (ipv4Validate("tf1_dhcpEndIp", 'NSN', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    }
    
    var dhcpDefGatewayObj = document.getElementById("tf1_dhcpDefGateway");
    if (dhcpDefGatewayObj.value != '' ){
    if (dhcpDefGatewayObj && !dhcpDefGatewayObj.disabled){
	    if (ipv4Validate("tf1_dhcpDefGateway", 'NSN', true, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
	        return false;
    }
    }
    
    if (ipSubnetCheck () == false) {
        return false;
    }

    var dhcpPrimaryDnsServerObj = document.getElementById("tf1_dhcpPrimaryDnsServer");
    if (dhcpPrimaryDnsServerObj && !dhcpPrimaryDnsServerObj.disabled){
	    if (ipv4Validate("tf1_dhcpPrimaryDnsServer", 'IP', true, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
     		return false;
    }
    
    var dhcpSecondaryDnsServerObj = document.getElementById("tf1_dhcpSecondaryDnsServer");
    if (dhcpSecondaryDnsServerObj && !dhcpSecondaryDnsServerObj.disabled){
	    if (ipv4Validate("tf1_dhcpSecondaryDnsServer" , 'IP', true, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
    	    return false;
	} 
	
	var dhcpRelayGatewayObj = document.getElementById("tf1_dhcpRelayGateway");
    if (dhcpRelayGatewayObj && !dhcpRelayGatewayObj.disabled){   
	    if (ipv4Validate("tf1_dhcpRelayGateway" , 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
    	    return false;
    }
    
    var dhcpLeaseTimeObj = document.getElementById('tf1_dhcpLeaseTime');
    if (dhcpLeaseTimeObj && !dhcpLeaseTimeObj.disabled) {
        if (numericValueRangeCheck(dhcpLeaseTimeObj , 1, LANG_LOCALE['12302'], 1, 262800, true, LANG_LOCALE['13489']+': ', LANG_LOCALE['30112']) == false) 
            return false;
    }
    
    var mode = document.getElementById('hdMode').value;
    if (mode == "3") {
    var ipv6AddObj = document.getElementById('tf1_ipv6_addr');
    if (ipv6AddObj && !ipv6AddObj.disabled) {
        if (ipv6Validate('tf1_ipv6_addr', false, true, '') == false) 
            return false;
    }

    var preLenObj = document.getElementById('tf1_ipv6_maxlength');
    if (preLenObj && !preLenObj.disabled) {
        if (numericValueRangeCheck(preLenObj, '', '', 1, 128, true, LANG_LOCALE['11286']+': ', '') == false) 
            return false;
    }

    var domainObj = document.getElementById('tf1_ipv6_DomName');
    if (domainObj && !domainObj.disabled) {
        if (checkHostName('tf1_ipv6_DomName', true, LANG_LOCALE['11251']+': ', false) == false) 
            return false;
    }
    var svrPrefObj = document.getElementById('tf1_serpre');
    if (svrPrefObj && !svrPrefObj.disabled) {
        if (numericValueRangeCheck(svrPrefObj, '', '', 0, 255, true, LANG_LOCALE['11350']+': ', '') == false) 
            return false;
    }
   
    var priDnsServerObj = document.getElementById('tf1_ipv6_PriDnsServer');
    if (priDnsServerObj && !priDnsServerObj.disabled) {
        if (ipv6Validate('tf1_ipv6_PriDnsServer', false, true, '') == false) 
            return false;
    }
   
    var secDnsServerObj = document.getElementById('tf1_ipv6_SecDnsServer');
    if (secDnsServerObj && !secDnsServerObj.disabled) {
        if (ipv6Validate('tf1_ipv6_SecDnsServer', false, true, '') == false) 
            return false;
    }
    
    var leaseTimeObj = document.getElementById('tf1_ipv6_leasetime');
    if (leaseTimeObj && !leaseTimeObj.disabled){
        if (numericValueRangeCheck(leaseTimeObj, '', '', 0, 604800, true, LANG_LOCALE['11290']+': ', LANG_LOCALE['12732']) == false) 
            return false;
    }
    }

    var lanIp = document.getElementById('tf1_vlanSubnetIpAddress').value;
    var netmask = document.getElementById('tf1_vlanSubnetMask').value;
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

    /** var billingProfileObject = document.getElementById("tf1_configurationName_billing");

     if (billingProfileObject.disabled == false) {
    
                if (billingProfileObject.length == 0 ) {
                     alert("Please configure atleast one login profile with payment gateway for billing profile configurartion");
                    return false;
                }

      }
**/
    setHiddenChks(frmId);     
    return true;
}

/**
 * This function calls when User select an radio option
 * @method dhcpChangeMode
 */
function dhcpChangeMode(radioName){
    var selValue = radioCheckedValueGet(radioName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* None */
            fieldStateChangeWr('tf1_dhcpDomainName tf1_dhcpStartIp tf1_dhcpEndIp tf1_dhcpDefGateway tf1_dhcpPrimaryDnsServer tf1_dhcpSecondaryDnsServer tf1_dhcpLeaseTime tf1_dhcpRelayGateway', '', '', '');
            vidualDisplay('tf1_dhcpDomainName tf1_dhcpStartIp tf1_dhcpEndIp tf1_dhcpDefGateway tf1_dhcpPrimaryDnsServer tf1_dhcpSecondaryDnsServer tf1_dhcpLeaseTime tf1_dhcpRelayGateway', 'hide');
            vidualDisplay('break1 break2 break3 break4 break5 break6 break7 break8', 'hide');
            break;
        case 2: /* DHCP Server */
            fieldStateChangeWr('tf1_dhcpRelayGateway', '', 'tf1_dhcpDomainName tf1_dhcpStartIp tf1_dhcpEndIp tf1_dhcpDefGateway tf1_dhcpPrimaryDnsServer tf1_dhcpSecondaryDnsServer tf1_dhcpLeaseTime', '');
            vidualDisplay('tf1_dhcpDomainName tf1_dhcpStartIp tf1_dhcpEndIp tf1_dhcpDefGateway tf1_dhcpPrimaryDnsServer tf1_dhcpSecondaryDnsServer tf1_dhcpLeaseTime', 'configRow');
            vidualDisplay('break1 break2 break3 break4 break5 break6 break7', 'break');
            
            vidualDisplay('tf1_dhcpRelayGateway', 'hide');
            vidualDisplay('break8', 'hide');
            break;
            
        case 3: /* DHCP Relay */
            fieldStateChangeWr('tf1_dhcpDomainName tf1_dhcpStartIp tf1_dhcpEndIp tf1_dhcpDefGateway tf1_dhcpPrimaryDnsServer tf1_dhcpSecondaryDnsServer tf1_dhcpLeaseTime', '', 'tf1_dhcpRelayGateway', '');
            vidualDisplay('tf1_dhcpRelayGateway', 'configRow');
            vidualDisplay('break7 break8', 'break');
            
            vidualDisplay('tf1_dhcpDomainName tf1_dhcpStartIp tf1_dhcpEndIp tf1_dhcpDefGateway tf1_dhcpPrimaryDnsServer tf1_dhcpSecondaryDnsServer tf1_dhcpLeaseTime', 'hide');
            vidualDisplay('break1 break2 break3 break4 break5 break6', 'hide');
            
            break;
    }
}
/**
 * This function calls when User select an radio option
 * @method dhcpChangeMode
 */
function captivePortalChangeMode(selName){
    var selValue = comboSelectedValueGet (selName);
    if (!selValue) 
        return;
     $("#tf1_configurationName").show();
     $('#tf1_configurationName').prop('disabled', false);
     $("#tf1_configurationName_billing").hide();
     $('#tf1_configurationName_billing').prop('disabled', 'disabled');


    switch (parseInt(selValue, 10)) {
        case 1: /* Free */
            fieldStateChangeWr('tf1_configurationNameSla tf1_configurationName tf1_enableRedirect tf1_UrlName tf1_authenticationServer tf1_captivePortalProfileSlaBlock tf1_captivePortalProfileBlock', '', '', '');
            vidualDisplay('tf1_configurationNameSla tf1_captivePortalProfileSlaBlock tf1_enableRedirect tf1_UrlName tf1_authenticationServer tf1_configurationName tf1_captivePortalProfileBlock', 'hide');
            vidualDisplay('break_enableRedirect break_UrlName break_configurationNameSla', 'hide');
	break;
        case 2: /* SLA */
            fieldStateChangeWr('tf1_authenticationServer tf1_configurationName tf1_authenticationType tf1_configurationName_billing tf1_configurationName tf1_captivePortalProfileBlock', '', 'tf1_enableRedirect tf1_UrlName tf1_configurationNameSla', '');
            vidualDisplay('tf1_authenticationServer tf1_authenticationType tf1_configurationName tf1_captivePortalProfileBlock tf1_configurationName', 'hide');
            vidualDisplay('break_authenticationServer break_authenticationType break_configurationName break_captivePortalProfileBlock', 'hide');
            vidualDisplay('tf1_enableRedirect tf1_UrlName tf1_configurationNameSla tf1_captivePortalProfileSlaBlock', 'configRow');
            vidualDisplay('break_enableRedirect break_UrlName', 'break');
            enableTextFieldByAnchorClick('tf1_enableRedirect','tf1_UrlName');
            break;
        case 3: /* Permanent User */
            fieldStateChangeWr('tf1_configurationName_billing tf1_configurationNameSla', '', 'tf1_authenticationServer tf1_authenticationType tf1_configurationName tf1_captivePortalProfileSlaBlock tf1_captivePortalProfileBlock tf1_enableRedirect tf1_UrlName', '');
            vidualDisplay('tf1_authenticationServer tf1_authenticationType tf1_configurationName tf1_captivePortalProfileBlock tf1_enableRedirect tf1_UrlName tf1_configurationName', 'configRow');
            vidualDisplay('tf1_configurationNameSla tf1_captivePortalProfileSlaBlock', 'hide');
            vidualDisplay('break_authenticationServer break_configurationNameSla break_authenticationType break_configurationName break_captivePortalProfileBlock break_enableRedirect break_UrlName', 'break');
            authServerChangeMode('tf1_authenticationServer');
            enableTextFieldByAnchorClick('tf1_enableRedirect','tf1_UrlName');
         break;
        case 4: /* Temporary User */
            fieldStateChangeWr('tf1_configurationNameSla tf1_captivePortalProfileSlaBlock tf1_configurationName_billing tf1_authenticationServer tf1_authenticationType', '', 'tf1_configurationName tf1_captivePortalProfileBlock tf1_enableRedirect tf1_UrlName', '');
            vidualDisplay('tf1_configurationName tf1_captivePortalProfileBlock tf1_enableRedirect tf1_UrlName', 'configRow');
            vidualDisplay('break_configurationName break_configurationNameSla break_captivePortalProfileBlock break_enableRedirect break_UrlName', 'break');
            vidualDisplay('tf1_authenticationServer tf1_authenticationType tf1_captivePortalProfileSlaBlock', 'hide');
            vidualDisplay('break_authenticationServer break_authenticationType', 'hide');
            authServerChangeMode('tf1_authenticationServer');
            enableTextFieldByAnchorClick('tf1_enableRedirect','tf1_UrlName');
        break;            
        case 5: /* Billing */
            fieldStateChangeWr('tf1_configurationNameSla tf1_captivePortalProfileSlaBlock tf1_authenticationServer tf1_authenticationType tf1_configurationName', '', 'tf1_configurationName_billing tf1_captivePortalProfileBlock tf1_enableRedirect tf1_UrlName', '');
            vidualDisplay('tf1_configurationName tf1_captivePortalProfileBlock tf1_enableRedirect tf1_UrlName', 'configRow');
            vidualDisplay('break_configurationName break_configurationNameSla break_captivePortalProfileBlock break_enableRedirect break_UrlName', 'break');
            vidualDisplay('tf1_authenticationServer tf1_authenticationType tf1_captivePortalProfileSlaBlock', 'hide');
            vidualDisplay('break_authenticationServer break_authenticationType', 'hide');
            authServerChangeMode('tf1_authenticationServer');
            enableTextFieldByAnchorClick('tf1_enableRedirect','tf1_UrlName');
            $("#tf1_configurationName_billing").show();
             $('#tf1_configurationName_billing').prop('disabled', false);
            $("#tf1_configurationName").hide();
             $('#tf1_configurationName').prop('disabled', 'disabled');
    }
}

/**
 * This function calls when User select an radio option
 * @method dhcpChangeMode
 */
function authServerChangeMode(selName){
    var selValue = comboSelectedValueGet (selName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* Local User Database */
        case 3: /* LDAP Server */
		case 4: /* POP3 */
		case 5: /* Active Directory */
		case 6: /* NT Domain */
			 fieldStateChangeWr('tf1_authenticationType', '', '', '');
			 vidualDisplay('tf1_authenticationType', 'hide');
			 vidualDisplay('break_authenticationType', 'hide');
        break;
        case 2: /* Radius Server */
			fieldStateChangeWr('', '', 'tf1_authenticationType', '');
			vidualDisplay('tf1_authenticationType', 'configRow');
			vidualDisplay('break_authenticationType', 'break');
		break;
    }
}

function ipSubnetCheck () 
    {
    /* declare or define your variables here */
    var lanIp = getIPInt1('tf1_vlanSubnetIpAddress');
    var lanIpMask = getIPInt1('tf1_vlanSubnetMask');
    var ipv4AddrAttributes = getIPv4RangeAttr (lanIp, lanIpMask);
    var isDhcpEnabled = parseInt (radioCheckedValueGet ('tf1_dhcpModeRadio1'), 10);

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

    if (isDhcpEnabled == 2) {
        var dhcpStart = getIPInt1 ('tf1_dhcpStartIp')
        var dhcpEnd = getIPInt1 ('tf1_dhcpEndIp');
        var lanIpStr = getIPStr1('tf1_vlanSubnetIpAddress');
        var lanIpMaskStr = getIPStr1('tf1_vlanSubnetMask');
        var lanSubnetStr = lanIpStr + "/" + lanIpMaskStr;
        var gatewayAddr = document.getElementById('tf1_dhcpDefGateway');
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
            errorstr = LANG_LOCALE['30632']+" " + allowedAddrRange + " " + LANG_LOCALE['30633'];
            alert (errorstr);
            return false;
            }

        /* end IP should fall under specified range */
        if(gatewayAddr.value != '')
            {
            if (gatewayAddr && !gatewayAddr.disabled)
                {
                gatewayAddr = getIPInt1 ('tf1_dhcpDefGateway');
                if ((gatewayAddr < ipv4AsciitoNum(ipv4AddrAttributes[0])) || 
                    (gatewayAddr > ipv4AsciitoNum(ipv4AddrAttributes[3])))
                    {
                    errorstr = LANG_LOCALE['30634']+": " + lanSubnetStr;
                    alert (errorstr);
                    return false;
                    }
                }
            }
    }
    return true;
}

/* 
 * funcName    : dhcpVLANRangeAutoFill.
 * In Arg      : Nothing
 * out Arg     : Nothing
 * Description : This function sets the ip address attributes.
 */ 
function dhcpVLANRangeAutoFill ()
    {
    /* declare or define your variables here */
    var ipObj = document.getElementById ('tf1_vlanSubnetIpAddress');
    var maskObj = document.getElementById ('tf1_vlanSubnetMask');     
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
    document.getElementById ("tf1_dhcpDefGateway").value = ipObj.value;

    /* validate the ip address */
    if (ipv4Validate ('tf1_vlanSubnetIpAddress', 'NSN', false, false, '', '', true) == false)
        {
        ipObj.focus();
        return false;
        }

    /* validate the subnet */
    if (validNetMask ('tf1_vlanSubnetMask') == false)
        {
        maskObj.focus();
        return false;
        }

    /* Now get the IPv4 attributes for this IP/subnet */
    ipv4AddrAttributes = getIPv4RangeAttr (getIPInt1('tf1_vlanSubnetIpAddress'), getIPInt1 ('tf1_vlanSubnetMask'));

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
        var ipObj = document.getElementById ('tf1_vlanSubnetIpAddress');
        var maskObj = document.getElementById ('tf1_vlanSubnetMask');
        
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

			document.getElementById ("tf1_dhcpDefGateway").value = ipObj.value;
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

/* This function restrict if we give Domain Name as invalid */
function domainCheck ()
	{
    
	var domain = document.getElementById('tf1_dhcpDomainName').value;
	var domainLength = domain.length;
	var lastChar = domain.charAt(domainLength-1);
	var nextChar = domain.charAt(domainLength-2);

	var errorstr = LANG_LOCALE['30113'];

	if(lastChar == '\\' && nextChar != '\\') 
		{
	    	alert (errorstr)
	    	return false;				
		}
	else if(lastChar == '\\' && nextChar == '\\') 
		{
	    	return true;				
		}
	else
		{
		return true;	
		}
	}

/**
 * DNS Server Change
 * @method dnsServerChange
 */
function dnsServerChange(){
    var tf1_DnsSvrsObj = document.getElementById('tf1_DnsSvrs');
    if (tf1_DnsSvrsObj && !tf1_DnsSvrsObj.disabled) {
        var selValue = parseInt(tf1_DnsSvrsObj.value, 10);
        if (selValue == 1 || selValue == 2) {
            fieldStateChangeWr("tf1_ipv6_PriDnsServer tf1_ipv6_SecDnsServer", "", "", "");
            vidualDisplay("tf1_ipv6_PriDnsServer tf1_ipv6_SecDnsServer", 'hide');
            vidualDisplay("break_ipv6_PriDnsServer break_ipv6_SecDnsServer", 'hide');
        }
        else {
            fieldStateChangeWr("", "", "tf1_ipv6_SecDnsServer tf1_ipv6_PriDnsServer", "");
            vidualDisplay("tf1_ipv6_PriDnsServer tf1_ipv6_SecDnsServer", 'configRow');
            vidualDisplay("break_ipv6_PriDnsServer break_ipv6_SecDnsServer", 'break');
        }
    }
}


/**
 * State Mode Change
 * @method modeChange
 */
function modeChange(radioName){
    var selValue = radioCheckedValueGet(radioName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 0: /* Stateful */
            fieldStateChangeWr("tf1_prefix_del", "", "", "");
            vidualDisplay("tf1_prefix_del break_prefix_del", 'hide');
            break;
            
        case 1: /* Stateless */
            fieldStateChangeWr("", "", "tf1_prefix_del", "");
            vidualDisplay("tf1_prefix_del", 'configRow');
            vidualDisplay("break_prefix_del", 'break');
            break;
    }
}
