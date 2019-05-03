/*
 * File: wdsGroupConfig.js
 * TeamF1 Inc, 2012
 * Created on 12th Feb 2013 - Lakshmi
 */
// Call onload
window.onload = function(){
    onloadCall (enableDisableFieldsByImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});        
    
    enableTextFieldByImageClick('tf1_group1','tf1_groupName1 tf1_snappingTree1 tf1_enableDisablePassword1 tf1_groupPassword1','break_groupName1 break_snappingTree1 break_enableDisablePassword1 break_groupPassword1');
    
    enableTextFieldByImageClick('tf1_group2','tf1_groupName2 tf1_snappingTree2 tf1_enableDisablePassword2 tf1_groupPassword2','break_groupName2 break_snappingTree2 break_enableDisablePassword2 break_groupPassword2');
	enableTextFieldByImageClick('tf1_enableDisablePassword1','tf1_groupPassword1','break_groupPassword1');  
	enableTextFieldByImageClick('tf1_enableDisablePassword2','tf1_groupPassword2','break_groupPassword2'); 

}

/**
* displays corresponding fields on ImageToggle
* @method enableDisableFieldsByImageClick
* @param data - image data
* @param thisObj - currtent image id
*/
function enableDisableFieldsByImageClick(data, thisObj) { 
    onImageToggle (data);
    var imgId=thisObj.id;
    switch(imgId){    	
    	case 'tf1_group1':
    		enableTextFieldByImageClick('tf1_group1','tf1_groupName1 tf1_snappingTree1 tf1_enableDisablePassword1 tf1_groupPassword1','break_groupName1 break_snappingTree1 break_enableDisablePassword1 break_groupPassword1');
    		var imgObjVal = document.getElementById(imgId).src;
        	var imageName = imgObjVal.substring(imgObjVal.lastIndexOf('/') + 1);
        	if (imageName == OFF_IMAGE) {
        		fieldStateChangeWr ('tf1_groupPassword1','','','');  
    		}else{
    			enableTextFieldByImageClick('tf1_enableDisablePassword1','tf1_groupPassword1','break_groupPassword1');
    	  	}
    	break;
    	
    	case 'tf1_group2':
    		enableTextFieldByImageClick('tf1_group2','tf1_groupName2 tf1_snappingTree2 tf1_enableDisablePassword2 tf1_groupPassword2','break_groupName2 break_snappingTree2 break_enableDisablePassword2 break_groupPassword2');
    		var imgObjVal = document.getElementById(imgId).src;
        	var imageName = imgObjVal.substring(imgObjVal.lastIndexOf('/') + 1);
        	if (imageName == OFF_IMAGE) {
        		fieldStateChangeWr ('tf1_groupPassword2','','','');  
    		}else{
    			enableTextFieldByImageClick('tf1_enableDisablePassword2','tf1_groupPassword2','break_groupPassword2');
    	  	}
    	break;
    	
    	case 'tf1_enableDisablePassword1':
    		enableTextFieldByImageClick('tf1_enableDisablePassword1','tf1_groupPassword1','break_groupPassword1');    
    	break;

		case 'tf1_enableDisablePassword2':
    		enableTextFieldByImageClick('tf1_enableDisablePassword2','tf1_groupPassword2','break_groupPassword2');    	
    	break;
	}
}

/**
 * This function for enable or disable fields while clicking on on off image
 * Onclick event
 * @method enableTextFieldByImageClick
 * @param imgId - image Id
 * @param fieldIds - space separated field names
 * @param brk - space separated break names
 */
function enableTextFieldByImageClick(imgId,fieldIds,brk){	
	var imgObjVal = document.getElementById(imgId).src;    
    var imageName = imgObjVal.substring (imgObjVal.lastIndexOf ('/') + 1);
   	if (imageName == ON_IMAGE) {    	           
   		fieldStateChangeWr ('', '', fieldIds, '');
       	vidualDisplay(fieldIds,'configRow');	   
       	vidualDisplay (brk,'break');
	}else if (imageName == OFF_IMAGE) {   
   		fieldStateChangeWr (fieldIds, '', '', '');
   	    vidualDisplay(fieldIds,'hide');
   	    vidualDisplay (brk,'hide');
    }
}

/****
 * validate the form
 * @method wdsGroupConfigValidate
 */
function wdsGroupConfigValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_groupName1,Please enter a valid WDS Group1 Name";
    txtFieldIdArr[1] = "tf1_groupPassword1,Please enter a valid WDS Group1 Password"; 
    txtFieldIdArr[2] = "tf1_groupName2,Please enter a valid WDS Group2 Name";
    txtFieldIdArr[3] = "tf1_groupPassword2,Please enter a valid WDS Group2 Password";    
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    return true
}
