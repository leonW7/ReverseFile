/*
 * File: applicationRulesConfig.js
 * TeamF1 Inc, 2012
 * Created on 9th Nov 2012 - Bala Krishna G
 */
/****
 * validate the form
 * @method pageValidate
 */
function pageValidate(frmId){
    var txtFieldIdArr = new Array();
    var flag = 1;
    txtFieldIdArr[0] = "tf1_name,"+LANG_LOCALE['12064'];
    txtFieldIdArr[1] = "OutStartPort,"+LANG_LOCALE['12071'];    
    txtFieldIdArr[2] = "OutEndPort,"+LANG_LOCALE['12072'];
    txtFieldIdArr[3] = "InStartPort,"+LANG_LOCALE['12023'];    
    txtFieldIdArr[4] = "InEndPort,"+LANG_LOCALE['12024'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    if (alphaNumericValueCheck ("tf1_name", '', '') == false)    
        return false;
    
    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
    
    if (numericValueRangeCheck(document.getElementById('OutStartPort'), '', '', 1, 65535, true, LANG_LOCALE['11356']+'. ', '') == false) 
            return false;
	if (numericValueRangeCheck(document.getElementById('OutEndPort'), '', '', 1, 65535, true, LANG_LOCALE['11368']+'. ', '') == false) 
            return false;

    if (validateEndPort('OutStartPort', 'OutEndPort') == false) 
        return false;
    
    if (numericValueRangeCheck(document.getElementById('InStartPort'), '', '', 1, 65535, true, LANG_LOCALE['11356']+'. ', '') == false) 
            return false;
	if (numericValueRangeCheck(document.getElementById('InEndPort'), '', '', 1, 65535, true, LANG_LOCALE['11368']+'. ', '') == false) 
            return false;

    if (validateEndPort('InStartPort', 'InEndPort') == false) 
        return false;

    setHiddenChks(frmId);
    return true;
}
/**
 * Validates port
 * @method validateEndPort
 * @param direction
 */
function validateEndPort(startPort,endPort){
	var startPortVal =document.getElementById(startPort).value;
	var endPortVal =document.getElementById(endPort).value;
	if(parseInt(startPortVal , 10)> parseInt(endPortVal, 10)){
		alert(LANG_LOCALE['11328'] + "(" + endPortVal + ")" + LANG_LOCALE['13469'] + "(" + startPortVal + ")");
		document.getElementById(startPort).focus();
		return false;
	}else{
		return true;
	}
}
