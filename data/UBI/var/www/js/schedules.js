/*
 * File: schedules.js
 * Created on 26th Nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
function onclickCallSchedulesFn(){  
	onloadCall();  
    daySelectCheck('tf1_daySelect1');
    timeSelectCheck('tf1_timeSelect1');
    
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
				// End Time
				$('#tf1_dateTimePickerEnd').val($('#tf1_dateTimePickerEndValue').val());
				$('#tf1_dateTimePickerEnd').scroller('destroy').scroller(
					$.extend(
						opt["time"], { 					
							mode: "scroller", 
							display: "inline" 
						}
					)			
				);
}


function onchangeValueStart(){
				$('#tf1_dateTimePickerStartValue').val($('#tf1_dateTimePickerStart').val());
			}
			function onchangeValueEnd(){
				$('#tf1_dateTimePickerEndValue').val($('#tf1_dateTimePickerEnd').val());
			}
/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method schedulesConfigValidate
 */
function schedulesConfigValidate(frmId){

    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_scheduleName,"+LANG_LOCALE['12371'];
    txtFieldIdArr[1] = "tf1_dateTimePickerStartValue,"+LANG_LOCALE['12389'];
    txtFieldIdArr[2] = "tf1_dateTimePickerEndValue,"+LANG_LOCALE['12268'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    if (alphaNumericValueCheck ("tf1_scheduleName", '', '') == false)    
        return false;

    var txtFieldIdArr1 = new Array();
    txtFieldIdArr1[0] = "tf1_scheduleName,"+LANG_LOCALE['12371'];

    if (isProblemCharArrayCheck(txtFieldIdArr1, "'\" ", NOT_SUPPORTED) == false) 
        return false;
    
    if(checkSpecificDays() == false)
		return false;
    setHiddenChks(frmId);    
    return true;
}

function checkSpecificDays()  {
	var schObj = radioCheckedValueGet('tf1_daySelect2');   
    if(schObj == 2){
 
    	if($("#tf1_monday").attr("class") == "enable-disable-off" && $("#tf1_tuesday").attr("class") == "enable-disable-off" && $("#tf1_wednesday").attr("class") == "enable-disable-off" && $("#tf1_thursday ").attr("class") == "enable-disable-off" && $("#tf1_friday").attr("class") == "enable-disable-off" && $("#tf1_saturday").attr("class") == "enable-disable-off" && $("#tf1_sunday").attr("class") == "enable-disable-off") {
    		alert(LANG_LOCALE['13507']);
    		return false;
    } else{
			return true;}
}
}
/**
 * function for compare two times
 * @method compareTimes
 * @param start - start Time
 * @param end - end Time
 */
function compareTimes(start, end){
	var timef1 = document.getElementById(start);
	var timef2 = document.getElementById(end);	
	
	if ((timef1 && timef1.disabled) || (timef2 && timef2.disabled))
		return;
	
	var Todaydate = new Date();
	var Formatteddate = Todaydate.getDate() +"/" + Todaydate.getMonth() +"/" + Todaydate.getYear();	
	var time1 = Formatteddate + " " + timef1.value;
	var time2 = Formatteddate + " " + timef2.value;
	var StartTime = new Date(time1);
	var EndTime = new Date(time2);
	var TimeDiff = EndTime.getTime() - StartTime.getTime();
	if(TimeDiff <= 0){
		alert(LANG_LOCALE['10928']);
		document.getElementById(end).focus();
		return false;
	}else{
		return true;
	}
}

/**
 * function for changing the Date settings of radio buttons
 * Onclick event
 * @method daySelectCheck
 * @param radioName - Radio button name
 */
function daySelectCheck(radioName){
    var selValue = radioCheckedValueGet(radioName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* All Days */
            fieldStateChangeWr('tf1_monday tf1_tuesday tf1_wednesday tf1_thursday tf1_friday tf1_saturday tf1_sunday', '', '', '');
            vidualDisplay('tf1_monday tf1_tuesday tf1_wednesday tf1_thursday tf1_friday tf1_saturday tf1_sunday', 'hide');
            vidualDisplay('break1 break2 break3 break4 break5 break6 break7', 'hide');
            break;
            
        case 2: /* Specific Days */
            fieldStateChangeWr('', '', 'tf1_monday tf1_tuesday tf1_wednesday tf1_thursday tf1_friday tf1_saturday tf1_sunday', '');
            vidualDisplay('tf1_monday tf1_tuesday tf1_wednesday tf1_thursday tf1_friday tf1_saturday tf1_sunday', 'configRow');
            vidualDisplay('break1 break2 break3 break4 break5 break6 break7', 'break');
            break;
    }
}

/**
 * function for changing the time settings of radio buttons
 * Onclick event
 * @method timeSelectCheck
 * @param radioName - Radio button name
 */
function timeSelectCheck(radioName){
    var selValue = radioCheckedValueGet(radioName);
    if (!selValue) 
        return;
    switch (parseInt(selValue, 10)) {
        case 1: /* All Day */
            fieldStateChangeWr('tf1_dateTimePickerStartValue tf1_dateTimePickerEndValue', '', '', '');
            vidualDisplay('tf1_dateTimePickerStartValue tf1_dateTimePickerEndValue startTime endTime', 'hide');
            vidualDisplay('', 'hide');
            break;
            
        case 2: /* Specific Times */
            fieldStateChangeWr('', '', 'tf1_dateTimePickerStartValue tf1_dateTimePickerEndValue');
            vidualDisplay('tf1_dateTimePickerStartValue tf1_dateTimePickerEndValue startTime endTime', 'configRow');
            vidualDisplay('', 'break');
            break;
    }
}

