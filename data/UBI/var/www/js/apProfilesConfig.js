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
function onloadapProfilesFn () {
	onloadCall (enableDisableFieldsByImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});	
	enableTextFieldByAnchorClick('tf1_cofigureRadio1','tf1_radioStateRadio1 tf1_radioRTSThresholdRadio1 tf1_radioLoadBalancingRadio1 tf1_radioLoadValueRadio1 tf1_radioMaxClientsRadio1 tf1_radioRFScanRadio1 tf1_radioRFScanSentryRadio1 tf1_radioIEEEModeRadio1 tf1_radioDTIMPeriodRadio1 tf1_radioBeaconIntervalRadio1 tf1_radioAutomaticChannelRadio1 tf1_radioAutomaticPowerRadio1 tf1_radioInitialPowerRadio1 tf1_radioMinimumPowerRadio1 tf1_radioAPSDModeRadio1 tf1_radioRFScanIntervalRadio1 tf1_radioFragThresholdRadio1 tf1_radioRFScanSentryChannel1Radio1 tf1_radioRFScanSentryChannel2Radio1 tf1_radioShortRetriesRadio1 tf1_radioRFScanDurationRadio1 tf1_radioLongRetriesRadio1 tf1_radioRateLimiting tf1_radioTransmitLifetimeRadio1 tf1_radioRateLimitRadio1 tf1_radioReceiveLifetimeRadio1 tf1_radioRateLimitBurstRadio1 tf1_radioStationIsolationRadio1 tf1_radioChannelBandwidthRadio1 tf1_radioPrimaryChannelRadio1 tf1_radioProtectionRadio1 tf1_radioShortGuardRadio1 tf1_radioSpaceTimeBlockCodeRadio1 tf1_radioResourceMgmtRadio1 tf1_radioNoAckRadio1 tf1_multicastRateRadio1','break_radioProfileRadio1 break_radioMode1Radio1 break_radioMode2Radio1 break_radioStateRadio1 break_radioRTSThresholdRadio1 break_radioLoadBalancingRadio1 break_radioLoadValueRadio1 break_radioMaxClientsRadio1 break_radioRFScanRadio1 break_radioRFScanSentryRadio1 break_radioIEEEModeRadio1 break_radioDTIMPeriodRadio1 break_radioBeaconIntervalRadio1 break_radioAutomaticChannelRadio1 break_radioAutomaticPowerRadio1 break_radioInitialPowerRadio1 break_radioMinimumPowerRadio1 break_radioAPSDModeRadio1 break_radioRFScanIntervalRadio1 break_radioFragThresholdRadio1 break_radioRFScanSentryChannel1Radio1 break_radioRFScanSentryChannel2Radio1 break_radioShortRetriesRadio1 break_radioRFScanDurationRadio1 break_radioLongRetriesRadio1 break_radioRateLimitingRadio1 break_radioTransmitLifetimeRadio1 break_radioRateLimitRadio1 break_radioReceiveLifetimeRadio1 break_radioRateLimitBurstRadio1 break_radioStationIsolationRadio1 break_radioChannelBandwidthRadio1 break_radioPrimaryChannelRadio1 break_radioProtectionRadio1 break_radioShortGuardRadio1 break_radioSpaceTimeBlockCodeRadio1 break_radioResourceMgmtRadio1 break_radioNoAckRadio1 break_multicastRateRadio1','ApProfileRadioBlock1');
	
	enableTextFieldByAnchorClick('tf1_cofigureRadio2','tf1_radioStateRadio2 tf1_radioRTSThresholdRadio2 tf1_radioLoadBalancingRadio2 tf1_radioLoadValueRadio2 tf1_radioMaxClientsRadio2 tf1_radioRFScanRadio2 tf1_radioRFScanSentryRadio2 tf1_radioIEEEModeRadio2 tf1_radioDTIMPeriodRadio2 tf1_radioBeaconIntervalRadio2 tf1_radioAutomaticChannelRadio2 tf1_radioAutomaticPowerRadio2 tf1_radioInitialPowerRadio2 tf1_radioMinimumPowerRadio2 tf1_radioAPSDModeRadio2 tf1_radioRFScanIntervalRadio2 tf1_radioFragThresholdRadio2 tf1_radioRFScanSentryChannel1Radio2 tf1_radioRFScanSentryChannel2Radio2 tf1_radioShortRetriesRadio2 tf1_radioRFScanDurationRadio2 tf1_radioLongRetriesRadio2 tf1_radioRateLimiting tf1_radioTransmitLifetimeRadio2 tf1_radioRateLimitRadio2 tf1_radioReceiveLifetimeRadio2 tf1_radioRateLimitBurstRadio2 tf1_radioStationIsolationRadio2 tf1_radioChannelBandwidthRadio2 tf1_radioPrimaryChannelRadio2 tf1_radioProtectionRadio2 tf1_radioShortGuardRadio2 tf1_radioSpaceTimeBlockCodeRadio2 tf1_radioResourceMgmtRadio2 tf1_radioNoAckRadio2 tf1_multicastRateRadio2','break_radioProfileRadio2 break_radioMode1Radio2 break_radioMode2Radio2 break_radioStateRadio2 break_radioRTSThresholdRadio2 break_radioLoadBalancingRadio2 break_radioLoadValueRadio2 break_radioMaxClientsRadio2 break_radioRFScanRadio2 break_radioRFScanSentryRadio2 break_radioIEEEModeRadio2 break_radioDTIMPeriodRadio2 break_radioBeaconIntervalRadio2 break_radioAutomaticChannelRadio2 break_radioAutomaticPowerRadio2 break_radioInitialPowerRadio2 break_radioMinimumPowerRadio2 break_radioAPSDModeRadio2 break_radioRFScanIntervalRadio2 break_radioFragThresholdRadio2 break_radioRFScanSentryChannel1Radio2 break_radioRFScanSentryChannel2Radio2 break_radioShortRetriesRadio2 break_radioRFScanDurationRadio2 break_radioLongRetriesRadio2 break_radioRateLimitingRadio2 break_radioTransmitLifetimeRadio2 break_radioRateLimitRadio2 break_radioReceiveLifetimeRadio2 break_radioRateLimitBurstRadio2 break_radioStationIsolationRadio2 break_radioChannelBandwidthRadio2 break_radioPrimaryChannelRadio2 break_radioProtectionRadio2 break_radioShortGuardRadio2 break_radioSpaceTimeBlockCodeRadio2 break_radioResourceMgmtRadio2 break_radioNoAckRadio2 break_multicastRateRadio2','ApProfileRadioBlock2');
	 
	enableTextFieldByAnchorClick('tf1_cofigureQosRadio1','tf1_qosTemplateRadio1 tf1_qosApedcaParametersRadio1 tf1_qosApedcaAIFSRadio1 tf1_qosApedcaApDataCwMinRadio1 tf1_qosApedcaApDataCwMaxRadio1 tf1_qosApedcaApDataMaxBurstRadio1 tf1_qosApedcaData1VideoRadio1 tf1_qosApedcaApData1AIFSRadio1 tf1_qosApedcaApData1CwMinRadio1 tf1_qosApedcaApData1CwMaxRadio1 tf1_qosApedcaApData1MaxBurstRadio1 tf1_qosApedcaData2Radio1 tf1_qosApedcaApData2AIFSRadio1 tf1_qosApedcaApData2CwMinRadio1 tf1_qosApedcaApData2CwMaxRadio1 tf1_qosApedcaApData2MaxBurstRadio1 tf1_qosApedcaData3Radio1 tf1_qosApedcaApData3AIFSRadio1 tf1_qosApedcaApData3CwMinRadio1 tf1_qosApedcaApData3CwMaxRadio1 tf1_qosApedcaApData3MaxBurstRadio1 tf1_qosApedcaWMMModeRadio1 tf1_qosStationData0Radio1 tf1_qosStationDataAIFSRadio1 tf1_qosStationDataCwMinRadio1 tf1_qosStationDataCwMaxRadio1 tf1_qosStationDataTXOPLimitRadio1 tf1_qosStationData1VideoRadio1 tf1_qosStationData1AIFSRadio1 tf1_qosStationData1CwMinRadio1 tf1_qosStationData1CwMaxRadio1 tf1_qosStationData1TXOPLimitRadio1 tf1_qosStationData2Radio1 tf1_qosStationData2AIFSRadio1 tf1_qosStationData2CwMinRadio1 tf1_qosStationData2CwMaxRadio1 tf1_qosStationData2TXOPLimitRadio1 tf1_qosStationData3Radio1 tf1_qosStationData3AIFSRadio1 tf1_qosStationData3CwMinRadio1 tf1_qosStationData3CwMaxRadio1 tf1_qosStationData3TXOPLimitRadio1', 'break_qosApProfileRadio1 break_qosRadioModeRadio1 break_qosTemplateRadio1 break_qosApedcaParametersRadio1 break_qosApedcaAIFSRadio1 break_qosApedcaApDataCwMinRadio1 break_qosApedcaApDataCwMaxRadio1 break_qosApedcaApDataMaxBurstRadio1 break_qosApedcaData1VideoRadio1 break_qosApedcaApData1AIFSRadio1 break_qosApedcaApData1CwMinRadio1 break_qosApedcaApData1CwMaxRadio1 break_qosApedcaApData1MaxBurstRadio1 break_qosApedcaData2Radio1 break_qosApedcaApData2AIFSRadio1 break_qosApedcaApData2CwMinRadio1 break_qosApedcaApData2CwMaxRadio1 break_qosApedcaApData2MaxBurstRadio1 break_qosApedcaData3Radio1 break_qosApedcaApData3AIFSRadio1 break_qosApedcaApData3CwMinRadio1 break_qosApedcaApData3CwMaxRadio1 break_qosApedcaApData3MaxBurstRadio1 break_qosApedcaWMMModeRadio1 break_qosStationData0Radio1 break_qosStationDataAIFSRadio1 break_qosStationDataCwMinRadio1 break_qosStationDataCwMaxRadio1 break_qosStationDataTXOPLimitRadio1 break_qosStationData1VideoRadio1 break_qosStationData1AIFSRadio1 break_qosStationData1CwMinRadio1 break_qosStationData1CwMaxRadio1 break_qosStationData1TXOPLimitRadio1 break_qosStationData2Radio1 break_qosStationData2AIFSRadio1 break_qosStationData2CwMinRadio1 break_qosStationData2CwMaxRadio1 break_qosStationData2TXOPLimitRadio1 break_qosStationData3Radio1 break_qosStationData3AIFSRadio1 break_qosStationData3CwMinRadio1 break_qosStationData3CwMaxRadio1 break_qosStationData3TXOPLimitRadio1','ApProfileQosBlockRadio1 ApProfileQosBlockAPEDCARadio1 ApProfileQosBlockEDCARadio1');
	
	enableTextFieldByAnchorClick('tf1_cofigureQosRadio2','tf1_qosTemplateRadio2 tf1_qosApedcaParametersRadio2 tf1_qosApedcaAIFSRadio2 tf1_qosApedcaApDataCwMinRadio2 tf1_qosApedcaApDataCwMaxRadio2 tf1_qosApedcaApDataMaxBurstRadio2 tf1_qosApedcaData1VideoRadio2 tf1_qosApedcaApData1AIFSRadio2 tf1_qosApedcaApData1CwMinRadio2 tf1_qosApedcaApData1CwMaxRadio2 tf1_qosApedcaApData1MaxBurstRadio2 tf1_qosApedcaData2Radio2 tf1_qosApedcaApData2AIFSRadio2 tf1_qosApedcaApData2CwMinRadio2 tf1_qosApedcaApData2CwMaxRadio2 tf1_qosApedcaApData2MaxBurstRadio2 tf1_qosApedcaData3Radio2 tf1_qosApedcaApData3AIFSRadio2 tf1_qosApedcaApData3CwMinRadio2 tf1_qosApedcaApData3CwMaxRadio2 tf1_qosApedcaApData3MaxBurstRadio2 tf1_qosApedcaWMMModeRadio2 tf1_qosStationData0Radio2 tf1_qosStationDataAIFSRadio2 tf1_qosStationDataCwMinRadio2 tf1_qosStationDataCwMaxRadio2 tf1_qosStationDataTXOPLimitRadio2 tf1_qosStationData1VideoRadio2 tf1_qosStationData1AIFSRadio2 tf1_qosStationData1CwMinRadio2 tf1_qosStationData1CwMaxRadio2 tf1_qosStationData1TXOPLimitRadio2 tf1_qosStationData2Radio2 tf1_qosStationData2AIFSRadio2 tf1_qosStationData2CwMinRadio2 tf1_qosStationData2CwMaxRadio2 tf1_qosStationData2TXOPLimitRadio2 tf1_qosStationData3Radio2 tf1_qosStationData3AIFSRadio2 tf1_qosStationData3CwMinRadio2 tf1_qosStationData3CwMaxRadio2 tf1_qosStationData3TXOPLimitRadio2', 'break_qosApProfileRadio2 break_qosRadioModeRadio2 break_qosTemplateRadio2 break_qosApedcaParametersRadio2 break_qosApedcaAIFSRadio2 break_qosApedcaApDataCwMinRadio2 break_qosApedcaApDataCwMaxRadio2 break_qosApedcaApDataMaxBurstRadio2 break_qosApedcaData1VideoRadio2 break_qosApedcaApData1AIFSRadio2 break_qosApedcaApData1CwMinRadio2 break_qosApedcaApData1CwMaxRadio2 break_qosApedcaApData1MaxBurstRadio2 break_qosApedcaData2Radio2 break_qosApedcaApData2AIFSRadio2 break_qosApedcaApData2CwMinRadio2 break_qosApedcaApData2CwMaxRadio2 break_qosApedcaApData2MaxBurstRadio2 break_qosApedcaData3Radio2 break_qosApedcaApData3AIFSRadio2 break_qosApedcaApData3CwMinRadio2 break_qosApedcaApData3CwMaxRadio2 break_qosApedcaApData3MaxBurstRadio2 break_qosApedcaWMMModeRadio2 break_qosStationData0Radio2 break_qosStationDataAIFSRadio2 break_qosStationDataCwMinRadio2 break_qosStationDataCwMaxRadio2 break_qosStationDataTXOPLimitRadio2 break_qosStationData1VideoRadio2 break_qosStationData1AIFSRadio2 break_qosStationData1CwMinRadio2 break_qosStationData1CwMaxRadio2 break_qosStationData1TXOPLimitRadio2 break_qosStationData2Radio2 break_qosStationData2AIFSRadio2 break_qosStationData2CwMinRadio2 break_qosStationData2CwMaxRadio2 break_qosStationData2TXOPLimitRadio2 break_qosStationData3Radio2 break_qosStationData3AIFSRadio2 break_qosStationData3CwMinRadio2 break_qosStationData3CwMaxRadio2 break_qosStationData3TXOPLimitRadio2','ApProfileQosBlockRadio2 ApProfileQosBlockAPEDCARadio2 ApProfileQosBlockEDCARadio2');

	changeHardwareOptions();
	enableTextFieldByAnchorClick('tf1_radioLoadBalancingRadio1','tf1_radioLoadValueRadio1','break_radioLoadValueRadio1');
	enableTextFieldByAnchorClick('tf1_radioLoadBalancingRadio2','tf1_radioLoadValueRadio2','break_radioLoadValueRadio2');

	enableTextFieldByAnchorClick('tf1_radioRFScanRadio1','tf1_radioRFScanIntervalRadio1','break_radioRFScanIntervalRadio1');
	enableTextFieldByAnchorClick('tf1_radioRFScanRadio2','tf1_radioRFScanIntervalRadio2','break_radioRFScanIntervalRadio2');
	
	enableTextFieldByAnchorClick('tf1_radioRFScanSentryRadio1','tf1_radioRFScanSentryChannel1Radio1 tf1_radioRFScanSentryChannel2Radio1','break_radioRFScanSentryChannel1Radio1 break_radioRFScanSentryChannel2Radio1');
	enableTextFieldByAnchorClick('tf1_radioRFScanSentryRadio2','tf1_radioRFScanSentryChannel1Radio2 tf1_radioRFScanSentryChannel2Radio2','break_radioRFScanSentryChannel1Radio2 break_radioRFScanSentryChannel2Radio2');

	enableTextFieldByAnchorClick('tf1_radioRateLimitingRadio1','tf1_radioRateLimitRadio1 tf1_radioRateLimitBurstRadio1','break_radioRateLimitRadio1 break_radioRateLimitBurstRadio1');
	enableTextFieldByAnchorClick('tf1_radioRateLimitingRadio2','tf1_radioRateLimitRadio2 tf1_radioRateLimitBurstRadio2','break_radioRateLimitRadio2 break_radioRateLimitBurstRadio2');


