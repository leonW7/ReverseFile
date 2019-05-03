wizardLoaded = true;

var wlanTableDataLoaded = false;

function internetPageEndFn() {

	wlanTableDataLoaded = false;
 
}

function wizardClearSpanWarning() {
  $( ".pagination div.pageList span" ).each(function( index ) {
                if (!$(this).attr("data-localize")) {
                    $(this).html('');
                }
  });
}

function showWizardDiv(divId,onloadfun) {
			$(".divStep").hide();
            /* Empty messages span only */
            wizardClearSpanWarning();

			/* $(".pagination div.pageList span").html('');	*/
			$("#"+divId).show();
			if(onloadfun != '')
				eval(onloadfun+"()");
		}
		
function cancelWizard() {
	alert(LANG_LOCALE['10557']);
	HideDialog('tf1Wizard_dialogWizard', 'tf1_overlay');
}

/**
 * This function for enable or disable fields while clicking on on off image
 * Onclick event
 * @method enableTextFieldByAnchorClickWizard
 * @param imgId - image Id
 * @param fieldIds - space separated field names
 * @param brk - space separated break names
 */
function enableTextFieldByAnchorClickWizard(imgId,fieldIds,brk,blocks){
	var imgObj = document.getElementById(imgId);
    if (imgObj) {
		var currentClass=$(imgObj).attr("class");	
	     if(currentClass == ON_ANCHOR){
			fieldStateChangeWr ('', '', fieldIds, '');
       		vidualDisplay(fieldIds,'configRowWizard');	   
       		vidualDisplay (brk,'break');
       		vidualDisplay(blocks,'');
	     }else{
			fieldStateChangeWr (fieldIds, '', '', '');
	   	    vidualDisplay(fieldIds,'hide');
	   	    vidualDisplay (brk,'hide');
	   	    vidualDisplay(blocks,'hide');
	     }
    }
}

/**
 * This function for enable or disable fields while clicking on on off image
 * Onclick event
 * @method disableTextFieldByAnchorClickWizard
 * @param imgId - image Id
 * @param fieldIds - space separated field names
 * @param brk - space separated break names
 */
function disableTextFieldByAnchorClickWizard(imgId,fieldIds,brk,blocks){	
	var imgObj = document.getElementById(imgId);
    if (imgObj) {
		var currentClass=$(imgObj).attr("class");		
	     if(currentClass == OFF_ANCHOR){	     	
			fieldStateChangeWr ('', '', fieldIds, '');
       		vidualDisplay (fieldIds,'configRowWizard');	  
       		vidualDisplay (brk,'break');
	   	    vidualDisplay(blocks,'');
	     }else{
			fieldStateChangeWr (fieldIds, '', '', '');
        	vidualDisplay (fieldIds,'hide');
        	vidualDisplay (brk,'hide');
       		vidualDisplay(blocks,'hide');	
	     }
    }
}


/* internet connections */

function internetConnectionWizardFn() {
		
	$(".connection-type").click(function(event) {	
		$(".connection-type").removeClass("enable-disable-off-wizard");
		$(".connection-type").removeClass("enable-disable-on-wizard");
		$(".connection-type").addClass("enable-disable-off-wizard");
		$(this).removeClass("enable-disable-off-wizard");
		$(this).addClass("enable-disable-on-wizard");
		$("#tf1Wizard_wlanIspType").val($(this).attr('db-id'));
		$("#internetWizardStatusMsgStep1").html('');
  
	});	
}

