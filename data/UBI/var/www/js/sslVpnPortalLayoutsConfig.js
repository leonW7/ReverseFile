/*
 * File: sslVpnPortalLayoutsConfig.js
 * TeamF1 Inc, 2012
 * Created on 9th Nov 2012 - Bala Krishna G
 */

/**
 * This function calls Page loads
 * Onload validation
 * @method onloadCall
 */
function onLoadSSLVPNPortalFn () {
        
                onloadCall ();
	changeAuthType('tf1_sslAuthType');
            }

/****
 * This function calls when user selects an option from Authentication Type
 * OnChange event
 * @method changeAuthType
 * @param selId - Select box Name
 */
function changeAuthType(selId){
	var selValue = comboSelectedValueGet (selId);
	if (!selValue) 
           {
           selValue =  document.getElementById ('tf1_sslAuthTypeN').value;
           }
         if (!selValue) return;		
    switch (selValue){
   		case 'local':	/* local*/
   			fieldStateChangeWr ('', '', 'tf1_group', '');
       		vidualDisplay ('tf1_group','configRow');	
       		vidualDisplay('break_group',"break");   			
   		break;
   		case 'radius_pap':	/* radius_pap*/
   		case 'radius_chap':	/* radius_chap*/
   		case 'radius_mschap':	/* radius_mschap*/
   		case 'radius_mschapv2':	/* radius_mschapv2*/
   			fieldStateChangeWr ('tf1_group', '', '', '');
       		vidualDisplay ('tf1_group','hide');  
       		vidualDisplay ('break_group','hide');
		break;
   		case 'ntdomain':	/* ntdomain*/
   			fieldStateChangeWr ('tf1_group', '', '', '');
       		vidualDisplay ('tf1_group','hide');  
       		vidualDisplay ('break_group','hide');
       		vidualDisplay ('','configRow');	  
		break;   			
   		case 'active-directory':	/* active-directory*/
   			fieldStateChangeWr ('tf1_group', '', '', '');
       		vidualDisplay ('tf1_group','hide');  
       		vidualDisplay ('break_group','hide');
		break;
   		case 'ldap':	/* ldap*/
   			fieldStateChangeWr ('tf1_group', '', '', '');   			
   			vidualDisplay ('tf1_group','hide');	  
       		vidualDisplay ('break_group','hide'); 
   		break;
                case 'pop':	/* pop*/
   			fieldStateChangeWr ('tf1_group', '', '', '');   			
   			vidualDisplay ('tf1_group','hide');	  
       		vidualDisplay ('break_group','hide'); 
   		break;
   	}
}

/****
 * validate the form
 * @method pageValidate
 */
function pageValidate(frmId){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_porName,"+LANG_LOCALE['12085'];
    var txtFieldIdArrSpecialChar = new Array();
    txtFieldIdArrSpecialChar[0] = "tf1_porTle,Please enter a valid Portal Site Title";
    txtFieldIdArrSpecialChar[1] = "tf1_banTle,Please enter a valid Banner Title";
    txtFieldIdArrSpecialChar[2] = "tf1_banMessage,Please enter a valid Banner Message";

    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    if (alphaNumericValueCheck("tf1_porName", '', LANG_LOCALE['11317']+'. ') == false) 
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (isProblemCharArrayCheck(txtFieldIdArrSpecialChar, '\'"', NOT_SUPPORTED_SINGLE_N_DOUBLE_QUOTES) == false)
       return false;
        
    setHiddenChks(frmId);        
    return true;
}
