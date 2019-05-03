/*
 * File: apProfileConfig.js    
 * Created on 11th Feb 2013 - Lakshmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * This function calls Page loads
 * Onload validation
 * @method onloadCall
 */   
function onloadAPProfileRadioFn() {    
    /* Edit */
    enableTextFieldByAnchorClick('tf1_radioLoadBalancing','tf1_radioLoadValue','break_radioLoadValue');
    enableTextFieldByAnchorClick('tf1_radioRFScan','tf1_radioRFScanInterval','break_radioRFScanInterval');
    enableTextFieldByAnchorClick('tf1_radioRFScanSentry','tf1_radioRFScanSentryChannel1 tf1_radioRFScanSentryChannel2','break_radioRFScanSentryChannel1 break_radioRFScanSentryChannel2');
    enableTextFieldByAnchorClick('tf1_radioRateLimiting','tf1_radioRateLimit tf1_radioRateLimitBurst','break_radioRateLimit break_radioRateLimitBurst');
    toggleRfscanDuration();
    //ChannelBandwidthType('tf1_radioChannelBandwidth','channelBlock40','channelBlock20');    
}
function onloadAPProfileRadioEdit2Fn() {    
    /* Edit2 */
    
    enableTextFieldByAnchorClick('tf1_radioLoadBalancingEdit2','tf1_radioLoadValueEdit2','break_radioLoadValueEdit2');
    enableTextFieldByAnchorClick('tf1_radioRFScanEdit2','tf1_radioRFScanIntervalEdit2 tf1_radioFragThresholdEdit2','break_radioRFScanIntervalEdit2 break_radioFragThresholdEdit2');
    enableTextFieldByAnchorClick('tf1_radioRFScanSentryEdit2','tf1_radioRFScanSentryChannel1Edit2 tf1_radioRFScanSentryChannel2Edit2','break_radioRFScanSentryChannel1Edit2 break_radioRFScanSentryChannel2Edit2');
    enableTextFieldByAnchorClick('tf1_radioRateLimitingEdit2','tf1_radioRateLimitEdit2 tf1_radioRateLimitBurstEdit2','break_radioRateLimitEdit2 break_radioRateLimitBurstEdit2');
    //ChannelBandwidthType('tf1_radioChannelBandwidthEdit2','channelBlock40Edit2','channelBlock20Edit2');
}

/**
* displays corresponding fields on ImageToggle
* @method toggleRfscanDuration
* @param data - image data
* @param thisObj - currtent image id
*/
function toggleRfscanDuration () {

   // tf1_radioRFScan, tf1_radioRFScanSentry, tf1_radioRFScanDuration
       if ($("#tf1_radioRFScan").attr("class") == "enable-disable-off" &&  $("#tf1_radioRFScanSentry").attr("class") == "enable-disable-off")
        {
               fieldStateChangeWr ('tf1_radioRFScanDuration','','','');
            vidualDisplay ('tf1_radioRFScanDuration', 'hide');
               vidualDisplay ('break_radioRFScanDuration', 'hide');
        }
    else
        {
            fieldStateChangeWr ('','','tf1_radioRFScanDuration','');
            vidualDisplay ('tf1_radioRFScanDuration', 'configRow');
              vidualDisplay ('break_radioRFScanDuration', 'break');
        }


}

