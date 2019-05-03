/*
 * File: ospfV3.js
 * Created on 19th December 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
function onLoadOspfV3Fn(){   
	ospfV3EditOnload({imageId: 'tf1_enableOspfv3',disableIndividual: 'tf1_interface tf1_priority tf1_helloInterval tf1_deadInterval tf1_cost', disableGrp: '', enableIndividual: '', enableGrp: '',  hideClass: 'hide', showClass: 'configRow', breakDivs: 'break2 break3 break4', breakClass: 'break', imagesInfo: { disableImages: '', enableImages: '', disableClass: '', enableClass: ''}});
	
	onloadCall (ospfV3EditOnload, ({imageId: 'tf1_enableOspfv3',disableIndividual: 'tf1_interface tf1_priority tf1_helloInterval tf1_deadInterval tf1_cost', disableGrp: '', enableIndividual: '', enableGrp: '',  hideClass: 'hide', showClass: 'configRow', breakDivs: 'break2 break3 break4', breakClass: 'break', imagesInfo: { disableImages: '', enableImages: '', disableClass: '', enableClass: ''}}));
   
}

/**
 * function for toggle the image
 * @method ospfV3EditOnload
 * @param toggleObj - object
 */
function ospfV3EditOnload(toggleObj){
    onAnchorToggle(toggleObj);
}

/**
 * This function calls when user clicks on submit button.
 * OnSubmit validation
 * @method pageValidate
 */
function pageValidate(frmId) {
	var txtFieldIdArr = new Array();	
	txtFieldIdArr[0] = "tf1_priority, "+LANG_LOCALE['12342'];
    txtFieldIdArr[1] = "tf1_helloInterval, "+LANG_LOCALE['12281'];
    txtFieldIdArr[2] = "tf1_deadInterval, "+LANG_LOCALE['12247'];
    txtFieldIdArr[3] = "tf1_cost, "+LANG_LOCALE['12244'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false)
	    return false;   
	    
	if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
	
	var priorityObj = document.getElementById('tf1_priority');
    if (priorityObj && !priorityObj.disabled) {
        if (numericValueRangeCheck(priorityObj, 1, "", 0, 255, true, LANG_LOCALE['11325']+': ', "") == false) 
            return false;
    }
    
    var helloIntervalObj = document.getElementById('tf1_helloInterval');
    if (helloIntervalObj && !helloIntervalObj.disabled) {
        if (numericValueRangeCheck(helloIntervalObj, 1, "", 1, 65535, true, LANG_LOCALE['11271']+': ', "") == false) 
            return false;
    }
	
	var deadIntervalObj = document.getElementById('tf1_deadInterval');
    if (deadIntervalObj && !deadIntervalObj.disabled) {
        if (numericValueRangeCheck(deadIntervalObj, 1, "", 1, 65535, true, LANG_LOCALE['11241']+': ', "") == false) 
            return false;
    }

	var costObj = document.getElementById('tf1_cost');
    if (costObj && !costObj.disabled) {
        if (numericValueRangeCheck(costObj, 1, "", 1, 65535, true, LANG_LOCALE['11238']+': ', "") == false) 
            return false;
    }  
    setHiddenChks(frmId);
    return true;
}
