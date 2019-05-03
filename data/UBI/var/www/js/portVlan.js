/*
 * File: portVlan.js
 * Created on 21st Feb 2013 - Lakshmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
function onLoadPortVlanFn () {    
	changeModeType('tf1_mode');   
}

/**
 * This function calls when user clicks on submit button.
 * OnSubmit validation
 * @method pageValidate
 */
function pageValidate() {
	var txtFieldIdArr = new Array();	
	txtFieldIdArr[0] = "tf1_pvid, "+LANG_LOCALE['12349'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false)
	    return false;   
	    
	if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
	    
	var pvidObj = document.getElementById('tf1_pvid');
    if (pvidObj&& !pvidObj.disabled) {
        var unitName = $('#hdUnitName').val();
        if (unitName == "DSR-150" || unitName == "DSR-150N") {
            if (numericValueRangeCheck(pvidObj, 1, '', 1, 15, true, LANG_LOCALE['11327']+': ', "") == false) 
                return false;
        } else {
            if (numericValueRangeCheck(pvidObj, 1, '', 1, 4093, true, LANG_LOCALE['11327']+': ', "") == false) 
                return false;
        }
    }

    if ($("#tf1_mode").val() != "1") {
        if (!$("#tf1_vlanMembers option:selected").length) {
            alert("Please select atleast one VLAN Membership");
            return false;
	    }
    }

    return true;
}
/**
 * function for changing the mode settings of radio buttons
 * Onclick event
 * @method changeModeType
 * @param selName - Select Box Id
 */
function changeModeType(selName){
    var selValue = comboSelectedValueGet(selName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* Access */
            fieldStateChangeWr('tf1_vlanMembers', '', 'tf1_pvid', '');
            vidualDisplay('tf1_vlanMembers tf1_membershipBlock', 'hide');
            vidualDisplay('break_vlanMembers', 'hide');
            
            vidualDisplay('tf1_pvid', 'configRow');
            vidualDisplay('break_pvid', 'break');
        break;
            
        case 2: /* General */
        	fieldStateChangeWr('', '', 'tf1_vlanMembers tf1_pvid', '');       
            vidualDisplay('tf1_vlanMembers tf1_pvid', 'configRow');
            vidualDisplay('tf1_membershipBlock', '');
            vidualDisplay('break_vlanMembers break_pvid', 'break');
        break;
        case 3: /* Trunk */
            fieldStateChangeWr('tf1_pvid', '', 'tf1_vlanMembers', '');  
			vidualDisplay('tf1_pvid', 'hide');
            vidualDisplay('break_pvid', 'hide');            
     
            vidualDisplay('tf1_vlanMembers', 'configRow');
            vidualDisplay('tf1_membershipBlock', '');
            vidualDisplay('break_vlanMembers', 'break');
        break; 
            
    }
}
function  portVlanListPopupOnload()  {

 onloadCall (parseInt);
  
            
    
}
