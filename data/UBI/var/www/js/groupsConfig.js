/*
 * File: groupsConfig.js
 * TeamF1 Inc, 2012
 * Created on 9th Nov 2012 - Bala Krishna G
*/ 
 
/**
* Onload call for Groups List
*/
var G_GROUPS = {};

function GroupsListPopupOnload(){
	onloadCall (enableDisableFieldsByImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});	
	enableTextFieldByAnchorClick('tf1_sslvpn','tf1_sslPortalName tf1_sslAuthType tf1_sslNTDOMAINProfile tf1_sslActiveDirectoryProfile tf1_sslLDAPProfile tf1_sslRadiusProfile','break_sslPortalName break_sslAuthType tf1_sslNTDOMAINProfile tf1_sslActiveDirectoryProfile tf1_sslLDAPProfile tf1_sslRadiusProfile');  	
	changeUserType('tf1_userTypeAdmin');
	changeAuthType('tf1_sslAuthType');

}

function GroupsListPopupOnloadEdit(){
	onloadCall (enableDisableFieldsByImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});	
	enableTextFieldByAnchorClick('tf1_sslvpn','tf1_sslPortalName tf1_sslAuthType tf1_sslNTDOMAINProfile tf1_sslActiveDirectoryProfile tf1_sslLDAPProfile tf1_sslRadiusProfile','break_sslPortalName break_sslAuthType tf1_sslNTDOMAINProfile tf1_sslActiveDirectoryProfile tf1_sslLDAPProfile tf1_sslRadiusProfile');  	
	changeUserType('tf1_userTypeAdmin');
	changeAuthType('tf1_sslAuthType');
	//fieldStateChangeWr ('','tf1_UserTypeBlock_div','','');
	//vidualDisplay('tf1_UserTypeBlock','hide');
    G_GROUPS.tf1_pptp_hidden =  document.getElementById('tf1_pptp_hidden').value;
    G_GROUPS.tf1_l2tp_hidden =  document.getElementById('tf1_l2tp_hidden').value;
    G_GROUPS.tf1_xauth_hidden =  document.getElementById('tf1_xauth_hidden').value;
    if (document.getElementById ('tf1_sslvpn_hidden')) {
        G_GROUPS.tf1_sslvpn_hidden =  document.getElementById('tf1_sslvpn_hidden').value;
    }
    if (document.getElementById ('tf1_openVpn_hidden')) {
        G_GROUPS.tf1_openVpn_hidden =  document.getElementById('tf1_openVpn_hidden').value;
    }
    if (document.getElementById('tf1_captivePortal_hidden')) {
       G_GROUPS.tf1_captivePortal_hidden =  document.getElementById('tf1_captivePortal_hidden').value;
    }

}

/**
    Onload call for Login Policies
*/
function policiesOnloadCallFn() {
	onloadCall (enableDisableFieldsByImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
}
/**
* Onload call for IP Policies
*/
function IPPoliciesPopupOnload(){
	ipNetworkChk('tf1_sourceAddresType');   
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
    	case 'tf1_sslvpn':
    		enableTextFieldByAnchorClick('tf1_sslvpn','tf1_sslPortalName tf1_sslAuthType tf1_sslNTDOMAINProfile tf1_sslActiveDirectoryProfile tf1_sslLDAPProfile tf1_sslRadiusProfile','break_sslPortalName break_sslAuthType break_sslNTDOMAINProfile break_sslActiveDirectoryProfile break_sslLDAPProfile break_sslRadiusProfile','');  
    		changeAuthType('tf1_sslAuthType');		    		
    	break;
			case 'tf1_pptp':
			  if ($("#tf1_pptp").attr("class") == "enable-disable-on" ){
					$("#tf1_l2tp").attr("class","enable-disable-off");
				}
			break;
			case 'tf1_l2tp':
				if ($("#tf1_l2tp").attr("class") == "enable-disable-on" ){
					$("#tf1_pptp").attr("class","enable-disable-off");
				}
			break;
    }
}

