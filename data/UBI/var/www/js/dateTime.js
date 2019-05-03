/*
 * File: dateTime.js
 * Created on 8th Nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
var domainNameExt = new Array('.com', '.net', '.aero', '.asia', '.cat', '.jobs', '.org', '.biz', '.coop', '.info', '.museum', '.name', '.pro', '.tel', '.travel', '.edu', '.gov', '.int', '.mil', '.mobi', '.ac', '.ad', '.ae', '.af', '.ag', '.ai', '.al', '.am', '.an', '.ao', '.aq', '.ar', '.as', '.at', '.au', '.aw', '.ax', '.az', '.ba', '.bb', '.bd', '.be', '.bf', '.bg', '.bh', '.bi', '.bj', '.bm', '.bn', '.bo', '.br', '.bs', '.bt', '.bv', '.bw', '.by', '.bz', '.ca', '.cc', '.cd', '.cf', '.cg', '.ch', '.ci', '.ck', '.cl', '.cm', '.cn', '.co', '.cr', '.cu', '.cv', '.cx', '.cy', '.cz', '.de', '.dj', '.dk', '.dm', '.do', '.dz', '.ec', '.ee', '.eg', '.er', '.es', '.et', '.eu', '.fi', '.fj', '.fk', '.fm', '.fo', '.fr', '.ga', '.gb', '.gd', '.ge', '.gf', '.gg', '.gh', '.gi', '.gl', '.gm', '.gn', '.gp', '.gq', '.gr', '.gs', '.gt', '.gu', '.gw', '.gy', '.hk', '.hm', '.hn', '.hr', '.ht', '.hu', '.id', '.ie', '.il', '.im', '.in', '.io', '.iq', '.ir', '.is', '.it', '.je', '.jm', '.jo', '.jp', '.ke', '.kg', '.kh', '.ki', '.km', '.kn', '.kp', '.kr', '.kw', '.ky', '.kz', '.la', '.lb', '.lc', '.li', '.lk', '.lr', '.ls', '.lt', '.lu', '.lv', '.ly', '.ma', '.mc', '.md', '.me', '.mg', '.mh', '.mk', '.ml', '.mm', '.mn', '.mo', '.mp', '.mq', '.mr', '.ms', '.mt', '.mu', '.mv', '.mw', '.mx', '.my', '.mz', '.na', '.nc', '.ne', '.nf', '.ng', '.ni', '.nl', '.no', '.np', '.nr', '.nu', '.nz', '.om', '.pa', '.pe', '.pf', '.pg', '.ph', '.pk', '.pl', '.pm', '.pn', '.pr', '.ps', '.pt', '.pw', '.py', '.qa', '.re', '.ro', '.rw', '.ru', '.sa', '.sb', '.sc', '.sd', '.se', '.sg', '.sh', '.si', '.sj', '.sk', '.sl', '.sm', '.sn', '.so', '.sr', '.st', '.sv', '.sy', '.sz', '.tc', '.td', '.tf', '.tg', '.th', '.tj', '.tk', '.tm', '.tn', '.to', '.tp', '.tr', '.tt', '.tv', '.tw', '.tz', '.ua', '.ug', '.uk', '.um', '.us', '.uy', '.uz', '.va', '.vc', '.ve', '.vg', '.vi', '.vn', '.vu', '.ws', '.wf', '.ye', '.yt', '.yu', '.za', '.zm', '.zw');


/**
 * This function calls when user clicks on OnOff Buttons
 * OnClick validation
 * @method onloadCall
 */
$(document).ready(function(){
    onloadCall(dateTimeOnload, {
        imageId: '',
        disableIndividual: '',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: '',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    });
   
    disableTextFieldByAnchorClick('tf1_ntpServers','tf1_setDateTimeValue','','tf1_setDateTimeBlock');
    enableTextFieldByAnchorClick('tf1_ntpServers','tf1_ReSync tf1_radNtp1 tf1_radNtp2 tf1_ReSync tf1_radNtp tf1_customNtp1 tf1_customNtp2','break1 break_ReSync break_customNtp1 break_customNtp2','');
 NtpSvrTypeCheck('tf1_radNtp1');

});

/**
 * Onload function
 * @method optionSetupOnload
 * @param toggleObj - object
 */
function dateTimeOnload(toggleObj,thisObject){
    onAnchorToggle(toggleObj);
    var imgId = thisObject.id;
   	if (imgId == "tf1_ntpServers" ) {
  	 disableTextFieldByAnchorClick(imgId,'tf1_setDateTimeValue','','tf1_setDateTimeBlock');	 
	 enableTextFieldByAnchorClick('tf1_ntpServers','tf1_ReSync tf1_radNtp1 tf1_radNtp2 tf1_ReSync tf1_radNtp tf1_customNtp1 tf1_customNtp2','break1 break_ReSync break_customNtp1 break_customNtp2','');
	 NtpSvrTypeCheck('tf1_radNtp1');
	}
     
}
function dateTimeOnReset(frmId){
	resetImgOnOff(frmId);
    disableTextFieldByAnchorClick('tf1_ntpServers','tf1_setDateTimeValue','','tf1_setDateTimeBlock');
    enableTextFieldByAnchorClick('tf1_ntpServers','tf1_ReSync tf1_radNtp1 tf1_radNtp2 tf1_ReSync tf1_radNtp tf1_customNtp1 tf1_customNtp2','break1 break_ReSync break_customNtp1 break_customNtp2','');
    NtpSvrTypeCheck('tf1_radNtp1');
}
/****
 * This function calls when User clicks on Submit button
 * OnSubmit Validation
 * @method pageValidate
 */
