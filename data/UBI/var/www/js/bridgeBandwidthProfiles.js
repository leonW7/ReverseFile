/*
 * File: bandwidthProfiles.js
 * Created on 19th May 2014 - Ramakrishna Reddy P.M
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
 
function onLoadBridgeBandwidthProFn () {
        
                onloadCall (enableDisableFieldsByImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
		bridgeBandwidthProfileStatusCheck ();

            }

function enableDisableFieldsByImageClick(data, thisObj) { 
    onAnchorToggle (data);
}

/**
 * This function calls when user clicks on submit button
 * On submit validation
 * @method bridgeBandwidthProfilesValidation
 */
function bridgeBandwidthProfilesValidation () {
    var txtValidArray = new Array();
    txtValidArray[0] = "tf1_bridgeName, "+LANG_LOCALE['12064'];
    txtValidArray[1] = "tf1_minBandwidth, "+LANG_LOCALE['12059'];
    txtValidArray[2] = "tf1_maxBandwidth, "+LANG_LOCALE['12052'];
    
    if (txtFieldArrayCheck(txtValidArray) == false) 
        return false;

    if (alphaNumericValueCheck ("tf1_bridgeName", '', '') == false)    
        return false;

    var usrLimitObjMax = document.getElementById ('tf1_maxBandwidth');
	if (numericValueRangeCheck (usrLimitObjMax, '', '', 100, 1000000, true, LANG_LOCALE['30164']+'.', LANG_LOCALE['11488']) == false)
		return false;

	var usrLimitObjMin = document.getElementById ('tf1_minBandwidth');
	if (numericValueRangeCheck (usrLimitObjMin, '', '',1, parseInt(usrLimitObjMax.value, 10), true, LANG_LOCALE['30165']+'.', LANG_LOCALE['11488']) == false)
		return false;

	setHiddenChks('tf1_frmBridgeBandwidthConfig');
    return true;
}

function bridgeBandwidthProfileStatusCheck ()
	{
	var selValue = comboSelectedValueGet ('tf1_profileType');
	if (!selValue) return;
	switch (parseInt(selValue, 10))
		{
		case 0:	/* PRIORITY */
			fieldStateChangeWr ('tf1_minBandwidth tf1_maxBandwidth','','tf1_priority','');
			vidualDisplay('tf1_minBandwidth tf1_maxBandwidth break_minBandwidth break_maxBandwidth', 'hide');
			vidualDisplay('tf1_priority', 'configRow');
			vidualDisplay('break_priority', 'break');
			break;
		case 1:	/* RATE */
			fieldStateChangeWr ('tf1_priority', '', 'tf1_minBandwidth tf1_maxBandwidth', '');
			vidualDisplay('tf1_priority break_priority', 'hide');
			vidualDisplay('tf1_minBandwidth tf1_maxBandwidth', 'configRow');
			vidualDisplay('break_minBandwidth break_maxBandwidth', 'break');
			break;
		}
	}

function pageValidateBw (frmId) {
    var bwImgObj = $('#bwStatus').attr('class');
    var bwValue = $('#tf1_hdBwStatus').val();

    if (bwImgObj == ON_ANCHOR && bwValue == '0') {
        var proceed = confirm(LANG_LOCALE['50211']);
        if (proceed == false) {
            resetImgOnOff(frmId);
            return false;
        }
    }
    setHiddenChks(frmId);
    return true;
}
