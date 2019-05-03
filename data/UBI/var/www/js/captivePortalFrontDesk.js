/*
Copyright (c) 2012 TeamF1, Inc.
All rights reserved.
*/

/******************************************************************************************************************
*captivePortalFrontDesk.validate - validate front desk fileds
*@param idNum suffix number for the various fields
*/
var captivePortalFrontDesk = {};
captivePortalFrontDesk.validate = function () {

var txtFieldIdArr = new Array ();    
    txtFieldIdArr[0] = "txtCstmAcc" + "," + "Please enter valid account name";
           
    if (txtFieldArrayCheck (txtFieldIdArr) == false)
         return false;

	if (alphaNumericValueCheck ("txtCstmAcc", "", "Please enter valid account name") == false)
		return false;

    //Start while account created
    if (!validateCostTypes ('txtStartTimeValue', 'startAccCreated')) {
        return false;
    }
    
    //Start while account login
    if (!validateCostTypes ('txtStartTimeValue', 'startAccLogin')) {
        return false;
    }
    
    //Maximum Usage Time
    if (!validateCostTypes ('txtMaxUsageTime', 'selMaxTime')) {
        return false;
    }
    
    //Maximum Usage Traffic
    if (!validateCostTypes ('txtMaxUsageTraffic', 'selMaxUsage')) {
        return false;
    }
    
    // Check if expiration date is availbale
    var txtExpirationDateObj = document.getElementById ('txtExpirationDate');    
    if (txtExpirationDateObj) {
        if (txtExpirationDateObj.value == "") {
            alert ("Please select Expiration Date and Time");
            txtExpirationDateObj.focus ();
            return false;
        }
    }
    
    if ( !validateTimeWr ('txtBeginDate', 'txtExpirationDate') ) {
        alert ("Begin date cannot be greater than Expiration Date and Time");
        return false;
    }
    
    var dateObj = new getTodayDate ();
    var todaysDate = dateObj.getDateWithFormat ();
    var txtbeginFromObj = document.getElementById ('txtBeginDate');
    if (txtbeginFromObj && !txtbeginFromObj.disabled) {
        if ( !validateTime (todaysDate, txtbeginFromObj.value)){
            alert ("Begin Date should be greater than Current Date");
            return false;
        }
    }

    if (txtExpirationDateObj && !txtExpirationDateObj.disabled) {
        if ( !validateTime (todaysDate, txtExpirationDateObj.value)){
            alert ("Expiration Date should be greater than Current Date");
            return false;
        }
    }
    
    return true;
	}

/******************************************************************************************************************
*addDayHours - this function sets the value of Expiration Date and Time depending on the value of Start While
*              account Created. There are two types of sections here. One is text field value and another is
               innerHTML value. Based on these value the value of Expired Date and Time field updates.
*
*/

function addDayHours () {
    var startAccountPre = "txtStartTimeValue";    
    var startAccCreatedHourPre = "startAccCreated";
    var expirationDatePre = "txtExpirationDate";
    var txtDaysHoursPre = "txtDaysHours";
    var hdFrntNum = parseInt (document.getElementById ('hdFrntNum').value, 10); 
    for (var i = 1; i<= hdFrntNum ;i++) {
        var today = null;
        var startAccountPreObj = document.getElementById (startAccountPre);        
        var startAccCreatedHourPreObj = document.getElementById (startAccCreatedHourPre);
        var expirationDatePreObj = document.getElementById (expirationDatePre);
        var txtDaysHoursPreObj = document.getElementById (txtDaysHoursPre);        
        var dateObj = new getTodayDate ();
        today = dateObj.getDateObj ();
        if (startAccountPreObj) {        
            // dynamic date change            
            if (startAccCreatedHourPreObj && !startAccountPreObj.innerHTML) {                
                if (startAccCreatedHourPreObj.value == "0") {
                    today.setHours (today.getHours () + parseInt (startAccountPreObj.value, 10));
                    // add hours   
                    expirationDatePreObj.value = today.getMonth () + 1 + "/" + today.getDate () + "/" + today.getFullYear () + " " + today.getHours () + ":" + (today.getMinutes ());
                }
                else {
                    // add days                    
                    today.setDate (today.getDate () + parseInt (startAccountPreObj.value, 10));
                    expirationDatePreObj.value = today.getMonth () + 1 + "/" + today.getDate () + "/" + today.getFullYear () + " " + (today.getHours ()) + ":" + (today.getMinutes ());
                }
            }
            else if (startAccountPreObj && startAccountPreObj.innerHTML) {
                // static date
                if (txtDaysHoursPreObj && txtDaysHoursPreObj.innerHTML.indexOf ('Days') != -1) {
                    // For day
                    today.setDate (today.getDate () + parseInt (startAccountPreObj.innerHTML, 10));
                }
                else {
                    today.setHours (today.getHours () + parseInt (startAccountPreObj.innerHTML, 10));
                }
                expirationDatePreObj.value = today.getMonth () + 1 + "/" + today.getDate () + "/" + today.getFullYear () + " " + (today.getHours ()) + ":" + (today.getMinutes ());
            }            
        }
    }
}



