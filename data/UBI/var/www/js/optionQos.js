/*
 * File: optionQos.js
 * Created on 22nd nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method optionQosConfigValidate
 */
function optionQosConfigValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_txtProfileName,Please enter a valid Profile Name.";
    txtFieldIdArr[1] = "tf1_txtMaxBandwidth,Please enter Maximum Bandwidth.";
    txtFieldIdArr[2] = "tf1_txtMinBandwidth,Please enter Minimum Bandwidth.";
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
    
    if (maxBandwidthCheck() == false) 
        return false;
    
    if (minBandwidthCheck() == false) 
        return false;
    
    return true;
}

/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method optionQosConfigValidate
 */
function ispValidate (){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_option1Upstream,Please enter a valid Option1 Upstream.";
    txtFieldIdArr[1] = "tf1_option1Downstream,Please enter Option1 Downstream.";
    txtFieldIdArr[2] = "tf1_option2Upstream,Please enter Option2 Upstream.";    
    txtFieldIdArr[3] = "tf1_option2Downstream,Please enter Option2 Downstream.";

    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;   
    
    return true;
}

/**
 * function for validate maximum Bandwidth
 * OnSubmit event
 * @method maxBandwidthCheck
 */
function maxBandwidthCheck(){
    var maxObj = document.getElementById('tf1_txtMaxBandwidth');
    if (numericValueRangeCheck(maxObj, '', '', 1,1000000, true, 'Invalid Maximum Bandwidth', 'Kbps.') == false) 
        return false;
    return true;
}

/**
 * function for validate Minimum Bandwidth
 * OnSubmit event
 * @method minBandwidthCheck
 */
function minBandwidthCheck(){
    var maxObj = document.getElementById('tf1_txtMaxBandwidth');
    var minObj = document.getElementById('tf1_txtMinBandwidth');
    if (numericValueRangeCheck(minObj, '', '', 1,1000000, true, 'Invalid Minimum Bandwidth', 'Kbps.') == false) 
        return false;
    return true;
}

