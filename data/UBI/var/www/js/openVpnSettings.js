/*
 * File: openVpnSettings.js
 * Created on 30th Oct 2012 - Bala Krishna G
 * Modified on 9th Nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
$(document).ready(function(){
    /**
     * This function calls when user clicks on Activate open VPN
     * OnClick validation
     * @method onloadCall
     */
    onloadCall(openVpnSettingsOnload, {
        imageId: 'tf1_openVpn',
        imageIdEnbDis: 'tf1_userBasedAuth',
        imageIdAllowBlock: 'tf1_crlAuthentication',
        disableIndividual: 'tf1_vpnModeServer tf1_vpnModeClient tf1_vpnModeAccess tf1_selRemoteIpType tf1_vpnServerIP tf1_selFailoverIpType tf1_failoverServerIP tf1_vpnNetwork tf1_vpnNetmask tf1_duplicateCN tf1_vpnPort tf1_vpnTunnelTcp tf1_vpnTunnelUdp tf1_selEncrType tf1_selHashType tf1_vpnTunnelTypeFull tf1_vpnTunnelTypeSplit tf1_clientToClient tf1_tlsAuthentication tf1_crlAuthentication tf1_crlCertsSelection tf1_userName tf1_password tf1_emailAddress tf1_privatePassword tf1_userBasedAuth tf1_protalAuthenticationType tf1_radiusAuthType tf1_certVerfication tf1_serverClientCerts tf1_tlsAuthentication tf1_tlsCertsSelection',
        disableGrp: 'tf1_privateTunnelBlock tf1_uploadCertificateBlock',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break_vpnModeServer break_selRemoteIpType break_vpnServerIP break_selFailoverIpType break_failoverServerIp break_vpnNetwork break_vpnNetmask break_duplicateCN break_vpnPort break_vpnTunnelTcp break_selEncrType break_selHashType break_vpnTunnelTypeFull break_duplicateCN break_userBasedAuth break_userName break_password break_privateTunnelBlock break_clientToClient break_tlsAuthentication break_radiusAuthType break_protalAuthenticationType break_certVerfication break_serverClientCerts break_tlsAuthentication break_tlsCertsSelection break_crlAuthentication break_crlCertsSelection',
        breakClass: 'break',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    });
    
    /**
     * This function calls at the time of page loads
     * OnLoad validation
     * @method openVpnSettingsOnload
     */ 
    openVpnSettingsOnload({
        imageId: 'tf1_openVpn',
        imageIdEnbDis: 'tf1_userBasedAuth',
        imageIdAllowBlock: 'tf1_crlAuthentication',
        disableIndividual: 'tf1_vpnModeServer tf1_vpnModeClient tf1_vpnModeAccess tf1_selRemoteIpType tf1_vpnServerIP tf1_selFailoverIpType tf1_failoverServerIP tf1_vpnNetwork tf1_vpnNetmask tf1_duplicateCN tf1_vpnPort tf1_vpnTunnelTcp tf1_vpnTunnelUdp tf1_selEncrType tf1_selHashType tf1_vpnTunnelTypeFull tf1_vpnTunnelTypeSplit tf1_clientToClient tf1_tlsAuthentication tf1_crlAuthentication tf1_crlCertsSelection tf1_userName tf1_password tf1_emailAddress tf1_privatePassword tf1_userBasedAuth tf1_protalAuthenticationType tf1_radiusAuthType tf1_certVerfication tf1_serverClientCerts tf1_tlsAuthentication tf1_tlsCertsSelection',
        disableGrp: 'tf1_privateTunnelBlock tf1_uploadCertificateBlock',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break_vpnModeServer break_selRemoteIpType break_vpnServerIP break_selFailoverIpType break_failoverServerIp break_vpnNetwork break_vpnNetmask break_duplicateCN break_vpnPort break_vpnTunnelTcp break_selEncrType break_selHashType break_vpnTunnelTypeFull break_duplicateCN break_userBasedAuth break_userName break_password break_privateTunnelBlock break_clientToClient break_tlsAuthentication break_radiusAuthType break_protalAuthenticationType break_certVerfication break_serverClientCerts break_tlsAuthentication break_tlsCertsSelection break_crlAuthentication break_crlCertsSelection',
        breakClass: 'break',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    });
    $("#btUploadCfg").live('click', function(){
	var uploadFileObj = document.getElementById('tf1_txtUploadFile');
	if (uploadFileObj && !uploadFileObj.disabled) {
        if (uploadFileObj.value == '' || uploadFileObj.files.length == "0") {
            alert(LANG_LOCALE['50165']);
            return false;
        }
        else
    	{
			var fSize = uploadFileObj.files[0].size;
			if (fSize > 1048576)
            	{
                	alert(LANG_LOCALE['50038']);
                    return false;
                } 
		}
    }
	});
    
    return true;
});