/**
* displays corresponding fields on ImageToggle
* @method enableDisableFieldsByImageClick
* @param data - image data
* @param thisObj - currtent image id
*/
function enableDisableFieldsByImageClick(data, thisObj) { 
    onAnchorToggle(data);
    var imgId=thisObj.id;
    if(!imgId) return;
    switch(imgId){        
        /* Edit */
        case 'tf1_radioLoadBalancing':
            enableTextFieldByAnchorClick('tf1_radioLoadBalancing','tf1_radioLoadValue','break_radioLoadValue');
        break;
        case 'tf1_radioRFScan':
            enableTextFieldByAnchorClick('tf1_radioRFScan','tf1_radioRFScanInterval','break_radioRFScanInterval');
            toggleRfscanDuration();
        break;
        case 'tf1_radioRFScanSentry':
            enableTextFieldByAnchorClick('tf1_radioRFScanSentry','tf1_radioRFScanSentryChannel1 tf1_radioRFScanSentryChannel2','break_radioRFScanSentryChannel1 break_radioRFScanSentryChannel2');
            toggleRfscanDuration();
        break;
        case 'tf1_radioRateLimiting':
            enableTextFieldByAnchorClick('tf1_radioRateLimiting','tf1_radioRateLimit tf1_radioRateLimitBurst','break_radioRateLimit break_radioRateLimitBurst');
        break;
        
        /* Edit2 */
        case 'tf1_radioLoadBalancingEdit2':
            enableTextFieldByAnchorClick('tf1_radioLoadBalancingEdit2','tf1_radioLoadValueEdit2','break_radioLoadValueEdit2');
        break;
        case 'tf1_radioRFScanEdit2':
            enableTextFieldByAnchorClick('tf1_radioRFScanEdit2','tf1_radioRFScanIntervalEdit2 tf1_radioFragThresholdEdit2','break_radioRFScanIntervalEdit2 break_radioFragThresholdEdit2');
        break;
        case 'tf1_radioRFScanSentryEdit2':
            enableTextFieldByAnchorClick('tf1_radioRFScanSentryEdit2','tf1_radioRFScanSentryChannel1Edit2 tf1_radioRFScanSentryChannel2Edit2','break_radioRFScanSentryChannel1Edit2 break_radioRFScanSentryChannel2Edit2');
        break;
        case 'tf1_radioRateLimitingEdit2':
            enableTextFieldByAnchorClick('tf1_radioRateLimitingEdit2','tf1_radioRateLimitEdit2 tf1_radioRateLimitBurstEdit2','break_radioRateLimitEdit2 break_radioRateLimitBurstEdit2');
        break;

    }
}

/****
 * This function calls when user selects an option from radio button
 * OnChange event
 * @method ChannelBandwidthType
 * @param selName - Select box Name
 */
function ChannelBandwidthType(selName,hideBlock,showBlock){

    openFormOnChange();

    /*
    fieldStateChangeWr (hideBlock,'',showBlock,'');
    vidualDisplay (hideBlock, 'hide')
    vidualDisplay (showBlock, 'configRow')
    */
}

/**
 * function for for form refresh in popup window
 * onchange event
 * @method changeRadioMode
 */

function changeRadioMode() {

 var confMessage = confirm("All changes will be saved to the configuration and some values may be reset to default based on mode. The Local AP Database channels will be reset to Auto if they become invalid due to the change in the profile radio mode. Do you want to modify the radio mode?");

  if (confMessage == false) {
    $("input[name='apProfilesRadio.OPERTINGMODE'][value=" + $("#tf1_previousRadioMode").val() + "]").attr('checked', 'checked');
    return;
  }
 openRadioFormOnChange();
}

function changeChannelBandWidth() {
 openRadioFormOnChange();
}

function changePrimaryChannel() {
 openRadioFormOnChange();
}

/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method apProfilesRadioFormValidate
 */
