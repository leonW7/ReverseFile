/*
 * File: remoteLogging.js
 * Created on 22nd nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
$(document).ready(function(){
    /**
     * This function calls when user clicks on Checkbox images
     * OnClick validation
     * @method onloadCall
     */
    onloadCall(remoteLogingOnload, {
        imageId: 'tf1_emailLog',
        disableIndividual: 'tf1_txtEmailServerAddr4 tf1_txtPort tf1_txtEmailReturnAddr tf1_txtEmailSendAddr1 tf1_txtEmailSendAddr2 tf1_txtEmailSendAddr3 tf1_aughSMTP tf1_tlsSupport tf1_txtSmtpLoginUserName tf1_txtSmtpLoginPwd tf1_respondIdentdSMTP tf1_scheduleUnit tf1_emailLogByScheduleDay emailLogBySchedule',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break1 break2 break3 break4 break5 break6 break7 breakTlsSupport break8 break9 break10 break11 break12 break13 break14',
        breakClass: 'break',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    });
    
    /**
     * This function calls when page loads
     * OnLoad validation
     */
    remoteLogingOnload({
        imageId: 'tf1_emailLog',
        disableIndividual: 'tf1_txtEmailServerAddr4 tf1_txtPort tf1_txtEmailReturnAddr tf1_txtEmailSendAddr1 tf1_txtEmailSendAddr2 tf1_txtEmailSendAddr3 tf1_aughSMTP tf1_tlsSupport tf1_txtSmtpLoginUserName tf1_txtSmtpLoginPwd tf1_respondIdentdSMTP tf1_scheduleUnit tf1_emailLogByScheduleDay emailLogBySchedule tf1_dateTimePickerStartValue',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break1 break2 break3 break4 break5 break6 break7 breakTlsSupport break8 break9 break10 break11 break12 break13 break14',
        breakClass: 'break',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    })
    
    // date Time picker
				var curr = new Date().getFullYear();
				var opt = {}
				opt.time = {preset : 'time'};
				// start Time
				$('#tf1_dateTimePickerStart').val($('#tf1_dateTimePickerStartValue').val());
				$('#tf1_dateTimePickerStart').scroller('destroy').scroller(
					$.extend(
						opt["time"], { 					
							mode: "scroller", 
							display: "inline" 
						}
					)			
				);
});

function onchangeValueStart(){
				$('#tf1_dateTimePickerStartValue').val($('#tf1_dateTimePickerStart').val());
			}

function remoreLoginOnreset() {
remoteLogingOnload({
        imageId: 'tf1_emailLog',
        disableIndividual: 'tf1_txtEmailServerAddr4 tf1_txtPort tf1_txtEmailReturnAddr tf1_txtEmailSendAddr1 tf1_txtEmailSendAddr2 tf1_txtEmailSendAddr3 tf1_aughSMTP tf1_tlsSupport tf1_txtSmtpLoginUserName tf1_txtSmtpLoginPwd tf1_respondIdentdSMTP tf1_scheduleUnit tf1_emailLogByScheduleDay emailLogBySchedule tf1_dateTimePickerStartValue',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break1 break2 break3 break4 break5 break6 break7 breakTlsSupport break8 break9 break10 break11 break12 break13 break14',
        breakClass: 'break',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    })
}

/**
 * function for toggle the image
 * @method remoteLogingOnload
 * @param toggleObj - object
 */
function remoteLogingOnload(toggleObj){
    onAnchorToggle(toggleObj);
    var imgObj = document.getElementById('tf1_emailLog').className;
    var imageName = imgObj.substring(imgObj.lastIndexOf('/') + 1);
    if (imageName == ON_ANCHOR) {
        authenticationSMTPTypeChange('tf1_aughSMTP');
        emailSecheduleLogCheck('tf1_scheduleUnit1');
    }
}

/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method remoteLogingFormValidate
 */
