/*
 * File: optionMode.js
 * Created on 7th Nov 2012 - Vivek
 * Copyright (c) 2012 TeamF1, Inc.
 * Copyright (c) 2008-2014, TeamF1 Networks Pvt. Ltd. 
 * (Subsidiary of D-Link India)
 * All rights reserved.
 */
/*
 * onload call
 */
window.onload = function(event){
    onloadCall();
    changeOptionMode('tf1_optionMode');
}

/****
 * This function calls when user selects an option from Policy Type
 * OnChange event
 * @method changeOptionMode
 * @param selName - Select box Name
 */
function changeOptionMode(selName){
	var selValue = comboSelectedValueGet (selName);
	var unitName = document.getElementById ('hdUnitName').value;
	var productId = document.getElementById ('hdProductID').value;
	if (!selValue) return;		
    switch (parseInt(selValue, 10)){
   	case 2: //Load Balancing
            fieldStateChangeWr('', 'tf1_autoRollOver_div tf1_singleOption_div', '', 'tf1_loadBalancing_div');
            vidualDisplay('tf1_autoRollOver tf1_singleOption', 'hide');
            vidualDisplay('tf1_loadBalancing', '');
            changeLoadBalancing('tf1_loadingBalSetup');
            $("#tf1_rolldnsoption option[value='0']").remove();
            $("#tf1_rolldnsoption").prepend('<option value="0">None</option>');
            break;
        case 1: //Auto Rollover
            fieldStateChangeWr('', 'tf1_loadBalancing_div tf1_singleOption_div', '', 'tf1_autoRollOver_div');
            vidualDisplay('tf1_loadBalancing tf1_singleOption', 'hide');
            vidualDisplay('tf1_autoRollOver', '');            
            $("#tf1_rolldnsoption option[value='0']").remove();            
            
            break;
        case 3: //Single Option
                    fieldStateChangeWr('', 'tf1_loadBalancing_div tf1_autoRollOver_div', '', 'tf1_singleOption_div');
                    vidualDisplay('tf1_autoRollOver tf1_loadBalancing', 'hide');
                    vidualDisplay('tf1_singleOption', '');
            break;
	}
    lookLoadDnsOptions('tf1_dnsoption');
    lookRollDnsOptions();
}

/**
 * on submit validation
 * @method modeValidate
 */
function modeValidate(){
    //Load Validation
    if (!loadBalanceValidations()) {
        return false;
    }
    
    //Auto Roll Validation
    if (!autoRollValidations()) {
        return false;
    }
    
    return true;
}

//Define Global variables
var FOR_OCTET = "for octet";

/**
 * validating load balancing fields
 * @method loadBalanceValidations
 */
