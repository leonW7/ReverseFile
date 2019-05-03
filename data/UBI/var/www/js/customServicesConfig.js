/*
 * File: customServices.js
 * Created on 9th Nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/****
 * This function calls when user clicks on submit button
 * On submit validation
 * @method serviceAddFormValidate
 */
function onloadCallcustomServicesFn () {
	checkCustomServiceType('tf1_customServiceType');
}
function serviceAddFormValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_customServiceName,"+LANG_LOCALE['12064'];
    txtFieldIdArr[1] = "tf1_customServiceIcmpType1,"+LANG_LOCALE['12283'];
    txtFieldIdArr[2] = "tf1_customServiceIcmpV6Type,"+LANG_LOCALE['30586'];
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    if (alphaNumericValueCheck ("tf1_customServiceName", '', '') == false)    
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;

    var obj = document.getElementById('tf1_customServiceIcmpType1');
    if (!obj.disabled) {
    	if(numericValueRangeCheck(obj, '', '', 0, 40, true, LANG_LOCALE['11273'], '') == false)
    		return false;
    }
    
    var obj = document.getElementById('tf1_customServiceIcmpV6Type');
    if (!obj.disabled) {
    	if(numericValueRangeCheck(obj, '', '', 1, 255, true, LANG_LOCALE['30585'], '') == false)
    		return false;
    }

    /* Port Range Ids */
    var sourceStartObj = $("#tf1_customServiceStartPort");
    var sourceEndObj = $("#tf1_customServiceEndPort");
    var destStartObj = $("#tf1_customServiceStartPort1");
    var destEndObj = $("#tf1_customServiceEndPort1");

    /* Multi Ports Ids */
    var sourceObj = $("#tf1_customServicePorts");
    var destObj = $("#tf1_customServicePorts1");

    var selectedValue = radioCheckedValueGet("tf1_customServicePortType1");
    var customServiceVal = comboSelectedValueGet("tf1_customServiceType");
    
    if (!selectedValue) 
        return;    

    if (parseInt(customServiceVal, 10) != 5) {
    if (parseInt(selectedValue, 10) == 1)
        {  
            var fieldIdList = "tf1_customServiceStartPort,tf1_customServiceEndPort,tf1_customServiceStartPort1,tf1_customServiceEndPort1";
            var errMsgList = "Please enter a valid Source Start Port value,Please enter a valid Source Finish Port value,Please enter a valid Destination Start Port value,Please enter a valid Destination Finish Port value";

            var fieldIdArray = fieldIdList.split(",");
            var errListArry = errMsgList.split(",");

            var fCount = 0;
            var emptyIndex = 0;
            for (var i = 0; i < fieldIdArray.length; i++) {
                if (!($("#"+fieldIdArray[i]).val().length)) {
                    emptyIndex = i;
                } else {                 
                    fCount++;      
                }
            }
            if (fCount == 3) {            
                alert(errListArry[emptyIndex]);
                $("#"+fieldIdArray[emptyIndex]).focus();
                return false;        
            }

            if (!(((sourceStartObj && sourceStartObj.val() != "") && (sourceEndObj && sourceEndObj.val() != "")) || ((destStartObj && destStartObj.val() != "") && (destEndObj && destEndObj.val() != ""))))
            {
            if (sourceStartObj.val() != "")
                {
                    if (!sourceEndObj.val().length)
                        {
                            alert(LANG_LOCALE['30591']);
                            sourceEndObj.focus();
                            return false;
                        }
                }
            else if (sourceEndObj.val() != "")
                {
                    if (!sourceStartObj.val().length)
                        {
                            alert(LANG_LOCALE['30590']);
                            sourceStartObj.focus();
                            return false;
                        }
                }
            else if(destStartObj.val() != "")
                {
                    if (!destEndObj.val().length)
                        {
                            alert(LANG_LOCALE['30593']);
                            destEndObj.focus();
                            return false;
                        }
                }
            else if (destEndObj.val() != "")
                {
                    if (!destStartObj.val().length)
                        {
                            alert(LANG_LOCALE['30592']);
                            destStartObj.focus();
                            return false;
                        }
                }
            else
                {
                    alert(LANG_LOCALE['30594']);
                    sourceStartObj.focus();
                    return false;
                }
            }
        }
    else
        {
            if (!((sourceObj && sourceObj.val() != "") && (destObj && destObj.val() != "")))
            {
            if (sourceObj.val() != "")
                {
                    if (!destObj.val().length)
                        return true;
                }
            else if (destObj.val() != "")
                {
                    if (!sourceObj.val().length)
                        return true;
                }
            else
                {
                    alert(LANG_LOCALE['30595']);
                    sourceStartObj.focus();
                    return false;
                }
            }
        }
    }

    var startPort = 1;
    /* get and validate start port */
    var obj = null;
    obj = document.getElementById('tf1_customServiceStartPort');
    if (!obj.disabled) {
        if (numericValueRangeCheck(obj, '', '', 1, 65535, true, LANG_LOCALE['30596'], '') == false) 
            return false;
        startPort = obj.value;
    }

    /* get and validate source end port */
    obj = document.getElementById('tf1_customServiceEndPort');
    if (!obj.disabled) {
        if (numericValueRangeCheck(obj, '', '', 1, 65535, true, LANG_LOCALE['30597'], '') == false) 
            return false;
        if (parseInt(obj.value, 10) < parseInt(startPort, 10)) {
            var errStr = LANG_LOCALE['11329'] + " (" + obj.value + ") " + LANG_LOCALE['13482'] + " (" + startPort + ")";
            alert(errStr);
            return false;
        }
    }

    /* get and validate destination start port */
    var obj = null;
    obj = document.getElementById('tf1_customServiceStartPort1');
    if (!obj.disabled) {
        if (numericValueRangeCheck(obj, '', '', 1, 65535, true, LANG_LOCALE['30598'], '') == false) 
            return false;
        startPort = obj.value;
    }

    /* get and validate destination end port */
    obj = document.getElementById('tf1_customServiceEndPort1');
    if (!obj.disabled) {
        if (numericValueRangeCheck(obj, '', '', 1, 65535, true, LANG_LOCALE['30606'], '') == false) 
            return false;
        if (parseInt(obj.value, 10) < parseInt(startPort, 10)) {
            var errStr = LANG_LOCALE['11329'] + " (" + obj.value + ") " + LANG_LOCALE['13482'] + " (" + startPort + ")";
            alert(errStr);
            return false;
        }
    }    
    return true;
}

