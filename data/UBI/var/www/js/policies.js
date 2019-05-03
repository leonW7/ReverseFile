/*
 * File: policies.js    
 * Created on 4th Dec 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * This function calls Page loads
 * Onload validation
 * @method onloadCall
 */   
function onloadPoliciesFn () {
	onloadCall (enableDisableFieldsByImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});	
	enableTextFieldByAnchorClick('tf1_enableKeepalive','tf1_sourceIpAddr tf1_destinationIpAddr tf1_detectionPeriod tf1_reconnectAfterFailureCount','break25 break26 break27 break28');
	enableTextFieldByAnchorClick('tf1_natTraversal','tf1_natKeepAliveFrequency','break32');	
	enableTextFieldByAnchorClick('tf1_blowfish','tf1_blowfishValue');
	enableTextFieldByAnchorClick('tf1_cast128','tf1_cast128Value');
	enableTextFieldByAnchorClick('tf1_enableDeadPeerDetection','tf1_Phase1DetectionPeriod tf1_reconnectAfterFailure tf1_enableRedundantGate','break48 break49');	
	enableTextFieldByAnchorClick('tf1_phase2EncryptionBlowfish','tf1_phase2EncryptionBlowfishValue');
	enableTextFieldByAnchorClick('tf1_phase2EncryptionCast128','tf1_phase2EncryptionCast128Value');
	enableTextFieldByAnchorClick('tf1_pfsKeyGroup','tf1_pfsKeyGroupSelect');
	enableTextFieldByAnchorClick('tf1_enableRedundantGateway','tf1_selectBackPolicy tf1_FailbackTime');	
	changeGeneralPolicyType('tf1_policyType');
        selProtocol ();
	checkL2tpIpsec ();
	//changeGeneralIPsecMode('tf1_IPsecMode');		
	changeLocalAndRemoteIdentifierType('tf1_localIdentifierType', 'tf1_localIdentifier', 'break34');
	changeLocalAndRemoteIdentifierType('tf1_remoteIdentifierType', 'tf1_remoteIdentifier', 'break36');
	changeAuthenticationMethod ('tf1_authMethod');
	changeExtendedAuthentication('tf1_extendedAuth');
        var remoteObj = document.getElementById ('tf1_remoteIp');
        var remoteObjVal = remoteObj.value;
            remoteObj.length = 0;
            if ($("#tf1_enableNetBIOS").attr("class") == ON_ANCHOR)
                {
                    remoteObj.options[remoteObj.options.length] = new Option (LANG_LOCALE['14339'], "4");
                }
            else
                {
                    remoteObj.options[remoteObj.options.length] = new Option (LANG_LOCALE['10226'], "1");
                    remoteObj.options[remoteObj.options.length] = new Option (LANG_LOCALE['14340'], "2");
                    remoteObj.options[remoteObj.options.length] = new Option (LANG_LOCALE['12627'], "3");
                    remoteObj.options[remoteObj.options.length] = new Option (LANG_LOCALE['14339'], "4");
                }	
			optionValueSelect1('tf1_remoteIp', remoteObjVal);
			changeRemoteIpSelect('tf1_remoteIp');
            nonEditChange();
}

/*
 *Purpose : Added Edit operation on Backup Policy table
            While doing Edit operation fileds are non Editable.
 * */
function nonEditChange() {

   if ($("#tf1_nonEditLocal").length > 0) {
        $("#tf1_nonEdit_localIp").html('');
        $("#tf1_nonEdit_localIp").append('<option>'+$("#tf1_localIp option:selected").text()+'</option>');
   }
    if ($("#tf1_nonEditRemote").length > 0) {
        $("#tf1_nonEdit_remoteIp").html('');
        $("#tf1_nonEdit_remoteIp").append('<option>'+$("#tf1_remoteIp option:selected").text()+'</option>');
   }

               /* Set default values while changing from Manual to Auto Policy */
            var hdDircTypeObj = $("#hdselDirection");
            if (hdDircTypeObj)
                {
                var hdDircType = hdDircTypeObj.val();
                if (hdDircType == "")
                    document.getElementById("tf1_direction").value = "3";
                }

            var hdDhGroupObj = $("#hdDhGroup");
            if (hdDhGroupObj)
                {
                var hdDhGroupType = hdDhGroupObj.val();
                if (hdDhGroupType == "")
                    document.getElementById("tf1_diffieHellman").value = "2";
                }

            var hdSALifeTimeObj = $("#hdSALifeTime");
            if (hdSALifeTimeObj)
                {
                    var hdSALifeTimeVal = hdSALifeTimeObj.val();
                    if (hdSALifeTimeVal == "")
                        document.getElementById("tf1_SALifeTime").value = "28800";
                }

            var hdtf1_natTraversalObj = $("#hdtf1_natTraversal");
            if (hdtf1_natTraversalObj)
                {
                    var hdtf1_natTraversal = hdtf1_natTraversalObj.val();
                    if (hdtf1_natTraversal == "")
                        {
                            document.getElementById("tf1_natTraversal").className = "enable-disable-on";
                            document.getElementById("hdNatTraversal").value = "1";
                            enableTextFieldByAnchorClick("tf1_natTraversal",'tf1_natKeepAliveFrequency','break32');
                            var hdtf1_natKeepAliveFrqObj = $("#hdtf1_natKeepAliveFrequency");
                            if (hdtf1_natKeepAliveFrqObj)
                                {
                                var hdNatKeepAliveFrq = hdtf1_natKeepAliveFrqObj.val();
                                if (hdNatKeepAliveFrq == "")
                                    document.getElementById("tf1_natKeepAliveFrequency").value = "20";
                                }
                        }
                }
}

/*
 * Displays correspondig fields while selecting AH option from Protocol filed
 * @method selProtocol
 */
function selProtocol ()
    {
        var protocol = $("#tf1_protocol").val ();
        if (protocol == "1") // AH value
            {
                fieldStateChangeWr ("tf1_encryptionDes2 tf1_encryptionNone tf1_encryption3Des tf1_encryptionAes128 tf1_encryptionAes192 tf1_encryptionAes256 tf1_encryptionTwofish128 tf1_encryptionTwofish192 tf1_encryptionTwofish256 tf1_phase2EncryptionBlowfish tf1_phase2EncryptionCast128 tf1_phase2EncryptionBlowfishValue tf1_phase2EncryptionCast128Value", "tf1_phase2EncryptionAlg_div", "", "");
                vidualDisplay ("tf1_phase2EncryptionAlg tf1_encryptionDes2 tf1_encryptionAes128 tf1_encryptionAes192 tf1_encryptionTwofish128 tf1_encryptionTwofish256 tf1_phase2EncryptionBlowfish tf1_phase2EncryptionCast128 tf1_phase2EncryptionBlowfishValue tf1_phase2EncryptionCast128Value", "hide");
                vidualDisplay ("break65 break66Phase2 break69Phase2 break71Phase2 break75Phase2 break76Phase2 break77Phase2 break78Phase2 break_phase2EncryptionAlg", "hide");
            }
        else
            {
                fieldStateChangeWr ("", "", "tf1_encryptionDes2 tf1_encryptionNone tf1_encryption3Des tf1_encryptionAes128 tf1_encryptionAes192 tf1_encryptionAes256 tf1_encryptionTwofish128 tf1_encryptionTwofish192 tf1_encryptionTwofish256 tf1_phase2EncryptionBlowfish tf1_phase2EncryptionCast128", "tf1_phase2EncryptionAlg_div");
                vidualDisplay ("tf1_phase2EncryptionAlg tf1_encryptionDes2 tf1_encryptionAes128 tf1_encryptionAes192 tf1_encryptionTwofish128 tf1_encryptionTwofish256 tf1_phase2EncryptionBlowfish tf1_phase2EncryptionCast128", "configRow");
                vidualDisplay ("break65 break66Phase2 break69Phase2 break71Phase2 break75Phase2 break76Phase2 break77Phase2 break78Phase2 break_phase2EncryptionAlg", "break");
                enableTextFieldByAnchorClick('tf1_phase2EncryptionBlowfish','tf1_phase2EncryptionBlowfishValue');
                   enableTextFieldByAnchorClick('tf1_phase2EncryptionCast128','tf1_phase2EncryptionCast128Value');
            }
    }

