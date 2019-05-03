/*
 * File: captivePortalSla.js
 * Created on 12th Feb 2013 - Bala Krishna G
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
 
$(document).ready(function(){
    /**
     * This function calls when user clicks on Checkbox images
     * OnClick validation
     * @method onloadCall
     */
    onloadCall(captivePortalOnload, {
        imageId: 'tf1_enableTermsOfServiceRules',
        disableIndividual: 'tf1_termsOfServiceRule',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break_termsOfServiceRule',
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
    captivePortalOnload({
        imageId: 'tf1_enableTermsOfServiceRules',
        disableIndividual: 'tf1_termsOfServiceRule',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break_termsOfServiceRule',
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
 * function for toggle the image
 * @method remoteManagementOnload
 * @param toggleObj - object
 */
function captivePortalOnload(toggleObj){
    onAnchorToggle(toggleObj);    
}

 
/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method ssidSlaValidate
 */
function ssidSlaValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_termsOfServiceRule, Please enter valid Terms of service rule Settings";
	
	if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
           return true;

}

function captivePortalOnreset(frmId){
    resetImgOnOff(frmId);  
    captivePortalOnload({
        imageId: 'tf1_enableTermsOfServiceRules',
        disableIndividual: 'tf1_termsOfServiceRule',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break_termsOfServiceRule',
        breakClass: 'break',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    });
}

