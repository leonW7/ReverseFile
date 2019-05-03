/*
 * File: rip.js
 * Created on 20th nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */

/**
 * This function calls Page loads
 * Onload validation
 * @method onloadCall
 */ 
$(document).ready(function() {
	onloadCall (ripOnload, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
	
	enableTextFieldByAnchorClick('tf1_ripAuthentication','tf1_ripAuthentication tf1_ripFirstMd5KeyId tf1_ripFirstMd5AuthKey tf1_ripSecMd5KeyId tf1_ripSecMd5AuthKey authenticationFirstKey authenticationSecondKey tf1_dateTimePickerFirstStartValue tf1_dateTimePickerFirstEndValue tf1_dateTimePickerSecondStartValue tf1_dateTimePickerSecondEndValue','break4 break5 break6 break7 break8 break9 break10 break11');	
	
	ripDirectionTypeCheck('tf1_ripDirection1');
});


function ripOnreset() {
	enableTextFieldByAnchorClick('tf1_ripAuthentication','tf1_ripAuthentication tf1_ripFirstMd5KeyId tf1_ripFirstMd5AuthKey tf1_ripSecMd5KeyId tf1_ripSecMd5AuthKey authenticationFirstKey authenticationSecondKey tf1_dateTimePickerFirstStartValue tf1_dateTimePickerFirstEndValue tf1_dateTimePickerSecondStartValue tf1_dateTimePickerSecondEndValue','break4 break5 break6 break7 break8 break9 break10 break11');	
	
	ripDirectionTypeCheck('tf1_ripDirection1');
}
/**
 * function for toggle the image
 * @method ripOnload
 * @param toggleObj - object
 */
function ripOnload(toggleObj, thisObj) {
	onAnchorToggle(toggleObj);
	ripDirectionTypeCheck('tf1_ripDirection1');
	
	var imgId=thisObj.id;    
    switch(imgId){
    	case 'tf1_ripAuthentication':   		
			enableTextFieldByAnchorClick('tf1_ripAuthentication','tf1_ripAuthentication tf1_ripFirstMd5KeyId tf1_ripFirstMd5AuthKey tf1_ripSecMd5KeyId tf1_ripSecMd5AuthKey authenticationFirstKey authenticationSecondKey tf1_dateTimePickerFirstStartValue tf1_dateTimePickerFirstEndValue tf1_dateTimePickerSecondStartValue tf1_dateTimePickerSecondEndValue','break4 break5 break6 break7 break8 break9 break10 break11');	
			ripDirectionTypeCheck('tf1_ripDirection1');
			
    	break;    	
    }
}

/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method ripValidate
 */
function ripValidate() {

	var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_ripFirstMd5KeyId, "+LANG_LOCALE['12056'];
    txtFieldIdArr[1] = "tf1_ripFirstMd5AuthKey, "+LANG_LOCALE['12169'];
	txtFieldIdArr[2] = "tf1_dateTimePickerFirstStartValue, "+LANG_LOCALE['11978'];
    txtFieldIdArr[3] = "tf1_dateTimePickerFirstEndValue, "+LANG_LOCALE['11968'];
    txtFieldIdArr[4] = "tf1_ripSecMd5KeyId, "+LANG_LOCALE['12056'];
    txtFieldIdArr[5] = "tf1_ripSecMd5AuthKey, "+LANG_LOCALE['12176'];
	txtFieldIdArr[6] = "tf1_dateTimePickerSecondStartValue, "+LANG_LOCALE['11978'];
    txtFieldIdArr[7] = "tf1_dateTimePickerSecondEndValue, "+LANG_LOCALE['11968'];

	if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    var txtFieldIdArr1 = new Array();
    txtFieldIdArr1[0] = "tf1_ripFirstMd5KeyId, "+LANG_LOCALE['12056'];
    txtFieldIdArr1[1] = "tf1_ripFirstMd5AuthKey, "+LANG_LOCALE['12169'];
	txtFieldIdArr1[2] = "tf1_ripSecMd5KeyId, "+LANG_LOCALE['12056'];
    txtFieldIdArr1[3] = "tf1_ripSecMd5AuthKey, "+LANG_LOCALE['12176'];

  	if (isProblemCharArrayCheck(txtFieldIdArr1, "'\" ", NOT_SUPPORTED) == false) 
        return false;

	var firstMd5KeyIdObj = document.getElementById('tf1_ripFirstMd5KeyId');
	if (firstMd5KeyIdObj && !firstMd5KeyIdObj.disabled) {
		if (numericValueRangeCheck(firstMd5KeyIdObj, '', '', 1, 255, true, LANG_LOCALE['11302'], '') == false)
			return false;
	}	
	
	if(compareTimes("tf1_dateTimePickerFirstStartValue", "tf1_dateTimePickerFirstEndValue") == false)
		return false;

	var secMd5KeyIdObj = document.getElementById('tf1_ripSecMd5KeyId');
	if (secMd5KeyIdObj && !secMd5KeyIdObj.disabled) {
		if (numericValueRangeCheck(secMd5KeyIdObj, '', '', 1, 255, true, LANG_LOCALE['11302'], '') == false)
			return false;
	}	
	
	if(compareTimes("tf1_dateTimePickerSecondStartValue", "tf1_dateTimePickerSecondEndValue") == false)
		return false;

	return true;
}
function compareTimes(start, end){
	
	var time1 = document.getElementById(start);
	var time2 = document.getElementById(end);	
	
	if ((time1 && time1.disabled) || (time2 && time2.disabled))
		return;
		
	var StartTime = new Date(time1.value);
	var EndTime = new Date(time2.value);

	var TimeDiff = EndTime.getTime() - StartTime.getTime();
	if(TimeDiff <= 0){
		alert(LANG_LOCALE['10922']);
		document.getElementById(end).focus();
		return false;
	}else{
		return true;
	}
	
}/**
 * function for changing the Direction and Version settings of radio buttons and select box
 * Onclick event and onchange event
 * @method ripDirectionTypeCheck
 * @param radioName - Radio button name
 */
function ripDirectionTypeCheck(radioName) {

	var selecteDir = radioCheckedValueGet(radioName);
	var selectedVer = comboSelectedValueGet('tf1_ripVersion');
	if (selectedVer && selecteDir) {
		if ((!isNaN(selecteDir) && parseInt(selecteDir, 10) == 0) || (!isNaN(selectedVer) && parseInt(selectedVer, 10) == 0) || (!isNaN(selectedVer) && parseInt(selectedVer, 10) == 1)) {
			fieldStateChangeWr('tf1_ripAuthentication tf1_ripFirstMd5KeyId tf1_ripFirstMd5AuthKey tf1_ripSecMd5KeyId tf1_ripSecMd5AuthKey tf1_dateTimePickerFirstStartValue tf1_dateTimePickerFirstEndValue tf1_dateTimePickerSecondStartValue tf1_dateTimePickerFirstEndValue', '', '', '');
			vidualDisplay('tf1_ripAuthentication tf1_ripFirstMd5KeyId tf1_ripFirstMd5AuthKey tf1_ripSecMd5KeyId tf1_ripSecMd5AuthKey  authenticationFirstKey authenticationSecondKey', 'hide');
			vidualDisplay('break4 break5 break6 break7 break8 break9 break10 break11', 'hide');
		} else {
			fieldStateChangeWr('', '', 'tf1_ripAuthentication', 'tf1_dateTimePickerFirstStartValue tf1_dateTimePickerFirstEndValue tf1_dateTimePickerSecondStartValue tf1_dateTimePickerFirstEndValue');
			vidualDisplay('tf1_ripAuthentication', 'configRow');
			vidualDisplay('break4', 'hide');
			authEnable();
		}
	}
}

/**
 * function for enable or disble text boxs while clicking on checkbox image buttons
 * Onclick event
 * @method authEnable
 */
function authEnable() {
	var enableObj = document.getElementById('tf1_ripAuthentication');
	if (!enableObj || enableObj.disabled)
		return;

	var imgObj = document.getElementById('tf1_ripAuthentication').className;
	var imageName = imgObj.substring(imgObj.lastIndexOf('/') + 1);
	if (imageName == ON_ANCHOR) {
		fieldStateChangeWr('', '', 'tf1_ripFirstMd5KeyId tf1_ripFirstMd5AuthKey tf1_ripSecMd5KeyId tf1_ripSecMd5AuthKey tf1_dateTimePickerFirstStartValue tf1_dateTimePickerFirstEndValue tf1_dateTimePickerSecondStartValue tf1_dateTimePickerFirstEndValue', '');
		vidualDisplay('tf1_ripFirstMd5KeyId tf1_ripFirstMd5AuthKey tf1_ripSecMd5KeyId tf1_ripSecMd5AuthKey  authenticationFirstKey authenticationSecondKey', 'configRow');
		vidualDisplay('break4 break5 break6 break7 break8 break9 break10 break11', 'break');
	} else {
		fieldStateChangeWr('tf1_ripFirstMd5KeyId tf1_ripFirstMd5AuthKey tf1_ripSecMd5KeyId tf1_ripSecMd5AuthKey tf1_dateTimePickerFirstStartValue tf1_dateTimePickerFirstEndValue tf1_dateTimePickerSecondStartValue tf1_dateTimePickerFirstEndValue', '', '', '');
		vidualDisplay('tf1_ripFirstMd5KeyId tf1_ripFirstMd5AuthKey tf1_ripSecMd5KeyId tf1_ripSecMd5AuthKey  authenticationFirstKey authenticationSecondKey', 'hide');
		vidualDisplay('break4 break5 break6 break7 break8 break9 break10 break11', 'hide');
	}
}

