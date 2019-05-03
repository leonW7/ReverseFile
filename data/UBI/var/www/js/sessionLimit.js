/*
 * File: sessionLimit.js
 * Created on 28th Oct 2015 - Ramakrishna Reddy
 * All rights reserved.
 */
/**
 * This function calls Page loads
 * Onload validation
 * @method onloadCall
 */
function onloadSessionLimitFn () {
    onloadCall(onloadSessionLimit, {imageId: '', disableIndividual: '', disableGrp: '', enableIndividual: '', enableGrp: '', hideClass: 'hide', showClass: 'configRow',  breakDivs: '', breakClass: 'break', imagesInfo: {disableImages: '', enableImages: '', disableClass: '', enableClass: ''}});
    changeSourceType ('tf1_sourceType');
    enableTextFieldByAnchorClick('tf1_enableSchedules','tf1_scheduleProfile','break_scheduleProfile');
}

/**
 This function is called always when image is clicked
 **/
function onloadSessionLimit(data, thisObj){
    onAnchorToggle (data);
    var imgId=thisObj.id;
    
    switch(imgId){
    	case 'tf1_enableSchedules':
    		enableTextFieldByAnchorClick(imgId,'tf1_scheduleProfile','break_scheduleProfile');    		
    	break;
    } 	

}

/****
 * This function calls when user selects an option from select box
 * OnChange event
 * @method changeSourceType
 * @param selName - Select box Name
 */
function changeSourceType(selName){
	var selValue = comboSelectedValueGet (selName);	
    if (!selValue) return;	
    switch (parseInt (selValue, 10)){
		case 2:  // Range
			fieldStateChangeWr ('tf1_interface', '', 'tf1_startIpAddr tf1_endIpAddr', '');
            vidualDisplay ('tf1_startIpAddr tf1_endIpAddr', 'configRow');
            vidualDisplay ('break_startIpAddr break_endIpAddr', 'break');
            vidualDisplay ('tf1_interface break_interface', 'hide');
            $('#tf1_startIpAddr_div label').text(LANG_LOCALE['12968']);
            break;
        case 3:  //Interface
	        fieldStateChangeWr ('tf1_startIpAddr tf1_endIpAddr', '', 'tf1_interface', '');
            vidualDisplay ('tf1_interface', 'configRow');
            vidualDisplay ('break_interface', 'break');
            vidualDisplay ('tf1_startIpAddr tf1_endIpAddr break_startIpAddr break_endIpAddr', 'hide');
            break;
        case 1:  // IP
		default:
	        fieldStateChangeWr ('tf1_endIpAddr tf1_interface', '', 'tf1_startIpAddr', '');
            vidualDisplay ('tf1_startIpAddr', 'configRow');
            vidualDisplay ('break_startIpAddr', 'break');
            vidualDisplay ('tf1_endIpAddr break_endIpAddr tf1_interface break_interface', 'hide');
            $('#tf1_startIpAddr_div label').text(LANG_LOCALE['11387']);
            break;
	}
}


/**
 * This function calls click on Save button
 * onclick page validations
 * @method onclick Call
 */
function sessionLimitValidation () {
    var txtFieldIdArr = new Array();
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_txtProfileName, "+LANG_LOCALE['12189'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_startIpAddr, "+LANG_LOCALE['12294'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_endIpAddr, "+LANG_LOCALE['12294'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_sessionLimit, "+LANG_LOCALE['50214'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_scheduleProfile, "+LANG_LOCALE['11948'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) {
        return false;
    }
    
    if (alphaNumericValueCheck ("tf1_txtProfileName", '', '') == false) {
        return false;
    }
    
    if (ipv4Validate('tf1_startIpAddr', 'SN', false, true, LANG_LOCALE['11281']+'. ', LANG_LOCALE['11031'], true) == false) {
        return false;
    }
    
    if (ipv4Validate('tf1_endIpAddr', 'IP', false, true, LANG_LOCALE['11281']+'. ', LANG_LOCALE['11031'], true) == false) {
        return false;
    }
    
    var sessionLimitObj = document.getElementById('tf1_sessionLimit');
    if (numericValueRangeCheck(sessionLimitObj, '','', 1, 999, true, LANG_LOCALE['50157']+'. ', LANG_LOCALE['11718']) == false) {
        return false;
    }
    
    setHiddenChks('tf1_frmSessionLimit');
    return true;
}

function remainingCharCount () {
    var maxlimit = $('#tf1_warningMessage').attr('maxlength');
    maxlimit = parseInt(maxlimit, 10);
    var message = $("textarea#tf1_w