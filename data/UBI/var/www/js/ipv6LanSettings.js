/*
 * File: ipv6LanSettings.js
 * Created on 26th Oct 2012 - Bala Krishna G
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * Validating the form elements
 * @method lanSetupValidate
 * @param txtFieldIdArr
 */
function lanSetupValidate(frmId){

    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_ipv6_addr, "+LANG_LOCALE['12034'];
    txtFieldIdArr[1] = "tf1_ipv6_maxlength, "+LANG_LOCALE['12036'];
    txtFieldIdArr[2] = "tf1_ipv6_DomName, "+LANG_LOCALE['12002'];
    txtFieldIdArr[3] = "tf1_serpre, "+LANG_LOCALE['12119'];
    txtFieldIdArr[4] = "tf1_ipv6_PriDnsServer,"+LANG_LOCALE['12091'];
    txtFieldIdArr[5] = "tf1_ipv6_SecDnsServer,"+LANG_LOCALE['12108'];
    txtFieldIdArr[6] = "tf1_ipv6_leasetime,"+LANG_LOCALE['12040'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv6Validate('tf1_ipv6_addr', false, true, '') == false) 
        return false;
    var preLenObj = document.getElementById('tf1_ipv6_maxlength');
    if (numericValueRangeCheck(preLenObj, '', '', 1, 128, true, LANG_LOCALE['11286']+': ', '') == false) 
        return false;
    
    if (checkHostName('tf1_ipv6_DomName', true, 'Invalid Domain name: ', false) == false) 
        return false;
    
    var svrPrefObj = document.getElementById('tf1_serpre');
    if (!svrPrefObj) 
        return;
    if (!svrPrefObj.disabled) {
        if (numericValueRangeCheck(svrPrefObj, '', '', 0, 255, true, LANG_LOCALE['11350']+': ', '') == false) 
            return false;
    }
    
    if (ipv6Validate('tf1_ipv6_PriDnsServer', false, true, '') == false) 
        return false;
    
    if (ipv6Validate('tf1_ipv6_SecDnsServer', false, true, '') == false) 
        return false;
    
    var leaseTimeObj = document.getElementById('tf1_ipv6_leasetime');
    if (!leaseTimeObj) 
        return;
    if (!leaseTimeObj.disabled) 
        if (numericValueRangeCheck(leaseTimeObj, '', '', 0, 604800, true, LANG_LOCALE['11290']+': ', LANG_LOCALE['12732']) == false) 
            return false;
            
    setHiddenChks(frmId);     
    return true;
}

/**
 * Wrapper function called onload
 * @method changeDhcpStatus
 * @param obj
 */
function changeDhcpStatus(toggleObj){
    onAnchorToggle(toggleObj);
    dnsServerChange();
    modeChange('tf1_stateless');
}

/**
 * DNS Server Change
 * @method dnsServerChange
 */
function dnsServerChange(){
    var tf1_DnsSvrsObj = document.getElementById('tf1_DnsSvrs');
    if (tf1_DnsSvrsObj && !tf1_DnsSvrsObj.disabled) {
        var selValue = parseInt(tf1_DnsSvrsObj.value, 10);
        if (selValue == 1 || selValue == 2) {
            fieldStateChangeWr("tf1_ipv6_PriDnsServer tf1_ipv6_SecDnsServer", "", "", "");
            vidualDisplay("tf1_ipv6_PriDnsServer tf1_ipv6_SecDnsServer", 'hide');
            vidualDisplay("break4 break5", 'hide');
        }
        else {
            fieldStateChangeWr("", "", "tf1_ipv6_SecDnsServer tf1_ipv6_PriDnsServer", "");
            vidualDisplay("tf1_ipv6_PriDnsServer tf1_ipv6_SecDnsServer", 'configRow');
            vidualDisplay("break4 break5", 'break');
        }
    }
}

/**
 * State Mode Change
 * @method modeChange
 */
function modeChange(radioName){
    var selValue = radioCheckedValueGet(radioName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 0: /* Stateful */
            fieldStateChangeWr("tf1_prefix_del", "", "", "");
            vidualDisplay("tf1_prefix_del break7", 'hide');
            break;
            
        case 1: /* Stateless */
            fieldStateChangeWr("", "", "tf1_prefix_del", "");
            vidualDisplay("tf1_prefix_del", 'configRow');
            vidualDisplay("break7", 'break');
            break;
    }
}

jQuery(function(){
    onloadCall(changeDhcpStatus, {
        imageId: 'tf1_dhcpState',
        disableIndividual: 'tf1_ipv6_DomName tf1_DnsSvrs tf1_ipv6_PriDnsServer tf1_ipv6_SecDnsServer tf1_ipv6_leasetime tf1_serpre tf1_stateless tf1_stateful tf1_prefix_del',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break1 break2 break3 break4 break5 break6 break7 break8',
        breakClass: 'break',
        imagesInfo: {
            disableImages: 'tf1_prefix_del',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    })
});

// On body load call the respective function
window.onload = function(){
    changeDhcpStatus({
        imageId: 'tf1_dhcpState',
        disableIndividual: 'tf1_ipv6_DomName tf1_DnsSvrs tf1_ipv6_PriDnsServer tf1_ipv6_SecDnsServer tf1_ipv6_leasetime tf1_serpre tf1_stateless tf1_stateful tf1_prefix_del',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break1 break2 break3 break4 break5 break6 break7 break8',
        breakClass: 'break',
        imagesInfo: {
            disableImages: 'tf1_prefix_del',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    });
}
/* function reset 

*/

function lanSetupOnReset(frmId) {

resetImgOnOff(frmId);

changeDhcpStatus({
        imageId: 'tf1_dhcpState',
        disableIndividual: 'tf1_ipv6_DomName tf1_DnsSvrs tf1_ipv6_PriDnsServer tf1_ipv6_SecDnsServer tf1_ipv6_leasetime tf1_serpre tf1_stateless tf1_stateful tf1_prefix_del',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break1 break2 break3 break4 break5 break6 break7 break8',
        breakClass: 'break',
        imagesInfo: {
            disableImages: 'tf1_prefix_del',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    });
    
    }

