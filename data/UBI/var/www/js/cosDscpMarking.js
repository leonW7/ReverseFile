/*
 * File: cosDscpMarking.js
 * Created on 28th Nov 2012 - Laxmi
 * Modified on 30th Nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */

$(document).ready(function() {
	onloadCall();
	 
});

/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method cosDscpMarkingFormValidate
 */
function cosDscpMarkingFormValidate() {

	var txtFieldIdArr = new Array();
	txtFieldIdArr[0] = "tf1_CoS,Please enter valid CoS";

	if (txtFieldArrayCheck(txtFieldIdArr) == false)
		return false;
		
	if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;

	if (numericValueRangeCheck(document.getElementById('tf1_CoS'), '', '', 0, 7, true, 'Invalid CoS Value', '') == false)
		return false;

	return true;
}