// ChannelBandwidthType('tf1_radioChannelBandwidth20MHzRadio1');
// ChannelBandwidthTypeRadio2('tf1_radioChannelBandwidth20MHzRadio2');
 changeRadio1Mode('tf1_radio3ModeRadio1');
 changeRadio2Mode('tf1_radio4ModeRadio2');

        var rfScanObjVal =  document.getElementById('tf1_radioRFScanRadio1').className;
        var rfScanSentryObjVal = document.getElementById('tf1_radioRFScanSentryRadio1').className;

                    
        if (rfScanObjVal == OFF_ANCHOR && rfScanSentryObjVal == OFF_ANCHOR){ 
              
            fieldStateChangeWr ('tf1_radioRFScanDurationRadio1','','','');
            vidualDisplay('tf1_radioRFScanDurationRadio1','hide');
            vidualDisplay('break_radioRFScanDurationRadio1','hide');
              
            
        } else {
            fieldStateChangeWr ('','','tf1_radioRFScanDurationRadio1','');
            vidualDisplay('tf1_radioRFScanDurationRadio1','configRow');
            vidualDisplay('break_radioRFScanDurationRadio1','break');
        }

        rfScanObjVal =  document.getElementById('tf1_radioRFScanRadio2').className;
        rfScanSentryObjVal = document.getElementById('tf1_radioRFScanSentryRadio2').className;
         if (rfScanObjVal == OFF_ANCHOR && rfScanSentryObjVal == OFF_ANCHOR){             
            fieldStateChangeWr ('tf1_radioRFScanDurationRadio2','','','');
            vidualDisplay('tf1_radioRFScanDurationRadio2','hide');
            vidualDisplay('break_radioRFScanDurationRadio2','hide');
        } else {
            fieldStateChangeWr ('','','tf1_radioRFScanDurationRadio2','');
            vidualDisplay('tf1_radioRFScanDurationRadio2','configRow');
            vidualDisplay('break_radioRFScanDurationRadio2','break');
        }


}