/**
 * Onload function
 * @method openVpnSettingsOnload
 * @param toggleObj - object
 */
function openVpnSettingsOnload(toggleObj){
    onAnchorToggle(toggleObj);
    vpnModeChange('tf1_vpnModeServer');
}

function  openVpenOnreset(frmId) {

 resetImgOnOff(frmId);
 vpnModeChange('tf1_vpnModeServer');
 authServerChangeMode('tf1_protalAuthenticationType');
 openVpnSettingsOnload({
        imageId: 'tf1_openVpn',
        imageIdEnbDis: 'tf1_userBasedAuth',
        imageIdAllowBlock: 'tf1_crlAuthentication',
        disableIndividual: 'tf1_vpnModeServer tf1_vpnModeClient tf1_vpnModeAccess tf1_selRemoteIpType tf1_vpnServerIP tf1_selFailoverIpType tf1_failoverServerIP tf1_vpnNetwork tf1_vpnNetmask tf1_duplicateCN tf1_vpnPort tf1_vpnTunnelTcp tf1_vpnTunnelUdp tf1_selEncrType tf1_selHashType tf1_vpnTunnelTypeFull tf1_vpnTunnelTypeSplit tf1_clientToClient tf1_tlsAuthentication tf1_crlAuthentication tf1_crlCertsSelection tf1_userName tf1_password tf1_emailAddress tf1_privatePassword tf1_userBasedAuth tf1_protalAuthenticationType tf1_radiusAuthType tf1_certVerfication tf1_serverClientCerts tf1_tlsAuthentication tf1_tlsCertsSelection',
        disableGrp: 'tf1_privateTunnelBlock tf1_uploadCertificateBlock',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break_vpnModeServer break_selRemoteIpType break_vpnServerIP break_selFailoverIpType break_failoverServerIp break_vpnNetwork break_vpnNetmask break_duplicateCN break_vpnPort break_vpnTunnelTcp break_selEncrType break_selHashType break_vpnTunnelTypeFull break_userBasedAuth break_userName break_password break_privateTunnelBlock break_clientToClient break_tlsAuthentication break_radiusAuthType break_protalAuthenticationType break_certVerfication break_serverClientCerts break_tlsAuthentication break_tlsCertsSelection break_crlAuthentication break_crlCertsSelection',
        breakClass: 'break',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    });

}

/**
 * This function calls when user selects VPN Server Setup Mode
 * OnClick validation
 * @method vpnModeChange
 */
