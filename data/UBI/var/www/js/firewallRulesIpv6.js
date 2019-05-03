/*
 * File: firewallRulesIPv6.js
 * Created on 15th April 2014 - Ramakrishna Reddy PM
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
 
 
/**
 * This function calls Page loads
 * Onload validation
 * @method onloadCall
 */ 

function onloadIPv6FirewallRulesFn () {
        
    onloadCall (enableDisableFieldsByImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
	ipModeCheck ();
    InitialSettings ();

    }

function enableDisableFieldsByImageClick(data, thisObj) { 
    onAnchorToggle (data);
}

var zonesLst = ["SECURE","INSECURE"]
function deleteOptions (selObj)
{
	while(selObj.options.length != 0)
		selObj.options[0]=null;
}
/**
 *If IP Mode is in IPv4 then should hide the fields and table
 *method ipModeCheck
 */
function ipModeCheck ()
    {
    var ipModeObj = document.getElementById ('hdIpMode');
    if (ipModeObj && ipModeObj.value != "3")
        {
        fieldStateChangeWr ('tf1_allow tf1_block', 'btAllowList tf1_firewallRulesIpv6 tf1_btnShowModal', '', '');
        }
    else
        {
        fieldStateChangeWr ('', '', 'tf1_allow tf1_block', 'btAllowList tf1_firewallRulesIpv6 tf1_btnShowModal');
        }

    }

/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method firewallRulesValidate
 */
function firewallRulesValidate(){
    var txtFieldIdArr = new Array ();    
    txtFieldIdArr[0] = "tf1_selSchedule,"+LANG_LOCALE['30292'];
    txtFieldIdArr[1] = "tf1_txtFwSrcUserStart,"+LANG_LOCALE['12290'];
    txtFieldIdArr[2] = "tf1_txtFwSrcUserFinish,"+LANG_LOCALE['12290'];
    txtFieldIdArr[3] = "tf1_txtFwDestUserStart,"+LANG_LOCALE['12290'];
    txtFieldIdArr[4] = "tf1_txtFwDestUserFinish,"+LANG_LOCALE['12290'];

    if (txtFieldArrayCheck (txtFieldIdArr) == false)
         return false;

    if (ipv6Validate ('tf1_txtFwSrcUserStart', false, true, '') == false)
	    return false;

    if (ipv6Validate ('tf1_txtFwSrcUserFinish', false, true, '') == false)
	    return false;

  	if (startEndCompare('tf1_txtFwSrcUserStart','tf1_txtFwSrcUserFinish') == false)
		return false;

    if (ipv6Validate ('tf1_txtFwDestUserStart', false, true, '') == false)
	    return false;

    if (ipv6Validate ('tf1_txtFwDestUserFinish', false, true, '') == false)
	    return false;

	if (startEndCompare('tf1_txtFwDestUserStart','tf1_txtFwDestUserFinish') == false)
		return false;
    	
    return true;
}

/**
 * function for changing the To Zones depends on From Zone Selection
 * Onclick event and onchange event
 * @method updateToZones
 */
function updateToZones (){
	var fromZoneVal = comboSelectedValueGet  ('tf1_fromZone');
	if (!fromZoneVal) return;
	var toZoneObj = document.getElementById ('tf1_toZone');
	if (!toZoneObj) return;
	var unitNameObj = document.getElementById('hdUnitName');
	deleteOptions (toZoneObj)

        for (idx=0, i =0; i < 2; i++)
		{
		if (fromZoneVal != zonesLst[i])
			{
			var zoneName = zonesLst[i];
			if (zoneName == "SECURE")
				{	
				zoneName = "SECURE";
				zoneName += " (LAN)";
				}
			else if (zoneName == "INSECURE")
				{
				zoneName = "INSECURE";
				if(unitNameObj.value == "DSR-250" || unitNameObj.value == "DSR-250N" || unitNameObj.value == "DSR-150N" || unitNameObj.value == "DSR-150")
				    zoneName += " (" + "WAN" + ")";	
				else
					zoneName += " (" + "Dedicated WAN" + "/" + "Optional WAN" + ")";
				}		
			else if (zoneName == "PUBLIC")			
				zoneName += " (" + "DMZ" + ")";			
			toZoneObj.options [idx++] = new Option(zoneName, zonesLst[i], false, false);
			}
		}

changeActionType('tf1_selFwAction');
}

/**
 * function for show hide input fields depends on Select box selection
 * Onclick event and onchange event
 * @method showHideSourceHosts
 */
function showHideSourceHosts(radioName){
	selValue=radioCheckedValueGet(radioName);
    if (!selValue)return;
    switch (parseInt(selValue, 10)) {
   		case 1:   		
   			fieldStateChangeWr ('tf1_txtFwSrcUserFinish', '', 'tf1_txtFwSrcUserStart', '');  
   			vidualDisplay('tf1_txtFwSrcUserFinish','hide');
   			vidualDisplay('break_txtFwSrcUserFinish','hide');
   			vidualDisplay('tf1_txtFwSrcUserStart','configRow');
   			vidualDisplay('break_txtFwSrcUserStart','break');
   			break;
   		case 2:
   			fieldStateChangeWr ('', '', 'tf1_txtFwSrcUserStart tf1_txtFwSrcUserFinish', '');   			
   			vidualDisplay('tf1_txtFwSrcUserStart tf1_txtFwSrcUserFinish','configRow');
   			vidualDisplay('break_txtFwSrcUserStart break_txtFwSrcUserFinish ','break');
   			break;
   		case 0:
   			fieldStateChangeWr ('tf1_txtFwSrcUserStart tf1_txtFwSrcUserFinish', '', '', '');
   			vidualDisplay('tf1_txtFwSrcUserStart tf1_txtFwSrcUserFinish','hide');
   			vidualDisplay('break_txtFwSrcUserStart break_txtFwSrcUserFinish','hide');
   			break;
	}
}
/**
 * function for show hide input fields depends on Select box selection
 * Onclick event and onchange event
 * @method showHideDestHosts
 */
function showHideDestHosts(radioName) {
    selValue=radioCheckedValueGet(radioName);
    if (!selValue)return;
    switch (parseInt(selValue, 10)) {
   		case 1:
   			fieldStateChangeWr ('tf1_txtFwDestUserFinish', '', 'tf1_txtFwDestUserStart', '');
   			vidualDisplay('tf1_txtFwDestUserFinish','hide');
   			vidualDisplay('break_txtFwDestUserFinish','hide');
   			vidualDisplay('tf1_txtFwDestUserStart','configRow');
   			vidualDisplay('break_txtFwDestUserStart','break');
   			break;
   		case 2:
   			fieldStateChangeWr ('', '', 'tf1_txtFwDestUserStart tf1_txtFwDestUserFinish ', '');   			 			
   			vidualDisplay('tf1_txtFwDestUserStart tf1_txtFwDestUserFinish','configRow');
   			vidualDisplay('break_txtFwDestUserStart break_txtFwDestUserFinish','break');
   			break;
   		case 0:
   			fieldStateChangeWr ('tf1_txtFwDestUserStart tf1_txtFwDestUserFinish', '', '', '');
   			vidualDisplay('tf1_txtFwDestUserStart tf1_txtFwDestUserFinish','hide');
   			vidualDisplay('break_txtFwDestUserStart break_txtFwDestUserFinish','hide');
   			break;
	}
}

/**
 * function for show hide input fields depends on Select box selection
 * Onclick event and onchange event
 * @method changeActionType
 */
function changeActionType(selName){		
	selValue=comboSelectedValueGet(selName);
    if (!selValue)return;
    switch (selValue) {
   		case "DROP": case "ACCEPT":
   			fieldStateChangeWr ('tf1_selSchedule', '', '', '');
   			vidualDisplay('tf1_selSchedule', 'hide');
   			break;
   		case "DROP_BY_SCHED_MATCH": case "ACCEPT_BY_SCHED_MATCH":
   			fieldStateChangeWr ('', '', 'tf1_selSchedule', '');
   			vidualDisplay('tf1_selSchedule', 'configRow');
   			break;   		
	}	
}    

function InitialSettings ()
	{    
		showHideSourceHosts ('tf1_addFwSrcUser');
		showHideDestHosts ('tf1_addFwDestUser');
	    updateToZones ();
	    optionValueSelect ('tf1_toZone','hdtoZone');
	}