/****
 * This function calls when user selects an option from Authentication Type
 * OnChange event
 * @method changeUserType
 * @param radioName - Radio Button Name
 */
function changeUserType(radioName){
	var selValue = radioCheckedValueGet(radioName);
	if (!selValue) return;		

    switch (parseInt (selValue, 10)){    
   		case 1:	/* Admin */
				fieldStateChangeWr ('tf1_xauth tf1_xauth_hidden', '', 'tf1_pptp tf1_pptp_hidden tf1_l2tp tf1_l2tp_hidden tf1_l2tp_hidden tf1_sslvpn tf1_sslvpn_hidden tf1_captivePortal tf1_captivePortal_hidden tf1_openVpn tf1_openVpn_hidden', '');
       		vidualDisplay ('tf1_pptp tf1_l2tp tf1_sslvpn tf1_captivePortal tf1_openVpn','configRow');	  
       		vidualDisplay ('break_pptp break_l2tp break_sslvpn break_captivePortal break_openvpn','break');
					vidualDisplay ('tf1_xauth tf1_xauth_hidden','hide');
       		vidualDisplay ('break_xauth','hide');
       		enableTextFieldByAnchorClick('tf1_sslvpn','tf1_sslPortalName tf1_sslAuthType tf1_sslNTDOMAINProfile tf1_sslActiveDirectoryProfile tf1_sslLDAPProfile tf1_sslRadiusProfile','break_sslPortalName break_sslAuthType break_sslNTDOMAINProfile break_sslActiveDirectoryProfile break_sslLDAPProfile break_sslRadiusProfile','');
       		changeAuthType('tf1_sslAuthType');	
   				break;  
   		case 2:	/* Network */
   			fieldStateChangeWr ('', '', 'tf1_pptp tf1_pptp_hidden tf1_l2tp tf1_l2tp_hidden tf1_xauth tf1_xauth_hidden tf1_sslvpn tf1_sslvpn_hidden tf1_captivePortal tf1_captivePortal_hidden tf1_openVpn tf1_openVpn_hidden', '');
       		vidualDisplay ('tf1_pptp tf1_l2tp tf1_xauth tf1_xauth_hidden tf1_sslvpn tf1_captivePortal tf1_openVpn','configRow');	  
       		vidualDisplay ('break_pptp break_l2tp break_xauth break_sslvpn break_captivePortal break_openvpn','break');
       		
       		enableTextFieldByAnchorClick('tf1_sslvpn','tf1_sslPortalName tf1_sslAuthType tf1_sslNTDOMAINProfile tf1_sslActiveDirectoryProfile tf1_sslLDAPProfile tf1_sslRadiusProfile','break_sslPortalName break_sslAuthType break_sslNTDOMAINProfile break_sslActiveDirectoryProfile break_sslLDAPProfile break_sslRadiusProfile','');
       		changeAuthType('tf1_sslAuthType');	
   		break;   		
   		case 3:	/* Front Desk */
   		case 4:	/* Guest */
   			fieldStateChangeWr ('tf1_pptp tf1_pptp_hidden tf1_l2tp tf1_l2tp_hidden tf1_xauth tf1_xauth_hidden tf1_sslvpn tf1_sslvpn_hidden  tf1_openVpn tf1_openVpn_hidden tf1_sslPortalName tf1_sslAuthType tf1_sslNTDOMAINProfile tf1_sslActiveDirectoryProfile tf1_sslLDAPProfile tf1_sslRadiusProfile tf1_captivePortal tf1_captivePortal_hidden', '', '', '');
       		vidualDisplay ('tf1_pptp tf1_l2tp tf1_xauth tf1_xauth_hidden tf1_sslvpn tf1_openVpn tf1_sslPortalName tf1_sslAuthType tf1_sslNTDOMAINProfile tf1_sslActiveDirectoryProfile tf1_sslLDAPProfile tf1_sslRadiusProfile tf1_captivePortal','hide');	  
       		vidualDisplay ('break_pptp break_l2tp break_xauth break_sslvpn break_sslPortalName break_sslAuthType break_sslNTDOMAINProfile break_sslActiveDirectoryProfile break_sslLDAPProfile break_sslRadiusProfile break_captivePortal break_openvpn','hide');   		
   		break;
   		
   	}
}


