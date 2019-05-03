/*
 * File: radiusAccountingCfg.js
 * Created on 07th Sep 2016 - Ramakrishna Reddy P.M.
 * mCopyright (c) 2013-2016, TeamF1 Networks Pvt. Ltd. 
 * (Subsidiary of D-Link India) 
 * All rights reserved.
 */
/**
 * This function calls when user clicks on ON/OFF images
 * OnClick validation
 * @method onloadCall
 */
$(document).ready(function(){
    onloadCall(radiusAccCfgOnload, {
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
 * @method radiusAccCfgOnload
 * @param toggleObj - object
 */
function radiusAccCfgOnload(toggleObj){
    onImageToggle(toggleObj);
}

/*
 * This function calls when user clicks on Save button
 * onsubmit validations
 * @method radiusAccConfigValidate
 * @param form Id
 * */

function radiusAccConfigValidate(frmId){

	var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_interimInterval, "+LANG_LOCALE['50079'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    var interimObj = document.getElementById('tf1_interimInterval');
    if (interimObj && !interimObj.disabled) {
        if (numericValueRangeCheck(interimObj, 1, '', 300, 3600, true, LANG_LOCALE['11278']+".", LANG_LOCALE['11167']+" ") == false) 
            return false;
    }

    setHiddenChks(frmId);
    return true;
}

/*
 * This function call when user click on Cancel button
 * @method radiusAccOnreset
 * @param form Id
 * */
function radiusAccOnreset (frmId) {
   resetImgOnOff(frmId); 
}
