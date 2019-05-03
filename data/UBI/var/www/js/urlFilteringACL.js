/*
 *This function called when the page is loading.
 * */
jQuery(function(){
	onloadCall(onConfigureChange, {imageId: '', disableIndividual: '', disableGrp: '', enableIndividual: '', enableGrp: '', hideClass: 'hide', showClass: 'configRow',  breakDivs: '', breakClass: 'break', imagesInfo: {disableImages: '', enableImages: '', disableClass: '', enableClass: ''}});
    enableTextFieldByAnchorClick('aclStatus','tf1_action','break_action');
});

/*
 *This function called when user clicks on ON/OFF button
 * and called hide and show field actions dependent on ON/OFF button.
 * */
function onConfigureChange(data, thisObj){
    onAnchorToggle (data);
    var imgId=thisObj.id;
    
    switch(imgId){
    	case 'aclStatus':
    		enableTextFieldByAnchorClick('aclStatus','tf1_action','break_action');		
    	break;
    } 	
}

/*
 * This function called when user click on Cancel button
 * and changes can revert back to current values.
 */
function validateOnReset(frmId) {
	resetImgOnOff(frmId);
	enableTextFieldByAnchorClick('aclStatus','tf1_action','break_action');
}

/*
 *This function is calling when the form page is loading.
 * */
function onLoadurlFilteringACLFn ()
    {
        changePolicyType ('tf1_type');
    }

function changePolicyType (selId)
    {
        var selValue = comboSelectedValueGet(selId);
	    if (!selValue)
		    return;
	    switch (parseInt(selValue, 10)) {
		    case 0:
			    /* Single IP */
			    fieldStateChangeWr('tf1_startIP tf1_endIP tf1_lanInterface', '', 'tf1_IP', '');
			    vidualDisplay('tf1_IP', 'configRow');
			    vidualDisplay('break_IP', 'break');
			    vidualDisplay('tf1_startIP tf1_endIP tf1_lanInterface break_startIP break_endIP break_lanInterface', 'hide');
			    break;

		    case 1:
			    /* Range */
			    fieldStateChangeWr('tf1_IP tf1_lanInterface', '', 'tf1_startIP tf1_endIP', '');
			    vidualDisplay('tf1_startIP tf1_endIP', 'configRow');
			    vidualDisplay('break_startIP break_endIP', 'break');
			    vidualDisplay('tf1_IP tf1_lanInterface break_IP break_lanInterface', 'hide');
			    break;

		    case 2:
			    /* Interface */
			    fieldStateChangeWr('tf1_IP tf1_startIP tf1_endIP', '', 'tf1_lanInterface', '');
			    vidualDisplay('tf1_lanInterface', 'configRow');
			    vidualDisplay('break_lanInterface', 'break');
			    vidualDisplay('tf1_IP tf1_startIP tf1_endIP break_IP break_startIP break_endIP', 'hide');
			    break;
	    }
    }

function pageValidation () {
    var txtFieldIdArr = new Array ();
    txtFieldIdArr[0] = "tf1_profileName, "+LANG_LOCALE['12080'];
    txtFieldIdArr[1] = "tf1_IP, "+LANG_LOCALE['12028'];
    txtFieldIdArr[2] = "tf1_startIP, "+LANG_LOCALE['12028'];
    txtFieldIdArr[3] = "tf1_endIP, "+LANG_LOCALE['12028'];

    if (txtFieldArrayCheck(txtFieldIdArr) == false)
	    return false;
    
    if (ipv4Validate ('tf1_IP', 'IP', false, true, LANG_LOCALE['11281']+". ", LANG_LOCALE['11031']+" ", true) == false)
    	return false;

    if (ipv4Validate ('tf1_startIP', 'IP', false, true, LANG_LOCALE['11281']+". ", LANG_LOCALE['11031']+" ", true) == false)
    	return false;

    if (ipv4Validate ('tf1_endIP', 'IP', false, true, LANG_LOCALE['11281']+". ", LANG_LOCALE['11031']+" ", true) == false)
    	return false;

    if (alphaNumericValueCheck ("tf1_profileName", '', '') == false)    
        return false;

    setHiddenChks("tf1_frmURLFilteringACL1");
	return true;
}