/****
 * This function calls when user selects an option from Authentication Type
 * OnChange event
 * @method changeAuthType
 * @param selId - Select box Name
 */
function changeAuthType(selId){
	var selValue = comboSelectedValueGet (selId);
	if (!selValue) return;		
    switch (selValue){
   		case 'local':	/* local*/
   			fieldStateChangeWr ('tf1_sslNTDOMAINProfile tf1_sslActiveDirectoryProfile tf1_sslLDAPProfile tf1_sslRadiusProfile', '', '', '');
       		vidualDisplay ('tf1_sslNTDOMAINProfile tf1_sslActiveDirectoryProfile tf1_sslLDAPProfile tf1_sslRadiusProfile','hide');	  
       		vidualDisplay ('break_sslNTDOMAINProfile break_sslActiveDirectoryProfile break_sslLDAPProfile break_sslRadiusProfile','hide');   			
   		break;
   		case 'radius_pap':	/* radius_pap*/
   		case 'radius_chap':	/* radius_chap*/
   		case 'radius_mschap':	/* radius_mschap*/
   		case 'radius_mschapv2':	/* radius_mschapv2*/
   			fieldStateChangeWr ('tf1_sslNTDOMAINProfile tf1_sslActiveDirectoryProfile tf1_sslLDAPProfile', '', 'tf1_sslRadiusProfile', '');
       		vidualDisplay ('tf1_sslNTDOMAINProfile tf1_sslActiveDirectoryProfile tf1_sslLDAPProfile','hide');  
       		vidualDisplay ('break_sslNTDOMAINProfile break_sslActiveDirectoryProfile break_sslLDAPProfile','hide');
       		vidualDisplay ('tf1_sslRadiusProfile','configRow');	  
       		vidualDisplay ('break_sslRadiusProfile','break');
		break;
   		case 'ntdomain':	/* ntdomain*/
   			fieldStateChangeWr ('tf1_sslActiveDirectoryProfile tf1_sslLDAPProfile tf1_sslRadiusProfile', '', 'tf1_sslNTDOMAINProfile', '');
       		vidualDisplay ('tf1_sslActiveDirectoryProfile tf1_sslLDAPProfile tf1_sslRadiusProfile','hide');  
       		vidualDisplay ('break_sslActiveDirectoryProfile break_sslLDAPProfile break_sslRadiusProfile','hide');
       		vidualDisplay ('tf1_sslNTDOMAINProfile','configRow');	  
       		vidualDisplay ('break_sslNTDOMAINProfile','break');
		break;   			
   		case 'active-directory':	/* active-directory*/
   			fieldStateChangeWr ('tf1_sslNTDOMAINProfile tf1_sslLDAPProfile tf1_sslRadiusProfile', '', 'tf1_sslActiveDirectoryProfile', '');
       		vidualDisplay ('tf1_sslNTDOMAINProfile tf1_sslLDAPProfile tf1_sslRadiusProfile','hide');  
       		vidualDisplay ('break_sslNTDOMAINProfile break_sslLDAPProfile break_sslRadiusProfile','hide');
       		
       		vidualDisplay ('tf1_sslActiveDirectoryProfile ','configRow');	  
       		vidualDisplay ('break_sslActiveDirectoryProfile','break');
		break;
   		case 'ldap':	/* ldap*/
   			fieldStateChangeWr ('tf1_sslNTDOMAINProfile tf1_sslActiveDirectoryProfile tf1_sslRadiusProfile', '', 'tf1_sslLDAPProfile', '');   			
   			vidualDisplay ('tf1_sslNTDOMAINProfile tf1_sslActiveDirectoryProfile tf1_sslRadiusProfile','hide');	  
       		vidualDisplay ('break_sslNTDOMAINProfile break_sslActiveDirectoryProfile break_sslRadiusProfile','hide'); 
   			
       		vidualDisplay ('tf1_sslLDAPProfile','configRow');	  
       		vidualDisplay ('break_sslLDAPProfile','break');
   		break;
   	}
}
    

