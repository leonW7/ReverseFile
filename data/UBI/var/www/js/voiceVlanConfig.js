/*
 * File: voiceVlanConfig.js
 * Created on 20th nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
 
/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method voiceVlanConfigValidate
 */
function voiceVlanConfigValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_txtVlan, Please enter valid VLAN";
    txtFieldIdArr[1] = "tf1_txtCustomDotVal, Please enter valid Custom Dot1q Value";
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;    
        
    /* 
    if (isNumericValue('tf1_txtCustomDotVal') == false) 
        return false;*/
        
     var vlanIdObj = document.getElementById('tf1_txtCustomDotVal');
    if (numericValueRangeCheck(vlanIdObj, 1, "", 1, 7, true, "Custom Dot1p Value.", "") == false) 
        return false;

    
    var vlanIdObj = document.getElementById('tf1_txtVlan');
    if (numericValueRangeCheck(vlanIdObj, 1, "", 1, 4096, true, "Invalid Vlan.", "") == false) 
        return false;
    
    return true;
}

/**
 * function for changing the mode settings of radio buttons
 * Onclick event
 * @method voiceVlanModeChange
 * @param radioName - Radio button name
 */
function voiceVlanModeChange(radioName){
    var selValue = radioCheckedValueGet(radioName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* VLAN */
            fieldStateChangeWr('tf1_txtCustomDotVal', '', 'tf1_txtVlan', '');
            vidualDisplay('tf1_txtCustomDotVal', 'hide');
            vidualDisplay('break4', 'hide');
            
            vidualDisplay('tf1_txtVlan', 'configRow');
            vidualDisplay('break3', 'break');
            break;
            
        case 2: /* Custom Dot1p Value */
            fieldStateChangeWr('tf1_txtVlan', '', 'tf1_txtCustomDotVal', '');
            vidualDisplay('tf1_txtVlan', 'hide');
            vidualDisplay('break3', 'hide');
            
            vidualDisplay('tf1_txtCustomDotVal', 'configRow');
            vidualDisplay('break4', 'break');
            break;
            
    }
}

/**
 * Selects the functions to be called depending on image clicked
 * @method setOnclickFuncs
 * @param data - data if any
 * @param thisObj - object which is clicked
 */
function setOnclickFuncs(data, thisObj){
    if (thisObj.id == "tf1_voiceVlanAdminModeChange") {
        voiceVlanConfigOnload({
            imageId: 'tf1_voiceVlanAdminModeChange',
            disableIndividual: 'tf1_interface tf1_voiceVlanMode1 tf1_txtVlan tf1_txtCustomDotVal',
            disableGrp: '',
            enableIndividual: '',
            enableGrp: '',
            hideClass: 'hide',
            showClass: 'configRow',
            breakDivs: 'break1 break2 break3 break4',
            breakClass: 'break',
            imagesInfo: {
                disableImages: '',
                enableImages: '',
                disableClass: '',
                enableClass: ''
            }
        })
    }
}

function onLoadVocieVlanFn(){
voiceVlanModeChange('tf1_voiceVlanMode1');

}
