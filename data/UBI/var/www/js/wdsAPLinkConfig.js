/*
 * File: wdsAPLinkConfig.js
 * TeamF1 Inc, 2012
 * Created on 12th Feb 2013 - Lakshmi
 */
 
/**
 * This function calls Page loads
 * Onload validation
 * @method onloadCall
 */   
function onloadwdsAPLinkFn () {
	changeTableData('tf1_groupId');
}
/****
 * validate the form
 * @method wdsApLinkConfigValidate
 */
function wdsApLinkConfigValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_srcApMacAddress,Please enter a valid Source AP MAC Address";
    txtFieldIdArr[1] = "tf1_srcApRadio,Please enter a valid Source AP Radio";
    txtFieldIdArr[2] = "tf1_destApMacAddress,Please enter a valid Destination AP MAC Address";
    txtFieldIdArr[3] = "tf1_destApRadio,Please enter a valid Destination AP Radio";    
    txtFieldIdArr[4] = "tf1_linkCost,Please enter a valid Link Cost"; 
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
        
    var macObj1 = document.getElementById('tf1_srcApMacAddress');
	if (!(macAddrValidate(macObj1.value, true, "", '', macObj1))) {
		macObj1.focus();
	    return false;
	}
    
    if (alphaNumericValueCheck("tf1_srcApRadio", '', "Source AP Radio. ") == false) 
        return false;
        
	var macObj2 = document.getElementById('tf1_destApMacAddress');
	if (!(macAddrValidate(macObj2.value, true, "", '', macObj2))) {
		macObj2.focus();
	    return false;
	}
	
    if (alphaNumericValueCheck("tf1_destApRadio", '', "Destination AP Radio. ") == false) 
        return false;
        
	if (alphaNumericValueCheck("tf1_linkCost", '', "Invalid Link Cost. ") == false) 
        return false;
        
        
    return true
}

/****
 * This function calls when user selects an option from Select Box
 * OnChange event
 * @method changeTableData
 */
function changeTableData(selName){		
    var selValue = comboSelectedValueGet (selName);        
    switch (parseInt (selValue, 10)){
		case 1:
			vidualDisplay('tf1_table1', 'configRow');
			vidualDisplay('tf1_table2', 'hide');
		break;
		case 2:
			vidualDisplay('tf1_table2', 'configRow');
			vidualDisplay('tf1_table1', 'hide');
		break
	}	
}
