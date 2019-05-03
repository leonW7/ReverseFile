/*
 * File: smtpAlg.js
 * Created on 21st nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
$(document).ready(function(){
    /**
     * This function calls when user clicks on Checkbox images
     * OnClick validation
     * @method onloadCall
     */
    onloadCall(smtpAlgOnload, {
        imageId: 'tf1_enableSMTPStatus',
        disableIndividual: 'tf1_txtPort',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break1',
        breakClass: 'break',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    });
    
    /**
     * This function calls when page loads
     * OnLoad validation
     */
    smtpAlgOnload({
        imageId: 'tf1_enableSMTPStatus',
        disableIndividual: 'tf1_txtPort',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break1',
        breakClass: 'break',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    })
});
function smtAlgOnreset() {
  smtpAlgOnload({
        imageId: 'tf1_enableSMTPStatus',
        disableIndividual: 'tf1_txtPort',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break1',
        breakClass: 'break',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    })


}

/**
 * function for toggle the image
 * @method smtpAlgOnload
 * @param toggleObj - object
 */
function smtpAlgOnload(toggleObj){
    onAnchorToggle(toggleObj);
}

/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method smtpAlgValidate
 */
function smtpAlgValidate(frmId){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_txtPort,"+LANG_LOCALE['12083'];
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    var portObj = document.getElementById('tf1_txtPort');
    if (numericValueRangeCheck(portObj, '', '', 1, 65535, true, LANG_LOCALE['11315'], '') == false) 
        return false;

    var smtpImgClass = $('#tf1_enableSMTPStatus').attr('class');
    var smtpVal = $('#tf1_hdEnableSMTPStatus').val();
    if (smtpImgClass == ON_ANCHOR && smtpVal == '0') {
        var proceed = confirm(LANG_LOCALE['50210']);
        if (proceed == false) {
            resetImgOnOff(frmId);
            smtAlgOnreset ();            
            return false;
        }
    }
    
    setHiddenChks(frmId); 
    return true;
}
