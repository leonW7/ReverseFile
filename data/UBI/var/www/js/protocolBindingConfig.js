/*
* File: protocolBindingConfig.js
* Created on 20th nov 2012 - Laxmi
* Copyright (c) 2012 TeamF1, Inc.
* All rights reserved.
*/

/**
 * This function calls when page loads
 * OnLoad validation
 */
$(document).ready(function() {
	$('#tf1_protocolBinding .gradeA').contextMenu('contextMenu', {
		bindings : {
			'editMenu' : function(t, e, rowId) {
				 openForm('button.edit.protocolBinding.protocolBinding',rowId,'tf1_dialog','protocolBinding','protocolBindingForm.html', 'tf1_protocolBindingDailogContent','onLoadProtocolBindingFn');									
			},
			'deleteMenu' : function(t, e, rowId) {
				deleteRows('button.delete.protocolBinding.protocolBinding', 'tf1_frmProtocolBinding', rowId, 'optionSelectAll', 'tf1_dialog', 'protocolBinding', 'protocolBinding');
			},
			'enableMenu' : function(t, e, rowId) {
				changeRowStauts('enable', 'tf1_frmProtocolBinding', rowId, 'tf1_dialog', 'protocolBinding', 'protocolBinding', 'protocolBinding.protocolBinding', 'optionSelectAll');
			},
			'disableMenu' : function(t, e, rowId) {
				changeRowStauts('disable', 'tf1_frmProtocolBinding', rowId, 'tf1_dialog', 'protocolBinding', 'protocolBinding', 'protocolBinding.protocolBinding', 'optionSelectAll');
			}
		},
		onShowMenu: function(e,menu,rowId) {
			if ($("#"+rowId).attr("status") == "1"){
				$('#enableMenu', menu).remove();
			} else {
				$('#disableMenu', menu).remove();
			}
			return menu;
		}
	});

	oTable = $('#recordsData').dataTable({
		"bJQueryUI" : true,
		"sPaginationType" : "full_numbers",
        "columnDefs": [
              { type: 'ip-address', targets: 3 },
              { type: 'ip-address', targets: 4 }
        ]
	});
	$("#btnClose").live("click",function(e){
		HideDialog('tf1_dialog', 'tf1_overlay');
		e.preventDefault();
   	});
	dataRightClick(true);	
});

/**
 * function for toggle the image
 * @method protocolBindingOnload
 * @param toggleObj - object
 */
function onLoadProtocolBindingFn(toggleObj) {
	PBCSourceNetworkType('tf1_sourceNetworkType1');
	PBCDestinationNetworkType('tf1_destinationNetworkType1');
}


/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method protocolBindingConfigValidate
 */
function protocolBindingConfigValidate() {
	var txtFieldIdArr = new Array();

	txtFieldIdArr[0] = "tf1_txtSrcStart, "+LANG_LOCALE['12388'];
	txtFieldIdArr[1] = "tf1_txtSrcEnd, "+LANG_LOCALE['12266'];
	txtFieldIdArr[2] = "tf1_txtDestStart, "+LANG_LOCALE['12387'];
	txtFieldIdArr[3] = "tf1_txtDestEnd, "+LANG_LOCALE['12194'];

	if (txtFieldArrayCheck(txtFieldIdArr) == false)
		return false;
		
	if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;

	if (ipv4Validate('tf1_txtSrcStart', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
		return false;

	if (ipv4Validate('tf1_txtSrcEnd', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
		return false;

	if (ipRangeValidate('tf1_txtSrcStart', 'tf1_txtSrcEnd') == false)
		return false;

	if (ipv4Validate('tf1_txtDestStart', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
		return false;

	if (ipv4Validate('tf1_txtDestEnd', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
		return false;

	if (ipRangeValidate('tf1_txtDestStart', 'tf1_txtDestEnd') == false)
		return false;
	return true;
}

/**
 * function for changing the mode settings of radio buttons
 * Onclick event
 * @method PBCSourceNetworkType
 * @param radioName - Radio button name
 */
function PBCSourceNetworkType(radioName) {
	var selValue = radioCheckedValueGet(radioName);
	if (!selValue)
		return;
	switch (parseInt(selValue, 10)) {
		case 1:
			/* Any */
			fieldStateChangeWr('tf1_txtSrcStart tf1_txtSrcEnd', '', '', '');
			vidualDisplay('tf1_txtSrcStart tf1_txtSrcEnd', 'hide');
			vidualDisplay('break1Src break2Src', 'hide');
			break;

		case 2:
			/* Single Address */
			fieldStateChangeWr('tf1_txtSrcEnd', '', 'tf1_txtSrcStart', '');
			vidualDisplay('tf1_txtSrcStart', 'configRow');
			vidualDisplay('break1Src', 'break');
			vidualDisplay('tf1_txtSrcEnd', 'hide');
			vidualDisplay('break2Src', 'hide');
			break;

		case 3:
			/* Address range */
			fieldStateChangeWr('', '', 'tf1_txtSrcStart tf1_txtSrcEnd', '');
			vidualDisplay('tf1_txtSrcStart tf1_txtSrcEnd', 'configRow');
			vidualDisplay('break1Src break2Src', 'break');
			break;
	}
}

/**
 * function for changing the mode settings of radio buttons
 * Onclick event
 * @method PBCDestinationNetworkType
 * @param radioName - Radio button name
 */
function PBCDestinationNetworkType(radioName) {
	var selValue = radioCheckedValueGet(radioName);
	if (!selValue)
		return;
	switch (parseInt(selValue, 10)) {
		case 1:
			/* Any */
			fieldStateChangeWr('tf1_txtDestStart tf1_txtDestEnd', '', '', '');
			vidualDisplay('tf1_txtDestStart tf1_txtDestEnd', 'hide');
			vidualDisplay('break1Dest break2Dest', 'hide');
			break;

		case 2:
			/* Single Address */
			fieldStateChangeWr('tf1_txtDestEnd', '', 'tf1_txtDestStart', '');
			vidualDisplay('tf1_txtDestStart', 'configRow');
			vidualDisplay('break1Dest', 'break');
			vidualDisplay('tf1_txtDestEnd', 'hide');
			vidualDisplay('break2Dest', 'hide');
			break;

		case 3:
			/* Address range */
			fieldStateChangeWr('', '', 'tf1_txtDestStart tf1_txtDestEnd', '');
			vidualDisplay('tf1_txtDestStart tf1_txtDestEnd', 'configRow');
			vidualDisplay('break1Dest break2Dest', 'break');
			break;
	}
}

