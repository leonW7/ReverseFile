/*
 * File: apWidsSecurity.js
 * Created on 23rd nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method apWidsSecurityValidate
 */
function apWidsSecurityValidate(frmId){

    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_rogueDetectedTrapInterval,Please enter valid Rogue Detected Trap Interval";
    txtFieldIdArr[1] = "tf1_wiredNetworkDetectionInterval,Please enter valid Wired Network Detection Interval";
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
    
    var rogueIntervalObj = document.getElementById('tf1_rogueDetectedTrapInterval');
    if (rogueIntervalObj && !rogueIntervalObj.disabled) {
	if (parseInt(rogueIntervalObj.value,10) != 0){
        if (numericValueRangeCheck(rogueIntervalObj, '', '', 60, 3600, true, 'Invalid Rogue Detected Trap Interval', '') == false) 
            return false;
	}
    }
    
    var wiredIntervalObj = document.getElementById('tf1_wiredNetworkDetectionInterval');
    if (wiredIntervalObj && !wiredIntervalObj.disabled) {
        if (numericValueRangeCheck(wiredIntervalObj, '', '', 0, 3600, true, 'Invalid Wired Network Detection Interval', ' ') == false) 
            return false;
    }
    setHiddenChks(frmId)
    return true;
}

