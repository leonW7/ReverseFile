/*
 * File: lanDhcpReservedIpsConfig.js
 * TeamF1 Inc, 2014
 * Created on 5th March 2014 - Ramakrishna Reddy
 */

/**
 * This function calls at the time of page loads
 * OnLoad validation
 * @method dmzDhcpResrvOnload
 */
function onloadLanDhcpResIPFn () {
	
    onloadCall(lanDhcpResIPOnload, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});

    enableTextFieldByAnchorClick('tf1_ipEnable','tf1_logDropPackets','break_logDrop');
}

function lanDhcpResIPOnload (data, thisObj)
    {
	onAnchorToggle(data);
	var imgId=thisObj.id;
        switch(imgId){
        case "tf1_ipEnable":
	    enableTextFieldByAnchorClick(imgId,'tf1_logDropPackets','break_logDrop');
	break;
	}
    }

/****
 * validate the form
 * @method pageValidate
 */
var dhcpPoolMsg = LANG_LOCALE['30100'];
function pageValidate(frmId){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_hostName,"+LANG_LOCALE['12020'];
    txtFieldIdArr[1] = "tf1_ipAddr,"+LANG_LOCALE['12028'];
    txtFieldIdArr[2] = "tf1_macAddr,"+LANG_LOCALE['12049'];

    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

	if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv4Validate('tf1_ipAddr', 'NSN', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    var macObj = document.getElementById('tf1_macAddr');
    if (macAddrValidate(macObj.value, true, "", '', macObj) == false) 
        return false;
    setHiddenChks(frmId); 
    return true;
}
