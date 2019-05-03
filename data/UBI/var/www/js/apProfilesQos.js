/*
* File: apProfilesQos.js
* Created on 27th Nov 2012 - Laxmi
* Copyright (c) 2012 TeamF1, Inc.
* All rights reserved.
*/

/**
 * function for onload form 
 * OnLoad event
 * @method  apProfilesQosLoad
 */
function apProfilesQosLoad ()
    {
        changeTemplate('tf1_templateFactory');
    }

/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method apProfilesQosValidate
 */
function apProfilesQosValidate(frmId) {
	var txtFieldIdArr = new Array();
	txtFieldIdArr[0] = "tf1_apDataAIFS, Please enter valid AP EDCA Data 0 AIFS ";
	txtFieldIdArr[1] = "tf1_apDataMaxBurst, Please enter valid AP EDCA Data 0 Max. Burst";
	txtFieldIdArr[2] = "tf1_apData1AIFS, Please enter valid AP EDCA Data 1 AIFS ";
	txtFieldIdArr[3] = "tf1_apData1MaxBurst, Please enter valid AP EDCA Data 1 Max. Burst";
	txtFieldIdArr[4] = "tf1_apData2AIFS, Please enter valid AP EDCA Data 2 AIFS ";
	txtFieldIdArr[5] = "tf1_apData2MaxBurst, Please enter valid AP EDCA Data 2 Max. Burst";
	txtFieldIdArr[6] = "tf1_apData3AIFS, Please enter valid AP EDCA Data 3 AIFS ";
	txtFieldIdArr[7] = "tf1_apData3MaxBurst, Please enter valid AP EDCA Data 3 Max. Burst";
	txtFieldIdArr[8] = "tf1_stationDataAIFS, Please enter valid Station EDCA Data 0 AIFS";
	txtFieldIdArr[9] = "tf1_stationDataTXOPLimit, Please enter valid Station EDCA Data 0 TXOP Limit";
	txtFieldIdArr[10] = "tf1_stationData1AIFS, Please enter valid Station EDCA Data 1 AIFS";
	txtFieldIdArr[11] = "tf1_stationData1TXOPLimit, Please enter valid Station EDCA Data 1 TXOP Limit";
	txtFieldIdArr[12] = "tf1_stationData2AIFS, Please enter valid Station EDCA Data 2 AIFS";
	txtFieldIdArr[13] = "tf1_stationData2TXOPLimit, Please enter valid Station EDCA Data 2 TXOP Limit";
	txtFieldIdArr[14] = "tf1_stationData3AIFS, Please enter valid Station EDCA Data 3 AIFS";
	txtFieldIdArr[15] = "tf1_stationData3TXOPLimit, Please enter valid Station EDCA Data 3 TXOP Limit";

	if (txtFieldArrayCheck(txtFieldIdArr) == false)
		return false;
		
	if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;

	if (numericValueRangeCheck(document.getElementById('tf1_apDataAIFS'), '', '', 1, 255, true, 'Invalid AP EDCA Data 0 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_apDataMaxBurst'), '', '', 0, 999900, true, 'Invalid AP EDCA Data 0 Max. Burst', 'U. Sec. units.') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_apData1AIFS'), '', '', 1, 255, true, 'Invalid AP EDCA Data 1 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_apData1MaxBurst'), '', '', 0, 999900, true, 'Invalid AP EDCA Data 1 Max. Burst', 'U. Sec. units.') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_apData2AIFS'), '', '', 1, 255, true, 'Invalid AP EDCA Data 2 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_apData2MaxBurst'), '', '', 0, 999900, true, 'Invalid AP EDCA Data 2 Max. Burst', 'U. Sec. units.') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_apData3AIFS'), '', '', 1, 255, true, 'Invalid AP EDCA Data 3 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_apData3MaxBurst'), '', '', 0, 999900, true, 'Invalid AP EDCA Data 3 Max. Burst', 'U. Sec. units.') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_stationDataAIFS'), '', '', 1, 255, true, 'Invalid Station EDCA Data 0 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_stationDataTXOPLimit'), '', '', 0, 65535, true, 'Invalid Station EDCA Data 0 TXOP Limit', '32 U. Sec. units ') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_stationData1AIFS'), '', '', 1, 255, true, 'Invalid Station EDCA Data 1 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_stationData1TXOPLimit'), '', '', 0, 65535, true, 'Invalid Station EDCA Data 1 TXOP Limit', '32 U. Sec. units ') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_stationData2AIFS'), '', '', 1, 255, true, 'Invalid Station EDCA Data 2 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_stationData2TXOPLimit'), '', '', 0, 65535, true, 'Invalid Station EDCA Data 2 TXOP Limit', '32 U. Sec. units ') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_stationData3AIFS'), '', '', 1, 255, true, 'Invalid Station EDCA Data 3 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_stationData3TXOPLimit'), '', '', 0, 65535, true, 'Invalid Station EDCA Data 3 TXOP Limit', '32 U. Sec. units ') == false)
		return false;

	setHiddenChks(frmId);
	return true;
}

