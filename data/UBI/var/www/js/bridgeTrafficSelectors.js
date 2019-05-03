/*
 * File: bridgeTrafficSelectors.js
 * Created on 20th May 2014 - Ramakrishna Reddy
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
 
function onloadBridgeTrafficSelFn ()
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

/**
 * This function calls when user clicks on submit button
 * On submit validation
 * @method bridgeTrafficSelectorValidation
 */
function bridgeTrafficSelectorValidation (frmId){
    var txtValidArray = new Array();
    txtValidArray[0] = "tf1_ipAddress, "+LANG_LOCALE['12028'];
    txtValidArray[1] = "tf1_subnetMask, "+LANG_LOCALE['12133'];
    txtValidArray[2] = "tf1_txtMacAddr, "+LANG_LOCALE['12048'];
    
    if (txtFieldArrayCheck(txtValidArray) == false)
        return false;
        
    if (ipv4Validate('tf1_ipAddress', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
        
    if (validNetMask('tf1_subnetMask') == false)
        return false;
        
    var macObj = document.getElementById('tf1_txtMacAddr');
    if(macObj.value && !macObj.disabled){
	    if (!(macAddrValidate(macObj.value, true, "", '', macObj))) {
	        macObj.focus();
	        return false;
	    }
	}
        setHiddenChks(frmId);
    return true;
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
                                fieldStateChangeWr ('tf1_bridgeTrafficSelectorIn', '', 'tf1_bridgeTrafficSelectorOut','');
                                vidualDisplay('tf1_bridgeTrafficSelectorOut', 'configRow');
                                vidualDisplay('break_bridgeTrafficSelectorOut', 'break');
                                vidualDisplay('tf1_bridgeTrafficSelectorIn break_bridgeTrafficSelectorIn', 'hide');
                                optionCheck('tf1_bridgeTrafficSelectorOut');
                            }
                        if (boundVal == "1") //In Bound
                            {
                                fieldStateChangeWr ('tf1_bridgeTrafficSelectorOut', '', 'tf1_bridgeTrafficSelectorIn','');
                                vidualDisplay('tf1_bridgeTrafficSelectorIn', 'configRow');
                                vidualDisplay('break_bridgeTrafficSelectorIn', 'break');
                                vidualDisplay('tf1_bridgeTrafficSelectorOut break_bridgeTrafficSelectorOut', 'hide');
                                optionCheck('tf1_bridgeTrafficSelectorIn');
                            }
                    }
            }
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
            fieldStateChangeWr('tf1_txtMacAddr', '', 'tf1_ipAddress tf1_subnetMask', '');
            vidualDisplay('tf1_txtMacAddr', 'hide');
            vidualDisplay('break_txtMacAddr', 'hide');
            vidualDisplay('tf1_ipAddress tf1_subnetMask', 'configRow');
            vidualDisplay('break_ipAddress break_subnetMask', 'break');
            break;
            
        case 2: /* MAC Address */
            fieldStateChangeWr('tf1_ipAddress tf1_subnetMask', '', 'tf1_txtMacAddr', '');
            vidualDisplay('tf1_ipAddress tf1_subnetMask', 'hide');
            vidualDisplay('break_ipAddress break_subnetMask', 'hide');
            vidualDisplay('tf1_txtMacAddr', 'configRow');
            vidualDisplay('break_txtMacAddr', 'break');
            break;
    }
}