/**
* displays corresponding fields on ImageToggle
* @method enableDisableFieldsByImageClick
* @param data - image data
* @param thisObj - currtent image id
*/
function enableDisableFieldsByImageClick(data, thisObj) { 
    onAnchorToggle (data);
    var imgId=thisObj.id;
    
    switch(imgId){
    	case 'tf1_enableModeConfig':
    		disableTextFieldByAnchorClick(imgId,'tf1_enableNetBIOS tf1_enableRollOver tf1_enableDHCP','break10   break12');    		
    	break;    	
    	case 'tf1_enableDHCP':
    		disableTextFieldByAnchorClick(imgId,'tf1_localIp tf1_localStartIpAddr tf1_localEndIpAddr tf1_localSubnetMask tf1_localPrefixLength tf1_remoteIp tf1_remoteStartIpAddr tf1_remoteEndIpAddr tf1_remoteSubnetMask tf1_remotePrefixLength', 'break13 break14 break15 break16 break17 break18 break19 break20 break21 break22 break23');   
    		changeLocalIpSelect('tf1_localIp');
    		changeRemoteIpSelect('tf1_remoteIp');
    		var policyValue = comboSelectedValueGet('tf1_policyType');
			if(policyValue == 2)
    			checkDhcp();    			
    		/*var ipsecValue = comboSelectedValueGet('tf1_IPsecMode');
			if(ipsecValue == 2)
	    		checkDhcp();*/
	    	break;    	
    	case 'tf1_enableKeepalive':
    		enableTextFieldByAnchorClick(imgId,'tf1_sourceIpAddr tf1_destinationIpAddr tf1_detectionPeriod tf1_reconnectAfterFailureCount','break25 break26 break27 break28');
    	break;		
		case 'tf1_natTraversal':
    		enableTextFieldByAnchorClick(imgId,'tf1_natKeepAliveFrequency','break32');	
    	break;
		case 'tf1_blowfish':
    		enableTextFieldByAnchorClick(imgId,'tf1_blowfishValue');	
    	break;
		case 'tf1_cast128':
    		enableTextFieldByAnchorClick(imgId,'tf1_cast128Value');
    	break;    	
    	case 'tf1_enableDeadPeerDetection':
    		enableTextFieldByAnchorClick(imgId,'tf1_Phase1DetectionPeriod tf1_reconnectAfterFailure tf1_enableRedundantGate','break48 break49');	
    		enableRedundantVPNGatewayParameters();
    	break;    	
    	case 'tf1_phase2EncryptionBlowfish':
    		 enableTextFieldByAnchorClick(imgId,'tf1_phase2EncryptionBlowfishValue');
    	break;
		case 'tf1_phase2EncryptionCast128':
			 enableTextFieldByAnchorClick(imgId,'tf1_phase2EncryptionCast128Value');
		break;		
		case 'tf1_pfsKeyGroup':
			 enableTextFieldByAnchorClick(imgId,'tf1_pfsKeyGroupSelect');
		break;
		case 'tf1_enableRedundantGateway':
			enableTextFieldByAnchorClick(imgId,'tf1_selectBackPolicy tf1_FailbackTime');
		break;
        case 'tf1_enableNetBIOS':
            var remoteObj = document.getElementById ('tf1_remoteIp');
            var remoteObjVal = remoteObj.value;
            remoteObj.length = 0;
            if ($("#tf1_enableNetBIOS").attr("class") == ON_ANCHOR)
                {
                    remoteObj.options[remoteObj.length] = new Option (LANG_LOCALE['14339'], "4");
                }
            else
                {
                    remoteObj.options[remoteObj.options.length] = new Option (LANG_LOCALE['10226'], "1");
                    remoteObj.options[remoteObj.options.length] = new Option (LANG_LOCALE['14340'], "2");
                    remoteObj.options[remoteObj.options.length] = new Option (LANG_LOCALE['12627'], "3");
                    remoteObj.options[remoteObj.options.length] = new Option (LANG_LOCALE['14339'], "4");
                }
			optionValueSelect1('tf1_remoteIp', remoteObjVal);
			changeRemoteIpSelect('tf1_remoteIp');
        break;
    }
}

/****
 * This function calls when user selects an option from Policy Type
 * OnChange event
 * @method changeGeneralPolicyType
 * @param selName - Select box Name
 */