/* Wlan step 1 functions start */
function wlanWizardFn() {
	onloadCall (wlanStep1ImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRowWizard', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
	
	enableTextFieldByAnchorClickWizard('tf1Wizard_state',"tf1Wizard_mode",'break_mode');	
	enableTextFieldByAnchorClickWizard('tf1Wizard_state1',"tf1Wizard_mode1",'break_mode1');
	wlanSecurityOptionChange();
}

function wlanStep1ImageClick(data, thisObj) { 
	onAnchorToggle (data);
    var imgId=thisObj.id;
	 switch(imgId){
    	case 'tf1Wizard_state': 
		
			enableTextFieldByAnchorClickWizard(imgId,"tf1Wizard_mode",'break_mode');
		 
		break;
		case 'tf1Wizard_state1':  
		
			enableTextFieldByAnchorClickWizard(imgId,"tf1Wizard_mode1",'break_mode');
		 
		break;

	  case 'tf1Wizard_editPwd':  
		
			enableTextFieldByAnchorClickWizard(imgId,"tf1Wizard_oldPassword tf1Wizard_newPassword tf1Wizard_reTypePassword",'break_oldPassword break_newPassword break_reTypePassword');
		 
		break;
	 }
}


function wlanSecurityOptionChange() {
	
	fieldStateChangeWr('tf1Wizard_wepPass tf1Wizard_wpaPass', '', '', '');
    vidualDisplay('tf1Wizard_wepPass tf1Wizard_wpaPass', 'hide');
    vidualDisplay('break_wepPass break_wpaPass', 'hide');  
	/* WEP */
	if (document.getElementById("tf1Wizard_securityOpt").value == "2")	{
		
		fieldStateChangeWr('', '', 'tf1Wizard_wepPass', '');
    	vidualDisplay('tf1Wizard_wepPass', 'configRowWizard');
    	vidualDisplay('break_wepPass', 'break');  
		
    /* WAP */	
	} else if (document.getElementById("tf1Wizard_securityOpt").value == "4")	{
		
		fieldStateChangeWr('', '', 'tf1Wizard_wpaPass', '');
    	vidualDisplay('tf1Wizard_wpaPass', 'configRowWizard');
    	vidualDisplay('break_wpaPass', 'break');  
		
	} 
	
	
}
/* Wlan step 1 functions ends */

function setContinent(continent) {
	
		if (continent == "northamerica") {	
			$("."+continent+" a").css('backgroundPosition', '-1px -174px');	
		}	
}

function moveToConnectionDetails() {
 
   
   if ($("#tf1Wizard_wlanIspType").val() == '') {
	  $("#internetWizardStatusMsgStep1").html('<font color="#ff0202">'+LANG_LOCALE['30508']+'</font>');
	return;   
   }
   $("#internetWizardStatusMsgStep1").html('');
   
 
		showWizardDiv('tf1Wizard_divStep2', '');
	

	
		
	fieldStateChangeWr('', '', 'tf1Wizard_dnsIpMode tf1Wizard_secondaryDnsServer tf1Wizard_primaryDnsServer tf1Wizard_gateWayIpAddress tf1Wizard_macAddressSource tf1Wizard_macAddress tf1Wizard_macHostName tf1Wizard_loginName tf1Wizard_loginPassword tf1Wizard_reconnectMode tf1Wizard_addressMode tf1Wizard_ipSubnetMask tf1Wizard_serverIpAddress tf1Wizard_idleTime tf1Wizard_ipAddr', '');
    vidualDisplay('tf1Wizard_dnsIpMode tf1Wizard_secondaryDnsServer tf1Wizard_primaryDnsServer tf1Wizard_gateWayIpAddress tf1Wizard_macAddressSource tf1Wizard_macAddress tf1Wizard_macHostName tf1Wizard_loginName tf1Wizard_loginPassword tf1Wizard_reconnectMode tf1Wizard_addressMode tf1Wizard_ipSubnetMask tf1Wizard_serverIpAddress tf1Wizard_idleTime tf1Wizard_ipAddr', 'configRowWizard');
    vidualDisplay('break_dnsIpMode break_secondaryDnsServer break_primaryDnsServer break_gateWayIpAddress break_macAddressSource break_macAddress break_macHostName break_loginName break_loginPassword break_reconnectMode break_addressMode break_ipSubnetMask break_serverIpAddress break_idleTime break_ipAddr', 'break');
    

	
	 
        
	 if ($("#tf1Wizard_wlanIspType").val() == "1") {
	 
	 	 
		$("#tf1Wizard_headingConnectionType").html(LANG_LOCALE['30509']);

    $("#tf1Wizard_divStep2 div.wizardMessage").html(LANG_LOCALE['30510']);
		
		 
	 	fieldStateChangeWr('tf1Wizard_gateWayIpAddress tf1Wizard_loginName tf1Wizard_loginPassword tf1Wizard_reconnectMode tf1Wizard_addressMode tf1Wizard_ipSubnetMask tf1Wizard_serverIpAddress tf1Wizard_idleTime tf1Wizard_ipAddr', '', '', '');
        vidualDisplay('tf1Wizard_gateWayIpAddress tf1Wizard_loginName tf1Wizard_loginPassword tf1Wizard_reconnectMode tf1Wizard_addressMode tf1Wizard_ipSubnetMask tf1Wizard_serverIpAddress tf1Wizard_idleTime tf1Wizard_ipAddr', 'hide');
        vidualDisplay('break_gateWayIpAddress break_loginName break_loginPassword break_reconnectMode break_addressMode break_ipSubnetMask break_serverIpAddress break_idleTime break_ipAddr', 'hide');
        internetConnectionDnsChange();
        
	 } else if ($("#tf1Wizard_wlanIspType").val() == "2") {

			 $("#tf1Wizard_divStep2 div.wizardMessage").html(LANG_LOCALE['30511']);
		 
		 	$("#tf1Wizard_headingConnectionType").html(LANG_LOCALE['30512']);
	 		   
	 	 	
	 		fieldStateChangeWr('tf1Wizard_ipaddress tf1Wizard_gateWayIpAddress tf1Wizard_macHostName', '', '', '');
        	vidualDisplay('tf1Wizard_ipaddress tf1Wizard_gateWayIpAddress tf1Wizard_macHostName', 'hide');
        	vidualDisplay('break_ipaddress break_gateWayIpAddress break_macHostName', 'hide');     
	 	    internetConnectionDnsChange();
	 	    internetConnectionReconnectModeChange();
	 	    internetConnectionAddressModeChange();
	 	    	 
	 } else if ($("#tf1Wizard_wlanIspType").val() == "3") 
	 {
	 	  	
		$("#tf1Wizard_headingConnectionType").html(LANG_LOCALE['12994']);

    $("#tf1Wizard_divStep2 div.wizardMessage").html(LANG_LOCALE['30513']);
		 
	 	fieldStateChangeWr('tf1Wizard_dnsIpMode tf1Wizard_macHostName tf1Wizard_loginName tf1Wizard_loginPassword tf1Wizard_reconnectMode tf1Wizard_addressMode tf1Wizard_serverIpAddress tf1Wizard_idleTime', '', '', '');
        vidualDisplay('tf1Wizard_dnsIpMode tf1Wizard_macHostName tf1Wizard_loginName tf1Wizard_loginPassword tf1Wizard_reconnectMode tf1Wizard_addressMode tf1Wizard_serverIpAddress tf1Wizard_idleTime', 'hide');
        vidualDisplay('break_dnsIpMode break_macHostName break_loginName break_loginPassword break_reconnectMode break_addressMode break_serverIpAddress break_idleTime', 'hide');
        
        
	} else if ($("#tf1Wizard_wlanIspType").val() == "4") {
	
		$("#tf1Wizard_divStep2 div.wizardMessage").html(LANG_LOCALE['30514']);
		
		 $("#tf1Wizard_headingConnectionType").html(LANG_LOCALE['30515']);
		
	 	fieldStateChangeWr('tf1Wizard_gateWayIpAddress tf1Wizard_serverIpAddress tf1Wizard_macHostName', '', '', '');
       	vidualDisplay('tf1Wizard_gateWayIpAddress tf1Wizard_serverIpAddress tf1Wizard_macHostName', 'hide');
       	vidualDisplay('break_gateWayIpAddress break_serverIpAddress break_macHostName', 'hide');     
		internetConnectionDnsChange();
		internetConnectionReconnectModeChange();
	 	internetConnectionAddressModeChange();
	 			
	} else if ($("#tf1Wizard_wlanIspType").val() == "5") {

    $("#tf1Wizard_divStep2 div.wizardMessage").html(LANG_LOCALE['30516']);
		 
		 $("#tf1Wizard_headingConnectionType").html(LANG_LOCALE['30520']);		
	 	fieldStateChangeWr('tf1Wizard_ipaddress tf1Wizard_gateWayIpAddress tf1Wizard_macHostName', '', '', '');
        vidualDisplay('tf1Wizard_ipaddress tf1Wizard_gateWayIpAddress tf1Wizard_macHostName', 'hide');
        vidualDisplay('break_ipaddress break_gateWayIpAddress break_macHostName', 'hide');
        internetConnectionDnsChange();
        internetConnectionReconnectModeChange();
	 	internetConnectionAddressModeChange();
	}
        dhcpMacAddressCheck();
			
}


function dhcpMacAddressCheck() {

		/* Use this MAC Address : 2 */
	if (document.getElementById("tf1Wizard_macAddressSource").value == "3")	{
		
		fieldStateChangeWr('', '', 'tf1Wizard_macAddress', '');
        vidualDisplay('tf1Wizard_macAddress', 'configRowWizard');
        vidualDisplay('break_macAddress', 'break');        
		
	} else {	
		
		fieldStateChangeWr('tf1Wizard_macAddress', '', '', '');
        vidualDisplay('tf1Wizard_macAddress', 'hide');
        vidualDisplay('break_macAddress', 'hide');

	
	}
}


function internetConnectionDnsChange() {

	/* Use these DNS servers  : 2 */
	if (document.getElementById("tf1Wizard_dnsIpMode").value == "2")	{		
		fieldStateChangeWr('', '', 'tf1Wizard_secondaryDnsServer tf1Wizard_primaryDnsServer', '');
        vidualDisplay('tf1Wizard_secondaryDnsServer tf1Wizard_primaryDnsServer', 'configRowWizard');
        vidualDisplay('break_secondaryDnsServer break_primaryDnsServer', 'break');      
		
	} else {			
		fieldStateChangeWr('tf1Wizard_secondaryDnsServer tf1Wizard_primaryDnsServer', '', '', '');
        vidualDisplay('tf1Wizard_secondaryDnsServer tf1Wizard_primaryDnsServer', 'hide');
        vidualDisplay('break_secondaryDnsServer break_primaryDnsServer', 'hide');
	
	}
}

function internetConnectionReconnectModeChange() {

	/* On Demand  : 2 */
	if (document.getElementById("tf1Wizard_reconnectMode").value == "2")	{		
		fieldStateChangeWr('', '', 'tf1Wizard_idleTime', '');
        vidualDisplay('tf1Wizard_idleTime', 'configRowWizard');
        vidualDisplay('break_idleTime', 'break');      
		
	} else {			
		fieldStateChangeWr('tf1Wizard_idleTime', '', '', '');
        vidualDisplay('tf1Wizard_idleTime', 'hide');
        vidualDisplay('tf1Wizard_idleTime', 'hide');
	
	}

}

function internetConnectionAddressModeChange() {

	/*Static IP  : 2 */
	if (document.getElementById("tf1Wizard_addressMode").value == "2")	{		
		fieldStateChangeWr('', '', 'tf1Wizard_ipAddr tf1Wizard_ipSubnetMask', '');
        vidualDisplay('tf1Wizard_ipAddr tf1Wizard_ipSubnetMask', 'configRowWizard');
        vidualDisplay('break_ipAddr break_ipSubnetMask', 'break');  

        if ($("#tf1Wizard_wlanIspType").val() == 2 || $("#tf1Wizard_wlanIspType").val() == 5 ) {
            fieldStateChangeWr('', '', 'tf1Wizard_gateWayIpAddress', '');
            vidualDisplay('tf1Wizard_gateWayIpAddress', 'configRowWizard');
            vidualDisplay('break_gateWayIpAddress', 'break');  
        }
		
	} else {			
		fieldStateChangeWr('tf1Wizard_ipAddr tf1Wizard_ipSubnetMask', '', '', '');
        vidualDisplay('tf1Wizard_ipAddr tf1Wizard_ipSubnetMask', 'hide');
        vidualDisplay('break_ipAddr break_ipSubnetMask', 'hide');

        if ($("#tf1Wizard_wlanIspType").val() == 2 || $("#tf1Wizard_wlanIspType").val() == 5 ) {
            fieldStateChangeWr('tf1Wizard_gateWayIpAddress', '', '', '');
            vidualDisplay('tf1Wizard_gateWayIpAddress', 'hide');
            vidualDisplay('break_gateWayIpAddress', 'hide');  
        }
	
	}


}


/* Common function */
function showPreview(showDivId,hideDivId) {

	$("#"+hideDivId).hide();
	$("#"+showDivId).show();
	

	var headerIds = new Array();

	$( ".wizardField").each(function( index ) {
							  
					if ($(this).attr('headingId')) {
						var cDis = $(this).is(':disabled');						 
						
						if ($.inArray($(this).attr('headingId'), headerIds) == -1 && cDis == false) {
							
							headerIds.push($(this).attr('headingId'));						
						}
					}
	});
	
 
	for (i=0; i < headerIds.length; i++) {		
		topTemplate = '<h3>'+$("#"+headerIds[i]).html() +'</h3><div class="configRowPreview">';
		innerBlocks = "";		
		$( ".wizardField").each(function( index ) {
										 
									
					if ($(this).attr('headingId')) {
						var cDis = $(this).is(':disabled');	
						if ($(this).attr('headingId') == headerIds[i]  && cDis == false ) {
							
						label = $(this).parent().find("label").html();
						
						fieldType = $(this).attr("field-type");
						fieldId = $(this).attr("id");
						
						if ( fieldType == "select") {
		
						fieldValue = $("#"+fieldId+" option:selected").text();				
						
						} else if ( fieldType == "text") {
						
							fieldValue = $(this).val();
											
						} else if ( fieldType == "password") {
						
							 fieldValue = "****";
						} else if ( fieldType == "on-off") {						
							 if($(this).val() == 0)
									fieldValue = "Off";
							 else
									fieldValue = "On";
						} else {
						
							fieldValue = $(this).val();
						}
					 
						if(fieldValue != "")
                            {
                             if (fieldId == "tf1Wizard_preSharedKey") {
                                innerBlocks = innerBlocks + '<div class="configRowPreviewBox"><div class="previewRow"><label>'+label+'</label><p class="hyphenation" style="width:300px">'+fieldValue+'</p></div></div>';
                             } else {
							innerBlocks = innerBlocks + '<div class="configRowPreviewBox"><div class="previewRow"><label>'+label+'</label><p>'+fieldValue+'</p></div></div>';
                             }
                            }
							
						}
						 
					}
		});
		
		templateHtml = topTemplate+innerBlocks+"</div>";
		$("#tf1Wizard_previewBlock").append(templateHtml);
		
	}
	
 
 
/*

	$("#tf1Wizard_stepsAndMsg"+section).hide();
	$("#tf1Wizard_stepsAndMsgPreview").show();
	
	$( "p.fieldValue" ).each(function( index ) {
		
		fieldId = $(this).attr("field-id");
		
		fieldType = $(this).attr("field-type");
		
		$("#"+fieldId).hide();
		
		if ( fieldType == "select") {
		
			$(this).html($("#"+fieldId+" option:selected").text());				
		
		} else if ( fieldType == "text") {
		
			$(this).html($("#"+fieldId).val());
							
		} else if ( fieldType == "password") {
		
			$(this).html('****');				
		}

		
	});
	
	*/

}


function previewMoveToConnectionDetails()
{
	
	$( "p.fieldValue" ).each(function( index ) {		
		fieldId = $(this).attr("field-id");		
		fieldType = $(this).attr("field-type");		
		$("#"+fieldId).show();
		$(this).html('');				
	});

	moveToConnectionDetails();
}


function internetTestConnect() { 

	/*Form Validations fails stop the request */

	if ( validateInternetConnection() == false) {
		return;
	}
	
	$("#tf1Wizard_btnConnect").val('testconnect');
	
	saveConnection('testconnection');

}

function internetConnectionSave() {

	/*Form Validations fails stop the request */
	
	if ( validateInternetConnection() == false) {
		return;
	}

   
   var previousConnection = "";

    if ($("#tf1Wizard_divStep1 div.wizardMessage p").html().search("L2TP") != -1 ) {
        previousConnection = LANG_LOCALE['11502'];
   } else if ($("#tf1Wizard_divStep1 div.wizardMessage p").html().search("PPTP") != -1) {
        previousConnection = LANG_LOCALE['12509'];
    }else if ($("#tf1Wizard_divStep1 div.wizardMessage p").html().search("DHCP") != -1) {
        previousConnection = LANG_LOCALE['10731'];
    }else if ($("#tf1Wizard_divStep1 div.wizardMessage p").html().search("PPPoE") != -1) {
        previousConnection = LANG_LOCALE['12507'];
    }else if ($("#tf1Wizard_divStep1 div.wizardMessage p").html().search("Static") != -1) {
        previousConnection = LANG_LOCALE['12991'];
    }   

   var msg = LANG_LOCALE['13584']+" " + previousConnection +" "+LANG_LOCALE['13585'];
    var confMessage = confirm(msg);
    if ( confMessage == false ) {
        return false;
    }

	$("#tf1Wizard_btnConnect").val('save');
	
	saveConnection('save');
	
}

function saveConnection(actionType) {

displayProgressBar();

	var request = $.ajax({
		url: "platform.cgi?page=wizard.html",
		type: "POST",
		data: $("#tf1Wizard_internetForm").serialize(),
		dataType: "html"
		});
		wizardClearSpanWarning();	
    	request.done(function(msg) {			
            hideProgressBar();
			 if ( actionType == "save") {		 
			 	

                if (msg.search('errorWizard') != -1) {
                     $("#tf1Wizard_step2StatusMessage").html (msg);
                } else {			 
			            showPreview ('tf1Wizard_previewDiv','tf1Wizard_divStep2');
                }

			 	
			 } else {
			 
			 	//$(".errorMessages").html(msg);
			 	
			 }
			 
		});
		request.fail(function(jqXHR, textStatus) {
			alert( LANG_LOCALE['13586']+": " + textStatus );
		});	

}

function validateInternetConnection() {

	/* get the connection Type */
	
	var connectionTypeValue = $("#tf1Wizard_wlanIspType").val();
	
	switch (parseInt(connectionTypeValue, 10)){
	
		case 1:/* DHCP */
		
		var txtFieldIdArr = new Array();   
	    txtFieldIdArr[0] = "tf1Wizard_macAddress,"+LANG_LOCALE['12048']; 
	    txtFieldIdArr[1] = "tf1Wizard_primaryDnsServer,"+LANG_LOCALE['12091'];
			txtFieldIdArr[2] = "tf1Wizard_secondaryDnsServer,"+LANG_LOCALE['12108'];
		
		if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

        if (hostNameValidation ('tf1Wizard_macHostName') == false)
            return false;
    
    var macObj = document.getElementById('tf1Wizard_macAddress');
    if (macObj && !macObj.disabled && macAddrValidate(macObj.value, true, "", '', macObj) == false) {
			macObj.focus();
    	return false;
		}    
		    
		if (ipv4Validate('tf1Wizard_primaryDnsServer', 'IP', true, true, LANG_LOCALE['11324']+".", LANG_LOCALE['11031']+" ", true) == false) 
        return false;

    if (ipv4Validate('tf1Wizard_secondaryDnsServer', 'IP', true, true, LANG_LOCALE['11346']+".", LANG_LOCALE['11031']+" ", true) == false) 
        return false;    
		
		
		return true;	
		
		break;
		
			
		
		case 2:/* PPTP */
		
		var txtFieldIdArr = new Array();   
	    txtFieldIdArr[0] = "tf1Wizard_loginName,"+LANG_LOCALE['12144'];
	    txtFieldIdArr[1] = "tf1Wizard_loginPassword,"+LANG_LOCALE['12074'];
			txtFieldIdArr[2] = "tf1Wizard_idleTime,"+LANG_LOCALE['13587'];
			txtFieldIdArr[3] = "tf1Wizard_serverIpAddress,"+LANG_LOCALE['12118'];	    
			txtFieldIdArr[4] = "tf1Wizard_ipAddress,"+LANG_LOCALE['12063'];
			txtFieldIdArr[5] = "tf1Wizard_ipAddr,"+LANG_LOCALE['12028'];			
	    txtFieldIdArr[6] = "tf1Wizard_ipSubnetMask,"+LANG_LOCALE['12133'];
			txtFieldIdArr[7] = "tf1Wizard_gateWayIpAddress,"+LANG_LOCALE['30394'];
	    txtFieldIdArr[8] = "tf1Wizard_primaryDnsServer,"+LANG_LOCALE['12091'];
	    txtFieldIdArr[9] = "tf1Wizard_secondaryDnsServer,"+LANG_LOCALE['12108'];
	    
		
		if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

		if(alphaNumericValueCheck ("tf1Wizard_loginName", '_~`!@#$%^&*()-+={}[]|:;<>.?/', LANG_LOCALE['30517']) == false)
				return false;

		if (numericValueRangeCheck(document.getElementById('tf1Wizard_idleTime'), '', '', 1, 10, true, LANG_LOCALE['13589']+'.', '') == false) 
        return false;


		if (ipv4Validate('tf1Wizard_ipAddr', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;

		if (validNetMask('tf1Wizard_ipSubnetMask') == false) 
        return false;	
    
    if (ipv4Validate('tf1Wizard_gateWayIpAddress', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;	

		if (ipv4Validate('tf1Wizard_primaryDnsServer', 'IP', false, true, LANG_LOCALE['11324']+".", LANG_LOCALE['11031']+" ", true) == false) 
        return false;

    if (ipv4Validate('tf1Wizard_secondaryDnsServer', 'IP', false, true, LANG_LOCALE['11346']+".", LANG_LOCALE['11031']+" ", true) == false)
				return false;
        
		return true;
		break;
		
		case 3:/* STATIC */
		
		var txtFieldIdArr = new Array();   
	    txtFieldIdArr[0] = "tf1Wizard_ipAddr,"+LANG_LOCALE['12028'];
	    txtFieldIdArr[1] = "tf1Wizard_ipSubnetMask,"+LANG_LOCALE['12133'];
	    txtFieldIdArr[2] = "tf1Wizard_gateWayIpAddress,"+LANG_LOCALE['12017'];
	    txtFieldIdArr[3] = "tf1Wizard_primaryDnsServer,"+LANG_LOCALE['12091'];
	    txtFieldIdArr[4] = "tf1Wizard_secondaryDnsServer,"+LANG_LOCALE['12108'];
		
		if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

		if (ipv4Validate('tf1Wizard_ipAddr', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
        if (validNetMask('tf1Wizard_ipSubnetMask') == false) 
        return false;

		if (ipv4Validate('tf1Wizard_gateWayIpAddress', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;

		if (ipv4Validate('tf1Wizard_secondaryDnsServer', 'IP', false, true, LANG_LOCALE['11346']+".", LANG_LOCALE['11031']+" ", true) == false)
				return false;

		if (ipv4Validate('tf1Wizard_primaryDnsServer', 'IP', false, true, LANG_LOCALE['11324']+".", LANG_LOCALE['11031']+" ", true) == false) 
        return false;

	    var stIpAddr = getIPInt1("tf1Wizard_ipAddr");
	    var endIpAddr = getIPInt1("tf1Wizard_gateWayIpAddress");
	    var snetMask = getIPInt1("tf1Wizard_ipSubnetMask");
	    if (!isInSubnet(endIpAddr, stIpAddr, snetMask))	{
		    var errorstr = LANG_LOCALE['13590'];
     		alert (errorstr)
	       	return false;
	    }
        
		return true;
		break;


		case 4:/* PPPoE */
		
		var txtFieldIdArr = new Array();   
	    txtFieldIdArr[0] = "tf1Wizard_loginName,"+LANG_LOCALE['12144'];
	    txtFieldIdArr[1] = "tf1Wizard_loginPassword,"+LANG_LOCALE['12074'];
	    txtFieldIdArr[2] = "tf1Wizard_idleTime,"+LANG_LOCALE['13587'];
	    txtFieldIdArr[3] = "tf1Wizard_ipAddr,"+LANG_LOCALE['12028'];
	    txtFieldIdArr[4] = "tf1Wizard_ipSubnetMask,"+LANG_LOCALE['12133'];
	    txtFieldIdArr[5] = "tf1Wizard_primaryDnsServer,"+LANG_LOCALE['12091'];
			txtFieldIdArr[6] = "tf1Wizard_secondaryDnsServer,"+LANG_LOCALE['12108'];
		
		if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

		if(alphaNumericValueCheck ("tf1Wizard_loginName", "_~`!@#$%^&*()-+={}[]|:;<>.?/", LANG_LOCALE['30517']) == false)
				return false;

		if (numericValueRangeCheck(document.getElementById('tf1Wizard_idleTime'), '', '', 1, 10, true, LANG_LOCALE['13589']+'.', '') == false) 
        return false;

		if (ipv4Validate('tf1Wizard_ipAddr', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if (validNetMask('tf1Wizard_ipSubnetMask') == false) 
        return false;

		if (ipv4Validate('tf1Wizard_primaryDnsServer', 'IP', false, true, LANG_LOCALE['11324']+".", LANG_LOCALE['11031']+" ", true) == false) 
        return false;

    if (ipv4Validate('tf1Wizard_secondaryDnsServer', 'IP', false, true, LANG_LOCALE['11346']+".", LANG_LOCALE['11031']+" ", true) == false)
				return false;
        
		return true;
		break;
		
		case 5:/* L2TP */
		
		var txtFieldIdArr = new Array();   
	    txtFieldIdArr[0] = "tf1Wizard_loginName,"+LANG_LOCALE['12144'];
	    txtFieldIdArr[1] = "tf1Wizard_loginPassword,"+LANG_LOCALE['12074'];
	    txtFieldIdArr[2] = "tf1Wizard_idleTime,"+LANG_LOCALE['13587'];
	    txtFieldIdArr[3] = "tf1Wizard_serverIpAddress,"+LANG_LOCALE['12118'];
	    txtFieldIdArr[4] = "tf1Wizard_ipAddr,"+LANG_LOCALE['12028'];
	    txtFieldIdArr[5] = "tf1Wizard_ipAddress,"+LANG_LOCALE['12063'];
			txtFieldIdArr[6] = "tf1Wizard_gateWayIpAddress,"+LANG_LOCALE['30394'];
	    txtFieldIdArr[7] = "tf1Wizard_ipSubnetMask,"+LANG_LOCALE['12133'];
	    txtFieldIdArr[8] = "tf1Wizard_primaryDnsServer,"+LANG_LOCALE['12091'];
	    txtFieldIdArr[9] = "tf1Wizard_secondaryDnsServer,"+LANG_LOCALE['12108'];

		
		if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

		if(alphaNumericValueCheck ("tf1Wizard_loginName", '_~`!@#$%^&*()-+={}[]|:;<>.?/', LANG_LOCALE['30517']) == false)
				return false;

		if (numericValueRangeCheck(document.getElementById('tf1Wizard_idleTime'), '', '', 1, 10, true, LANG_LOCALE['13589']+'.', '') == false) 
        return false;

		if (ipv4Validate('tf1Wizard_ipAddr', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;


		if (ipv4Validate('tf1Wizard_gateWayIpAddress', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if (validNetMask('tf1Wizard_ipSubnetMask') == false) 
        return false;

		if (ipv4Validate('tf1Wizard_primaryDnsServer', 'IP', false, true, LANG_LOCALE['11324']+".", LANG_LOCALE['11031']+" ", true) == false) 
        return false;

    if (ipv4Validate('tf1Wizard_secondaryDnsServer', 'IP', false, true, LANG_LOCALE['11346']+".", LANG_LOCALE['11031']+" ", true) == false)
				return false;

        
		return true;
		break;

		
	}

}

function openWlanStep1() {

	showWizardDiv('tf1Wizard_divStep1', '');
	
}

function openWlanStep2() {
	
	/* Validate the required fields of step 1 */
	
	var txtFieldIdArr = new Array();   
	txtFieldIdArr[0] = "tf1Wizard_apProfileName,"+LANG_LOCALE['30395'];
	txtFieldIdArr[1] = "tf1Wizard_ssid,"+LANG_LOCALE['12126'];
	txtFieldIdArr[2] = "tf1Wizard_wepPass,"+LANG_LOCALE['12156'];
	txtFieldIdArr[3] = "tf1Wizard_wpaPass,"+LANG_LOCALE['12160'];
	
	if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

	if(alphaNumericValueCheck("tf1Wizard_apProfileName","-_",LANG_LOCALE['13717']) == false)
		return false;

	if(alphaNumericValueCheck("tf1Wizard_ssid","`~!@#$%^&amp;*()-_=+|{};:,.?/",LANG_LOCALE['11354']) == false)
		return false;

    if (document.getElementById('tf1Wizard_securityOpt').value == '4')   {
        wpaString = document.getElementById('tf1Wizard_wpaPass').value
        if (wpaString.length < 8 || wpaString.length > 63){
            alert(LANG_LOCALE['12420']);
            return false;
        }
    }
	
    if (document.getElementById('tf1Wizard_securityOpt').value == '2')   {
        wepString = document.getElementById('tf1Wizard_wepPass').value
        if (wepString.length != 13){
            alert(LANG_LOCALE['12416']);
            return false;
        }


    if ($('#tf1Wizard_mode').is(':disabled') == false) 
        {
             if (document.getElementById('tf1Wizard_mode').value == '3' || document.getElementById('tf1Wizard_mode').value == '5')
                 {  
                 alert(LANG_LOCALE['10952']);
                 return false;
                 }
        }
    else {
        alert(LANG_LOCALE['10952']);
                 return false;
        }


     if ($('#tf1Wizard_mode1').is(':disabled') == false) 
        {
             if (document.getElementById('tf1Wizard_mode1').value == '4' || document.getElementById('tf1Wizard_mode1').value == '6')
                 {  
                 alert(LANG_LOCALE['10952']);
                 return false;
                 }
        }
     else {
        alert(LANG_LOCALE['10952']);
                 return false;
        }

    }


	showWizardDiv('tf1Wizard_divStep2', '');
	onloadCall();
	
if (wlanTableDataLoaded == false ) {
	
	oTable = $('#recordsData').dataTable({
					"bJQueryUI" : true,
					"bPaginate" : false,
					"bLengthChange" : false,
					"bFilter" : false,
					"bSort" : false,
					"bInfo" : false,
					"bAutoWidth" : false
				});
	
			wlanTableDataLoaded = true;	

	}  
}
function wlanStep2OnloadFn(){
	oTable = $('#recordsData').dataTable({
					"bJQueryUI" : true,
					"bPaginate" : false,
					"bLengthChange" : false,
					"bFilter" : false,
					"bSort" : false,
					"bInfo" : false,
					"bAutoWidth" : false
				});
}

function savewLan() {
	
		var macAddrPre = "tf1Wizard_macAddr";
		for (var i = 1; i <= 6; i++){ 
			macObj = document.getElementById(macAddrPre + i);
			if (macObj && macObj.value != '') {
				if (!(macAddrValidate (macObj.value, true, "", '', macObj))){
					macObj.focus ();
					return false;
				}
			}
		}
		displayProgressBar();
		setHiddenChks('tf1Wizard_wlanForm');
		var request = $.ajax({
		url: "platform.cgi?page=wizard.html",
		type: "POST",
		data: $("#tf1Wizard_wlanForm").serialize(),
		dataType: "html"
		});
	    wizardClearSpanWarning();

		request.done(function(msg) {
        hideProgressBar();
                     if (msg.search('errorWizard') != -1) {
                     $("#tf1Wizard_step3StatusMessage").html (msg);
                     }
                     else {
			 
			 showPreview ('tf1Wizard_previewDiv','tf1Wizard_divStep3');}
			 
		});
		request.fail(function(jqXHR, textStatus) {
			alert( LANG_LOCALE['13586']+": " + textStatus );
		});	
	
}

function openWlanStep3() {

	showWizardDiv('tf1Wizard_divStep3', '');
	
}

function openDateTimeStep1() {

	showWizardDiv('tf1Wizard_divStep1', '');
	
}

function openDateTimeStep2() {

	showWizardDiv('tf1Wizard_divStep2', '');
	
	dateTimeWizardStepTwoFn();
	
}


/* Dynamic DNS options starts */

function dynamicDnsOnloadFn() {

	onloadCall();
	
	dynamicDnsNtpServerTypeChange();

}
	

function dynamicDnsWizardOptionChange() {
	
	if (document.getElementById("tf1Wizard_dynamicDnsOption").value == 1) {
	
		$("#tf1Wizard_headingDynamicDnsOptionType").html(LANG_LOCALE['30373']);
        $("#tf1Wizard_step1WizardMessage").html($("#tf1Wizard_Option1Status").val());
		
	} else if (document.getElementById("tf1Wizard_dynamicDnsOption").value == 2) {
	
		$("#tf1Wizard_headingDynamicDnsOptionType").html(LANG_LOCALE['30518']);
        $("#tf1Wizard_step1WizardMessage").html($("#tf1Wizard_Option2Status").val());
		
	} else {
		
		$("#tf1Wizard_headingDynamicDnsOptionType").html(LANG_LOCALE['30519']);
        $("#tf1Wizard_step1WizardMessage").html($("#tf1Wizard_Option3Status").val());
		
	}
	
}



function dynamicDnsWizardSave() {
	
	var txtFieldIdArr = new Array();   
	txtFieldIdArr[0] = "tf1Wizard_userName,"+LANG_LOCALE['12144'];
	txtFieldIdArr[1] = "tf1Wizard_domainName,"+LANG_LOCALE['12020'];
	txtFieldIdArr[2] = "tf1Wizard_password,"+LANG_LOCALE['12074'];
	txtFieldIdArr[3] = "tf1Wizard_periodicUpdate,"+LANG_LOCALE['30570'];
	 
	
	if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

	if (!validateFQDN('tf1Wizard_domainName')) 
        return false;

	if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false)
        return false;
   
    var forceUpdateObj = document.getElementById('tf1Wizard_periodicUpdate');
    if (forceUpdateObj && !forceUpdateObj.disabled) {
        if (numericValueRangeCheck(forceUpdateObj, '', '', 1, 30, true, LANG_LOCALE['30616'], LANG_LOCALE['10670']) == false) 
            return false;
    }
		displayProgressBar();
	setHiddenChks('tf1Wizard_dynamicDnsForm');
		var request = $.ajax({
		url: "platform.cgi?page=wizard.html",
		type: "POST",
		data: $("#tf1Wizard_dynamicDnsForm").serialize(),
		dataType: "html"
		});
		wizardClearSpanWarning();
		request.done(function(msg) {
            hideProgressBar();
        if(msg.search("errorWizard") != -1) {
        
            $("#wizardDynamicDnsStatus").html(msg);

        }else{
            
			 		 		showPreview ('tf1Wizard_previewDiv','tf1Wizard_divStep1');
        }			 
		});
		request.fail(function(jqXHR, textStatus) {
			alert( LANG_LOCALE['13586']+": " + textStatus );
		});	
	
}

function dynamicDnsNtpServerTypeChange() {
	
	var ntpServerType = document.getElementById("tf1Wizard_ddnsNtpServerType").value;
	
	/*Disable all fields */
	
	fieldStateChangeWr('tf1Wizard_userName tf1Wizard_allowWildCards tf1Wizard_domainName tf1Wizard_password tf1Wizard_periodicUpdate', '', '', '');
    vidualDisplay('tf1Wizard_userName tf1Wizard_allowWildCards tf1Wizard_domainName tf1Wizard_password tf1Wizard_periodicUpdate', 'hide');
    vidualDisplay('break_userName break_allowWildCards break_domainName break_password break_periodicUpdate', 'hide');
	
	 switch (parseInt(ntpServerType, 10)){
		 
		 	case 2:/* DynDNS */		
			
				fieldStateChangeWr('', '', 'tf1Wizard_userName tf1Wizard_allowWildCards tf1Wizard_domainName tf1Wizard_password tf1Wizard_periodicUpdate', '');
	    		vidualDisplay('tf1Wizard_userName tf1Wizard_allowWildCards tf1Wizard_domainName tf1Wizard_password tf1Wizard_periodicUpdate', 'configRowWizard');
    			vidualDisplay('break_userName break_allowWildCards break_domainName break_password break_periodicUpdate', 'break');
			
			break;
			
			case 12:/* ORAY */
			
				fieldStateChangeWr('', '', 'tf1Wizard_userName tf1Wizard_password', '');
	    		vidualDisplay('tf1Wizard_userName tf1Wizard_password', 'configRowWizard');
    			vidualDisplay('break_userName break_password', 'break');
			
			
			break;
			
			case 3:/* DLINKDDNS */
			
				fieldStateChangeWr('', '', 'tf1Wizard_userName tf1Wizard_password tf1Wizard_domainName tf1Wizard_periodicUpdate', '');
	    		vidualDisplay('tf1Wizard_userName tf1Wizard_password tf1Wizard_domainName tf1Wizard_periodicUpdate', 'configRowWizard');
    			vidualDisplay('break_userName break_password break_domainName break_periodicUpdate', 'break');
			
			break;
			
			case 1:/* None */
			
			break;
		 
	 }
	
	
}


/* Dynamic DNS options ends */

/* Users wizard */

function validateWizardUser() {
	
	var txtFieldIdArr = new Array();   
	txtFieldIdArr[0] = "tf1Wizard_userName,"+LANG_LOCALE['12144'];
	txtFieldIdArr[1] = "tf1Wizard_password,"+LANG_LOCALE['12074'];
	txtFieldIdArr[2] = "tf1Wizard_reTypePassword,"+LANG_LOCALE['11980'];
	 
	
	if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    if (alphaNumericValueCheck ("tf1Wizard_userName", '', '') == false)    
        return false;
		
	if (document.getElementById("tf1Wizard_password").value != document.getElementById("tf1Wizard_reTypePassword").value ) {
		
		alert(LANG_LOCALE['11904']);
		
		return false;
	}
	displayProgressBar();
	var request = $.ajax({
		url: "platform.cgi?page=wizard.html",
		type: "POST",
		data: $("#tf1Wizard_usersForm").serialize(),
		dataType: "html"
		});
	 	wizardClearSpanWarning();	

		request.done(function(msg) {             
			hideProgressBar();
             
                if (msg.search('errorWizard') != -1) {
                     $("#tf1Wizard_Step1StatusMessage").html (msg);
                } else {			 
			             showPreview ('tf1Wizard_previewDiv','tf1Wizard_divStep1');
                }
			 
		});
		request.fail(function(jqXHR, textStatus) {
			alert( LANG_LOCALE['13586']+": " + textStatus );
		});	
	
	
}

/*
var NASelVals = [{"value":"5", "text": "(GMT-08:00)   Pacific Time (US   and Canada)","region":"North America"},{"value":"6", "text": "Mountain Time (US   and Canada)","region":"North America"}];

var SASelVals = [{"value":"13", "text": "(GMT-06:00)   Central Time (US   and Canada)","region":"South America"},{"value":"14", "text": "(GMT-06:00)   Central America","region":"South America"}];

var AsiaSelVals = [{"value":"64", "text": "(GMT+05:30)   Chennai Kolkata Mumbai New Delhi","region":"Asia"}];

var EuropeSelVals = [{"value":"33", "text": "(GMT)   Greenwich Mean Time : Dublin Edinburgh Lisbon London","region":"Europe"}];

var AfricaSelVals = [{"value":"39", "text": "West Central Africa","region":"Africa"}];

var AustraliaSelVals = [{"value":"75", "text": "(GMT+08:00)   Perth","region":"Australia"}];

*/

var NASelVals = [
					 {"value":"0", "text": LANG_LOCALE['13719'],"region":" "},
					 {"value":"1", "text": LANG_LOCALE['13720'],"region":"North America"},
					 {"value":"2", "text": LANG_LOCALE['13721'],"region":"North America"},
					 {"value":"3", "text": LANG_LOCALE['13722'],"region":"North America"},
					 {"value":"4", "text": LANG_LOCALE['13723'],"region":"North America"},
					 {"value":"5", "text": LANG_LOCALE['13724'],"region":"North America"},
					 {"value":"6", "text": LANG_LOCALE['13725'],"region":"North America"},
					 {"value":"7", "text": LANG_LOCALE['13726'],"region":"North America"},
					 {"value":"8", "text": LANG_LOCALE['13727'],"region":"North America"},
					 {"value":"9", "text": LANG_LOCALE['13728'],"region":"North America"},
					 {"value":"10", "text": LANG_LOCALE['13729'],"region":"North America"},
					 {"value":"11", "text": LANG_LOCALE['13730'],"region":"North America"},
					 {"value":"12", "text": LANG_LOCALE['13731'],"region":"North America"},
					 {"value":"13", "text": LANG_LOCALE['13732'],"region":"North America"},
					 {"value":"14", "text": LANG_LOCALE['13733'],"region":"North America"},
					 {"value":"15", "text": LANG_LOCALE['13734'],"region":"North America"},
					 {"value":"16", "text": LANG_LOCALE['13735'],"region":"North America"},
					 {"value":"22", "text": LANG_LOCALE['13741'],"region":"North America"},
					 {"value":"23", "text": LANG_LOCALE['13742'],"region":"North America"}
				 ];
var SASelVals = [
					 {"value":"17", "text": LANG_LOCALE['13736'],"region":"South America"},
					 {"value":"18", "text": LANG_LOCALE['13737'],"region":"South America"},
					 {"value":"19", "text": LANG_LOCALE['13738'],"region":"South America"},
					 {"value":"20", "text": LANG_LOCALE['13739'],"region":"South America"},
					 {"value":"21", "text": LANG_LOCALE['13740'],"region":"South America"},
					 {"value":"24", "text": LANG_LOCALE['13743'],"region":"South America"},
					 {"value":"26", "text": LANG_LOCALE['13745'],"region":"South America"},
					 {"value":"27", "text": LANG_LOCALE['13746'],"region":"South America"},
					 {"value":"28", "text": LANG_LOCALE['13747'],"region":"South America"}
				 
				 ];

var AsiaSelVals = [
				      {"value":"40", "text": LANG_LOCALE['13759'],"region":"Asia"},
					  {"value":"42", "text": LANG_LOCALE['13761'],"region":"Asia"}, 
					  {"value":"46", "text": LANG_LOCALE['13765'],"region":"Asia"},
					  {"value":"47", "text": LANG_LOCALE['13766'],"region":"Asia"},
					  {"value":"49", "text": LANG_LOCALE['13768'],"region":"Asia"},
					  {"value":"50", "text": LANG_LOCALE['13769'],"region":"Asia"},
					  {"value":"51", "text": LANG_LOCALE['13770'],"region":"Asia"},
					  {"value":"54", "text": LANG_LOCALE['13773'],"region":"Asia"},
					  {"value":"55", "text": LANG_LOCALE['13774'],"region":"Asia"},
					  {"value":"56", "text": LANG_LOCALE['13775'],"region":"Europe, asia"},
					  {"value":"59", "text": LANG_LOCALE['13778'],"region":"Asia"},
					  {"value":"60", "text": LANG_LOCALE['13779'],"region":"Asia"},
					  {"value":"61", "text": LANG_LOCALE['13780'],"region":"Asia"},
					  {"value":"62", "text": LANG_LOCALE['13781'],"region":"Asia"},
					  {"value":"63", "text": LANG_LOCALE['13782'],"region":"Asia"},
					  {"value":"64", "text": LANG_LOCALE['13783'],"region":"Asia"},
					  {"value":"65", "text": LANG_LOCALE['13784'],"region":"Asia"},
					  {"value":"66", "text": LANG_LOCALE['13785'],"region":"Asia"},
					  {"value":"67", "text": LANG_LOCALE['13786'],"region":"Asia"},
					  {"value":"68", "text": LANG_LOCALE['13787'],"region":"Asia"},
					  {"value":"69", "text": LANG_LOCALE['13788'],"region":"Asia"},
					  {"value":"70", "text": LANG_LOCALE['13789'],"region":"Asia"},
					  {"value":"71", "text": LANG_LOCALE['13790'],"region":"Asia"},
					  {"value":"72", "text": LANG_LOCALE['13791'],"region":"Asia"},
					  {"value":"73", "text": LANG_LOCALE['13792'],"region":"Europe, Asia"},
					  {"value":"74", "text": LANG_LOCALE['13793'],"region":"Asia"},
					  {"value":"76", "text": LANG_LOCALE['13795'],"region":"Asia"},
					  {"value":"77", "text": LANG_LOCALE['13796'],"region":"Asia"},
					  {"value":"78", "text": LANG_LOCALE['13797'],"region":"Asia"},
					  {"value":"79", "text": LANG_LOCALE['13798'],"region":"Asia"},
					  {"value":"86", "text": LANG_LOCALE['13805'],"region":"Asia"}
				   ];

var EuropeSelVals = [
					  {"value":"29", "text": LANG_LOCALE['13748'],"region":"Europe"},
					  {"value":"31", "text": LANG_LOCALE['13750'],"region":"Europe"},
					  {"value":"33", "text": LANG_LOCALE['13752'],"region":"Europe"},
					  {"value":"34", "text": LANG_LOCALE['13753'],"region":"Europe"},
					  {"value":"35", "text": LANG_LOCALE['13754'],"region":"Europe"},
					  {"value":"36", "text": LANG_LOCALE['13755'],"region":"Europe"},
					  {"value":"37", "text": LANG_LOCALE['13756'],"region":"Europe"},
					  {"value":"38", "text": LANG_LOCALE['13757'],"region":"Europe"},
					  {"value":"41", "text": LANG_LOCALE['13760'],"region":"Europe"},
					  {"value":"45", "text": LANG_LOCALE['13764'],"region":"Europe"},
					  {"value":"51", "text": LANG_LOCALE['13770'],"region":"Eurpe"},
					  {"value":"53", "text": LANG_LOCALE['13772'],"region":"Europe"},
					  {"value":"56", "text": LANG_LOCALE['13775'],"region":"Europe, asia"},
					  {"value":"57", "text": LANG_LOCALE['13776'],"region":"Europe"},
					  {"value":"71", "text": LANG_LOCALE['13790'],"region":"Europe"},
					  {"value":"79", "text": LANG_LOCALE['13798'],"region":"Europe, Asia"},
					  {"value":"86", "text": LANG_LOCALE['13805'],"region":"Europe, Asia"},
  					  {"value":"67", "text": LANG_LOCALE['13786'],"region":"Europe"},
					  {"value":"73", "text": LANG_LOCALE['13792'],"region":"Europe"},
					  {"value":"79", "text": LANG_LOCALE['13798'],"region":"Europe"},
					  {"value":"86", "text": LANG_LOCALE['13805'],"region":"Europe"}					  
					 ];

var AfricaSelVals = [
					   {"value":"30", "text": LANG_LOCALE['13749'],"region":"Africa"},
					   {"value":"32", "text": LANG_LOCALE['13751'],"region":"Africa"},
					   {"value":"39", "text": LANG_LOCALE['13758'],"region":"Africa"},
					   {"value":"43", "text": LANG_LOCALE['13762'],"region":"Africa"},
					   {"value":"44", "text": LANG_LOCALE['13763'],"region":"Africa"},
					   {"value":"48", "text": LANG_LOCALE['13767'],"region":"Africa"},
					   {"value":"52", "text": LANG_LOCALE['13771'],"region":"Africa"},
					   {"value":"58", "text": LANG_LOCALE['13777'],"region":"Africa"}					 
					 ];

var AustraliaSelVals = [
						 {"value":"75", "text": LANG_LOCALE['13794'],"region":"Australia"},
						 {"value":"80", "text": LANG_LOCALE['13799'],"region":"Australia"},
						 {"value":"81", "text": LANG_LOCALE['13800'],"region":"Australia"},
						 {"value":"82", "text": LANG_LOCALE['13801'],"region":"Australia"},
						 {"value":"83", "text": LANG_LOCALE['13802'],"region":"Australia"},
						 {"value":"84", "text": LANG_LOCALE['13803'],"region":"Australia"},
						 {"value":"85", "text": LANG_LOCALE['13804'],"region":"Australia"},
						 {"value":"87", "text": LANG_LOCALE['13806'],"region":"Australia"},
						 {"value":"88", "text": LANG_LOCALE['13807'],"region":"Australia"},
						 {"value":"89", "text": LANG_LOCALE['13809'],"region":"Australia"},
						 {"value":"90", "text": LANG_LOCALE['13810'],"region":"Australia"},
						 {"value":"91", "text": LANG_LOCALE['13811'],"region":"Australia"}						
						];

/* Date Time Picker */


function loadWizardDateTimeImage(imageLocation)

{

 if (imageLocation == "North America") {	  
	
	 $("#anchorImage").css('backgroundPosition', '0px 0px');

		$("#tf1Wizard_city option").remove();
		$.each(NASelVals, function(i){
			$("#tf1Wizard_city").append($("<option></option>")
										.attr("value", NASelVals[i]["value"])
										.text(NASelVals[i]["text"]));
		});
	 
	 }
	if (imageLocation == "South America") {	  
	
	 $("#anchorImage").css('backgroundPosition', '0px -200px');

		$("#tf1Wizard_city option").remove();

		$.each(SASelVals, function(i){

			$("#tf1Wizard_city").append($("<option></option>")
										.attr("value", SASelVals[i]["value"])
										.text(SASelVals[i]["text"]));
		});
	 
	 }
	 
	 if (imageLocation == "Australia") {	  
	
	 	$("#anchorImage").css('backgroundPosition', '0px -1000px');

		$("#tf1Wizard_city option").remove();

		$.each(AustraliaSelVals, function(i){

			$("#tf1Wizard_city").append($("<option></option>")
										.attr("value", AustraliaSelVals[i]["value"])
										.text(AustraliaSelVals[i]["text"]));
		});
	
	 
	 }
	  if (imageLocation == "Asia") {	  
	
	 $("#anchorImage").css('backgroundPosition', '0px -400px');

		$("#tf1Wizard_city option").remove();

		$.each(AsiaSelVals, function(i){
			$("#tf1Wizard_city").append($("<option></option>")
										.attr("value", AsiaSelVals[i]["value"])
										.text(AsiaSelVals[i]["text"]));
		});
	 
	 }
	  if (imageLocation == "Europe") {	  
	
	 		$("#anchorImage").css('backgroundPosition', '0px -800px');

			$("#tf1Wizard_city option").remove();

			$.each(EuropeSelVals, function(i){

				$("#tf1Wizard_city").append($("<option></option>")
											.attr("value", EuropeSelVals[i]["value"])
											.text(EuropeSelVals[i]["text"]));
			});
	 
	 }
	 
	 
	 if (imageLocation == "Africa") {	  
	
	 $("#anchorImage").css('backgroundPosition', '0px -600px');

		$("#tf1Wizard_city option").remove();

			$.each(AfricaSelVals, function(i){

				$("#tf1Wizard_city").append($("<option></option>")
											.attr("value", AfricaSelVals[i]["value"])
											.text(AfricaSelVals[i]["text"]));
			});
	 
	 }
	
	 $("#tf1Wizard_regionSelected").html(imageLocation);

}

function mouseOverWizardDateTimeImage(imageLocation)

{

 if (imageLocation == "North America") {	  
	
	 $("#anchorImage").css('backgroundPosition', '0px 0px');	
	 
	 }
	if (imageLocation == "South America") {	  
	
	 $("#anchorImage").css('backgroundPosition', '0px -200px');		
	 
	 }
	 
	 if (imageLocation == "Australia") {	  
	
	 	$("#anchorImage").css('backgroundPosition', '0px -1000px');		
	 
	 }
	  if (imageLocation == "Asia") {	  
	
	 $("#anchorImage").css('backgroundPosition', '0px -400px');		
	 
	 }
	  if (imageLocation == "Europe") {	  
	
	 		$("#anchorImage").css('backgroundPosition', '0px -800px');
		
	 }
	 
	 
	 if (imageLocation == "Africa") {	  
	
	 $("#anchorImage").css('backgroundPosition', '0px -600px');
	 
	 }

}

function dateTimeWizardStepOneFn() {

	var windowWidth = ($(window).width() - 720) / 2;
	$(".configDialogWizard").css("left", windowWidth);
	$("#tf1Wizard_dialogWizard").addClass("configDialog");
	onloadCall();
	$("#Map area").mouseover(function(){
		 var region = $(this).attr("region");		
	});
  var tzValue = $("#tf1Wizard_timezoneHidden").val();

	if($("#tf1Wizard_timezoneHidden").val() != ""){		
		tzValue = tzValue.toString();		
		var selectedRegion = "";
        var selectedTimeZone = "";

		jQuery.each(NASelVals,function(){
			  var thisObject = this;					 
				if (thisObject.value == tzValue) {
				 selectedRegion = thisObject.region;
				 selectedTimeZone = thisObject.text;
			 }
		});

	if (selectedRegion == "") {			
			jQuery.each(SASelVals,function(){
				var thisObject = this;
				if (thisObject.value == tzValue) {
				 selectedRegion = thisObject.region;
				 selectedTimeZone = thisObject.text;
			 }
		});
	}

	if (selectedRegion == "") {
			
			jQuery.each(AsiaSelVals,function(){
				var thisObject = this;
				if (thisObject.value == tzValue) {
				 selectedRegion = thisObject.region;
				 selectedTimeZone = thisObject.text;
			
			 }
		});
	}

 if (selectedRegion == "") {
			
			jQuery.each(EuropeSelVals,function(){
				var thisObject = this;
				if (thisObject.value == tzValue) {
				 selectedRegion = thisObject.region;
				 selectedTimeZone = thisObject.text;
			 }
		});
	}

if (selectedRegion == "") {
			
			jQuery.each(AfricaSelVals,function(){
				var thisObject = this;
				if (thisObject.value == tzValue) {
				 selectedRegion = thisObject.region;
				 selectedTimeZone = thisObject.text;
			 }
		});
	}

if (selectedRegion == "") {
			
			jQuery.each(AustraliaSelVals,function(){
				var thisObject = this;
				if (thisObject.value == tzValue) {
				 selectedRegion = thisObject.region;
				 selectedTimeZone = thisObject.text;
			 }
		});
	}

	$("#tf1Wizard_regionSelected").html(selectedRegion);
	$("#tf1Wizard_Step1CurrentHeading").html(LANG_LOCALE['30396']+" "+ selectedTimeZone);
	loadWizardDateTimeImage(selectedRegion);
  $("#tf1Wizard_city").val(tzValue);


	}

	/* bind the functions mouseover and mouseout */

	$("#Map area").each(function(){

		$(this).mouseover(function(){		
				mouseOverWizardDateTimeImage($(this).attr("region"));		});

		$(this).mouseout(function(){	
			mouseOverWizardDateTimeImage($("#tf1Wizard_regionSelected").html());
		});
	});

}



function dateTimeWizardStepTwoFn() {
	
	
	
	var windowWidth = ($(window).width() - 720) / 2;
	$(".configDialogWizard").css("left", windowWidth);
	
	onloadCall (dateTimeStep2NtpserverImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRowWizard', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});

	
	 disableTextFieldByAnchorClickWizard("tf1Wizard_ntpServer","tf1Wizard_dateTimePickerValue tf1Wizard_dateTimePicker",'break_dateTimePickerValue break_dateTimePicker', "tf1Wizard_headingManualTimeSet");
			enableTextFieldByAnchorClickWizard("tf1Wizard_ntpServer","tf1Wizard_ntpServerType tf1Wizard_timeSynchronize tf1Wizard_PrimaryNTPServer tf1Wizard_SecondaryNTPServer","break_ntpServerType break_timeSynchronize break_PrimaryNTPServer break_SecondaryNTPServer");

if($("#tf1Wizard_ntpServerType").is(':disabled') == false )
			 {
				NtpSvrTypeWizardCheck(); 
			 }
	
	
	var curr = new Date().getFullYear();
	var opt = {}
		opt.datetime = {
			preset : 'datetime',
			minDate : new Date(2000, 3, 10, 9, 22),
			maxDate : new Date(2035, 11, 31, 23, 59),
			stepMinute : 1
		};
		$('#tf1Wizard_dateTimePicker').val($('#tf1Wizard_dateTimePickerValue').val());
		$('#tf1Wizard_dateTimePickerBlock').remove();
		$('#tf1Wizard_dateTimePicker').scroller('destroy').scroller($.extend(opt["datetime"], {
			mode : "scroller",
			display : "inline",
			cusotmDivId: "tf1Wizard_dateTimePickerBlock"
		}));
	storeDateTimeFormValues();
}

function onchangeWizardDateTimeValue(){
	$('#tf1Wizard_dateTimePickerValue').val($('#tf1Wizard_dateTimePicker').val());
}

function storeDateTimeFormValues(){	
	$(".stepOne").hide();
	$(".stepTwo").show();
}
/**
 * This function calls when user clicks on NTP Server Type
 * OnClick validation
 * @method NtpSvrTypeCheck
 * @param data - Type of radio
 */
function NtpSvrTypeWizardCheck(){
	var selectedValue = document.getElementById('tf1Wizard_ntpServerType').value;
    if (!selectedValue) 
        return;
    
    switch (parseInt(selectedValue, 10)) {
        case 1: /* Default */
            fieldStateChangeWr('tf1Wizard_PrimaryNTPServer tf1Wizard_SecondaryNTPServer', '', '', '');
            vidualDisplay('tf1Wizard_PrimaryNTPServer tf1Wizard_SecondaryNTPServer', 'hide');
            vidualDisplay('break_PrimaryNTPServer break_SecondaryNTPServer', 'hide');
            break;
            
        case 2: /* Custom */
            fieldStateChangeWr('', '', 'tf1Wizard_PrimaryNTPServer tf1Wizard_SecondaryNTPServer', '');
            vidualDisplay('tf1Wizard_PrimaryNTPServer tf1Wizard_SecondaryNTPServer', 'configRowWizard');
            vidualDisplay('break_PrimaryNTPServer break_SecondaryNTPServer', 'break');
            break;
    }
}

function dateTimeStep2NtpserverImageClick(data, thisObj) { 
	onAnchorToggle (data);
    var imgId=thisObj.id;
	 switch(imgId){
    	case 'tf1Wizard_ntpServer': 		
			disableTextFieldByAnchorClickWizard(imgId,"tf1Wizard_dateTimePickerValue tf1Wizard_dateTimePicker",'break_dateTimePickerValue break_dateTimePicker',  "tf1Wizard_headingManualTimeSet");
			enableTextFieldByAnchorClickWizard("tf1Wizard_ntpServer","tf1Wizard_ntpServerType tf1Wizard_timeSynchronize tf1Wizard_PrimaryNTPServer tf1Wizard_SecondaryNTPServer","break_ntpServerType break_timeSynchronize break_PrimaryNTPServer break_SecondaryNTPServer");
			
			 if($("#tf1Wizard_ntpServerType").is(':disabled') == false )
			 {
				NtpSvrTypeWizardCheck(); 
			 }
			
		break;
		 
	 }
}

function dateAndTimeWizardSave() {
		
	var txtFieldIdArr = new Array();   
	txtFieldIdArr[0] = "tf1Wizard_PrimaryNTPServer,"+LANG_LOCALE['12092'];
	txtFieldIdArr[1] = "tf1Wizard_SecondaryNTPServer,"+LANG_LOCALE['12110'];
	txtFieldIdArr[2] = "tf1Wizard_dateTimePickerValue,"+LANG_LOCALE['12444'];
	txtFieldIdArr[3] = "tf1Wizard_timeSynchronize,"+LANG_LOCALE['12135'];	 
	
	if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

	if (ipaddrValidateWizard('tf1Wizard_PrimaryNTPServer') == false) 
        return false;
    
  if (ipaddrValidateWizard('tf1Wizard_SecondaryNTPServer') == false) 
        return false;
    
  var reSyncObj = document.getElementById("tf1Wizard_timeSynchronize");
  if (!numericValueRangeCheck(reSyncObj, '', '', 5, 1440, true, LANG_LOCALE['11372']+':', '')) 
        return false;

displayProgressBar();
	setHiddenChks('tf1Wizard_dateTimeForm');
	var request = $.ajax({
		url: "platform.cgi?page=wizard.html",
		type: "POST",
		data: $("#tf1Wizard_dateTimeForm").serialize(),
		dataType: "html"
		});
		
        wizardClearSpanWarning();

		request.done(function(msg) {
			 
			 hideProgressBar();
                if (msg.search('errorWizard') != -1) {
                     $("#tf1Wizard_step2StatusMessage").html (msg);
                } else {			 
			        showPreview ('tf1Wizard_previewDiv','tf1Wizard_divStep2');
                }

			 
		});
		request.fail(function(jqXHR, textStatus) {
			alert( LANG_LOCALE['13586']+": " + textStatus );
		});	
	
	
}

function ipaddrValidateWizard(ipAddr){
    var lastOctateVal = 0;
    var ipAddrObj = document.getElementById(ipAddr);
    if (!ipAddrObj || ipAddrObj.disabled) 
        return true;
    var ipAddrObjArr = (ipAddrObj.value).split(".");
    if (ipAddrObjArr.length == 1) {
        alert(LANG_LOCALE['11283']);
        ipAddrObj.focus();
        return false;
    }
    if (ipAddrObjArr.length) 
        lastOctateVal = ipAddrObjArr[ipAddrObjArr.length - 1];
    if (!isNaN(lastOctateVal)) {
        if (ipv4AddrValidate(ipAddrObj, 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031']+" ", true) == false) {
            ipAddrObj.focus();
            return false;
        }
    }
    else {
        if (checkDomainExtension(lastOctateVal) == false) {
            alert(LANG_LOCALE['12003']);
            return false;
        }
        if (ipAddrObj.value.length > 253 || ipAddrObj.value.length < 1) {
            alert(LANG_LOCALE['13061']);
            return false;
        }
        if (checkEachNodeLength(ipAddrObjArr) == false) 
            return false;
        
        if (checkHostName(ipAddr, true, LANG_LOCALE['11282']+': ', false) == false) 
            return false;
        return true;
    }
}
var domainNameExt = new Array('.com', '.net', '.aero', '.asia', '.cat', '.jobs', '.org', '.biz', '.coop', '.info', '.museum', '.name', '.pro', '.tel', '.travel', '.edu', '.gov', '.int', '.mil', '.mobi', '.ac', '.ad', '.ae', '.af', '.ag', '.ai', '.al', '.am', '.an', '.ao', '.aq', '.ar', '.as', '.at', '.au', '.aw', '.ax', '.az', '.ba', '.bb', '.bd', '.be', '.bf', '.bg', '.bh', '.bi', '.bj', '.bm', '.bn', '.bo', '.br', '.bs', '.bt', '.bv', '.bw', '.by', '.bz', '.ca', '.cc', '.cd', '.cf', '.cg', '.ch', '.ci', '.ck', '.cl', '.cm', '.cn', '.co', '.cr', '.cu', '.cv', '.cx', '.cy', '.cz', '.de', '.dj', '.dk', '.dm', '.do', '.dz', '.ec', '.ee', '.eg', '.er', '.es', '.et', '.eu', '.fi', '.fj', '.fk', '.fm', '.fo', '.fr', '.ga', '.gb', '.gd', '.ge', '.gf', '.gg', '.gh', '.gi', '.gl', '.gm', '.gn', '.gp', '.gq', '.gr', '.gs', '.gt', '.gu', '.gw', '.gy', '.hk', '.hm', '.hn', '.hr', '.ht', '.hu', '.id', '.ie', '.il', '.im', '.in', '.io', '.iq', '.ir', '.is', '.it', '.je', '.jm', '.jo', '.jp', '.ke', '.kg', '.kh', '.ki', '.km', '.kn', '.kp', '.kr', '.kw', '.ky', '.kz', '.la', '.lb', '.lc', '.li', '.lk', '.lr', '.ls', '.lt', '.lu', '.lv', '.ly', '.ma', '.mc', '.md', '.me', '.mg', '.mh', '.mk', '.ml', '.mm', '.mn', '.mo', '.mp', '.mq', '.mr', '.ms', '.mt', '.mu', '.mv', '.mw', '.mx', '.my', '.mz', '.na', '.nc', '.ne', '.nf', '.ng', '.ni', '.nl', '.no', '.np', '.nr', '.nu', '.nz', '.om', '.pa', '.pe', '.pf', '.pg', '.ph', '.pk', '.pl', '.pm', '.pn', '.pr', '.ps', '.pt', '.pw', '.py', '.qa', '.re', '.ro', '.rw', '.ru', '.sa', '.sb', '.sc', '.sd', '.se', '.sg', '.sh', '.si', '.sj', '.sk', '.sl', '.sm', '.sn', '.so', '.sr', '.st', '.sv', '.sy', '.sz', '.tc', '.td', '.tf', '.tg', '.th', '.tj', '.tk', '.tm', '.tn', '.to', '.tp', '.tr', '.tt', '.tv', '.tw', '.tz', '.ua', '.ug', '.uk', '.um', '.us', '.uy', '.uz', '.va', '.vc', '.ve', '.vg', '.vi', '.vn', '.vu', '.ws', '.wf', '.ye', '.yt', '.yu', '.za', '.zm', '.zw');
/*
 function: checkEachNodeLength
 parameters: Array of nodes in a domain name.
 purpose : Checks is number of characters in a node of a domain exceeds 63 characters.
 return : true or false;
 @param nodeArray - ipaddress/domain name
 */
function checkEachNodeLength(nodeArray){
    for (var i = 0; i <= nodeArray.length - 1; i++) {
        var node = nodeArray[i];
        if (node.length > 63) {
            alert(LANG_LOCALE['10855'])
            return false;
        }
    }
    return true;
}

/*
 function: checkDomainExtension
 parameters: last octate value of domain name.
 purpose : checks if the extension falls in the specified domains.
 return : true or false;
 @param lastOctateVal - extention
 */
function checkDomainExtension(lastOctateVal){
    var ext = "." + lastOctateVal;
    for (var i = 0; i <= domainNameExt.length - 1; i++) {
        if (ext == domainNameExt[i]) 
            return true;
    }
    return false;
}

/* security Wizard starts */

function wizardSecurityOnLoadFn() {
	onloadCall();
	
}

function openWizardSecurityStep2() {

	wizardClearSpanWarning();
	
	if (document.getElementById("tf1Wizard_selVPNType").value == 2){
	
		$("#tf1Wizard_btNextStep2").val(LANG_LOCALE['12758']);
		
	} else {
		$("#tf1Wizard_btNextStep2").val(LANG_LOCALE['11779']);		
	}
	
	showWizardDiv('tf1Wizard_divStep2', '');
}


function wizardPeerOnChange() {
	
	if (document.getElementById("tf1Wizard_selVPNType").value == 2){
	
		$("#tf1Wizard_btNextStep2").val(LANG_LOCALE['12758']);
    $(".lastStep").html('2');
		
		/*
		IP Address : 1
		FQDN : 2
		*/
		document.getElementById("tf1Wizard_remoteGatewayType").remove(0);
		
	} else {
		$("#tf1Wizard_btNextStep2").val(LANG_LOCALE['11779']);
		$(".lastStep").html('3');
		var selObject = document.getElementById("tf1Wizard_remoteGatewayType");
		selObject.length = 0;
		selObject.options[selObject.options.length] = new Option(LANG_LOCALE['11387'], '1');
		selObject.options[selObject.options.length] = new Option(LANG_LOCALE['14125'], '2');
	}

}

function openWizardSecurityStep1() {
	
	showWizardDiv('tf1Wizard_divStep1', '');
}

function openWizardSecurityStep3() {

	var txtFieldIdArr = new Array();   
	txtFieldIdArr[0] = "tf1Wizard_connectionName,"+LANG_LOCALE['11981'];
	txtFieldIdArr[1] = "tf1Wizard_preSharedKey,"+LANG_LOCALE['12089'];
	txtFieldIdArr[2] = "tf1Wizard_remoteIpAddr,"+LANG_LOCALE['12446'];
	txtFieldIdArr[3] = "tf1Wizard_localIpAddr,"+LANG_LOCALE['12045'];
	 
	if (txtFieldArrayCheck(txtFieldIdArr) == false) 
  	return false;

    if (alphaNumericValueCheck ("tf1Wizard_connectionName", '') == false)
        return false;

	var preshareObj=document.getElementById('tf1Wizard_preSharedKey');
	if(preshareObj&& !preshareObj.disbaled){
		if(fieldLengthCheck('tf1Wizard_preSharedKey', 8, 49, LANG_LOCALE['11323']) == false)
			return false
	}

    if (alphaNumericValueCheck ("tf1Wizard_preSharedKey", '`~!@#$%^&*()-_+=|{}[]:;.,<>?/\'', '') == false)    
        return false;

	if (IPorFQDNCheckRemote() == false) 
        return false;
    
  if (IPorFQDNCheckLocal() == false) 
        return false;


		if ( document.getElementById("tf1Wizard_selVPNType").value == 2 ) {
			
			wizardSecuritySave();
				
		} else {
	
			showWizardDiv('tf1Wizard_divStep3', 'showhideFieldsforIPV6');
			
		}
}
function showhideFieldsforIPV6(){
	var protocolValue = comboSelectedValueGet ('tf1Wizard_selProtocolVer');
  if(protocolValue == 1){
		fieldStateChangeWr ('tf1Wizard_remotePrefixLength tf1Wizard_localNetPrefixLength', '', 'tf1Wizard_remoteNetSubnetMask tf1Wizard_localNetSubnetMask', '');
    vidualDisplay ('tf1Wizard_remotePrefixLength tf1Wizard_localNetPrefixLength', 'hide');
    vidualDisplay ('break_remotePrefixLength break_localNetPrefixLength', 'hide');  

		vidualDisplay ('tf1Wizard_remoteNetSubnetMask tf1Wizard_localNetSubnetMask', 'configRowWizard');
		vidualDisplay ('break_remoteNetSubnetMask break_localNetSubnetMask', 'break');
	}else{
		fieldStateChangeWr ('tf1Wizard_remoteNetSubnetMask tf1Wizard_localNetSubnetMask', '', 'tf1Wizard_remotePrefixLength tf1Wizard_localNetPrefixLength', '');
		vidualDisplay ('tf1Wizard_remoteNetSubnetMask tf1Wizard_localNetSubnetMask', 'hide');
		vidualDisplay ('break_remoteNetSubnetMask break_localNetSubnetMask', 'hide');

    vidualDisplay ('tf1Wizard_remotePrefixLength tf1Wizard_localNetPrefixLength', 'configRowWizard');
    vidualDisplay ('break_remotePrefixLength break_localNetPrefixLength', 'break'); 
	}
}
function IPorFQDNCheckRemote (){		
    var selValue = comboSelectedValueGet('tf1Wizard_remoteGatewayType');        
    if (parseInt (selValue, 10) == 1){
				var protocolValue = comboSelectedValueGet ('tf1Wizard_selProtocolVer');
        if(protocolValue == 1){
            if (ipv4Validate ('tf1Wizard_remoteIpAddr', 'SN', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
            	return false;
        }else{
            if (ipv6Validate ('tf1Wizard_remoteIpAddr', false, true, '') == false)
		        	return false;
        }       
		}else{
       	var remoteEndpointFQDNTxtObj = document.getElementById ('tf1Wizard_remoteIpAddr');
       	if (remoteEndpointFQDNTxtObj && !remoteEndpointFQDNTxtObj.disabled && remoteEndpointFQDNTxtObj.value == ""){
           	alert(LANG_LOCALE['11262']);
           	remoteEndpointFQDNTxtObj.focus ();
           		return false;
				}
				if (validateFQDN ('tf1Wizard_remoteIpAddr') == false)
	        return false;
	}
	return true;
}

function IPorFQDNCheckLocal (){		
    var selValue = comboSelectedValueGet  ('tf1Wizard_localGatewayType');        
    if (parseInt (selValue, 10) == 1){
				var protocolValue = comboSelectedValueGet ('tf1Wizard_selProtocolVer');
        if(protocolValue == 1){
            if (ipv4Validate ('tf1Wizard_localIpAddr', 'SN', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
            	return false;
        }else{
            if (ipv6Validate ('tf1Wizard_localIpAddr', false, true, '') == false)
		        	return false;
        }       
		}else{
       	var remoteEndpointFQDNTxtObj = document.getElementById ('tf1Wizard_localIpAddr');
       	if (remoteEndpointFQDNTxtObj && !remoteEndpointFQDNTxtObj.disabled && remoteEndpointFQDNTxtObj.value == ""){
           	alert(LANG_LOCALE['11262']);
           	remoteEndpointFQDNTxtObj.focus ();
           		return false;
				}
				if (validateFQDN ('tf1Wizard_localIpAddr') == false)
	        return false;
	}
	return true;
}


function wizardSecuritySave() {


 if (document.getElementById("tf1Wizard_selVPNType").value == 1 ) {
	
	var txtFieldIdArr = new Array();   
	txtFieldIdArr[0] = "tf1Wizard_remoteNetworkIp,"+LANG_LOCALE['12101'];
	txtFieldIdArr[1] = "tf1Wizard_remoteNetSubnetMask,"+LANG_LOCALE['12102'];
	txtFieldIdArr[2] = "tf1Wizard_remotePrefixLength,"+LANG_LOCALE['12447'];
	txtFieldIdArr[3] = "tf1Wizard_localNetIPAddr,"+LANG_LOCALE['12046'];
	txtFieldIdArr[4] = "tf1Wizard_localNetSubnetMask,"+LANG_LOCALE['12047'];
	txtFieldIdArr[5] = "tf1Wizard_localNetPrefixLength,"+LANG_LOCALE['12445'];
	 
	if (txtFieldArrayCheck(txtFieldIdArr) == false) 
  	return false;	

	if (localSubnetIpCheck('tf1Wizard_remoteNetworkIp') == false) 
        return false;
	
	var remoteSubObj = document.getElementById ('tf1Wizard_remoteNetSubnetMask');
  if (remoteSubObj && !remoteSubObj.disabled){
		if (validNetMask ('tf1Wizard_remoteNetSubnetMask') == false)
    	return false; 
	}

	var remotePreObj = document.getElementById ('tf1Wizard_remotePrefixLength');
  if (remotePreObj && !remotePreObj.disabled){
		if (numericValueRangeCheck(document.getElementById('tf1Wizard_remotePrefixLength'), '', '', 0, 128,true, LANG_LOCALE['11335'], '') == false)
	    return false;
	}

	if (localSubnetIpCheck('tf1Wizard_localNetIPAddr') == false) 
        return false;

	var localSubObj = document.getElementById ('tf1Wizard_localNetSubnetMask');
  if (localSubObj && !localSubObj.disabled){
		if (validNetMask ('tf1Wizard_localNetSubnetMask') == false)
    	return false; 
	}

	var localPreObj = document.getElementById ('tf1Wizard_localNetPrefixLength');
  if (localPreObj && !localPreObj.disabled){
		if (numericValueRangeCheck(document.getElementById('tf1Wizard_localNetPrefixLength'), '', '', 0, 128,true, LANG_LOCALE['11294'], '') == false)
	    return false;
	}

}
displayProgressBar();
setHiddenChks('tf1Wizard_securityForm');

var request = $.ajax({
		url: "platform.cgi?page=wizard.html",
		type: "POST",
		data: $("#tf1Wizard_securityForm").serialize(),
		dataType: "html"
		});
		wizardClearSpanWarning();
		request.done(function(msg) {
            hideProgressBar();
                         if (msg.search('errorWizard') != -1) {
                              $("#tf1Wizard_step3SecurityStatusMsg").html(msg);
			      $("#tf1Wizard_step2StatusMessage").html(msg);
			 }else{
               				  
			 $("#tf1Wizard_divStep2").hide();
			 
			 showPreview ('tf1Wizard_previewDiv','tf1Wizard_divStep3');}
			 
		});
		request.fail(function(jqXHR, textStatus) {
			alert( LANG_LOCALE['13586']+": " + textStatus );
		});	
}

function IPAddrCheckSecWiz (txtId){		
	var protocolValue = comboSelectedValueGet ('tf1Wizard_selProtocolVer');
  if(protocolValue == 1){
	  if (ipv4Validate (txtId, 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
	   	return false;
  }else{
    if (ipv6Validate (txtId, false, true, '') == false)
	   	return false;
  }		
	return true;
}



/*function wizardDateTimeCitySelect(timeZoneId) {

	var tmpCities = document.getElementById("tf1Wizard_cityTmp");
	
	var getRegion = "";

	 for (i=0; i < tmpCities.length; i++) {
		
			 if (tmpCities.options[i].value == timeZoneId) {
		
				getRegion = 
			
		}
			  
	}

}*/

/* Controller wizard functions */

function controllerUserValidate() {


	var txtFieldIdArr = new Array();   	
  txtFieldIdArr[0] = "tf1Wizard_oldPassword,"+LANG_LOCALE['12069'];
	txtFieldIdArr[1] = "tf1Wizard_newPassword,"+LANG_LOCALE['12067'];
	txtFieldIdArr[2] = "tf1Wizard_reTypePassword,"+LANG_LOCALE['11980'];
   
	 
	
	if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
		
	if(alphaNumericValueCheck("tf1Wizard_userName", "_", LANG_LOCALE['30517'])== false)
		return false;
 var passObj = document.getElementById("tf1Wizard_newPassword");
 if (passObj && !passObj.disabled) {
	if (document.getElementById("tf1Wizard_newPassword").value != document.getElementById("tf1Wizard_reTypePassword").value ) {
		
		alert(LANG_LOCALE['11904']);
		
		return false;
	}

}

  var serverValidated = true;

	if ( serverValidated ) {

  $("#tf1Wizard_usersWizardDailogContent").hide();

	$("#tf1Wizard_internetConnectionWizardDailogContent").show();

 }
	

}


function controllerMoveToConnectionDetails() {
 
   
   if ($("#tf1Wizard_wlanIspType").val() == '') {
	  $("#internetWizardStatusMsgStep1").html('<font color="#ff0202">'+LANG_LOCALE['30508']+'</font>');
	return;   
   }
   $("#internetWizardStatusMsgStep1").html('');
   

	  $("#tf1Wizard_divStep1Internet").hide();
		$("#tf1Wizard_divStep2Internet").show();

	
		
	fieldStateChangeWr('', '', 'tf1Wizard_dnsIpMode tf1Wizard_secondaryDnsServer tf1Wizard_primaryDnsServer tf1Wizard_gateWayIpAddress tf1Wizard_macAddressSource tf1Wizard_macAddress tf1Wizard_macHostName tf1Wizard_loginName tf1Wizard_loginPassword tf1Wizard_reconnectMode tf1Wizard_addressMode tf1Wizard_ipSubnetMask tf1Wizard_serverIpAddress tf1Wizard_idleTime tf1Wizard_ipAddr', '');
    vidualDisplay('tf1Wizard_dnsIpMode tf1Wizard_secondaryDnsServer tf1Wizard_primaryDnsServer tf1Wizard_gateWayIpAddress tf1Wizard_macAddressSource tf1Wizard_macAddress tf1Wizard_macHostName tf1Wizard_loginName tf1Wizard_loginPassword tf1Wizard_reconnectMode tf1Wizard_addressMode tf1Wizard_ipSubnetMask tf1Wizard_serverIpAddress tf1Wizard_idleTime tf1Wizard_ipAddr', 'configRowWizard');
    vidualDisplay('break_dnsIpMode break_secondaryDnsServer break_primaryDnsServer break_gateWayIpAddress break_macAddressSource break_macAddress break_macHostName break_loginName break_loginPassword break_reconnectMode break_addressMode break_ipSubnetMask break_serverIpAddress break_idleTime break_ipAddr', 'break');
    

	
	 
        
	 if ($("#tf1Wizard_wlanIspType").val() == "1") {
	 
	 	 
		$("#tf1Wizard_headingConnectionType").html(LANG_LOCALE['30509']);

    $("#tf1Wizard_divStep2Internet div.wizardMessage").html(LANG_LOCALE['30510']);
		
		 
	 	fieldStateChangeWr('tf1Wizard_gateWayIpAddress tf1Wizard_loginName tf1Wizard_loginPassword tf1Wizard_reconnectMode tf1Wizard_addressMode tf1Wizard_ipSubnetMask tf1Wizard_serverIpAddress tf1Wizard_idleTime tf1Wizard_ipAddr', '', '', '');
        vidualDisplay('tf1Wizard_gateWayIpAddress tf1Wizard_loginName tf1Wizard_loginPassword tf1Wizard_reconnectMode tf1Wizard_addressMode tf1Wizard_ipSubnetMask tf1Wizard_serverIpAddress tf1Wizard_idleTime tf1Wizard_ipAddr', 'hide');
        vidualDisplay('break_gateWayIpAddress break_loginName break_loginPassword break_reconnectMode break_addressMode break_ipSubnetMask break_serverIpAddress break_idleTime break_ipAddr', 'hide');
        dhcpMacAddressCheck();
        internetConnectionDnsChange();
        
	 } else if ($("#tf1Wizard_wlanIspType").val() == "2") {

			 $("#tf1Wizard_divStep2Internet div.wizardMessage").html(LANG_LOCALE['30511']);
		 
		 	$("#tf1Wizard_headingConnectionType").html(LANG_LOCALE['30512']);
	 		   
	 	 	
	 		fieldStateChangeWr('tf1Wizard_ipaddress tf1Wizard_gateWayIpAddress tf1Wizard_macAddressSource tf1Wizard_macAddress tf1Wizard_macHostName', '', '', '');
        	vidualDisplay('tf1Wizard_ipaddress tf1Wizard_gateWayIpAddress tf1Wizard_macAddressSource tf1Wizard_macAddress tf1Wizard_macHostName', 'hide');
        	vidualDisplay('break_ipaddress break_gateWayIpAddress break_macAddressSource break_macAddress break_macHostName', 'hide');     
	 	    internetConnectionDnsChange();
	 	    internetConnectionReconnectModeChange();
	 	    internetConnectionAddressModeChange();
	 	    	 
	 } else if ($("#tf1Wizard_wlanIspType").val() == "3") 
	 {
	 	  	
		$("#tf1Wizard_headingConnectionType").html(LANG_LOCALE['12994']);

    $("#tf1Wizard_divStep2Internet div.wizardMessage").html(LANG_LOCALE['30513']);
		 
	 	fieldStateChangeWr('tf1Wizard_dnsIpMode tf1Wizard_macAddressSource tf1Wizard_macAddress tf1Wizard_macHostName tf1Wizard_loginName tf1Wizard_loginPassword tf1Wizard_reconnectMode tf1Wizard_addressMode tf1Wizard_serverIpAddress tf1Wizard_idleTime', '', '', '');
        vidualDisplay('tf1Wizard_dnsIpMode tf1Wizard_macAddressSource tf1Wizard_macAddress tf1Wizard_macHostName tf1Wizard_loginName tf1Wizard_loginPassword tf1Wizard_reconnectMode tf1Wizard_addressMode tf1Wizard_serverIpAddress tf1Wizard_idleTime', 'hide');
        vidualDisplay('break_dnsIpMode break_macAddressSource break_macAddress break_macHostName break_loginName break_loginPassword break_reconnectMode break_addressMode break_serverIpAddress break_idleTime', 'hide');
        
        
	} else if ($("#tf1Wizard_wlanIspType").val() == "4") {
	
		$("#tf1Wizard_divStep2Internet div.wizardMessage").html(LANG_LOCALE['30514']);
		
		 $("#tf1Wizard_headingConnectionType").html(LANG_LOCALE['30515']);
		
	 	fieldStateChangeWr('tf1Wizard_gateWayIpAddress tf1Wizard_serverIpAddress tf1Wizard_macAddressSource tf1Wizard_macAddress tf1Wizard_macHostName', '', '', '');
       	vidualDisplay('tf1Wizard_gateWayIpAddress tf1Wizard_serverIpAddress tf1Wizard_macAddressSource tf1Wizard_macAddress tf1Wizard_macHostName', 'hide');
       	vidualDisplay('break_gateWayIpAddress break_serverIpAddress break_macAddressSource break_macAddress break_macHostName', 'hide');     
		internetConnectionDnsChange();
		internetConnectionReconnectModeChange();
	 	internetConnectionAddressModeChange();
	 			
	} else if ($("#tf1Wizard_wlanIspType").val() == "5") {

    $("#tf1Wizard_divStep2Internet div.wizardMessage").html(LANG_LOCALE['30516']);
		 
		 $("#tf1Wizard_headingConnectionType").html(LANG_LOCALE['30520']);		
	 	fieldStateChangeWr('tf1Wizard_ipaddress tf1Wizard_gateWayIpAddress tf1Wizard_macAddressSource tf1Wizard_macAddress tf1Wizard_macHostName', '', '', '');
        vidualDisplay('tf1Wizard_ipaddress tf1Wizard_gateWayIpAddress tf1Wizard_macAddressSource tf1Wizard_macAddress tf1Wizard_macHostName', 'hide');
        vidualDisplay('break_ipaddress break_gateWayIpAddress break_macAddressSource break_macAddress break_macHostName', 'hide');
        internetConnectionDnsChange();
        internetConnectionReconnectModeChange();
	 	  internetConnectionAddressModeChange();
	}
			
}


function showControllerWizardDiv(divIdOPen,divIdClose,onloadfun) {
			$("#"+divIdClose).hide();
			$("#"+divIdOPen).show();
			if(onloadfun != '')
				eval(onloadfun+"()");
}


function controllerOnloadFn() {

	$(".connection-type").click(function(event) {	
		$(".connection-type").removeClass("enable-disable-off-wizard");
		$(".connection-type").removeClass("enable-disable-on-wizard");
		$(".connection-type").addClass("enable-disable-off-wizard");
		$(this).removeClass("enable-disable-off-wizard");
		$(this).addClass("enable-disable-on-wizard");
		$("#tf1Wizard_wlanIspType").val($(this).attr('db-id'));
		$("#internetWizardStatusMsgStep1").html('');  
	});	
	
	if($("#tf1Wizard_licenceStatus").val() == 0){
		$(".lastStep").html("8");
		$(".step").each(function( index ) {
				 if (parseInt($(this).html(),10) > 3) {
					var newIndex = parseInt($(this).html(),10) - 1;							
					$(this).html(newIndex);
				}
			});
		
	}
	 

onloadCall (wlanStep1ImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRowWizard', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
	
	enableTextFieldByAnchorClickWizard('tf1Wizard_state',"tf1Wizard_mode",'break_mode');	
	enableTextFieldByAnchorClickWizard('tf1Wizard_state1',"tf1Wizard_mode1",'break_mode1');
	wlanSecurityOptionChange();

	enableTextFieldByAnchorClickWizard("tf1Wizard_editPwd","tf1Wizard_oldPassword tf1Wizard_newPassword tf1Wizard_reTypePassword",'break_oldPassword break_newPassword break_reTypePassword');

	oTable = $('#recordsData').dataTable({
					"bJQueryUI" : true,
					"bPaginate" : false,
					"bLengthChange" : false,
					"bFilter" : false,
					"bSort" : false,
					"bInfo" : false,
					"bAutoWidth" : false
				});

/* Date Time */

$("#Map area").mouseover(function(){
		 var region = $(this).attr("region");		
	});
  var tzValue = $("#tf1Wizard_timezoneHidden").val();

	if($("#tf1Wizard_timezoneHidden").val() != ""){		
		tzValue = tzValue.toString();		
		var selectedRegion = "";
        var selectedTimeZone = "";

		jQuery.each(NASelVals,function(){
			  var thisObject = this;					 
				if (thisObject.value == tzValue) {
				 selectedRegion = thisObject.region;
				 selectedTimeZone = thisObject.text;
			 }
		});

	if (selectedRegion == "") {			
			jQuery.each(SASelVals,function(){
				var thisObject = this;
				if (thisObject.value == tzValue) {
				 selectedRegion = thisObject.region;
				 selectedTimeZone = thisObject.text;
			 }
		});
	}

	if (selectedRegion == "") {
			
			jQuery.each(AsiaSelVals,function(){
				var thisObject = this;
				if (thisObject.value == tzValue) {
				 selectedRegion = thisObject.region;
				 selectedTimeZone = thisObject.text;
			
			 }
		});
	}

 if (selectedRegion == "") {
			
			jQuery.each(EuropeSelVals,function(){
				var thisObject = this;
				if (thisObject.value == tzValue) {
				 selectedRegion = thisObject.region;
				 selectedTimeZone = thisObject.text;
			 }
		});
	}

if (selectedRegion == "") {
			
			jQuery.each(AfricaSelVals,function(){
				var thisObject = this;
				if (thisObject.value == tzValue) {
				 selectedRegion = thisObject.region;
				 selectedTimeZone = thisObject.text;
			 }
		});
	}

if (selectedRegion == "") {
			
			jQuery.each(AustraliaSelVals,function(){
				var thisObject = this;
				if (thisObject.value == tzValue) {
				 selectedRegion = thisObject.region;
				 selectedTimeZone = thisObject.text;
			 }
		});
	}

	$("#tf1Wizard_regionSelected").html(selectedRegion);
	$("#tf1Wizard_Step1CurrentHeading").html(LANG_LOCALE['30396']+" "+ selectedTimeZone);
	loadWizardDateTimeImage(selectedRegion);
  $("#tf1Wizard_city").val(tzValue);


	}

	/* bind the functions mouseover and mouseout */

	$("#Map area").each(function(){

		$(this).mouseover(function(){		
				mouseOverWizardDateTimeImage($(this).attr("region"));		});

		$(this).mouseout(function(){	
			mouseOverWizardDateTimeImage($("#tf1Wizard_regionSelected").html());
		});
	});

/* Date / Time */

}


function controllerDynamicDnsNtpServerTypeChange() {
	
	var ntpServerType = document.getElementById("tf1Wizard_ntpServerTypeDns").value;
	
	/*Disable all fields */
	
	fieldStateChangeWr('tf1Wizard_userName tf1Wizard_allowWildCards tf1Wizard_domainName tf1Wizard_password tf1Wizard_periodicUpdate', '', '', '');
    vidualDisplay('tf1Wizard_userName tf1Wizard_allowWildCards tf1Wizard_domainName tf1Wizard_password tf1Wizard_periodicUpdate', 'hide');
    vidualDisplay('break_userName break_allowWildCards break_domainName break_password break_periodicUpdate', 'hide');
	
	 switch (parseInt(ntpServerType, 10)){
		 
		 	case 1:/* DynDNS */		
			
				fieldStateChangeWr('', '', 'tf1Wizard_userName tf1Wizard_allowWildCards tf1Wizard_domainName tf1Wizard_password tf1Wizard_periodicUpdate', '');
	    		vidualDisplay('tf1Wizard_userName tf1Wizard_allowWildCards tf1Wizard_domainName tf1Wizard_password tf1Wizard_periodicUpdate', 'configRowWizard');
    			vidualDisplay('break_userName break_allowWildCards break_domainName break_password break_periodicUpdate', 'break');
			
			break;
			
			case 2:/* ORAY */
			
				fieldStateChangeWr('', '', 'tf1Wizard_userName tf1Wizard_password', '');
	    		vidualDisplay('tf1Wizard_userName tf1Wizard_password', 'configRowWizard');
    			vidualDisplay('break_userName break_password', 'break');
			
			
			break;
			
			case 3:/* DLINKDDNS */
			
				fieldStateChangeWr('', '', 'tf1Wizard_userName tf1Wizard_password tf1Wizard_domainName', '');
	    		vidualDisplay('tf1Wizard_userName tf1Wizard_password tf1Wizard_domainName', 'configRowWizard');
    			vidualDisplay('break_userName break_password break_domainName', 'break');
			
			break;
			
			case 4:/* None */
			
			break;
		 
	 }
	
	
}


function controllerinternetConnectionValidate() {

	/*Form Validations fails stop the request */
	
	if ( validateInternetConnection() == false) {
		return;
	}


	$("#tf1Wizard_internetConnectionWizardDailogContent").hide();

	if($("#tf1Wizard_licenceStatus").val() == 0){
		$("#tf1Wizard_wlanWizardDailogContent").show();
	}else{
		$("#tf1Wizard_dynamicDnsWizardDailogContent").show();
	}	
}


function controllerOpenWlanStep2Validate() {
	
	/* Validate the required fields of step 1 */
	
	var txtFieldIdArr = new Array();   
	txtFieldIdArr[0] = "tf1Wizard_apProfileName,"+LANG_LOCALE['30395'];
	txtFieldIdArr[1] = "tf1Wizard_ssid,"+LANG_LOCALE['12126'];
	txtFieldIdArr[2] = "tf1Wizard_wepPass,"+LANG_LOCALE['12156'];
	txtFieldIdArr[3] = "tf1Wizard_wpaPass,"+LANG_LOCALE['12160'];
	
	if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;


	if(alphaNumericValueCheck("tf1Wizard_apProfileName","-_",LANG_LOCALE['13717']) == false)
		return false;

	if(alphaNumericValueCheck("tf1Wizard_ssid","`~!@#$%^&amp;*()-_=+|{};:,.?/",LANG_LOCALE['11354']) == false)
		return false;

    if (document.getElementById('tf1Wizard_securityOpt').value == '4')   {
        wpaString = document.getElementById('tf1Wizard_wpaPass').value
        if (wpaString.length < 8 || wpaString.length > 63){
            alert(LANG_LOCALE['12420']);
            return false;
        }
    }
	
    if (document.getElementById('tf1Wizard_securityOpt').value == '2')   {
        wepString = document.getElementById('tf1Wizard_wepPass').value
        if (wepString.length != 13){
            alert(LANG_LOCALE['12416']);
            return false;
        }


    if ($('#tf1Wizard_mode').is(':disabled') == false) 
        {
             if (document.getElementById('tf1Wizard_mode').value == '3' || document.getElementById('tf1Wizard_mode').value == '5')
                 {  
                 alert(LANG_LOCALE['10952']);
                 return false;
                 }
        }
    else {
        alert(LANG_LOCALE['10952']);
                 return false;
        }


     if ($('#tf1Wizard_mode1').is(':disabled') == false) 
        {
             if (document.getElementById('tf1Wizard_mode1').value == '4' || document.getElementById('tf1Wizard_mode1').value == '6')
                 {  
                 alert(LANG_LOCALE['10952']);
                 return false;
                 }
        }
     else {
        alert(LANG_LOCALE['10952']);
                 return false;
        }

    }

	$("#tf1Wizard_divStep1Wlan").hide();
	$("#tf1Wizard_divStep2Wlan").show();

	
	
 
}

function controllerOpenWlanStep1() {

 
		$("#tf1Wizard_divStep2Wlan").hide();
		$("#tf1Wizard_divStep1Wlan").show();
	 
	
}

function controllerOpenWlanStep3() {

	$("#tf1Wizard_divStep2Wlan").hide();
	$("#tf1Wizard_divStep3Wlan").show();
	
}

function controllerOpenWlanStep2() {

	$("#tf1Wizard_divStep3Wlan").hide();
	$("#tf1Wizard_divStep1Wlan").hide();
	$("#tf1Wizard_divStep2Wlan").show();
	
}

function controllerWLanValidate() {
	
		var macAddrPre = "tf1Wizard_macAddr";
		for (var i = 1; i <= 6; i++){ 
			macObj = document.getElementById(macAddrPre + i);
			if (macObj && macObj.value != '') {
				if (!(macAddrValidate (macObj.value, true, "", '', macObj))){
					macObj.focus ();
					return false;
				}
			}
		}
		
	$("#tf1Wizard_wlanWizardDailogContent").hide();
	$("#tf1Wizard_dateTimeWizardDailogContent").show(); 
	
}


function controllerOpenWlanStep3FromDateTime() {

	$("#tf1Wizard_dateTimeWizardDailogContent").hide();	
	$("#tf1Wizard_wlanWizardDailogContent").show();
}


function controllerOpenDateTimeStep2() {

	$("#tf1Wizard_divStep1DateTime").hide();
	$("#tf1Wizard_divStep2DateTime").show();
	
	dateTimeWizardStepTwoFn();
	
}

function controllerOpenDateTimeStep1() {

	$("#tf1Wizard_divStep2DateTime").hide();
	$("#tf1Wizard_divStep1DateTime").show();
	
}


function controllerDateAndTimeWizardValidate() {
		
	var txtFieldIdArr = new Array();   
	txtFieldIdArr[0] = "tf1Wizard_PrimaryNTPServer,"+LANG_LOCALE['12092'];
	txtFieldIdArr[1] = "tf1Wizard_SecondaryNTPServer,"+LANG_LOCALE['12110'];
	txtFieldIdArr[2] = "tf1Wizard_dateTimePickerValue,"+LANG_LOCALE['12444'];
	txtFieldIdArr[3] = "tf1Wizard_timeSynchronize,"+LANG_LOCALE['12135'];
	
	if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

	if (ipaddrValidateWizard('tf1Wizard_PrimaryNTPServer') == false) 
        return false;
    
  if (ipaddrValidateWizard('tf1Wizard_SecondaryNTPServer') == false) 
        return false;
    
  var reSyncObj = document.getElementById("tf1Wizard_timeSynchronize");
  if (!numericValueRangeCheck(reSyncObj, '', '', 5, 1440, true, LANG_LOCALE['11372']+':', '')) 
        return false;


	 	

		if($("#tf1Wizard_licenceStatus").val() == 0){
			controllerWizardSave();
		}else{
			$("#tf1Wizard_dateTimeWizardDailogContent").hide();	
		  $("#tf1Wizard_securityWizardDailogContent").show();
		}
	
}

function controllerOpenDateTimeStep3FromSecurity() {

	$("#tf1Wizard_securityWizardDailogContent").hide();
	$("#tf1Wizard_dateTimeWizardDailogContent").show();	
	
}


function controllerOpenWizardSecurityStep2() {

 
	wizardClearSpanWarning();
	$("#tf1Wizard_divStep1Security").hide();
	$("#tf1Wizard_divStep2Security").show();
}



function controllerOpenWizardSecurityStep3() {

	var txtFieldIdArr = new Array();   
	txtFieldIdArr[0] = "tf1Wizard_connectionName,"+LANG_LOCALE['11981'];
	txtFieldIdArr[1] = "tf1Wizard_preSharedKey,"+LANG_LOCALE['12089'];
	txtFieldIdArr[2] = "tf1Wizard_remoteIpAddr,"+LANG_LOCALE['12446'];
	txtFieldIdArr[3] = "tf1Wizard_localIpAddr,"+LANG_LOCALE['12045'];
	 
	if (txtFieldArrayCheck(txtFieldIdArr) == false) 
  	return false;

	var preshareObj=document.getElementById('tf1Wizard_preSharedKey');
	if(preshareObj&& !preshareObj.disbaled){
		if(fieldLengthCheck('tf1Wizard_preSharedKey', 8, 49, LANG_LOCALE['11323']) == false)
			return false
	}

	if (IPorFQDNCheckRemote() == false) 
        return false;
    
  if (IPorFQDNCheckLocal() == false) 
        return false;


		if ( document.getElementById("tf1Wizard_selVPNType").value == 2 ) {
			
			controllerWizardSave();
				
		} else {
	
			showControllerWizardDiv('tf1Wizard_divStep3Security', 'tf1Wizard_divStep2Security', 'showhideFieldsforIPV6');
			
		}
}


function controllerWizardPeerOnChange() {
	
	if (document.getElementById("tf1Wizard_selVPNType").value == 2){
	
		$("#tf1Wizard_btNextStep2").val(LANG_LOCALE['12758']);
    $(".lastStep").html('11');
		
		/*
		IP Address : 1
		FQDN : 2
		*/
		document.getElementById("tf1Wizard_remoteGatewayType").remove(0);
		
	} else {
		$("#tf1Wizard_btNextStep2").val(LANG_LOCALE['11779']);
		$(".lastStep").html('12');
		var selObject = document.getElementById("tf1Wizard_remoteGatewayType");
		selObject.length = 0;
		selObject.options[selObject.options.length] = new Option(LANG_LOCALE['11387'], '1');
		selObject.options[selObject.options.length] = new Option(LANG_LOCALE['14125'], '2');
	}

}


function controllerDynamicDnsWizardValidate() {
	
	var txtFieldIdArr = new Array();   
	txtFieldIdArr[0] = "tf1Wizard_userName,"+LANG_LOCALE['12144'];
	txtFieldIdArr[1] = "tf1Wizard_domainName,"+LANG_LOCALE['12002'];
	txtFieldIdArr[2] = "tf1Wizard_password,"+LANG_LOCALE['12074'];
	 
	
	if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

	if (!validateFQDN('tf1Wizard_domainName')) 
        return false;

	if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false)
        return false;

		$("#tf1Wizard_dynamicDnsWizardDailogContent").hide();	
	  $("#tf1Wizard_wlanWizardDailogContent").show();
	
	
}

function statusErrorPrevious() {

     $("#tf1Wizard_errorDiv").hide();
     if (document.getElementById("tf1Wizard_selVPNType").value == 2){ 
                        
                         $("#tf1Wizard_divStep2Security").show();
                          
                    } else {

                        $("#tf1Wizard_divStep3Security").show();
                         
                    }

}
function controllerWizardSave() {

if($("#tf1Wizard_licenceStatus").val() == 1){

	if (document.getElementById("tf1Wizard_selVPNType").value == 1 ) {
	
	var txtFieldIdArr = new Array();   
	txtFieldIdArr[0] = "tf1Wizard_remoteNetworkIp,"+LANG_LOCALE['12101'];
	txtFieldIdArr[1] = "tf1Wizard_remoteNetSubnetMask,"+LANG_LOCALE['12102'];
	txtFieldIdArr[2] = "tf1Wizard_remotePrefixLength,"+LANG_LOCALE['12447'];
	txtFieldIdArr[3] = "tf1Wizard_localNetIPAddr,"+LANG_LOCALE['12046'];
	txtFieldIdArr[4] = "tf1Wizard_localNetSubnetMask,"+LANG_LOCALE['12047'];
	txtFieldIdArr[5] = "tf1Wizard_localNetPrefixLength,"+LANG_LOCALE['12445'];
	 
	if (txtFieldArrayCheck(txtFieldIdArr) == false) 
  	return false;	

	if (IPAddrCheckSecWiz('tf1Wizard_remoteNetworkIp') == false) 
        return false;
	
	var remoteSubObj = document.getElementById ('tf1Wizard_remoteNetSubnetMask');
  if (remoteSubObj && !remoteSubObj.disabled){
		if (validNetMask ('tf1Wizard_remoteNetSubnetMask') == false)
    	return false; 
	}

	var remotePreObj = document.getElementById ('tf1Wizard_remotePrefixLength');
  if (remotePreObj && !remotePreObj.disabled){
		if (numericValueRangeCheck(document.getElementById('tf1Wizard_remotePrefixLength'), '', '', 0, 128,true, LANG_LOCALE['11335'], '') == false)
	    return false;
	}

	if (IPAddrCheckSecWiz('tf1Wizard_localNetIPAddr') == false) 
        return false;

	var localSubObj = document.getElementById ('tf1Wizard_localNetSubnetMask');
  if (localSubObj && !localSubObj.disabled){
		if (validNetMask ('tf1Wizard_localNetSubnetMask') == false)
    	return false; 
	}

	var localPreObj = document.getElementById ('tf1Wizard_localNetPrefixLength');
  if (localPreObj && !localPreObj.disabled){
		if (numericValueRangeCheck(document.getElementById('tf1Wizard_localNetPrefixLength'), '', '', 0, 128,true, LANG_LOCALE['11294'], '') == false)
	    return false;
	}

}
}// Licence Status if
	setHiddenChks('tf1Wizard_controllerForm');

    displayProgressBar();

     
    var request = $.ajax({
		url: "platform.cgi?page=wizard.html",
		type: "POST",
		data: $("#tf1Wizard_controllerForm").serialize(),
		dataType: "html"
		});

		wizardClearSpanWarning();

        request.done(function(msg) {

        hideProgressBar();

         

			 if (msg.search('errorWizard') != -1) {

				if($("#tf1Wizard_licenceStatus").val() == 1){
                      if (document.getElementById("tf1Wizard_selVPNType").value == 2){ 

                         $("#tf1Wizard_divStep2Security").hide();
                          
                    } else {

                        $("#tf1Wizard_divStep3Security").hide();
                         
                    }
				}else{
					$("#tf1Wizard_dateTimeWizardDailogContent").hide();
					$("#tf1Wizard_securityWizardDailogContent").show();
				}
                    $("#tf1Wizard_errorBlock").html (msg);
                    $("#tf1Wizard_errorDiv").show();
                    $("#tf1Wizard_controllerWizardSaveHeading").html(LANG_LOCALE['30521']+" - ["+LANG_LOCALE['30522']+"]");
                } else {
	 
					if($("#tf1Wizard_licenceStatus").val() == 1){
                       if (document.getElementById("tf1Wizard_selVPNType").value == 2){ 
			           showPreview ('tf1Wizard_previewDiv','tf1Wizard_divStep2Security');
						$("#tf1Wizard_controllerWizardSaveHeading").html(LANG_LOCALE['30521']+" - ["+LANG_LOCALE['30523']+"]");
                      } else {

                       showPreview ('tf1Wizard_previewDiv','tf1Wizard_divStep3Security');
                       $("#tf1Wizard_controllerWizardSaveHeading").html(LANG_LOCALE['30521']+" - ["+LANG_LOCALE['30523']+"]");

                        }
					}else{
						$("#tf1Wizard_dateTimeWizardDailogContent").hide();
						$("#tf1Wizard_securityWizardDailogContent").show();
						
						showPreview ('tf1Wizard_previewDiv','tf1Wizard_divStep2DateTime');
                       $("#tf1Wizard_controllerWizardSaveHeading").html(LANG_LOCALE['30521']+" - ["+LANG_LOCALE['30523']+"]");
					}
                }

			 	
			 
			 
		});
		request.fail(function(jqXHR, textStatus) {
			alert( LANG_LOCALE['13586']+": " + textStatus );
		});	

 


}

function checkAndSetNetworkIp (ipAddrId, subnetId)
    {
    // Get subnet Id    
    var localSubnetObj = document.getElementById(subnetId);
    if(localSubnetObj) {
    	if(localSubnetObj.value == "0.0.0.0") {
        	return true;
        }
		else {
            if(validNetMask (subnetId)) {
                if(setNetworkIpAddress (ipAddrId, subnetId) == false)
                	{
                    return false;
                    }
                else
                    {
                    return true;
                    }
			} else
				return false;
		}
    }
}

function localSubnetIpCheck (ipAddrId)
    {

    var localStartIpObj = document.getElementById(ipAddrId);
    /*
    Check if protocol is IPv4 or IPv6
    */  
    var protocolValue = comboSelectedValueGet ('tf1Wizard_selProtocolVer');
    if(protocolValue == 1)
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
        if (ipv6Validate (ipAddrId, false, true, '') == false)
            {
            return false;
            }
        }
    }

/* (start) Wireless wizard */

 function wizard_changeWirelessKeyType() {
   var keyType = comboSelectedValueGet ('tf1Wizard_networkType');

   if (keyType == "2") {

	fieldStateChangeWr('', '', 'tf1Wizard_preSharedKey', '');
	vidualDisplay('tf1Wizard_key', 'configRowWizard');
    	vidualDisplay('break_tf1Wizard_key', 'break');
	
    } else {

	fieldStateChangeWr('tf1Wizard_preSharedKey', '', '', '');
	vidualDisplay('tf1Wizard_key', 'hide');
    	vidualDisplay('break_tf1Wizard_key', 'hide');
   }

 }


function validateWizardWireless() {
	
	var txtFieldIdArr = new Array();   
	txtFieldIdArr[0] = "tf1Wizard_Ssid,"+LANG_LOCALE['12126'];
	txtFieldIdArr[1] = "tf1Wizard_preSharedKey,"+LANG_LOCALE['12089'];	 
	
	if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false; 

	if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false)
        return false;
	 var keyType = comboSelectedValueGet ('tf1Wizard_networkType');

   	if (keyType == "1") {
		$("#tf1Wizard_preSharedKey").val("passphrase");
		$("#tf1Wizard_preSharedKey").removeAttr("disabled");
	}

	var preshareObj=document.getElementById('tf1Wizard_preSharedKey');
	if(preshareObj&& !preshareObj.disbaled){
		if(fieldLengthCheck('tf1Wizard_preSharedKey', 8, 63, LANG_LOCALE['30478']) == false)
			return false
	}

	displayProgressBar();


		var request = $.ajax({
		url: "platform.cgi?page=wizard.html",
		type: "POST",
		data: $("#tf1Wizard_wirelessForm").serialize(),
		dataType: "html"
		});
		wizardClearSpanWarning();
		request.done(function(msg) {
            hideProgressBar();
        if(msg.search("errorWizard") != -1) {
        
            $("#wirelessStatusMessage").html(msg);

        }else{
            
	   showPreview ('tf1Wizard_previewDiv','tf1Wizard_divStep1');
        }			 
		});
		request.fail(function(jqXHR, textStatus) {
			alert( LANG_LOCALE['13586']+": " + textStatus );
		});	
	
}

/* (end) Wireless wizard */


/* WPS Wizard */

function wpsMethod(){
 var keyType = comboSelectedValueGet ('tf1_wpsMethodSelect');

   if (parseInt(keyType,10) == "1") {

	fieldStateChangeWr('tf1_wpsPin tf1_pin tf1_pbc', '', 'tf1_ssid tf1_securityMode tf1_cipherType tf1_presharedKey', '');
	vidualDisplay('tf1_ssid tf1_securityMode tf1_cipherType tf1_presharedKey', 'configRowWizard');
    vidualDisplay('break_ssid break_securityMode break_cipherType break_presharedKey', 'break');
    vidualDisplay('tf1_wpsPin tf1_pin tf1_pbc', 'hide');
    vidualDisplay('break_wpsPin break_pbc', 'hide');
   // $("#tf1_btSaveConnect").show();
	
    } else {

	fieldStateChangeWr('tf1_ssid tf1_securityMode tf1_cipherType tf1_presharedKey', '', 'tf1_wpsPin tf1_pin tf1_pbc', '');
	vidualDisplay('tf1_ssid tf1_securityMode tf1_cipherType tf1_presharedKey', 'hide');
    vidualDisplay('break_ssid break_securityMode break_cipherType break_presharedKey', 'hide');
    vidualDisplay('tf1_wpsPin tf1_pin tf1_pbc', 'configRowWizard');
    vidualDisplay('break_wpsPin break_pbc', 'break');
    //$("#tf1_btSaveConnect").hide();
   }

   pinMethodChange();

 }

function pinMethodChange(){
 var pinType = radioCheckedValueGet('tf1_pin');

 if (pinType == "0") {
     $("#tf1_wpsPin").show();
     fieldStateChangeWr('', '', 'tf1_wpsPin', '');
  } else {
         $("#tf1_wpsPin").hide();
         fieldStateChangeWr('tf1_wpsPin', '', '', '');
  }

 }

function validateWizardWps() {
	
	var txtFieldIdArr = new Array();   
	txtFieldIdArr[0] = "tf1_wpsPin,"+LANG_LOCALE['30397'];

	
	if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false; 

	if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false)
        return false;

	 var keyType = comboSelectedValueGet ('tf1_wpsMethodSelect');

   	if (keyType == "0" && radioCheckedValueGet('tf1_pin') == "0" ) {

         var pinValueObj = document.getElementById ('tf1_wpsPin');
    if(pinValueObj && !pinValueObj.disabled)
        {
        if (isNaN (parseInt(pinValueObj.value)))
            {
         
            alert (LANG_LOCALE['30397']);
            pinValueObj.focus();
            return false;
            }
            
        if (pinValueObj.value.length % 4 != 0)
            {
           
            alert (LANG_LOCALE['30398']);
            pinValueObj.focus();
            return false;
            }        
        } 
	}



	displayProgressBar();


		var request = $.ajax({
		url: "platform.cgi?page=wizard.html",
		type: "POST",
		data: $("#tf1Wizard_wpsForm").serialize(),
		dataType: "html"
		});
		wizardClearSpanWarning();
		request.done(function(msg) {
            hideProgressBar();
        if(msg.search("errorWizard") != -1) {
        
            $("#tf1Wizard_Step1StatusMessage").html(msg);

        }else{
            
	   showPreview ('tf1Wizard_previewDiv','tf1Wizard_divStep1');
        }			 
		});
		request.fail(function(jqXHR, textStatus) {
			alert( LANG_LOCALE['13586']+": " + textStatus );
		});	
	
}