/**
 * function for changing the Template settings of radio buttons
 * Onclick event
 * @method changeTemplate
 * @param radioName - Radio button name
 */
function changeTemplate(radioName) {
	var selValue = radioCheckedValueGet(radioName);
	if (!selValue)
		return;
	switch (parseInt(selValue, 10)) {
		case 1:
			/* Custom */
			fieldStateChangeWr('', '', 'tf1_apDataAIFS tf1_apDataCwMin tf1_apDataCwMax tf1_apDataMaxBurst tf1_apData1AIFS tf1_apData1CwMin tf1_apData1CwMax tf1_apData1MaxBurst tf1_apData2AIFS tf1_apData2CwMin tf1_apData2CwMax tf1_apData2MaxBurst tf1_apData3AIFS tf1_apData3CwMin tf1_apData3CwMax tf1_apData3MaxBurst tf1_stationDataAIFS tf1_stationDataCwMin tf1_stationDataCwMax tf1_stationDataTXOPLimit tf1_stationData1AIFS tf1_stationData1CwMin tf1_stationData1CwMax tf1_stationData1TXOPLimit tf1_stationData2AIFS tf1_stationData2CwMin tf1_stationData2CwMax tf1_stationData2TXOPLimit tf1_stationData3AIFS tf1_stationData3CwMin tf1_stationData3CwMax tf1_stationData3TXOPLimit', '');
			vidualDisplay('tf1_APEDCAParameters tf1_StationEDCAParameters', 'configRow');
			break;

		case 2:
		/* Factory Default */
		case 3:
			/* Voice*/
			fieldStateChangeWr('tf1_apDataAIFS tf1_apDataCwMin tf1_apDataCwMax tf1_apDataMaxBurst tf1_apData1AIFS tf1_apData1CwMin tf1_apData1CwMax tf1_apData1MaxBurst tf1_apData2AIFS tf1_apData2CwMin tf1_apData2CwMax tf1_apData2MaxBurst tf1_apData3AIFS tf1_apData3CwMin tf1_apData3CwMax tf1_apData3MaxBurst tf1_stationDataAIFS tf1_stationDataCwMin tf1_stationDataCwMax tf1_stationDataTXOPLimit tf1_stationData1AIFS tf1_stationData1CwMin tf1_stationData1CwMax tf1_stationData1TXOPLimit tf1_stationData2AIFS tf1_stationData2CwMin tf1_stationData2CwMax tf1_stationData2TXOPLimit tf1_stationData3AIFS tf1_stationData3CwMin tf1_stationData3CwMax tf1_stationData3TXOPLimit', '', '', '');
			vidualDisplay('tf1_APEDCAParameters tf1_StationEDCAParameters', 'hide');
			break;
	}
}
/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method apProfilesQosValidate
 */
