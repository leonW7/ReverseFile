/*
* File: wlanGlobal.js
* Created on 27th Nov 2012 - Laxmi
* Copyright (c) 2012 TeamF1, Inc.
* All rights reserved.
*/
/**
 * This function calls Page loads
 * Onload validation
 * @method onloadCall
 */
$(document).ready(function() {
	onloadCall();
	/*clusterPriorityChange('off');*/
});

function wlanGeneralOnreset(frmId) {
	resetImgOnOff(frmId);
	clusterPriorityChange('off');
}
/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method wlanGlobalValidate
 */
function wlanGlobalValidate(frmId) {
	var txtFieldIdArr = new Array();
	txtFieldIdArr[0] = "tf1_wlanGlobalSetup, Please enter valid Peer Group ID";
	txtFieldIdArr[1] = "tf1_clientRoamTimeout,Please enter valid Client Roam Timeout";
	txtFieldIdArr[2] = "tf1_clientStatusTimeout,Please enter valid Ad Hoc Client Status Timeout";
	txtFieldIdArr[3] = "tf1_apFailureStatusTimeout,Please enter valid AP Failure Status Timeout";
	txtFieldIdArr[4] = "tf1_rfScanStatusTimeout,Please enter valid RF Scan Status Timeout";
	txtFieldIdArr[5] = "tf1_detectedClientsStatusTimeout,Please enter valid Detected Clients Status Timeout";
	txtFieldIdArr[6] = "tf1_clusterPriorityValue,Please enter valid Cluster Priority Value";

	if (txtFieldArrayCheck(txtFieldIdArr) == false)
		return false;
		
	if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;

	if (numericValueRangeCheck(document.getElementById('tf1_wlanGlobalSetup'), '', '', 1, 255, true, 'Invalid Peer Group ID', '') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_clientRoamTimeout'), '', '', 1, 120, true, 'Invalid Client Roam Timeout', '') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_clientStatusTimeout'), '', '', 0, 168, true, 'Invalid Client Status Timeout', '') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_apFailureStatusTimeout'), '', '', 0, 168, true, 'Invalid AP Failure Status Timeout', '') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_rfScanStatusTimeout'), '', '', 0, 168, true, 'Invalid RF Scan Status Timeout', '') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_detectedClientsStatusTimeout'), '', '', 0, 168, true, 'Invalid Detected Clients Status Timeout', '') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_clusterPriorityValue'), '', '', 0, 255, true, 'Invalid Cluster Priority Value', '') == false)
		return false;

	setHiddenChks(frmId);
	return true;

}

/****
 * This function calls when user click on cluster Priority Button
 * OnChange event
 * @method clusterPriorityChange
 */
function clusterPriorityChange(type) {
	var imgObjVal = document.getElementById('tf1_clusterPriority').className;
	var imageName = imgObjVal.substring(imgObjVal.lastIndexOf('/') + 1);
	if (type == 'off') {
		fieldStateChangeWr('tf1_clusterPriorityValue', '', '', '');
		vidualDisplay('tf1_clusterPriorityValue', 'hide');
	} else {
		if (imageName == OFF_ANCHOR) {
			fieldStateChangeWr('', '', 'tf1_clusterPriorityValue', '');
			vidualDisplay('tf1_clusterPriorityValue', 'configRow');
		} else if (imageName == ON_ANCHOR) {
			fieldStateChangeWr('tf1_clusterPriorityValue', '', '', '');
			vidualDisplay('tf1_clusterPriorityValue', 'hide');
		}
	}
}
