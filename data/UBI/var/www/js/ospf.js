/*
 * File: ospf.js
 * Created on 19th December 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
function onLoadOspfFn(){    
	ospfEditOnload({imageId: 'tf1_enableOspfv3',disableIndividual: 'tf1_interface tf1_area tf1_priority tf1_helloInterval tf1_deadInterval tf1_cost tf1_selAuthType tf1_txtAuthKeyId tf1_txtMd5KeyId tf1_txtMd5AuthKeyId tf1_lanEnable', disableGrp: '', enableIndividual: '', enableGrp: '',  hideClass: 'hide', showClass: 'configRow', breakDivs: 'break2 break3 break4 break5 break6 break7 break8 break9 break11', breakClass: 'break', imagesInfo: { disableImages: '', enableImages: '', disableClass: '', enableClass: ''}});
	
	onloadCall (ospfEditOnload, ({imageId: 'tf1_enableOspfv3',disableIndividual: 'tf1_interface tf1_area tf1_priority tf1_helloInterval tf1_deadInterval tf1_cost tf1_selAuthType tf1_txtAuthKeyId tf1_txtMd5KeyId tf1_txtMd5AuthKeyId tf1_lanEnable', disableGrp: '', enableIndividual: '', enableGrp: '',  hideClass: 'hide', showClass: 'configRow', breakDivs: 'break2 break3 break4 break5 break6 break7 break8 break9 break11', breakClass: 'break', imagesInfo: { disableImages: '', enableImages: '', disableClass: '', enableClass: ''}}));
   
}
/**
 * function for toggle the image
 * @method ospfV3EditOnload
 * @param toggleObj - object
 */
function ospfEditOnload(toggleObj){
    onAnchorToggle(toggleObj);
    checkAuthenticationType('tf1_selAuthType');
}
/**
 * This function calls when user clicks on submit button.
 * OnSubmit validation
 * @method pageValidate
 */
function pageValidate(frmId) {
	var txtFieldIdArr = new Array();	
	txtFieldIdArr[0] = "tf1_area, "+LANG_LOCALE['12218'];
	txtFieldIdArr[1] = "tf1_priority, "+LANG_LOCALE['12342'];
    txtFieldIdArr[2] = "tf1_helloInterval, "+LANG_LOCALE['12281'];
    txtFieldIdArr[3] = "tf1_deadInterval, "+LANG_LOCALE['12247'];
    txtFieldIdArr[4] = "tf1_cost, "+LANG_LOCALE['12244'];    
    txtFieldIdArr[5] = "tf1_txtAuthKeyId, "+LANG_LOCALE['12220'];
    txtFieldIdArr[6] = "tf1_txtMd5KeyId, "+LANG_LOCALE['30174'];
    txtFieldIdArr[7] = "tf1_txtMd5AuthKeyId, "+LANG_LOCALE['12318'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false)
	    return false;

	  if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
	
	var areaObj = document.getElementById('tf1_area');
    if (areaObj && !areaObj.disabled) {
        if (numericValueRangeCheck(areaObj, 1, "", 0, 200, true, LANG_LOCALE['11219']+': ', "") == false) 
            return false;
    }
    
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

	
	var md5KeyObj = document.getElementById('tf1_txtMd5KeyId');
    if (md5KeyObj && !md5KeyObj.disabled) {
        if (numericValueRangeCheck(md5KeyObj, 1, "", 1, 255, true, LANG_LOCALE['30175']+': ', "") == false) 
            return false;
    }
    
    
    setHiddenChks(frmId);
    return true;
}
/**
 * function for changing the mode settings of radio buttons
 * Onclick event
 * @method checkAuthenticationType
 * @param selName - Select Box Id
 */
function checkAuthenticationType(selName){
    var selValue = comboSelectedValueGet(selName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* None */
            fieldStateChangeWr('tf1_txtAuthKeyId tf1_txtMd5KeyId tf1_txtMd5AuthKeyId', '', '', '');
            vidualDisplay('tf1_txtAuthKeyId tf1_txtMd5KeyId tf1_txtMd5AuthKeyId', 'hide');
            vidualDisplay('break9 break10', 'hide');
        break;
            
        case 2: /* Simple */
            fieldStateChangeWr('tf1_txtMd5KeyId tf1_txtMd5AuthKeyId', '', 'tf1_txtAuthKeyId', '');
            vidualDisplay('tf1_txtMd5KeyId tf1_txtMd5AuthKeyId', 'hide');
            vidualDisplay('break10', 'hide');
            vidualDisplay('tf1_txtAuthKeyId', 'configRow');
            vidualDisplay('break9', 'break');
        break;  
        case 3: /* Md5 */
            fieldStateChangeWr('tf1_txtAuthKeyId', '', 'tf1_txtMd5KeyId tf1_txtMd5AuthKeyId', '');       
            vidualDisplay('tf1_txtMd5KeyId tf1_txtMd5AuthKeyId', 'configRow');
            vidualDisplay('break10', 'break');
            vidualDisplay('tf1_txtAuthKeyId', 'hide');
            vidualDisplay('break9', 'hide');

        break; 
            
    }
}