/****
 * validate the form
 * @method pageValidate
 */
function groupsValidate(frmId){
    var txtFieldIdArrG = new Array();
    txtFieldIdArrG[0] = "tf1_grpName,"+LANG_LOCALE['12018'];
    txtFieldIdArrG[1] = "tf1_description,"+LANG_LOCALE['11987'];
    txtFieldIdArrG[2] = "tf1_idleTimeOut,"+LANG_LOCALE['12022'];

    if (txtFieldArrayCheck(txtFieldIdArrG) == false) 
        return false;

    if (alphaNumericValueCheck ("tf1_grpName", '', '') == false)    
        return false;
    
    var txtFieldIdArrCharG = new Array();
    txtFieldIdArrCharG[0] = "tf1_grpName,"+LANG_LOCALE['12018'];
    txtFieldIdArrCharG[1] = "tf1_idleTimeOut,"+LANG_LOCALE['12022'];
    
    if (isProblemCharArrayCheck(txtFieldIdArrCharG, '\'" ', NOT_SUPPORTED) == false) 
        return false;
        
    var gpNameObj = document.getElementById("tf1_grpName");
    if(gpNameObj && !gpNameObj.disabled){

    	if(validGroupName ('tf1_grpName' ,LANG_LOCALE['11268']) == false)
    	    return false;
    }
    
    if (numericValueRangeCheck (document.getElementById('tf1_idleTimeOut'), '', '', 1, 999, true, LANG_LOCALE['11274'], LANG_LOCALE['11718']) == false) {

	    return false;
    }

    
    
	setHiddenChks(frmId);

    if (radioCheckedValueGet("tf1_userTypeNetwork") == 2) {

        
        if ( ( document.getElementById("tf1_captivePortal_hidden") != null && document.getElementById("tf1_captivePortal_hidden").value == 1 ) || ( document.getElementById("tf1_l2tp_hidden")  != null && document.getElementById("tf1_l2tp_hidden").value == 1 ) || ( document.getElementById("tf1_pptp_hidden")  != null && document.getElementById("tf1_pptp_hidden").value == 1 ) || ( document.getElementById("tf1_xauth_hidden")  != null && document.getElementById("tf1_xauth_hidden").value == 1 ) || ( document.getElementById("tf1_sslvpn_hidden")  != null && document.getElementById("tf1_sslvpn_hidden").value == 1 ) || ( document.getElementById("tf1_openVpn_hidden")  != null && document.getElementById("tf1_openVpn_hidden").value == 1 ) ) {

} else {
        alert(LANG_LOCALE['12439']);
        return false;
    }
    }
      
    var configRowIdObj = document.getElementById ('hdConfigRowId');
    if (configRowIdObj)
        {
            if (configRowIdObj.value != "-1")
                {
                    var newGrups = {};
                    newGrups.tf1_pptp_hidden = document.getElementById('tf1_pptp_hidden').value;
                    newGrups.tf1_l2tp_hidden = document.getElementById('tf1_l2tp_hidden').value;
                    newGrups.tf1_xauth_hidden =  document.getElementById('tf1_xauth_hidden').value;
                    if (document.getElementById ('tf1_sslvpn_hidden')) {
                        newGrups.tf1_sslvpn_hidden = document.getElementById('tf1_sslvpn_hidden').value;
                    }
                    if (document.getElementById ('tf1_openVpn_hidden')) {
                        newGrups.tf1_openVpn_hidden =  document.getElementById('tf1_openVpn_hidden').value;
                    }
                    if (document.getElementById('tf1_captivePortal_hidden')) {
                        newGrups.tf1_captivePortal_hidden = document.getElementById('tf1_captivePortal_hidden').value;
                    }
                    
                    var hdUserType = document.getElementById ('hdUserType').value;
                    var currUserType = radioCheckedValueGet('tf1_userTypeAdmin');
                    var statusVal = isDirty(G_GROUPS, newGrups);
                    if ( statusVal === 1 || (hdUserType !== currUserType))
                        {
                            var groupName = $("#hdGroupName").val();
                            if (groupName == "ADMIN") {
                                alert(LANG_LOCALE['50043']);
                                return false;
                            }
                            else {
                                /* Reboot warning message if privilege/user type of group changed */
                                var result = confirm (LANG_LOCALE['30642']);
                           return result;
                            }
                        }
                }
        }

return true;
    
}

