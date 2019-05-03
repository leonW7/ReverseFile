/*
 * File: oneToOneMappingConfig.js
 * Created on 11th June 2014 - Ramakrishna Reddy P.M
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
 
/**
 * This function calls when user clicks on submit button
 * On submit validation
 * @method bandwidthProfilesValidation
 */
function oneToOneMappingValidation () {
    var txtValidArray = new Array();
    txtValidArray[0] = "tf1_sourceIPAddr, "+LANG_LOCALE['12028'];
    txtValidArray[1] = "tf1_mappedIPAddr, "+LANG_LOCALE['12028'];
    txtValidArray[2] = "tf1_rangeLength, "+LANG_LOCALE['30210'];
    
    if (txtFieldArrayCheck(txtValidArray) == false) 
        return false;

        if (ipv4Validate ('tf1_sourceIPAddr', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
        return false;
         
    if (ipv4Validate ('tf1_mappedIPAddr', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
        return false;

    var rangeLenObj = document.getElementById('tf1_rangeLength');
    if (numericValueRangeCheck (rangeLenObj, "", "",1, 254, true, LANG_LOCALE['30211']+': ', "") == false)    	
        return false;

	setHiddenChks('tf1_frmOneToOneMapping');
    return true;
}
