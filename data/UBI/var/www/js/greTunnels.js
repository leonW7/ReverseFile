/*
 * File: policies.js    
 * Created on 4th Dec 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * This function calls Page loads
 * Onload validation
 * @method onloadCall
 */   
function onloadGreTunnelsFn () {
    onloadCall (enableDisableFieldsByImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
    }

function enableDisableFieldsByImageClick(data, thisObj) { 
    onAnchorToggle (data);
    }
/**
 * This function calls when user clicks on submit button.
 * OnSubmit validation
 * @method validateGreTunnelsConfig
 */
function validateGreTunnelsConfig() {
	var txtFieldIdArr = new Array();
	
	txtFieldIdArr[0] = "tf1_greTunnelName, "+LANG_LOCALE['12326'];	
	txtFieldIdArr[1] = "tf1_greTunnelIpAddress, "+LANG_LOCALE['12290'];
    txtFieldIdArr[2] = "tf1_greTunnelSubnetMask, "+LANG_LOCALE['12402'];
    txtFieldIdArr[3] = "tf1_greTunnelRemoteAddress, "+LANG_LOCALE['12355'];
    txtFieldIdArr[4] = "tf1_greTunnelIpAddress2, "+LANG_LOCALE['12290'];
    txtFieldIdArr[5] = "tf1_greTunnelSubnetMask2, "+LANG_LOCALE['12402'];
    txtFieldIdArr[6] = "tf1_greTunnelgatewayAddress, "+LANG_LOCALE['12277'];

    
    if (txtFieldArrayCheck(txtFieldIdArr) == false)
	    return false;
    
    if (ipv4AddrValidate (document.getElementById('tf1_greTunnelIpAddress'), 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if (validNetMask('tf1_greTunnelSubnetMask') == false) 
        return false;
        
    if (ipv4AddrValidate (document.getElementById('tf1_greTunnelRemoteAddress'), 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
        
        
    if (ipv4AddrValidate (document.getElementById('tf1_greTunnelIpAddress2'), 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if (validNetMask('tf1_greTunnelSubnetMask2') == false) 
        return false;
        
    if (ipv4AddrValidate (document.getElementById('tf1_greTunnelgatewayAddress'), 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
        
	setHiddenChks('tf1_frmGreTunnels');
    return true;
}