function changeGeneralPolicyType(selName){
	var selValue = comboSelectedValueGet (selName);
	if (!selValue) return;		
    switch (parseInt(selValue, 10)){
   		case 1:	/* Auto Policy */
			fieldStateChangeWr ('tf1_SPIIncoming tf1_SPIOutgoing tf1_manualEncryptionAlgorithm tf1_encryptionkeyLength tf1_encryptionKeyIn tf1_encryptionKeyOut tf1_integrityAlgorithm tf1_integrityKeyIn tf1_integrityKeyOut','','tf1_enableKeepalive tf1_exchangeMode tf1_direction tf1_natTraversal tf1_localIdentifierType tf1_remoteIdentifierType tf1_encryptionAlgorithm tf1_blowfish tf1_cast128 tf1_authAlgorithm tf1_authMethod tf1_authMethod tf1_presharedkey tf1_diffieHellman tf1_diffieHellman tf1_SALifeTime tf1_enableDeadPeerDetection tf1_extendedAuth tf1_SALifeTime tf1_autoSALifeTime tf1_Lifetime tf1_phase2encryptionAlgorithm tf1_encryptionDes tf1_encryptionNone tf1_encryption3Des tf1_encryptionAes128 tf1_encryptionAes192 tf1_encryptionAes256 tf1_encryptionAesCcm tf1_encryptionAesGcm tf1_encryptionTwofish128 tf1_encryptionTwofish192 tf1_encryptionTwofish256 tf1_phase2EncryptionBlowfish tf1_phase2EncryptionCast128 tf1_integrityMd5 tf1_integritySha1 tf1_integritySha224 tf1_integritySha256 tf1_integritySha384 tf1_integritySha512 tf1_pfsKeyGroup','tf1_IKEVersion_div tf1_remoteEndpoint_div');  	
           		vidualDisplay('tf1_SPIIncoming tf1_SPIOutgoing tf1_manualEncryptionAlgorithm tf1_encryptionkeyLength tf1_encryptionKeyIn tf1_encryptionKeyOut tf1_integrityAlgorithm tf1_integrityKeyIn tf1_integrityKeyOut tf1_manualPolicyParameters', 'hide');          
            	vidualDisplay('tf1_enableKeepalive tf1_phase1IKESaParameters tf1_exchangeMode tf1_direction tf1_natTraversal tf1_localIdentifierType tf1_remoteIdentifierType tf1_encryptionAlgorithm tf1_blowfish tf1_cast128 tf1_authAlgorithm tf1_authMethod tf1_presharedkey tf1_diffieHellman tf1_SALifeTime tf1_enableDeadPeerDetection tf1_extendedAuth tf1_SALifeTime tf1_autoSALifeTime tf1_Lifetime tf1_phase2encryptionAlgorithm tf1_encryptionDes tf1_encryptionNone tf1_encryption3Des tf1_encryptionAes128 tf1_encryptionAes192 tf1_encryptionAes256 tf1_encryptionAesCcm tf1_encryptionAesGcm tf1_encryptionTwofish128 tf1_encryptionTwofish192 tf1_encryptionTwofish256 tf1_phase2EncryptionBlowfish tf1_phase2EncryptionCast128 tf1_integrityMd5 tf1_integritySha1 tf1_integritySha224 tf1_integritySha256 tf1_integritySha384 tf1_integritySha512 tf1_pfsKeyGroup tf1_IKEVersion tf1_remoteEndpoint tf1_autoPolicyParameters', 'configRow');
        	vidualDisplay('break6 break3 break35 break37 break44 break47 break50', 'break');
           	document.getElementById('tf1_remoteEndPointLable').innerHTML=LANG_LOCALE['11389'];
           	enableRedundantVPNGatewayParameters();   
           	checkDhcp();
		enableTextFieldByAnchorClick('tf1_enableKeepalive','tf1_sourceIpAddr tf1_destinationIpAddr tf1_detectionPeriod tf1_reconnectAfterFailureCount','break25 break26 break27 break28');
                enableTextFieldByAnchorClick('tf1_pfsKeyGroup','tf1_pfsKeyGroupSelect');

            fieldStateChangeWr ('','','tf1_chkL2tpIpsec','');
        	vidualDisplay('tf1_chkL2tpIpsec', 'configRow');
        	vidualDisplay('break5', 'break');
            checkL2tpIpsec ();

        break;  
        case 2:	/* Manual Policy */             	
          	var imgObjVal = document.getElementById('tf1_enableDHCP').className; 
    		var imageName = imgObjVal.substring (imgObjVal.lastIndexOf ('/') + 1);
    		if (imageName == ON_ANCHOR)	{
    			alert(LANG_LOCALE['13514']);
    			var selObj = document.getElementById(selName);
    			selObj.selectedIndex = 0;
    			return;
			}          		
           	fieldStateChangeWr ('tf1_redundantVANGatewayParameters tf1_enableKeepalive tf1_sourceIpAddr tf1_destinationIpAddr tf1_detectionPeriod tf1_reconnectAfterFailureCount tf1_exchangeMode tf1_direction tf1_natTraversal tf1_natKeepAliveFrequency tf1_localIdentifierType tf1_localIdentifierType tf1_localIdentifier tf1_remoteIdentifierType tf1_remoteIdentifierType tf1_remoteIdentifier tf1_encryptionAlgorithm tf1_blowfish tf1_blowfishValue tf1_cast128 tf1_cast128Value tf1_authAlgorithm tf1_authMethod tf1_authMethod tf1_presharedkey tf1_diffieHellman tf1_diffieHellman tf1_SALifeTime tf1_enableDeadPeerDetection tf1_Phase1DetectionPeriod tf1_reconnectAfterFailure tf1_extendedAuth tf1_authType tf1_UserName tf1_Password tf1_SALifeTime tf1_phase2encryptionAlgorithm tf1_encryptionDes tf1_encryptionNone tf1_encryption3Des tf1_encryptionAes128 tf1_encryptionAes192 tf1_encryptionAes256 tf1_encryptionAesCcm tf1_encryptionAesGcm tf1_encryptionTwofish128 tf1_encryptionTwofish192 tf1_encryptionTwofish256 tf1_phase2EncryptionBlowfish tf1_phase2EncryptionBlowfishValue tf1_phase2EncryptionCast128 tf1_integrityMd5 tf1_integritySha1 tf1_integritySha224 tf1_integritySha256 tf1_integritySha384 tf1_integritySha512 tf1_pfsKeyGroup tf1_pfsKeyGroupSelect','tf1_Lifetime_div tf1_IKEVersion_div tf1_remoteEndpoint_div','tf1_SPIIncoming tf1_SPIOutgoing tf1_manualEncryptionAlgorithm tf1_encryptionkeyLength tf1_encryptionKeyIn tf1_encryptionKeyOut tf1_integrityAlgorithm tf1_integrityKeyIn tf1_integrityKeyOut','');
        	vidualDisplay('tf1_redundantVANGatewayParameters tf1_enableKeepalive tf1_sourceIpAddr tf1_destinationIpAddr tf1_detectionPeriod tf1_reconnectAfterFailureCount tf1_phase1IKESaParameters tf1_exchangeMode tf1_direction tf1_natTraversal tf1_natKeepAliveFrequency tf1_localIdentifierType tf1_localIdentifierType tf1_localIdentifier tf1_remoteIdentifierType tf1_remoteIdentifierType tf1_remoteIdentifier tf1_encryptionAlgorithm tf1_blowfish tf1_blowfishValue tf1_cast128 tf1_cast128Value tf1_authAlgorithm tf1_authMethod tf1_authMethod tf1_presharedkey tf1_diffieHellman tf1_diffieHellman tf1_SALifeTime tf1_enableDeadPeerDetection tf1_Phase1DetectionPeriod tf1_reconnectAfterFailure tf1_extendedAuth tf1_authType tf1_UserName tf1_Password tf1_SALifeTime tf1_phase2encryptionAlgorithm tf1_encryptionDes tf1_encryptionNone tf1_encryption3Des tf1_encryptionAes128 tf1_encryptionAes192 tf1_encryptionAes256 tf1_encryptionAesCcm tf1_encryptionAesGcm tf1_encryptionTwofish128 tf1_encryptionTwofish192 tf1_encryptionTwofish256 tf1_phase2EncryptionBlowfish tf1_phase2EncryptionBlowfishValue tf1_phase2EncryptionCast128 tf1_integrityMd5 tf1_integritySha1 tf1_integritySha224 tf1_integritySha256 tf1_integritySha384 tf1_integritySha512 tf1_pfsKeyGroup tf1_pfsKeyGroupSelect tf1_Lifetime tf1_IKEVersion tf1_remoteEndpoint tf1_autoPolicyParameters', 'hide'); 
            vidualDisplay('break3 break25 break26 break27 break28', 'hide');            
			vidualDisplay('tf1_SPIIncoming tf1_SPIOutgoing tf1_manualEncryptionAlgorithm tf1_encryptionkeyLength tf1_encryptionKeyIn tf1_encryptionKeyOut tf1_integrityAlgorithm tf1_integrityKeyIn tf1_integrityKeyOut tf1_manualPolicyParameters', 'configRow');		
			document.getElementById('tf1_remoteEndPointLable').innerHTML=LANG_LOCALE['30465'];
			document.getElementById('tf1_ipSecMode').innerHTML= LANG_LOCALE['13160'];
			changeManualEncryptionAlgorithm('tf1_manualEncryptionAlgorithm');

            fieldStateChangeWr ('tf1_chkL2tpIpsec','','','');
        	vidualDisplay('tf1_chkL2tpIpsec break5', 'hide');
		fieldStateChangeWr ('','','tf1_remoteEndpointValue tf1_localStartIpAddr tf1_localEndIpAddr tf1_localSubnetMask tf1_localPrefixLength tf1_remoteStartIpAddr tf1_remoteEndIpAddr tf1_remoteSubnetMask tf1_remotePrefixLength tf1_enableNetBIOS tf1_localIp tf1_remoteIp','');
                vidualDisplay('tf1_remoteEndpointValue tf1_enableNetBIOS tf1_localStartIpAddr tf1_localEndIpAddr tf1_localSubnetMask tf1_localPrefixLength tf1_remoteStartIpAddr tf1_remoteEndIpAddr tf1_remoteSubnetMask tf1_remotePrefixLength tf1_localIp tf1_remoteIp', 'configRow');
	          vidualDisplay('break8 break10 break13 break14 break15 break16 break17 break18 break20 break21 break22 break23 break24', 'break');
    		changeLocalIpSelect('tf1_localIp');
    		changeRemoteIpSelect('tf1_remoteIp');
		break;  
	}  
    nonEditChange();
}
    
function checkDhcp(){
    var imgObjVal = document.getElementById('tf1_enableDHCP').className;  
	var imageName = imgObjVal.substring (imgObjVal.lastIndexOf ('/') + 1);
	
	var selObj = document.getElementById ('tf1_policyType');
	if(imageName == ON_ANCHOR && selObj.value == "2"){
		alert(LANG_LOCALE['13514']);
	    selObj.selectedIndex = 0;
	    changeGeneralPolicyType('tf1_policyType');        
    }
	/*selObj = document.getElementById ('tf1_IPsecMode');
	if(imageName == ON_ANCHOR && selObj.value == "2"){
		alert("Can not use Transport Mode when DHCP is enabled. Please select Tunnel Mode.");
	    selObj.selectedIndex = 0;
	    //changeGeneralIPsecMode('tf1_IPsecMode');         
    }*/    
}