function apProfilesQosValidateEdit2(frmId) {
	var txtFieldIdArr = new Array();
	txtFieldIdArr[0] = "tf1_apDataAIFSEdit2, Please enter valid AP EDCA Data 0 AIFS ";
	txtFieldIdArr[1] = "tf1_apDataMaxBurstEdit2, Please enter valid AP EDCA Data 0 Max. Burst";
	txtFieldIdArr[2] = "tf1_apData1AIFSEdit2, Please enter valid AP EDCA Data 1 AIFS ";
	txtFieldIdArr[3] = "tf1_apData1MaxBurstEdit2, Please enter valid AP EDCA Data 1 Max. Burst";
	txtFieldIdArr[4] = "tf1_apData2AIFSEdit2, Please enter valid AP EDCA Data 2 AIFS ";
	txtFieldIdArr[5] = "tf1_apData2MaxBurstEdit2, Please enter valid AP EDCA Data 2 Max. Burst";
	txtFieldIdArr[6] = "tf1_apData3AIFSEdit2, Please enter valid AP EDCA Data 3 AIFS ";
	txtFieldIdArr[7] = "tf1_apData3MaxBurstEdit2, Please enter valid AP EDCA Data 3 Max. Burst";
	txtFieldIdArr[8] = "tf1_stationDataAIFSEdit2, Please enter valid Station EDCA Data 0 AIFS";
	txtFieldIdArr[9] = "tf1_stationDataTXOPLimitEdit2, Please enter valid Station EDCA Data 0 TXOP Limit";
	txtFieldIdArr[10] = "tf1_stationData1AIFSEdit2, Please enter valid Station EDCA Data 1 AIFS";
	txtFieldIdArr[11] = "tf1_stationData1TXOPLimitEdit2, Please enter valid Station EDCA Data 1 TXOP Limit";
	txtFieldIdArr[12] = "tf1_stationData2AIFSEdit2, Please enter valid Station EDCA Data 2 AIFS";
	txtFieldIdArr[13] = "tf1_stationData2TXOPLimitEdit2, Please enter valid Station EDCA Data 2 TXOP Limit";
	txtFieldIdArr[14] = "tf1_stationData3AIFSEdit2, Please enter valid Station EDCA Data 3 AIFS";
	txtFieldIdArr[15] = "tf1_stationData3TXOPLimitEdit2, Please enter valid Station EDCA Data 3 TXOP Limit";

	if (txtFieldArrayCheck(txtFieldIdArr) == false)
		return false;
		
	if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;

	if (numericValueRangeCheck(document.getElementById('tf1_apDataAIFSEdit2'), '', '', 1, 255, true, 'Invalid AP EDCA Data 0 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_apDataMaxBurstEdit2'), '', '', 0, 999900, true, 'Invalid AP EDCA Data 0 Max. Burst', 'U. Sec. units.') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_apData1AIFSEdit2'), '', '', 1, 255, true, 'Invalid AP EDCA Data 1 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_apData1MaxBurstEdit2'), '', '', 0, 999900, true, 'Invalid AP EDCA Data 1 Max. Burst', 'U. Sec. units.') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_apData2AIFSEdit2'), '', '', 1, 255, true, 'Invalid AP EDCA Data 2 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_apData2MaxBurstEdit2'), '', '', 0, 999900, true, 'Invalid AP EDCA Data 2 Max. Burst', 'U. Sec. units.') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_apData3AIFSEdit2'), '', '', 1, 255, true, 'Invalid AP EDCA Data 3 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_apData3MaxBurstEdit2'), '', '', 0, 999900, true, 'Invalid AP EDCA Data 3 Max. Burst', 'U. Sec. units.') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_stationDataAIFSEdit2'), '', '', 1, 255, true, 'Invalid Station EDCA Data 0 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_stationDataTXOPLimitEdit2'), '', '', 0, 65535, true, 'Invalid Station EDCA Data 0 TXOP Limit', '32 U. Sec. units.') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_stationData1AIFSEdit2'), '', '', 1, 255, true, 'Invalid Station EDCA Data 1 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_stationData1TXOPLimitEdit2'), '', '', 0, 65535, true, 'Invalid Station EDCA Data 1 TXOP Limit', '32 U. Sec. units.') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_stationData2AIFSEdit2'), '', '', 1, 255, true, 'Invalid Station EDCA Data 2 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_stationData2TXOPLimitEdit2'), '', '', 0, 65535, true, 'Invalid Station EDCA Data 2 TXOP Limit', '32 U. Sec. units.') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_stationData3AIFSEdit2'), '', '', 1, 255, true, 'Invalid Station EDCA Data 3 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_stationData3TXOPLimitEdit2'), '', '', 0, 65535, true, 'Invalid Station EDCA Data 3 TXOP Limit', '32 U. Sec. units.') == false)
		return false;


	setHiddenChks(frmId);
	return true;
}

