/*
 * File: bandwidthManagement.js
 * Created on 28th APR 2015 - Devaki
 * Copyright (c) 2015 TeamF1, Inc.
 * All rights reserved.
 */

/**
 * This function calls when user clicks on OnOff Buttons
 * OnClick validation
 * @method onloadCall
 */
$(document).ready(function(){
    onloadCall(bandwidthMgtOnload, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
    enableTextFieldByAnchorClick('tf1_enablebandwidthMgmt','tf1_service tf1_wanInterface tf1_bandwidthRate','break_service break_wanInterface break_bandwidthRate'); 
});


/**
 * Onload function
 * @method option1Onload
 * @param toggleObj - object
 */
function bandwidthMgtOnload(data, thisObj){
    onAnchorToggle(data);
    var imgId=thisObj.id;
    
    switch(imgId){
        case 'tf1_enablebandwidthMgmt':          
                enableTextFieldByAnchorClick('tf1_enablebandwidthMgmt','tf1_service tf1_wanInterface tf1_bandwidthRate','break_service break_wanInterface break_bandwidthRate');
        break;  
        
    }
}
/****
 * validate the form
 * @method bandwidthPageValidate
 */
function bandwidthPageValidate(frmId){
    var max = 99;
    var unitName = document.getElementById ('hdUnitName').value;
    if (unitName == "DSR-1000AC" || unitName == "DSR-1000")
        max = 249;
    else if (unitName == "DSR-500AC" || unitName == "DSR-500")
        max = 199;
    else
        max = 99;

    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_bandwidthRate,"+LANG_LOCALE['11975'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    var banwidthRateobj = document.getElementById('tf1_bandwidthRate');
    if (!banwidthRateobj.disabled) {
        if (numericValueRangeCheck (document.getElementById('tf1_bandwidthRate'), '', '', 1, max, true, LANG_LOCALE['50208']+'.', LANG_LOCALE['13657']) == false) {
        return false;
        }
    }
    var banwidthMgmtimgObj = document.getElementById("tf1_enablebandwidthMgmt");
    var banwidthMgmtcurrentClass = $(banwidthMgmtimgObj).attr("class");
    var bandwidthProfileStatusval = $("#tf1_bandwidthProfileStatus").val();
    if(banwidthMgmtcurrentClass == "enable-disable-on" && bandwidthProfileStatusval == "0" ){
	alert(LANG_LOCALE['50209']);
	return false;
    }
    setHiddenChks(frmId);
    return true;
}

/*Function reset of the form 
@method bandwidthMgtOnReset
*/
function bandwidthMgtOnReset(frmId) {

    resetImgOnOff(frmId);
    enableTextFieldByAnchorClick('tf1_enablebandwidthMgmt','tf1_service tf1_wanInterface tf1_bandwidthRate','break_service break_wanInterface break_bandwidthRate');     
}
