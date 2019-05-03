/*
 * File: ipv6Option1Settings.js
 * Created on 20th Nov 2012 - Vivek
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/*
 * onload call
 */
window.onload = function(event){   
    onloadCall();
    changeConnectionType('tf1_connectionType');
    changeAutoConfig('tf1_configStateless');
    pppoeSession('tf1_separateSession');
    changeDHCPOptionsFlds('tf1_dhcpOpt');
}
/*Function reset for cancel button

*/

function ispOnReset(frmId)
{
	resetImgOnOff(frmId);
	changeConnectionType('tf1_connectionType');
	changeAutoConfig('tf1_configStateless');
    pppoeSession('tf1_separateSession');
	changeDHCPOptionsFlds('tf1_dhcpOpt');
}

/**
 * Connection Type Change
 * Onchange Event
 * @method changeConnectionType
 * @param selName - select box name
 */
function changeConnectionType(selName ){
   var selValue = comboSelectedValueGet (selName);
	if(!selValue)
		return false;	
	switch (parseInt(selValue, 10)){
        case 1:
            //DHCP 
            fieldStateChangeWr('', 'tf1_staticIsp_div tf1_pppoeIsp_div', '', 'tf1_dhcpIsp_div');
            vidualDisplay('tf1_staticIsp tf1_pppoeIsp', 'hide');
            vidualDisplay('tf1_dhcpIsp', '');
            break;
        case 2: //Static 
            fieldStateChangeWr('', 'tf1_dhcpIsp_div tf1_pppoeIsp_div', '', 'tf1_staticIsp_div');
            vidualDisplay('tf1_dhcpIsp tf1_pppoeIsp', 'hide');
            vidualDisplay('tf1_staticIsp', '');
            break;
        case 3:
            //PPPOE
            fieldStateChangeWr('', 'tf1_staticIsp_div tf1_dhcpIsp_div', '', 'tf1_pppoeIsp_div');
            vidualDisplay('tf1_staticIsp tf1_dhcpIsp', 'hide');
            vidualDisplay('tf1_pppoeIsp', '');
            break;
        default:
            break;
            
    }
}

/**
 * on submit validation
 * @method ispValidate
 */
function ispValidate(frmId){
    //Static Validation
    if (!staticValidations()) {
        return false;
    }
    
    //Pppoe Validation
    if (!pppoeValidations()) {
        return false;
    }
    setHiddenChks(frmId);
    return true;
}

/**
 * validating static fileds
 * @method staticValidations
 */
function staticValidations(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_StaticIpAddr,"+LANG_LOCALE['12034'];
    txtFieldIdArr[1] = "tf1_StaticPreLen,"+LANG_LOCALE['12036'];
    txtFieldIdArr[2] = "tf1_StaticDefGateway,"+LANG_LOCALE['11985'];
    txtFieldIdArr[3] = "tf1_StaticPriDns,"+LANG_LOCALE['12091'];
    txtFieldIdArr[4] = "tf1_StaticSecDns,"+LANG_LOCALE['12108'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv6Validate('tf1_StaticIpAddr', false, true, '') == false) 
        return false;
    
    var preLenObj = document.getElementById('tf1_StaticPreLen');
    if (numericValueRangeCheck(preLenObj, '', '', 1, 128, true, '', '') == false) 
        return false;
    
    if (ipv6Validate('tf1_StaticDefGateway', false, true, '') == false) 
        return false;
    
    if (ipv6Validate('tf1_StaticPriDns', true, true, '') == false) 
        return false;
    
    if (ipv6Validate('tf1_StaticSecDns', true, true, '') == false) 
        return false;

    var ipv6Obj = document.getElementById("tf1_StaticIpAddr");

    if(ipv6Obj && !ipv6Obj.disabled){
    
    if(ipv6SubnetValidation1('tf1_StaticIpAddr','tf1_StaticPreLen','tf1_StaticDefGateway') == false)
        {
        alert(LANG_LOCALE['11390']);
        return false;
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
    txtFieldIdArr[0] = "tf1_pppoeUname,"+LANG_LOCALE['12410'];
    txtFieldIdArr[1] = "tf1_pppoePass,"+LANG_LOCALE['12074'];
    txtFieldIdArr[2] = "tf1_primaryDnsServer,"+LANG_LOCALE['12091'];
    txtFieldIdArr[3] = "tf1_secDnsServer,"+LANG_LOCALE['12108'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv6Validate('tf1_primaryDnsServer', false, true, '') == false) 
        return false;
    
    if (ipv6Validate('tf1_secDnsServer', false, true, '') == false) 
        return false;
    
    return true;
}

/**
 * Onclick Event
 * @method changeAutoConfig
 * @param radioId - Radio button Id
 */
function changeAutoConfig(radioId){
	var selValue = radioCheckedValueGet(radioId);
	if(!selValue)
		return false;	
	switch (parseInt(selValue, 10)){
        case 1:
            //Stateless Address 
            fieldStateChangeWr('', '', 'tf1_prefixDelegation', '');
            vidualDisplay('tf1_prefixDelegation', 'configRow');
            break;
        case 0: //Stateful Address 
            fieldStateChangeWr('tf1_prefixDelegation', '', '', '');
            vidualDisplay('tf1_prefixDelegation', 'hide');
            break;
    }
}

/**
 * Onclick Event
 * @method pppoeSession
 * @param radioId - Radio button Id
 */
function pppoeSession (radioId) {
	var selValue = radioCheckedValueGet(radioId);
	if(!selValue)
		return false;	
	switch (parseInt(selValue, 10)){
        case 1:
            //Separate Session 
            fieldStateChangeWr('', '', 'tf1_pppoeUname tf1_pppoePass', '');
            break;
        case 2: //Common Session
            fieldStateChangeWr('tf1_pppoeUname tf1_pppoePass', '', '', '');
            break;
    }
}
/**
 * Connection Type Change
 * Onchange Event
 * @method changeDHCPOptionsFlds
 * @param selName - select box name
 */
function changeDHCPOptionsFlds(selName ){
   var selValue = comboSelectedValueGet (selName);
	if(!selValue)
		return false;	
	switch (parseInt(selValue, 10)){
        case 0: //Disable DHCPv6
            fieldStateChangeWr('', '', 'tf1_primaryDnsServer tf1_secDnsServer', '');
            vidualDisplay('tf1_primaryDnsServer tf1_secDnsServer', 'configRow');
            vidualDisplay('break_primaryDnsServer break_secDnsServer', 'break');
            break;
        case 1: //Stateless DHCPv6
        case 2: //Stateful DHCPv6
        case 3: //Stateless DHCPv6 with Prefix Delegation
        case 4: //Stateful DHCPv6 with Prefix Delegation
            fieldStateChangeWr('tf1_primaryDnsServer tf1_secDnsServer', '', '', '');
            vidualDisplay('tf1_primaryDnsServer tf1_secDnsServer', 'hide');
            vidualDisplay('break_primaryDnsServer break_secDnsServer', 'hide');
            break;
    }
}

