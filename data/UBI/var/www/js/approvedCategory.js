/*
 * File: approvedCategory.js
 * Created on 28th jan 2013 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
 
/**
* This function calls at the time of page loads
* OnLoad validation
* @method upnpOnload
*/
$(document).ready(function() {

	onloadCall(approvedCategoryOnload, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});	
	enableTextFieldByAnchorClick('tf1_enableOverride','tf1_overridetimeout tf1_updateAccess','break_woverridetimeout break_updateAccess'); 	
//enableTextFieldByAnchorClick('tf1_enableGlobalFiltering','tf1_list1 tf1_list2 tf1_list3 tf1_list4 tf1_list5 tf1_list6 tf1_list7 tf1_list8 tf1_list9 tf1_list10 tf1_list11','break_list1 break_list2 break_list3 break_list4 break_list5 break_list6 break_list7 break_list8 break_list9 break_list10 break_list11');	
});

/**
 * Onload function
 * @method approvedCategoryOnload
 * @param toggleObj - object
 */
function approvedCategoryOnload(data, thisObj){
    onAnchorToggle(data);
    var imgId=thisObj.id;
    switch(imgId){
        case 'tf1_enableOverride':          
            enableTextFieldByAnchorClick(imgId,'tf1_overridetimeout tf1_updateAccess','break_woverridetimeout break_updateAccess'); 
        break;  
        
    }
    /*switch(imgId){
    	case 'tf1_enableGlobalFiltering':  		
    		enableTextFieldByAnchorClick(imgId,'tf1_list1 tf1_list2 tf1_list3 tf1_list4 tf1_list5 tf1_list6 tf1_list7 tf1_list8 tf1_list9 tf1_list10 tf1_list11','break_list1 break_list2 break_list3 break_list4 break_list5 break_list6 break_list7 break_list8 break_list9 break_list10 break_list11');
    	break;	
	}*/
}
function approvedCategoryOnReset(frmId){
	resetImgOnOff(frmId);
	//enableTextFieldByAnchorClick('tf1_enableGlobalFiltering','tf1_list1 tf1_list2 tf1_list3 tf1_list4 tf1_list5 tf1_list6 tf1_list7 tf1_list8 tf1_list9 tf1_list10 tf1_list11','break_list1 break_list2 break_list3 break_list4 break_list5 break_list6 break_list7 break_list8 break_list9 break_list10 break_list11');
}
/****
 * validate the form
 * @method appCategoryValidate
 */
function appCategoryValidate(frmId){
    var txtFieldIdArrCharG = new Array();
    txtFieldIdArrCharG[0] = "tf1_overridetimeout,"+LANG_LOCALE['30614'];
    if (txtFieldArrayCheck(txtFieldIdArrCharG) == false) 
        return false;
    if (isProblemCharArrayCheck(txtFieldIdArrCharG, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    overrideTimeoutValue = $("#tf1_overridetimeout").val();
    overrideTimeoutValue = parseInt(overrideTimeoutValue, 10);
    if(overrideTimeoutValue >= 60 && overrideTimeoutValue <=3600){
        if(overrideTimeoutValue % 60 === 0){
            
        }
        else{
            alert(LANG_LOCALE['50141'])
            return false;
        }
        }
    if (numericValueRangeCheck (document.getElementById('tf1_overridetimeout'), '', '', 60, 3600, true, LANG_LOCALE['14399']+'.', LANG_LOCALE['12732']) == false) {
        return false;
    }
    
    var flag = 0;
    $('#tf1_isEnableAll div a').each(function() {
        if ($(this).attr('class') == ON_ANCHOR) {
            flag = 1;
        }
    });
    
    var nonManagedAction = comboSelectedValueGet('tf1_nonManagedAction');
    if (flag == 0) {
        var currentCls = $('#tf1_enableOverride').attr('class');
        if (nonManagedAction == "1" || currentCls == ON_ANCHOR) {
            alert(LANG_LOCALE['50216']);
            return false;
        }
    }
    setHiddenChks(frmId);
}