function checkL2tpIpsec ()
    {
        var l2tpModeObj = document.getElementById ('tf1_chkL2tpIpsec');
        var l2tpModeVal = l2tpModeObj.value;
        var selFqdn = document.getElementById ('tf1_remoteEndpoint');
        var selIdentifierObj = document.getElementById ('tf1_remoteIdentifierType');
        var selDirectionObj = document.getElementById ('tf1_direction');
        var txtRemoteEndObj = document.getElementById ('txtAddIkePeerID');
        var ipSecModeObj = document.getElementById ('tf1_ipSecMode');
        var selValue = document.getElementById ('tf1_policyType').value;
        var list = new Array ();
        var directionList = new Array ();
        
        selIdentifierObj.options.length = 0;
        selDirectionObj.options.length = 0;
        var x = 1;
        var y = 1;
        
        switch (parseInt(l2tpModeVal, 10))
        {
            case 0:
                list = [LANG_LOCALE['14332'], LANG_LOCALE['14125'], LANG_LOCALE['14331'], LANG_LOCALE['14330']]
                directionList = [LANG_LOCALE['14335'], LANG_LOCALE['14334'], LANG_LOCALE['13650']]

		    fieldStateChangeWr ('','','tf1_remoteEndpoint tf1_remoteEndpointValue tf1_localStartIpAddr tf1_localEndIpAddr tf1_localSubnetMask tf1_localPrefixLength tf1_remoteStartIpAddr tf1_remoteEndIpAddr tf1_remoteSubnetMask tf1_remotePrefixLength tf1_enableNetBIOS tf1_enableDHCP tf1_localIp tf1_remoteIp','');
                vidualDisplay('tf1_remoteEndpoint tf1_remoteEndpointValue tf1_enableNetBIOS tf1_enableDHCP tf1_localStartIpAddr tf1_localEndIpAddr tf1_localSubnetMask tf1_localPrefixLength tf1_remoteStartIpAddr tf1_remoteEndIpAddr tf1_remoteSubnetMask tf1_remotePrefixLength tf1_localIp tf1_remoteIp', 'configRow');
	          vidualDisplay('break7 break8 break10 break13 break14 break15 break16 break17 break18 break20 break21 break22 break23 break24', 'break');
                if (selValue == "2")
                    {
                        fieldStateChangeWr ('tf1_remoteEndpoint', '', '', '');
                        vidualDisplay('tf1_remoteEndpoint break7', 'hide');
                    }
                else
                    {
                        fieldStateChangeWr ('', '', 'tf1_remoteEndpoint', '');
                        vidualDisplay('tf1_remoteEndpoint', 'configRow');
                        vidualDisplay('break7', 'break');
                    }
                changeLocalIpSelect('tf1_localIp');
		    changeRemoteIpSelect('tf1_remoteIp');
                ipSecModeObj.innerHTML = LANG_LOCALE['13160'];
                break;
            case 1:
                list = [LANG_LOCALE['14125'], LANG_LOCALE['14331'], LANG_LOCALE['14330']]
                directionList = [LANG_LOCALE['14334']]
				changeGeneralIPsecMode ("1");
                selFqdn.selectedIndex = 1;
                
                document.getElementById ('tf1_remoteEndpointValue').value = '0.0.0.0';
                x = 2;
                y = 2;
		    fieldStateChangeWr ('tf1_remoteEndpoint tf1_remoteEndpointValue tf1_localStartIpAddr tf1_localEndIpAddr tf1_localSubnetMask tf1_localPrefixLength tf1_remoteStartIpAddr tf1_remoteEndIpAddr tf1_remoteSubnetMask tf1_remotePrefixLength tf1_enableNetBIOS tf1_enableDHCP tf1_localIp tf1_remoteIp','','','');
                vidualDisplay('tf1_remoteEndpoint tf1_remoteEndpointValue tf1_enableNetBIOS tf1_enableDHCP tf1_localStartIpAddr tf1_localEndIpAddr tf1_localSubnetMask tf1_localPrefixLength tf1_remoteStartIpAddr tf1_remoteEndIpAddr tf1_remoteSubnetMask tf1_remotePrefixLength tf1_localIp tf1_remoteIp', 'hide');
	          vidualDisplay('break7 break8 break10 break13 break14 break15 break16 break17 break18 break20 break21 break22 break23 break24', 'hide');
                ipSecModeObj.innerHTML = LANG_LOCALE['14344'];
                break;
            case 2:
                list = [LANG_LOCALE['14332'], LANG_LOCALE['14125'], LANG_LOCALE['14331'], LANG_LOCALE['14330']]
                directionList = [LANG_LOCALE['14335'], LANG_LOCALE['14334'], LANG_LOCALE['13650']]

				changeGeneralIPsecMode ("1");
		    fieldStateChangeWr ('tf1_localStartIpAddr tf1_localEndIpAddr tf1_localSubnetMask tf1_localPrefixLength tf1_remoteStartIpAddr tf1_remoteEndIpAddr tf1_remoteSubnetMask tf1_remotePrefixLength tf1_enableNetBIOS tf1_enableDHCP tf1_localIp tf1_remoteIp','','tf1_remoteEndpoint tf1_remoteEndpointValue','');
                vidualDisplay('tf1_enableNetBIOS tf1_enableDHCP tf1_localStartIpAddr tf1_localEndIpAddr tf1_localSubnetMask tf1_localPrefixLength tf1_remoteStartIpAddr tf1_remoteEndIpAddr tf1_remoteSubnetMask tf1_remotePrefixLength tf1_localIp tf1_remoteIp', 'hide');
	          vidualDisplay('break10 break13 break14 break15 break16 break17 break18 break20 break21 break22 break23 break24', 'hide');
                vidualDisplay('tf1_remoteEndpoint tf1_remoteEndpointValue', 'configRow');
	          vidualDisplay('break7 break8', 'break');
                ipSecModeObj.innerHTML = LANG_LOCALE['14344'];
                break;
        }
        for (var i = 0; i < list.length; i++, x++)
            {
                selIdentifierObj.options[i] = new Option(list[i], x, false, false);
            }
        for (var j = 0; j < directionList.length; j++, y++)
            {
                selDirectionObj.options[j] = new Option(directionList[j], y, false, false);
            }
        optionValueSelect ('tf1_remoteIdentifierType', 'hdremoteIdentifier');
        optionValueSelect ('tf1_direction', 'hdselDirection');
	changeLocalAndRemoteIdentifierType('tf1_remoteIdentifierType', 'tf1_remoteIdentifier', 'break36');
    }

/****
 * This function calls when user selects an option from IPsec Mode
 * OnChange event
 * @method changeGeneralIPsecMode
 * @param selName - Select box Name
 */
function changeGeneralIPsecMode(selValue){
	if (!selValue) return;	
    switch (parseInt(selValue, 10)){
	    case 1:	/* Tunnel Mode */
			fieldStateChangeWr ('tf1_localStartIpAddr tf1_localEndIpAddr tf1_localSubnetMask tf1_localPrefixLength tf1_remoteStartIpAddr tf1_remoteEndIpAddr tf1_remoteSubnetMask tf1_remotePrefixLength','','tf1_enableNetBIOS tf1_enableDHCP tf1_localIp tf1_remoteIp','');        	
			vidualDisplay('tf1_localStartIpAddr tf1_localEndIpAddr tf1_localSubnetMask tf1_localPrefixLength tf1_remoteStartIpAddr tf1_remoteEndIpAddr tf1_remoteSubnetMask tf1_remotePrefixLength', 'hide');                     
	        vidualDisplay('tf1_enableNetBIOS tf1_enableDHCP tf1_localIp tf1_remoteIp', 'configRow');
	        vidualDisplay('break9 break11 break12 break13 break18', 'break');
            changeLocalIpSelect('tf1_localIp');
			changeRemoteIpSelect('tf1_remoteIp');
        break;             
		case 2:	/* Transport Mode*/
			var imgObjVal = document.getElementById('tf1_enableDHCP').className; 
    		var imageName = imgObjVal.substring (imgObjVal.lastIndexOf ('/') + 1);
    		if (imageName == ON_ANCHOR)	{
    			alert(LANG_LOCALE['13515']);
    			var selObj = document.getElementById(selName);
    			selObj.selectedIndex = 0;
    			return;
			}        
        	fieldStateChangeWr ('tf1_enableNetBIOS tf1_enableDHCP tf1_localIp tf1_localStartIpAddr tf1_localEndIpAddr tf1_localSubnetMask tf1_localPrefixLength tf1_remoteIp tf1_remoteStartIpAddr tf1_remoteEndIpAddr tf1_remoteSubnetMask tf1_remotePrefixLength','','','');
       	    vidualDisplay('tf1_enableNetBIOS tf1_enableDHCP tf1_localIp tf1_localStartIpAddr tf1_localEndIpAddr tf1_localSubnetMask tf1_localPrefixLength tf1_remoteIp tf1_remoteStartIpAddr tf1_remoteEndIpAddr tf1_remoteSubnetMask tf1_remotePrefixLength', 'hide');   
            vidualDisplay('break13 break14 break15 break16 break17 break18 break19 break20 break21 break22 break23', 'hide'); 
            vidualDisplay('break11', 'break');   
		break;     
	}     
}

/****
 * This function calls when user selects an option from select box
 * OnChange event
 * @method changeLocalAndRemoteIdentifierType
 * @param selName - Select box Name
 */
function changeLocalAndRemoteIdentifierType(selName,fldName,brk){
	var selValue = comboSelectedValueGet (selName);
	if (!selValue) return;	
	switch (parseInt(selValue, 10)){
		case 1: /* Local/Remote Wan IP */		
			fieldStateChangeWr (fldName,'','','');
			vidualDisplay (fldName, 'hide');
			vidualDisplay (brk, 'hide')
			break;				
		case 2: /* FQDN */
		case 3: /* User-FQDN */
		case 4: /* SDER ASN1 DN */
			fieldStateChangeWr ('','',fldName,'');
			vidualDisplay (fldName, 'configRow')
			vidualDisplay (brk, 'break')
			break;		
	}
}
/****
 * This function calls when user selects an option from select box
 * OnChange event
 * @method changeAuthenticationMethod 
 * @param selName - Selebox Name
 */
function changeAuthenticationMethod (selName){
	var selValue = comboSelectedValueGet (selName);
	if (!selValue) return;	
	switch (parseInt(selValue, 10)){
		case 1: /* Pre-shared key */		
			fieldStateChangeWr ('','','tf1_presharedkey','');
			vidualDisplay ('tf1_presharedkey', 'configRow')
			vidualDisplay ('break44', 'break');
			break;				
		case 2: /* RSA-Signature */		
			
			fieldStateChangeWr ('tf1_presharedkey','','','');
			vidualDisplay ('tf1_presharedkey', 'hide');
			vidualDisplay ('break44', 'hide')
			break;		
	}
}
/****
 * This function calls when user selects an option from select box
 * OnChange event
 * @method changeExtendedAuthentication
 * @param selName - Select box Name
 */