/****
 * validate the form
 * @method validateIPPolicies
 */
function validateIPPolicies(frmId){

    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_txtIpAddr,"+LANG_LOCALE['12065'];
    txtFieldIdArr[1] = "tf1_txtMaskLen,"+LANG_LOCALE['12050'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;    
        
    if (ipv4AddrValidate (document.getElementById('tf1_txtIpAddr'), 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
            
    var maskObj = document.getElementById('tf1_txtMaskLen');
    if (maskObj && !maskObj.disabled) {
        if (numericValueRangeCheck(maskObj, 1, "", 0, 32, true, LANG_LOCALE['11296'], "") == false) 
            return false;
    }
    setHiddenChks(frmId);    
    return true;
}
/**
 * function for changing the mode settings of radio buttons
 * Onclick event
 * @method checkAuthenticationType
 * @param selName - Select Box Id
 */
function ipNetworkChk(selName){
    var selValue = comboSelectedValueGet(selName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* None */
            fieldStateChangeWr('tf1_txtMaskLen', '', '', '');
            vidualDisplay('tf1_txtMaskLen', 'hide');
        break;
            
        case 2: /* Simple */
            fieldStateChangeWr('', '', 'tf1_txtMaskLen', '');
            vidualDisplay('tf1_txtMaskLen', 'configRow');
        break;       
    }
}

/**
 * Allows alpha numeric values, used when submitting the form
 * @method validGroupName
 * @param eventObj - event object
 * @param exceptionCharStr - exception characters allowed
 * @param prefixErrMsg - prefix error message
 */
function validGroupName(fieldId, prefixErrMsg){
    var txtFieldObj = document.getElementById(fieldId);
    if (!txtFieldObj || txtFieldObj.disabled) 
        return true;

    for (var idx = 0; idx < txtFieldObj.value.length; idx++) {
        var charUniCode = txtFieldObj.value.charCodeAt(idx);
        
        switch (charUniCode) {
            case 8: /* back space */
            case 9: /* tab */
            case 16: /* shift */
                /* case 37: */
                /* left arrow */
                /* case 39: */
                /* right arrow */
                /* case 46: */
                /* delete - not supporting as in netscape it's char code is same as '.'*/
                return true;
            default:
                break;
        }
        /* allow A - Z */
        if (charUniCode >= 97 && charUniCode <= 122) 
            continue;
        /* allow a - z */
        if (charUniCode >= 65 && charUniCode <= 90) 
            continue;
        /* allow 0 to 9 */
        if (charUniCode >= 48 && charUniCode <= 57) 
            continue;
        var errorMsg = "";
        if (prefixErrMsg && prefixErrMsg != "") 
            errorMsg += prefixErrMsg;
        errorMsg += ONLY_ANDTHIS_CHARACTERS + " " + CHARACTERS_ALLOWED;        
        alert(errorMsg);
        txtFieldObj.focus();
        return false;
    }
    return true;
}


