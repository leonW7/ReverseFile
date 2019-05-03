/*
* File: validAps.js
* Created on 29th Nov 2012 - Laxmi
* Copyright (c) 2012 TeamF1, Inc.
* All rights reserved.
*/
function onloadManageValidApsFn(){
    /**
     * This function calls when user clicks on Checkbox images
     * OnClick validation
     * @method onloadCall
     */
    onloadCall(manageValidApsOnload, {
        imageId: 'tf1_enableDebug',
        disableIndividual: 'tf1_txtPwd tf1_txtConfirmPwd',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break_txtPwd break_txtConfirmPwd',
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
    manageValidApsOnload({
        imageId: 'tf1_enableDebug',
        disableIndividual: 'tf1_txtPwd tf1_txtConfirmPwd',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break_txtPwd break_txtConfirmPwd',
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
 * @method manageValidApsOnload
 * @param toggleObj - object
 */
function manageValidApsOnload(toggleObj){
    onAnchorToggle(toggleObj);    
}


/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method validatePowerSettingsConfig
 */
function validatePowerSettingsConfig() {
	var txtFieldIdArr = new Array();
	txtFieldIdArr[0] = "tf1_power,Please enter valid Power.";
	

	if (txtFieldArrayCheck(txtFieldIdArr) == false)
		return false;
		
	if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;

	if (numericValueRangeCheck(document.getElementById('tf1_power'), '', '', 1, 100,true, 'Invalid Power', '%') == false)
	    return false; 
	    
	
	return true;
}


/**
* function for validate form when user clicks on submit button
* OnSubmit event
* @method validatePowerSettingsConfig
*/
function validateManagedAPDebug(frmId) {
	var txtFieldIdArr = new Array();
	txtFieldIdArr[0] = "tf1_txtPwd,Please enter valid Password.";
	txtFieldIdArr[1] = "tf1_txtConfirmPwd,Please enter valid Confirm Password.";

	if (txtFieldArrayCheck(txtFieldIdArr) == false)
		return false;
		
	if(fieldLengthCheck('tf1_txtPwd',1,8,'Password Length Must be between 1 and 8')==false)
		return false;
		
	if(fieldLengthCheck('tf1_txtConfirmPwd',1,8,'Confirm Password Length Must be between 1 and 8')==false)
		return false;

	var pwdObj = document.getElementById('tf1_txtPwd');
	var pwdConObj = document.getElementById('tf1_txtConfirmPwd');
	
	if(pwdObj && !pwdObj.disabled){
		if(pwdObj.value != pwdConObj.value){
			alert("Passwords must be Same.");
			document.getElementById('tf1_txtConfirmPwd').focus();
			return false;
		}
	}
setHiddenChks(frmId);	
return true;
}