function apProfilesRadioFormValidate(frmId) {

    var txtFieldIdArr = new Array();

    /* radio */
    txtFieldIdArr[0] = "tf1_radioRTSThreshold,Please enter valid RTS Threshold";
    txtFieldIdArr[1] = "tf1_radioLoadValue,Please enter valid Load Balancing";
    txtFieldIdArr[2] = "tf1_radioMaxClients,Please enter valid Maximum Clients";
    txtFieldIdArr[3] = "tf1_radioDTIMPeriod,Please enter valid DTIM Period";
    txtFieldIdArr[4] = "tf1_radioBeaconInterval,Please enter valid Beacon Interval";
    txtFieldIdArr[5] = "tf1_radioInitialPower,Please enter valid Initial Power";
    txtFieldIdArr[6] = "tf1_radioRFScanInterval,Please enter valid RF Scan Interval";
    txtFieldIdArr[7] = "tf1_radioFragThreshold,Please enter valid Frag Threshold";
    txtFieldIdArr[8] = "tf1_radioRFScanDuration,Please enter valid RF Scan Duration";
    txtFieldIdArr[9] = "tf1_radioRateLimit,Please enter valid Rate Limit";
    txtFieldIdArr[10] = "tf1_radioRateLimitBurst,Please enter valid Rate Limit Burst";
    txtFieldIdArr[11] = "tf1_radioMinimumPower,Please enter valid Minimum Power";
    

    if (txtFieldArrayCheck(txtFieldIdArr) == false)
        return false;
        
    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;   
        
    if (numericValueRangeCheck(document.getElementById('tf1_radioRTSThreshold'), '', '', 0, 2347, true, 'Invalid RTS Threshold.', 'Bytes') == false)
        return false;

    if (numericValueRangeCheck(document.getElementById('tf1_radioLoadValue'), '', '', 1, 100, true, 'Invalid Load Balancing.', '%') == false)
        return false;

    if (numericValueRangeCheck(document.getElementById('tf1_radioMaxClients'), '', '', 0, 200, true, 'Invalid Maximum Clients.', '') == false)
        return false;

    if (numericValueRangeCheck(document.getElementById('tf1_radioDTIMPeriod'), '', '', 1, 255, true, 'Invalid DTIM Period.', 'Beacons') == false)
        return false;

    if (numericValueRangeCheck(document.getElementById('tf1_radioBeaconInterval'), '', '', 20, 2000, true, 'Invalid Beacon Interval.', 'M. Sec.') == false)
        return false;

    if (numericValueRangeCheck(document.getElementById('tf1_radioInitialPower'), '', '', 1, 100, true, 'Invalid Initial Power.', '%') == false)
        return false;
    if (numericValueRangeCheck(document.getElementById('tf1_radioMinimumPower'), '', '', 1, 100, true, 'Invalid Minimum Power.', '%') == false)
        return false;


    if (numericValueRangeCheck(document.getElementById('tf1_radioRFScanInterval'), '', '', 30, 120, true, 'Invalid RF Scan Interval.', 'secs') == false)
        return false;

    if (numericValueRangeCheck(document.getElementById('tf1_radioFragThreshold'), '', '', 256, 2346, true, 'Invalid Frag Threshold.', 'bytes') == false)
        return false;

    if (numericValueRangeCheck(document.getElementById('tf1_radioRFScanDuration'), '', '', 10, 2000, true, 'Invalid RF Scan Duration.', 'M. Sec.') == false)
        return false;

    if (numericValueRangeCheck(document.getElementById('tf1_radioRateLimit'), '', '', 1, 50, true, 'Invalid Rate Limit.', 'pkts/sec') == false)
        return false;

    if (numericValueRangeCheck(document.getElementById('tf1_radioRateLimitBurst'), '', '', 1, 75, true, 'Invalid Rate Limit Burst.', 'pkts/sec') == false)
        return false;

    if ($("#tf1_radioAutomaticChannel").attr("class") == "enable-disable-on"){
       if( document.getElementById('tf1_autoEligibleChannel20').selectedIndex == -1)
           {
           alert("Error! 'Automatic Channel' requires selection of atleast one channel from supported channels list.");
           return false;
           }
    }

    if( document.getElementById('tf1_basicRateSetChannel20').selectedIndex == -1)
        {
        alert("Invalid Input! setting basic rates to default selection.");
        return false;
        }

    if( document.getElementById('tf1_supportedRateSetChannel20').selectedIndex == -1)
        {
        alert("Invalid Input! setting support rates to default selection.");
        return false;
        }
        
    setHiddenChks(frmId);
    return true;
}

/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method apProfilesRadioFormValidate
 */