function vpnModeChange(vpnRadioName){
    var selValue = radioCheckedValueGet(vpnRadioName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* Server */
            fieldStateChangeWr('tf1_selRemoteIpType tf1_vpnServerIP tf1_selFailoverIpType tf1_failoverServerIP tf1_userName tf1_password', 'tf1_privateTunnelBlock_div tf1_uploadCertificateBlock_div', 'tf1_vpnNetwork tf1_vpnNetmask tf1_duplicateCN tf1_vpnTunnelTcp tf1_vpnTunnelUdp tf1_selEncrType tf1_selHashType tf1_vpnTunnelTypeFull tf1_vpnTunnelTypeSplit tf1_userBasedAuth tf1_certVerfication tf1_serverClientCerts tf1_tlsAuthentication tf1_crlAuthentication', '');


            vidualDisplay('tf1_selRemoteIpType tf1_vpnServerIP tf1_selFailoverIpType tf1_failoverServerIP tf1_userName tf1_password', 'hide');
            vidualDisplay('break_selRemoteIpType break_vpnServerIP break_selFailoverIpType break_failoverServerIp break_userName break_password', 'hide');

            vidualDisplay('tf1_privateTunnelBlock tf1_uploadCertificateBlock', 'hide');

            vidualDisplay('tf1_vpnNetwork tf1_vpnNetmask tf1_duplicateCN tf1_vpnTunnelTcp tf1_vpnTunnelUdp tf1_selEncrType tf1_selHashType tf1_vpnTunnelTypeFull tf1_vpnTunnelTypeSplit tf1_userBasedAuth tf1_certVerfication tf1_serverClientCerts tf1_tlsAuthentication tf1_crlAuthentication', 'configRow');

            vidualDisplay('break_vpnNetwork break_vpnNetmask break_duplicateCN break_vpnTunnelTcp break_selEncrType break_selHashType break_vpnTunnelTypeFull break_userBasedAuth break_certVerfication break_serverClientCerts break_tlsAuthentication break_crlAuthentication', 'break');

            vpnTunnelType('tf1_vpnTunnelTypeFull');

            disTextFieldByAnchorClick ('tf1_userBasedAuth', 'tf1_protalAuthenticationType tf1_radiusAuthType', 'break_protalAuthenticationType break_radiusAuthType');
        
            authServerChangeMode('tf1_protalAuthenticationType');
            $('#dynamicLblName').text(LANG_LOCALE['50204']);
            
            enaTextFieldByAnchorClick ('tf1_tlsAuthentication', 'tf1_tlsCertsSelection', 'break_tlsCertsSelection');
            blockTextFieldByAnchorClick ('tf1_crlAuthentication', 'tf1_crlCertsSelection', 'break_crlCertsSelection');
	    
	    var tlsStatObj = document.getElementById('hdTlsStat');
	    if (tlsStatObj) {
		var tlsStat = tlsStatObj.value;
		if (tlsStat != "1") {
		    fieldStateChangeWr('tf1_tlsCertsSelection', '', '', '');
		    vidualDisplay('tf1_tlsCertsSelection break_tlsCertsSelection', 'hide');
		}
	    }
            
	    var crlStatObj = document.getElementById('hdCrlStat');
	    if (crlStatObj) {
		var crlStat = crlStatObj.value;
		if (crlStat != "0") {
		    fieldStateChangeWr('tf1_crlCertsSelection', '', '', '');
		    vidualDisplay('tf1_crlCertsSelection break_crlCertsSelection', 'hide');
		}
	    }
            
            break;
            
        case 2: /* Client */
            fieldStateChangeWr('tf1_vpnNetwork tf1_vpnNetmask tf1_duplicateCN tf1_vpnTunnelTypeFull tf1_vpnTunnelTypeSplit tf1_clientToClient tf1_protalAuthenticationType tf1_radiusAuthType tf1_crlAuthentication tf1_crlCertsSelection', 'tf1_privateTunnelBlock_div tf1_uploadCertificateBlock_div', 'tf1_selRemoteIpType tf1_vpnServerIP tf1_selFailoverIpType tf1_failoverServerIP tf1_vpnTunnelTcp tf1_vpnTunnelUdp tf1_selEncrType tf1_selHashType tf1_userBasedAuth tf1_certVerfication tf1_serverClientCerts tf1_tlsAuthentication', '');
            
            vidualDisplay('tf1_vpnNetwork tf1_vpnNetmask tf1_duplicateCN tf1_vpnTunnelTypeFull tf1_vpnTunnelTypeSplit tf1_clientToClient tf1_protalAuthenticationType tf1_radiusAuthType tf1_crlAuthentication tf1_crlCertsSelection', 'hide');
            vidualDisplay('break_vpnNetwork break_vpnNetmask break_duplicateCN break_vpnTunnelTypeFull break_clientToClient break_protalAuthenticationType break_radiusAuthType break_crlAuthentication break_crlCertsSelection', 'hide');
            
            vidualDisplay('tf1_privateTunnelBlock tf1_uploadCertificateBlock tf1_duplicateCN', 'hide');

            vidualDisplay('break_privateTunnelBlock', 'hide');

            vidualDisplay('tf1_selRemoteIpType tf1_vpnServerIP tf1_selFailoverIpType tf1_failoverServerIP tf1_vpnTunnelTcp tf1_vpnTunnelUdp tf1_selEncrType tf1_selHashType tf1_userBasedAuth tf1_certVerfication tf1_serverClientCerts tf1_tlsAuthentication', 'configRow');
            vidualDisplay('break_selRemoteIpType break_vpnServerIP break_selFailoverIpType break_failoverServerIp break_vpnTunnelTcp break_selEncrType break_selHashType break_userBasedAuth  break_certVerfication break_serverClientCerts break_tlsAuthentication', 'break');

            enaTextFieldByAnchorClick ('tf1_userBasedAuth', 'tf1_userName tf1_password', 'break_userName break_password');
            authServerChangeMode('tf1_protalAuthenticationType'); 
            $('#dynamicLblName').text(LANG_LOCALE['50205']);
            enaTextFieldByAnchorClick ('tf1_tlsAuthentication', 'tf1_tlsCertsSelection', 'break_tlsCertsSelection');
	    
	    var tlsStatObj = document.getElementById('hdTlsStat');
	    if (tlsStatObj) {
		var tlsStat = tlsStatObj.value;
		if (tlsStat != "1") {
		    fieldStateChangeWr('tf1_tlsCertsSelection', '', '', '');
		    vidualDisplay('tf1_tlsCertsSelection break_tlsCertsSelection', 'hide');
		}
	    }
            
            break;
            
        case 3: /* Access Server Client */
            fieldStateChangeWr('tf1_selRemoteIpType tf1_vpnServerIP tf1_selFailoverIpType tf1_failoverServerIP tf1_vpnTunnelTcp tf1_vpnTunnelUdp tf1_selEncrType tf1_selHashType tf1_vpnNetwork tf1_vpnNetmask tf1_duplicateCN tf1_vpnTunnelTypeFull tf1_vpnTunnelTypeSplit tf1_clientToClient tf1_userBasedAuth tf1_userName tf1_password tf1_protalAuthenticationType tf1_radiusAuthType tf1_certVerfication tf1_serverClientCerts tf1_tlsAuthentication tf1_tlsCertsSelection tf1_crlAuthentication tf1_crlCertsSelection', '', '', 'tf1_privateTunnelBlock_div tf1_uploadCertificateBlock_div');

            vidualDisplay('tf1_selRemoteIpType tf1_vpnServerIP tf1_selFailoverIpType tf1_failoverServerIP tf1_vpnTunnelTcp tf1_vpnTunnelUdp tf1_selEncrType tf1_selHashType tf1_vpnNetwork tf1_vpnNetmask tf1_duplicateCN tf1_vpnTunnelTypeFull tf1_vpnTunnelTypeSplit tf1_clientToClient tf1_userBasedAuth tf1_userName tf1_password tf1_protalAuthenticationType tf1_radiusAuthType tf1_certVerfication tf1_serverClientCerts tf1_tlsAuthentication tf1_tlsCertsSelection tf1_crlAuthentication tf1_crlCertsSelection', 'hide');

            vidualDisplay('break_selRemoteIpType break_vpnServerIP break_selFailoverIpType break_failoverServerIp break_vpnTunnelTcp break_selencrtype break_selhashtype break_vpnNetwork break_vpnNetmask break_duplicateCN break_vpnTunnelTypeFull break_clientToClient break_userBasedAuth break_userName break_password break_protalAuthenticationType break_radiusAuthType break_certVerfication break_serverClientCerts break_tlsAuthentication break_tlsCertsSelection break_crlAuthentication break_crlCertsSelection', 'hide');

			enableTextFieldByAnchorClick('tf1_privateTunnel','tf1_emailAddress tf1_privatePassword tf1_vpnCluster','break_privateTunnel break_emailAddress break_privatePassword break_vpnCluster');
		    vidualDisplay('tf1_privateTunnelBlock tf1_uploadCertificateBlock', '');
            vidualDisplay('break_privateTunnelBlock', 'break');
            break;
    }
}