/**
* displays corresponding fields on ImageToggle
* @method enableDisableFieldsByImageClick
* @param data - image data
* @param thisObj - currtent image id
*/
function enableDisableFieldsByImageClick(data, thisObj) { 
    onAnchorToggle (data);
    var imgId=thisObj.id;
    switch(imgId){
    	case 'tf1_cofigureRadio1':    	   
    		enableTextFieldByAnchorClick('tf1_cofigureRadio1','tf1_radioStateRadio1 tf1_radioRTSThresholdRadio1 tf1_radioLoadBalancingRadio1 tf1_radioLoadValueRadio1 tf1_radioMaxClientsRadio1 tf1_radioRFScanRadio1 tf1_radioRFScanSentryRadio1 tf1_radioIEEEModeRadio1 tf1_radioDTIMPeriodRadio1 tf1_radioBeaconIntervalRadio1 tf1_radioAutomaticChannelRadio1 tf1_radioAutomaticPowerRadio1 tf1_radioInitialPowerRadio1 tf1_radioMinimumPowerRadio1 tf1_radioAPSDModeRadio1 tf1_radioRFScanIntervalRadio1 tf1_radioFragThresholdRadio1 tf1_radioRFScanSentryChannel1Radio1 tf1_radioRFScanSentryChannel2Radio1 tf1_radioShortRetriesRadio1 tf1_radioRFScanDurationRadio1 tf1_radioLongRetriesRadio1 tf1_radioRateLimiting tf1_radioTransmitLifetimeRadio1 tf1_radioRateLimitRadio1 tf1_radioReceiveLifetimeRadio1 tf1_radioRateLimitBurstRadio1 tf1_radioStationIsolationRadio1 tf1_radioChannelBandwidthRadio1 tf1_radioPrimaryChannelRadio1 tf1_radioProtectionRadio1 tf1_radioShortGuardRadio1 tf1_radioSpaceTimeBlockCodeRadio1 tf1_radioResourceMgmtRadio1 tf1_radioNoAckRadio1 tf1_multicastRateRadio1','break_radioProfileRadio1 break_radioMode1Radio1 break_radioMode2Radio1 break_radioStateRadio1 break_radioRTSThresholdRadio1 break_radioLoadBalancingRadio1 break_radioLoadValueRadio1 break_radioMaxClientsRadio1 break_radioRFScanRadio1 break_radioRFScanSentryRadio1 break_radioIEEEModeRadio1 break_radioDTIMPeriodRadio1 break_radioBeaconIntervalRadio1 break_radioAutomaticChannelRadio1 break_radioAutomaticPowerRadio1 break_radioInitialPowerRadio1 break_radioMinimumPowerRadio1 break_radioAPSDModeRadio1 break_radioRFScanIntervalRadio1 break_radioFragThresholdRadio1 break_radioRFScanSentryChannel1Radio1 break_radioRFScanSentryChannel2Radio1 break_radioShortRetriesRadio1 break_radioRFScanDurationRadio1 break_radioLongRetriesRadio1 break_radioRateLimitingRadio1 break_radioTransmitLifetimeRadio1 break_radioRateLimitRadio1 break_radioReceiveLifetimeRadio1 break_radioRateLimitBurstRadio1 break_radioStationIsolationRadio1 break_radioChannelBandwidthRadio1 break_radioPrimaryChannelRadio1 break_radioProtectionRadio1 break_radioShortGuardRadio1 break_radioSpaceTimeBlockCodeRadio1 break_radioResourceMgmtRadio1 break_radioNoAckRadio1 break_multicastRateRadio1','ApProfileRadioBlock1');
    		var imgObjVal = document.getElementById(imgId).className;
        	var imageName = imgObjVal.substring(imgObjVal.lastIndexOf('/') + 1);
        	if (imageName == OFF_ANCHOR) {
        		fieldStateChangeWr ('tf1_radioLoadValueRadio1 tf1_radioRFScanIntervalRadio1 tf1_radioRFScanSentryChannel1Radio1 tf1_radioRFScanSentryChannel2Radio1 tf1_radioRateLimitRadio1 tf1_radioRateLimitBurstRadio1','','','');        		
    		}else{
    			enableTextFieldByAnchorClick('tf1_radioLoadBalancingRadio1','tf1_radioLoadValueRadio1','break_radioLoadValueRadio1');
    			enableTextFieldByAnchorClick('tf1_radioRFScanRadio1','tf1_radioRFScanIntervalRadio1','break_radioRFScanIntervalRadio1');
    			enableTextFieldByAnchorClick('tf1_radioRFScanSentryRadio1','tf1_radioRFScanSentryChannel1Radio1 tf1_radioRFScanSentryChannel2Radio1','break_radioRFScanSentryChannel1Radio1 break_radioRFScanSentryChannel2Radio1');
    			enableTextFieldByAnchorClick('tf1_radioRateLimitingRadio1','tf1_radioRateLimitRadio1 tf1_radioRateLimitBurstRadio1','break_radioRateLimitRadio1 break_radioRateLimitBurstRadio1');
        	}
        	ChannelBandwidthType('tf1_radioChannelBandwidth20MHzRadio1');
        var rfScanObjVal =  document.getElementById('tf1_radioRFScanRadio1').className;
        var rfScanSentryObjVal = document.getElementById('tf1_radioRFScanSentryRadio1').className;

        
            
        if (rfScanObjVal == OFF_ANCHOR && rfScanSentryObjVal == OFF_ANCHOR){ 
              
            fieldStateChangeWr ('tf1_radioRFScanDurationRadio1','','','');
            vidualDisplay('tf1_radioRFScanDurationRadio1','hide');
            vidualDisplay('break_radioRFScanDurationRadio1','hide');
              
            
        } else {
            fieldStateChangeWr ('','','tf1_radioRFScanDurationRadio1','');
            vidualDisplay('tf1_radioRFScanDurationRadio1','configRow');
            vidualDisplay('break_radioRFScanDurationRadio1','break');
        }

        if  (document.getElementById('tf1_radioRFScanSentryChannel1Radio1').className == OFF_ANCHOR) {

                    $("#tf1_radioRFScanSentryChannel2Radio1").attr("class",ON_ANCHOR);

         }  
        if  (document.getElementById('tf1_radioRFScanSentryChannel1Radio2').className == OFF_ANCHOR) {

                    $("#tf1_radioRFScanSentryChannel2Radio2").attr("class",ON_ANCHOR);

         } 
    	break;      	

		case 'tf1_cofigureRadio2':    	   
    		enableTextFieldByAnchorClick('tf1_cofigureRadio2','tf1_radioStateRadio2 tf1_radioRTSThresholdRadio2 tf1_radioLoadBalancingRadio2 tf1_radioLoadValueRadio2 tf1_radioMaxClientsRadio2 tf1_radioRFScanRadio2 tf1_radioRFScanSentryRadio2 tf1_radioIEEEModeRadio2 tf1_radioDTIMPeriodRadio2 tf1_radioBeaconIntervalRadio2 tf1_radioAutomaticChannelRadio2 tf1_radioAutomaticPowerRadio2 tf1_radioInitialPowerRadio2 tf1_radioMinimumPowerRadio2 tf1_radioAPSDModeRadio2 tf1_radioRFScanIntervalRadio2 tf1_radioFragThresholdRadio2 tf1_radioRFScanSentryChannel1Radio2 tf1_radioRFScanSentryChannel2Radio2 tf1_radioShortRetriesRadio2 tf1_radioRFScanDurationRadio2 tf1_radioLongRetriesRadio2 tf1_radioRateLimiting tf1_radioTransmitLifetimeRadio2 tf1_radioRateLimitRadio2 tf1_radioReceiveLifetimeRadio2 tf1_radioRateLimitBurstRadio2 tf1_radioStationIsolationRadio2 tf1_radioChannelBandwidthRadio2 tf1_radioPrimaryChannelRadio2 tf1_radioProtectionRadio2 tf1_radioShortGuardRadio2 tf1_radioSpaceTimeBlockCodeRadio2 tf1_radioResourceMgmtRadio2 tf1_radioNoAckRadio2 tf1_multicastRateRadio2','break_radioProfileRadio2 break_radioMode1Radio2 break_radioMode2Radio2 break_radioStateRadio2 break_radioRTSThresholdRadio2 break_radioLoadBalancingRadio2 break_radioLoadValueRadio2 break_radioMaxClientsRadio2 break_radioRFScanRadio2 break_radioRFScanSentryRadio2 break_radioIEEEModeRadio2 break_radioDTIMPeriodRadio2 break_radioBeaconIntervalRadio2 break_radioAutomaticChannelRadio2 break_radioAutomaticPowerRadio2 break_radioInitialPowerRadio2 break_radioMinimumPowerRadio2 break_radioAPSDModeRadio2 break_radioRFScanIntervalRadio2 break_radioFragThresholdRadio2 break_radioRFScanSentryChannel1Radio2 break_radioRFScanSentryChannel2Radio2 break_radioShortRetriesRadio2 break_radioRFScanDurationRadio2 break_radioLongRetriesRadio2 break_radioRateLimitingRadio2 break_radioTransmitLifetimeRadio2 break_radioRateLimitRadio2 break_radioReceiveLifetimeRadio2 break_radioRateLimitBurstRadio2 break_radioStationIsolationRadio2 break_radioChannelBandwidthRadio2 break_radioPrimaryChannelRadio2 break_radioProtectionRadio2 break_radioShortGuardRadio2 break_radioSpaceTimeBlockCodeRadio2 break_radioResourceMgmtRadio2 break_radioNoAckRadio2 break_multicastRateRadio2','ApProfileRadioBlock2');
    		var imgObjVal = document.getElementById(imgId).className;
        	var imageName = imgObjVal.substring(imgObjVal.lastIndexOf('/') + 1);
        	if (imageName == OFF_ANCHOR) {
        		fieldStateChangeWr ('tf1_radioLoadValueRadio2 tf1_radioRFScanIntervalRadio2 tf1_radioRFScanSentryChannel1Radio2 tf1_radioRFScanSentryChannel2Radio2 tf1_radioRateLimitRadio2 tf1_radioRateLimitBurstRadio2','','','');        		
    		}else{
    			enableTextFieldByAnchorClick('tf1_radioLoadBalancingRadio2','tf1_radioLoadValueRadio2','break_radioLoadValueRadio2');
    			enableTextFieldByAnchorClick('tf1_radioRFScanRadio2','tf1_radioRFScanIntervalRadio2','break_radioRFScanIntervalRadio2');
    			enableTextFieldByAnchorClick('tf1_radioRFScanSentryRadio2','tf1_radioRFScanSentryChannel1Radio2 tf1_radioRFScanSentryChannel2Radio2','break_radioRFScanSentryChannel1Radio2 break_radioRFScanSentryChannel2Radio2');
    			enableTextFieldByAnchorClick('tf1_radioRateLimitingRadio2','tf1_radioRateLimitRadio2 tf1_radioRateLimitBurstRadio2','break_radioRateLimitRadio2 break_radioRateLimitBurstRadio2');
        	}
        	ChannelBandwidthTypeRadio2('tf1_radioChannelBandwidth20MHzRadio2');

        var rfScanObjVal =  document.getElementById('tf1_radioRFScanRadio2').className;
        var rfScanSentryObjVal = document.getElementById('tf1_radioRFScanSentryRadio2').className;
         if (rfScanObjVal == OFF_ANCHOR && rfScanSentryObjVal == OFF_ANCHOR){             
            fieldStateChangeWr ('tf1_radioRFScanDurationRadio2','','','');
            vidualDisplay('tf1_radioRFScanDurationRadio2','hide');
            vidualDisplay('break_radioRFScanDurationRadio2','hide');
        } else {
            fieldStateChangeWr ('','','tf1_radioRFScanDurationRadio2','');
            vidualDisplay('tf1_radioRFScanDurationRadio2','configRow');
            vidualDisplay('break_radioRFScanDurationRadio2','break');
        }
    	break;

  	
    	case 'tf1_cofigureQosRadio1':
    		enableTextFieldByAnchorClick('tf1_cofigureQosRadio1','tf1_qosTemplateRadio1 tf1_qosApedcaParametersRadio1 tf1_qosApedcaAIFSRadio1 tf1_qosApedcaApDataCwMinRadio1 tf1_qosApedcaApDataCwMaxRadio1 tf1_qosApedcaApDataMaxBurstRadio1 tf1_qosApedcaData1VideoRadio1 tf1_qosApedcaApData1AIFSRadio1 tf1_qosApedcaApData1CwMinRadio1 tf1_qosApedcaApData1CwMaxRadio1 tf1_qosApedcaApData1MaxBurstRadio1 tf1_qosApedcaData2Radio1 tf1_qosApedcaApData2AIFSRadio1 tf1_qosApedcaApData2CwMinRadio1 tf1_qosApedcaApData2CwMaxRadio1 tf1_qosApedcaApData2MaxBurstRadio1 tf1_qosApedcaData3Radio1 tf1_qosApedcaApData3AIFSRadio1 tf1_qosApedcaApData3CwMinRadio1 tf1_qosApedcaApData3CwMaxRadio1 tf1_qosApedcaApData3MaxBurstRadio1 tf1_qosApedcaWMMModeRadio1 tf1_qosStationData0Radio1 tf1_qosStationDataAIFSRadio1 tf1_qosStationDataCwMinRadio1 tf1_qosStationDataCwMaxRadio1 tf1_qosStationDataTXOPLimitRadio1 tf1_qosStationData1VideoRadio1 tf1_qosStationData1AIFSRadio1 tf1_qosStationData1CwMinRadio1 tf1_qosStationData1CwMaxRadio1 tf1_qosStationData1TXOPLimitRadio1 tf1_qosStationData2Radio1 tf1_qosStationData2AIFSRadio1 tf1_qosStationData2CwMinRadio1 tf1_qosStationData2CwMaxRadio1 tf1_qosStationData2TXOPLimitRadio1 tf1_qosStationData3Radio1 tf1_qosStationData3AIFSRadio1 tf1_qosStationData3CwMinRadio1 tf1_qosStationData3CwMaxRadio1 tf1_qosStationData3TXOPLimitRadio1', 'break_qosApProfileRadio1 break_qosRadioModeRadio1 break_qosTemplateRadio1 break_qosApedcaParametersRadio1 break_qosApedcaAIFSRadio1 break_qosApedcaApDataCwMinRadio1 break_qosApedcaApDataCwMaxRadio1 break_qosApedcaApDataMaxBurstRadio1 break_qosApedcaData1VideoRadio1 break_qosApedcaApData1AIFSRadio1 break_qosApedcaApData1CwMinRadio1 break_qosApedcaApData1CwMaxRadio1 break_qosApedcaApData1MaxBurstRadio1 break_qosApedcaData2Radio1 break_qosApedcaApData2AIFSRadio1 break_qosApedcaApData2CwMinRadio1 break_qosApedcaApData2CwMaxRadio1 break_qosApedcaApData2MaxBurstRadio1 break_qosApedcaData3Radio1 break_qosApedcaApData3AIFSRadio1 break_qosApedcaApData3CwMinRadio1 break_qosApedcaApData3CwMaxRadio1 break_qosApedcaApData3MaxBurstRadio1 break_qosApedcaWMMModeRadio1 break_qosStationData0Radio1 break_qosStationDataAIFSRadio1 break_qosStationDataCwMinRadio1 break_qosStationDataCwMaxRadio1 break_qosStationDataTXOPLimitRadio1 break_qosStationData1VideoRadio1 break_qosStationData1AIFSRadio1 break_qosStationData1CwMinRadio1 break_qosStationData1CwMaxRadio1 break_qosStationData1TXOPLimitRadio1 break_qosStationData2Radio1 break_qosStationData2AIFSRadio1 break_qosStationData2CwMinRadio1 break_qosStationData2CwMaxRadio1 break_qosStationData2TXOPLimitRadio1 break_qosStationData3Radio1 break_qosStationData3AIFSRadio1 break_qosStationData3CwMinRadio1 break_qosStationData3CwMaxRadio1 break_qosStationData3TXOPLimitRadio1','ApProfileQosBlockRadio1 ApProfileQosBlockAPEDCARadio1 ApProfileQosBlockEDCARadio1');
       		changeTemplateRadio1('tf1_qosTemplateCustomRadio1');
       		var imgObjVal = document.getElementById(imgId).className;
        	var imageName = imgObjVal.substring(imgObjVal.lastIndexOf('/') + 1);
        	if (imageName == OFF_ANCHOR) {
        		vidualDisplay('ApProfileQosBlockAPEDCARadio1 ApProfileQosBlockEDCARadio1','hide');
    		}
    	break;    	
    	
    	
    	case 'tf1_cofigureQosRadio2':
    		enableTextFieldByAnchorClick('tf1_cofigureQosRadio2','tf1_qosTemplateRadio2 tf1_qosApedcaParametersRadio2 tf1_qosApedcaAIFSRadio2 tf1_qosApedcaApDataCwMinRadio2 tf1_qosApedcaApDataCwMaxRadio2 tf1_qosApedcaApDataMaxBurstRadio2 tf1_qosApedcaData1VideoRadio2 tf1_qosApedcaApData1AIFSRadio2 tf1_qosApedcaApData1CwMinRadio2 tf1_qosApedcaApData1CwMaxRadio2 tf1_qosApedcaApData1MaxBurstRadio2 tf1_qosApedcaData2Radio2 tf1_qosApedcaApData2AIFSRadio2 tf1_qosApedcaApData2CwMinRadio2 tf1_qosApedcaApData2CwMaxRadio2 tf1_qosApedcaApData2MaxBurstRadio2 tf1_qosApedcaData3Radio2 tf1_qosApedcaApData3AIFSRadio2 tf1_qosApedcaApData3CwMinRadio2 tf1_qosApedcaApData3CwMaxRadio2 tf1_qosApedcaApData3MaxBurstRadio2 tf1_qosApedcaWMMModeRadio2 tf1_qosStationData0Radio2 tf1_qosStationDataAIFSRadio2 tf1_qosStationDataCwMinRadio2 tf1_qosStationDataCwMaxRadio2 tf1_qosStationDataTXOPLimitRadio2 tf1_qosStationData1VideoRadio2 tf1_qosStationData1AIFSRadio2 tf1_qosStationData1CwMinRadio2 tf1_qosStationData1CwMaxRadio2 tf1_qosStationData1TXOPLimitRadio2 tf1_qosStationData2Radio2 tf1_qosStationData2AIFSRadio2 tf1_qosStationData2CwMinRadio2 tf1_qosStationData2CwMaxRadio2 tf1_qosStationData2TXOPLimitRadio2 tf1_qosStationData3Radio2 tf1_qosStationData3AIFSRadio2 tf1_qosStationData3CwMinRadio2 tf1_qosStationData3CwMaxRadio2 tf1_qosStationData3TXOPLimitRadio2', 'break_qosApProfileRadio2 break_qosRadioModeRadio2 break_qosTemplateRadio2 break_qosApedcaParametersRadio2 break_qosApedcaAIFSRadio2 break_qosApedcaApDataCwMinRadio2 break_qosApedcaApDataCwMaxRadio2 break_qosApedcaApDataMaxBurstRadio2 break_qosApedcaData1VideoRadio2 break_qosApedcaApData1AIFSRadio2 break_qosApedcaApData1CwMinRadio2 break_qosApedcaApData1CwMaxRadio2 break_qosApedcaApData1MaxBurstRadio2 break_qosApedcaData2Radio2 break_qosApedcaApData2AIFSRadio2 break_qosApedcaApData2CwMinRadio2 break_qosApedcaApData2CwMaxRadio2 break_qosApedcaApData2MaxBurstRadio2 break_qosApedcaData3Radio2 break_qosApedcaApData3AIFSRadio2 break_qosApedcaApData3CwMinRadio2 break_qosApedcaApData3CwMaxRadio2 break_qosApedcaApData3MaxBurstRadio2 break_qosApedcaWMMModeRadio2 break_qosStationData0Radio2 break_qosStationDataAIFSRadio2 break_qosStationDataCwMinRadio2 break_qosStationDataCwMaxRadio2 break_qosStationDataTXOPLimitRadio2 break_qosStationData1VideoRadio2 break_qosStationData1AIFSRadio2 break_qosStationData1CwMinRadio2 break_qosStationData1CwMaxRadio2 break_qosStationData1TXOPLimitRadio2 break_qosStationData2Radio2 break_qosStationData2AIFSRadio2 break_qosStationData2CwMinRadio2 break_qosStationData2CwMaxRadio2 break_qosStationData2TXOPLimitRadio2 break_qosStationData3Radio2 break_qosStationData3AIFSRadio2 break_qosStationData3CwMinRadio2 break_qosStationData3CwMaxRadio2 break_qosStationData3TXOPLimitRadio2','ApProfileQosBlockRadio2 ApProfileQosBlockAPEDCARadio2 ApProfileQosBlockEDCARadio2');
       		changeTemplateRadio2('tf1_qosTemplateCustomRadio2');
       		var imgObjVal = document.getElementById(imgId).className;
        	var imageName = imgObjVal.substring(imgObjVal.lastIndexOf('/') + 1);
        	if (imageName == OFF_ANCHOR) {
        		vidualDisplay('ApProfileQosBlockAPEDCARadio2 ApProfileQosBlockEDCARadio2','hide');
    		}
    	break;
    	
    	case 'tf1_radioLoadBalancingRadio1':
    		enableTextFieldByAnchorClick('tf1_radioLoadBalancingRadio1','tf1_radioLoadValueRadio1','break_radioLoadValueRadio1');
    	break;
    	case 'tf1_radioRFScanRadio1':
    enableTextFieldByAnchorClick('tf1_radioRFScanRadio1','tf1_radioRFScanIntervalRadio1','break_radioRFScanIntervalRadio1');
        var rfScanObjVal =  document.getElementById('tf1_radioRFScanRadio1').className;
        var rfScanSentryObjVal = document.getElementById('tf1_radioRFScanSentryRadio1').className;
            
        if (rfScanObjVal == OFF_ANCHOR && rfScanSentryObjVal == OFF_ANCHOR){             
            fieldStateChangeWr ('tf1_radioRFScanDurationRadio1','','','');
            vidualDisplay('tf1_radioRFScanDurationRadio1','hide');
            vidualDisplay('break_radioRFScanDurationRadio1','hide');
        } else {
            fieldStateChangeWr ('','','tf1_radioRFScanDurationRadio1','');
            vidualDisplay('tf1_radioRFScanDurationRadio1','configRow');
            vidualDisplay('break_radioRFScanDurationRadio1','break');
        }
    	break;
    	case 'tf1_radioRFScanSentryRadio1':
    		enableTextFieldByAnchorClick('tf1_radioRFScanSentryRadio1','tf1_radioRFScanSentryChannel1Radio1 tf1_radioRFScanSentryChannel2Radio1','break_radioRFScanSentryChannel1Radio1 break_radioRFScanSentryChannel2Radio1');
        var rfScanObjVal =  document.getElementById('tf1_radioRFScanRadio1').className;
        var rfScanSentryObjVal = document.getElementById('tf1_radioRFScanSentryRadio1').className;
            
        if (rfScanObjVal == OFF_ANCHOR && rfScanSentryObjVal == OFF_ANCHOR){             
            fieldStateChangeWr ('tf1_radioRFScanDurationRadio1','','','');
            vidualDisplay('tf1_radioRFScanDurationRadio1','hide');
            vidualDisplay('break_radioRFScanDurationRadio1','hide');
        } else {
            fieldStateChangeWr ('','','tf1_radioRFScanDurationRadio1','');
            vidualDisplay('tf1_radioRFScanDurationRadio1','configRow');
            vidualDisplay('break_radioRFScanDurationRadio1','break');
        }

               if  (document.getElementById('tf1_radioRFScanSentryChannel1Radio1').className == OFF_ANCHOR) {

                    $("#tf1_radioRFScanSentryChannel2Radio1").attr("class",ON_ANCHOR);

                }  
    	break;
		case 'tf1_radioRateLimitingRadio1':
    		enableTextFieldByAnchorClick('tf1_radioRateLimitingRadio1','tf1_radioRateLimitRadio1 tf1_radioRateLimitBurstRadio1','break_radioRateLimitRadio1 break_radioRateLimitBurstRadio1');
    	break;

		case 'tf1_radioLoadBalancingRadio2':
    		enableTextFieldByAnchorClick('tf1_radioLoadBalancingRadio2','tf1_radioLoadValueRadio2','break_radioLoadValueRadio2');
    	break;
    	case 'tf1_radioRFScanRadio2':
    		enableTextFieldByAnchorClick('tf1_radioRFScanRadio2','tf1_radioRFScanIntervalRadio2','break_radioRFScanIntervalRadio2');
        var rfScanObjVal =  document.getElementById('tf1_radioRFScanRadio2').className;
        var rfScanSentryObjVal = document.getElementById('tf1_radioRFScanSentryRadio2').className;
         if (rfScanObjVal == OFF_ANCHOR && rfScanSentryObjVal == OFF_ANCHOR){             
            fieldStateChangeWr ('tf1_radioRFScanDurationRadio2','','','');
            vidualDisplay('tf1_radioRFScanDurationRadio2','hide');
            vidualDisplay('break_radioRFScanDurationRadio2','hide');
        } else {
            fieldStateChangeWr ('','','tf1_radioRFScanDurationRadio2','');
            vidualDisplay('tf1_radioRFScanDurationRadio2','configRow');
            vidualDisplay('break_radioRFScanDurationRadio2','break');
        }

    	break;
    	case 'tf1_radioRFScanSentryRadio2':
    		enableTextFieldByAnchorClick('tf1_radioRFScanSentryRadio2','tf1_radioRFScanSentryChannel1Radio2 tf1_radioRFScanSentryChannel2Radio2','break_radioRFScanSentryChannel1Radio2 break_radioRFScanSentryChannel2Radio2');

        var rfScanObjVal =  document.getElementById('tf1_radioRFScanRadio2').className;
        var rfScanSentryObjVal = document.getElementById('tf1_radioRFScanSentryRadio2').className;
         if (rfScanObjVal == OFF_ANCHOR && rfScanSentryObjVal == OFF_ANCHOR){             
            fieldStateChangeWr ('tf1_radioRFScanDurationRadio2','','','');
            vidualDisplay('tf1_radioRFScanDurationRadio2','hide');
            vidualDisplay('break_radioRFScanDurationRadio2','hide');
        } else {
            fieldStateChangeWr ('','','tf1_radioRFScanDurationRadio2','');
            vidualDisplay('tf1_radioRFScanDurationRadio2','configRow');
            vidualDisplay('break_radioRFScanDurationRadio2','break');
        }
               if  (document.getElementById('tf1_radioRFScanSentryChannel1Radio2').className == OFF_ANCHOR) {

                    $("#tf1_radioRFScanSentryChannel2Radio1").attr("class",ON_ANCHOR);

                } 
    	break;
		case 'tf1_radioRateLimitingRadio2':
    		enableTextFieldByAnchorClick('tf1_radioRateLimitingRadio2','tf1_radioRateLimitRadio2 tf1_radioRateLimitBurstRadio2','break_radioRateLimitRadio2 break_radioRateLimitBurstRadio2');
    	break;

        case 'tf1_radioRFScanSentryChannel1Radio1':
        
               if  (document.getElementById('tf1_radioRFScanSentryChannel1Radio1').className == OFF_ANCHOR) {

                    $("#tf1_radioRFScanSentryChannel2Radio1").attr("class",ON_ANCHOR);

                }  
            

        break;

        case 'tf1_radioRFScanSentryChannel2Radio1':

            if  (document.getElementById('tf1_radioRFScanSentryChannel2Radio1').className == OFF_ANCHOR) {

                    $("#tf1_radioRFScanSentryChannel1Radio1").attr("class",ON_ANCHOR);

                }  
            
        break;

        case 'tf1_radioRFScanSentryChannel1Radio2':
        
               if  (document.getElementById('tf1_radioRFScanSentryChannel1Radio2').className == OFF_ANCHOR) {

                    $("#tf1_radioRFScanSentryChannel2Radio2").attr("class",ON_ANCHOR);

                }  
            

        break;

        case 'tf1_radioRFScanSentryChannel2Radio2':

            if  (document.getElementById('tf1_radioRFScanSentryChannel2Radio2').className == OFF_ANCHOR) {

                    $("#tf1_radioRFScanSentryChannel1Radio2").attr("class",ON_ANCHOR);

                }  
            
        break;


	}
}