function remoteLogingFormValidate(){

    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_txtLogId,"+LANG_LOCALE['12356'];
    txtFieldIdArr[1] = "tf1_txtEmailServerAddr4,"+LANG_LOCALE['12260'];
    txtFieldIdArr[2] = "tf1_txtEmailReturnAddr,"+LANG_LOCALE['12363'];
    txtFieldIdArr[3] = "tf1_txtEmailSendAddr1,"+LANG_LOCALE['12373'];
    txtFieldIdArr[4] = "tf1_txtSmtpLoginUserName,"+LANG_LOCALE['12380'];
    txtFieldIdArr[5] = "tf1_txtSmtpLoginPwd,"+LANG_LOCALE['12379'];
    txtFieldIdArr[6] = "tf1_dateTimePickerStartValue,"+LANG_LOCALE['12389'];
    txtFieldIdArr[7] = "tf1_txtPort,"+LANG_LOCALE['12381'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
    var txtFieldIdArr1 = new Array();
    txtFieldIdArr1[0] = "tf1_txtLogId,"+LANG_LOCALE['12356'];
    txtFieldIdArr1[1] = "tf1_txtEmailServerAddr4,"+LANG_LOCALE['12260'];
    txtFieldIdArr1[2] = "tf1_txtEmailReturnAddr,"+LANG_LOCALE['12363'];
    txtFieldIdArr1[3] = "tf1_txtEmailSendAddr1,"+LANG_LOCALE['12373'];
    txtFieldIdArr1[4] = "tf1_txtSmtpLoginUserName,"+LANG_LOCALE['12380'];
    txtFieldIdArr1[5] = "tf1_txtSmtpLoginPwd,"+LANG_LOCALE['12379'];
    txtFieldIdArr1[6] = "tf1_txtPort,"+LANG_LOCALE['12381'];

    if (isProblemCharArrayCheck(txtFieldIdArr1, '\'" ', NOT_SUPPORTED) == false) 
        return false;  
        
    var emailServerAddrObj = document.getElementById ('tf1_txtEmailServerAddr4');
    if (emailServerAddrObj && !emailServerAddrObj.disabled &&  emailServerAddrObj.value == "0.0.0.0") {
        alert (LANG_LOCALE['12006']);
        return false;
    }
    if (validateEmailCheck('tf1_txtEmailReturnAddr') == false) 
        return false;
    
    if (validateEmailCheck('tf1_txtEmailSendAddr1') == false) 
        return false;
    
    if (validateEmailCheck('tf1_txtEmailSendAddr2') == false) 
        return false;
    
    if (validateEmailCheck('tf1_txtEmailSendAddr3') == false) 
        return false;
        
    var portObj=document.getElementById("tf1_txtPort");
    if(portObj.value != '' && !portObj.disbled){  
    	if(numericValueRangeCheck (portObj, '', '', 1, 65535, true, LANG_LOCALE['11353'], '') == false)
    		return false;
    }	
    
    return true;
}

/**
 * Email check function: Checks the given Email Address Valid or not
 * @method validateEmailCheck
 * @param mailAddr - emailaddress
 */
function validateEmailCheck(mailAddr){
    var mail = document.getElementById(mailAddr);
    if (mail.disabled) 
        return true;
    var str = mail.value;
    if (str == "") 
        return true;
    var message = "";
    var errFlag = true;
    var at = "@"
    var dot = "."
    var lat = str.indexOf(at)
    var lstr = str.length
    var ldot = str.indexOf(dot)
    var message = ""
    
    if (lat == -1) {
        message = LANG_LOCALE['10868'];
        errFlag = false
    }
    else 
        if (lat == 0 || ((lat + 1) == lstr)) {
            message = LANG_LOCALE['11258'];
            errFlag = false
        }
        else 
            if (ldot == -1) {
                message = LANG_LOCALE['10867'];
                errFlag = false
            }
            else 
                if (ldot == 0 || ((ldot + 1) == lstr)) {
                    message = LANG_LOCALE['11257'];
                    errFlag = false
                }
                else 
                    if (str.indexOf(at, (lat + 1)) != -1) {
                        message = LANG_LOCALE['11256'];
                        errFlag = false
                    }
                    else 
                        if (str.substring(lat - 1, lat) == dot || str.substring(lat + 1, lat + 2) == dot) {
                            message = LANG_LOCALE['11256'];
                            errFlag = false
                        }
                        else 
                            if (str.indexOf(dot, (lat + 2)) == -1) {
                                message = LANG_LOCALE['11256'];
                                errFlag = false
                            }
                            else 
                                if (str.indexOf(" ") != -1) {
                                    message = LANG_LOCALE['11256'];
                                    errFlag = false
                                }
    var errFieldId = mailAddr + "Err";
    if (!errFlag) {
        alert(message);
        mail.focus();
    }
    return errFlag;
}

/**
 * function for changing the SMTP Authentication Type
 * Onclick event
 * @method authenticationSMTPTypeChange
 * @param radioName - Radio button name
 */
function authenticationSMTPTypeChange(radioName){
    var selValue = radioCheckedValueGet(radioName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* None */
            fieldStateChangeWr('tf1_tlsSupport tf1_txtSmtpLoginUserName tf1_txtSmtpLoginPwd', '', '', '');
            vidualDisplay('tf1_tlsSupport tf1_txtSmtpLoginUserName tf1_txtSmtpLoginPwd', 'hide');
            vidualDisplay('breakTlsSupport break8 break9', 'hide');
            break;
            
        case 2: /* Plain Login */
        case 3: /* CRAM-MD5 */
            fieldStateChangeWr('', '', 'tf1_tlsSupport tf1_txtSmtpLoginUserName tf1_txtSmtpLoginPwd', '');
            vidualDisplay('tf1_tlsSupport tf1_txtSmtpLoginUserName tf1_txtSmtpLoginPwd', 'configRow');
            vidualDisplay('breakTlsSupport break8 break9', 'break');
            break;
    }
}

/**
 * function for changing the E-Mail log by schedule
 * Onclick event
 * @method emailSecheduleLogCheck
 * @param radioName - Radio button name
 */
function emailSecheduleLogCheck(radioName){
    var selValue = radioCheckedValueGet(radioName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* Never */
            
        case 2: /* Hourly */
            fieldStateChangeWr('tf1_emailLogByScheduleDay tf1_dateTimePickerStartValue tf1_dateTimePickerStart', '', '', '');
            vidualDisplay('tf1_emailLogByScheduleDay tf1_dateTimePickerStartValue tf1_dateTimePickerStart', 'hide');
            vidualDisplay('break12', 'hide');
            break;
        case 3: /* Daily */
            fieldStateChangeWr('tf1_emailLogByScheduleDay', '', 'tf1_dateTimePickerStartValue tf1_dateTimePickerStart', '');
            vidualDisplay('tf1_emailLogByScheduleDay', 'hide');
            vidualDisplay('tf1_dateTimePickerStartValue tf1_dateTimePickerStart', 'configRow');
            vidualDisplay('break12', 'hide');
            break;
            
        case 4: /* Weekly */
            fieldStateChangeWr('', '', 'tf1_emailLogByScheduleDay tf1_dateTimePickerStartValue', '');
            vidualDisplay('tf1_emailLogByScheduleDay tf1_dateTimePickerStartValue tf1_dateTimePickerStart', 'configRow');
            vidualDisplay('break12', 'break');
            break;
    }
}