/****
 * This function calls when user clicks on submit button
 * On submit validation
 * @method pageValidate
 */
function pageValidate(frmId){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_vpnServerIP, "+LANG_LOCALE['30230'];
    txtFieldIdArr[1] = "tf1_vpnNetwork, "+LANG_LOCALE['12148'];
    txtFieldIdArr[2] = "tf1_vpnNetmask, "+LANG_LOCALE['12147'];
    txtFieldIdArr[3] = "tf1_vpnPort, "+LANG_LOCALE['12082'];
    txtFieldIdArr[4] = "tf1_userName, "+LANG_LOCALE['12144'];
    txtFieldIdArr[5] = "tf1_password, "+LANG_LOCALE['12333'];
    txtFieldIdArr[6] = "tf1_emailAddress, "+LANG_LOCALE['50039'];
    txtFieldIdArr[7] = "tf1_privatePassword, "+LANG_LOCALE['12074'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false; 
    
    var serverIpObj = document.getElementById('tf1_vpnServerIP');
    var ipAddrObj = document.getElementById('tf1_vpnNetwork');
    var ipSubnetmaskObj = document.getElementById('tf1_vpnNetmask');
    
    if (serverIpObj && !serverIpObj.disabled) {
        if (remoteIpTypeCheck () == false)
               return false;
    }

    if (failoverIpTypeCheck () == false)
        return false;

    if (ipAddrObj && !ipAddrObj.disabled) {
        if (ipv4Validate('tf1_vpnNetwork', 'SN', false, true, LANG_LOCALE['11281']+'. ', LANG_LOCALE['11031'], true) == false) 
            return false;
    }
    if (ipSubnetmaskObj && !ipSubnetmaskObj.disabled) {
        if (validNetMask('tf1_vpnNetmask') == false) 
            return false;
    }
    /* Add a check for correct network address */
    if (ipAddrObj && !ipAddrObj.disabled && ipSubnetmaskObj && !ipSubnetmaskObj.disabled) {
	    if (checkCorrectNetworkAddress(ipAddrObj, ipSubnetmaskObj) == false) {
	        alert(LANG_LOCALE['12066']);
	        ipAddrObj.focus();
	        return false;
	    }
	}
    /* Subnet mask should be greater and equal to 255.255.0.0 */
    if (ipSubnetmaskObj && !ipSubnetmaskObj.disabled) {
        if (countSetbits(convert_addr(ipSubnetmaskObj.value)) < 16) {
            alert(LANG_LOCALE['30231']);
            ipSubnetmaskObj.focus();
            return false;
        }
    }
    if (serverIpObj && !serverIpObj.disabled) {
        if (remoteIpTypeCheck () == false)
               return false;
    }

    if (numericValueRangeCheck(document.getElementById('tf1_vpnPort'), '', '', 1024, 65535, true, LANG_LOCALE['11315']+'. ', '') == false) 
        return false;

    var emailServerAddrObj = document.getElementById ('tf1_emailAddress');
    if (emailServerAddrObj && !emailServerAddrObj.disabled) {
        if (validateEmailCheck('tf1_emailAddress') == false) 
            return false;
    }
    
  /* Get the Mode */

  var openVPNMode = radioCheckedValueGet('tf1_vpnModeServer');

	if (openVPNMode) {

		switch (parseInt(openVPNMode, 10)) {
		case 1: /* Server */
			if (document.getElementById("tf1_ServerCertificateReqStatus").value == 1) {
				alert(LANG_LOCALE['12449']);
				return false;
			}
		break;
		case 2: /*Client */
		 if (document.getElementById("tf1_ClientCertificateReqStatus").value == 1) {
				alert(LANG_LOCALE['12449']);
				return false;
			}			
		break;
		case 3: /*Access server client */
		var unitName = $("#hdUnitName").val();
		var uploadStatus = document.getElementById("tf1_uploadStatus").value;
		if (unitName == "DSR-250N" || unitName == "DSR-250" || unitName == "DSR-150N" || unitName == "DSR-150") {
			if (uploadStatus == "No") {
				alert(LANG_LOCALE['12448']);
				return false;
			}
		} else {
			var privateTunnelImgObj = document.getElementById('tf1_privateTunnel');
        		var privatecurrentClass = $(privateTunnelImgObj).attr("class");
	        	if (privatecurrentClass == OFF_ANCHOR && uploadStatus == "No") {
				alert(LANG_LOCALE['12448']);
				return false;
			}
		}
		break;
		}
	}

    /*var allowuserbasedImgObj = document.getElementById('tf1_allowuserBasedAuth');
    var userbasedAuthImgObj = document.getElementById('tf1_userBasedAuth');
    if (openVPNMode == "1" || openVPNMode == "2") {
        if (allowuserbasedImgObj) {
            var currentClassAllow = $(allowuserbasedImgObj).attr("class");
            if (currentClassAllow == ON_ANCHOR) {
                var userbasedAuthClass = $(userbasedAuthImgObj).attr("class");
                if(userbasedAuthClass == OFF_ANCHOR){
                    alert(LANG_LOCALE['50040']);
                    return false;
                }
            }
        }
    }*/

    var duplicateImgObj = document.getElementById('tf1_duplicateCN');
    if (openVPNMode == "1") {
        var userbasedImgObj = document.getElementById('tf1_userBasedAuth');
        if (duplicateImgObj && userbasedImgObj) {
            var currentClass = $(duplicateImgObj).attr("class");
            if (currentClass == ON_ANCHOR) {
                var userbasedClass = $(userbasedImgObj).attr("class");
                if(userbasedClass == DISABLE_ANCHOR){
                    alert(LANG_LOCALE['50040']);
                    return false;
                }
            }
        }

        var certVerficationImgObj = document.getElementById('tf1_certVerfication');
        if (duplicateImgObj && certVerficationImgObj) {
            var currentClass = $(duplicateImgObj).attr("class");
            if (currentClass == ON_ANCHOR) {
                var certVerficationClass = $(certVerficationImgObj).attr("class");
                if(certVerficationClass == OFF_ANCHOR){
                    alert(LANG_LOCALE['50215']);
                    return false;
                }
            }
        }
    }

    if (openVPNMode == "1") {
	    var uploadCaCheckvalue = $("#tf1_uploadCacheck").val();
        if(uploadCaCheckvalue == "1"){
            alert(LANG_LOCALE['50041']);
            return false;
        }
    }
    /* upload file check for acess server client mode starts */
	var uploadFileObj = document.getElementById('tf1_txtUploadFile');
  	if (uploadFileObj && !uploadFileObj.disabled && uploadFileObj.value != '') {
	var fSize = uploadFileObj.files[0].size;
	if (fSize > 1048576)
            	{
               	alert(LANG_LOCALE['50038']);
                return false;
                } 
  }
/* upload file check for acess server client mode ends */
	var modeTypeValue = radioCheckedValueGet('tf1_vpnModeServer');
	if (modeTypeValue && modeTypeValue != '3') {
  	    if (!atleastOneAuthSupportAll ('tf1_userBasedAuth tf1_certVerfication')) {
	         alert (LANG_LOCALE['50166']);
	         return false;
	    }
	}

    setHiddenChks(frmId);
    return true;
}



/**
 * This function calls when user selects Tunnel Type
 * OnClick validation
 * @method vpnTunnelType
 */
function vpnTunnelType(vpnTunnelType){
    var selValue = radioCheckedValueGet(vpnTunnelType);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* Full Tunnel */
            fieldStateChangeWr('tf1_clientToClient', '', '', '');
            vidualDisplay('tf1_clientToClient break_clientToClient', 'hide');
            break;
            
        case 2: /* Split Tunnel */
            fieldStateChangeWr('', '', 'tf1_clientToClient', '');
            vidualDisplay('tf1_clientToClient', 'configRow');
            vidualDisplay('break_clientToClient', 'break');
            break;
    }
}

