/*
 * File: pptpClient.js
 * Created on 30nd Oct 2012 - Bala Krishna G
 * Modified on 7th Nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
 var domainNameExt = new Array('.com', '.net', '.aero', '.asia', '.cat', '.jobs', '.org', '.biz', '.coop', '.info', '.museum', '.name', '.pro', '.tel', '.travel', '.edu', '.gov', '.int', '.mil', '.mobi', '.ac', '.ad', '.ae', '.af', '.ag', '.ai', '.al', '.am', '.an', '.ao', '.aq', '.ar', '.as', '.at', '.au', '.aw', '.ax', '.az', '.ba', '.bb', '.bd', '.be', '.bf', '.bg', '.bh', '.bi', '.bj', '.bm', '.bn', '.bo', '.br', '.bs', '.bt', '.bv', '.bw', '.by', '.bz', '.ca', '.cc', '.cd', '.cf', '.cg', '.ch', '.ci', '.ck', '.cl', '.cm', '.cn', '.co', '.cr', '.cu', '.cv', '.cx', '.cy', '.cz', '.de', '.dj', '.dk', '.dm', '.do', '.dz', '.ec', '.ee', '.eg', '.er', '.es', '.et', '.eu', '.fi', '.fj', '.fk', '.fm', '.fo', '.fr', '.ga', '.gb', '.gd', '.ge', '.gf', '.gg', '.gh', '.gi', '.gl', '.gm', '.gn', '.gp', '.gq', '.gr', '.gs', '.gt', '.gu', '.gw', '.gy', '.hk', '.hm', '.hn', '.hr', '.ht', '.hu', '.id', '.ie', '.il', '.im', '.in', '.io', '.iq', '.ir', '.is', '.it', '.je', '.jm', '.jo', '.jp', '.ke', '.kg', '.kh', '.ki', '.km', '.kn', '.kp', '.kr', '.kw', '.ky', '.kz', '.la', '.lb', '.lc', '.li', '.lk', '.lr', '.ls', '.lt', '.lu', '.lv', '.ly', '.ma', '.mc', '.md', '.me', '.mg', '.mh', '.mk', '.ml', '.mm', '.mn', '.mo', '.mp', '.mq', '.mr', '.ms', '.mt', '.mu', '.mv', '.mw', '.mx', '.my', '.mz', '.na', '.nc', '.ne', '.nf', '.ng', '.ni', '.nl', '.no', '.np', '.nr', '.nu', '.nz', '.om', '.pa', '.pe', '.pf', '.pg', '.ph', '.pk', '.pl', '.pm', '.pn', '.pr', '.ps', '.pt', '.pw', '.py', '.qa', '.re', '.ro', '.rw', '.ru', '.sa', '.sb', '.sc', '.sd', '.se', '.sg', '.sh', '.si', '.sj', '.sk', '.sl', '.sm', '.sn', '.so', '.sr', '.st', '.sv', '.sy', '.sz', '.tc', '.td', '.tf', '.tg', '.th', '.tj', '.tk', '.tm', '.tn', '.to', '.tp', '.tr', '.tt', '.tv', '.tw', '.tz', '.ua', '.ug', '.uk', '.um', '.us', '.uy', '.uz', '.va', '.vc', '.ve', '.vg', '.vi', '.vn', '.vu', '.ws', '.wf', '.ye', '.yt', '.yu', '.za', '.zm', '.zw');

/**
 * This function calls at the time of page loads
 * OnLoad validation
 * @method pptClientOnload
 */