/****
 * This function calls when user selects an option from radio button
 * OnChange event
 * @method ChannelBandwidthType
 * @param selName - Select box Name
 */
function ChannelBandwidthType(selName){
	var selValue = radioCheckedValueGet(selName);
	if (!selValue) return;	
	switch (parseInt(selValue, 10)){
		case 1: 		
			
			vidualDisplay ('tf1_radioPrimaryChannelP1', 'hide');
			
			break;				
		case 2: /* None  */

            var phyMode1 = radioCheckedValueGet('tf1_radio1ModeRadio1_a');
            if (phyMode1 == 7 || phyMode1 == 8) {
                vidualDisplay ('tf1_radioPrimaryChannelP1', 'hide');
                vidualDisplay ('tf1_radioPrimaryChannelP2', '');
            }else {
			    vidualDisplay ('tf1_radioPrimaryChannelP1 tf1_radioPrimaryChannelP2', '');
            }
             
			break;			
	}
}

/****
 * This function calls when user selects an option from radio button
 * OnChange event
 * @method ChannelBandwidthType
 * @param selName - Select box Name
 */
function ChannelBandwidthTypeRadio2(selName){
	var selValue = radioCheckedValueGet(selName);
	if (!selValue) return;	
	switch (parseInt(selValue, 10)){
		case 1: 			
			vidualDisplay ('tf1_radio2PrimaryChannelP1', 'hide');
			break;				
		case 2: 
			vidualDisplay ('tf1_radio2PrimaryChannelP1 tf1_radio2PrimaryChannelP2', '');
			break;			
	}
}

