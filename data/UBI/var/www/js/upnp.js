/*
 * File: upnp.js
 * Created on 29nd Oct 2012 - Bala Krishna G
 * Modified on 6th nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * This function calls when user clicks on submit button
 * On submit validation
 * @method upnpConfValidate
 */
function upnpConfValidate(){

	var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_advertPeriod, "+LANG_LOCALE['12203'];
    txtFieldIdArr[1] = "tf1_adverttime, "+LANG_LOCALE['12204'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;

    var advObj = document.getElementById('tf1_advertPeriod');
    if (advObj && !advObj.disabled) {
        if (numericValueRangeCheck(advObj, 1, '', 1, 86400, true, LANG_LOCALE['11207']+': ', LANG_LOCALE['11167']) == false) 
            return false;
    }
    var advObj = document.getElementById('tf1_adverttime');
    if (advObj && !advObj.disabled) {
        if (numericValueRangeCheck(advObj, 1, '', 1, 255, true, LANG_LOCALE['11208']+': ', LANG_LOCALE['13499']) == false) 
            return false;
    }
    return true;
}

/**
 * Onload function
 * @method upnpOnload
 * @param toggleObj - object
 */
function upnpOnload(toggleObj){
    onAnchorToggle(toggleObj);
}
function unpnOnreset(){
upnpOnload({
            imageId: 'tf1_image_OnOff',
            disableIndividual: 'tf1_vlanIdList tf1_advertPeriod tf1_adverttime',
            disableGrp: '',
            enableIndividual: '',
            enableGrp: '',
            hideClass: 'hide',
            showClass: 'configRow',
            breakDivs: 'break11 break12 break13',
            breakClass: 'break',
            imagesInfo: {
                disableImages: '',
                enableImages: '',
                disableClass: '',
                enableClass: ''
            }
        });
}

/**
 * Selects the functions to be called depending on image clicked
 * @method setOnclickFuncs
 * @param data - data if any
 * @param thisObj - object which is clicked
 */
function setOnclickFuncs(data, thisObj){
    if (thisObj.id == "tf1_image_OnOff") {
        upnpOnload({
            imageId: 'tf1_image_OnOff',
            disableIndividual: 'tf1_vlanIdList tf1_advertPeriod tf1_adverttime',
            disableGrp: '',
            enableIndividual: '',
            enableGrp: '',
            hideClass: 'hide',
            showClass: 'configRow',
            breakDivs: 'break11 break12 break13',
            breakClass: 'break',
            imagesInfo: {
                disableImages: '',
                enableImages: '',
                disableClass: '',
                enableClass: ''
            }
        });
    }
}

