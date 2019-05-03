/*
* File: policyBasedQosConfig.js
* Created on 20th nov 2012 - Laxmi
* Copyright (c) 2012 TeamF1, Inc.
* All rights reserved.
*/

/**
 * This function calls when page loads
 * OnLoad validation
 */
$(document).ready(function() {
	$('#tf1_policyBasedQos .gradeA').contextMenu('contextMenu', {
					bindings : {
					'editMenu' : function(t, e, rowId) {
								openForm('button.edit.policyBasedQos.policyBasedQos',rowId,'tf1_dialog','policyBasedQos','policyBasedQosForm.html', 'tf1_policyBasedQosDailogContent','onLoadPolicyBasedQosFn');									
										},
						'deleteMenu' : function(t, e, rowId) {
									deleteRows('button.delete.policyBasedQos.policyBasedQos', 'tf1_frmPolicyBasedQos', rowId, 'optionSelectAll', 'tf1_dialog', 'policyBasedQos', 'policyBasedQos');
										}
									}
								});

	oTable = $('#recordsData').dataTable({
		"bJQueryUI" : true,
		"sPaginationType" : "full_numbers"
	});
	$("#btnClose").live("click",function(e){
					HideDialog('tf1_dialog', 'tf1_overlay');
					e.preventDefault();
			   	});
			   	
dataRightClick(true);
	setOnclickDialogs('tf1_btnShowModal', 'btnClose', 'tf1_dialog', 'tf1_overlay');
	 /*policyBasedQosConfigOnload({
		imageId : '',
		disableIndividual : '',
		disableGrp : '',
		enableIndividual : '',
		enableGrp : '',
		hideClass : 'hide',
		showClass : 'configRow',
		breakDivs : '',
		breakClass : 'break',
		imagesInfo : {
			disableImages : '',
			enableImages : '',
			disableClass : '',
			enableClass : ''
		}
	}) */
});

/**
 * function for toggle the image
 * @method policyBasedQosConfigOnload
 * @param toggleObj - object
 */
function onLoadPolicyBasedQosFn(toggleObj) {
	policyBasedProfileTypeChange('tf1_profileType');
}

/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method qosPolicyConfigValidate
 */
function qosPolicyConfigValidate() {
	var txtFieldIdArr = new Array();
	txtFieldIdArr[0] = "tf1_txtProfileName, Please enter a valid Profile Name.";
	txtFieldIdArr[1] = "tf1_port, Please select a Port.";
	txtFieldIdArr[2] = "tf1_txtMacAddress, Please enter a valid MAC Address.";
	txtFieldIdArr[3] = "tf1_txtIpAddress, Please enter a valid IP Address.";
	txtFieldIdArr[4] = "tf1_L4Port, Please enter a valid L4 Port Number.";

	if (txtFieldArrayCheck(txtFieldIdArr) == false)
		return false;

	if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;	
		
	if (ipv4Validate('tf1_txtIpAddress', 'IP', false, true, "Invalid IP address.", "for octet ", true) == false)
		return false;

	var macObj = document.getElementById('tf1_txtMacAddress')
	if (macObj && !macObj.disabled) {
		if (macAddrValidate(macObj.value, true, "", '', macObj) == false)
			return false;
	}
	var portObj = document.getElementById('tf1_L4Port');
	if (numericValueRangeCheck(portObj, '', '', 1, 65535, true, 'Invalid L4 Port.', '') == false)
		return false;

	return true;
}

/**
 * function for changing the mode settings of radio buttons
 * Onclick event
 * @method policyBasedProfileTypeChange
 * @param selName - Selectbox id
 */
function policyBasedProfileTypeChange(selName) {

	selValue = comboSelectedValueGet(selName);
	if (!selValue)
		return;
	switch (parseInt(selValue, 10)) {
		case 1:
			/* VLAN */
			fieldStateChangeWr('tf1_txtMacAddress tf1_txtIpAddress tf1_L4Port', '', 'tf1_policyVLAN', '');
			vidualDisplay('tf1_txtMacAddress tf1_txtIpAddress tf1_L4Port', 'hide');
			vidualDisplay('break5 break6 break7', 'hide');
			vidualDisplay('tf1_policyVLAN', 'configRow');
			vidualDisplay('break4', 'break');
			break;
		case 2:
		/* MAC Address */
		case 3:
			fieldStateChangeWr('tf1_policyVLAN tf1_txtIpAddress tf1_L4Port', '', 'tf1_txtMacAddress', '');
			vidualDisplay('tf1_policyVLAN tf1_txtIpAddress tf1_L4Port', 'hide');
			vidualDisplay('break4 break6 break7', 'hide');
			vidualDisplay('tf1_txtMacAddress', 'configRow');
			vidualDisplay('break5', 'break');
			break;
		case 4:
		/* IP Address */
		case 5:
			fieldStateChangeWr('tf1_txtMacAddress tf1_policyVLAN tf1_L4Port', '', 'tf1_txtIpAddress', '');
			vidualDisplay('tf1_txtMacAddress tf1_policyVLAN tf1_L4Port', 'hide');
			vidualDisplay('break5 break4 break7', 'hide');
			vidualDisplay('tf1_txtIpAddress', 'configRow');
			vidualDisplay('break6', 'break');
			break;
		case 6:
		/* PORT Number */
		case 7:
		case 8:
		case 9:
			fieldStateChangeWr('tf1_txtMacAddress tf1_policyVLAN tf1_txtIpAddress', '', 'tf1_L4Port', '');
			vidualDisplay('tf1_txtMacAddress tf1_policyVLAN tf1_txtIpAddress', 'hide');
			vidualDisplay('break5 break4 break6', 'hide');
			vidualDisplay('tf1_L4Port', 'configRow');
			vidualDisplay('break7', 'break');
			break;
	}
}