/**
 * function for changing the Template settings of radio buttons
 * Onclick event
 * @method changeTemplate
 * @param radioName - Radio button name
 */
function changeTemplateEdit2(radioName) {
	var selValue = radioCheckedValueGet(radioName);
	if (!selValue)
		return;
	switch (parseInt(selValue, 10)) {
		case 1:
			/* Custom */
			fieldStateChangeWr('', '', 'tf1_apDataAIFSEdit2 tf1_apDataCwMinEdit2 tf1_apDataCwMaxEdit2 tf1_apDataMaxBurstEdit2 tf1_apData1AIFSEdit2 tf1_apData1CwMinEdit2 tf1_apData1CwMaxEdit2 tf1_apData1MaxBurstEdit2 tf1_apData2AIFSEdit2 tf1_apData2CwMinEdit2 tf1_apData2CwMaxEdit2 tf1_apData2MaxBurstEdit2 tf1_apData3AIFSEdit2 tf1_apData3CwMinEdit2 tf1_apData3CwMaxEdit2 tf1_apData3MaxBurstEdit2 tf1_stationDataAIFSEdit2 tf1_stationDataCwMinEdit2 tf1_stationDataCwMaxEdit2 tf1_stationDataTXOPLimitEdit2 tf1_stationData1AIFSEdit2 tf1_stationData1CwMinEdit2 tf1_stationData1CwMaxEdit2 tf1_stationData1TXOPLimitEdit2 tf1_stationData2AIFSEdit2 tf1_stationData2CwMinEdit2 tf1_stationData2CwMaxEdit2 tf1_stationData2TXOPLimitEdit2 tf1_stationData3AIFSEdit2 tf1_stationData3CwMinEdit2 tf1_stationData3CwMaxEdit2 tf1_stationData3TXOPLimitEdit2', '');
			vidualDisplay('tf1_APEDCAParametersEdit2 tf1_StationEDCAParametersEdit2', 'configRow');
			break;

		case 2:
		/* Factory Default */
		case 3:
			/* Voice*/
			fieldStateChangeWr('tf1_apDataAIFSEdit2 tf1_apDataCwMinEdit2 tf1_apDataCwMaxEdit2 tf1_apDataMaxBurstEdit2 tf1_apData1AIFSEdit2 tf1_apData1CwMinEdit2 tf1_apData1CwMaxEdit2 tf1_apData1MaxBurstEdit2 tf1_apData2AIFSEdit2 tf1_apData2CwMinEdit2 tf1_apData2CwMaxEdit2 tf1_apData2MaxBurstEdit2 tf1_apData3AIFSEdit2 tf1_apData3CwMinEdit2 tf1_apData3CwMaxEdit2 tf1_apData3MaxBurstEdit2 tf1_stationDataAIFSEdit2 tf1_stationDataCwMinEdit2 tf1_stationDataCwMaxEdit2 tf1_stationDataTXOPLimitEdit2 tf1_stationData1AIFSEdit2 tf1_stationData1CwMinEdit2 tf1_stationData1CwMaxEdit2 tf1_stationData1TXOPLimitEdit2 tf1_stationData2AIFSEdit2 tf1_stationData2CwMinEdit2 tf1_stationData2CwMaxEdit2 tf1_stationData2TXOPLimitEdit2 tf1_stationData3AIFSEdit2 tf1_stationData3CwMinEdit2 tf1_stationData3CwMaxEdit2 tf1_stationData3TXOPLimitEdit2', '', '', '');
			vidualDisplay('tf1_APEDCAParametersEdit2 tf1_StationEDCAParametersEdit2', 'hide');
			break;
	}
}

