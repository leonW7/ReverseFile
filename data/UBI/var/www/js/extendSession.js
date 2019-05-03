/*
Copyright (c) 2012 TeamF1, Inc.
All rights reserved.
*/

/******************************************************************************************************************
*validateExtendSession - validate front desk fileds
*Returns: true/false
*/
var validateExtendSession = function () {
    
    var txtFieldIdArr = new Array ();    
    txtFieldIdArr[0] = "txtbeginFrom, Expiration Date/Time";
    txtFieldIdArr[1] = "txtMaxUserTraffic, Please enter a valid Maximum Usage Traffic.";
    txtFieldIdArr[2] = "txtMaxUserTime, Please enter a valid Maximum Usage Time.";
    
    if (txtFieldArrayCheck (txtFieldIdArr) == false)
         return false;
    
    // Check if expiration date is availbale
    var txtExpirationDateObj = document.getElementById ('txtbeginFrom');    
    if (txtExpirationDateObj) {
        if (txtExpirationDateObj.value == "") {
            alert ("Please select Expiration Date/Time");
            txtExpirationDateObj.focus ();
            return false;
        }
    }
    
    var dateObj = new getTodayDate ();
    var todaysDate = dateObj.getDateWithFormat ();    
    var txtbeginFromObj = document.getElementById ('txtbeginFrom');
    if (txtbeginFromObj && !txtbeginFromObj.disabled) {
        if ( !validateTime (todaysDate, txtbeginFromObj.value)){
            alert ("Expiration Date/Time should be greater than Current Date");
            return false;
        }
    }
    
    //Maximum Usage Traffic
    
    if (!validateCostTypes ('txtMaxUserTraffic', 'maxUsagetraffic')) {
        return false;
    }
    
    //Maximum Usage Time
    if (!validateCostTypes ('txtMaxUserTime', 'selMaxUsageTime')) {
        return false;
    }
    return true;
}