function customServicePortTypeChange(radioName){
	var selectedValue = radioCheckedValueGet(radioName);
    if (!selectedValue) 
        return;
    switch (parseInt(selectedValue, 10)) {
        case 1: /* Port Range*/        
        	fieldStateChangeWr('tf1_customServiceIcmpType1 tf1_customServicePorts tf1_customServicePorts1', '', 'tf1_customServiceStartPort tf1_customServiceEndPort tf1_customServiceStartPort1 tf1_customServiceEndPort1', '');
    		vidualDisplay('tf1_customServiceIcmpType1 tf1_customServicePorts tf1_customServicePorts1', 'hide');
    		vidualDisplay('break_customServiceIcmpType1 break_customServicePorts break_customServicePorts1', 'hide');
    		
    		vidualDisplay('tf1_customServiceStartPort tf1_customServiceEndPort tf1_customServiceStartPort1 tf1_customServiceEndPort1', 'configRow');
    		vidualDisplay('break_customServiceStartPort break_customServiceEndPort break_customServiceStartPort1 break_customServiceEndPort1', 'break');
    		
            break;
            
        case 2: /* Multiple Ports*/
        	fieldStateChangeWr('tf1_customServiceIcmpType1 tf1_customServiceStartPort tf1_customServiceEndPort tf1_customServiceStartPort1 tf1_customServiceEndPort1', '', 'tf1_customServicePorts tf1_customServicePorts1', '');
    		vidualDisplay('tf1_customServiceIcmpType1 tf1_customServiceStartPort tf1_customServiceEndPort tf1_customServiceStartPort1 tf1_customServiceEndPort1', 'hide');
    		vidualDisplay('break_customServiceIcmpType1 break_customServiceStartPort break_customServiceEndPort break_customServiceStartPort1 break_customServiceEndPort1', 'hide');
    		
    		vidualDisplay('tf1_customServicePorts tf1_customServicePorts1', 'configRow');  
    		vidualDisplay('break_customServicePorts break_customServicePorts1', 'break');  		
            break;
    }

}
/**
 * This function calls to check the ICMP Type range
 * OnChange event
 * @method checkCustomServiceType
 * @param serviceType - serviceType
 */
