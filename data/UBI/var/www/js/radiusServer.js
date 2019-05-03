/*
 * File: radiusServer.js
 * Created on 31nd Oct 2012 - Ramakrishna Reddy P.M
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/****
 * Validating the IP related fields
 * @method radiusValidate
 *
 */

/* While loading the page below part of code will execute */
$(document).ready (function (){
    var checkNow = $("#checkNowId").val ();

    if (checkNow == "1")
        {
            serverStatusWr ('Radius');
        }
});

function radiusValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_IpAddress,"+LANG_LOCALE['12029'];
    txtFieldIdArr[1] = "tf1_AuthPort,"+LANG_LOCALE['11971'];
    txtFieldIdArr[2] = "tf1_Secret,"+LANG_LOCALE['12112'];
    txtFieldIdArr[3] = "tf1_TimeOut,"+LANG_LOCALE['12137'];
    txtFieldIdArr[4] = "tf1_Retries,"+LANG_LOCALE['12104'];
    txtFieldIdArr[5] = "tf1_IpAddress2,"+LANG_LOCALE['12030'];
    txtFieldIdArr[6] = "tf1_AuthPort2,"+LANG_LOCALE['11972'];
    txtFieldIdArr[7] = "tf1_Secret2,"+LANG_LOCALE['12113'];
    txtFieldIdArr[8] = "tf1_TimeOut2,"+LANG_LOCALE['12138'];
    txtFieldIdArr[9] = "tf1_Retries2,"+LANG_LOCALE['12105'];
   txtFieldIdArr[10] = "tf1_IpAddress3,"+LANG_LOCALE['30244'];
    txtFieldIdArr[11] = "tf1_AuthPort3,"+LANG_LOCALE['30245'];
    txtFieldIdArr[12] = "tf1_Secret3,"+LANG_LOCALE['30246'];
    txtFieldIdArr[13] = "tf1_TimeOut3,"+LANG_LOCALE['30247'];
    txtFieldIdArr[14] = "tf1_Retries3,"+LANG_LOCALE['30248'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;


    
    if (ipv4Validate('tf1_IpAddress', 'IP', false, true, LANG_LOCALE['11974']+'. ', LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if (ipv4Validate('tf1_IpAddress2', 'IP', false, true, LANG_LOCALE['11974']+'. ', LANG_LOCALE['11031'], true) == false) 
        return false;
        
     if (ipv4Validate('tf1_IpAddress3', 'IP', false, true, LANG_LOCALE['11974']+'. ', LANG_LOCALE['11031'], true) == false) 
        return false;

	/* Primary, Secondary abd Tertiary IP addresses should not be same */
	var firstIP  = document.getElementById ('tf1_IpAddress').value;
	var secondIP = document.getElementById ('tf1_IpAddress2').value;
	var thirdIP  = document.getElementById ('tf1_IpAddress3').value;

	if (firstIP != '' && secondIP != '' && thirdIP != '')
		{
			if (firstIP == secondIP)
				{
					alert(LANG_LOCALE['30249']);
					return false;
				}
			if (secondIP == thirdIP)
				{
					alert(LANG_LOCALE['30250']);
					return false;
				}
			if (firstIP == thirdIP)
				{
					alert(LANG_LOCALE['30251']);
					return false;
				}
		}
    
      
    /* get and validate port */
    var obj = document.getElementById('tf1_AuthPort');
    if (numericValueRangeCheck(obj, '', '', 0, 65535, true, LANG_LOCALE['11970'], '') == false) 
        return false; 
    
    /* get and validate TimeOut */
    obj = document.getElementById('tf1_TimeOut');
    if (numericValueRangeCheck(obj, '', '', 1, 999, true, LANG_LOCALE['13491']+'.', LANG_LOCALE['12732']+'.') == false) 
        return false;
    
    /* get and validate Retry */
    obj = document.getElementById('tf1_Retries');
    if (numericValueRangeCheck(obj, '', '', 1, 999, true, LANG_LOCALE['11336']+'.', "") == false) 
        return false;
		
	 /* get and validate port */
    var obj = document.getElementById('tf1_AuthPort2');
    if (numericValueRangeCheck(obj, '', '', 0, 65535, true, LANG_LOCALE['11221']+'.', '') == false) 
        return false;
		
	/* get and validate TimeOut */
    obj = document.getElementById('tf1_TimeOut2');
    if (numericValueRangeCheck(obj, '', '', 1, 999, true, LANG_LOCALE['13491']+'.', LANG_LOCALE['12732']) == false) 
        return false;
    
    /* get and validate Retry */
    obj = document.getElementById('tf1_Retries2');
    if (numericValueRangeCheck(obj, '', '', 1, 999, true, LANG_LOCALE['11336']+'.', "") == false) 
        return false;
    
    
     /* get and validate port */
    var obj = document.getElementById('tf1_AuthPort3');
    if (numericValueRangeCheck(obj, '', '', 0, 65535, true, LANG_LOCALE['11221']+'.', '') == false) 
        return false;
		
	/* get and validate TimeOut */
    obj = document.getElementById('tf1_TimeOut3');
    if (numericValueRangeCheck(obj, '', '', 1, 999, true, LANG_LOCALE['13491']+'.', LANG_LOCALE['12732']) == false) 
        return false;
    
    /* get and validate Retry */
    obj = document.getElementById('tf1_Retries3');
    if (numericValueRangeCheck(obj, '', '', 1, 999, true, LANG_LOCALE['11336']+".", "") == false) 
        return false;

    
    return true;
}
