/*
* File: pop3Server.js
* Created on 28th Nov 2012 - Laxmi
* Modified on 5th Feb 2015 - Ramakrishna Reddy P.M
* Copyright (c) 2012 TeamF1, Inc.
* All rights reserved.
*/

/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method pop3ServerFormValidate
 */
function pop3ServerFormValidate(frmId) {
	var txtFieldIdArr = new Array();
	txtFieldIdArr[0] = "tf1_popAuthServer1,"+LANG_LOCALE['12225']+1;
	txtFieldIdArr[1] = "tf1_popAuthPort1,"+LANG_LOCALE['12222']+1;
    txtFieldIdArr[2] = "tf1_popTimeout,"+LANG_LOCALE['12407'];
	txtFieldIdArr[3] = "tf1_popRetries,"+LANG_LOCALE['12362'];

	if (txtFieldArrayCheck(txtFieldIdArr) == false)
		return false;

	if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
	if (alphaNumericValueCheck('tf1_popAuthServer1', '.', '') == false) 
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_popAuthPort1'), '', '', 1, 65535, true, LANG_LOCALE['11221']+':', '') == false)
		return false;
	
    var authServer2Obj = document.getElementById('tf1_popAuthServer2');
    if (authServer2Obj.value != '')
        {
        if (alphaNumericValueCheck('tf1_popAuthServer2', '.', '') == false)
            return false;
        }

    var authServerPort2Obj = document.getElementById('tf1_popAuthPort2');
    if (authServerPort2Obj.value != '')
        {
        if (numericValueRangeCheck(document.getElementById('tf1_popAuthPort2'), '', '', 1, 65535, true, LANG_LOCALE['11221']+':', '') == false)
            return false;
        }

	//optional field validate
    var authServer3Obj = document.getElementById('tf1_popAuthServer3');
    if (authServer3Obj.value != '')
        {
        if (alphaNumericValueCheck('tf1_popAuthServer3', '.', '') == false)
            return false;
        }


    var authServerPort3Obj = document.getElementById('tf1_popAuthPort3');
    if (authServerPort3Obj.value != '')
        {
        if (numericValueRangeCheck(document.getElementById('tf1_popAuthPort3'), '', '', 1, 65535, true, LANG_LOCALE['11221']+':', '') == false)
            return false;
        }

    var timeObj = document.getElementById ('tf1_popTimeout');
    if (timeObj)
        {
            if (numericValueRangeCheck1 (timeObj, '', '', 1, true, LANG_LOCALE['30406']+':', LANG_LOCALE['12732']) == false)
                return false;
        }

    var retriObj = document.getElementById ('tf1_popRetries');
    if (retriObj)
        {
            if (numericValueRangeCheck1 (retriObj, '', '', 5, true, LANG_LOCALE['30407']+':', '') == false)
                return false;
        }
    
    var combinedValue = (document.getElementById('tf1_popTimeout').value) * (document.getElementById('tf1_popRetries').value);
    if (combinedValue > 30)
        {
            alert(LANG_LOCALE['30256']);
            return false;
        }

	setHiddenChks(frmId);
	return true;
}


$(document).ready(function() {
	onloadCall(pop3ServerOnload, {imageId: '', disableIndividual: '', disableGrp: '', enableIndividual: '', enableGrp: '', hideClass: 'hide', showClass: 'configRow', breakDivs: '', breakClass: 'break', imagesInfo: {disableImages: '', enableImages: '', disableClass: '', enableClass: ''}});
		
   enableTextFieldByAnchorClick('tf1_popSSLEnable1','tf1_popCAFile1','break_popCAFile1');
   enableTextFieldByAnchorClick('tf1_popSSLEnable2','tf1_popCAFile2','break_popCAFile2');
   enableTextFieldByAnchorClick('tf1_popSSLEnable3','tf1_popCAFile3','break_popCAFile3');

   var checkNow = $("#checkNowId").val ();

   if (checkNow == "1")
       {
           serverStatusWr ('pop3');
       }	
});

function pop3ServerOnreset(frmId) {
  resetImgOnOff(frmId);
   enableTextFieldByAnchorClick('tf1_popSSLEnable1','tf1_popCAFile1','break_popCAFile1');
   enableTextFieldByAnchorClick('tf1_popSSLEnable2','tf1_popCAFile2','break_popCAFile2');
   enableTextFieldByAnchorClick('tf1_popSSLEnable3','tf1_popCAFile3','break_popCAFile3');
}

function pop3ServerOnload(toggleObj, thisObj){
    onAnchorToggle(toggleObj);
    var imgId=thisObj.id;
    
    switch(imgId){
    	case 'tf1_popSSLEnable1':    		
    		   enableTextFieldByAnchorClick('tf1_popSSLEnable1','tf1_popCAFile1','break_popCAFile1');
    	break; 
    	case 'tf1_popSSLEnable2':    		
    		enableTextFieldByAnchorClick('tf1_popSSLEnable2','tf1_popCAFile2','break_popCAFile2');
    	break; 
    	case 'tf1_popSSLEnable3':    		
    		enableTextFieldByAnchorClick('tf1_popSSLEnable3','tf1_popCAFile3','break_popCAFile3');				
    	break;
    	   	
    }
}