function checkCustomServiceType(serviceType){
    var selectedValue = comboSelectedValueGet(serviceType);
    if (!selectedValue) 
        return;
    switch (parseInt(selectedValue, 10)) {
        case 1: /* TCP */
        case 2: /* UDP */
        case 3: /* Both */
            fieldStateChangeWr('tf1_customServiceIcmpType1 tf1_customServicePorts tf1_customServicePorts1 tf1_customServiceIcmpV6Type', '', 'tf1_customServiceStartPort tf1_customServiceEndPort tf1_customServiceStartPort1 tf1_customServiceEndPort1', 'tf1_customServicePortType_div');
            vidualDisplay('tf1_customServiceIcmpType1 tf1_customServicePorts tf1_customServicePorts1 tf1_customServiceIcmpV6Type', 'hide');
            vidualDisplay('break_customServiceIcmpType1 break_customServiceIcmpType2 break_customServicePorts break_customServicePorts1 break_customServiceIcmpV6Type', 'hide');
            vidualDisplay('tf1_customServiceStartPort tf1_customServiceEndPort tf1_customServicePortType tf1_customServiceStartPort1 tf1_customServiceEndPort1', 'configRow');
            vidualDisplay('break_customServiceStartPort break_customServiceEndPort break_customServicePortType break_customServiceStartPort1 break_customServiceEndPort1', 'break');

            customServicePortTypeChange('tf1_customServicePortType1');
            break;
        case 4: /* ICMP */
        	fieldStateChangeWr('tf1_customServiceStartPort tf1_customServiceEndPort tf1_customServicePorts tf1_customServicePorts1 tf1_customServiceIcmpV6Type tf1_customServiceStartPort1 tf1_customServiceEndPort1', 'tf1_customServicePortType_div', 'tf1_customServiceIcmpType1', '');
            vidualDisplay('tf1_customServiceStartPort tf1_customServiceEndPort tf1_customServicePorts tf1_customServicePorts1 tf1_customServicePortType tf1_customServiceIcmpV6Type tf1_customServiceStartPort1 tf1_customServiceEndPort1', 'hide');
            vidualDisplay('break_customServiceStartPort break_customServiceEndPort break_customServicePorts break_customServicePorts1 break_customServiceIcmpType2 break_customServicePortType break_customServiceIcmpV6Type break_customServiceStartPort1 break_customServiceEndPort1', 'hide');
            
            vidualDisplay('tf1_customServiceIcmpType1', 'configRow');
            vidualDisplay('break_customServiceIcmpType1', 'break');
			break;       
        case 5: /* ICMPV6 */
            fieldStateChangeWr('tf1_customServiceStartPort tf1_customServiceEndPort tf1_customServicePorts tf1_customServicePorts1 tf1_customServiceIcmpType1 tf1_customServiceStartPort1 tf1_customServiceEndPort1', '', 'tf1_customServiceIcmpV6Type', '');
            vidualDisplay('tf1_customServiceStartPort tf1_customServiceEndPort tf1_customServicePorts tf1_customServicePorts1 tf1_customServicePortType tf1_customServiceIcmpType1 tf1_customServiceStartPort1 tf1_customServiceEndPort1', 'hide');
            vidualDisplay('break_customServiceStartPort break_customServiceEndPort break_customServicePorts break_customServicePorts1 break_customServiceIcmpType2 break_customServicePortType break_customServiceIcmpType1 break_customServiceStartPort1 break_customServiceEndPort1', 'hide');
            
            vidualDisplay('tf1_customServiceIcmpV6Type', 'configRow');
            vidualDisplay('break_customServiceIcmpV6Type', 'break');
    }
}
