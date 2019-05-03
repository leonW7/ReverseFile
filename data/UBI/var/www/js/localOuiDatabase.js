/*
 * File: localOuiDatabase.js
 * Created on 20th Nov 2012 - Bala Krishna G
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * Validates fields in the page
 * @method localOuiDatabaseValidations
 */
function localOuiDatabaseValidations(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_ouiValue,Please enter the valid OUI Value";
    txtFieldIdArr[1] = "tf1_description,Please enter the valid OUI Description";
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    if(isValidOui("tf1_ouiValue") == false)
    	return false;
    
    var txtFieldIdArrDescription = new Array();
    txtFieldIdArrDescription[0] = "tf1_description,";
    
    
    if (isProblemCharArrayCheck(txtFieldIdArrDescription, "'\" ", NOT_SUPPORTED) == false) 
        return false;
    
    return true;
}

/**
 * Validates hexadecimal value
 * @method localOuiDatabaseValidations
 */
function isValidOui(fldId){
	var ouiPattern = /^(([0-9a-fA-F]){2}\:){2}([0-9a-fA-F]){2}$/;	
	var fldVal = document.getElementById(fldId).value;	
	if (fldVal.length != 8)
	  {
	    if (fldVal.length < 1)
	      alert(fldVal + "Enter OUI Value.");
	    else
	      alert(fldVal + " is not a valid OUI Value.");
	    return false;
	  }	  
	if(!fldVal.match(ouiPattern)){	
		alert("Not a valid OUI Value");
		document.getElementById(fldId).focus();	
		return false;	
	}
}