function remoteIpTypeCheck ()
    {
       var selRemoteTypObj = document.getElementById ('tf1_selRemoteIpType');
       var vpnServObj = document.getElementById ('tf1_vpnServerIP');

       if (!selRemoteTypObj || selRemoteTypObj.disabled || !vpnServObj || vpnServObj.disabled) return true;

       if (parseInt (selRemoteTypObj.value, 10) == 0)
            {
                if (ipv4Validate ('tf1_vpnServerIP', 'IP', false, true, LANG_LOCALE['11281']+'. ', LANG_LOCALE['11031'], true) == false)
                return false;
            }
       else
            {
               if (validateFQDN ('tf1_vpnServerIP') == false)
              return false;
            }

       return true;
    }

function failoverIpTypeCheck ()
    {
       var failoverIpTypObj = document.getElementById ('tf1_selFailoverIpType');

       if (parseInt (failoverIpTypObj.value, 10) == 0)
            {
                if (ipv4Validate ('tf1_failoverServerIP', 'IP', true, true, LANG_LOCALE['11281']+'. ', LANG_LOCALE['11031'], true) == false)
                return false;
            }
       else
            {
               if (validateFQDN ('tf1_failoverServerIP') == false)
              return false;
            }

       return true;
    }

/**
 * Email check function: Checks the given Email Address Valid or not
 * @method validateEmailCheck
 * @param mailAddr - emailaddress
 */