function loadBalanceValidations(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_loadOption1,"+LANG_LOCALE['11998'];
    txtFieldIdArr[1] = "tf1_loadOption2,"+LANG_LOCALE['11999'];
    txtFieldIdArr[2] = "tf1_loadOption3,"+LANG_LOCALE['11200'];
    txtFieldIdArr[3] = "tf1_loadPingOption1,"+LANG_LOCALE['12077'];
    txtFieldIdArr[4] = "tf1_loadPingOption2,"+LANG_LOCALE['12078'];
    txtFieldIdArr[5] = "tf1_loadPingOption3,"+LANG_LOCALE['12079'];
    txtFieldIdArr[6] = "tf1_loadTolerance,"+LANG_LOCALE['12044'];
    txtFieldIdArr[7] = "tf1_maxBandwidth,"+LANG_LOCALE['12051'];
    txtFieldIdArr[8] = "tf1_AutoRetryInterval,"+LANG_LOCALE['30139'];
    txtFieldIdArr[9] = "tf1_AutoFailoverAfter,"+LANG_LOCALE['30140'];
    txtFieldIdArr[8] = "tf1_loadRetryInterval,"+LANG_LOCALE['30139'];
    txtFieldIdArr[9] = "tf1_loadFailOverAfter,"+LANG_LOCALE['30140'];

    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv4Validate('tf1_loadOption1', 'IP', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (ipv4Validate('tf1_loadOption2', 'IP', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (ipv4Validate('tf1_loadPingOption1', 'IP', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (ipv4Validate('tf1_loadPingOption2', 'IP', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (numericValueRangeCheck(document.getElementById('tf1_loadRetryInterval'), '', '', 5, 999, true, LANG_LOCALE['11337']+'. ', '') == false) 
        return false;
    
    if (numericValueRangeCheck(document.getElementById('tf1_loadFailOverAfter'), '', '', 2, 999, true, LANG_LOCALE['11261']+'. ', '') == false) 
        return false;
        
    if (numericValueRangeCheck(document.getElementById('tf1_loadTolerance'), '', '', 20, 80, true, LANG_LOCALE['11293']+'. ', '') == false) 
        return false;
    
    if (unitNameChecks () == false)
        return false;

    var dmzPortObj = document.getElementById('hddmzPort');
    var dmzPortObjVal;
    if(dmzPortObj) dmzPortObjVal = dmzPortObj.value;
    var wanMode = comboSelectedValueGet ('tf1_optionMode');
    if (dmzPortObjVal == "DMZ" && wanMode == "2") {
        alert(LANG_LOCALE['50048']);
        return false;
    }

    var loadObj = document.getElementById('hdloadbalanceMode');
    var selValue = radioCheckedValueGet('tf1_loadingBalSetup');
        
    if (selValue == '2') {
        var loadVal = loadObj.value;
        if (loadVal != selValue) {
            var proceed = confirm(LANG_LOCALE['50213']);

            if (proceed == false) {
                return false;
            }
        }
    }

    return true;
}

function unitNameChecks()
    {
    var maxBandwidthObj = document.getElementById ('tf1_maxBandwidth');
    var maxBandwidthUnitObj = document.getElementById ('tf1_selMaxBandwidthUnit');
    
    if(maxBandwidthObj && maxBandwidthUnitObj)
        {
        if( maxBandwidthUnitObj.value == "0" )
            {
            if (numericValueRangeCheck (maxBandwidthObj, '', '', 512, 8192, true, '', '') == false)
    	        return false;
            }
        else if ( maxBandwidthUnitObj.value == "1" )
            {
            if (numericValueRangeCheck (maxBandwidthObj, '', '', 1, 1024, true, '', '') == false)
    	        return false;
            }
        else 
            {
            if (numericValueRangeCheck (maxBandwidthObj, '', '', 1, 100, true, '', '') == false)
    	        return false;
            }        
        }
    return true;
    }


/**
 * validating rollover fields
 * @method autoRollValidations
 */
function autoRollValidations(){

    var txtFieldIdArr = new Array();
    var unitName = document.getElementById ('hdUnitName').value;
    if (unitName == "DSR-250N" || unitName == "DSR-250" || unitName == "DSR-150N" || unitName == "DSR-150") {
        txtFieldIdArr[0] = "tf1_AutoDnsOption1,"+LANG_LOCALE['50054'];
    }
    else {
        txtFieldIdArr[0] = "tf1_AutoDnsOption1,"+LANG_LOCALE['11998'];
    }
    txtFieldIdArr[1] = "tf1_AutoDnsOption2,"+LANG_LOCALE['11999'];
    txtFieldIdArr[2] = "tf1_AutoPingOption1,"+LANG_LOCALE['12077'];
    txtFieldIdArr[3] = "tf1_AutoPingOption2,"+LANG_LOCALE['12078'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv4Validate('tf1_AutoDnsOption1', 'IP', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (ipv4Validate('tf1_AutoDnsOption2', 'IP', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (ipv4Validate('tf1_AutoPingOption1', 'IP', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (ipv4Validate('tf1_AutoPingOption2', 'IP', false, true, INVALID_IP, FOR_OCTET, true) == false) 
        return false;
    
    if (numericValueRangeCheck(document.getElementById('tf1_AutoRetryInterval'), '', '', 5, 999, true, LANG_LOCALE['11337']+'. ', '') == false) 
        return false;
    
    if (numericValueRangeCheck(document.getElementById('tf1_AutoFailoverAfter'), '', '', 2, 999, true, LANG_LOCALE['11261']+'. ', '') == false) 
        return false;
    
    return true;
}

/**
 * onload call
 * @method lookLoadDnsOptions
 * @param dnsOptionName - load balance option
 */
function lookLoadDnsOptions(dnsOptionName){
    var dnsOptionVal = comboSelectedValueGet(dnsOptionName);
    switch (parseInt(dnsOptionVal, 10)){
    	case 1:
            //None
            fieldStateChangeWr( 'tf1_loadOption1 tf1_loadOption2 tf1_loadOption3 tf1_loadPingOption1 tf1_loadPingOption2 tf1_loadPingOption3 tf1_loadRetryInterval tf1_loadFailOverAfter', '', '', '');
            
            vidualDisplay('tf1_loadOption1 tf1_loadOption2 tf1_loadOption3 tf1_loadPingOption1 tf1_loadPingOption2 tf1_loadPingOption3 tf1_loadRetryInterval tf1_loadFailOverAfter','hide');   
                     
            vidualDisplay('break_loadOption1 break_loadOption2 break_loadOption3 break_loadPingOption1 break_loadPingOption2 break_loadPingOption3 break_loadRetryInterval break_loadFailOverAfter','hide');
            break;
    
        case 2:
            //WAN DNS Servers
            fieldStateChangeWr('tf1_loadOption1 tf1_loadOption2 tf1_loadOption3 tf1_loadPingOption1 tf1_loadPingOption2 tf1_loadPingOption3', '', 'tf1_loadRetryInterval tf1_loadFailOverAfter', '');
            
            vidualDisplay('tf1_loadOption1 tf1_loadOption2 tf1_loadOption3 tf1_loadPingOption1 tf1_loadPingOption2 tf1_loadPingOption3', 'hide');
            
             vidualDisplay('break_loadOption1 break_loadOption2 break_loadOption3 break_loadPingOption1 break_loadPingOption2 break_loadPingOption3', 'hide');
             
             vidualDisplay('tf1_loadRetryInterval tf1_loadFailOverAfter', 'configRow');
             vidualDisplay('break_loadRetryInterval break_loadFailOverAfter', 'break');
            break;
        case 3:
            //DNS Servers
            fieldStateChangeWr( 'tf1_loadPingOption1 tf1_loadPingOption2 tf1_loadPingOption3', '', 'tf1_loadOption1 tf1_loadOption2 tf1_loadOption3 tf1_loadRetryInterval tf1_loadFailOverAfter', '');
            
            vidualDisplay('tf1_loadPingOption1 tf1_loadPingOption2 tf1_loadPingOption3', 'hide');
            vidualDisplay('break_loadPingOption1 break_loadPingOption2 break_loadPingOption3', 'hide');

            vidualDisplay('tf1_loadOption1 tf1_loadOption2 tf1_loadOption3 tf1_loadRetryInterval tf1_loadFailOverAfter', 'configRow');
            
            vidualDisplay('break_loadOption1 break_loadOption2 break_loadOption3 break_loadRetryInterval break_loadFailOverAfter', 'break');
            break;
        case 4:
            //Ping These IP Addresses
            fieldStateChangeWr('tf1_loadOption1 tf1_loadOption2 tf1_loadOption3', '', 'tf1_loadPingOption1 tf1_loadPingOption2 tf1_loadPingOption3 tf1_loadRetryInterval tf1_loadFailOverAfter', '');
            
            vidualDisplay('tf1_loadOption1 tf1_loadOption2 tf1_loadOption3', 'hide');
            vidualDisplay('break_loadOption1 break_loadOption2 break_loadOption3', 'hide');
            
            vidualDisplay('tf1_loadPingOption1 tf1_loadPingOption2 tf1_loadPingOption3 tf1_loadRetryInterval tf1_loadFailOverAfter', 'configRow');
            vidualDisplay('break_loadPingOption1 break_loadPingOption2 break_loadPingOption3 break_loadRetryInterval break_loadFailOverAfter', 'break');
            break;
    }
}

/**
 * onload call
 * @method lookRollDnsOptions
 * @param dnsOptionName - auto roll over option
 */
function lookRollDnsOptions(){
    var rolloveroption = radioCheckedValueGet('tf1_rolloveroption1');
    var unitName = document.getElementById ('hdUnitName').value;
    var productId = document.getElementById ('hdProductID').value;
    updateSecWAN('WAN'+rolloveroption);
    selRollWanCheck ();
}

function selRollWanCheck () {

    var unitName = document.getElementById ('hdUnitName').value;
    var productId = document.getElementById ('hdProductID').value;
    var dnsOptionVal = document.getElementById('tf1_rolldnsoption').value;
    var rolloveroption = radioCheckedValueGet('tf1_rolloveroption1');
    switch (parseInt(dnsOptionVal , 10)){
        case 2:
            //WAN DNS Servers
            fieldStateChangeWr('tf1_AutoDnsOption1 tf1_AutoDnsOption2 tf1_AutoDnsOption3 tf1_AutoPingOption1 tf1_AutoPingOption2 tf1_AutoPingOption3', '', 'tf1_AutoRetryInterval tf1_AutoFailoverAfter', '');
            
            vidualDisplay('tf1_AutoDnsOption1 tf1_AutoDnsOption2 tf1_AutoDnsOption3 tf1_AutoPingOption1 tf1_AutoPingOption2 tf1_AutoPingOption3', 'hide');            
            vidualDisplay('break_AutoDnsOption1 break_AutoDnsOption2 break_AutoDnsOption3 break_AutoPingOption1 break_AutoPingOption2 break_AutoPingOption3', 'hide'); 
            
            vidualDisplay('tf1_AutoRetryInterval tf1_AutoFailoverAfter', 'configRow');
            vidualDisplay('break_AutoRetryInterval break_AutoFailoverAfter', 'break');
                       
            break;
        case 3:
            //DNS Servers
            fieldStateChangeWr('tf1_AutoPingOption1 tf1_AutoPingOption2 tf1_AutoPingOption3', '', '', '');
            vidualDisplay('tf1_AutoPingOption1 tf1_AutoPingOption2 tf1_AutoPingOption3', 'hide');
            vidualDisplay('break_AutoPingOption1 break_AutoPingOption2 break_AutoPingOption3', 'hide');

            if (rolloveroption == "1") {            	
                fieldStateChangeWr('tf1_AutoDnsOption2 tf1_AutoDnsOption3', '', 'tf1_AutoDnsOption1 tf1_AutoRetryInterval tf1_AutoFailoverAfter', '');
                vidualDisplay('tf1_AutoDnsOption2 tf1_AutoDnsOption3', 'hide');
                vidualDisplay('break_AutoDnsOption2 break_AutoDnsOption3', 'hide');
                
                vidualDisplay('tf1_AutoDnsOption1 tf1_AutoDnsOption1 tf1_AutoRetryInterval tf1_AutoFailoverAfter', 'configRow');
                vidualDisplay('break_AutoDnsOption1 break_AutoDnsOption1 break_AutoRetryInterval break_AutoFailoverAfter', 'break');      
                          
            }else if (rolloveroption == "2") {
                fieldStateChangeWr('tf1_AutoDnsOption1 tf1_AutoDnsOption3', '', 'tf1_AutoDnsOption2 tf1_AutoRetryInterval tf1_AutoFailoverAfter', '');
                vidualDisplay('tf1_AutoDnsOption1 tf1_AutoDnsOption3', 'hide');
                vidualDisplay('break_AutoDnsOption1 break_AutoDnsOption3', 'hide');
                vidualDisplay('tf1_AutoDnsOption2 tf1_AutoRetryInterval tf1_AutoFailoverAfter', 'configRow');
                vidualDisplay('break_AutoDnsOption2 break_AutoRetryInterval break_AutoFailoverAfter', 'break');
                
            }else {
                fieldStateChangeWr('tf1_AutoDnsOption1 tf1_AutoDnsOption2', '', 'tf1_AutoDnsOption3 tf1_AutoRetryInterval tf1_AutoFailoverAfter', '');
                vidualDisplay('tf1_AutoDnsOption1 tf1_AutoDnsOption2', 'hide');
                vidualDisplay('break_AutoDnsOption1 break_AutoDnsOption2', 'hide');
                
                vidualDisplay('tf1_AutoDnsOption3 tf1_AutoRetryInterval tf1_AutoFailoverAfter', 'configRow');
                vidualDisplay('break_AutoDnsOption3 break_AutoRetryInterval break_AutoFailoverAfter', 'break');
                
            }
        break;
        case 4:
            //Ping These IP Addresses 
            fieldStateChangeWr('tf1_AutoDnsOption1 tf1_AutoDnsOption2 tf1_AutoDnsOption3', '', '', '');
            vidualDisplay('tf1_AutoDnsOption1 tf1_AutoDnsOption2 tf1_AutoDnsOption3', 'hide');
            vidualDisplay('break_AutoDnsOption1 break_AutoDnsOption2 break_AutoDnsOption3', 'hide');
            
            //vidualDisplay('tf1_AutoPingOption1 tf1_AutoPingOption2', 'configRow');            
            if (rolloveroption == "1") {
                fieldStateChangeWr('tf1_AutoPingOption2 tf1_AutoPingOption3', '', 'tf1_AutoPingOption1 tf1_AutoRetryInterval tf1_AutoFailoverAfter', '');
                vidualDisplay('tf1_AutoPingOption2 tf1_AutoPingOption3', 'hide');
                vidualDisplay('break_AutoPingOption2 break_AutoPingOption3', 'hide');
                
                vidualDisplay('tf1_AutoPingOption1 tf1_AutoRetryInterval tf1_AutoFailoverAfter', 'configRow');
                vidualDisplay('break_AutoPingOption1 break_AutoRetryInterval break_AutoFailoverAfter', 'break');
                
            }else if (rolloveroption == "2") {
                fieldStateChangeWr('tf1_AutoPingOption1 tf1_AutoPingOption3', '', 'tf1_AutoPingOption2 tf1_AutoRetryInterval tf1_AutoFailoverAfter', '');
                vidualDisplay('tf1_AutoPingOption1 tf1_AutoPingOption3', 'hide');
                vidualDisplay('break_AutoPingOption1 break_AutoPingOption3', 'hide');
                
                vidualDisplay('tf1_AutoPingOption2 tf1_AutoRetryInterval tf1_AutoFailoverAfter', 'configRow');
                vidualDisplay('break_AutoPingOption2 break_AutoRetryInterval break_AutoFailoverAfter', 'break');
                
            }else {
                fieldStateChangeWr('tf1_AutoPingOption1 tf1_AutoPingOption2', '', 'tf1_AutoPingOption3 tf1_AutoRetryInterval tf1_AutoFailoverAfter', '');
                vidualDisplay('tf1_AutoPingOption1 tf1_AutoPingOption2', 'hide');
                vidualDisplay('break_AutoPingOption1 break_AutoPingOption2', 'hide');
                
                vidualDisplay('tf1_AutoPingOption3 tf1_AutoRetryInterval tf1_AutoFailoverAfter', 'configRow');
                vidualDisplay('break_AutoPingOption3 break_AutoRetryInterval break_AutoFailoverAfter', 'break');
            }
            break;
        default:
            break;
        }
    }
/**
 * function for removing To zone data
 * OnChange event
 * @method deleteOptions
 * @param selObj - ToZone
 */
function deleteOptions(selObj) {
	while (selObj.options.length != 0)
	selObj.options[0] = null;
}

/**
 * function for update Secondary WAN port 
 * OnChange event
 * @method updateToZones
 */
function updateSecWAN(rolloveroption) {
        var dmzPortObj = document.getElementById('hddmzPort');
        var dmzPortObjVal;
        var unitName = document.getElementById ('hdUnitName').value;
        var productId = document.getElementById ('hdProductID').value;
		var optionsList = ["WAN1","WAN2"];	
        
        if(dmzPortObj) dmzPortObjVal = dmzPortObj.value;
        if (dmzPortObjVal == "DMZ")
            {
		        if (productId == "DSR-1000AC_Ax" || productId == "DSR-1000_Bx" || unitName == "DSR-1000N" || unitName == "DSR-1000") 
                    {
                        optionsList = ["WAN1","WAN3"];
                    }
            }
        else
            {
	            if (productId == "DSR-1000AC_Ax" || productId == "DSR-1000_Bx" || unitName == "DSR-1000N" || unitName == "DSR-1000") 
                    {
                        optionsList = ["WAN1","WAN2","WAN3"];
                    }
            }
                    
        var wanSecObj = document.getElementById('tf1_rolloverSecondaryWAN');
        
        if (wanSecObj) {
	        deleteOptions (wanSecObj)	    
        }

	    for (idx=0, i =0; i < optionsList.length; i++)
		{
		    if (rolloveroption != optionsList[i])
			{			
			var optionName = optionsList[i];			
			wanSecObj.options [idx++] = new Option(optionName, optionsList[i], false, false);
			}
		}
	optionValueSelect ('tf1_rolloverSecondaryWAN','hdFailOver');	
}


/**
 * onload call
 * @method changeLoadBalancing
 * @param radioName - radioName option
 */
function changeLoadBalancing(radioName){
    var selValue = radioCheckedValueGet(radioName);
    if (!selValue) return;		
    switch (parseInt(selValue, 10)){
        case 1:  // Round Robin
            fieldStateChangeWr('tf1_loadTolerance tf1_maxBandwidth', '', '', '');
            vidualDisplay('tf1_spilloverConfigSetupBlock', 'hide');
            break;
        case 2:
            // Spillover Mode
            fieldStateChangeWr('', '', 'tf1_loadTolerance tf1_maxBandwidth', '');
            vidualDisplay('tf1_spilloverConfigSetupBlock', '');            
            break;
        
    }
}