function changeRadio1Mode(selName) {
    var selValue = radioCheckedValueGet(selName);
    if (!selValue) return;	
    switch (parseInt(selValue, 10)){
		case 1: 
        case 2:
            vidualDisplay ('tf1_radioPrimaryChannelP1 tf1_radioChannelBandwidth40MHzRadio1P tf1_radioChannelBandwidth80MHzRadio1P', 'hide');
        break;
        case 3:
        case 4:
        case 5:
        case 6:
            vidualDisplay ('tf1_radioPrimaryChannelP1 tf1_radioPrimaryChannelP2 tf1_radioChannelBandwidth40MHzRadio1P', '');
            vidualDisplay('tf1_radioChannelBandwidth80MHzRadio1P','hide');
            ChannelBandwidthType('tf1_radioChannelBandwidth20MHzRadio1');
        break;
        case 7:
        case 8:
        vidualDisplay('tf1_radioChannelBandwidth40MHzRadio1P tf1_radioChannelBandwidth80MHzRadio1P','');
        vidualDisplay ('tf1_radioPrimaryChannelP1', 'hide');
        ChannelBandwidthType('tf1_radioChannelBandwidth20MHzRadio1');

        break;
    }
}



function changeRadio2Mode(selName) {
    var selValue = radioCheckedValueGet(selName);
    if (!selValue) return;	
    switch (parseInt(selValue, 10)){
        case 2:
			vidualDisplay ('tf1_radio2PrimaryChannelP1 tf1_radioChannelBandwidth40MHzRadio2P', 'hide');
                        
        break;
        case 4:
        case 6:
			vidualDisplay ('tf1_radio2PrimaryChannelP1 tf1_radio2PrimaryChannelP2 tf1_radioChannelBandwidth40MHzRadio2P', '');
            ChannelBandwidthTypeRadio2('tf1_radioChannelBandwidth20MHzRadio2');
        break;
    }
}

/************************************ QOS ***************************************************/

/**
 * function for changing the Template settings of radio buttons
 * Onclick event
 * @method changeTemplate
 * @param radioName - Radio button name
 */
function changeTemplateRadio1(radioName) {
	var selValue = radioCheckedValueGet(radioName);
	if (!selValue)
		return;
	switch (parseInt(selValue, 10)) {
		case 1:
			/* Custom */
			fieldStateChangeWr('', '', 'tf1_qosApedcaAIFSRadio1 tf1_qosApedcaApDataCwMinRadio1 tf1_qosApedcaApDataCwMaxRadio1 tf1_qosApedcaApDataMaxBurstRadio1 tf1_qosApedcaData1VideoRadio1 tf1_qosApedcaApData1AIFSRadio1 tf1_qosApedcaApData1CwMinRadio1 tf1_qosApedcaApData1CwMaxRadio1 tf1_qosApedcaApData1MaxBurstRadio1 tf1_qosApedcaData2Radio1 tf1_qosApedcaApData2AIFSRadio1 tf1_qosApedcaApData2CwMinRadio1 tf1_qosApedcaApData2CwMaxRadio1 tf1_qosApedcaApData2MaxBurstRadio1 tf1_qosApedcaData3Radio1 tf1_qosApedcaApData3AIFSRadio1 tf1_qosApedcaApData3CwMinRadio1 tf1_qosApedcaApData3CwMaxRadio1 tf1_qosApedcaApData3MaxBurstRadio1 tf1_qosStationData0Radio1 tf1_qosStationDataAIFSRadio1 tf1_qosStationDataCwMinRadio1 tf1_qosStationDataCwMaxRadio1 tf1_qosStationDataTXOPLimitRadio1 tf1_qosStationData1VideoRadio1 tf1_qosStationData1AIFSRadio1 tf1_qosStationData1CwMinRadio1 tf1_qosStationData1CwMaxRadio1 tf1_qosStationData1TXOPLimitRadio1 tf1_qosStationData2Radio1 tf1_qosStationData2AIFSRadio1 tf1_qosStationData2CwMinRadio1 tf1_qosStationData2CwMaxRadio1 tf1_qosStationData2TXOPLimitRadio1 tf1_qosStationData3Radio1 tf1_qosStationData3AIFSRadio1 tf1_qosStationData3CwMinRadio1 tf1_qosStationData3CwMaxRadio1 tf1_qosStationData3TXOPLimitRadio1 ApProfileQosBlockRadio1 ApProfileQosBlockAPEDCARadio1 ApProfileQosBlockEDCARadio1', '');
			vidualDisplay('ApProfileQosBlockAPEDCARadio1 ApProfileQosBlockEDCARadio1','configRow');
			break;

		case 2: /* Factory Default */
		case 3: /* Voice*/
			fieldStateChangeWr('tf1_qosApedcaAIFSRadio1 tf1_qosApedcaApDataCwMinRadio1 tf1_qosApedcaApDataCwMaxRadio1 tf1_qosApedcaApDataMaxBurstRadio1 tf1_qosApedcaData1VideoRadio1 tf1_qosApedcaApData1AIFSRadio1 tf1_qosApedcaApData1CwMinRadio1 tf1_qosApedcaApData1CwMaxRadio1 tf1_qosApedcaApData1MaxBurstRadio1 tf1_qosApedcaData2Radio1 tf1_qosApedcaApData2AIFSRadio1 tf1_qosApedcaApData2CwMinRadio1 tf1_qosApedcaApData2CwMaxRadio1 tf1_qosApedcaApData2MaxBurstRadio1 tf1_qosApedcaData3Radio1 tf1_qosApedcaApData3AIFSRadio1 tf1_qosApedcaApData3CwMinRadio1 tf1_qosApedcaApData3CwMaxRadio1 tf1_qosApedcaApData3MaxBurstRadio1 tf1_qosStationData0Radio1 tf1_qosStationDataAIFSRadio1 tf1_qosStationDataCwMinRadio1 tf1_qosStationDataCwMaxRadio1 tf1_qosStationDataTXOPLimitRadio1 tf1_qosStationData1VideoRadio1 tf1_qosStationData1AIFSRadio1 tf1_qosStationData1CwMinRadio1 tf1_qosStationData1CwMaxRadio1 tf1_qosStationData1TXOPLimitRadio1 tf1_qosStationData2Radio1 tf1_qosStationData2AIFSRadio1 tf1_qosStationData2CwMinRadio1 tf1_qosStationData2CwMaxRadio1 tf1_qosStationData2TXOPLimitRadio1 tf1_qosStationData3Radio1 tf1_qosStationData3AIFSRadio1 tf1_qosStationData3CwMinRadio1 tf1_qosStationData3CwMaxRadio1 tf1_qosStationData3TXOPLimitRadio1 ApProfileQosBlockRadio1 ApProfileQosBlockAPEDCARadio1 ApProfileQosBlockEDCARadio1', 'ApProfileQosBlockAPEDCARadio1_div ApProfileQosBlockEDCARadio1_div', '', '');
			vidualDisplay('ApProfileQosBlockAPEDCARadio1 ApProfileQosBlockEDCARadio1','hide');

			break;
	}
}


