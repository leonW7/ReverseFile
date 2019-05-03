/*
 * File: dmzDhcpReservedIpsConfig.js
 * TeamF1 Inc, 2014
 * Created on 5th March 2014 - Ramakrishna Reddy
 */
/****
 * validate the form
 * @method pageValidate
 */
/**
 * This function calls at the time of page loads
 * OnLoad validation
 * @method dmzDhcpResrvOnload
 */

function dmzDhcpResIPOnloadFn () {
    enableTextFieldByAnchorClick('tf1_ipEnable','tf1_ipAddr tf1_macAddr');   
	
    onloadCall(dmzDhcpResIPOnload, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
    }

function dmzDhcpResIPOnload (data, thisObj)
    {
	onAnchorToggle(data);
    	var imgId=thisObj.id;
   	switch(imgId){
	    case 'tf1_ipEnable':
		enableTextFieldByAnchorClick('tf1_ipEnable','tf1_ipAddr tf1_macAddr');
	    break;
	}
    }

var dhcpPoolMsg = "Reserved IP cannot be configured in DHCP Server address range pool of Vlan. Please configure different IP";

function pageValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_ipAddr,"+LANG_LOCALE['12028'];
    txtFieldIdArr[1] = "tf1_macAddr,"+LANG_LOCALE['12049'];
   
 if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv4Validate('tf1_ipAddr', 'NSN', false, true, LANG_LOCALE['11281']+'.', LANG_LOCALE['11031'], true) == false) 
        return false;
    
    var macObj = document.getElementById('tf1_macAddr');
    if (macObj && !macObj.disabled) {
        if (macAddrValidate(macObj.value, true, "", '', macObj) == false) 
            return false;
    }
    setHiddenChks("tf1_frmDmzDhcpReservedIps");
    
    return true;
}
