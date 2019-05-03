/*
* File: ldapServer.js
* Created on 28th Nov 2012 - Laxmi
* Modified on 5th Nov 2015 - Ramakrishna Reddy P.M
* Copyright (c) 2012 TeamF1, Inc.
* All rights reserved.
*/

/* While loading the page below part of code will execute */
$(document).ready (function (){
    var checkNow = $("#checkNowId").val ();

    if (checkNow == "1")
        {
            serverStatusWr ('ldap');
        }
});

/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method ldapServerFormValidate
 */
function ldapServerFormValidate() {
	var txtFieldIdArr = new Array();
	txtFieldIdArr[0] = "tf1_ldapAuthServer1,"+LANG_LOCALE['12225']+1;
	txtFieldIdArr[1] = "tf1_ldapBaseDn1,"+LANG_LOCALE['12301'];
	txtFieldIdArr[2] = "tf1_ldapTimeout,"+LANG_LOCALE['12407'];
	txtFieldIdArr[3] = "tf1_ldapRetries,"+LANG_LOCALE['12362'];

    var txtFieldArrLdap = new Array();
  	txtFieldArrLdap[0] = "tf1_ldapBaseDn1,"+LANG_LOCALE['12301'];
    txtFieldArrLdap[1] = "tf1_ldapBaseDn2,"+LANG_LOCALE['12301'];
    txtFieldArrLdap[2] = "tf1_ldapBaseDn3,"+LANG_LOCALE['12301'];

	if (txtFieldArrayCheck(txtFieldIdArr) == false)
		return false;

    if (isProblemCharArrayCheck(txtFieldArrLdap, '\'" ', NOT_SUPPORTED) == false) 
        return false;

	if (ipv4Validate('tf1_ldapAuthServer1', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
		return false;
	
	var authServerObj = document.getElementById('tf1_ldapAuthServer2');
    
    if(authServerObj && authServerObj.value != "") {
		if (ipv4Validate('tf1_ldapAuthServer2', 'IP', true, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
		return false;
	}

	authServerObj = document.getElementById('tf1_ldapAuthServer3');
    if(authServerObj && authServerObj.value != "") {
		if (ipv4Validate('tf1_ldapAuthServer3', 'IP', true, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
		return false;
	}

	var ldapObj = document.getElementById('tf1_ldapAttribute1');    
    if(ldapObj && ldapObj.value != "")
        {
        if (alphaNumericValueCheck ("tf1_ldapAttribute1", "!@#$%^&()-_{}.~", LANG_LOCALE['30252']+':') == false)
		return false;
        }
    
    ldapObj = document.getElementById('tf1_ldapAttribute2');    
    if(ldapObj && ldapObj.value != "")
        {
        if (alphaNumericValueCheck ("tf1_ldapAttribute2", "!@#$%^&()-_{}.~", LANG_LOCALE['30252']+':') == false)
		return false;
        }
        
    ldapObj = document.getElementById('tf1_ldapAttribute3');    
    if(ldapObj && ldapObj.value != "")
        {
        if (alphaNumericValueCheck ("tf1_ldapAttribute3", "!@#$%^&()-_{}.~", LANG_LOCALE['30252']+':') == false)
		return false;
        }
    
    ldapObj = document.getElementById('tf1_ldapAttribute4');    
    if(ldapObj && ldapObj.value != "")
        {
        if (alphaNumericValueCheck ("tf1_ldapAttribute4", "!@#$%^&()-_{}.~", LANG_LOCALE['30252']+':') == false)
		return false;
        }

    if ( !isDependent (['tf1_ldapAuthServer1', 'tf1_ldapBaseDn1'], LANG_LOCALE['30253'] ) ) {
         return false;   
    }
    
    if ( !isDependent (['tf1_ldapAuthServer2', 'tf1_ldapBaseDn2'], LANG_LOCALE['30254'] ) ) {
         return false;   
    }
    
    if ( !isDependent (['tf1_ldapAuthServer3', 'tf1_ldapBaseDn3'], LANG_LOCALE['30255'] ) ) {
         return false;   
    }

    var timeObj = document.getElementById ('tf1_ldapTimeout');
    if (timeObj)
        {
            if (numericValueRangeCheck1 (timeObj, '', '', 1, true, LANG_LOCALE['30406']+':', '') == false)
                return false;
        }

    var retriObj = document.getElementById ('tf1_ldapRetries');
    if (retriObj)
        {
            if (numericValueRangeCheck1 (retriObj, '', '', 5, true, LANG_LOCALE['30407']+':', '') == false)
                return false;
        }
    
    var combinedValue = (document.getElementById('tf1_ldapTimeout').value) * (document.getElementById('tf1_ldapRetries').value);
    if (combinedValue > 30)
        {
            alert(LANG_LOCALE['30256']);
            return false;
        }

    var txtFieldIdArr2 = new Array ();
    
    //First Administrator account
    if ( !isDependent (['tf1_firstAdmin', 'tf1_firstAdminPassword'], LANG_LOCALE['30257'] ) ) {
         return false;   
    }
        
    txtFieldIdArr2[0] = "tf1_ldapAuthServer1,"+LANG_LOCALE['30258'];
    txtFieldIdArr2[1] = "tf1_firstAdminPassword,"+LANG_LOCALE['30259'];
    txtFieldIdArr2[2] = "tf1_firstAdmin,"+LANG_LOCALE['30260'];
     
    if ( !validateAccount ('tf1_firstAdmin', txtFieldIdArr2)) {
        return false;
    }
    
    //Second Administrator account
    if ( !isDependent (['tf1_secondAdmin', 'tf1_secondAdminPassword'], LANG_LOCALE['30261'] ) ) {
         return false;   
    }
    
    txtFieldIdArr2[0] = "tf1_ldapAuthServer2,"+LANG_LOCALE['30262'];
    txtFieldIdArr2[1] = "tf1_secondAdminPassword,"+LANG_LOCALE['30263'];
    txtFieldIdArr2[2] = "tf1_secondAdmin,"+LANG_LOCALE['30264'];
    
    if ( !validateAccount ('tf1_secondAdmin', txtFieldIdArr2)) {
        return false;
    }
    
    //Third Administrator account
    if ( !isDependent (['tf1_thirdAdmin', 'tf1_thirdAdminPassword'], LANG_LOCALE['30265'] ) ) {
         return false;   
    }
    
    txtFieldIdArr2[0] = "tf1_ldapAuthServer3,"+LANG_LOCALE['30266'];
    txtFieldIdArr2[1] = "tf1_thirdAdminPassword,"+LANG_LOCALE['30267'];
    txtFieldIdArr2[2] = "tf1_thirdAdmin,"+LANG_LOCALE['30268']; 

    if ( !validateAccount ('tf1_thirdAdmin', txtFieldIdArr2)) {
        return false;
    }

	return true;
}