function changeExtendedAuthentication(selName){
	var selValue = comboSelectedValueGet (selName);
	if (!selValue) return;	
	switch (parseInt(selValue, 10)){
		case 1: /* None */		
			fieldStateChangeWr ('tf1_authType tf1_UserName tf1_Password','','','');
			vidualDisplay ('tf1_authType tf1_UserName tf1_Password', 'hide');
			vidualDisplay ('break51 break52 break53', 'hide')
			enableRedundantVPNGatewayParameters();
			break;				
		case 2: /* IPsec Host */
			fieldStateChangeWr ('tf1_authType','','tf1_UserName tf1_Password','');
			vidualDisplay ('tf1_authType', 'hide')
			vidualDisplay ('break51', 'hide')
			vidualDisplay ('tf1_UserName tf1_Password', 'configRow')
			vidualDisplay (' break52 break53', 'break')
			enableRedundantVPNGatewayParameters();
			break;		
		case 3: /* Edge Device */		
			fieldStateChangeWr ('tf1_UserName tf1_Password','','tf1_authType','');
			vidualDisplay ('tf1_UserName tf1_Password', 'hide')
			vidualDisplay (' break52 break53', 'hide')
			vidualDisplay ('tf1_authType', 'configRow')
			vidualDisplay (' break51', 'break')
			enableRedundantVPNGatewayParameters();
			break;		
	}
}

/****
 * This function calls when user selects an option from select box
 * OnChange event
 * @method changeManualEncryptionAlgorithm
 * @param selName - Select box Name
 */
function changeManualEncryptionAlgorithm(selName){
	var selValue = comboSelectedValueGet (selName);
	if (!selValue) return;	
	switch (parseInt(selValue, 10)){
		case 1: case 3: case 4: case 5: case 6:	case 7: case 8: case 9:	case 10: case 11: 		
			fieldStateChangeWr ('tf1_encryptionkeyLength','','tf1_encryptionKeyIn tf1_encryptionKeyOut','');
			vidualDisplay ('tf1_encryptionkeyLength', 'hide')
			vidualDisplay ('break57', 'hide')
			vidualDisplay ('tf1_encryptionKeyIn tf1_encryptionKeyOut', 'configRow')
			vidualDisplay ('break58 break59', 'break')
			break;				
		case 2: /* None  */
			fieldStateChangeWr ('tf1_encryptionkeyLength tf1_encryptionKeyIn tf1_encryptionKeyOut','','','');
			vidualDisplay ('tf1_encryptionkeyLength tf1_encryptionKeyIn tf1_encryptionKeyOut', 'hide')
			vidualDisplay ('break57 break58 break59', 'hide')
			break;		
		case 12: case 13:		
			fieldStateChangeWr ('','','tf1_encryptionkeyLength','');
			vidualDisplay ('tf1_encryptionkeyLength', 'configRow');
			vidualDisplay ('break57', 'break')
			break;		
	}
}

/****
 * This function calls when user selects an option from IP Protocol Version
 * OnChange event
 * @method changeProtocolType
 */
function changeProtocolType(){
	changeLocalIpSelect('tf1_localIp');
	changeRemoteIpSelect('tf1_remoteIp');
}
/****
 * This function calls when user selects an option from select box
 * OnChange event
 * @method changeLocalIpSelect
 * @param selName - Select box Name
 */
function changeLocalIpSelect(selName){
	var selValue = comboSelectedValueGet (selName);	
    if (!selValue) return;	
 	var protocolValue = comboSelectedValueGet ('tf1_ipProtocolVersion');
    switch (parseInt (selValue, 10)){
		case 1:
	        fieldStateChangeWr ('tf1_localStartIpAddr tf1_localEndIpAddr tf1_localSubnetMask tf1_localPrefixLength', '', '', '');
            vidualDisplay ('tf1_localStartIpAddr tf1_localEndIpAddr tf1_localSubnetMask tf1_localPrefixLength', 'hide');
            vidualDisplay ('break14 break15 break16 break17', 'hide');
            break;
		case 2:
            fieldStateChangeWr ('tf1_localEndIpAddr tf1_localSubnetMask tf1_localPrefixLength', '', 'tf1_localStartIpAddr', '');
            vidualDisplay ('tf1_localEndIpAddr tf1_localSubnetMask tf1_localPrefixLength', 'hide');
            vidualDisplay ('break15 break16 break17', 'hide');
            vidualDisplay ('tf1_localStartIpAddr', 'configRow');
            vidualDisplay ('break14', 'break');
            break;
        case 3:
			fieldStateChangeWr ('tf1_localSubnetMask tf1_localPrefixLength', '', 'tf1_localStartIpAddr tf1_localEndIpAddr', '');
            vidualDisplay ('tf1_localSubnetMask tf1_localPrefixLength', 'hide');
            vidualDisplay ('break16 break17', 'hide');
            vidualDisplay ('tf1_localStartIpAddr tf1_localEndIpAddr', 'configRow');
            vidualDisplay ('break14 break15', 'break');
            break;
        case 4:        	
            if(protocolValue == 1){
	            fieldStateChangeWr ('tf1_localEndIpAddr tf1_localPrefixLength', '', 'tf1_localStartIpAddr tf1_localSubnetMask', '');    
                vidualDisplay ('tf1_localEndIpAddr tf1_localPrefixLength', 'hide');
                vidualDisplay ('break15 break17', 'hide');
				vidualDisplay ('tf1_localStartIpAddr tf1_localSubnetMask', 'configRow');      
				vidualDisplay ('break14 break16', 'break');         
            }else{
                fieldStateChangeWr ('tf1_localEndIpAddr tf1_localSubnetMask', '', 'tf1_localStartIpAddr tf1_localPrefixLength', '');
                vidualDisplay ('tf1_localEndIpAddr tf1_localSubnetMask', 'hide');
                vidualDisplay ('break15 break16', 'hide');
				vidualDisplay ('tf1_localStartIpAddr tf1_localPrefixLength', 'configRow');  
				vidualDisplay ('break14 break17', 'break');
			}
            break;           
	}
}
/****
 * This function calls when user selects an option from select box
 * OnChange event
 * @method changeRemoteIpSelect
 * @param selName - Select box Name
 */
function changeRemoteIpSelect(selName)   {
	var selValue = comboSelectedValueGet (selName);
    if (!selValue) return;	
 	var protocolValue = comboSelectedValueGet ('tf1_ipProtocolVersion');
    switch (parseInt (selValue, 10)){
	    case 1:
        	fieldStateChangeWr ('tf1_remoteStartIpAddr tf1_remoteEndIpAddr tf1_remoteSubnetMask tf1_remotePrefixLength', '', '', '');
        	vidualDisplay ('tf1_remoteStartIpAddr tf1_remoteEndIpAddr tf1_remoteSubnetMask tf1_remotePrefixLength', 'hide');
            vidualDisplay ('break20 break21 break22 break23', 'hide');
       		break;
        case 2:
        	fieldStateChangeWr ('tf1_remoteEndIpAddr tf1_remoteSubnetMask tf1_remotePrefixLength', '', 'tf1_remoteStartIpAddr', '');
        	vidualDisplay ('tf1_remoteEndIpAddr tf1_remoteSubnetMask tf1_remotePrefixLength', 'hide');
            vidualDisplay ('break21 break22 break23', 'hide');
            vidualDisplay ('tf1_remoteStartIpAddr', 'configRow');
            vidualDisplay ('break20', 'break');
       		break;
        case 3:
        	fieldStateChangeWr ('tf1_remoteSubnetMask tf1_remotePrefixLength', '', 'tf1_remoteStartIpAddr tf1_remoteEndIpAddr', '');
			vidualDisplay ('tf1_remoteSubnetMask tf1_remotePrefixLength', 'hide');
            vidualDisplay ('break22 break23', 'hide');
            vidualDisplay ('tf1_remoteStartIpAddr tf1_remoteEndIpAddr', 'configRow');
            vidualDisplay ('break20 break21', 'break');
        	break;
        case 4:
        	if(protocolValue == 1){
        	    fieldStateChangeWr ('tf1_remoteEndIpAddr tf1_remotePrefixLength', '', 'tf1_remoteStartIpAddr tf1_remoteSubnetMask', '');
        	    vidualDisplay ('tf1_remoteEndIpAddr tf1_remotePrefixLength', 'hide');
                vidualDisplay ('break21 break23', 'hide');
				vidualDisplay ('tf1_remoteStartIpAddr tf1_remoteSubnetMask', 'configRow');      
				vidualDisplay ('break20 break22', 'break');
        	}else{
                fieldStateChangeWr ('tf1_remoteEndIpAddr tf1_remoteSubnetMask', '', 'tf1_remoteStartIpAddr tf1_remotePrefixLength', '');
                vidualDisplay ('tf1_remoteEndIpAddr tf1_remoteSubnetMask', 'hide');
                vidualDisplay ('break21 break22', 'hide');
				vidualDisplay ('tf1_remoteStartIpAddr tf1_remotePrefixLength', 'configRow');  
				vidualDisplay ('break20 break23', 'break');
            }
            break;
        }
}
/****
 * This function calls when user selects an option from Remote End Point
 * OnChange event
 * @method remoteEndPointCheck 
 */
