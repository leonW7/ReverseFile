/*
 * File: power.js
 * Created on 13th Dec 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
$(document).ready(function(){
    changePowerPlanMode('tf1_poweradjustmentModeManual');
});
function powerOnReset(frmId){
	resetImgOnOff(frmId);
    changePowerPlanMode('tf1_poweradjustmentModeManual');
}
/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method channelConfigValidate
 */
function channelConfigValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_channelPlanHistoryDepth, Please enter valid Channel Plan History Depth";
    txtFieldIdArr[1] = "tf1_channelPlanInterval,Please enter valid Channel Plan Interval";
    txtFieldIdArr[2] = "tf1_channelPlanFixedTime,Please enter valid Channel Plan Fixed Time";
    txtFieldIdArr[3] = "tf1_powerInterval,Please enter valid Power Adjustment Interval";
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
    
    var historyObj = document.getElementById('tf1_channelPlanHistoryDepth');
    if (historyObj && !historyObj.disabled) {
        if (numericValueRangeCheck(historyObj, '', '', 0, 10, true, 'Invalid Channel Plan History Depth', '') == false) 
            return false;
    }
    var intervalObj = document.getElementById('tf1_channelPlanInterval');
    if (intervalObj && !intervalObj.disabled) {
        if (numericValueRangeCheck(intervalObj, '', '', 6, 24, true, 'Invalid Channel Plan Interval', '') == false) 
            return false;
    }
    var fixedObj = document.getElementById('tf1_channelPlanFixedTime');
    if (fixedObj && !fixedObj.disabled) {
        if (channelPlanFixedTimeCheck() == false) 
            return false
    }
    
    var powintervalObj = document.getElementById('tf1_powerInterval');
    if (powintervalObj && !powintervalObj.disabled) {
        if (numericValueRangeCheck(powintervalObj , '', '', 15, 1440, true, 'Invalid Power Adjustment Interval', '') == false) 
            return false;
    }

    return true
    
}

/****
 * Function for Time checking
 * @method channelPlanFixedTimeCheck
 */
function channelPlanFixedTimeCheck(){
    var regExp = /^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/;
    var fixedObj = document.getElementById('tf1_channelPlanFixedTime');
    if (fixedObj.value.match(regExp)) 
        return true;
    else {
        alert("Invalid Channel Plan Fixed Time. Should be HH:SS");
        fixedObj.focus();
        return false;
    }
}

/****
 * This function calls when user selects an option from radio Button
 * Onclick event
 * @method changePowerPlanMode
 */
function changePowerPlanMode(radioName){
    var selValue = radioCheckedValueGet(radioName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* Manual */
            fieldStateChangeWr('tf1_powerInterval', '', '', '');
            vidualDisplay('tf1_powerInterval', 'hide');
            //vidualDisplay('break1 break2 break3', 'break');
            break;
        case 2: /* Interval */
            fieldStateChangeWr('', '', 'tf1_powerInterval', '');
            vidualDisplay('tf1_powerInterval', 'configRow');
            //vidualDisplay('break1 break2', 'hide');
            break;
    }
}

