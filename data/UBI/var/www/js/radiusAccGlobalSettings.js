/*
 * File: radiusAccGlobalSettings.js
 * Created on 4th Dec 2013 - Ramakrishna PM
 * Copyright (c) 2013 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * This function calls when user clicks on submit button
 * On submit validation
 * @method radiusConfValidate
 */
/**
 	* This function calls when user clicks on submit button
	* On submit validation
 	* @method upnpConfValidate
 	*/
	function radiusConfValidate(frmId){

	var txtFieldIdArr = new Array();
    	    txtFieldIdArr[0] = "tf1_interimInterval, Please enter valid advertisement Period.";
    
    	if (txtFieldArrayCheck(txtFieldIdArr) == false) 
            return false;

    	var interimObj = document.getElementById('tf1_interimInterval');
    	if (interimObj && !interimObj.disabled) {
        if (numericValueRangeCheck(interimObj, 1, '', 300, 3600, true, "Invalid Interim Interval.", " in seconds.") == false) 
            return false;
    }
    setHiddenChks(frmId);
    return true;
}


/**
 * This function calls at the time of page loads
 * OnLoad validation
 * @method pptClientOnload
 */
$(document).ready(function(){
    radiusAccOnload({
        imageId: 'tf1_chkInterim',
        disableIndividual: 'tf1_interimInterval',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break_interimInterval',
        breakClass: 'break',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    });
    onloadCall(radiusAccOnload, {
        imageId: 'tf1_chkInterim',
        disableIndividual: 'tf1_interimInterval',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break_interimInterval',
        breakClass: 'break',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    });
});

/**
 * Onload function
 * @method pptClientOnload
 * @param toggleObj - object
 */
function radiusAccOnload(toggleObj){
    onAnchorToggle(toggleObj);
}



function radiusAccOnreset() {
 radiusAccOnload({
        imageId: 'tf1_chkInterim',
        disableIndividual: 'tf1_interimInterval',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break_interimInterval',
        breakClass: 'break',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    });


}
