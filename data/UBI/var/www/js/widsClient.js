/*
 * File: widsClient.js
 * Created on 23rd nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method widsClientValidate
 */
function widsClientValidate(frmId){

    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_serverName,Please enter valid Known Client Database Radius Server Name";
    txtFieldIdArr[1] = "tf1_rogueDTI, Please enter valid Rogue Detected Trap Interval";
    txtFieldIdArr[2] = "tf1_deAuthTI, Please enter valid De-Authentication Requests Threshold Interval";
    txtFieldIdArr[3] = "tf1_deAuthTV,Please enter valid De-Authentication Requests Threshold Value";
    txtFieldIdArr[4] = "tf1_authTI,Please enter valid Authentication Requests Threshold Interval";
    txtFieldIdArr[5] = "tf1_authTV,Please enter valid Authentication Requests Threshold Value";
    txtFieldIdArr[6] = "tf1_probeTI,Please enter valid Probe Requests Threshold Interval";
    txtFieldIdArr[7] = "tf1_probeTV,Please enter valid Probe Requests Threshold Value";
    txtFieldIdArr[8] = "tf1_authFailureTV,Please enter valid Authentication Failure Threshold Value";
    
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
    
    var rogueDTI = document.getElementById('tf1_rogueDTI');
    if (rogueDTI && !rogueDTI.disabled) {
	if (parseInt(rogueDTI.value,10) != 0){
        if (numericValueRangeCheck(rogueDTI, '', '', 60, 3600, true, 'Invalid Rogue Detected Trap Interval.', 'Seconds ') == false) 
            return false;
	}
    }
    
    var deAuthTI = document.getElementById('tf1_deAuthTI');
    if (deAuthTI && !deAuthTI.disabled) {
        if (numericValueRangeCheck(deAuthTI, '', '', 1, 3600, true, 'Invalid De-Authentication Requests Threshold Interval.', 'Seconds ') == false) 
            return false;
    }
    
    var deAuthTV = document.getElementById('tf1_deAuthTV');
    if (deAuthTV && !deAuthTV.disabled) {
        if (numericValueRangeCheck(deAuthTV, '', '', 1, 99999, true, 'Invalid De-Authentication Requests Threshold Value.', '') == false) 
            return false;
    }
    
    var authTI = document.getElementById('tf1_authTI');
    if (authTI && !authTI.disabled) {
        if (numericValueRangeCheck(authTI, '', '', 1, 3600, true, 'Invalid Authentication Requests Threshold Interval.', 'Seconds ') == false) 
            return false;
    }
    
    var authTV = document.getElementById('tf1_authTV');
    if (authTV && !authTV.disabled) {
        if (numericValueRangeCheck(authTV, '', '', 1, 99999, true, 'Invalid Authentication Requests Threshold Value.', '') == false) 
            return false;
    }
    
    var probeTI = document.getElementById('tf1_probeTI');
    if (probeTI && !probeTI.disabled) {
        if (numericValueRangeCheck(probeTI, '', '', 1, 3600, true, 'Invalid Probe Requests Threshold Interval.', 'Seconds') == false) 
            return false;
    }
    
    var probeTV = document.getElementById('tf1_probeTV');
    if (probeTV && !probeTV.disabled) {
        if (numericValueRangeCheck(probeTV, '', '', 1, 99999, true, 'Invalid Probe Requests Threshold Value.', '') == false) 
            return false;
    }
    
    var authFailureTV = document.getElementById('tf1_authFailureTV');
    if (authFailureTV && !authFailureTV.disabled) {
        if (numericValueRangeCheck(authFailureTV, '', '', 1, 99999, true, 'Invalid Authentication Failure Threshold Value.', '') == false) 
            return false;
    }
    
    setHiddenChks(frmId);
    return true;
}