/**
 * function for changing the Template settings of radio buttons
 * Onclick event
 * @method changeTemplate
 * @param radioName - Radio button name
 */
function changeTemplateRadio2(radioName) {
	var selValue = radioCheckedValueGet(radioName);
	if (!selValue)
		return;
	switch (parseInt(selValue, 10)) {
		case 1:
			/* Custom */
			fieldStateChangeWr('', '', 'tf1_qosApedcaAIFSRadio2 tf1_qosApedcaApDataCwMinRadio2 tf1_qosApedcaApDataCwMaxRadio2 tf1_qosApedcaApDataMaxBurstRadio2 tf1_qosApedcaData1VideoRadio2 tf1_qosApedcaApData1AIFSRadio2 tf1_qosApedcaApData1CwMinRadio2 tf1_qosApedcaApData1CwMaxRadio2 tf1_qosApedcaApData1MaxBurstRadio2 tf1_qosApedcaData2Radio2 tf1_qosApedcaApData2AIFSRadio2 tf1_qosApedcaApData2CwMinRadio2 tf1_qosApedcaApData2CwMaxRadio2 tf1_qosApedcaApData2MaxBurstRadio2 tf1_qosApedcaData3Radio2 tf1_qosApedcaApData3AIFSRadio2 tf1_qosApedcaApData3CwMinRadio2 tf1_qosApedcaApData3CwMaxRadio2 tf1_qosApedcaApData3MaxBurstRadio2 tf1_qosStationData0Radio2 tf1_qosStationDataAIFSRadio2 tf1_qosStationDataCwMinRadio2 tf1_qosStationDataCwMaxRadio2 tf1_qosStationDataTXOPLimitRadio2 tf1_qosStationData1VideoRadio2 tf1_qosStationData1AIFSRadio2 tf1_qosStationData1CwMinRadio2 tf1_qosStationData1CwMaxRadio2 tf1_qosStationData1TXOPLimitRadio2 tf1_qosStationData2Radio2 tf1_qosStationData2AIFSRadio2 tf1_qosStationData2CwMinRadio2 tf1_qosStationData2CwMaxRadio2 tf1_qosStationData2TXOPLimitRadio2 tf1_qosStationData3Radio2 tf1_qosStationData3AIFSRadio2 tf1_qosStationData3CwMinRadio2 tf1_qosStationData3CwMaxRadio2 tf1_qosStationData3TXOPLimitRadio2 ApProfileQosBlockRadio2 ApProfileQosBlockAPEDCARadio2 ApProfileQosBlockEDCARadio2', '');
			vidualDisplay('ApProfileQosBlockAPEDCARadio2 ApProfileQosBlockEDCARadio2','configRow');
			break;

		case 2: /* Factory Default */
		case 3: /* Voice*/
			fieldStateChangeWr('tf1_qosApedcaAIFSRadio2 tf1_qosApedcaApDataCwMinRadio2 tf1_qosApedcaApDataCwMaxRadio2 tf1_qosApedcaApDataMaxBurstRadio2 tf1_qosApedcaData1VideoRadio2 tf1_qosApedcaApData1AIFSRadio2 tf1_qosApedcaApData1CwMinRadio2 tf1_qosApedcaApData1CwMaxRadio2 tf1_qosApedcaApData1MaxBurstRadio2 tf1_qosApedcaData2Radio2 tf1_qosApedcaApData2AIFSRadio2 tf1_qosApedcaApData2CwMinRadio2 tf1_qosApedcaApData2CwMaxRadio2 tf1_qosApedcaApData2MaxBurstRadio2 tf1_qosApedcaData3Radio2 tf1_qosApedcaApData3AIFSRadio2 tf1_qosApedcaApData3CwMinRadio2 tf1_qosApedcaApData3CwMaxRadio2 tf1_qosApedcaApData3MaxBurstRadio2 tf1_qosStationData0Radio2 tf1_qosStationDataAIFSRadio2 tf1_qosStationDataCwMinRadio2 tf1_qosStationDataCwMaxRadio2 tf1_qosStationDataTXOPLimitRadio2 tf1_qosStationData1VideoRadio2 tf1_qosStationData1AIFSRadio2 tf1_qosStationData1CwMinRadio2 tf1_qosStationData1CwMaxRadio2 tf1_qosStationData1TXOPLimitRadio2 tf1_qosStationData2Radio2 tf1_qosStationData2AIFSRadio2 tf1_qosStationData2CwMinRadio2 tf1_qosStationData2CwMaxRadio2 tf1_qosStationData2TXOPLimitRadio2 tf1_qosStationData3Radio2 tf1_qosStationData3AIFSRadio2 tf1_qosStationData3CwMinRadio2 tf1_qosStationData3CwMaxRadio2 tf1_qosStationData3TXOPLimitRadio2 ApProfileQosBlockRadio2 ApProfileQosBlockAPEDCARadio2 ApProfileQosBlockEDCARadio2', 'ApProfileQosBlockAPEDCARadio2_div ApProfileQosBlockEDCARadio2_div', '', '');
			vidualDisplay('ApProfileQosBlockAPEDCARadio2 ApProfileQosBlockEDCARadio2','hide');

			break;
	}
}



/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method apProfilesRadioFormValidate
 */