$(document).ready(function(){

        onloadCall(pptpServerOnload, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
         enableTextFieldByAnchorClick('tf1_imageClientSetup','tf1_serverIP tf1_remoteNetwork tf1_RemoteMask tf1_UserName tf1_Password tf1_mppeEncrypt tf1_timeOut tf1_autoDial tf1_time','break1 break2 break3 break4 break5 break6 break7 break8 break9');
         
           if ($("#tf1_imageClientSetup").attr("class") == "enable-disable-on") {                
                enableTextFieldByAnchorClick('tf1_autoDial','tf1_time','break8');
            }
    });
   
/**
 * Onload function
 * @method pptpClientOnload
 * @param toggleObj - object
 */
function pptpServerOnload(data, thisObj){
    onAnchorToggle(data);
    var imgId=thisObj.id;
    
    switch(imgId){
           case 'tf1_imageClientSetup':
                enableTextFieldByAnchorClick('tf1_imageClientSetup','tf1_serverIP tf1_remoteNetwork tf1_RemoteMask tf1_UserName tf1_Password tf1_mppeEncrypt tf1_timeOut tf1_autoDial tf1_time','break1 break2 break3 break4 break5 break6 break7 break8 break9');
                if ($("#tf1_imageClientSetup").attr("class") == "enable-disable-on") {                
                   enableTextFieldByAnchorClick('tf1_autoDial','tf1_time','break8');
                 }
            
            break;     

           case 'tf1_autoDial':
                enableTextFieldByAnchorClick('tf1_autoDial','tf1_time','break8');
         break;		
	}
}

/****
 * This function calls when user clicks on submit button
 * On submit validation
 * @method pptpClientValidate
 */
function pptpClientValidate(frmId){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_serverIP, "+LANG_LOCALE['12118'];
    txtFieldIdArr[1] = "tf1_remoteNetwork, "+LANG_LOCALE['12100'];
    txtFieldIdArr[2] = "tf1_RemoteMask, "+LANG_LOCALE['12099'];
    txtFieldIdArr[3] = "tf1_UserName, "+LANG_LOCALE['12144'];
    txtFieldIdArr[4] = "tf1_Password, "+LANG_LOCALE['12074'];
    txtFieldIdArr[5] = "tf1_timeOut, "+LANG_LOCALE['12022'];
    txtFieldIdArr[6] = "tf1_time, "+LANG_LOCALE['30225'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
    
    var sysObj4 = document.getElementById('tf1_serverIP');
    if (sysObj4 && !sysObj4.disabled) {
        if(ipaddrValidate('tf1_serverIP') == false || validateFQDN('tf1_serverIP') == false) {
            sysObj4.focus();
            return false;
        }
    }
       
    if (ipv4Validate('tf1_remoteNetwork', 'SN', false, true, LANG_LOCALE['11281']+'. ', LANG_LOCALE['11031'], true) == false) 
        return false;
    
    var remoteNetMaskObj = document.getElementById('tf1_RemoteMask');
    if (remoteNetMaskObj && !remoteNetMaskObj.disabled) {
        if (numericValueRangeCheck(remoteNetMaskObj, '', '', 0, 32, true, LANG_LOCALE['11334']+': ', '') == false) 
            return false;
    }
    
    var idleTimeoutObj = document.getElementById('tf1_timeOut');
    if (idleTimeoutObj && !idleTimeoutObj.disabled) {
        if (numericValueRangeCheck(idleTimeoutObj, '', '', 300, 1800, true, LANG_LOCALE['11274']+': ', LANG_LOCALE['12732']) == false) 
            return false;
    }

    var idleTimeoutObj = document.getElementById('tf1_time');
    if (idleTimeoutObj && !idleTimeoutObj.disabled) {
        if (numericValueRangeCheck(idleTimeoutObj, '', '', 2, 30, true, LANG_LOCALE['30224']+': ', LANG_LOCALE['11718']) == false) 
            return false;
    }

    /* throw a pop up to user when old value is enabled */
    var featureValue = $('#hdFeature').val();
    if (featureValue == "1")
        {
        var proceed = confirm (LANG_LOCALE['50064']);
        if (proceed == false)
            {
            return false;
            }
        }

    setHiddenChks(frmId);    
    return true;
}


function pptpClientOnreset() {

  
        onloadCall(pptpServerOnload, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});

         enableTextFieldByAnchorClick('tf1_imageClientSetup','tf1_serverIP tf1_remoteNetwork tf1_RemoteMask tf1_UserName tf1_Password tf1_mppeEncrypt tf1_timeOut tf1_autoDial tf1_time','break1 break2 break3 break4 break5 break6 break7 break8 break9');
         
         enableTextFieldByAnchorClick('tf1_autoDial','tf1_time','break8');
  

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
        if (ipv4AddrValidate(ipAddrObj, 'IP', false, true, LANG_LOCALE['11281']+'. ', LANG_LOCALE['11031'], true) == false) {
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
        
        if (checkHostName(ipAddr, true, LANG_LOCALE['11282'], false) == false) 
            return false;
    }
    return true;
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
            alert(LANG_LOCALE['10855'])
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