function remoteEndPointCheck (){		
    var selValue = comboSelectedValueGet  ('tf1_remoteEndpoint');        
    if (parseInt (selValue, 10) == 1){
		var protocolValue = comboSelectedValueGet ('tf1_ipProtocolVersion');
        if(protocolValue == 1){
            if (ipv4Validate ('tf1_remoteEndpointValue', 'SN', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
            	return false;
        }else{
            if (ipv6Validate ('tf1_remoteEndpointValue', false, true, '') == false)
		        return false;
        }       
	}else{
       	var remoteEndpointFQDNTxtObj = document.getElementById ('tf1_remoteEndpointValue');
       	if (remoteEndpointFQDNTxtObj && !remoteEndpointFQDNTxtObj.disabled && remoteEndpointFQDNTxtObj.value == ""){
           	alert(LANG_LOCALE['11262']);
           	remoteEndpointFQDNTxtObj.focus ();
           	return false;
		}
		if (validateFQDN ('tf1_remoteEndpointValue') == false)
	        return false;
	}
	return true;
}
/**
* function for validate form when user clicks on submit button
* OnSubmit event
* @method policiesFormValidate
*/ 
function policiesFormValidate(frmId){
    var txtFieldIdArr = new Array ();     
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_policy,"+LANG_LOCALE['12335'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_localStartIpAddr,"+LANG_LOCALE['12308'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_localEndIpAddr,"+LANG_LOCALE['12304'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_localSubnetMask,"+LANG_LOCALE['12309'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_localPrefixLength,"+LANG_LOCALE['12307'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_remoteStartIpAddr,"+LANG_LOCALE['12359'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_remoteEndIpAddr,"+LANG_LOCALE['12354'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_remoteSubnetMask,"+LANG_LOCALE['12360'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_remotePrefixLength,"+LANG_LOCALE['12358'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_sourceIpAddr,"+LANG_LOCALE['30201'];
	txtFieldIdArr[txtFieldIdArr.length] = "tf1_destinationIpAddr,"+LANG_LOCALE['12251'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_detectionPeriod,"+LANG_LOCALE['12255'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_reconnectAfterFailureCount,"+LANG_LOCALE['12352'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_natKeepAliveFrequency,"+LANG_LOCALE['12327'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_localIdentifier,"+LANG_LOCALE['12305'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_localIdentifier,"+LANG_LOCALE['12305'];
	txtFieldIdArr[txtFieldIdArr.length] = "tf1_blowfishValue,"+LANG_LOCALE['12231'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_cast128Value,"+LANG_LOCALE['12233'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_SALifeTime,"+LANG_LOCALE['12370'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_Phase1DetectionPeriod,"+LANG_LOCALE['12255'];
	txtFieldIdArr[txtFieldIdArr.length] = "tf1_reconnectAfterFailure,"+LANG_LOCALE['12352'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_UserName,"+LANG_LOCALE['12410'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_Password,"+LANG_LOCALE['12333'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_SPIIncoming,"+LANG_LOCALE['12385'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_SPIOutgoing,"+LANG_LOCALE['12385'];
	txtFieldIdArr[txtFieldIdArr.length] = "tf1_encryptionkeyLength,"+LANG_LOCALE['12263'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_encryptionKeyIn,"+LANG_LOCALE['12264'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_encryptionKeyOut,"+LANG_LOCALE['12265'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_integrityKeyIn,"+LANG_LOCALE['12286'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_integrityKeyOut,"+LANG_LOCALE['12287'];
	txtFieldIdArr[txtFieldIdArr.length] = "tf1_autoSALifeTime,"+LANG_LOCALE['12370'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_phase2EncryptionBlowfishValue,"+LANG_LOCALE['12261'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_phase2EncryptionCast128Value,"+LANG_LOCALE['12262'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_FailbackTime,"+LANG_LOCALE['12272'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_remoteEndpointValue,"+LANG_LOCALE['12292'];

    if (txtFieldArrayCheck(txtFieldIdArr) == false)
	    return false;

    if (alphaNumericValueCheck ("tf1_policy", '', '') == false)    
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
    
    var txtFieldIdArr1 = new Array();
    txtFieldIdArr1[txtFieldIdArr1.length] = "tf1_presharedkey,"+LANG_LOCALE['12340'];

    if (txtFieldArrayCheck(txtFieldIdArr1) == false)
	    return false;

    if (alphaNumericValueCheck ("tf1_presharedkey", '`~!@#$%^&*()-_+=|{}[]:;.,<>?/\'', '') == false)    
        return false;
	
	var spiInObj = document.getElementById ('tf1_SPIIncoming');
    if (!spiInObj.disabled && spiInObj.value == "0x"){
         alert (LANG_LOCALE['12025']);
         spiInObj.focus();
         return false;
    }        
    var spiOutObj = document.getElementById ('tf1_SPIOutgoing');
    if (!spiOutObj.disabled && spiOutObj.value == "0x"){
        alert(LANG_LOCALE['12073']);  
        spiOutObj.focus();     
        return false;
    }
	
	if (numericValueCheck1 ('tf1_SPIIncoming', 'xXABCDEFabcdef') == false)
        return false;

	if (numericValueCheck1 ('tf1_SPIOutgoing', 'xXABCDEFabcdef') == false)
        return false;

	if (SPInOutRangeCheck ('tf1_SPIIncoming', 'SPI-Incoming') == false)
        return false;  

	if (SPInOutRangeCheck ('tf1_SPIOutgoing', 'SPI-Outgoing') == false)
        return false;  

    var modeObj = document.getElementById("tf1_exchangeMode1");
    if (modeObj && !modeObj.disabled && modeObj.value == "1") {
        var local = document.getElementById("tf1_localIdentifierType").value;
        var remote = document.getElementById("tf1_remoteIdentifierType").value;
        if (local == "3" || remote == "3") {
            alert(LANG_LOCALE['50053']);
            return false;
        }
    }

	if (remoteEndPointCheck () == false)
        return false;  
	
	if (localSubnetIpCheck() == false)
        return false;
   /*
	if (ipv4Validate ('tf1_localStartIpAddr', 'IP', false, true, "Invalid IP address.", "for octet ", true) == false)
    	return false;  
    	 
    if (ipv4Validate ('tf1_localEndIpAddr', 'IP', false, true, "Invalid IP address.", "for octet ", true) == false)
    	return false;  
*/
    if (ipAddress4or6CheckLocalRemote('tf1_localStartIpAddr') == false) 
        return false; 
    /*  49853 SPR starts */
    var protocolValue = comboSelectedValueGet ('tf1_ipProtocolVersion');
    if(protocolValue == 1)
        {
        if(checkAndSetNetworkIp ('tf1_localStartIpAddr', 'tf1_localSubnetMask') == false)
            {
            return false;
            }
        }
    /*  49853 SPR ends */
    	if (ipAddress4or6Check('tf1_localEndIpAddr') == false) 
        return false;

    if (validNetMask ('tf1_localSubnetMask') == false)
    	return false;    
    	
	if (numericValueRangeCheck(document.getElementById('tf1_localPrefixLength'), '', '', 0, 128,true, LANG_LOCALE['11294'], '') == false)
	    return false;    	
	/*
    if (ipv4Validate ('tf1_remoteStartIpAddr', 'IP', false, true, "Invalid IP address.", "for octet ", true) == false)
    	return false;   	
	if (ipv4Validate ('tf1_remoteEndIpAddr', 'IP', false, true, "Invalid IP address.", "for octet ", true) == false)
    	return false;  
    	*/
	if (ipAddress4or6CheckLocalRemote('tf1_remoteStartIpAddr') == false) 
        return false; 
    /*  49853 SPR starts */
    
    if (remoteSubnetIpCheck() == false)
        return false;

      var remoteIpObj = document.getElementById('tf1_remoteIp');
    if(remoteIpObj.value == "4")
    {
        if(protocolValue == 1)
            {
                if(setNetworkIpAddress ('tf1_remoteStartIpAddr', 'tf1_remoteSubnetMask') == false)
                    {
                        return false;
                    }
            }
    }
    /*  49853 SPR ends */
    	if (ipAddress4or6Check('tf1_remoteEndIpAddr') == false) 
        return false;
    if (validNetMask ('tf1_remoteSubnetMask') == false)
    	return false;
    	
	if (numericValueRangeCheck(document.getElementById('tf1_remotePrefixLength'), '', '', 0, 128,true, LANG_LOCALE['11335'], '') == false)
	    return false;
    	/*
	if (ipv4Validate ('tf1_sourceIpAddr', 'IP', false, true, "Invalid IP address.", "for octet ", true) == false)
    	return false;  
	if (ipv4Validate ('tf1_destinationIpAddr', 'IP', false, true, "Invalid IP address.", "for octet ", true) == false)
    	return false;  
    	*/
	if (ipAddress4or6Check('tf1_sourceIpAddr') == false) 
        return false;
    	if (ipAddress4or6Check('tf1_destinationIpAddr') == false) 
        return false;
    if (numericValueRangeCheck(document.getElementById('tf1_detectionPeriod'), '', '', 10, 999,true, LANG_LOCALE['11246'], '') == false)
	    return false;
	    
	if (numericValueRangeCheck(document.getElementById('tf1_reconnectAfterFailureCount'), '', '', 3, 99,true, LANG_LOCALE['11332'], '') == false)
	    return false;

    if (numericValueRangeCheck(document.getElementById('tf1_natKeepAliveFrequency'), '', '', 5, 3600,true, LANG_LOCALE['50164']+': ', '') == false)
	    return false;

	/* Checnk Encryption Algorithm Key-In and Key-Out validations */
	if (encrKeyLenValidate () == false)
        	return false;

	var pBlowFish=document.getElementById('tf1_blowfishValue');
	if(pBlowFish && !pBlowFish.disbaled){
		if (numericValueRangeCheck(document.getElementById('tf1_blowfishValue'), '', '', 40, 448,true, LANG_LOCALE['11227'], '') == false)
		    return false;
	}
	
	var pCast128=document.getElementById('tf1_cast128Value');
	if(pCast128&& !pCast128.disbaled){
		if (numericValueRangeCheck(document.getElementById('tf1_cast128Value'), '', '', 40, 128,true, LANG_LOCALE['11228'], '') == false)
		    return false;
	}

    if (noneEncryptionAlg() == false)
        return false;

	var preshareObj=document.getElementById('tf1_presharedkey');
	if(preshareObj&& !preshareObj.disbaled){
		if(fieldLengthCheck('tf1_presharedkey', 8, 49, LANG_LOCALE['11323']) == false)
			return false
	}
		
	if(numericValueRangeCheck (document.getElementById('tf1_autoSALifeTime'), '', '', 300, 604800, true, LANG_LOCALE['11345'], LANG_LOCALE['12732']) == false)
		return false
	
	if(numericValueRangeCheck (document.getElementById('tf1_SALifeTime'), '', '', 300, 604800, true, LANG_LOCALE['11345'], LANG_LOCALE['12732']) == false)
		return false

	var pBlowFish=document.getElementById('tf1_phase2EncryptionBlowfishValue');
	if(pBlowFish && !pBlowFish.disbaled){
		if (numericValueRangeCheck(document.getElementById('tf1_phase2EncryptionBlowfishValue'), '', '', 40, 448,true, LANG_LOCALE['11227'], '') == false)
		    return false;
	}
	
	var pCast128=document.getElementById('tf1_phase2EncryptionCast128Value');
	if(pCast128&& !pCast128.disbaled){
		if (numericValueRangeCheck(document.getElementById('tf1_phase2EncryptionCast128Value'), '', '', 40, 128,true, LANG_LOCALE['11228'], '') == false)
		    return false;
	}
	
	if (numericValueRangeCheck(document.getElementById('tf1_Phase1DetectionPeriod'), '', '', 10, 999,true, LANG_LOCALE['11246'], '') == false)
	    return false;
	    
	if (numericValueRangeCheck(document.getElementById('tf1_reconnectAfterFailure'), '', '', 3, 99,true, LANG_LOCALE['11332'], '') == false)
	    return false; 
	
	if (numericValueRangeCheck(document.getElementById('tf1_FailbackTime'), '', '', 30, 3600,true, LANG_LOCALE['11260'], '') == false)
	    return false;
	    
    setHiddenChks(frmId);
	return true;
}

function noneEncryptionAlg () {

    var imgObj = document.getElementById('tf1_encryptionNone');
    if (imgObj && !imgObj.disabled) {
        var imgObjVal = imgObj.className;
        var imgName = imgObjVal.substring (imgObjVal.lastIndexOf ('/') + 1);
        if (imgName == ON_ANCHOR) {
            if ( $("#tf1_encryptionDes2").hasClass('enable-disable-on') || $("#tf1_encryption3Des").hasClass('enable-disable-on') || $("#tf1_encryptionAes128").hasClass('enable-disable-on') || $("#tf1_encryptionAes192").hasClass('enable-disable-on') || $("#tf1_encryptionAes256").hasClass('enable-disable-on') || $("#tf1_encryptionTwofish128").hasClass('enable-disable-on') || $("#tf1_encryptionTwofish192").hasClass('enable-disable-on') || $("#tf1_encryptionTwofish256").hasClass('enable-disable-on') || $("#tf1_phase2EncryptionBlowfish").hasClass('enable-disable-on') || $('#tf1_phase2EncryptionCast128').hasClass('enable-disable-on')) {
                alert(LANG_LOCALE['50050']);
                return false;
            }
        }
    }
    return true;
}

function enableRedundantVPNGatewayParameters (){
	var selpolicyType = parseInt (comboSelectedValueGet('tf1_policyType'),10);
    var selDirection = parseInt (comboSelectedValueGet ('tf1_direction'),10);
    var selXAuthType = parseInt (comboSelectedValueGet('tf1_extendedAuth'),10);
    var imgObjVal = document.getElementById('tf1_enableDeadPeerDetection').className;    
    var imageName = imgObjVal.substring (imgObjVal.lastIndexOf ('/') + 1);
	if(selpolicyType == 1 && selDirection != 2 && selXAuthType != 2 && (imageName == ON_ANCHOR || imageName == "enable-disable-on-noclick")){
    	fieldStateChangeWr ('', '', 'tf1_enableRedundantGateway', 'tf1_Phase1DetectionPeriod tf1_reconnectAfterFailure'); 
    	vidualDisplay ('tf1_Phase1DetectionPeriod tf1_reconnectAfterFailure tf1_redundantVANGatewayParameters tf1_enableRedundantGateway', 'configRow');
        enableTextFieldByAnchorClick('tf1_enableRedundantGateway','tf1_selectBackPolicy tf1_FailbackTime');
    }else{
    	fieldStateChangeWr ('tf1_enableRedundantGateway tf1_selectBackPolicy tf1_FailbackTime', '', '', '');
		vidualDisplay ('tf1_enableRedundantGateway tf1_selectBackPolicy tf1_FailbackTime tf1_redundantVANGatewayParameters', 'hide'); 			
    }       
}

/****
 * This function calls when user selects an option from Remote End Point
 * OnChange event
 * @method ipAddress4or6Check
 */
function ipAddress4or6Check (tfFieldId){
	
	var Obj = document.getElementById(tfFieldId);
	if (!Obj) 
        return;
	var protocolValue = comboSelectedValueGet ('tf1_ipProtocolVersion');
	if(protocolValue == 1){
            if (ipv4Validate (tfFieldId, 'SN', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
            	return false;
        }else{
            if (ipv6Validate (tfFieldId, false, true, '') == false)
		        return false;
        }
	return true;
}

function optionValueSelect1(selObjId, fldVal){
    if (!selObjId) 
        return;
    var selObj = document.getElementById(selObjId);
    if (!selObj) 
        return;
    var valueToSelect = fldVal;
    var idx = 0;
    for (idx = 0; idx < selObj.options.length; ++idx) {
        if (selObj.options[idx].value == valueToSelect) 
            break;
    }
    if (idx != selObj.options.length) 
        selObj.selectedIndex = idx;
    return;
}

function SPInOut (fieldId)
    {
	var fieldObj = document.getElementById(fieldId);
	if (!fieldObj || fieldObj.disabled) 
            return true;
        var value = fieldObj.value;
        if (value.charAt(0) != '0' && value.charAt(1) != 'x')
            {
        	value = "0x" + value;
    	    }
    	fieldObj.value = value;
    }

function SPInOutRangeCheck (fieldId, lblName)
    {
	var fieldObj = document.getElementById(fieldId);
	if (!fieldObj || fieldObj.disabled)
	    return true;
        var value = fieldObj.value;
        if (value.charAt(2) == '' || value.charAt(3) == '' || value.charAt(4) == '')
            {
        	alert(lblName + " " + LANG_LOCALE['12855']);
		fieldObj.focus();
		return false;
    	    }
    	return true;
    }

function encrKeyLenValidate ()
    {
    var selEncrValue = document.getElementById('tf1_manualEncryptionAlgorithm').value;
    if (selEncrValue == null)
         return true;
    var minKeyLen = 0;
    var errStr = "";
    switch (parseInt (selEncrValue, 10))
        {
        case 1:    /* DES */
            minKeyLen = 8;
            errStr = LANG_LOCALE['14288'];
            break;
        case 3:    /* 3DES */
            minKeyLen = 24;
            errStr = LANG_LOCALE['14285'];
            break;
        case 4:    /* AES-128 */
            minKeyLen = 16;
            errStr = LANG_LOCALE['14284'];
            break;
        case 5:    /* AES-192 */
            minKeyLen = 24;
            errStr = LANG_LOCALE['14283'];
            break;
        case 6:    /* AES-256 */
            minKeyLen = 32;
            errStr = LANG_LOCALE['14282'];
            break;
        case 7:    /* AES-CCM */
            minKeyLen = 16;
            errStr = LANG_LOCALE['14281'];
            break;
        case 8:    /* AES-GCM */
            minKeyLen = 20;
            errStr = LANG_LOCALE['14280'];
            break;
        case 9:    /* TWOFISH (128)*/
            minKeyLen = 16;
            errStr = LANG_LOCALE['14279'];
            break;
        case 10:    /* TWOFISH (192) */
            minKeyLen = 24;
            errStr = LANG_LOCALE['14278'];
            break;
        case 11:    /*TWOFISH (256)*/
            minKeyLen = 32;
            errStr = LANG_LOCALE['14277'];
            break;
        case 12:    /* BLOWFISH */            
            var keyLenObj= document.getElementById('tf1_encryptionkeyLength');
            var keyLenVal=parseInt(keyLenObj.value,10);
            if(keyLenVal%8 != 0 ){
                alert(LANG_LOCALE['14276']);
                keyLenObj.focus();
                return false;
            }
            if(numericValueRangeCheck (keyLenObj, '', '', 40,448, true, LANG_LOCALE['11227'] , '')==false)return false;        
            var len = keyLenVal/8 ;
            minKeyLen = len;
            errStr = LANG_LOCALE['30466'] + " " + len + " " + LANG_LOCALE['30467'];
            break;
        case 13:    /* CAST128 */
            var keyLenObj= document.getElementById('tf1_encryptionkeyLength');
            var keyLenVal=parseInt(keyLenObj.value,10);
            if(keyLenVal%8 != 0){                
                alert(LANG_LOCALE['14276']);                
                keyLenObj.focus();
                return false;
            }
            if(numericValueRangeCheck (keyLenObj, '', '', 40,128, true, LANG_LOCALE['11228'], '')==false)return false;            
            var len = keyLenVal/8 ;
            minKeyLen = len;
            errStr = LANG_LOCALE['30468'] + " "+ len + " " + LANG_LOCALE['30467'];
            break;
        case 0:    /* NULL */
        default:
            minKeyLen = 0;
            errStr = "";
            break;
        }
    /* check for minimum length */
    if (fieldLengthCheck ('tf1_encryptionKeyIn', minKeyLen, minKeyLen,
                LANG_LOCALE['14275'] + errStr) == false)
        return false;
    if (fieldLengthCheck ('tf1_encryptionKeyOut', minKeyLen, minKeyLen,
                LANG_LOCALE['14274'] + errStr) == false)
        return false;
    /* check for key validity */
    var keyInObj = document.getElementById ('tf1_encryptionKeyIn');
    if (keyInObj.disabled) return true;
    var keyOutObj = document.getElementById ('tf1_encryptionKeyOut');
    if (keyOutObj.disabled) return true;
    switch (parseInt (selEncrValue, 10))
        {
        case 3:    /* 3DES */
            splitPos = 8;
            errStr = LANG_LOCALE['14287'];
            var keyInStr = keyInObj.value;
            if ((keyInStr.substring (0, splitPos) == 
                         keyInStr.substring (splitPos, splitPos + splitPos)) ||
                (keyInStr.substring (splitPos, splitPos + splitPos) == 
                         keyInStr.substring (splitPos  + splitPos)) ||
                (keyInStr.substring (0, splitPos) == 
                         keyInStr.substring (splitPos  + splitPos)))
                {
                    alert (errStr);
                    keyInObj.focus ();
                    return false;
                }
            var keyOutStr = keyOutObj.value;
            errStr = LANG_LOCALE['14286'];
            if ((keyOutStr.substring (0, splitPos) == 
                         keyOutStr.substring (splitPos, splitPos + splitPos)) || 
                (keyOutStr.substring (splitPos, splitPos + splitPos) == 
                         keyOutStr.substring (splitPos  + splitPos)) || 
                (keyOutStr.substring (0 , splitPos) == 
                         keyOutStr.substring (splitPos  + splitPos)))
                {
                    alert (errStr);
                    keyOutObj.focus ();
                    return false;
                }
            break;
        case 1:    /* DES */
        case 4:    /* AES-128 */
        case 5:    /* AES-192 */
        case 6:    /* AES-256 */
        case 0:    /* NULL */
        default:
            minKeyLen = 0;
            errStr = "";
            break;
        }
    
    return true;
    }
/*  49853 SPR starts */

/****
 * This function calls when user selects an option from Remote End Point
 * OnChange event
 * @method ipAddress4or6Check
 */
function ipAddress4or6CheckLocalRemote (tfFieldId){
    
    var Obj = document.getElementById(tfFieldId);
    if (!Obj) 
        return;
    var protocolValue = comboSelectedValueGet ('tf1_ipProtocolVersion');
    if(protocolValue == 1){
            if (ipv4Validate (tfFieldId, 'SN', false, true,LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
                return false;
        }else{
            if (ipv6Validate (tfFieldId, false, true, '') == false)
                return false;
        }
    return true;
}

function localSubnetIpCheck ()
    {

    var localStartIpObj = document.getElementById('tf1_localStartIpAddr');
    /*
    Check if protocol is IPv4 or IPv6
    */  
    var protocolValue = comboSelectedValueGet ('tf1_ipProtocolVersion');
    var localIpObj = document.getElementById('tf1_localIp');
    if(protocolValue == 1)
        {
        if(localIpObj.value == "4")
            {
            if($("#tf1_enableModeConfig").attr("class") == "enable-disable-on")
                {
                if(localStartIpObj.value == "0.0.0.0")
                    {
                    return true;
                    }
                else
                    {
                    return ipv4AddrValidate (localStartIpObj, 'SN', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true);
                    }
               }
            else
                {
                return ipv4AddrValidate (localStartIpObj, 'SN', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true);                    
                }
            }
        else
            {
            return ipv4AddrValidate (localStartIpObj, 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true);
            }
        }    
    else
        {
        if (ipv6Validate ('tf1_localStartIpAddr', false, true, '') == false)
            {
            return false;
            }
        }
    }

function remoteSubnetIpCheck ()
    {

    var remoteStartIpObj = document.getElementById('tf1_remoteStartIpAddr');
    /*
    Check if protocol is IPv4 or IPv6
    */  
    var protocolValue = comboSelectedValueGet ('tf1_ipProtocolVersion');
    var remoteIpObj = document.getElementById('tf1_remoteIp');
    if(protocolValue == 1)
        {
        if(remoteIpObj.value == "4")
            {
            return ipv4AddrValidate (remoteStartIpObj, 'SN', false, true,LANG_LOCALE['11281'], LANG_LOCALE['11031'], true);
            }
        else
            {
            return ipv4AddrValidate (remoteStartIpObj, 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true);
            }
        }
    else
        {
        if (ipv6Validate ('remoteStartIP', false, true, '') == false)
            return false;
        }
    }

function checkAndSetNetworkIp (ipAddrId, subnetId)
    {
    // Get subnet Id    
    var localSubnetObj = document.getElementById(subnetId);
    var localIpObj = document.getElementById('tf1_localIp');
    if(localIpObj && !localIpObj.disabled)
        {
        if(localIpObj.value == "4")
            {
                if($("#tf1_enableModeConfig").attr("class") == "enable-disable-on")
                {
                    if(localSubnetObj)
                        {
                        if(localSubnetObj.value == "0.0.0.0")
                            {
                             return true;
                            }
                        }  
               }        
            if(validNetMask (subnetId))
                {
                if(setNetworkIpAddress (ipAddrId, subnetId) == false)
                    {
                    return false;
                    }
                else
                    {
                    return true;
                    }
                }
            else
                return false;
            }
        else
            return validNetMask (subnetId);
        }                                        
    } 

function checkAndSetRemoteNetworkIp (ipAddrId, subnetId)
    {
    // Get subnet Id    
    var localSubnetObj = document.getElementById(subnetId);
    var localIpObj = document.getElementById('tf1_remoteIp')
    if(localIpObj && !localIpObj.disabled)
        {
        if(localIpObj.value == "4")
            {
                if(localSubnetObj)
                    {
                    if(localSubnetObj.value == "0.0.0.0")
                        {
                        return true;
                        }
                    }          
            if(validNetMask (subnetId))
                {
                if(setNetworkIpAddress (ipAddrId, subnetId) == false)
                    {
                    return false;
                    }
                else
                    {
                    return true;
                    }
                }
            else
                return false;
            }
        else
            return validNetMask (subnetId);
        }                                        
    }
/*  49853 SPR ends */