function apProfilesRadioFormValidate(frmId) {

	var txtFieldIdArr = new Array();
	
	txtFieldIdArr[0] = "tf1_profileName,Please enter the Profile Name";
    txtFieldIdArr[1] = "tf1_vlanId,Please enter valid Wired Network Discovery VLAN ID";

    if (document.getElementById('tf1_cofigureRadio1').className == ON_ANCHOR) {
	/* radio1 */
	txtFieldIdArr[2] = "tf1_radioRTSThresholdRadio1,Please enter valid RTS Threshold";
	txtFieldIdArr[3] = "tf1_radioLoadValueRadio1,Please enter valid Load Balancing";
	txtFieldIdArr[4] = "tf1_radioMaxClientsRadio1,Please enter valid Maximum Clients";
	txtFieldIdArr[5] = "tf1_radioDTIMPeriodRadio1,Please enter valid DTIM Period";
	txtFieldIdArr[6] = "tf1_radioBeaconIntervalRadio1,Please enter valid Beacon Interval";
	txtFieldIdArr[7] = "tf1_radioInitialPowerRadio1,Please enter valid Initial Power";
	txtFieldIdArr[8] = "tf1_radioRFScanIntervalRadio1,Please enter valid RF Scan Interval";
	txtFieldIdArr[9] = "tf1_radioFragThresholdRadio1,Please enter valid Frag Threshold";
	txtFieldIdArr[10] = "tf1_radioRFScanDurationRadio1,Please enter valid RF Scan Duration";
	txtFieldIdArr[11] = "tf1_radioRateLimitRadio1,Please enter valid Rate Limit";
	txtFieldIdArr[12] = "tf1_radioRateLimitBurstRadio1,Please enter valid Rate Limit Burst";
	/* radio2 */
	txtFieldIdArr[13] = "tf1_radioRTSThresholdRadio2,Please enter valid RTS Threshold";
	txtFieldIdArr[14] = "tf1_radioLoadValueRadio2,Please enter valid Load Balancing";
	txtFieldIdArr[15] = "tf1_radioMaxClientsRadio2,Please enter valid Maximum Clients";
	txtFieldIdArr[16] = "tf1_radioDTIMPeriodRadio2,Please enter valid DTIM Period";
	txtFieldIdArr[17] = "tf1_radioBeaconIntervalRadio2,Please enter valid Beacon Interval";
	txtFieldIdArr[18] = "tf1_radioInitialPowerRadio2,Please enter valid Initial Power";
	txtFieldIdArr[19] = "tf1_radioRFScanIntervalRadio2,Please enter valid RF Scan Interval";
	txtFieldIdArr[20] = "tf1_radioFragThresholdRadio2,Please enter valid Frag Threshold";
	txtFieldIdArr[21] = "tf1_radioRFScanDurationRadio2,Please enter valid RF Scan Duration";
	txtFieldIdArr[22] = "tf1_radioRateLimitRadio2,Please enter valid Rate Limit";
	txtFieldIdArr[23] = "tf1_radioRateLimitBurstRadio2,Please enter valid Rate Limit Burst";
	txtFieldIdArr[24] = "tf1_radioMinimumPowerRadio1,Please enter valid Minimum Power";
	txtFieldIdArr[25] = "tf1_radioMinimumPowerRadio2,Please enter valid Minimum Power";
	}
    else{
	txtFieldIdArr[2] = "tf1_radioRTSThresholdRadio2,Please enter valid RTS Threshold";
	txtFieldIdArr[3] = "tf1_radioLoadValueRadio2,Please enter valid Load Balancing";
	txtFieldIdArr[4] = "tf1_radioMaxClientsRadio2,Please enter valid Maximum Clients";
	txtFieldIdArr[5] = "tf1_radioDTIMPeriodRadio2,Please enter valid DTIM Period";
	txtFieldIdArr[6] = "tf1_radioBeaconIntervalRadio2,Please enter valid Beacon Interval";
	txtFieldIdArr[7] = "tf1_radioInitialPowerRadio2,Please enter valid Initial Power";
	txtFieldIdArr[8] = "tf1_radioRFScanIntervalRadio2,Please enter valid RF Scan Interval";
	txtFieldIdArr[9] = "tf1_radioFragThresholdRadio2,Please enter valid Frag Threshold";
	txtFieldIdArr[10] = "tf1_radioRFScanDurationRadio2,Please enter valid RF Scan Duration";
	txtFieldIdArr[11] = "tf1_radioRateLimitRadio2,Please enter valid Rate Limit";
	txtFieldIdArr[12] = "tf1_radioRateLimitBurstRadio2,Please enter valid Rate Limit Burst";    
	txtFieldIdArr[13] = "tf1_radioMinimumPowerRadio2,Please enter valid Minimum Power";
    }

    if (document.getElementById('tf1_cofigureQosRadio1').className == ON_ANCHOR) {
	/* Qos Radio1 */ 
	txtFieldIdArr[24] = "tf1_qosApedcaAIFSRadio1, Please enter valid AP EDCA Data 0 AIFS ";
	txtFieldIdArr[25] = "tf1_qosApedcaApDataMaxBurstRadio1, Please enter valid AP EDCA Data 0 Max. Burst";
	txtFieldIdArr[26] = "tf1_qosApedcaApData1AIFSRadio1, Please enter valid AP EDCA Data 1 AIFS ";
	txtFieldIdArr[27] = "tf1_qosApedcaApData1MaxBurstRadio1, Please enter valid AP EDCA Data 1 Max. Burst";
	txtFieldIdArr[28] = "tf1_qosApedcaApData2AIFSRadio1, Please enter valid AP EDCA Data 2 AIFS ";
	txtFieldIdArr[29] = "tf1_qosApedcaApData2MaxBurstRadio1, Please enter valid AP EDCA Data 2 Max. Burst";
	txtFieldIdArr[30] = "tf1_qosApedcaApData3AIFSRadio1, Please enter valid AP EDCA Data 3 AIFS ";
	txtFieldIdArr[31] = "tf1_qosApedcaApData3MaxBurstRadio1, Please enter valid AP EDCA Data 3 Max. Burst";
	txtFieldIdArr[32] = "tf1_qosStationDataAIFSRadio1, Please enter valid Station EDCA Data 0 AIFS";
	txtFieldIdArr[33] = "tf1_qosStationDataTXOPLimitRadio1, Please enter valid Station EDCA Data 0 TXOP Limit";
	txtFieldIdArr[34] = "tf1_qosStationData1AIFSRadio1, Please enter valid Station EDCA Data 1 AIFS";
	txtFieldIdArr[35] = "tf1_qosStationData1TXOPLimitRadio1, Please enter valid Station EDCA Data 1 TXOP Limit";
	txtFieldIdArr[36] = "tf1_qosStationData2AIFSRadio1, Please enter valid Station EDCA Data 2 AIFS";
	txtFieldIdArr[37] = "tf1_qosStationData2TXOPLimitRadio1, Please enter valid Station EDCA Data 2 TXOP Limit";
	txtFieldIdArr[38] = "tf1_qosStationData3AIFSRadio1, Please enter valid Station EDCA Data 3 AIFS";
	txtFieldIdArr[39] = "tf1_qosStationData3TXOPLimitRadio1, Please enter valid Station EDCA Data 3 TXOP Limit";
	/* Qos Radio2  */
	txtFieldIdArr[40] = "tf1_qosApedcaAIFSRadio2, Please enter valid AP EDCA Data 0 AIFS ";
	txtFieldIdArr[41] = "tf1_qosApedcaApDataMaxBurstRadio2, Please enter valid AP EDCA Data 0 Max. Burst";
	txtFieldIdArr[42] = "tf1_qosApedcaApData1AIFSRadio2, Please enter valid AP EDCA Data 1 AIFS ";
	txtFieldIdArr[43] = "tf1_qosApedcaApData1MaxBurstRadio2, Please enter valid AP EDCA Data 1 Max. Burst";
	txtFieldIdArr[44] = "tf1_qosApedcaApData2AIFSRadio2, Please enter valid AP EDCA Data 2 AIFS ";
	txtFieldIdArr[45] = "tf1_qosApedcaApData2MaxBurstRadio2, Please enter valid AP EDCA Data 2 Max. Burst";
	txtFieldIdArr[46] = "tf1_qosApedcaApData3AIFSRadio2, Please enter valid AP EDCA Data 3 AIFS ";
	txtFieldIdArr[47] = "tf1_qosApedcaApData3MaxBurstRadio2, Please enter valid AP EDCA Data 3 Max. Burst";
	txtFieldIdArr[48] = "tf1_qosStationDataAIFSRadio2, Please enter valid Station EDCA Data 0 AIFS";
	txtFieldIdArr[49] = "tf1_qosStationDataTXOPLimitRadio2, Please enter valid Station EDCA Data 0 TXOP Limit";
	txtFieldIdArr[50] = "tf1_qosStationData1AIFSRadio2, Please enter valid Station EDCA Data 1 AIFS";
	txtFieldIdArr[51] = "tf1_qosStationData1TXOPLimitRadio2, Please enter valid Station EDCA Data 1 TXOP Limit";
	txtFieldIdArr[52] = "tf1_qosStationData2AIFSRadio2, Please enter valid Station EDCA Data 2 AIFS";
	txtFieldIdArr[53] = "tf1_qosStationData2TXOPLimitRadio2, Please enter valid Station EDCA Data 2 TXOP Limit";
	txtFieldIdArr[54] = "tf1_qosStationData3AIFSRadio2, Please enter valid Station EDCA Data 3 AIFS";
	txtFieldIdArr[55] = "tf1_qosStationData3TXOPLimitRadio2, Please enter valid Station EDCA Data 3 TXOP Limit";
	}

    else {
	/* Qos Radio2  */
	txtFieldIdArr[13] = "tf1_qosApedcaAIFSRadio2, Please enter valid AP EDCA Data 0 AIFS ";
	txtFieldIdArr[14] = "tf1_qosApedcaApDataMaxBurstRadio2, Please enter valid AP EDCA Data 0 Max. Burst";
	txtFieldIdArr[15] = "tf1_qosApedcaApData1AIFSRadio2, Please enter valid AP EDCA Data 1 AIFS ";
	txtFieldIdArr[16] = "tf1_qosApedcaApData1MaxBurstRadio2, Please enter valid AP EDCA Data 1 Max. Burst";
	txtFieldIdArr[17] = "tf1_qosApedcaApData2AIFSRadio2, Please enter valid AP EDCA Data 2 AIFS ";
	txtFieldIdArr[18] = "tf1_qosApedcaApData2MaxBurstRadio2, Please enter valid AP EDCA Data 2 Max. Burst";
	txtFieldIdArr[19] = "tf1_qosApedcaApData3AIFSRadio2, Please enter valid AP EDCA Data 3 AIFS ";
	txtFieldIdArr[20] = "tf1_qosApedcaApData3MaxBurstRadio2, Please enter valid AP EDCA Data 3 Max. Burst";
	txtFieldIdArr[21] = "tf1_qosStationDataAIFSRadio2, Please enter valid Station EDCA Data 0 AIFS";
	txtFieldIdArr[22] = "tf1_qosStationDataTXOPLimitRadio2, Please enter valid Station EDCA Data 0 TXOP Limit";
	txtFieldIdArr[23] = "tf1_qosStationData1AIFSRadio2, Please enter valid Station EDCA Data 1 AIFS";
	txtFieldIdArr[24] = "tf1_qosStationData1TXOPLimitRadio2, Please enter valid Station EDCA Data 1 TXOP Limit";
	txtFieldIdArr[25] = "tf1_qosStationData2AIFSRadio2, Please enter valid Station EDCA Data 2 AIFS";
	txtFieldIdArr[26] = "tf1_qosStationData2TXOPLimitRadio2, Please enter valid Station EDCA Data 2 TXOP Limit";
	txtFieldIdArr[27] = "tf1_qosStationData3AIFSRadio2, Please enter valid Station EDCA Data 3 AIFS";
	txtFieldIdArr[28] = "tf1_qosStationData3TXOPLimitRadio2, Please enter valid Station EDCA Data 3 TXOP Limit";
    }
	if (txtFieldArrayCheck(txtFieldIdArr) == false)
		return false;

    if (alphaNumericValueCheck('tf1_profileName', '', '') == false) 
        return false;
	
	if (numericValueRangeCheck(document.getElementById('tf1_vlanId'), '', '', 1, 4093, true, 'Invalid Wired Network Discovery VLAN ID.', '') == false)
		return false;

	/* radio1 */
   if(document.getElementById('tf1_cofigureRadio1').className == ON_ANCHOR){
    
	if (numericValueRangeCheck(document.getElementById('tf1_radioRTSThresholdRadio1'), '', '', 0, 2347, true, 'Invalid RTS Threshold.', 'Bytes') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_radioLoadValueRadio1'), '', '', 1, 100, true, 'Invalid Load Balancing.', '%') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_radioMaxClientsRadio1'), '', '', 0, 200, true, 'Invalid Maximum Clients.', '') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_radioDTIMPeriodRadio1'), '', '', 1, 255, true, 'Invalid DTIM Period.', 'Beacons') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_radioBeaconIntervalRadio1'), '', '', 20, 200, true, 'Invalid Beacon Interval.', 'M. Sec.') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_radioInitialPowerRadio1'), '', '', 1, 100, true, 'Invalid Initial Power.', '%') == false)
		return false;
        
	if (numericValueRangeCheck(document.getElementById('tf1_radioMinimumPowerRadio1'), '', '', 1, 100, true, 'Invalid Minimum Power.', '%') == false)
		return false;


	if (numericValueRangeCheck(document.getElementById('tf1_radioRFScanIntervalRadio1'), '', '', 30, 120, true, 'Invalid RF Scan Interval.', 'Sec.') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_radioFragThresholdRadio1'), '', '', 256, 2346, true, 'Invalid Frag Threshold.', 'Bytes') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_radioRFScanDurationRadio1'), '', '', 10, 2000, true, 'Invalid RF Scan Duration.', 'M. Sec.') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_radioRateLimitRadio1'), '', '', 1, 50, true, 'Invalid Rate Limit.', 'Pkts/Sec') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_radioRateLimitBurstRadio1'), '', '', 1, 75, true, 'Invalid Rate Limit Burst.', 'Pkts/Sec') == false)
		return false;
}
	/* radio2 */
	if (numericValueRangeCheck(document.getElementById('tf1_radioRTSThresholdRadio2'), '', '', 0, 2347, true, 'Invalid RTS Threshold.', 'Bytes') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_radioLoadValueRadio2'), '', '', 1, 100, true, 'Invalid Load Balancing.', '%') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_radioMaxClientsRadio2'), '', '', 0, 200, true, 'Invalid Maximum Clients.', '') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_radioDTIMPeriodRadio2'), '', '', 1, 255, true, 'Invalid DTIM Period.', 'Beacons') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_radioBeaconIntervalRadio2'), '', '', 20, 200, true, 'Invalid Beacon Interval.', 'M. Sec.') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_radioInitialPowerRadio2'), '', '', 1, 100, true, 'Invalid Initial Power.', '%') == false)
		return false;
        
	if (numericValueRangeCheck(document.getElementById('tf1_radioMinimumPowerRadio2'), '', '', 1, 100, true, 'Invalid Minimum Power.', '%') == false)
		return false;


	if (numericValueRangeCheck(document.getElementById('tf1_radioRFScanIntervalRadio2'), '', '', 30, 120, true, 'Invalid RF Scan Interval.', 'Sec.') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_radioFragThresholdRadio2'), '', '', 256, 2346, true, 'Invalid Frag Threshold.', 'Bytes') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_radioRFScanDurationRadio2'), '', '', 10, 2000, true, 'Invalid RF Scan Duration.', 'M. Sec.') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_radioRateLimitRadio2'), '', '', 1, 50, true, 'Invalid Rate Limit.', 'Pkts/Sec') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_radioRateLimitBurstRadio2'), '', '', 1, 75, true, 'Invalid Rate Limit Burst.', 'Pkts/Sec') == false)
		return false;


	/* Qos Radio1 */
