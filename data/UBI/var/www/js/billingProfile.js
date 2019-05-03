/*
 * File: captivePortalBillingProfile.js    
 * Created on 12th Feb 2013 - Bala Krishna G
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
    

function onchangeValue(){
			$('#tf1_beginFromValue').val($('#tf1_beginFrom').val());
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
    	case 'tf1_validBeginEndTime':
    		enableTextFieldByAnchorClick('tf1_validBeginEndTime','tf1_validBeginSelect tf1_startWhileAccCreated tf1_startWhileAccCreatedSelect tf1_startWhileAccLogin tf1_startWhileAccLoginSelect tf1_beginFromValue tf1_beginFrom tf1_allowfrontDesk','break8 break9 break10 break11 break12')
			changeValidBeginLimit('tf1_validBeginSelect');
    	break;    	
    	case 'tf1_maxUsageTime':
    		enableTextFieldByAnchorClick(imgId,'tf1_maxUsageTimeText tf1_maxUsageTimeSelect tf1_allowFrontDesktoModify', '');      		
	    	break;    	
    	case 'tf1_maxUsageTraffic':
    		enableTextFieldByAnchorClick(imgId,'tf1_maxUsageTrafficText tf1_maxUsageTrafficSelect tf1_allowFrontDesktoModify','');
    	break;			
        case 'tf1_setPrice':
            enableTextFieldByAnchorClick('tf1_setPrice','tf1_price tf1_monetaryUnit','break_price break_monetaryUnit');
        break;
    }
}
/****
 * This function calls when user selects an option from select box
 * OnChange event
 * @method changeValidBeginLimit
 * @param selName - Select box Name
 */
