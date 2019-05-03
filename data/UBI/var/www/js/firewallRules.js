/*
 * File: firewallRules.js
 * Created on 26th Nov 2012 - Laxmi
 * Modified on 30th Nov 2012 - Laxmi
 * Copyright (c) 2008-2014, TeamF1 Networks Pvt. Ltd.
   (Subsidiary of D-Link India)
 * All rights reserved.
 */


/**
 * Selects the right option from the dropdown
 * @method optionValueSelect
 * @param selObjId dropdown whose value should be set
 * @param fldId Id of field whose value matches with dropdown value
 */
function optionValueSelectByValue (selObjId, selVal){
    if (!selObjId) 
        return;
    var selObj = document.getElementById(selObjId);
    if (!selObj) 
        return;
   
    var valueToSelect = selVal;
    var idx = 0;
    for (idx = 0; idx < selObj.options.length; ++idx) {
        if (selObj.options[idx].value == valueToSelect) 
            break;
    }
    if (idx != selObj.options.length) 
        selObj.selectedIndex = idx;
    return;
}

/**
 * Selects the right value and field based on onload values
 * @method onloadFirewallRulesFn
 */

function onloadFirewallRulesFn() {
    onloadCall (enableDisableFieldsByImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
	enableTextFieldByAnchorClick('tf1_chkTranslatePortNum','tf1_txtTranslatePortNum','break20'); 
    dropFieldSelectSrc ('tf1_addFwSrcUser1');
    dropFieldSelectDest ('tf1_addFwDestUser1');
	updateToZones();
    var selToZoneObj = document.getElementById("tf1_toZone")
    var selToZoneVal = selToZoneObj.value;
    optionValueSelectByValue ('tf1_toZone',selToZoneVal);
    fwRuleTypeCheck ();
    fwRuleVlanSelect ();
    var unitName = document.getElementById ('hdUnitName').value;

    if(unitName == "DSR-250N" && unitName == "DSR-250" && unitName == "DSR-150N" && unitName == "DSR-150")
        {
            snatInterfaces ();
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
		case 'tf1_chkTranslatePortNum':
			enableTextFieldByAnchorClick(imgId,'tf1_txtTranslatePortNum','break20');
			break;
	}
    	
}

/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method firewallRulesValidate
 */
function firewallRulesValidate(frmId) {
	var txtFieldIdArr = new Array();
	txtFieldIdArr[0] = "tf1_selSchedule,"+LANG_LOCALE['11948'];
	txtFieldIdArr[1] = "tf1_txtFwSrcUserStart,"+LANG_LOCALE['12382'];
	txtFieldIdArr[2] = "tf1_txtFwSrcUserFinish,"+LANG_LOCALE['12384'];
	txtFieldIdArr[3] = "tf1_txtFwDestUserStart,"+LANG_LOCALE['12250'];
	txtFieldIdArr[4] = "tf1_txtFwDestUserFinish,"+LANG_LOCALE['12253'];
	txtFieldIdArr[5] = "tf1_txtFwLanServer,"+LANG_LOCALE['12288'];
	txtFieldIdArr[6] = "tf1_txtTranslatePortNum,"+LANG_LOCALE['12409'];

	if (txtFieldArrayCheck(txtFieldIdArr) == false)
		return false;
		
	if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;

	if (numericValueRangeCheck(document.getElementById('tf1_txtTranslatePortNum'), '', '', 0, 65535, true, LANG_LOCALE['11316'], '') == false)
		return false;

	if (ipv4Validate('tf1_sourceHostFrom', 'NSN', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
		return false;

	if (ipv4Validate('tf1_txtFwSrcUserFinish', 'NSN', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
		return false;

	if (ipRangeValidate('tf1_txtFwSrcUserStart', 'tf1_txtFwSrcUserFinish') == false)
		return false;

	if (ipv4Validate('tf1_txtFwDestUserStart', 'NSN', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
		return false;

	if (ipv4Validate('tf1_txtFwDestUserFinish', 'NSN', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
		return false;

	if (ipRangeValidate('tf1_txtFwDestUserStart', 'tf1_txtFwDestUserFinish') == false)
		return false;

	if (ipv4Validate('tf1_txtFwLanServer', 'NSN', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
		return false;
		

    // same vlan name check 
    var vlanFrom = document.getElementById('tf1_availableFromVLAN');
    var vlanTo = document.getElementById('tf1_availableToVLAN');
    if (vlanFrom && vlanFrom.disabled == false && vlanTo.disabled == false){
       if ( vlanFrom.value == vlanTo.value )
        {
            alert(LANG_LOCALE['11045']);
            return false;
        }
    }

    setHiddenChks(frmId); 		
	return true;
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
 * function for update To zone based on From Zone
 * OnChange event
 * @method updateToZones
 */
var zonesLst1 = ["SECURE","INSECURE","PUBLIC"]
function updateToZones() {
	var fromZoneVal = comboSelectedValueGet('tf1_fromZone');
	if (!fromZoneVal)
		return;
	var toZoneObj = document.getElementById('tf1_toZone');
	if (!toZoneObj)
		return;
	var unitName = document.getElementById ('hdUnitName').value;
	var productId = document.getElementById ('hdProductId').value;

	    zonesLst = zonesLst1;

	deleteOptions(toZoneObj);
	for (idx=0, i =0; i < zonesLst.length; i++)
		{
		if (fromZoneVal != zonesLst[i])
			{
			var zoneName = "";
			if (zonesLst[i] == "SECURE")
				{
				zoneName = "SECURE";
				zoneName += " (LAN)"
				}
			else if (zonesLst[i] == "INSECURE")
				{
				zoneName = "INSECURE";
			    if(unitName == 'DSR-1000' || unitName == 'DSR-1000N' || productId == "DSR-1000AC_Ax" || productId == "DSR-1000_Bx")
			         zoneName += " (Dedicated WAN/Configurable WAN/WAN3 (Mobile Internet))"
			    else
                    		zoneName += " (Dedicated WAN/Configurable WAN)"
                	}
			else if (zonesLst[i] == "PUBLIC")			
				zoneName = "DMZ"			
			toZoneObj.options [idx++] = new Option(zoneName, zonesLst[i], false, false);
			}
		}
	toZoneObj.options [idx++] = new Option("SECURE (VLAN)", "SECURE_VLAN", false, false);
	var selToZoneObj = document.getElementById("hdToZoneType");
    var selToZoneVal = selToZoneObj.value;
   	optionValueSelectByValue ('tf1_toZone',selToZoneVal);
	fwRuleTypeCheck ();
   	fwRuleVlanSelect ();
}

function fwRuleTypeCheck ()
	{
	var selFromZone = comboSelectedValueGet ('tf1_fromZone');
	var selToZone = comboSelectedValueGet ('tf1_toZone');
	var ruleTypeObj = document.getElementById ('hdRuleType');
	if (!selFromZone || !selToZone || !ruleTypeObj) return false;
	if (((selFromZone == "SECURE" || selFromZone == "SECURE_VLAN") && selToZone == "INSECURE") || (selFromZone == "PUBLIC" && selToZone == "INSECURE"))
		{
		fieldStateChangeWr ('tf1_txtFwLanServer tf1_chkTranslatePortNum tf1_txtTranslatePortNum tf1_selPublicDstIpAddr', '', 'tf1_selNATIP tf1_selSnat tf1_selQos', '');

		vidualDisplay('tf1_destinationNATSettings tf1_txtFwLanServer tf1_chkTranslatePortNum tf1_txtTranslatePortNum tf1_selPublicDstIpAddr', 'hide');
		vidualDisplay('break19 break20 break21 break22', 'hide');

		vidualDisplay('tf1_sourceNATSettings tf1_selNATIP tf1_selSnat tf1_selQos', 'configRow');
		vidualDisplay('break16 break18 break15', 'break');

		ruleTypeObj.value = "1"
		}
	else if ((selFromZone == "INSECURE" && (selToZone == "SECURE" || selToZone == "SECURE_VLAN" )) || (selFromZone == "INSECURE" && selToZone == "PUBLIC"))
		{
		fieldStateChangeWr ('tf1_selNATIP tf1_selSnat tf1_selQos', ' ', 'tf1_txtFwLanServer tf1_chkTranslatePortNum tf1_txtTranslatePortNum tf1_selPublicDstIpAddr', '');

		vidualDisplay('tf1_destinationNATSettings tf1_txtFwLanServer tf1_chkTranslatePortNum tf1_txtTranslatePortNum tf1_selPublicDstIpAddr', 'configRow');
		vidualDisplay('break19 break20 break21 break22', 'break');

		vidualDisplay('tf1_sourceNATSettings tf1_selNATIP tf1_selSnat tf1_selQos', 'hide');
		vidualDisplay('break16 break18 break15', 'hide');

		ruleTypeObj.value = "2";
		}
	else
		{
		fieldStateChangeWr ('tf1_txtFwLanServer tf1_chkTranslatePortNum tf1_txtTranslatePortNum tf1_selPublicDstIpAddr tf1_selNATIP tf1_selSnat tf1_selQos', '', '', '');

		vidualDisplay('tf1_destinationNATSettings tf1_txtFwLanServer tf1_chkTranslatePortNum tf1_txtTranslatePortNum tf1_selPublicDstIpAddr tf1_sourceNATSettings tf1_selNATIP tf1_selSnat tf1_selQos', 'hide');
		vidualDisplay('break19 break20 break21 break22 break16 break18 break15', 'hide');

		ruleTypeObj.value = "3"		
		}

	//Changing the Source and Destination Users Names
	if ((selFromZone == "INSECURE" && (selToZone == "SECURE" || selToZone == "SECURE_VLAN" )) || (selFromZone == "INSECURE" && selToZone == "PUBLIC"))
		{
			fieldStateChangeWr ('tf1_txtFwDestUserStart tf1_txtFwDestUserFinish', 'tf1_addFwDestUser', '', '');
			vidualDisplay('tf1_txtFwDestUserStart tf1_txtFwDestUserFinish tf1_addFwDestUser', 'hide');
			vidualDisplay('break11 break12 break13', 'hide');
		}
	else
		{
			fieldStateChangeWr ('', '', 'tf1_txtFwDestUserStart tf1_txtFwDestUserFinish', 'tf1_addFwDestUser');
			vidualDisplay('tf1_txtFwDestUserStart tf1_txtFwDestUserFinish tf1_addFwDestUser', 'configRow');
			vidualDisplay('break11 break12 break13', 'break');
			dropFieldSelectDest ('tf1_addFwDestUser1');
		}
	updateVlanAvailability (selFromZone, selToZone);
	fwActionCheck ();
	}

/****
 * This function calls when user selects an option from select box
 * OnChange event
 * @method fwActionCheck
 * @param selName - Select box Name
 */
function fwActionCheck() {
	var selectedValue = comboSelectedValueGet("tf1_selFwAction");
	if (!selectedValue) return;
	var ruleTypeObj = document.getElementById ('hdRuleType');
	if (!ruleTypeObj) return;
	var unitName = document.getElementById ('hdUnitName').value;
	if (ruleTypeObj.value == "1")
		{
			if (selectedValue == "2")
			{
			fieldStateChangeWr ('tf1_selSchedule','','tf1_selNATIP','');
			vidualDisplay('tf1_selSchedule break7', 'hide');
			vidualDisplay('tf1_sourceNATSettings tf1_selNATIP', 'configRow');
			vidualDisplay('break18 break16', 'break');
			dropFieldSelectNAT('tf1_selNATIP1');
                            if(unitName == "DSR-250N" || unitName == "DSR-250" || unitName == "DSR-150N" || unitName == "DSR-150")
                            {
                                fwCheckRoutingModeEcona ();
                            }
                            else
                            {
			                    fwCheckRoutingMode ();
			                    snatInterfaces ();
                            }
			}
		else if (selectedValue == "4" || selectedValue == "3")
			{
			fieldStateChangeWr ('','','tf1_selSchedule tf1_selNATIP','');
			vidualDisplay('tf1_selSchedule tf1_sourceNATSettings tf1_selNATIP', 'configRow');
			vidualDisplay('break7 break18 break16', 'break');
			dropFieldSelectNAT('tf1_selNATIP1');
                            if(unitName == "DSR-250N" || unitName == "DSR-250" || unitName == "DSR-150N" || unitName == "DSR-150")
                            {
                                fwCheckRoutingModeEcona ();
                            }
                            else
                            {
			        fwCheckRoutingMode ();
			        snatInterfaces ();
                            }
			}
		else
			{
				fieldStateChangeWr ('tf1_selSchedule tf1_selNATIP tf1_selSnat',' ','','');
				vidualDisplay('tf1_selSchedule tf1_selNATIP tf1_selSnat tf1_sourceNATSettings', 'hide');
				vidualDisplay('break7 break16 break18', 'hide');
			}
		fieldStateChangeWr ('', '', 'tf1_addFwSrcUser', '');
		vidualDisplay('tf1_addFwSrcUser', 'configRow');
		vidualDisplay('break8', 'break');
		dropFieldSelectSrc ('tf1_addFwSrcUser1');		
		}
	else if (ruleTypeObj.value == "2")
		{
		if (selectedValue == "2")
			{
			fieldStateChangeWr ('tf1_selSchedule','','tf1_txtFwLanServer tf1_chkTranslatePortNum','');
			vidualDisplay('tf1_selSchedule break7', 'hide');

			vidualDisplay('tf1_destinationNATSettings tf1_txtFwLanServer tf1_chkTranslatePortNum', 'configRow');
			enableTextFieldByAnchorClick('tf1_chkTranslatePortNum','tf1_txtTranslatePortNum','break20'); 
			vidualDisplay('break19', 'break');
			checkService ();
			}
		else if (selectedValue == "4" || selectedValue == "3")
			{
			fieldStateChangeWr ('','','tf1_selSchedule tf1_txtFwLanServer tf1_chkTranslatePortNum','');
			vidualDisplay('tf1_selSchedule tf1_destinationNATSettings tf1_txtFwLanServer tf1_chkTranslatePortNum', 'configRow');
			enableTextFieldByAnchorClick('tf1_chkTranslatePortNum','tf1_txtTranslatePortNum','break20'); 
			vidualDisplay('break7 break19', 'break');
			checkService ();
			}
		else
			{
			fieldStateChangeWr ('tf1_selSchedule tf1_txtFwLanServer tf1_chkTranslatePortNum tf1_txtTranslatePortNum','','','');
			vidualDisplay('tf1_selSchedule tf1_txtFwLanServer tf1_chkTranslatePortNum tf1_txtTranslatePortNum', 'hide');
			vidualDisplay('break7 break19 break20', 'hide');
			}
                        if(unitName == "DSR-250N" || unitName == "DSR-250" || unitName == "DSR-150N" || unitName == "DSR-150")
                            {
                                fwCheckRoutingModeEcona ();
                            }
			else
			    {
				/* check for NAT mode */
				var fldObj = document.getElementById('hdRoutingMode');
				if (parseInt (fldObj.value, 10) == 1)	/* NAT ROUTING */
				{
					fieldStateChangeWr ('tf1_txtFwDestUserStart tf1_txtFwDestUserFinish', 'tf1_addFwDestUser', '', '');
					vidualDisplay('tf1_txtFwDestUserStart tf1_txtFwDestUserFinish tf1_addFwDestUser', 'hide');
					vidualDisplay('break11 break12 break13', 'hide');
				}
				else if (parseInt (fldObj.value, 10) == 0)	/* CLASSICAL ROUTING */
				{
					fieldStateChangeWr ('tf1_txtFwLanServer tf1_chkTranslatePortNum tf1_txtTranslatePortNum tf1_selPublicDstIpAddr', '', 'tf1_txtFwDestUserStart tf1_txtFwDestUserFinish', 'tf1_addFwDestUser');
					vidualDisplay('tf1_destinationNATSettings tf1_txtFwLanServer tf1_chkTranslatePortNum tf1_txtTranslatePortNum tf1_selPublicDstIpAddr', 'hide');
					vidualDisplay('break19 break20 break21 break22', 'hide');
					vidualDisplay('tf1_addFwDestUser', 'configRow');
					vidualDisplay('break11', 'configRow');
					dropFieldSelectDest ('tf1_addFwDestUser1');
				}
			    }

		}
	else if (ruleTypeObj.value == "3")
		{
		if (selectedValue == "2")
			{
				fieldStateChangeWr ('tf1_selSchedule','','tf1_chkTranslatePortNum','');
				vidualDisplay('tf1_selSchedule break7', 'hide');
				vidualDisplay('tf1_destinationNATSettings tf1_chkTranslatePortNum', 'configRow');
				//vidualDisplay('break20', 'break');
				enableTextFieldByAnchorClick('tf1_chkTranslatePortNum','tf1_txtTranslatePortNum','break20');
			}
		else if (selectedValue == "4" || selectedValue == "3")
			{
				fieldStateChangeWr ('','','tf1_selSchedule tf1_chkTranslatePortNum','');
				vidualDisplay('tf1_selSchedule tf1_destinationNATSettings tf1_chkTranslatePortNum', 'configRow');
				//vidualDisplay('break7 break20', 'break');
				vidualDisplay('break7', 'break');
				enableTextFieldByAnchorClick('tf1_chkTranslatePortNum','tf1_txtTranslatePortNum','break20');
			}
		else
			{
				fieldStateChangeWr ('tf1_selSchedule tf1_chkTranslatePortNum tf1_txtTranslatePortNum','','','');
				vidualDisplay('tf1_selSchedule tf1_destinationNATSettings tf1_chkTranslatePortNum tf1_txtTranslatePortNum break7 break20 break21', 'hide');
			}
		}
}

function checkService ()
	{
	var selectedValue = comboSelectedValueGet ('tf1_selSvrName');
	if (!selectedValue) return;
	var actionVal = comboSelectedValueGet ('tf1_selFwAction');
	if (!actionVal) return;
	var ruleTypeObj = document.getElementById ('hdRuleType');
	if (!ruleTypeObj) return;
        var unitName = document.getElementById ('hdUnitName').value;
	if (selectedValue == "ANY" && ruleTypeObj.value == "2")
		{
			fieldStateChangeWr ('tf1_chkTranslatePortNum tf1_txtTranslatePortNum','','','');
			vidualDisplay('tf1_chkTranslatePortNum tf1_txtTranslatePortNum break20 break21', 'hide');
		}
	else if (ruleTypeObj.value == "2" && actionVal != "1")
		{
			fieldStateChangeWr ('','','tf1_chkTranslatePortNum','');
			vidualDisplay('tf1_destinationNATSettings tf1_chkTranslatePortNum', 'configRow');
			vidualDisplay('break21', 'break');
			enableTextFieldByAnchorClick('tf1_chkTranslatePortNum','tf1_txtTranslatePortNum','break20');
		}
        if(unitName == "DSR-250N" || unitName == "DSR-250" || unitName == "DSR-150N" || unitName == "DSR-150")
            {
                fwCheckRoutingModeEcona ();
            }
        else
            {
	        fwCheckRoutingMode ();
            }
	}

function updateVlanAvailability (fromZone, toZone)
    {
    if(fromZone != "SECURE_VLAN")
        {
        fieldStateChangeWr ('tf1_fromVlan', '', '', '');
		vidualDisplay('tf1_fromVlan break2', 'hide');
        }
    else
        {
        fieldStateChangeWr ('', '', 'tf1_fromVlan', '');
		vidualDisplay('tf1_fromVlan', 'configRow');
		vidualDisplay('break2', 'break');
        }
        
    if(toZone != "SECURE_VLAN")
        {
        fieldStateChangeWr ('tf1_toVlan', '', '', '');
		vidualDisplay('tf1_toVlan break4', 'hide');
        }
    else
        {
        fieldStateChangeWr ('', '', 'tf1_toVlan', '');
		vidualDisplay('tf1_toVlan', 'configRow');
		vidualDisplay('break4', 'break');
        }
    }

function fwRuleVlanSelect ()
    {
    
    var listObj = document.getElementById ('hdVlanList');

    // split vlan rules list 
    vlanListArray = listObj.value.split (' ');

    // get to vlan object array
    
    var availableVlanToObj = document.getElementById ('tf1_toVlan');
    
    // get from vlan object
    
    var availableFromVlanObject = document.getElementById ('tf1_fromVlan');
    
    if(vlanListArray.length >= 1)
        {     
        
        // fill the object with values 
        
        var indx = 0;
        
        if(!availableFromVlanObject.disabled)
            {
            // delete options from the list to fill again
            deleteOptions (availableVlanToObj);
            for (var opIdx = 0; opIdx < vlanListArray.length -1; opIdx++)
                {

                // skip if from available vlan and to available vlan is same

                if(availableFromVlanObject.value != vlanListArray[opIdx])
                    {                
                    availableVlanToObj.options [indx] = new Option (vlanListArray[opIdx], vlanListArray[opIdx],false, false);
                    indx++;
                    }
                }
            }
        else
            {
            // delete options from the list to fill again
            deleteOptions (availableVlanToObj);
            for (var opIdx = 0; opIdx < vlanListArray.length -1; opIdx++)
                {
                availableVlanToObj.options [indx] = new Option (vlanListArray[opIdx], vlanListArray[opIdx],false, false);
                indx++;
                }
            }
        }
	var selToZoneObj = document.getElementById("hdToZoneName");
    var selToZoneVal = selToZoneObj.value;
    optionValueSelectByValue ('tf1_toVlan', selToZoneVal)
    }

/****
 * This function calls when user selects an option from select box
 * OnChange event
 * @method dropFieldSelectSrc
 * @param radioName - Radio box Name
 */
function dropFieldSelectSrc(radioName) {
	var selValue = radioCheckedValueGet(radioName);
	if (!selValue)
		return;
	switch (parseInt(selValue, 10)) {
		case 1:
			/* Service / IP */
			fieldStateChangeWr('tf1_txtFwSrcUserStart tf1_txtFwSrcUserFinish', '', '', '');
			vidualDisplay('tf1_txtFwSrcUserStart tf1_txtFwSrcUserFinish', 'hide');
			vidualDisplay('break8 break9', 'hide');
			break;
		case 2:
			fieldStateChangeWr('tf1_txtFwSrcUserFinish', '', 'tf1_txtFwSrcUserStart', '');
			vidualDisplay('tf1_txtFwSrcUserFinish', 'hide');
			vidualDisplay('break8 break9', 'hide');
			vidualDisplay('tf1_txtFwSrcUserStart', 'configRow');
			break;
		case 3:
			/* Mac Address */
			fieldStateChangeWr('', '', 'tf1_txtFwSrcUserStart tf1_txtFwSrcUserFinish', '');
			vidualDisplay('tf1_txtFwSrcUserStart tf1_txtFwSrcUserFinish', 'configRow');
			vidualDisplay('break9', 'break');
			break;
	}
}

/****
 * This function calls when user selects an option from radio Button
 * Onclick event
 * @method dropFieldSelectDest
 * @param radioName - Radio box Name
 */
function dropFieldSelectDest(radioName) {
	var selValue = radioCheckedValueGet(radioName);
	if (!selValue)
		return;
	switch (parseInt(selValue, 10)) {
		case 1:
			/* Service / IP */
			fieldStateChangeWr('tf1_txtFwDestUserStart tf1_txtFwDestUserFinish', '', '', '');
			vidualDisplay('tf1_txtFwDestUserStart tf1_txtFwDestUserFinish', 'hide');
			vidualDisplay('break11 break12', 'hide');
			break;
		case 2:
			fieldStateChangeWr('tf1_txtFwDestUserFinish', '', 'tf1_txtFwDestUserStart', '');
			vidualDisplay('tf1_txtFwDestUserFinish', 'hide');
			vidualDisplay('break11 break12', 'hide');
			vidualDisplay('tf1_txtFwDestUserStart', 'configRow');
			break;
		case 3:
			/* Mac Address */
			fieldStateChangeWr('', '', 'tf1_txtFwDestUserStart tf1_txtFwDestUserFinish', '');
			vidualDisplay('tf1_txtFwDestUserStart tf1_txtFwDestUserFinish', 'configRow');
			vidualDisplay('break12', 'break');
			break;
	}
}

/****
 * This function calls when user selects an option from Radio Button
 * OnClick event
 * @method dropFieldSelectNAT
 * @param radioName - Radio box Name
 */
function dropFieldSelectNAT(radioName) {
	var selValue = radioCheckedValueGet(radioName);
	if (!selValue)
		return;
	switch (parseInt(selValue, 10)) {
		case 1:
			/* WAN Interface Address */
			fieldStateChangeWr('tf1_selSnat tf1_sourceNATSettings', '', '', '');
			vidualDisplay('tf1_selSnat break18', 'hide');
			break;

		case 3:
			/* IP Aliasing */
			fieldStateChangeWr('', '', 'tf1_selSnat', '');
			vidualDisplay('tf1_sourceNATSettings tf1_selSnat', 'configRow');
			vidualDisplay('break18', 'break');
			break;            
	}
}

function fwCheckRoutingMode ()
{
	var ruleTypeObj = document.getElementById ('hdRuleType');
        if (!ruleTypeObj) return;
        var externalIp = comboSelectedValueGet ('tf1_selPublicDstIpAddr');
        var clsRoutingObj = document.getElementById ('hdClassicalRouting');
	    var selectedValue = comboSelectedValueGet("tf1_selFwAction");
	    if (!selectedValue) return;

	if(ruleTypeObj.value == "2")
        {
        var selectedServiceValue = comboSelectedValueGet ('tf1_selSvrName');
		if (!selectedServiceValue) return;
		var serviceIndex = $("#tf1_selSvrName").prop("selectedIndex");
		var selectedserviceHiddenindex = $("select#tf1_hidselSvrName").prop('selectedIndex', serviceIndex);
		var selectedserviceHiddenValue = comboSelectedValueGet ('tf1_hidselSvrName');
                if((clsRoutingObj.value == "0")||((externalIp == "1") && (clsRoutingObj.value == "1")) || ((externalIp == "2") && (clsRoutingObj.value == "2")))
                        {
			fieldStateChangeWr ('tf1_txtFwLanServer tf1_chkTranslatePortNum','','','');
			vidualDisplay('tf1_txtFwLanServer break19 tf1_chkTranslatePortNum break20', 'hide');
                        }
                else if(selectedServiceValue == "ANY" || selectedserviceHiddenValue == "1")
                    {
                      	fieldStateChangeWr ('tf1_chkTranslatePortNum tf1_txtTranslatePortNum','','tf1_txtFwLanServer','');
                        vidualDisplay('tf1_txtFwLanServer', 'configRow');
                        vidualDisplay('break19', 'break');
						vidualDisplay('tf1_chkTranslatePortNum tf1_txtTranslatePortNum break20 break21', 'hide');

                    }
                else
                        {
                            if (selectedValue == "1")
				                {
				                    fieldStateChangeWr ('tf1_txtFwLanServer tf1_chkTranslatePortNum','','','');
				                    vidualDisplay('tf1_txtFwLanServer break19 tf1_chkTranslatePortNum break20', 'hide');
                                }
                            else
                                {
                                    fieldStateChangeWr ('','','tf1_txtFwLanServer tf1_chkTranslatePortNum','');
                                    vidualDisplay('tf1_destinationNATSettings tf1_txtFwLanServer tf1_chkTranslatePortNum', 'configRow');
                                    vidualDisplay('break19 break21 break22', 'break');
                                    enableTextFieldByAnchorClick('tf1_chkTranslatePortNum','tf1_txtTranslatePortNum','break20');
				                }
                        }
        }
}

function fwCheckRoutingModeEcona ()
    {
        var ruleTypeObj = document.getElementById ('hdRuleType');
            if (!ruleTypeObj) return;
        var selectedValue = comboSelectedValueGet("tf1_selFwAction");
	        if (!selectedValue) return;
        var selectedServiceValue = comboSelectedValueGet ('tf1_selSvrName');
		    if (!selectedServiceValue) return;
		var serviceIndex = $("#tf1_selSvrName").prop("selectedIndex");
		var selectedserviceHiddenindex = $("select#tf1_hidselSvrName").prop('selectedIndex', serviceIndex);
		var selectedserviceHiddenValue = comboSelectedValueGet ('tf1_hidselSvrName');
               /* check for NAT mode */
                var fldObj = document.getElementById('hdRoutingMode');
                if (parseInt (fldObj.value, 10) == 1)   /* NAT ROUTING */
               {
                       if (ruleTypeObj.value == "2")
                       {
			            fieldStateChangeWr ('tf1_txtFwDestUserStart tf1_txtFwDestUserFinish', 'tf1_addFwDestUser', '', '');
			            vidualDisplay('tf1_txtFwDestUserStart tf1_txtFwDestUserFinish tf1_addFwDestUser', 'hide');
			            vidualDisplay('break11 break12 break13', 'hide');
                        if(selectedServiceValue == "ANY" || selectedserviceHiddenValue == "1")
                        {
                      	    fieldStateChangeWr ('tf1_chkTranslatePortNum tf1_txtTranslatePortNum','','','');
						    vidualDisplay('tf1_chkTranslatePortNum tf1_txtTranslatePortNum break20 break21', 'hide');
                        }
                        else
                        {
                            if (selectedValue == "1")
				                {
				                    fieldStateChangeWr ('tf1_chkTranslatePortNum','','','');
				                    vidualDisplay('tf1_chkTranslatePortNum break20', 'hide');
                                }
                            else
                                {
                                    fieldStateChangeWr ('','','tf1_chkTranslatePortNum','');
                                    vidualDisplay('tf1_chkTranslatePortNum', 'configRow');
                                    vidualDisplay('break20', 'break');
                                    enableTextFieldByAnchorClick('tf1_chkTranslatePortNum','tf1_txtTranslatePortNum','break20');
				                }
                        }
                       }
               }       
                else if (parseInt (fldObj.value, 10) == 0)      /* CLASSICAL ROUTING */
                    {
                       if (ruleTypeObj.value == "1")
                       {
                           fieldStateChangeWr ('tf1_selNATIP tf1_selSnat','','','');
		           vidualDisplay('tf1_sourceNATSettings tf1_selNATIP tf1_selSnat', 'hide');
		           vidualDisplay('break16 break18', 'hide');
                       }
                       else if (ruleTypeObj.value == "2")
                       {
		           fieldStateChangeWr ('tf1_txtFwLanServer tf1_selPublicDstIpAddr', '', 'tf1_txtFwDestUserStart tf1_txtFwDestUserFinish', 'tf1_addFwDestUser');
		           vidualDisplay('tf1_destinationNATSettings tf1_txtFwLanServer tf1_selPublicDstIpAddr', 'hide');
		           vidualDisplay('break19 break21 break22', 'hide');
			   vidualDisplay('tf1_txtFwDestUserStart tf1_txtFwDestUserFinish tf1_addFwDestUser', 'configRow');
			   vidualDisplay('break11 break12 break13', 'break');
			   dropFieldSelectDest ('tf1_addFwDestUser1');
                    if(selectedServiceValue == "ANY" || selectedserviceHiddenValue == "1")
                        {
                      	    fieldStateChangeWr ('tf1_chkTranslatePortNum tf1_txtTranslatePortNum','','','');
						    vidualDisplay('tf1_chkTranslatePortNum tf1_txtTranslatePortNum break20 break21', 'hide');
                        }
                        else
                        {
                            if (selectedValue == "1")
				                {
				                    fieldStateChangeWr ('tf1_chkTranslatePortNum','','','');
				                    vidualDisplay('tf1_chkTranslatePortNum break20', 'hide');
                                }
                            else
                                {
                                    fieldStateChangeWr ('','','tf1_chkTranslatePortNum','');
                                    vidualDisplay('tf1_chkTranslatePortNum', 'configRow');
                                    vidualDisplay('break20', 'break');
                                    enableTextFieldByAnchorClick('tf1_chkTranslatePortNum','tf1_txtTranslatePortNum','break20');
				                }
                        }
                       }
                    }
}

function snatInterfaces ()
    {
        var classicalRoutingObj = document.getElementById ('hdClassicalRouting');
        var list = new Array ();
                
        var x;
        switch (parseInt(classicalRoutingObj.value, 10))
        {
            case 0:
                fieldStateChangeWr ('tf1_selNATIP tf1_selSnat','','','');
		        vidualDisplay('tf1_sourceNATSettings tf1_selNATIP tf1_selSnat', 'hide');
		        vidualDisplay('break16 break18', 'hide');
                break;
        }
	// Add ipAliasing list 
        var numObj = document.getElementById('hdNum');
	if (numObj)
	    {
	        var j = 0;
		var ipAliasIP;
		var numObjVal = parseInt(numObj.value,10);
        	var selSnatObj = document.getElementById ('tf1_selSnat');
        	selSnatObj.options.length = 0;
		while (j <= numObjVal)
		    {
			j= j + 1;
			ipAliasId = "hdIpAliasAddr"+j;
			if (document.getElementById(ipAliasId))
			    {
				ipAliasIP = document.getElementById(ipAliasId).value;
				selSnatObj.options[selSnatObj.options.length] = new Option(ipAliasIP,ipAliasIP, false, false);
			    }
		    }
	    }
        optionValueSelect ('tf1_selSnat', 'hdselSnat');
    }