function apProfilesRadioFormValidateEdit2(frmId) {

    var txtFieldIdArr = new Array();

    /* radioEdit2 */
    txtFieldIdArr[0] = "tf1_radioRTSThresholdEdit2,Please enter valid RTS Threshold";
    txtFieldIdArr[1] = "tf1_radioLoadValueEdit2,Please enter valid Load Balancing";
    txtFieldIdArr[2] = "tf1_radioMaxClientsEdit2,Please enter valid Maximum Clients";
    txtFieldIdArr[3] = "tf1_radioDTIMPeriodEdit2,Please enter valid DTIM Period";
    txtFieldIdArr[4] = "tf1_radioBeaconIntervalEdit2,Please enter valid Beacon Interval";
    txtFieldIdArr[5] = "tf1_radioInitialPowerEdit2,Please enter valid Initial Power";
    txtFieldIdArr[6] = "tf1_radioRFScanIntervalEdit2,Please enter valid RF Scan Interval";
    txtFieldIdArr[7] = "tf1_radioFragThresholdEdit2,Please enter valid Frag Threshold";
    txtFieldIdArr[8] = "tf1_radioRFScanDurationEdit2,Please enter valid RF Scan Duration";
    txtFieldIdArr[9] = "tf1_radioRateLimitEdit2,Please enter valid Rate Limit";
    txtFieldIdArr[10] = "tf1_radioRateLimitBurstEdit2,Please enter valid Rate Limit Burst";
    txtFieldIdArr[11] = "tf1_radioMinimumPowerEdit2,Please enter valid Minimum Power";
    

    if (txtFieldArrayCheck(txtFieldIdArr) == false)
        return false;
        
    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
        
    if (numericValueRangeCheck(document.getElementById('tf1_radioRTSThresholdEdit2'), '', '', 0, 2347, true, 'Invalid RTS Threshold.', 'Bytes') == false)
        return false;

    if (numericValueRangeCheck(document.getElementById('tf1_radioLoadValueEdit2'), '', '', 1, 100, true, 'Invalid Load Balancing.', '%') == false)
        return false;

    if (numericValueRangeCheck(document.getElementById('tf1_radioMaxClientsEdit2'), '', '', 0, 200, true, 'Invalid Maximum Clients.', '') == false)
        return false;

    if (numericValueRangeCheck(document.getElementById('tf1_radioDTIMPeriodEdit2'), '', '', 1, 255, true, 'Invalid DTIM Period.', 'Beacons') == false)
        return false;

    if (numericValueRangeCheck(document.getElementById('tf1_radioBeaconIntervalEdit2'), '', '', 20, 2000, true, 'Invalid Beacon Interval.', 'M. Sec.') == false)
        return false;

    if (numericValueRangeCheck(document.getElementById('tf1_radioInitialPowerEdit2'), '', '', 1, 100, true, 'Invalid Initial Power.', '%') == false)
        return false;
    if (numericValueRangeCheck(document.getElementById('tf1_radioMinimumPowerEdit2'), '', '', 1, 100, true, 'Invalid Minimum Power.', '%') == false)
        return false;


    if (numericValueRangeCheck(document.getElementById('tf1_radioRFScanIntervalEdit2'), '', '', 30, 120, true, 'Invalid RF Scan Interval.', 'secs') == false)
        return false;

    if (numericValueRangeCheck(document.getElementById('tf1_radioFragThresholdEdit2'), '', '', 256, 2346, true, 'Invalid Frag Threshold.', 'bytes') == false)
        return false;

    if (numericValueRangeCheck(document.getElementById('tf1_radioRFScanDurationEdit2'), '', '', 10, 2000, true, 'Invalid RF Scan Duration.', 'M. Sec.') == false)
        return false;

    if (numericValueRangeCheck(document.getElementById('tf1_radioRateLimitEdit2'), '', '', 1, 50, true, 'Invalid Rate Limit.', 'pkts/sec') == false)
        return false;

    if (numericValueRangeCheck(document.getElementById('tf1_radioRateLimitBurstEdit2'), '', '', 1, 75, true, 'Invalid Rate Limit Burst.', 'pkts/sec') == false)
        return false;
        
    setHiddenChks(frmId);
    return true;
}

/**
 * function for for form refresh in popup window
 * onchange event
 * @method openRadioFormOnChange
 */