function dateTimeValidate(frmId){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_customNtp1,"+LANG_LOCALE['12093'];
    txtFieldIdArr[1] = "tf1_customNtp2,"+LANG_LOCALE['12109'];
    txtFieldIdArr[2] = "tf1_setDateTimeValue,"+LANG_LOCALE['11983'];
    txtFieldIdArr[3] = "tf1_ReSync,"+LANG_LOCALE['30327'];

    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    var txtFieldIdArr1 = new Array();
    txtFieldIdArr1[0] = "tf1_customNtp1,"+LANG_LOCALE['12093'];
    txtFieldIdArr1[1] = "tf1_customNtp2,"+LANG_LOCALE['12109'];

    if (isProblemCharArrayCheck(txtFieldIdArr1, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipaddrValidate('tf1_customNtp1') == false) 
        return false;
    
    if (ipaddrValidate('tf1_customNtp2') == false) 
        return false;
    
    var reSyncObj = document.getElementById("tf1_ReSync");
    if (!numericValueRangeCheck(reSyncObj, '', '', 5, 1440, true, LANG_LOCALE['11372']+': ', '')) 
        return false;
    
    setHiddenChks(frmId);
    return true;
}

/****
 * This function calls to check the param data is valid domain or Ip or not
 * @method ipaddrValidate
 * @param ipAddr - ipaddress/domain name
 */
function ipaddrValidate(ipAddr){
    var lastOctateVal = 0;
    var ipAddrObj = document.getElementById(ipAddr);
    if (!ipAddrObj || ipAddrObj.disabled) 
        return true;
    var ipAddrObjArr = (ipAddrObj.value).split(".");
    if (ipAddrObjArr.length == 1) {
        alert(LANG_LOCALE['11283']);
        ipAddrObj.focus();
        return false;
    }
    if (ipAddrObjArr.length) 
        lastOctateVal = ipAddrObjArr[ipAddrObjArr.length - 1];
    if (!isNaN(lastOctateVal)) {
        if (ipv4AddrValidate(ipAddrObj, 'IP', false, true, LANG_LOCALE['11281']+'.', LANG_LOCALE['11031'], true) == false) {
            ipAddrObj.focus();
            return false;
        }
    }
    else {
        if (checkDomainExtension(lastOctateVal) == false) {
            alert(LANG_LOCALE['12003']);
            return false;
        }
        if (ipAddrObj.value.length > 253 || ipAddrObj.value.length < 1) {
            alert(LANG_LOCALE['13061']);
            return false;
        }
        if (checkEachNodeLength(ipAddrObjArr) == false) 
            return false;
        
        if (checkHostName(ipAddr, true, LANG_LOCALE['11282']+': ', false) == false) 
            return false;
        return true;
    }
}

/*
 function: checkEachNodeLength
 parameters: Array of nodes in a domain name.
 purpose : Checks is number of characters in a node of a domain exceeds 63 characters.
 return : true or false;
 @param nodeArray - ipaddress/domain name
 */
function checkEachNodeLength(nodeArray){
    for (var i = 0; i <= nodeArray.length - 1; i++) {
        var node = nodeArray[i];
        if (node.length > 63) {
            alert(LANG_LOCALE['10855']);
            return false;
        }
    }
    return true;
}

/*
 function: checkDomainExtension
 parameters: last octate value of domain name.
 purpose : checks if the extension falls in the specified domains.
 return : true or false;
 @param lastOctateVal - extention
 */
function checkDomainExtension(lastOctateVal){
    var ext = "." + lastOctateVal;
    for (var i = 0; i <= domainNameExt.length - 1; i++) {
        if (ext == domainNameExt[i]) 
            return true;
    }
    return false;
}

/**
 * This function calls when user clicks on NTP Server Type
 * OnClick validation
 * @method NtpSvrTypeCheck
 * @param data - Type of radio
 */
function NtpSvrTypeCheck(data){
	var selectedValue = radioCheckedValueGet(data);
    if (!selectedValue) 
        return;
    
    switch (parseInt(selectedValue, 10)) {
        case 1: /* Default */
            fieldStateChangeWr('tf1_customNtp1 tf1_customNtp2', '', '', '');
            vidualDisplay('tf1_customNtp1 tf1_customNtp2', 'hide');
            vidualDisplay('break1 break2', 'hide');
            break;
            
        case 2: /* Custom */
            fieldStateChangeWr('', '', 'tf1_customNtp1 tf1_customNtp2', '');
            vidualDisplay('tf1_customNtp1 tf1_customNtp2', 'configRow');
            vidualDisplay('break1 break2',