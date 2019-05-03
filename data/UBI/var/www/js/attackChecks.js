/*
 * File: attackChecks.js
 * Created on 5th Nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * On submit validation
 * @method getAttacksValidate
 * This function calls when user clicks on submit button
 */
function getAttacksValidate(frmId){

    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_txtSynFloodRate,"+LANG_LOCALE['12404'];
    txtFieldIdArr[1] = "tf1_txtEchoStorm,"+LANG_LOCALE['12259'];
    txtFieldIdArr[2] = "tf1_txticmpFlood,"+LANG_LOCALE['12282']; 
    txtFieldIdArr[3] = "tf1_txtUdpConnectionLimit,"+LANG_LOCALE['13475'];        

    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
        
    if (numericValueRangeCheck(document.getElementById('tf1_txtUdpConnectionLimit'), '', '', 25, 500, true, LANG_LOCALE['11371']+':', '') == false) 
        return false;
        
    if (numericValueRangeCheck(document.getElementById('tf1_txtSynFloodRate'), '', '', 1, 10000, true, LANG_LOCALE['11367']+':', '') == false) 
        return false;
    if (numericValueRangeCheck(document.getElementById('tf1_txtEchoStorm'), '', '', 1, 10000, true, LANG_LOCALE['11255']+':', '') == false) 
        return false;
    if (numericValueRangeCheck(document.getElementById('tf1_txticmpFlood'), '', '', 1, 10000, true, LANG_LOCALE['11272']+':', '') == false) 
        return false;
    setHiddenChks(frmId);        
    return true;
}

/**
 * OnClick validation
 * @method enableUdpConLimit
 * This function calls when user clicks on tf1_txtUdpFlood check box
 */
function enableUdpConLimit(toggleObj, thisObj){
    onAnchorToggle(toggleObj);
}

/**
 * set jQuery call on click of image
 */
jQuery(function(){
    onloadCall(enableUdpConLimit, {
        imageId: 'tf1_txtUdpFlood',
        disableIndividual: 'tf1_txtUdpConnectionLimit',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break3',
        breakClass: 'break',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    })
});

/**
 * Call onload
 */
window.onload = function(){
    enableUdpConLimit({
        imageId: 'tf1_txtUdpFlood',
        disableIndividual: 'tf1_txtUdpConnectionLimit',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break3',
        breakClass: 'break',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    }, '')
};

/**
 * Call reset
 */
function attackChecksOnReset(frmId){
	resetImgOnOff(frmId);
    enableUdpConLimit({
        imageId: 'tf1_txtUdpFlood',
        disableIndividual: 'tf1_txtUdpConnectionLimit',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break3',
        breakClass: 'break',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    })
    
}