function validateEmailCheck(mailAddr){
    var mail = document.getElementById(mailAddr);
    if (mail.disabled) 
        return true;
    var str = mail.value;
    if (str == "") 
        return true;
    var message = "";
    var errFlag = true;
    var at = "@"
    var dot = "."
    var lat = str.indexOf(at)
    var lstr = str.length
    var ldot = str.indexOf(dot)
    var message = ""
    
    if (lat == -1) {
        message = LANG_LOCALE['10868'];
        errFlag = false
    }
    else 
        if (lat == 0 || ((lat + 1) == lstr)) {
            message = LANG_LOCALE['11258'];
            errFlag = false
        }
        else 
            if (ldot == -1) {
                message = LANG_LOCALE['10867'];
                errFlag = false
            }
            else 
                if (ldot == 0 || ((ldot + 1) == lstr)) {
                    message = LANG_LOCALE['11257'];
                    errFlag = false
                }
                else 
                    if (str.indexOf(at, (lat + 1)) != -1) {
                        message = LANG_LOCALE['11256'];
                        errFlag = false
                    }
                    else 
                        if (str.substring(lat - 1, lat) == dot || str.substring(lat + 1, lat + 2) == dot) {
                            message = LANG_LOCALE['11256'];
                            errFlag = false
                        }
                        else 
                            if (str.indexOf(dot, (lat + 2)) == -1) {
                                message = LANG_LOCALE['11256'];
                                errFlag = false
                            }
                            else 
                                if (str.indexOf(" ") != -1) {
                                    message = LANG_LOCALE['11256'];
                                    errFlag = false
                                }
    var errFieldId = mailAddr + "Err";
    if (!errFlag) {
        alert(message);
        mail.focus();
    }
    return errFlag;
}

/**
 * This function calls when User select an radio option
 * @method dhcpChangeMode
 */
function authServerChangeMode(selName){
    var selValue = comboSelectedValueGet (selName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* Local User Database */
        case 3: /* LDAP Server */
		case 4: /* POP3 */
		case 5: /* Active Directory */
		case 6: /* NT Domain */
			 fieldStateChangeWr('tf1_radiusAuthType', '', '', '');
			 vidualDisplay('tf1_radiusAuthType', 'hide');
			 vidualDisplay('break_radiusAuthType', 'hide');
        break;
        case 2: /* Radius Server */
			fieldStateChangeWr('', '', 'tf1_radiusAuthType', '');
			vidualDisplay('tf1_radiusAuthType', 'configRow');
			vidualDisplay('break_radiusAuthType', 'break');
		break;
    }
}