function changeValidBeginLimit(selName){
	var selValue = comboSelectedValueGet (selName);	
	switch (parseInt(selValue, 10)){
		case 1: /* Start while account created */		
			fieldStateChangeWr ('tf1_startWhileAccLogin tf1_startWhileAccLoginSelect tf1_beginFromValue','','tf1_startWhileAccCreated tf1_startWhileAccCreatedSelect','');
			vidualDisplay ('tf1_startWhileAccCreated tf1_startWhileAccCreatedSelect', 'configRow');
			vidualDisplay ('tf1_startWhileAccLogin tf1_startWhileAccLoginSelect tf1_beginFromValue tf1_beginFrom', 'hide');
			vidualDisplay ('break9', 'break');
			vidualDisplay ('break11 break12', 'hide');
			break;				
		case 2: /* Start while account login */
			fieldStateChangeWr ('tf1_startWhileAccCreated tf1_startWhileAccCreatedSelect tf1_beginFromValue','','tf1_startWhileAccLogin tf1_startWhileAccLoginSelect','');
			vidualDisplay ('tf1_startWhileAccLogin tf1_startWhileAccLoginSelect', 'configRow');
			vidualDisplay ('tf1_startWhileAccCreated tf1_startWhileAccCreatedSelect tf1_beginFromValue tf1_beginFrom', 'hide');
			vidualDisplay ('break11', 'break');
			vidualDisplay ('break9 break12', 'hide');
			break;
		case 3: /* Begin From */
			fieldStateChangeWr ('tf1_startWhileAccCreated tf1_startWhileAccCreatedSelect tf1_startWhileAccLogin tf1_startWhileAccLoginSelect','','tf1_beginFromValue','');
			vidualDisplay ('tf1_beginFromValue', 'configRow');
			vidualDisplay ('tf1_beginFrom', '');
			vidualDisplay ('tf1_startWhileAccCreated tf1_startWhileAccCreatedSelect tf1_startWhileAccLogin tf1_startWhileAccLoginSelect', 'hide');
			vidualDisplay ('break12', 'break');
			vidualDisplay ('break11 break9', 'hide');
			break;
	}
}
/**
* function for validate form when user clicks on submit button
* OnSubmit event
* @method ssidBillingProfileFormValidate
*/ 
function ssidBillingProfileFormValidate(frmId){
    var txtFieldIdArr = new Array ();     
    txtFieldIdArr[0] = "tf1_profileName,Please enter valid Profile Name";
    txtFieldIdArr[1] = "tf1_profileDescription,Please enter valid Profile Description";
    txtFieldIdArr[2] = "tf1_sessionIdleTimeout,Please enter valid Session Idle Timeout";
    txtFieldIdArr[3] = "tf1_alertMsgLogin,Please enter valid Show alert messsage on login page while rest of usage time/traffic under";
    txtFieldIdArr[4] = "tf1_startWhileAccCreated,Please enter valid Start while account created";
	txtFieldIdArr[5] = "tf1_startWhileAccLogin,Please enter valid Start while account login";
	txtFieldIdArr[6] = "tf1_beginFromValue,Please enter valid Begin From";
	txtFieldIdArr[7] = "tf1_maxUsageTimeText,Please enter valid Maximum Usage Time";
	txtFieldIdArr[8] = "tf1_maxUsageTrafficText,Please enter valid Maximum Usage Traffic";
    txtFieldIdArr[9] = "tf1_price,Please enter valid price";
    txtFieldIdArr[10] = "tf1_monetaryUnit,Please configure atleast one payment gateway server";

	if (txtFieldArrayCheck(txtFieldIdArr) == false)
	    return false;
	    
	var txtFieldIdArrChar = new Array ();     
    txtFieldIdArrChar[0] = "tf1_profileName,Please enter valid Profile Name";
    txtFieldIdArrChar[1] = "tf1_sessionIdleTimeout,Please enter valid Session Idle Timeout";    
    txtFieldIdArrChar[2] = "tf1_startWhileAccCreated,Please enter valid Start while account created";
	txtFieldIdArrChar[3] = "tf1_startWhileAccLogin,Please enter valid Start while account login";
	//txtFieldIdArrChar[4] = "tf1_beginFromValue,Please enter valid Begin From";
	txtFieldIdArrChar[4] = "tf1_maxUsageTimeText,Please enter valid Maximum Usage Time";
	txtFieldIdArrChar[5] = "tf1_maxUsageTrafficText,Please enter valid Maximum Usage Traffic";
	
	if (isProblemCharArrayCheck(txtFieldIdArrChar, '\'" ', NOT_SUPPORTED) == false) 
        return false;  	    
	  
	if (numericValueRangeCheck(document.getElementById('tf1_sessionIdleTimeout'), '', '', 1, 60,true, 'Invalid Session Idle Timeout', '') == false)
	    return false;   	
	 
	if (checkLifetime('tf1_alertMsgLogin','tf1_alertMsgLoginSelect') == false)
		return false;
        
	if (checkLifetime('tf1_startWhileAccCreated','tf1_startWhileAccCreatedSelect') == false)
		return false;   
	
	if (checkLifetime('tf1_startWhileAccLogin','tf1_startWhileAccLoginSelect') == false)
		return false;    		    
	
	if (checkLifetime('tf1_maxUsageTimeText','tf1_maxUsageTimeSelect') == false)
		return false;    
		 
	if (checkLifetime('tf1_maxUsageTrafficText','tf1_maxUsageTrafficSelect') == false)
		return false;	    
	
	setHiddenChks(frmId);
    if (document.getElementById("tf1_hidmaxTrafficUsageCheck").value == 0 && document.getElementById("tf1_hidmaxUsageTimeCheck").value == 0 && document.getElementById("tf1_hidvalidBeginEndTime").value == 0)
	{
		alert("Profile cannot be created. Please select Basic limit by duration/Basic limit by usage.");
		return false;
	}

    var priceObj = document.getElementById('tf1_price');
    if (priceObj && priceObj.disabled == false) {
    
            if (validatePrice(priceObj) == false )
                {
                    alert("Please enter a valid price");
                    return false;
                }

    }
        
	return true;

}
/****
 * This function calls when user selects an option from select box
 * OnChange event
 * @method checkLifetime
 * @param selFld - Select box Name
 * @param txtFld - Text box Name
 */
function checkLifetime(txtFld,selFld) {
	var lifetimeObj = document.getElementById(txtFld);
	
	if (lifetimeObj.value == "0") {
		return true;
	}
	var selValue = comboSelectedValueGet (selFld);	
	switch (parseInt(selValue, 10)){
		case 1: /* Hour */
			return numericValueRangeCheck(lifetimeObj, '', '', 1, 23, true, '', 'hours');
		break;
		case 2: /* Hour */
			return numericValueRangeCheck(lifetimeObj, '', '', 1, 365, true, '', 'days');
		break;
		case 3: /* Hour */
			return numericValueRangeCheck(lifetimeObj, '', '', 1, 1023, true, '', 'MBs');
		break;
		case 4: /* Hour */
			return numericValueRangeCheck(lifetimeObj, '', '', 1, 100, true, '', 'GBs');
		break;	
	}
	return true;
}

function validatePrice(price)
{
    
    if (price.value !== "") {
        if (! (/^\d*(?:\.\d{0,2})?$/.test(price.value))) {
           // alert("Please enter a valid price");
            price.focus();
            return false;
        }
    }
    return true;       
}
