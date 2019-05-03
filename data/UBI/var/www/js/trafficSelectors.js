/*
 * File: trafficSelectors.js
 * Created on 12th April 2014 - Ramakrishna Reddy
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
 
function onloadTrafficSelFn ()
    {
        onloadCall (enableDisableFieldsByImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
        checkProfileType ();
    }

/**
* displays corresponding fields on ImageToggle
* @method enableDisableFieldsByImageClick
* @param data - image data
* @param thisObj - currtent image id
*/
function enableDisableFieldsByImageClick(data, thisObj) { 
    onAnchorToggle (data);
}

function checkProfileType ()
    {
        var selProfileObj = document.getElementById ('tf1_profiles');
        if(selProfileObj)
            {
                var boundObj = document.getElementById ('tf1_profiles');
                if (boundObj)
                    {
                        var boundVal = $(boundObj).find('option:selected').attr('bound');
                        if (boundVal == "0") //Out Bound
                            {
                                fieldStateChangeWr ('tf1_trafficSelectorIn', '', 'tf1_trafficSelectorOut','');
                                vidualDisplay('tf1_trafficSelectorOut', 'configRow');
                                vidualDisplay('break_trafficSelectorOut', 'break');
                                vidualDisplay('tf1_trafficSelectorIn break_trafficSelectorIn', 'hide');
                                optionCheck('tf1_trafficSelectorOut');
                            }
                        if (boundVal == "1") //In Bound
                            {
                                fieldStateChangeWr ('tf1_trafficSelectorOut', '', 'tf1_trafficSelectorIn','');
                                vidualDisplay('tf1_trafficSelectorIn', 'configRow');
                                vidualDisplay('break_trafficSelectorIn', 'break');
                                vidualDisplay('tf1_trafficSelectorOut break_trafficSelectorOut', 'hide');
                                optionCheck('tf1_trafficSelectorIn');
                            }
                    }
            }
    }
/**
 * This function calls when user clicks on submit button
 * On submit validation
 * @method trafficSelectorValidation
 */
function trafficSelectorValidation(){
    var txtValidArray = new Array();
    txtValidArray[0] = "tf1_ipAddress, "+LANG_LOCALE['12028'];
    txtValidArray[1] = "tf1_subnetMask, "+LANG_LOCALE['12133'];
    txtValidArray[2] = "tf1_txtMacAddr, "+LANG_LOCALE['12048'];
    
    if (txtFieldArrayCheck(txtValidArray) == false)
        return false;
        
    var txtIpAddrObj = document.getElementById ('tf1_ipAddress');
    var txtSubnetMaskObj = document.getElementById ('tf1_subnetMask');

    if (ipv4Validate('tf1_ipAddress', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
              return false;
       

    if (txtIpAddrObj && txtIpAddrObj.value != '0.0.0.0' || txtSubnetMaskObj.value != '0') { 
           if (validNetMask('tf1_subnetMask') == false)
              return false;
    }
        
    var macObj = document.getElementById('tf1_txtMacAddr');
    if(macObj.value && !macObj.disabled){
	    if (!(macAddrValidate(macObj.value, true, "", '', macObj))) {
	        macObj.focus();
	        return false;
	    }
	}
    return true;
}

/**
 * function for changing the mode settings of radio buttons
 * Onclick event
 * @method ChangePolicyType
 * @param radioName - Radio button name
 */
function optionCheck(selName){
    var selValue = comboSelectedValueGet(selName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* IP Address */
            fieldStateChangeWr('tf1_txtMacAddr tf1_portNumberOut tf1_portNumberIn tf1_bssid tf1_vlanId tf1_bssid', '', 'tf1_ipAddress tf1_subnetMask', '');
            vidualDisplay('tf1_txtMacAddr tf1_portNumberOut tf1_portNumberIn tf1_bssid tf1_vlanId', 'hide');
            vidualDisplay('break_txtMacAddr break_portNumberOut break_portNumberIn break_bssid break_vlanId', 'hide');
            vidualDisplay('tf1_ipAddress tf1_subnetMask', 'configRow');
            vidualDisplay('break_ipAddress break_subnetMask', 'break');
            break;
            
        case 2: /* MAC Address */
            fieldStateChangeWr('tf1_ipAddress tf1_subnetMask tf1_portNumberOut tf1_portNumberIn tf1_bssid tf1_vlanId tf1_bssid', '', 'tf1_txtMacAddr', '');
            vidualDisplay('tf1_ipAddress tf1_subnetMask tf1_portNumberOut tf1_portNumberIn tf1_bssid tf1_vlanId', 'hide');
            vidualDisplay('break_ipAddress break_subnetMask break_portNumberOut break_portNumberIn break_bssid break_vlanId', 'hide');
            vidualDisplay('tf1_txtMacAddr', 'configRow');
            vidualDisplay('break_txtMacAddr', 'break');
            break;
       
       case 3: /* Port Number */
            fieldStateChangeWr('tf1_ipAddress tf1_subnetMask tf1_txtMacAddr tf1_portNumberIn tf1_bssid tf1_vlanId tf1_bssid', '', 'tf1_portNumberOut', '');
            vidualDisplay('tf1_ipAddress tf1_subnetMask tf1_txtMacAddr tf1_portNumberIn tf1_bssid tf1_vlanId', 'hide');
            vidualDisplay('break_ipAddress break_subnetMask break_txtMacAddr break_portNumberIn break_bssid break_vlanId', 'hide');
            vidualDisplay('tf1_portNumberOut', 'configRow');
            vidualDisplay('break_portNumberOut', 'break');
            break;
            
        case 4: /* VLAN */
            fieldStateChangeWr('tf1_ipAddress tf1_subnetMask tf1_txtMacAddr tf1_portNumberOut tf1_portNumberIn tf1_bssid', '', 'tf1_vlanId', '');
            vidualDisplay('tf1_ipAddress tf1_subnetMask tf1_txtMacAddr tf1_portNumberOut tf1_portNumberIn tf1_bssid', 'hide');
            vidualDisplay('break_ipAddress break_subnetMask break_txtMacAddr break_portNumberOut break_portNumberIn break_bssid', 'hide');
            vidualDisplay('tf1_vlanId', 'configRow');
            vidualDisplay('break_vlanId', 'break');
            break;
            
		case 6: /* BSSID */
            fieldStateChangeWr('tf1_ipAddress tf1_subnetMask tf1_txtMacAddr tf1_portNumberOut tf1_portNumberIn tf1_vlanId', '', 'tf1_bssid', '');
            vidualDisplay('tf1_ipAddress tf1_subnetMask tf1_txtMacAddr tf1_portNumberOut tf1_portNumberIn tf1_vlanId', 'hide');
            vidualDisplay('break_ipAddress break_subnetMask break_txtMacAddr break_portNumberOut break_portNumberIn break_vlanId', 'hide');
            vidualDisplay('tf1_bssid', 'configRow');
            vidualDisplay('break_bssid', 'break');
            break;
    }
}




