/*
 * File: apProfilesSsid.js
 * Created on 19th Dec 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * This function calls Page loads
 * Onload validation
 * @method onloadCall
 */   
function onloadapProfilesSsidFn() {
	enbaleRedirectUrl('tf1_redirectNone');
	checkSecurity('tf1_SecurityNone');
	
	onloadCall (enableDisableFieldsByImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
}
function enableDisableFieldsByImageClick(data, thisObj) { 
    onAnchorToggle(data);
    var imgId=thisObj.id;
    
    switch(imgId){
       	case 'tf1_openSystem':       		
       		openObj=$("#tf1_openSystem").attr( "class" );
       		shareObj=$("#tf1_sharedKey").attr( "class" );
      		if(openObj == "enable-disable-off" && shareObj == "enable-disable-off"){      			
      			$("#tf1_sharedKey").attr( "class", "enable-disable-on" );
      		}
       	break;
       	case 'tf1_sharedKey':
       		openObj=$("#tf1_openSystem").attr( "class" );
       		shareObj=$("#tf1_sharedKey").attr( "class" )
      		if(openObj == "enable-disable-off" && shareObj == "enable-disable-off"){      			
      			$("#tf1_openSystem").attr( "class", "enable-disable-on" );
      		}
       	break;
       	
       	case 'tf1_WPA':       		
       		WPAObj=$("#tf1_WPA").attr( "class" );
       		WPA2Obj=$("#tf1_WPA2").attr( "class" );
      		if(WPAObj == "enable-disable-off" && WPA2Obj == "enable-disable-off"){      			
      			$("#tf1_WPA2").attr( "class", "enable-disable-on" );
      		}
       	break;       	
       	case 'tf1_WPA2':
       		WPAObj=$("#tf1_WPA").attr( "class" );
       		WPA2Obj=$("#tf1_WPA2").attr( "class" )
      		if(WPAObj == "enable-disable-off" && WPA2Obj == "enable-disable-off"){      			
      			$("#tf1_WPA").attr( "class", "enable-disable-on" );
      		}
       	break;
       	
       	case 'tf1_TKIP':       		
       		TKIPObj=$("#tf1_TKIP").attr( "class" );
       		CCMPObj=$("#tf1_CCMP").attr( "class" );
      		if(TKIPObj == "enable-disable-off" && CCMPObj == "enable-disable-off"){      			
      			$("#tf1_CCMP").attr( "class", "enable-disable-on" );
      		}
       	break;
       	case 'tf1_CCMP':
       		TKIPObj=$("#tf1_TKIP").attr( "class" );
       		CCMPObj=$("#tf1_CCMP").attr( "class" )
      		if(TKIPObj == "enable-disable-off" && CCMPObj == "enable-disable-off"){      			
      			$("#tf1_TKIP").attr( "class", "enable-disable-on" );
      		}
       	break;
        case 'tf1_preAuth':        
            enableTextFieldByAnchorClick('tf1_preAuth','tf1_preAuthLimit','break20');
        break;
	}
}



		
/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method apProfilesSsidValidate
 */
function apProfilesSsidValidate(frmId){

    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_ssid, Please enter a valid SSID";
    txtFieldIdArr[1] = "tf1_VLANId, Please enter a valid VLAN";
    txtFieldIdArr[2] = "tf1_redirectUrl, Please enter a valid Redirect URL";
    txtFieldIdArr[3] = "tf1_radiusAuthServerIP, Please enter a valid RADIUS Authentication Server IP Address";
    txtFieldIdArr[4] = "tf1_WPAKey, Please enter a valid WPA Key";
    txtFieldIdArr[5] = "tf1_preAuthLimit, Please enter a valid Pre-Authentication Limit";
	txtFieldIdArr[6] = "tf1_keyCachingHoldTime, Please enter a valid Key Caching Hold Time";
	txtFieldIdArr[7] = "tf1_bcastKeyRefreshRate, Please enter a valid Bcast Key Refresh Rate";
	txtFieldIdArr[8] = "tf1_sessionKeyRefreshRate, Please enter a valid Session Key Refresh Rate"; 	
	txtFieldIdArr[9] = "tf1_WEPKeyCharValue1, Please enter a valid WEP Key1"; 
	txtFieldIdArr[10] = "tf1_WEPKeyCharValue2, Please enter a valid WEP Key2"; 
	txtFieldIdArr[11] = "tf1_WEPKeyCharValue3, Please enter a valid WEP Key3"; 
	txtFieldIdArr[12] = "tf1_WEPKeyCharValue4, Please enter a valid WEP Key4";        
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
    /**var ssidobj = document.getElementById('tf1_ssid');
    if (ssidobj && !ssidobj.disabled) {
        if (numericValueRangeCheck(ssidobj, '', '', 1, 4096, true, '', '') == false) 
            return false;        
    }*/

    
    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
    
    var vlanobj = document.getElementById('tf1_VLANId');
    if (vlanobj && !vlanobj.disabled) {
        if (numericValueRangeCheck(vlanobj, '', '', 1, 4093, true, '', '') == false) 
            return false;        
    }
    
    if (ipv4Validate('tf1_radiusAuthServerIP', 'IP', false, true, "Invalid IP Address", "For Octect", true) == false) 
        return false;
    
    var preAuthLimit= document.getElementById('tf1_preAuthLimit');
    if (preAuthLimit && !preAuthLimit.disabled) {
        if (numericValueRangeCheck(preAuthLimit, '', '', 0, 192, true, 'Invalid Pre-Authentication Limit', '') == false) 
            return false;        
    }

	var keyCachingHoldTime = document.getElementById('tf1_keyCachingHoldTime');
    if (keyCachingHoldTime && !keyCachingHoldTime.disabled) {
        if (numericValueRangeCheck(keyCachingHoldTime, '', '', 0, 1440, true, 'Invalid Key Caching Hold Time', '') == false) 
            return false;        
    }

	var bcastKeyRefreshRate = document.getElementById('tf1_bcastKeyRefreshRate');
    if (bcastKeyRefreshRate && !bcastKeyRefreshRate.disabled) {
        if (numericValueRangeCheck(bcastKeyRefreshRate, '', '', 0, 86400, true, 'Invalid Bcast Key Refresh Rate', '') == false) 
            return false;        
    }
    
	var sessionKeyRefreshRate= document.getElementById('tf1_sessionKeyRefreshRate');
    if (sessionKeyRefreshRate&& !sessionKeyRefreshRate.disabled) {
        if (numericValueRangeCheck(sessionKeyRefreshRate, '', '', 0, 86400, true, 'Invalid Session Key Refresh Rate', '') == false) 
            return false;        
    }  
    setHiddenChks(frmId);
	return true;
}
/****
 * This function calls when user selects an option from Radio Button
 * OnChange event
 * @method enbaleRedirectUrl
 * @param radioName - Radio Button Name
 */
function enbaleRedirectUrl(radioName){
	var selValue = radioCheckedValueGet(radioName);
	if (!selValue) return;	
	switch (parseInt(selValue, 10)){
		case 1: /* None */		
			fieldStateChangeWr ('tf1_redirectUrl','','','');
			vidualDisplay ('tf1_redirectUrl', 'hide');
		break;			
		case 2: /* HTTP */
			fieldStateChangeWr ('','','tf1_redirectUrl','');
			vidualDisplay ('tf1_redirectUrl', 'configRow')
		break;		
	}
}
/****
 * This function calls when user selects an option from Radio Button
 * OnChange event
 * @method checkSecurity
 * @param radioName - Radio Button Name 
*/
function checkSecurity(radioName){
	var selValue = radioCheckedValueGet(radioName);
	if (!selValue) return;	
	switch (parseInt(selValue, 10)){
		case 1: /* None */		
			fieldStateChangeWr ('tf1_Security2 tf1_Security3 tf1_openSystem tf1_sharedKey tf1_wepkeyType tf1_wepkeyLength tf1_WPA tf1_WPA2 tf1_TKIP tf1_CCMP tf1_WPAKeyType tf1_WPAKey tf1_bcastLKeyRefreshRate tf1_preAuth tf1_preAuthLimit tf1_keyCachingHoldTime tf1_bcastKeyRefreshRate tf1_sessionKeyRefreshRate tf1_securityAuthenticationBlock tf1_securityWPAVersionsBlock tf1_securityWPACiphersBlock tf1_WEPKeyCharValue1 tf1_WEPKeyCharValue2 tf1_WEPKeyCharValue3 tf1_WEPKeyCharValue4','tf1_Security2_div tf1_Security3_div tf1_wepkeyType_div tf1_wepkeyLength_div','','');			
			vidualDisplay ('tf1_Security2 tf1_Security3 tf1_openSystem tf1_sharedKey tf1_wepkeyType tf1_wepkeyLength tf1_WPA tf1_WPA2 tf1_TKIP tf1_CCMP tf1_WPAKeyType tf1_WPAKey tf1_bcastLKeyRefreshRate tf1_preAuth tf1_preAuthLimit tf1_keyCachingHoldTime tf1_bcastKeyRefreshRate tf1_sessionKeyRefreshRate tf1_securityAuthenticationBlock tf1_securityWPAVersionsBlock tf1_securityWPACiphersBlock', 'hide');
			vidualDisplay ('break15 break16 break18 break19 break20 break21 break22', 'hide')
		break;			
		case 2: /* WEP */
			var disfld='tf1_Security2 tf1_WPA tf1_WPA2 tf1_TKIP tf1_CCMP tf1_WPAKeyType tf1_WPAKey tf1_bcastKeyRefreshRate tf1_sessionKeyRefreshRate tf1_securityWPACiphersBlock';
			var disfldDiv='tf1_Security2_div';
			var enbfld='tf1_Security3 tf1_openSystem tf1_sharedKey tf1_wepkeyType tf1_wepkeyLength tf1_WAPKeysBlock';
			var enbfldDiv='tf1_Security3_div tf1_wepkeyLength_div tf1_wepkeyType_div';
			fieldStateChangeWr (disfld,disfldDiv,enbfld,enbfldDiv);					
			vidualDisplay ('tf1_Security2 tf1_WPA tf1_WPA2 tf1_TKIP tf1_CCMP tf1_WPAKeyType tf1_WPAKey tf1_bcastKeyRefreshRate tf1_sessionKeyRefreshRate tf1_securityWPAVersionsBlock tf1_securityWPACiphersBlock', 'hide');
			vidualDisplay ('tf1_Security3 tf1_openSystem tf1_sharedKey tf1_wepkeyType tf1_wepkeyLength', 'configRow');
			vidualDisplay ('tf1_WAPKeysBlock tf1_securityAuthenticationBlock', '');
			vidualDisplay ('break2 break16 break21', 'hide');
			enableWepKeysChars('tf1_Keys1');
			checkWEPSecurity('tf1_Security3Static')
		break;	
		case 3: /* WPA/WPA2 */
			fieldStateChangeWr ('tf1_securityAuthenticationBlock tf1_Security3 tf1_openSystem tf1_sharedKey tf1_wepkeyLength tf1_WEPKeyCharValue1 tf1_WEPKeyCharValue2 tf1_WEPKeyCharValue3 tf1_WEPKeyCharValue4','tf1_Security3_div tf1_wepkeyType_div tf1_wepkeyLength_div','tf1_securityWPAVersionsBlock tf1_securityWPACiphersBlock tf1_Security2 tf1_WPA tf1_WPA2 tf1_TKIP tf1_CCMP tf1_WPAKeyType tf1_WPAKey tf1_bcastKeyRefreshRate','tf1_Security2_div');
			vidualDisplay ('tf1_securityAuthenticationBlock tf1_Security3 tf1_openSystem tf1_sharedKey tf1_wepkeyLength', 'hide')
			vidualDisplay ('tf1_Security2 tf1_WPA tf1_WPA2 tf1_TKIP tf1_CCMP tf1_WPAKeyType tf1_WPAKey tf1_bcastKeyRefreshRate', 'configRow');
			vidualDisplay ('tf1_securityWPAVersionsBlock tf1_securityWPACiphersBlock', '');
			vidualDisplay ('break15 break16 break21', 'break')
			checkWEPPersonalOrEnterprice('tf1_Security2Personal');
		break;		
	}
}
/****
 * This function calls when user selects an option from Radio Button
 * OnChange event
 * @method checkWEPSecurity
 * @param radioName - Radio Button Name
 */
function checkWEPSecurity(radioName){
	var selValue = radioCheckedValueGet(radioName);
	if (!selValue) return;	
	switch (parseInt(selValue, 10)){
		case 1: /* Static WEP */	
			var disfld='tf1_Security2 tf1_WPA tf1_WPA2 tf1_TKIP tf1_CCMP tf1_WPAKeyType tf1_WPAKey tf1_bcastKeyRefreshRate tf1_sessionKeyRefreshRate tf1_securityWPACiphersBlock tf1_preAuth tf1_keyCachingHoldTime tf1_preAuthLimit';
			var disfldDiv='tf1_Security2_div';
			var enbfld='tf1_Security3 tf1_openSystem tf1_sharedKey tf1_wepkeyType tf1_wepkeyLength tf1_WAPKeysBlock';
			var enbfldDiv='tf1_Security3_div tf1_wepkeyLength_div tf1_wepkeyType_div';
			fieldStateChangeWr (disfld,disfldDiv,enbfld,enbfldDiv);			
			vidualDisplay ('tf1_Security2 tf1_WPA tf1_WPA2 tf1_TKIP tf1_CCMP tf1_WPAKeyType tf1_WPAKey tf1_bcastKeyRefreshRate tf1_sessionKeyRefreshRate tf1_securityWPAVersionsBlock tf1_securityWPACiphersBlock tf1_preAuth tf1_keyCachingHoldTime tf1_preAuthLimit', 'hide');
			vidualDisplay ('tf1_Security3 tf1_openSystem tf1_sharedKey tf1_wepkeyType tf1_wepkeyLength', 'configRow');
			vidualDisplay ('tf1_WAPKeysBlock tf1_securityAuthenticationBlock', '');
			vidualDisplay ('break2 break5 break16 break21', 'hide');
			vidualDisplay ('break3 break5', 'break');
			enableWepKeysChars('tf1_Keys1');
		break;			
		case 2: /* WEP IEEE802.1x */		
			fieldStateChangeWr ('tf1_securityWPACiphersBlock tf1_securityAuthenticationBlock tf1_openSystem tf1_sharedKey tf1_wepkeyType tf1_wepkeyLength tf1_WEPKeys tf1_WPA tf1_WPA2 tf1_TKIP tf1_CCMP tf1_WPAKeyType tf1_WPAKey tf1_bcastLKeyRefreshRate tf1_preAuth tf1_preAuthLimit tf1_keyCachingHoldTime tf1_preAuth tf1_preAuthLimit tf1_keyCachingHoldTime tf1_sessionKeyRefreshRate tf1_wepkeyLength tf1_WEPKeyCharValue1 tf1_WEPKeyCharValue2 tf1_WEPKeyCharValue3 tf1_WEPKeyCharValue4','tf1_wepkeyType_div tf1_wepkeyLength_div','tf1_bcastKeyRefreshRate tf1_sessionKeyRefreshRate','');					
			vidualDisplay ('tf1_securityAuthenticationBlock tf1_openSystem tf1_sharedKey tf1_wepkeyType tf1_wepkeyLength tf1_WEPKeys tf1_WPA tf1_WPA2 tf1_TKIP tf1_CCMP tf1_WPAKeyType tf1_WPAKey tf1_bcastLKeyRefreshRate tf1_preAuth tf1_preAuthLimit tf1_keyCachingHoldTime', 'hide');
			vidualDisplay ('tf1_bcastKeyRefreshRate tf1_sessionKeyRefreshRate', 'configRow')
		break;			
	}
}

/****
 * This function calls when user selects an option from Radio Button
 * OnChange event
 * @method checkWEPPersonalOrEnterprice
 * @param radioName - Radio Button Name
 */
function checkWEPPersonalOrEnterprice(radioName){
	var selValue = radioCheckedValueGet(radioName);
	if (!selValue) return;	
	switch (parseInt(selValue, 10)){
		case 1: /* Static WEP */		
			fieldStateChangeWr ('tf1_preAuth tf1_preAuthLimit tf1_keyCachingHoldTime tf1_sessionKeyRefreshRate','','tf1_securityWPAVersionsBlock tf1_securityWPACiphersBlock tf1_WPA tf1_WPA2 tf1_WPAKeyType tf1_WPAKey tf1_bcastKeyRefreshRate','');
			vidualDisplay ('tf1_preAuth tf1_preAuthLimit tf1_keyCachingHoldTime tf1_sessionKeyRefreshRate', 'hide');
			vidualDisplay ('tf1_WPA tf1_WPA2 tf1_WPAKeyType tf1_WPAKey tf1_bcastKeyRefreshRate', 'configRow')
			vidualDisplay ('tf1_securityWPAVersionsBlock tf1_securityWPACiphersBlock', '');
		break;			
		case 2: /* WEP IEEE802.1x */
			fieldStateChangeWr ('tf1_WPAKeyType tf1_WPAKey','','tf1_securityWPAVersionsBlock tf1_securityWPACiphersBlock tf1_WPA tf1_WPA2 tf1_preAuth tf1_preAuthLimit tf1_keyCachingHoldTime tf1_bcastKeyRefreshRate tf1_sessionKeyRefreshRate','');
			vidualDisplay ('tf1_WPAKeyType tf1_WPAKey', 'hide');
			vidualDisplay ('tf1_WPA tf1_WPA2 tf1_preAuth tf1_preAuthLimit tf1_keyCachingHoldTime tf1_bcastKeyRefreshRate tf1_sessionKeyRefreshRate', 'configRow');
			vidualDisplay ('tf1_securityWPAVersionsBlock tf1_securityWPACiphersBlock', '');
			vidualDisplay ('break19', 'break');
			enableTextFieldByAnchorClick('tf1_preAuth','tf1_preAuthLimit','break20');
			
		break;			
	}
}

/****
 * This function calls when user selects an option from Radio Button
 * OnChange event
 * @method enableWepKeysChars
 * @param radioName - Radio Button Name
 */
function enableWepKeysChars(radioName){
	var selValue = radioCheckedValueGet(radioName);
	if (!selValue) return;	
	switch (parseInt(selValue, 10)){
		case 1: 		
			fieldStateChangeWr ('tf1_WEPKeyCharValue2 tf1_WEPKeyCharValue3 tf1_WEPKeyCharValue4','','tf1_WEPKeyCharValue1','');			
			changeCharLimitDynamically('tf1_wepkeyTypeASCII','tf1_wepkeyLength64');
		break;			
		case 2: 
			fieldStateChangeWr ('tf1_WEPKeyCharValue1 tf1_WEPKeyCharValue3 tf1_WEPKeyCharValue4','','tf1_WEPKeyCharValue2','');		
			changeCharLimitDynamically('tf1_wepkeyTypeASCII','tf1_wepkeyLength64');		
		break;			
		case 3: 		
			fieldStateChangeWr ('tf1_WEPKeyCharValue1 tf1_WEPKeyCharValue2 tf1_WEPKeyCharValue4','','tf1_WEPKeyCharValue3','');	
			changeCharLimitDynamically('tf1_wepkeyTypeASCII','tf1_wepkeyLength64');			
		break;			
		case 4: 
			fieldStateChangeWr ('tf1_WEPKeyCharValue1 tf1_WEPKeyCharValue1 tf1_WEPKeyCharValue3','','tf1_WEPKeyCharValue4','');		
			changeCharLimitDynamically('tf1_wepkeyTypeASCII','tf1_wepkeyLength64');		
		break;			

	}
}

/****
 * This function calls when user selects an option from Radio Button
 * OnChange event
 * @method enableWepKeysChars
 * @param radioName1 - Radio Button Name
 * @param radioName2 - Radio Button Name 
 */
function changeCharLimitDynamically(radioName1,radioName2){
	var selValue1 = radioCheckedValueGet(radioName1);
	var selValue2 = radioCheckedValueGet(radioName2);
	var selValue = selValue1+' '+selValue2;
	switch (selValue){
		case '1 1': /* ASCII */	
			document.getElementById('tf1_dynamicCharLimit').innerHTML="Tx (Characters required: 5)";
			for(var i=1; i<=4; i++)
				document.getElementById('tf1_WEPKeyCharValue'+i).maxLength="5";
		break;			
		case '1 2': /* HEX */
			document.getElementById('tf1_dynamicCharLimit').innerHTML="Tx (Characters required: 13)";
			for(var i=1; i<=4; i++)	
				document.getElementById('tf1_WEPKeyCharValue'+i).maxLength="13";
		break;			
		case '2 1': /* 64 */	
			document.getElementById('tf1_dynamicCharLimit').innerHTML="Tx (Characters required: 10)";
			for(var i=1; i<=4; i++)
				document.getElementById('tf1_WEPKeyCharValue'+i).maxL