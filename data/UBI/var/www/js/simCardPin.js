/*
* File: simCardPin.js
* Created on 10th January 2017
* Copyright (c) 2017 Teamf1, Inc.
* All rights reserved.
*/
/**
 * This function calls when user clicks on submit button.
 * OnSubmit validation
 * @method pageValidate
 */
function pageValidate ()
    {
        var txtValidArray = new Array();
        txtValidArray[0] = "tf1_pinCode,"+LANG_LOCALE['50068'];

        if (txtFieldArrayCheck(txtValidArray) == false)
        return false;

        var pinNumber = $('#tf1_pinCode').val();

        if (pinNumber.length < 4) {
            alert(LANG_LOCALE['50069']);
            return false;
	    }
        setHiddenChks ('tf1_frmSimCardPin');
        return true;
}

