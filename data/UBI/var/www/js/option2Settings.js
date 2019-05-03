/*
 * File: option2Settings.js
 * Created on 7th Nov 2012 - Vivek
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
 
var IP_ADDRESS = LANG_LOCALE['11281'];
var FOR_OCTET = LANG_LOCALE['11031'];
var MESSAGE_1 = LANG_LOCALE['13496'];
var INVALID_TIME = LANG_LOCALE['13489'];
var HOURS = LANG_LOCALE['11126'];

/*
 * onload call
 */
var vlanFieldChange = true;
var pppSubnetMask = "255.255.255.255";
window.onload = function(event){    onloadCall();}
jQuery(function () {
	changeConnectionType('tf1_connectionType');
	changeConfigurablePort('tf1_configurablePortOption');	
	onloadCall (enableDisableFieldsByImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
    changeDhcpMode('tf1_radNtp1');
    var unitName = $("#hdUnitName").val();
    if (unitName != "DSR-150" && unitName != "DSR-150N" && unitName != "DSR-250" && unitName != "DSR-250N") {
        enableTextFieldByAnchorClick('tf1_enableVlan','tf1_wanVlanId','break_wanVlanId');
    }
	//enableTextFieldByAnchorClick('tf1_dns_wins','tf1_ipv4_primary tf1_ipv4_secondary tf1_wins_server','break9 break10 break11'); 
});

function ispOnReset() {
	onloadCall();
	changeConnectionType('tf1_connectionType');	
	changeConfigurablePort('tf1_configurablePortOption');
    var unitName = $("#hdUnitName").val();
    if (unitName != "DSR-150" && unitName != "DSR-150N" && unitName != "DSR-250" && unitName != "DSR-250N") {
        enableTextFieldByAnchorClick('tf1_enableVlan','tf1_wanVlanId','break_wanVlanId');
    }
    portSetupChangeMode('tf1_staticPortSetupCustom','tf1_staticCustomMTU1','');
    portSetupChangeMode('tf1_dynamicPortSetupCustom','tf1_dynamicCustomMTU1','');
    portSetupChangeMode('tf1_pppoePortSetupCustom','tf1_pppoeCustomMTU1','');
    portSetupChangeMode('tf1_pptpPortSetupCustom','tf1_pptpCustomMTU1','');
    portSetupChangeMode('tf1_l2tpPortSetupCustom','tf1_l2tpCustomMTU1','');
    portSetupChangeMode('tf1_jpppoePortSetup2','tf1_jpppoeCustomMTU1','');
    portSetupChangeMode('tf1_rpppoePortSetup2','tf1_rpppoeCustomMTU1','');
    portSetupChangeMode('tf1_rpptpPortSetup2','tf1_rpptpCustomMTU1','');
    portSetupChangeMode('tf1_rl2tpPortSetup2','tf1_rl2tpCustomMTU1','');
    portSetupChangeMode('tf1_3GPortSetupCustom','tf1_3GCustomMTU1','');
}

/**
 * Enabled/disables based on radio value
 * @method changeTabMenuClass
 * @param radioName - selected radio name
 * @param individualIds - individual ids to enable/disable
 * @param grpIds - group ids to enable/disable
 * @param hideShowId - hide/show field ids
 * @param compareVal - value when fields should be enabled other wise they will be diabled
 */
function changeOptions(radioName, individualIds, grpIds, hideShowId, compareVal){
    var radioVal = radioCheckedValueGet(radioName);
    if (radioVal != compareVal) {
        fieldStateChangeWr(individualIds, grpIds, '', '');
        vidualDisplay(hideShowId, 'hide');
    }
    else {
        fieldStateChangeWr('', '', individualIds, grpIds);
        vidualDisplay(hideShowId, '');
    }
}

/**
 * on submit validation
 * @method ispValidate
 */
function ispValidate(frmId){
    //Dhcp Validation
    if (!dhcpValidations()) {
        return false;
    }
    
    //Static Validation
    if (!staticValidations()) {
        return false;
    }
    
    //Pppoe Validation
    if (!pppoeValidations()) {
        return false;
    }
    
    //PPTP Validation
    if (!pptpValidations()) {
        return false;
    }
    
    //L2TP Validation
    if (!l2tpValidations()) {
        return false;
    }
    
    //JPPPOE Validation
    if (!jPppoeValidations()) {
        return false;
    }
    
    //RPPPOE Validation
    if (!rPppoeValidations()) {
        return false;
    }
    
    //RPPTP Validation
    if (!rPptpValidations()) {
        return false;
    }
    
    //RL2TP Validation
    if (!rL2tpValidations()) {
        return false;
    }
    
    // DMZ Validations
    if(!dmzSetupValidate()){
    	return false;
    }
    setHiddenChks(frmId); 
	$(".sameMacRadio").each(function(e){
	
	 	checkedId = "0";

	 	if ($(this).is(':disabled') == false) {			
			
			if ( $(this).attr('checked') ) {	
				checkedId = $(this).attr("id");
			}

			$(this).attr("name","ipv4Option2.macAddressType");
		}

		if (checkedId != "0")
		{
			$("#"+checkedId).attr('checked', true);
			
		}        

        });
	$(".sameMtuRadio").each(function(e){
	
	 	checkedId = "0";

	 	if ($(this).is(':disabled') == false) {			
			
			if ( $(this).attr('checked') ) {	
				checkedId = $(this).attr("id");
			}

			$(this).attr("name","ipv4Option2.mtuType");
		}

		if (checkedId != "0")
		{
			$("#"+checkedId).attr('checked', true);
			
		}        

        });
	$(".sameDnsRadio").each(function(e){
	
	 	checkedId = "0";

	 	if ($(this).is(':disabled') == false) {			
			
			if ( $(this).attr('checked') ) {	
				checkedId = $(this).attr("id");
			}

			$(this).attr("name","ipv4Option2.useIspDns");
		}

		if (checkedId != "0")
		{
			$("#"+checkedId).attr('checked', true);
			
		}        

        });
	$(".sameDhcpRadio").each(function(e){
	
	 	checkedId = "0";

	 	if ($(this).is(':disabled') == false) {			
			
			if ( $(this).attr('checked') ) {	
				checkedId = $(this).attr("id");
			}

			$(this).attr("name","ipv4Option2.useDhcp");
		}

		if (checkedId != "0")
		{
			$("#"+checkedId).attr('checked', true);
			
		}        

        });
	$(".sameReconnectModeRadio").each(function(e){
	
	 	checkedId = "0";

	 	if ($(this).is(':disabled') == false) {			
			
			if ( $(this).attr('checked') ) {	
				checkedId = $(this).attr("id");
			}

			$(this).attr("name","ipv4Option2.reconnectMode");
		}

		if (checkedId != "0")
		{
			$("#"+checkedId).attr('checked', true);
			
		}        

        });
    /* also check the vlanID */
    staticvlanObj=document.getElementById('tf1_hdenableVlan');
    if ( staticvlanObj && parseInt(staticvlanObj.value, 10)== 1)
        {
        var vlanIDObj=document.getElementById('tf1_wanVlanId');
        if( vlanIDObj && vlanIDObj.value)
            {
            /* does the value fall in the allowed range ? */
            if (numericValueRangeCheck(document.getElementById('tf1_wanVlanId'), '', '', 2, 4093, true, LANG_LOCALE['11374']+': ', '') == false)
                { 
                /* the values should be with in the range */
                vlanIDObj.focus();
                return false;        
                }
            }
        else
            {
            alert(LANG_LOCALE['12146']);
            vlanIDObj.focus();
            return false;
            }        
        }        
    return true;
}


/**
 * validating dhcp fileds
 * @method dhcpValidations
 */
function dhcpValidations(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_DhcpPriDns,"+LANG_LOCALE['12091'];
    txtFieldIdArr[1] = "tf1_DhcpSecDns,"+LANG_LOCALE['12108'];
    txtFieldIdArr[2] = "tf1_DhcpMac,"+LANG_LOCALE['12048'];
    txtFieldIdArr[3] = "tf1_dynamicCustomMTU1,"+LANG_LOCALE['11982'];

    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    if (hostNameValidation ('tf1_hostName') == false)
        return false;
    
    if (ipv4Validate('tf1_DhcpPriDns', 'SN', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (ipv4Validate('tf1_DhcpSecDns', 'SN', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (!validateMac('tf1_DhcpMac')) {
        return false;
    }
    
    var staticMtuObj=document.getElementById('tf1_dynamicCustomMTU1');
    var jumboObj=document.getElementById('hdJumboFrame');
    var max=1500;
    var jumboValue;

    if(jumboObj){
        jumboValue=jumboObj.value;
    }
    if(staticMtuObj && !staticMtuObj.disabled){
    	if (jumboValue == 1){
            max=9198;
           var unitName = $("#hdUnitName").val();
           if (unitName == "DSR-250N" || unitName == "DSR-250") {
               max = 1500;
           }
        }
    	if(numericValueRangeCheck (staticMtuObj, '', '', 1200, max, true, LANG_LOCALE['11239']+': ', LANG_LOCALE['10433'])==false)
    		return false;
    }
    
    return true;
}

/**
 * validating static fileds
 * @method staticValidations
 */
function staticValidations(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_StaticIp,"+LANG_LOCALE['12028'];
    txtFieldIdArr[1] = "tf1_StaticSubnet,"+LANG_LOCALE['12032'];
    txtFieldIdArr[2] = "tf1_StaticGateway,"+LANG_LOCALE['12017'];
    txtFieldIdArr[3] = "tf1_StaticPriDns,"+LANG_LOCALE['12091'];
    txtFieldIdArr[4] = "tf1_StaticPiSecDns,"+LANG_LOCALE['12108'];
    txtFieldIdArr[5] = "tf1_StaticMac,"+LANG_LOCALE['12048'];
    txtFieldIdArr[6] = "tf1_staticCustomMTU1,"+LANG_LOCALE['11982'];

    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv4Validate('tf1_StaticIp', 'IP', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (validNetMask('tf1_StaticSubnet') == false) 
        return false;
    
    if (ipv4Validate('tf1_StaticGateway', 'IP', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (ipv4Validate('tf1_StaticPriDns', 'SN', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (ipv4Validate('tf1_StaticPiSecDns', 'SN', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (!validateMac('tf1_StaticMac')) {
        return false;
    }
    
    var mtuObj=document.getElementById('tf1_staticCustomMTU1');
    var jumboObj=document.getElementById('hdJumboFrame');
    var max=1500;
    var jumboValue;

    if(jumboObj){
        jumboValue=jumboObj.value;
    }
    if(mtuObj && !mtuObj.disabled){
    	if (jumboValue == 1){
            max=9198;
           var unitName = $("#hdUnitName").val();
           if (unitName == "DSR-250N" || unitName == "DSR-250") {
               max = 1500;
           }
        }
    	if(numericValueRangeCheck (mtuObj, '', '', 1200, max, true, LANG_LOCALE['11239']+': ', LANG_LOCALE['10433'])==false)
    		return false;
    }

    var wan1IpAddrObj = document.getElementById('hdIPAddrWAN1');
	var wan1IpSnetObj = document.getElementById('hdSnetAddrWAN1');
    var wan2IpAddrObj = document.getElementById('tf1_StaticIp');
   	if(wan2IpAddrObj && !wan2IpAddrObj.disabled)
    	{ 
            if(wan1IpSnetObj && wan1IpAddrObj.value != '0.0.0.0' && wan1IpSnetObj && wan1IpSnetObj.value != '0.0.0.0')	
		    {
		    if(wan1IpSnetObj.value == pppSubnetMask)
			    {
			        if(wan1IpAddrObj.value == wan2IpAddrObj.value)
				    {
				        alert ("WAN1 has the same IP. Please configure different IP.");
				        wan2IpAddrObj.focus();
				        return false;
				    }
			    }
		    else if (subnetValidation ('tf1_StaticIp', 'tf1_StaticSubnet', 'hdIPAddrWAN1', 'hdSnetAddrWAN1')) 
            	{ 
                    alert ("WAN1 IP Address is in the same subnet. Please specify IP Address in a different subnet");
                    wan2IpAddrObj.focus();
                    return false; 
            	}
        	}
    	}

    return true;
}

/**
 * validating pppoe fileds
 * @method pppoeValidations
 */
function pppoeValidations(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_PppoeIpAddr,"+LANG_LOCALE['12028'];
    txtFieldIdArr[1] = "tf1_PppoeSubnet,"+LANG_LOCALE['12032'];
    txtFieldIdArr[2] = "tf1_PppoeUserName,"+LANG_LOCALE['12410'];
    txtFieldIdArr[3] = "tf1_PppoePassword,"+LANG_LOCALE['12074'];
    txtFieldIdArr[4] = "tf1_MaxIdleTime,"+LANG_LOCALE['12053'];
    txtFieldIdArr[5] = "tf1_PppoePriDns,"+LANG_LOCALE['12091'];
    txtFieldIdArr[6] = "tf1_PppoeSecDns,"+LANG_LOCALE['12108'];
    txtFieldIdArr[7] = "tf1_PppoeMac,"+LANG_LOCALE['12048'];
    txtFieldIdArr[8] = "tf1_pppoeCustomMTU1,"+LANG_LOCALE['11982'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_PppoeService,"+LANG_LOCALE['11232']; 
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv4Validate('tf1_PppoeIpAddr', 'IP', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (validNetMask('tf1_PppoeSubnet') == false) 
        return false;
        
    if (ipv4Validate('tf1_PppoePriDns', 'SN', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (ipv4Validate('tf1_PppoeSecDns', 'SN', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (numericValueRangeCheck(document.getElementById('tf1_MaxIdleTime'), '', '', 1, 10, true, LANG_LOCALE['11301'], '') == false) 
        return false;
    
    if (!validateMac('tf1_PppoeMac')) {
        return false;
    }
    
    var mtuObj=document.getElementById('tf1_pppoeCustomMTU1');
    if(mtuObj.value != '' && !mtuObj.disabled){
    	if(numericValueRangeCheck (mtuObj, '', '', 1200, 1500, true, LANG_LOCALE['11239']+': ', LANG_LOCALE['10433'])==false)
    		return false;
    }

    return true;
}

/**
 * validating pptp fileds
 * @method pptpValidations
 */
function pptpValidations(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_PptpIpAddress,"+LANG_LOCALE['12028'];
    txtFieldIdArr[1] = "tf1_PptpSubnet,"+LANG_LOCALE['12032'];
    txtFieldIdArr[2] = "tf1_PptpGateway,"+LANG_LOCALE['12031'];
    txtFieldIdArr[3] = "tf1_PptpServerAddr,"+LANG_LOCALE['12116'];
    txtFieldIdArr[4] = "tf1_PptpUsername,"+LANG_LOCALE['12410'];
    txtFieldIdArr[5] = "tf1_PptpPassword,"+LANG_LOCALE['12074'];
    txtFieldIdArr[6] = "tf1_PptpMaxIdleTime,"+LANG_LOCALE['12053'];
    txtFieldIdArr[7] = "tf1_PptpPriDns,"+LANG_LOCALE['12091'];
    txtFieldIdArr[8] = "tf1_PptpSecAddress,"+LANG_LOCALE['12108'];
    txtFieldIdArr[9] = "tf1_PptpMac,"+LANG_LOCALE['12048'];
    txtFieldIdArr[10] = "tf1_pptpCustomMTU1,"+LANG_LOCALE['11982'];
    //txtFieldIdArr[11] = "tf1_PptpStaticDNSIP,"+LANG_LOCALE['50138'];

    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv4Validate('tf1_PptpIpAddress', 'IP', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (validNetMask('tf1_PptpSubnet') == false) 
        return false;
    
    if (ipv4Validate('tf1_PptpGateway', 'IP', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (serverValidate('tf1_PptpServerAddr', 'tf1_PptpStaticDNSIP') == false)
        return false;
    
    if (numericValueRangeCheck(document.getElementById('tf1_PptpMaxIdleTime'), '', '', 1, 10, true, LANG_LOCALE['11301'], '') == false) 
        return false;
    
    if (ipv4Validate('tf1_PptpPriDns', 'SN', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (ipv4Validate('tf1_PptpSecAddress', 'SN', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (!validateMac('tf1_PptpMac')) {
        return false;
    }
    var mtuObj=document.getElementById('tf1_pptpCustomMTU1');
    if(mtuObj.value != '' && !mtuObj.disabled){
    	if(numericValueRangeCheck (mtuObj, '', '', 1200, 1500, true, LANG_LOCALE['11239']+': ', LANG_LOCALE['10433'])==false)
    		return false;
    }

    return true;
}

/**
 * validating l2tp fields
 * @method l2tpValidations
 */
function l2tpValidations(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_L2tpIpAddress,"+LANG_LOCALE['12028'];
    txtFieldIdArr[1] = "tf1_L2tpSubnetMask,"+LANG_LOCALE['12032'];
    txtFieldIdArr[2] = "tf1_L2tpGateway,"+LANG_LOCALE['12031'];
    txtFieldIdArr[3] = "tf1_L2tpServer,"+LANG_LOCALE['12116'];
    txtFieldIdArr[4] = "tf1_L2tpUserName,"+LANG_LOCALE['12410'];
    txtFieldIdArr[5] = "tf1_L2tpPassword,"+LANG_LOCALE['12074'];
    
    txtFieldIdArr[6] = "tf1_L2tpMaxIdleTime,"+LANG_LOCALE['12053'];
    txtFieldIdArr[7] = "tf1_L2tpPriDns,"+LANG_LOCALE['12091'];
    txtFieldIdArr[8] = "tf1_L2tpSecDns,"+LANG_LOCALE['12108'];
    txtFieldIdArr[9] = "tf1_L2tpMac,"+LANG_LOCALE['12048'];
    txtFieldIdArr[10] = "tf1_l2tpCustomMTU1,"+LANG_LOCALE['11982'];
    //txtFieldIdArr[11] = "tf1_L2tpStaticDNSIP,"+LANG_LOCALE['50138'];

    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_L2tpSecret,"+LANG_LOCALE['11232']; 
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv4Validate('tf1_L2tpIpAddress', 'IP', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (validNetMask('tf1_L2tpSubnetMask') == false) 
        return false;
    
    if (ipv4Validate('tf1_L2tpGateway', 'IP', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (serverValidate('tf1_L2tpServer', 'tf1_L2tpStaticDNSIP') == false)
        return false;
    
    if (numericValueRangeCheck(document.getElementById('tf1_L2tpMaxIdleTime'), '', '', 1, 10, true, LANG_LOCALE['11301'], '') == false) 
        return false;
    
    if (ipv4Validate('tf1_L2tpPriDns', 'SN', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (ipv4Validate('tf1_L2tpSecDns', 'SN', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (!validateMac('tf1_L2tpMac')) {
        return false;
    }
    var mtuObj=document.getElementById('tf1_l2tpCustomMTU1');
    if(mtuObj.value != '' && !mtuObj.disabled){
    	if(numericValueRangeCheck (mtuObj, '', '', 1200, 1500, true, LANG_LOCALE['11239']+': ', LANG_LOCALE['10433'])==false)
    		return false;
    }

    return true;
}

/**
 * validating japan pppoe fileds
 * @method jPppoeValidations
 */
function jPppoeValidations(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_JpppoeIpAddr,"+LANG_LOCALE['12028'];
    txtFieldIdArr[1] = "tf1_JpppoeSubnet,"+LANG_LOCALE['12032'];
    txtFieldIdArr[2] = "tf1_JpppoeUser,"+LANG_LOCALE['12410'];
    txtFieldIdArr[3] = "tf1_JpppoePassword,"+LANG_LOCALE['12074'];
    txtFieldIdArr[4] = "tf1_JpppoeMaxIdleTime,"+LANG_LOCALE['12053'];
    txtFieldIdArr[5] = "tf1_JpppoePriDns,"+LANG_LOCALE['12091'];
    txtFieldIdArr[6] = "tf1_JpppoeSecDns,"+LANG_LOCALE['12108'];
    txtFieldIdArr[7] = "tf1_JpppoeSecIpAddr,"+LANG_LOCALE['12028'];
    txtFieldIdArr[8] = "tf1_JpppoeSecSubnet,"+LANG_LOCALE['12032'];
    txtFieldIdArr[9] = "tf1_JpppoeSecUser,"+LANG_LOCALE['12410'];
    txtFieldIdArr[10] = "tf1_JpppoeSecPass,"+LANG_LOCALE['12074'];
    txtFieldIdArr[11] = "tf1_JpppoeSecMaxIdleTime,"+LANG_LOCALE['12053'];
    txtFieldIdArr[12] = "tf1_JpppoeSecPriDns,"+LANG_LOCALE['12091'];
    txtFieldIdArr[13] = "tf1_JpppoeSecSecDns,"+LANG_LOCALE['12108'];
    txtFieldIdArr[14] = "tf1_jpppoeSecMacAddr,"+LANG_LOCALE['12048'];
    txtFieldIdArr[15] = "tf1_jpppoeCustomMTU1,"+LANG_LOCALE['11982'];

    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
   
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_JpppoeService,"+LANG_LOCALE['11232'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_JpppoeSecService,"+LANG_LOCALE['11232']; 
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv4Validate('tf1_JpppoeIpAddr', 'IP', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (validNetMask('tf1_JpppoeSubnet') == false) 
        return false;
        
    if (numericValueRangeCheck(document.getElementById('tf1_JpppoeMaxIdleTime'), '', '', 1, 10, true, LANG_LOCALE['11301'], '') == false) 
        return false;
    
    if (ipv4Validate('tf1_JpppoePriDns', 'SN', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (ipv4Validate('tf1_JpppoeSecDns', 'SN', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (ipv4Validate('tf1_JpppoeSecIpAddr', 'IP', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (validNetMask('tf1_JpppoeSecSubnet') == false) 
        return false;
        
    if (numericValueRangeCheck(document.getElementById('tf1_JpppoeSecMaxIdleTime'), '', '', 1, 10, true, LANG_LOCALE['11301'], '') == false) 
        return false;
    
    if (ipv4Validate('tf1_JpppoeSecPriDns', 'SN', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (ipv4Validate('tf1_JpppoeSecSecDns', 'SN', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (!validateMac('tf1_jpppoeSecMacAddr')) {
        return false;
    }
    var mtuObj=document.getElementById('tf1_jpppoeCustomMTU1');
    if(mtuObj.value != '' && !mtuObj.disabled){
    	if(numericValueRangeCheck (mtuObj, '', '', 1200, 1500, true, LANG_LOCALE['11239']+': ', LANG_LOCALE['10433'])==false)
    		return false;
    }
    return true;
}


/**
 * validating russia pppoe fields
 * @method rPppoeValidations
 */
function rPppoeValidations(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_RpppoeIpAddr,"+LANG_LOCALE['12028'];
    txtFieldIdArr[1] = "tf1_RpppoeSubnetMask,"+LANG_LOCALE['12032'];
    txtFieldIdArr[2] = "tf1_RpppoeUserName,"+LANG_LOCALE['12410'];
    txtFieldIdArr[3] = "tf1_RpppoePassword,"+LANG_LOCALE['12074'];
    txtFieldIdArr[4] = "tf1_RpppoeMaxIdleTime,"+LANG_LOCALE['12053'];
    txtFieldIdArr[5] = "tf1_RpppoePriDns,"+LANG_LOCALE['12091'];
    txtFieldIdArr[6] = "tf1_RpppoeSecDns,"+LANG_LOCALE['12108'];
    txtFieldIdArr[7] = "tf1_RpppoeMac,"+LANG_LOCALE['12048'];
    txtFieldIdArr[8] = "tf1_RpppoeDnsPriIpSrc,"+LANG_LOCALE['12028'];
    txtFieldIdArr[9] = "tf1_RpppoeIpSnet,"+LANG_LOCALE['12032'];
    txtFieldIdArr[10] = "tf1_RpppoeOp2IpDefGw,"+LANG_LOCALE['11984'];
    txtFieldIdArr[11] = "tf1_rpppoeCustomMTU1,"+LANG_LOCALE['11982'];

    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_RpppoeService,"+LANG_LOCALE['11232']; 
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv4Validate('tf1_RpppoeIpAddr', 'IP', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (validNetMask('tf1_RpppoeSubnetMask') == false) 
        return false;
        
    if (numericValueRangeCheck(document.getElementById('tf1_RpppoeMaxIdleTime'), '', '', 1, 10, true, LANG_LOCALE['11301'], '') == false) 
        return false;
    
    if (ipv4Validate('tf1_RpppoePriDns', 'SN', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (ipv4Validate('tf1_RpppoeSecDns', 'SN', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (!validateMac('tf1_RpppoeMac')) {
        return false;
    }
    
    if (ipv4Validate('tf1_RpppoeDnsPriIpSrc', 'IP', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (validNetMask('tf1_RpppoeIpSnet') == false) 
        return false;
    
    if (ipv4Validate('tf1_RpppoeOp2IpDefGw', 'IP', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (ipv4Validate('tf1_RpppoeOp2PriDns', 'SN', true, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (ipv4Validate('tf1_RpppoeOp2SecDns', 'SN', true, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
        
    var mtuObj=document.getElementById('tf1_rpppoeCustomMTU1');
    if(mtuObj.value != '' && !mtuObj.disabled){
    	if(numericValueRangeCheck (mtuObj, '', '', 1200, 1500, true, LANG_LOCALE['11239']+': ', LANG_LOCALE['10433'])==false)
    		return false;
    }

    return true;
}

/**
 * validating russia pptp fileds
 * @method rPptpValidations
 */
function rPptpValidations(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_RpptpIpaddr,"+LANG_LOCALE['12028'];
    txtFieldIdArr[1] = "tf1_RpptpSnet,"+LANG_LOCALE['12032'];
    txtFieldIdArr[2] = "tf1_RpptpIpGw,"+LANG_LOCALE['12031'];
    txtFieldIdArr[3] = "tf1_RpptpServAddr,"+LANG_LOCALE['12116'];
    txtFieldIdArr[4] = "tf1_RpptpUserName,"+LANG_LOCALE['12410'];
    txtFieldIdArr[5] = "tf1_RpptpPass,"+LANG_LOCALE['12074'];
    txtFieldIdArr[6] = "tf1_RpptpMaxIdleTime,"+LANG_LOCALE['12053'];
    txtFieldIdArr[7] = "tf1_RpptpPriDns,"+LANG_LOCALE['12091'];
    txtFieldIdArr[8] = "tf1_RpptpSecDns,"+LANG_LOCALE['12108'];
    txtFieldIdArr[9] = "tf1_RpptpMacAddr,"+LANG_LOCALE['12048'];
    txtFieldIdArr[10] = "tf1_rpptpCustomMTU1,"+LANG_LOCALE['11982'];
    //txtFieldIdArr[11] = "tf1_RpptpIpStaticDNSIP,"+LANG_LOCALE['50138'];

    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv4Validate('tf1_RpptpIpaddr', 'IP', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (validNetMask('tf1_RpptpSnet') == false) 
        return false;
    
    if (ipv4Validate('tf1_RpptpIpGw', 'IP', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (serverValidate('tf1_RpptpServAddr', 'tf1_RpptpIpStaticDNSIP') == false)
        return false;
    
    if (numericValueRangeCheck(document.getElementById('tf1_RpptpMaxIdleTime'), '', '', 1, 10, true, LANG_LOCALE['11301'], '') == false) 
        return false;
    
    if (ipv4Validate('tf1_RpptpPriDns', 'SN', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (ipv4Validate('tf1_RpptpSecDns', 'SN', true, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (!validateMac('tf1_RpptpMacAddr')) {
        return false;
    }
    var mtuObj=document.getElementById('tf1_rpptpCustomMTU1');
    if(mtuObj.value != '' && !mtuObj.disabled){
    	if(numericValueRangeCheck (mtuObj, '', '', 1200, 1500, true, LANG_LOCALE['11239']+': ', LANG_LOCALE['10433'])==false)
    		return false;
    }

    return true;
}

/**
 * validating russia l2tp fileds
 * @method rL2tpValidations
 */
function rL2tpValidations(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_RL2tpIpAddr,"+LANG_LOCALE['12028'];
    txtFieldIdArr[1] = "tf1_RL2tpSnet,"+LANG_LOCALE['12032'];
    txtFieldIdArr[2] = "tf1_RL2tpIpGw,"+LANG_LOCALE['12031'];
    txtFieldIdArr[3] = "tf1_RL2tpServerAddr,"+LANG_LOCALE['12116'];
    txtFieldIdArr[4] = "tf1_RL2tpUsername,"+LANG_LOCALE['12410'];
    txtFieldIdArr[5] = "tf1_RL2tpPassword,"+LANG_LOCALE['12074'];
    txtFieldIdArr[6] = "tf1_RL2tpMaxIdleTime,"+LANG_LOCALE['12053'];
    txtFieldIdArr[7] = "tf1_RL2tpPriDnsServer,"+LANG_LOCALE['12091'];
    txtFieldIdArr[8] = "tf1_RL2tpSecDnsServer,"+LANG_LOCALE['12108'];
    txtFieldIdArr[9] = "tf1_RL2tpMacAddr,"+LANG_LOCALE['12048'];
    txtFieldIdArr[10] = "tf1_rl2tpCustomMTU1,"+LANG_LOCALE['11982'];
    //txtFieldIdArr[11] = "tf1_RL2tpIpStaticDNSIP,"+LANG_LOCALE['50138'];

    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    txtFieldIdArr[txtFieldIdArr.length] = "tf1_RL2tpSecret,"+LANG_LOCALE['11232']; 
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv4Validate('tf1_RL2tpIpAddr', 'IP', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (validNetMask('tf1_RL2tpSnet') == false) 
        return false;
    
    if (ipv4Validate('tf1_RL2tpIpGw', 'IP', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (serverValidate('tf1_RL2tpServerAddr', 'tf1_RL2tpIpStaticDNSIP') == false)
        return false;
    
    if (numericValueRangeCheck(document.getElementById('tf1_RL2tpMaxIdleTime'), '', '', 1, 10, true, LANG_LOCALE['11301'], '') == false) 
        return false;
    
    if (ipv4Validate('tf1_RL2tpPriDnsServer', 'SN', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (ipv4Validate('tf1_RL2tpSecDnsServer', 'SN', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (!validateMac('tf1_RL2tpMacAddr')) {
        return false;
    }
    
    var mtuObj=document.getElementById('tf1_rl2tpCustomMTU1');
    if(mtuObj.value != '' && !mtuObj.disabled){
    	if(numericValueRangeCheck (mtuObj, '', '', 1200, 1500, true, LANG_LOCALE['11239']+': ', LANG_LOCALE['10433'])==false)
    		return false;
    }

    return true;
}

/**
 * wrapper for validating mac address
 * @method validateMac
 */
function validateMac(macId){
    var macObj = document.getElementById(macId);
    if (!macObj || macObj.disabled) 
        return true;
    if (!(macAddrValidate(macObj.value, true, "", '', macObj))) {
        macObj.focus();
        return false;
    }
    return true;
}
/**
 * Connection Type Change
 * Onchange Event
 * @method changeConnectionType
 * @param selName - select box name
 */
function changeConnectionType(selName){
	var selValue = comboSelectedValueGet (selName);
    var unitName = $("#hdUnitName").val();
    if (unitName == "DSR-150" || unitName == "DSR-150N" || unitName == "DSR-250" || unitName == "DSR-250N") {
        vlanFieldChange = true;
    }
    /* we enter else for the first time */
    if(vlanFieldChange == false)
        {   
        /* we get the orginal connection type when the page is loaded */
        OrgConTypeObj=document.getElementById('hdOrgConType');
        /* get the vlan ID for original connection */
        OrgvlanIDTypeObj=document.getElementById('hdVlanID');
        if ( OrgConTypeObj && (parseInt(OrgConTypeObj.value, 10) == parseInt(selValue, 10)))
            {
            /* get the vlan status for original connection */
            OrgvlanTypeObj=document.getElementById('tf1_hdenableVlan');
            /* if the vlan is enabled for the original connection */
            if(OrgvlanTypeObj && parseInt(OrgvlanTypeObj.value, 10) == 1)
                {
                $("#tf1_enableVlan").attr( "class", "enable-disable-on" );
                enableTextFieldByAnchorClick('tf1_enableVlan','tf1_wanVlanId','break_wanVlanId'); 
                }
            else
                {
                $("#tf1_enableVlan").attr( "class", "enable-disable-off" );
                enableTextFieldByAnchorClick('tf1_enableVlan','tf1_wanVlanId','break_wanVlanId'); 
                }
            }
        else
            {
            $("#tf1_enableVlan").attr( "class", "enable-disable-off" );
            enableTextFieldByAnchorClick('tf1_enableVlan','tf1_wanVlanId','break_wanVlanId'); 
            }
        $("#tf1_wanVlanId").attr( "value", OrgvlanIDTypeObj.value );
        }
    else
        {
        /* this is on load */
        vlanFieldChange = false;
        }
	if(!selValue)
		return false;	
	switch (parseInt(selValue, 10)){
		case 1:/* Static IP */
			 fieldStateChangeWr('', 'tf1_dhcpIsp_div tf1_pppoeIsp_div tf1_pptpIsp_div tf1_l2tpIsp_div tf1_jpppoeIsp_div tf1_rpppoeIsp_div tf1_rpptpIsp_div tf1_rl2tpIsp_div tf1_3GSettingsBlock_div', 'tf1_enableVlan', 'tf1_staticIsp_div');
             changeOptions('tf1_channe3DefaultMAC', '', 'tf1_staticMac_div', 'tf1_staticMac', 3);
			
			vidualDisplay ('tf1_staticIsp tf1_enableVlan', 'configRow');
			vidualDisplay ('break_vlanTag', 'break');
			vidualDisplay ('tf1_dhcpIsp tf1_pppoeIsp tf1_pptpIsp tf1_l2tpIsp tf1_jpppoeIsp tf1_rpppoeIsp tf1_rpptpIsp tf1_rl2tpIsp tf1_3GSettingsBlock', 'hide');
			portSetupChangeMode('tf1_staticPortSetupDefault','','tf1_staticCustomMTU1');
		break;
		case 2:/* Dynamic IP */
			fieldStateChangeWr('', 'tf1_staticIsp_div tf1_pppoeIsp_div tf1_pptpIsp_div tf1_l2tpIsp_div tf1_jpppoeIsp_div tf1_rpppoeIsp_div tf1_rpptpIsp_div tf1_rl2tpIsp_div tf1_3GSettingsBlock_div', 'tf1_enableVlan', 'tf1_dhcpIsp_div');
			changeOptions('tf1_channe2DefaultMac', '', 'tf1_dhcpMac_div', 'tf1_dhcpMac', 3);
            changeOptions('tf1_channelISP', '', 'tf1_dhcpDns_div', 'tf1_dhcpDns', 2);

			vidualDisplay ('tf1_dhcpIsp tf1_enableVlan', 'configRow');
			vidualDisplay ('break_vlanTag', 'break');
			vidualDisplay ('tf1_staticIsp tf1_pppoeIsp tf1_pptpIsp tf1_l2tpIsp tf1_jpppoeIsp tf1_rpppoeIsp tf1_rpptpIsp tf1_rl2tpIsp tf1_3GSettingsBlock', 'hide');
			portSetupChangeMode('tf1_dynamicPortSetupDefault','','tf1_dynamicCustomMTU1');
		break;	
		
		case 3:/* PPPoE */
			fieldStateChangeWr('', 'tf1_staticIsp_div tf1_dhcpIsp_div tf1_pptpIsp_div tf1_l2tpIsp_div tf1_jpppoeIsp_div tf1_rpppoeIsp_div tf1_rpptpIsp_div tf1_rl2tpIsp_div tf1_3GSettingsBlock_div', 'tf1_enableVlan', 'tf1_pppoeIsp_div');
            changeOptions('tf1_channe6DefaultMAC', '', 'tf1_pppoeMac_div', 'tf1_pppoeMac', 3);
            changeOptions('tf1_channe021ISP', '', 'tf1_pppoeDns_div', 'tf1_pppoeDns', 2);
            changeOptions('tf1_channe4Dynamic', '', 'tf1_addrModeIppppoe_div tf1_addrModeSnpppoe_div', 'tf1_addrModeIppppoe tf1_addrModeSnpppoe', 2);
            changeOptions('tf1_channe5AlwaysOn', '', 'tf1_reconnectModePppoe_div', 'tf1_reconnectModePppoe', 2);

			vidualDisplay ('tf1_pppoeIsp tf1_enableVlan', 'configRow');
			vidualDisplay ('break_vlanTag', 'break');
			vidualDisplay ('tf1_staticIsp tf1_dhcpIsp tf1_pptpIsp tf1_l2tpIsp tf1_jpppoeIsp tf1_rpppoeIsp tf1_rpptpIsp tf1_rl2tpIsp tf1_3GSettingsBlock', 'hide');
			portSetupChangeMode('tf1_pppoePortSetupDefault','','tf1_pppoeCustomMTU1');
		break;
		case 4:/* PPTP */
			fieldStateChangeWr('', 'tf1_staticIsp_div tf1_dhcpIsp_div tf1_pppoeIsp_div tf1_l2tpIsp_div tf1_jpppoeIsp_div tf1_rpppoeIsp_div tf1_rpptpIsp_div tf1_rl2tpIsp_div tf1_3GSettingsBlock_div', 'tf1_enableVlan', 'tf1_pptpIsp_div');
            
            changeOptions('tf1_channe8DefaultMAC', '', 'tf1_pptpMac_div', 'tf1_pptpMac', 3);
            changeOptions('tf1_channe04ISP', '', 'tf1_pptpDns_div', 'tf1_pptpDns', 2);
            changeOptions('tf1_channe7DynamicIP', '', 'tf1_addrModeIpPptp_div tf1_addrModeSnPptp_div tf1_addrModeGatewayPptp_div tf1_addrModeStaticDNSIPPptp_div', 'tf1_addrModeIpPptp tf1_addrModeSnPptp tf1_addrModeGatewayPptp tf1_addrModeStaticDNSIPPptp', 2);
            changeOptions('tf1_channe03AlwaysOn', '', 'tf1_reconnectModePptp_div', 'tf1_reconnectModePptp', 2);

			vidualDisplay ('tf1_pptpIsp tf1_enableVlan', 'configRow');
			vidualDisplay ('break_vlanTag', 'break');
			vidualDisplay ('tf1_staticIsp tf1_dhcpIsp tf1_pppoeIsp tf1_l2tpIsp tf1_jpppoeIsp tf1_rpppoeIsp tf1_rpptpIsp tf1_rl2tpIsp tf1_3GSettingsBlock', 'hide');
			portSetupChangeMode('tf1_pptpPortSetupDefault','','tf1_pptpCustomMTU1');

		break;
		case 5:/* L2TP */
			fieldStateChangeWr('', 'tf1_staticIsp_div tf1_dhcpIsp_div tf1_pppoeIsp_div tf1_pptpIsp_div tf1_jpppoeIsp_div tf1_rpppoeIsp_div tf1_rpptpIsp_div tf1_rl2tpIsp_div tf1_3GSettingsBlock_div', 'tf1_enableVlan', 'tf1_l2tpIsp_div');
            
            changeOptions('tf1_channe11DefaultMAC', '', 'tf1_l2tp_div', 'tf1_l2tp', 3);
            changeOptions('tf1_channel01ISP', '', 'tf1_l2tpDns_div', 'tf1_l2tpDns', 2);
            changeOptions('tf1_channe9Dynamic', '', 'tf1_addrModeIpL2tp_div tf1_addrModeSnL2tp_div tf1_addrModeGatewayL2tp_div tf1_addrModeStaticDNSIPL2tp_div', 'tf1_addrModeIpL2tp tf1_addrModeSnL2tp tf1_addrModeGatewayL2tp tf1_addrModeStaticDNSIPL2tp', 2);
            changeOptions('tf1_channe10AlwaysOn', '', 'tf1_reconnectModeL2tp_div', 'tf1_reconnectModeL2tp', 2);

			vidualDisplay ('tf1_l2tpIsp tf1_enableVlan', 'configRow');
			vidualDisplay ('break_vlanTag', 'break');
			vidualDisplay ('tf1_staticIsp tf1_dhcpIsp tf1_pppoeIsp tf1_pptpIsp tf1_jpppoeIsp tf1_rpppoeIsp tf1_rpptpIsp tf1_rl2tpIsp tf1_3GSettingsBlock', 'hide');
			portSetupChangeMode('tf1_l2tpPortSetupDefault','','tf1_l2tpCustomMTU1');

		break;
		case 6:/* Japanese PPPoE */
			fieldStateChangeWr('', 'tf1_staticIsp_div tf1_dhcpIsp_div tf1_pppoeIsp_div tf1_pptpIsp_div tf1_l2tpIsp_div tf1_rpppoeIsp_div tf1_rpptpIsp_div tf1_rl2tpIsp_div tf1_3GSettingsBlock_div', 'tf1_enableVlan', 'tf1_jpppoeIsp_div');
           
            changeOptions('tf1_channe18DefaultMAC', '', 'tf1_jpppoe_div', 'tf1_jpppoe', 3);
            changeOptions('tf1_channe14ISP', '', 'tf1_jpppoeDns_div', 'tf1_jpppoeDns', 2);
            changeOptions('tf1_channe12Dynamic', '', 'tf1_addrModeIpJpppoe_div tf1_addrModeSnJpppoe_div', 'tf1_addrModeIpJpppoe tf1_addrModeSnJpppoe', 2);
            changeOptions('tf1_channe13AlwaysOn', '', 'tf1_reconnectModeJpppoe_div', 'tf1_reconnectModeJpppoe', 2);
            changeOptions('tf1_channe15Dynamic', '', 'tf1_addrModeIpSecJpppoe_div tf1_addrModeSnSecJpppoe_div', 'tf1_addrModeIpSecJpppoe tf1_addrModeSnSecJpppoe', 2);
            changeOptions('tf1_channe16AlwaysOn', '', 'tf1_reconnectModeSecJpppoe_div', 'tf1_reconnectModeSecJpppoe', 2);
			changeOptions ('tf1_channe17ISP', '', 'tf1_secondpppoeDns_div', 'tf1_secondpppoeDns', 2);

			vidualDisplay ('tf1_jpppoeIsp tf1_enableVlan', 'configRow');
			vidualDisplay ('break_vlanTag', 'break');
			vidualDisplay ('tf1_staticIsp tf1_dhcpIsp tf1_pppoeIsp tf1_pptpIsp tf1_l2tpIsp tf1_rpppoeIsp tf1_rpptpIsp tf1_rl2tpIsp tf1_3GSettingsBlock', 'hide');
			portSetupChangeMode('tf1_jpppoePortSetup1','','tf1_jpppoeCustomMTU1');

		break;
		case 7:/* Russian PPPoE */
			fieldStateChangeWr('', 'tf1_staticIsp_div tf1_dhcpIsp_div tf1_pppoeIsp_div tf1_pptpIsp_div tf1_l2tpIsp_div tf1_jpppoeIsp_div tf1_rpptpIsp_div tf1_rl2tpIsp_div tf1_3GSettingsBlock_div', 'tf1_enableVlan', 'tf1_rpppoeIsp_div');
           
            changeOptions('tf1_channe22DefaultMAC', '', 'tf1_rpppoe_div', 'tf1_rpppoe', 3);
            changeOptions('tf1_channe30ISP', '', 'tf1_rpppoeDns_div', 'tf1_rpppoeDns', 2);
            changeOptions('tf1_channe24ISP', '', 'tf1_rpppoeOption2Dns_div', 'tf1_rpppoeOption2Dns', 2);
            changeOptions('tf1_channe19Dynamic', '', 'tf1_addrModeIpRpppoe_div tf1_addrModeSnRpppoe_div', 'tf1_addrModeIpRpppoe tf1_addrModeSnRpppoe', 2);
            changeOptions('tf1_channe20AlwaysOn', '', 'tf1_reconnectModeRpppoe_div', 'tf1_reconnectModeRpppoe', 2);
            changeOptions('tf1_channe23Dynamic', '', 'tf1_addrModeIpOpt2Rpppoe_div tf1_addrModeSnOpt2Rpppoe_div tf1_RpppoeOp2IpDefGw_div', 'tf1_addrModeIpOpt2Rpppoe tf1_addrModeSnOpt2Rpppoe tf1_RpppoeOp2IpDefGw', 2);
			vidualDisplay ('tf1_rpppoeIsp tf1_enableVlan', 'configRow');
			vidualDisplay ('break_vlanTag', 'break');
			vidualDisplay ('tf1_staticIsp tf1_dhcpIsp tf1_pppoeIsp tf1_pptpIsp tf1_l2tpIsp tf1_jpppoeIsp tf1_rpptpIsp tf1_rl2tpIsp tf1_3GSettingsBlock', 'hide');
			portSetupChangeMode('tf1_rpppoePortSetup1','','tf1_rpppoeCustomMTU1');

		break;
		case 8:/* Russian PPTP */
			fieldStateChangeWr('', 'tf1_staticIsp_div tf1_dhcpIsp_div tf1_pppoeIsp_div tf1_pptpIsp_div tf1_l2tpIsp_div tf1_jpppoeIsp_div tf1_rpppoeIsp_div tf1_rl2tpIsp_div tf1_3GSettingsBlock_div', 'tf1_enableVlan', 'tf1_rpptpIsp_div');
           
            changeOptions('tf1_channe27DefaultMAC', '', 'tf1_rpptp_div', 'tf1_rpptp', 3);
            changeOptions('tf1_channe26ISP', '', 'tf1_rpptpDns_div', 'tf1_rpptpDns', 2);
            changeOptions('tf1_channel019Dynamic', '', 'tf1_addrModeIpRpptp_div tf1_addrModeSnRpptp_div tf1_addrModeIpGatewayRpptp_div tf1_addrModeIpStaticDNSIPRpptp_div', 'tf1_addrModeIpRpptp tf1_addrModeSnRpptp tf1_addrModeIpGatewayRpptp tf1_addrModeIpStaticDNSIPRpptp', 2);
            changeOptions('tf1_channe25AlwaysOn', '', 'tf1_reconnectModeRpptp_div', 'tf1_reconnectModeRpptp', 2);

			vidualDisplay ('tf1_rpptpIsp tf1_enableVlan', 'configRow');
			vidualDisplay ('break_vlanTag', 'break');
			vidualDisplay ('tf1_staticIsp tf1_dhcpIsp tf1_pppoeIsp tf1_pptpIsp tf1_l2tpIsp tf1_jpppoeIsp tf1_rpppoeIsp tf1_rl2tpIsp tf1_3GSettingsBlock', 'hide');
			portSetupChangeMode('tf1_rpptpPortSetup1','','tf1_rpptpCustomMTU1');
		break;
		case 9:/* Russian L2TP */
			fieldStateChangeWr('', 'tf1_staticIsp_div tf1_dhcpIsp_div tf1_pppoeIsp_div tf1_pptpIsp_div tf1_l2tpIsp_div tf1_jpppoeIsp_div tf1_rpppoeIsp_div tf1_rpptpIsp_div tf1_3GSettingsBlock_div', 'tf1_enableVlan', 'tf1_rl2tpIsp_div');
           
            changeOptions('tf1_channe31DefaultMAC', '', 'tf1_rl2tp_div', 'tf1_rl2tp', 3);
            changeOptions('tf1_channe29ISP', '', 'tf1_rl2tpDns_div', 'tf1_rl2tpDns', 2);
            changeOptions('tf1_channe019Dynamic', '', 'tf1_addrModeIpRL2tp_div tf1_addrModeSnRL2tp_div tf1_addrModeIpGatewayRL2tp_div tf1_addrModeIpStaticDNSIPRL2tp_div', 'tf1_addrModeIpRL2tp tf1_addrModeSnRL2tp tf1_addrModeIpGatewayRL2tp tf1_addrModeIpStaticDNSIPRL2tp', 2);
            changeOptions('tf1_channe28AlwaysOn', '', 'tf1_reconnectModeRL2tp_div', 'tf1_reconnectModeRL2tp', 2);

			vidualDisplay ('tf1_rl2tpIsp tf1_enableVlan', 'configRow');
			vidualDisplay ('break_vlanTag', 'break');
			vidualDisplay ('tf1_staticIsp tf1_dhcpIsp tf1_pppoeIsp tf1_pptpIsp tf1_l2tpIsp tf1_jpppoeIsp tf1_rpppoeIsp tf1_rpptpIsp tf1_3GSettingsBlock', 'hide');
			portSetupChangeMode('tf1_rl2tpPortSetup1','','tf1_rl2tpCustomMTU1');

		break;
		case 10:/* 3G Internet */
			fieldStateChangeWr('tf1_enableVlan', 'tf1_staticIsp_div tf1_dhcpIsp_div tf1_pppoeIsp_div tf1_pptpIsp_div tf1_l2tpIsp_div tf1_jpppoeIsp_div tf1_rpppoeIsp_div tf1_rpptpIsp_div tf1_rl2tpIsp_div', '', 'tf1_3GSettingsBlock_div');
			vidualDisplay ('tf1_3GSettingsBlock', '');
			vidualDisplay ('tf1_enableVlan tf1_staticIsp tf1_dhcpIsp tf1_pppoeIsp tf1_pptpIsp tf1_l2tpIsp tf1_jpppoeIsp tf1_rpppoeIsp tf1_rpptpIsp tf1_rl2tpIsp break_vlanTag', 'hide');
			changeReconnectModeType('tf1_reconnectModeOnDemand');
			changeDNSServerSource('tf1_dnsServerSrc');
			portSetupChangeMode('tf1_3GPortSetupDefault','','tf1_3GCustomMTU1');
			enableTextFieldByAnchorClick('tf1_APN3GRequired','tf1_APN3G','break_APN3G');

		break;
	}
}

/****
 * This function calls when user selects an radio option
 * OnClick event
 * @method changeReconnectModeType
 * @param radioName - radio button Name
 */
function changeReconnectModeType(radioName){

	var selValue = radioCheckedValueGet(radioName);
	if (!selValue) return;	
    switch (parseInt(selValue, 10)){
	    case 1:	/* Always On */
	    	fieldStateChangeWr('tf1_maxIdleTime','','','');	    	
	    	vidualDisplay('tf1_maxIdleTime','hide');	 	    	   	
			vidualDisplay('break_maxIdleTime','hide');	
	    break;
	    case 2: /* On Demand */	    	    	
		   	fieldStateChangeWr('','','tf1_maxIdleTime','');	    	
	    	vidualDisplay('tf1_maxIdleTime','configRow');	    	  	
			vidualDisplay('break_maxIdleTime','break');	    
		break;	   
    }
}

/****
 * This function calls when user selects an radio option
 * OnClick event
 * @method changeDNSServerSource
 * @param selName - Selectbox Name
 */
function changeDNSServerSource(radioName){

	var selValue = radioCheckedValueGet(radioName);
	if (!selValue) return;	
    switch (parseInt(selValue, 10)){
	    case 1:	/* Get Dynamically from ISP */
	    	fieldStateChangeWr('tf1_primaryDNSServer tf1_secondaryDNSServer','','','');	    	
	    	vidualDisplay('tf1_primaryDNSServer tf1_secondaryDNSServer','hide');	 	    	   	
			vidualDisplay('break_primaryDNSServer break_secondaryDNSServer','hide');	
	    break;
	    case 2: /* Use These DNS Servers */	    	    	
		   	fieldStateChangeWr('','','tf1_primaryDNSServer tf1_secondaryDNSServer','');	    	
	    	vidualDisplay('tf1_primaryDNSServer tf1_secondaryDNSServer','configRow');	    	  	
			vidualDisplay('break_primaryDNSServer break_secondaryDNSServer','break');	    
		break;	   
    }
}

/**
 * This function calls when User select an radio option
 * @method portSetupChangeMode
 * @param radioName - Radio Button value
 * @param enableFld - Fields to be enabled
 * @param disableFld - Fields to be disabled
 */
function portSetupChangeMode(radioName, enableFld, disableFld){
    var selValue = radioCheckedValueGet(radioName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* Default */
            fieldStateChangeWr(disableFld, '', '')
            vidualDisplay(disableFld, 'hide');
            break;
        case 2: /* Custom */
            fieldStateChangeWr('', '', enableFld);
            vidualDisplay(enableFld, 'configRow');
            break;
    }
}

/**
 * This function calls when User selects Configurable Port
 * @method portSetupChangeMode
 * @param radioName - Radio Button value
 */
function changeConfigurablePort(radioName){
    var selValue = radioCheckedValueGet(radioName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* Option2 */
            fieldStateChangeWr('tf1_ipv4_addr tf1_snet tf1_lease_time tf1_ipv4_start tf1_ipv4_end tf1_wins_server tf1_domain tf1_ipv4_secondary tf1_ipv4_gateway tf1_ipv4_primary tf1_gateway tf1_domain', 'tf1_dhcpMode_div', 'tf1_connectionType tf1_StaticIp tf1_StaticSubnet tf1_StaticGateway tf1_StaticPriDns tf1_StaticPiSecDns tf1_staticPortSpeed', 'tf1_MACAddrSource_div tf1_CustomMTU_div')
            vidualDisplay('tf1_DMZSettingsBlock', 'hide');
            vidualDisplay('tf1_Option2SettingsBlock', 'configRow');
            changeConnectionType('tf1_connectionType');
            break;
        case 2: /* DMZ */
        case 3: /* LAN */
             fieldStateChangeWr('tf1_connectionType tf1_gateway', 'tf1_dhcpIsp_div tf1_staticIsp_div tf1_pppoeIsp_div tf1_pptpIsp_div tf1_l2tpIsp_div tf1_jpppoeIsp_div tf1_rpppoeIsp_div tf1_rpptpIsp_div tf1_rl2tpIsp_div tf1_3GSettingsBlock_div tf1_ipv4_addr tf1_snet tf1_lease_time tf1_ipv4_start tf1_ipv4_end tf1_wins_server tf1_domain tf1_ipv4_secondary tf1_ipv4_gateway tf1_ipv4_primary tf1_domain tf1_dhcpMode_div', '', '');
            
            vidualDisplay('tf1_DMZSettingsBlock', 'hide');
            vidualDisplay('tf1_Option2SettingsBlock', 'hide');
            
            break;
    }
}

/* DMZ Settings */

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
   // txtFieldIdArr[4] = "tf1_ipv4_gateway,Please enter a valid Default Gateway.";
    txtFieldIdArr[4] = "tf1_domain,"+LANG_LOCALE['12002'];
    txtFieldIdArr[5] = "tf1_lease_time,"+LANG_LOCALE['12041'];
    txtFieldIdArr[6] = "tf1_gateway,"+LANG_LOCALE['11966'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    if (ipv4Validate('tf1_ipv4_addr', 'IP', false, true, IP_ADDRESS, FOR_OCTET, true) == false) 
        return false;
    
    if (validNetMask('tf1_snet') == false) 
        return false;
    
    if (ipv4Validate('tf1_ipv4_start', 'IP', false, true, IP_ADDRESS, FOR_OCTET, true) == false) 
        return false;
    
    if (ipv4Validate('tf1_ipv4_end', 'IP', false, true, IP_ADDRESS, FOR_OCTET, true) == false) 
        return false;
    
    var gatewayObj = document.getElementById('tf1_ipv4_gateway'); 
    if (gatewayObj && !gatewayObj.disabled && gatewayObj.value != '') {
    if (ipv4Validate('tf1_ipv4_gateway', 'IP', true, true, IP_ADDRESS, FOR_OCTET, true) == false) 
        return false;
    }
    if (checkIPAddrRange () == false) {
        return false;
    }

    if (ipv4Validate('tf1_ipv4_primary', 'IP', true, true, IP_ADDRESS, FOR_OCTET, true) == false) 
        return false;

    if (ipv4Validate('tf1_ipv4_secondary', 'IP', true, true, IP_ADDRESS, FOR_OCTET, true) == false) 
        return false;
    
    if (ipv4Validate('tf1_wins_server', 'IP', true, true, IP_ADDRESS, FOR_OCTET, true) == false) 
        return false;
    
    if (ipv4Validate('tf1_gateway', 'IP', false, true, IP_ADDRESS, FOR_OCTET, true) == false) 
        return false;
    
    var leaseTimeObj = document.getElementById('tf1_lease_time');
    if (leaseTimeObj && !leaseTimeObj.disabled) {
        if (numericValueRangeCheck(leaseTimeObj, '', '', 1, 262800, true, INVALID_TIME, HOURS) == false) 
            return false;
    }

    var lanIpAddr = document.getElementById('tf1_ipv4_addr');	
    var lanIpAddrArr = lanIpAddr.value.split (".");
    var startIpObj = document.getElementById("tf1_ipv4_start");
    var endIpObj = document.getElementById("tf1_ipv4_end");
    if (!startIpObj.disabled && !endIpObj.disabled) {
        var startIpAddrArr = startIpObj.value.split (".");
        var endIpAddrArr = endIpObj.value.split (".");
        var end = 0;
        var start = 0;
        for (var i = 0; i <= 3; i++) {
            if (lanIpAddrArr[i] == startIpAddrArr[i]) {
                start++;
            }
            if (lanIpAddrArr[i] == endIpAddrArr[i]) {
                end++;
            }
        }
    if ((start == 4) || (end == 4)) {
            var errorstr = LANG_LOCALE['13718'];
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
function checkIPAddrRange () {
    var isDhcpEnabled = parseInt (radioCheckedValueGet ('tf1_radNtp1'), 10);
    if (isDhcpEnabled == 2) {
        var dhcpStart = getIPInt1 ('tf1_ipv4_start')
        var dhcpEnd = getIPInt1 ('tf1_ipv4_end');
        var dmzIpStr = getIPStr1('tf1_ipv4_addr');
        var dmzIpMaskStr = getIPStr1('tf1_snet');
        var dmzSubnetStr = dmzIpStr + "/" + dmzIpMaskStr;

        if (!isDhcpInSubnet ('tf1_ipv4_addr', 'tf1_snet', 'tf1_ipv4_start')) {
            var errorstr = LANG_LOCALE['12978'] + ": " + dmzSubnetStr;
            alert (errorstr);
            return false;
        }

        if (!isDhcpInSubnet ('tf1_ipv4_addr', 'tf1_snet', 'tf1_ipv4_end')) {
            var errorstr = LANG_LOCALE['10930'] + ": " + dmzSubnetStr;
            alert (errorstr);
            return false;
        }
        var gatewayObj = document.getElementById('tf1_ipv4_gateway'); 
        if (gatewayObj && !gatewayObj.disabled && gatewayObj.value != '') {
        if (!isDhcpInSubnet ('tf1_ipv4_addr', 'tf1_snet', 'tf1_ipv4_gateway')) {
            var errorstr = LANG_LOCALE['10686'] + ": " + dmzSubnetStr;
            alert (errorstr);
            return false;
        }
        }
   
        if (compareIP (dhcpStart, dhcpEnd) > 0) {
            var errorstr = LANG_LOCALE['10921'];
            alert (errorstr);
            return false;
        }

        if (compareIPRange (dhcpStart, dhcpEnd) == 0) {
            var errorstr = LANG_LOCALE['11393'];
            alert (errorstr);
            return false;
        }
    }
    return true;
}

function changeDhcpMode(radioId){
    var selValue = radioCheckedValueGet(radioId);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* None */
            fieldStateChangeWr('tf1_lease_time tf1_ipv4_start tf1_ipv4_end tf1_wins_server tf1_domain tf1_ipv4_secondary tf1_ipv4_gateway tf1_ipv4_primary tf1_gateway', '', '', '')
            vidualDisplay('tf1_lease_time tf1_ipv4_start tf1_ipv4_end tf1_wins_server tf1_domain tf1_ipv4_secondary tf1_ipv4_gateway tf1_ipv4_primary tf1_gateway tf1_dns_wins break4 break5 break6 break7 break8 break9 break10 break11 break12', 'hide');
            //vidualDisplay('', 'break');
            //vidualDisplay('tf1_domain', 'configRow')
            break;
            
        case 2: /* Dhcp Server */
            fieldStateChangeWr('tf1_gateway', '', 'tf1_ipv4_start tf1_ipv4_end tf1_domain tf1_ipv4_gateway tf1_lease_time tf1_ipv4_primary tf1_ipv4_secondary tf1_wins_server tf1_dns_wins')
            vidualDisplay('tf1_gateway', 'hide');
            vidualDisplay('tf1_lease_time tf1_ipv4_start tf1_ipv4_end tf1_wins_server tf1_domain tf1_ipv4_secondary tf1_ipv4_gateway tf1_ipv4_primary break4 break5 break6 break7 break8 break9 break10 break11', 'break');
            vidualDisplay('tf1_ipv4_start tf1_ipv4_end tf1_domain tf1_ipv4_gateway tf1_lease_time tf1_ipv4_primary tf1_ipv4_secondary tf1_wins_server tf1_dns_wins', 'configRow');
            
            enableTextFieldByAnchorClick('tf1_dns_wins','tf1_ipv4_primary tf1_ipv4_secondary tf1_wins_server','break9 break10 break11');
            break;
            
        case 3: /* Dhcp Relay */
            fieldStateChangeWr('tf1_lease_time tf1_ipv4_start tf1_ipv4_end tf1_wins_server tf1_domain tf1_ipv4_secondary tf1_ipv4_gateway tf1_ipv4_primary tf1_gateway tf1_ipv4_primary tf1_dns_wins', '', 'tf1_gateway');
            vidualDisplay('tf1_lease_time tf1_ipv4_start tf1_ipv4_end tf1_wins_server tf1_domain tf1_ipv4_secondary tf1_ipv4_gateway tf1_ipv4_primary tf1_gateway tf1_ipv4_primary tf1_dns_wins break9 break4 break5 break6 break8 break10 break11', 'hide');
            vidualDisplay('break9 break12', 'break');
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
    	case 'tf1_dns_wins':
    		enableTextFieldByAnchorClick('tf1_dns_wins','tf1_ipv4_primary tf1_ipv4_secondary tf1_wins_server','break9 break10 break11');    		
    	break;
	case 'tf1_APN3GRequired':
		enableTextFieldByAnchorClick('tf1_APN3GRequired','tf1_APN3G','break_APN3G');
	break; 
    case 'tf1_enableVlan':  		
        enableTextFieldByAnchorClick(imgId,'tf1_wanVlanId','break_wanVlanId'); 
	break; 
    }
}


function serverValidate (field1, field2) {
    
    var field1Obj = document.getElementById(field1);
    var field2Obj = document.getElementById(field2);
    if ((field1Obj && !(field1Obj.disabled)) && (field2Obj && !(field2Obj.disabled))) {
        var field1Val = field1Obj.value;

        var result = (ipv4ValidateWAN (field1, 'SN', false, true, INVALID_IP, FOR_OCTET, true)) ? (function (field2Obj) {
            var dnsIP = field2Obj.value;
            if (dnsIP.length > 0) {
                return (ipv4Validate (field2, 'SN', false, true, INVALID_IP, FOR_OCTET, true));
            } 
            
            return true;
            
        }(field2Obj)) : (function (fieldId) {
                var secondRes = (validateFQDN(fieldId)) ? (function (dnsIP) {
                    var dnsIPObj = document.getElementById(dnsIP);
                    if (dnsIPObj.value.length > 0) {
                        return (ipv4Validate (dnsIP, 'SN', false, true, INVALID_IP, FOR_OCTET, true));
                    } else {
                        alert(LANG_LOCALE['50138']);
                        return false;
                    }
                }(field2)) : false ;
                
                return secondRes;
        
        }(field1));

        return result;
    }

    return true;
}

function ipv4ValidateWAN(tblIPAddrId, ipv4AddrTypeStr, optFlag, alertFlag, prefixStr, suffixStr, octetShowFlag) {
    var errStr = ""
    var genErrStr = ""
    if (prefixStr) 
        errStr += "";
    if (ipv4AddrTypeStr == "SM")
        genErrStr = LANG_LOCALE['11366'];
    else 
        genErrStr = LANG_LOCALE['11281'];
    
    if (!tblIPAddrId) 
        return false;
    var obj = document.getElementById(tblIPAddrId);

    if (!obj || obj.disabled) 
        return true;

    if (obj.value == "" && !optFlag) {
        if (alertFlag) {
            alert(errStr + genErrStr);
        }
        return false;
    }
    else 
        if (obj.value == "" && optFlag) {
            return true;
        }

    
    if (obj.value.length > 15) {
        return false;
    }
    
    var objArr = obj.value.split(".");
    if (!objArr.length || objArr.length != 4) {
        return false;
    }
    
    /* Checking for invalid characters in IP address */
    for (var i = 0; i < objArr.length; i++) {
        var octet = objArr[i];
        if (octet == "" || isNaN(octet)) {
            return false;
        }
    }

    /* Checking for loop back IP address or not */
    var loopIP = objArr[0]+"."+objArr[1]+"."+objArr[2] 
    if (loopIP == "127.0.0")
	{
        return false;
	}
    
    return ipv4AddrValuesCheck(obj, objArr, ipv4AddrTypeStr, optFlag, alertFlag, prefixStr, suffixStr, octetShowFlag);
}
