/*
 * File: lanDefault.js
 * Created on 19th nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * This function calls when user clicks on Checkbox images
 * OnClick validation
 * @method onloadCall
 */
$(document).ready(function(){
    onloadCall(lanDefaultRouteOnload, {
        imageId: '',
        disableIndividual: '',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: '',
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
 * @method lanDefaultRouteOnload
 * @param toggleObj - object
 */
function lanDefaultRouteOnload(toggleObj){
    onImageToggle(toggleObj);
}


/**
 * This function calls when user clicks on submit button.
 * OnSubmit validation
 * @method validateLanDefaultRoute
 */
function validateLanDefaultRoute(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_lanDefaultRouteGateway, Please enter a valid Gateway.";
    txtFieldIdArr[1] = "tf1_lanDefaultRouteDnsServer, Please enter a valid DNS Server.";
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    if (ipv4Validate('tf1_lanDefaultRouteGateway', 'IP', false, true, "Invalid From IP address.", "for octet", true) == false) 
        return false;
    
    if (ipv4Validate('tf1_lanDefaultRouteDnsServer', 'IP', false, true, "Invalid From IP address.", "for octet", true) == false) 
        return false;
    
}