function openRadioFormOnChange(){

    var dialogId = "tf1_dialog";    
    var onloadfun = "onloadAPProfileRadioFn";
    var radioMode = radioCheckedValueGet("tf1_apProfilesOperatingMode"); 
    var channelBandWidth = $("input[name='apProfilesRadio.CHANNELBANDWIDTH']:checked").val();  
    var primaryChannel = $("input[name='apProfilesRadio.PRIMARYCHANNEL']:checked").val(); 
    var pageName = "apProfilesRadioForm.html";
    var popupContent = "tf1_apProfileRadioDailogContent";  
 
   
    dataString = "button.edit.apProfileRadio.apProfileRadio."+$('#tf1_refreshConfigRowId').val()+"=edit&thispage="+pageName+"&configRowId="+$('#tf1_refreshConfigRowId').val()+"&apProfilesRadio.OPERTINGMODE="+radioMode+"&apProfilesRadio.CHANNELBANDWIDTH="+channelBandWidth+"&apProfilesRadio.PRIMARYCHANNEL="+primaryChannel;
  
 $("#"+dialogId).html($("#tf1_loadingDiv").html());            
        dataStringArry = dataString.split("&");        
        dataObj = new Object();
        
        for(i=0; i< dataStringArry.length; i++){
            data =  dataStringArry[i].split("=");
            dataObj[data[0]] = data[1]; 
        }         
        
        $("#"+dialogId).load(platformUrl+pageName+" #"+popupContent, dataObj, function(response) {
            /* See if the page is a login page , then redirect to login from popup*/
            if (response.search("button.login.Users") != -1)
                {                                                            
                    $("#"+dialogId).hide();
                    $("#"+dialogId).html(response);
                    if ($(".midWidth2 div.msgError p").length > 0 && $(".midWidth2 div.msgError p").html() != '') 
                        {
                            window.location="platform.cgi?page=index.html&redirectStatusMessage="+$(".midWidth2 div.msgError p").html();
                        } else {
                            window.location="platform.cgi?page=index.html";
                        }
            }            
            if(onloadfun != '')
            eval(onloadfun+"()");
        });            
     
}

function checkBasicRateSet() {
    var rateSetObj = document.getElementById('tf1_basicRateSetChannel20');
        
     for (i=0; i < rateSetObj.length; i++) {
         if (rateSetObj[i].selected) {
                $("#tf1_supportedRateSetChannel20 option[value='" + rateSetObj[i].value + "']").attr("selected", 1);
                
        }
    }

        if (rateSetObj.selectedIndex == -1) {
            alert("Invalid Input! setting basic rates to default selection.");            
            resetRates();
        }     
}

function checkSupportRateSet() {
    var supportRateSetObj = document.getElementById('tf1_supportedRateSetChannel20');
        
     for (i=0; i < supportRateSetObj.length; i++) {
         if (supportRateSetObj[i].selected == false) {
                $("#tf1_basicRateSetChannel20 option[value='" + supportRateSetObj[i].value + "']").removeAttr("selected");
                
        }
    }

    if (supportRateSetObj.selectedIndex == -1) {        
        alert("Invalid Input! setting support rates to default selection.");
        resetRates();
   }
}

function resetRates() {

var rateSetObj = document.getElementById('tf1_basicRateSetChannel20');

if (rateSetObj.selectedIndex == -1) {
        
        var hiddenObj = document.getElementById("tf1_basicRateSetChannel20_hidden");
            
         for (i=0; i < hiddenObj.length; i++) {
             if (hiddenObj[i].selected) {
        $("#tf1_basicRateSetChannel20 option[value='" + hiddenObj[i].value + "']").attr("selected", 1);
                
            }
    }

    }
var supportRateSetObj = document.getElementById('tf1_supportedRateSetChannel20');

if (supportRateSetObj.selectedIndex == -1) {
        
        var hiddenObj = document.getElementById("tf1_supportedRateSetChannel20_hidden");
            
         for (i=0; i < hiddenObj.length; i++) {
             if (hiddenObj[i].selected) {
        $("#tf1_supportedRateSetChannel20 option[value='" + hiddenObj[i].value + "']").attr("selected", 1);
                
            }
    }

    }

}