if (document.getElementById('tf1_cofigureQosRadio1').className == ON_ANCHOR) {

	if (numericValueRangeCheck(document.getElementById('tf1_qosApedcaAIFSRadio1'), '', '', 1, 255, true, 'Invalid AP EDCA Data 0 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_qosApedcaApDataMaxBurstRadio1'), '', '', 0, 999900, true, 'Invalid AP EDCA Data 0 Max. Burst', 'U. Sec') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_qosApedcaApData1AIFSRadio1'), '', '', 1, 255, true, 'Invalid AP EDCA Data 1 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_qosApedcaApData1MaxBurstRadio1'), '', '', 0, 999900, true, 'Invalid AP EDCA Data 1 Max. Burst', 'U. Sec.') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_qosApedcaApData2AIFSRadio1'), '', '', 1, 255, true, 'Invalid AP EDCA Data 2 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_qosApedcaApData2MaxBurstRadio1'), '', '', 0, 999900, true, 'Invalid AP EDCA Data 2 Max. Burst', 'U. Sec.') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_qosApedcaApData3AIFSRadio1'), '', '', 1, 255, true, 'Invalid AP EDCA Data 3 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_qosApedcaApData3MaxBurstRadio1'), '', '', 0, 999900, true, 'Invalid AP EDCA Data 3 Max. Burst', 'U. Sec.') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_qosStationDataAIFSRadio1'), '', '', 1, 255, true, 'Invalid Station EDCA Data 0 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_qosStationDataTXOPLimitRadio1'), '', '', 0, 65535, true, 'Invalid Station EDCA Data 0 TXOP Limit', '32 U. Sec. units') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_qosStationData1AIFSRadio1'), '', '', 1, 255, true, 'Invalid Station EDCA Data 1 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_qosStationData1TXOPLimitRadio1'), '', '', 0, 65535, true, 'Invalid Station EDCA Data 1 TXOP Limit', '32 U. Sec. units') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_qosStationData2AIFSRadio1'), '', '', 1, 255, true, 'Invalid Station EDCA Data 2 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_qosStationData2TXOPLimitRadio1'), '', '', 0, 65535, true, 'Invalid Station EDCA Data 2 TXOP Limit', '32 U. Sec. units') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_qosStationData3AIFSRadio1'), '', '', 1, 255, true, 'Invalid Station EDCA Data 3 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_qosStationData3TXOPLimitRadio1'), '', '', 0, 65535, true, 'Invalid Station EDCA Data 3 TXOP Limit', '32 U. Sec. units') == false)
		return false;
		
		}
	/* Qos Radio2 */
	if (numericValueRangeCheck(document.getElementById('tf1_qosApedcaAIFSRadio2'), '', '', 1, 255, true, 'Invalid AP EDCA Data 0 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_qosApedcaApDataMaxBurstRadio2'), '', '', 0, 999900, true, 'Invalid AP EDCA Data 0 Max. Burst', 'U. Sec') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_qosApedcaApData1AIFSRadio2'), '', '', 1, 255, true, 'Invalid AP EDCA Data 1 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_qosApedcaApData1MaxBurstRadio2'), '', '', 0, 999900, true, 'Invalid AP EDCA Data 1 Max. Burst', 'U. Sec.') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_qosApedcaApData2AIFSRadio2'), '', '', 1, 255, true, 'Invalid AP EDCA Data 2 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_qosApedcaApData2MaxBurstRadio2'), '', '', 0, 999900, true, 'Invalid AP EDCA Data 2 Max. Burst', 'U. Sec.') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_qosApedcaApData3AIFSRadio2'), '', '', 1, 255, true, 'Invalid AP EDCA Data 3 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_qosApedcaApData3MaxBurstRadio2'), '', '', 0, 999900, true, 'Invalid AP EDCA Data 3 Max. Burst', 'U. Sec.') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_qosStationDataAIFSRadio2'), '', '', 1, 255, true, 'Invalid Station EDCA Data 0 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_qosStationDataTXOPLimitRadio2'), '', '', 0, 65535, true, 'Invalid Station EDCA Data 0 TXOP Limit', '32 U. Sec. units') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_qosStationData1AIFSRadio2'), '', '', 1, 255, true, 'Invalid Station EDCA Data 1 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_qosStationData1TXOPLimitRadio2'), '', '', 0, 65535, true, 'Invalid Station EDCA Data 1 TXOP Limit', '32 U. Sec. units') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_qosStationData2AIFSRadio2'), '', '', 1, 255, true, 'Invalid Station EDCA Data 2 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_qosStationData2TXOPLimitRadio2'), '', '', 0, 65535, true, 'Invalid Station EDCA Data 2 TXOP Limit', '32 U. Sec. units') == false)
		return false;

	if (numericValueRangeCheck(document.getElementById('tf1_qosStationData3AIFSRadio2'), '', '', 1, 255, true, 'Invalid Station EDCA Data 3 AIFS', 'M. Sec.') == false)
		return false;
	if (numericValueRangeCheck(document.getElementById('tf1_qosStationData3TXOPLimitRadio2'), '', '', 0, 65535, true, 'Invalid Station EDCA Data 3 TXOP Limit', '32 U. Sec. units') == false)
		return false;


	setHiddenChks(frmId);
	return true;
}


/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method apProfilesRadioFormValidateEdit
 */
function apProfilesRadioFormValidateEdit() {

	var txtFieldIdArr = new Array();	
	txtFieldIdArr[0] = "tf1_profileNameEdit,Please enter the Profile Name";
    txtFieldIdArr[1] = "tf1_vlanIdEdit,Please enter valid Wired Network Discovery VLAN ID";
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false)
		return false;

    if (alphaNumericValueCheck('tf1_profileNameEdit', '', '') == false) 
        return false;
	
	if (numericValueRangeCheck(document.getElementById('tf1_vlanIdEdit'), '', '', 1, 4093, true, 'Invalid Wired Network Discovery VLAN ID.', '') == false)
		return false;
		
	return true;
}


function changeHardwareOptions() {

 var hardWareSelVal = document.getElementById("tf1_apProfileshwType").value;

    $("#tf1_radio1ModeRadio1_a").attr('checked', 'checked');
    $(".iee802Mode").each(function(){$(this).hide();});
    $(".iee802ModeHW13").show();
    switch(hardWareSelVal){        
    	case '8':  /* Any */     
        case '9': /*DWL-8600AP Dual Radio a/b/g/n */
        case '13': /*DWL-8610AP Dual Radio a/b/g/n */
        case '11': /*DWL-6600AP Dual Radio a/b/g/n */
        if ($("#tf1_apProfileshwType").val() == "8" ||  $("#tf1_apProfileshwType").val() == "13") {
            $(".iee802Mode").each(function(){$(this).show();});
        }
        if ($("#tf1_apProfileshwType").val() == "13") {
            $(".iee802ModeHW13").hide();
        }
        if ($("#tf1_lastHwType").val() == "12" ||  $("#tf1_lastHwType").val() == "10") {
        vidualDisplay('tf1_cofigureRadio1 ApProfileRadioBlock1 tf1_cofigureQosRadio1 ApProfileQosBlockRadio1', 'configRow');

    vidualDisplay('tf1_headingRadio1 tf1_headingQosRadio1','');
        
        $("#tf1_cofigureRadio1").attr("class","enable-disable-on");
           $("#tf1_cofigureRadio1").trigger("click");
          $("#tf1_cofigureQosRadio1").attr("class","enable-disable-on");
              $("#tf1_cofigureQosRadio1").trigger("click");
        }

vidualDisplay("break_cofigureRadio1 break_cofigureQosRadio1","break");
        break;
        case '10': /*DWL-3600AP Single Radio b/g/n */         
        case '12': /*DWL-2600AP Single Radio b/g/n */
            $("#tf1_cofigureRadio1").attr("class","enable-disable-on");
              $("#tf1_cofigureRadio1").trigger("click");
              $("#tf1_cofigureQosRadio1").attr("class","enable-disable-on");
              $("#tf1_cofigureQosRadio1").trigger("click");
              vidualDisplay('tf1_cofigureRadio1 tf1_headingRadio1 ApProfileRadioBlock1 tf1_cofigureQosRadio1 tf1_headingQosRadio1 ApProfileQosBlockRadio1', 'hide');
vidualDisplay("break_cofigureRadio1 break_cofigureQosRadio1","hide");
        break;

        }

        $("#tf1_lastHwType").val(hardWareSelVal);
        changeRadio1Mode('tf1_radio1ModeRadio1_a');
 

}
