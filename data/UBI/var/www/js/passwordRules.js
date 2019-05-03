/**
 * File: passwordRules.js
 * Created on 31st Oct 2012 - Bala Krishna G
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 **/
/**
 * Validates fields in the page
 * @method pageValidate
 **/
function pageValidate(){
	var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_passwordLength, Please enter a valid Minimal Password Length.";
    txtFieldIdArr[1] = "tf1_minNumericChar, Please enter a valid Minimal Numeric Characters.";
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
	
    var myObj = document.getElementById('tf1_passwordLength');
    var value = parseInt(myObj.value, 10);
    if (numericValueRangeCheck(myObj, '', '', 4, 64, true, 'Invalid Minimal Password Length.', '') == false) 
        return false;
    
    var myObj = document.getElementById('tf1_minNumericChar');
    var value = parseInt(myObj.value, 10);
    if (numericValueRangeCheck(myObj, '', '', 0, 4, true, 'Invalid Minimal Numeric Characters', '') == false) 
        return false;
        
   return true;
    
}
