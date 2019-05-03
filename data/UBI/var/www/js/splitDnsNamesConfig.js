/*
 * File: splitDnsNamesConfig.js
 * TeamF1 Inc, 2012
 * Created on 9th Nov 2012 - Bala Krishna G
 */
/****
 * validate the form
 * @method pageValidate
 */
function pageValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_domainName,"+LANG_LOCALE['12002'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
	if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
    
    var lanDomainName = document.getElementById('tf1_domainName');
    if (alphaNumericValueCheck('tf1_domainName', '-_', LANG_LOCALE['11251']) == false)	
    	return false;
        
   /* if (validateFQDN('tf1_domainName') == false) 
        return false;*/
    return true;
}
