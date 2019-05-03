/*
 * File: channel.js
 * Created on 27th Nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
$(document).ready(function(){
    onloadCall();
    changeChannelPlanMode('tf1_channelPlanModeFixed');
});
function channelAlgOnrest(frmId){
    resetImgOnOff(frmId);
	changeChannelPlanMode('tf1_channelPlanModeFixed');
}
/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method channelConfigValidate
 */
function channelConfigValidate(frmId){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_channelPlanHistoryDepth, Please enter valid Channel Plan History Depth";
    txtFieldIdArr[1] = "tf1_channelPlanInterval,Please enter valid Channel Plan Interval";
    txtFieldIdArr[2] = "tf1_channelPlanFixedTime,Please enter valid Channel Plan Fixed Time";
    
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
    setHiddenChks(frmId);
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
 * @method changeChannelPlanMode
 */
function changeChannelPlanMode(radioName){
    var selValue = radioCheckedValueGet(radioName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 3: /* Fixed Time */
            fieldStateChangeWr('tf1_channelPlanInterval', '', 'tf1_channelPlanHistoryDepth tf1_channelPlanFixedTime', '');
            vidualDisplay('tf1_channelPlanInterval', 'hide');
            vidualDisplay('break2', 'hide');
            vidualDisplay('tf1_channelPlanHistoryDepth tf1_channelPlanFixedTime', 'configRow');
            vidualDisplay('break1 break3', 'break');

            break;
        case 1: /* Manual */
            fieldStateChangeWr('tf1_channelPlanInterval tf1_channelPlanFixedTime', '', 'tf1_channelPlanHistoryDepth', '');
            vidualDisplay('tf1_channelPlanInterval tf1_channelPlanFixedTime', 'hide');
            vidualDisplay('break2 break3', 'hide');

            vidualDisplay('tf1_channelPlanHistoryDepth', 'configRow');
            vidualDisplay('break1', 'break');
            break;
        case 2: /* Interval */
            fieldStateChangeWr('tf1_channelPlanFixedTime', '', 'tf1_channelPlanHistoryDepth tf1_channelPlanInterval', '');
            vidualDisplay('tf1_channelPlanFixedTime', 'hide');
            vidualDisplay('break3', 'hide');
            vidualDisplay('tf1_channelPlanHistoryDepth tf1_channelPlanInterval', 'configRow');
            vidualDisplay('break1 break2', 'break');
            break;
    }
}
