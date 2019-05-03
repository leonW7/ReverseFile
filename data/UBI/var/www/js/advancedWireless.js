/*
 * File: advancedWireless.js
 * Created on 14th Mar 2012 - Lakshmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
 /**
* This function calls at the time of page loads
*/
 $(document).ready(function() {
	onloadCall(advWirelessOnload, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
	enableTextFieldByAnchorClick('tf1_enableRTS','tf1_rtsThreshold','break_rtsThreshold');

    var productId = $("#hdProductId").val();
    if ( productId == "DSR-500AC_Ax" ) {
	    fieldStateChangeWr ('tf1_fragmentationThreshold','','','');
		vidualDisplay('tf1_fragmentationThreshold break_fragmentationThreshold', 'hide');
		var operatingFrequency = $("#opFreq").val();
		if(operatingFrequency == "a"){
		    fieldStateChangeWr ('tf1_protectionMode','','','');
			vidualDisplay('tf1_protectionMode break_protectionMode', 'hide');	
        }
    }

    if (productId == "DSR-1000AC_Ax" || productId == "DSR-500AC_Ax") {
        var radioOperatingMode = $("#opMode").val();
        if(radioOperatingMode == "a only" || radioOperatingMode == "b and g" || radioOperatingMode == "g only" || radioOperatingMode == "b only"){
            fieldStateChangeWr ('tf1_txAntenna tf1_rxAntenna','','','');
            vidualDisplay('tf1_txAntenna tf1_rxAntenna', 'hide');   
            vidualDisplay('break_txAntenna break_rxAntenna', 'hide');  
        }
        /* 46848 starts */
         if(radioOperatingMode != "b and g" ){
             vidualDisplay('tf1_preambleMode', 'hide');   
            vidualDisplay('break_preambleMode', 'hide');  
        }
         /* 46848 ends */
    }
});
/****
 * cancel click
 * @method advWireless5hzReset
 */
function advWirelessReset(frmId){
	resetImgOnOff(frmId);
	enableTextFieldByAnchorClick('tf1_enableRTS','tf1_rtsThreshold','break_rtsThreshold');
}

function advWirelessOnload(data, thisObj) {
    onAnchorToggle (data);
    var imgId= thisObj.id;    
    
    switch(imgId){
    	case 'tf1_multiToUnicast':
            if ($("#"+imgId).attr("class") == "enable-disable-on")
            {
    	        var msg = LANG_LOCALE['30547'];
               var conf = confirm (msg);
                if (conf == false) {                
                    if ($("#"+imgId).attr("class") == "enable-disable-on" ) {     	
                        $("#"+imgId).attr("class","enable-disable-off");
	     	        }
                    else { 
                        $("#"+imgId).attr("class","enable-disable-on");
	     	        }
                }
            }
    	break;
        case 'tf1_enableRTS':
    		enableTextFieldByAnchorClick(imgId,'tf1_rtsThreshold','break_rtsThreshold');    		
    	break;
    } 	
}
 /**
 * This function calls when user clicks on submit button
 * On submit validation
 * @method advancedWirelessValidate
 */
function advancedWirelessValidate(frmId){

    var txtValidArray = new Array();
    txtValidArray[0] = "tf1_beaconInterval, "+LANG_LOCALE['11977'];
    txtValidArray[1] = "tf1_DtimInterval, "+LANG_LOCALE['12005'];
    txtValidArray[2] = "tf1_rtsThreshold, "+LANG_LOCALE['12107'];
    txtValidArray[3] = "tf1_fragmentationThreshold, "+LANG_LOCALE['12014'];
    
    if (txtFieldArrayCheck(txtValidArray) == false) 
        return false;
    
    var beaconObj = document.getElementById('tf1_beaconInterval');
    if (beaconObj.value && !beaconObj.disabled) {
        if (numericValueRangeCheck(beaconObj, '', '', 40, 3500 , true, LANG_LOCALE['11225']+'.', '') == false) 
            return false;
    }

    var dtimObj = document.getElementById('tf1_DtimInterval');
    if (dtimObj.value && !dtimObj.disabled) {
        if (numericValueRangeCheck(dtimObj, '', '', 1, 255, true, LANG_LOCALE['11253']+'.', '') == false) 
            return false;
    }

	var rtsObj = document.getElementById('tf1_rtsThreshold');
    if (rtsObj.value && !rtsObj.disabled) {
        if (numericValueRangeCheck(rtsObj, '', '', 256, 2346 , true, LANG_LOCALE['11344']+'.', '') == false) 
            return false;
    }

	var fragObj = document.getElementById('tf1_fragmentationThreshold');
    if (fragObj.value && !fragObj.disabled) {
        if (numericValueRangeCheck(fragObj, '', '', 257, 2346 , true, LANG_LOCALE['11264']+'.', '') == false) 
            return false;
    }

	setHiddenChks(frmId);    
    return true;
}
