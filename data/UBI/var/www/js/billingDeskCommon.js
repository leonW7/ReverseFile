/*
Copyright (c) 2012 TeamF1, Inc.
All rights reserved.
*/
var showAlertArr = ['hour', 'day', 'mb', 'gb'];
/*********************************************************************
Function:validateCostTypes - Used to validate hour, day, mb, gb ranges
@Params: txtId - field id in which value is entered
@Params: durationTypeId - cost type field id
Returns: true/false
*/
function validateCostTypes (txtId, durationTypeId){
    var flag = 1;
    var showAlertObj = document.getElementById (txtId);
	 
    var showAlertDropObj = document.getElementById (durationTypeId); 
	
    if (showAlertObj && showAlertDropObj) { 

		 
        switch (showAlertArr[showAlertDropObj.value]) {
            case 'hour': if (numericValueRangeCheck (showAlertObj, '', '', 1, 23, true, '', 'hours') == false)
                                 flag = 0;
                                 break;
            case 'day':  if (numericValueRangeCheck (showAlertObj, '', '', 1, 365, true, '', 'day') == false)                        
                                 flag = 0;
                                 break;
            case 'mb':   if (numericValueRangeCheck (showAlertObj, '', '', 1, 1023, true, '', 'MB') == false)
                                 flag = 0;
                                 break;
            case 'gb':   if (numericValueRangeCheck (showAlertObj, '', '', 1, 100, true, '', 'GB') == false)
                                 flag = 0;
                                 break;
            default:         break;
        }       
    }
    if (flag == 0) {
        return false
    }
    else {
        return true;
    }
}

/********************************************************************************************************************
*validateTimeWr - Wrapper for fields to validate dates
*@param beginTime begin date id
*@param endTime expiration date id
*/
var validateTimeWr = function (beginTime, endTime) {
    var beginTimeObj = document.getElementById (beginTime);
    var endTimeObj = document.getElementById (endTime);
    if (beginTimeObj && !beginTimeObj.disabled && endTimeObj && !endTimeObj.disabled) {
        return validateTime (beginTimeObj.value, endTimeObj.value);
    }
    return true;
}

/********************************************************************************************************************
*validateTime - validates date values. checks if one date is greater than other date
*@param beginTimeValue begin date value, should be less than end date value
*@param endTimeValue end date value, should be greater than begin time value
*/
var validateTime = function (beginTimeValue, endTimeValue) {
    var beginTimeObjArr = beginTimeValue.split (' ');
    var endTimeObjArr = endTimeValue.split (' ');    
    var beginTimeArr = beginTimeObjArr[0].split ('/');
    var endTimeArr = endTimeObjArr[0].split ('/');
    if (beginTimeArr && endTimeArr) {
        if ( (parseInt(beginTimeArr[2],10)==parseInt(endTimeArr[2],10)) && (parseInt(beginTimeArr[0],10)==parseInt(endTimeArr[0],10)) && (parseInt(beginTimeArr[1],10)==parseInt(endTimeArr[1],10))) {            
            var beginTimeArr = beginTimeObjArr[1].split (':');
            var endTimeArr = endTimeObjArr[1].split (':');            
            if (parseInt (beginTimeArr[0],10) == parseInt (endTimeArr[0],10)) {
                 if (parseInt(beginTimeArr[1],10) > parseInt(endTimeArr[1],10)) {
                     return false;
                 }
            }
            else if (parseInt (beginTimeArr[0],10) > parseInt (endTimeArr[0],10)) {
                return false;
            }    
            return true;
        }
        else if ( ( parseInt(beginTimeArr[2],10)>parseInt(endTimeArr[2],10) ) || ( (parseInt(beginTimeArr[2],10)==parseInt(endTimeArr[2],10)) && (parseInt(beginTimeArr[0],10) > parseInt(endTimeArr[0],10)) ) || ( (parseInt(beginTimeArr[0],10)==parseInt(endTimeArr[0],10)) && (parseInt(beginTimeArr[1],10)>parseInt(endTimeArr[1],10)) ) ) {
            return false;
        }
    }
    return true;
}

/********************************************************************************************************************
*todayDate - find out today's date and return in the format "mm/dd/yy"
returns todays date
*/

function getTodayDate () {
    // Set the date to device's date
    var setYear = parseInt (document.getElementById ('hdYear').value, 10);
    var setMonth = parseInt (document.getElementById ('hdMonth').value, 10);
    var setDay = parseInt (document.getElementById ('hdDay').value, 10);
    var setHour = parseInt (document.getElementById ('hdHours').value, 10);        
    var setMinutes = parseInt (document.getElementById ('hdMinutes').value, 10) + parseInt (document.getElementById ('hdUpTime').value, 10);        
    var setSeconds = parseInt (document.getElementById ('hdSeconds').value, 10);
    var today = new Date (setYear, setMonth - 1, setDay, setHour, setMinutes, setSeconds, 0);
    var todaysDate = today.getMonth () + 1 + "/" + today.getDate () + "/" + today.getFullYear () + " " + (today.getHours ()) + ":" + (today.getMinutes ());
    
    this.getDateObj = function () {
        return today;
    }
    
    this.getDateWithFormat = function (){
        return todaysDate;
    }
    
}

var mins = 0;
var timerid = null;
/******************************************************************************************************************
*updateMinutes - continuously updates the minutes on the devices time
*/
function updateMinutes (){
    // Clear timer id if it exists    
    if (timerid) {
        clearTimeout (timerid);
    }    
    timerid = setTimeout (updateMinutes, 60000)
    mins += 1;
    document.getElementById ('hdUpTime').value = mins;    
}
