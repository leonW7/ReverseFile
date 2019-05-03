/*
 * File: wdsGroupConfig.js
 * TeamF1 Inc, 2012
 * Created on 12th Feb 2013 - Lakshmi
 */
// Call onload
function onloadwdsManagedAPGroupsFn(){
    onloadCall (enableDisableFieldsByImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
    enableTextFieldByAnchorClick('tf1_enableDisablePassord','tf1_groupPassword','break_groupPassword');
}

/**
* displays corresponding fields on ImageToggle
* @method enableDisableFieldsByImageClick
* @param data - image data
* @param thisObj - currtent image id
*/
function enableDisableFieldsByImageClick(data, thisObj) { 
    onAnchorToggle(data);
    var imgId=thisObj.id;
    switch(imgId){    	
    	case 'tf1_enableDisablePassord':
    		enableTextFieldByAnchorClick('tf1_enableDisablePassord','tf1_groupPassword','break_groupPassword');
    	break;
	}
}

/****
 * validate the form
 * @method wdsGroupConfigValidate
 */
function wdsGroupConfigValidate(frmId){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_groupName,Please enter a valid WDS Group Name";
    txtFieldIdArr[1] = "tf1_groupPassword,Please enter a valid WDS Group Password";    
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;

    var groupPwdObj=document.getElementById('tf1_groupPassword');
    if(groupPwdObj && !groupPwdObj.disbaled){
        if(fieldLengthCheck ('tf1_groupPassword', 8, 63, 'Invalid Password: Please enter WDS Group Password length between 8 - 63 characters') == false)
	return false;
	}

    setHiddenChks(frmId);
    return true;
}
