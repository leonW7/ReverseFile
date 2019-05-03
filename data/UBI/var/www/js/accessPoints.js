/*
 * File: accessPoints.js
 * Created on 30th Mar 2014 - Ramakrishna Reddy
 * Copyright (c) 2014 TeamF1, Inc.
 * All rights reserved.
 */
function onloadAccessPointsFn () {
    onloadCall (accessPointsOnload, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});

    enableTextFieldByAnchorClick('tf1_enableActiveTime','tf1_scheduleControl tf1_startTime tf1_stopTime','break_scheduleControl break_startTime break_stopTime');
}

/**
* displays corresponding fields on ImageToggle
* @method accessPointsOnload
* @param data - image data
* @param thisObj - currtent image id
*/

function accessPointsOnload(data, thisObj){
    onImageToggle(data);
    var imgId=thisObj.id;

    switch(imgId){
        case "tf1_enableActiveTime":
	    enableTextFieldByAnchorClick(imgId,'tf1_scheduleControl tf1_startTime tf1_stopTime','break_scheduleControl break_startTime break_stopTime');
	break;
    }
}

/**
 * This function calls when user clicks on submit button
 * On submit validation
 * @method accessPointsValidation
 */
function accessPointsValidation(frmId){

    var txtValidArray = new Array();
    txtValidArray[0] = "tf1_APName, "+LANG_LOCALE['11969'];
    
    if (txtFieldArrayCheck(txtValidArray) == false) 
        return false;

    if (alphaNumericValueCheck ("tf1_APName", '', '') == false)    
        return false;

    var imgActiveTime = document.getElementById('tf1_enableActiveTime').className;
    if (imgActiveTime == "enable-disable-on")
    {      
	if (dateValidate ('tf1_startTimeHour', 'tf1_startTimeMin') == false)
	    return false;

	if (dateValidate ('tf1_stopTimeHour', 'tf1_stopTimeMin') == false)
	    return false;

	if (!timeValidate ())
	    return false;
    }
    setHiddenChks(frmId);    
    return true;
}

function dateValidate (hoursId, minId) {
    var dtVarObj = new Array ();
    dtVarObj[0] = new numObj(hoursId, 1, 1, 12, LANG_LOCALE['30050']);
    dtVarObj[1] = new numObj(minId, 1, 0, 59, LANG_LOCALE['30051']);

    // Below expression is telling that should allow only numbers.
    var regexp = new RegExp("[^0-9]");

    var idObj = null;
    for (var idx = 0; idx < dtVarObj.length; ++idx) {
        idObj = document.getElementById (dtVarObj[idx].id);
        if (!idObj || idObj.disabled) continue;
        if ((idObj.value.length < dtVarObj[idx].minLen) || 
            (parseInt (idObj.value, 10) < dtVarObj[idx].minVal) ||
            ((dtVarObj[idx].maxVal != 0) && (parseInt (idObj.value, 10) > dtVarObj[idx].maxVal))) {
                alert (dtVarObj[idx].errMsg);
                idObj.focus ();
                return false;
            }

        if (idObj.value != '' && idObj.value.length > 0) {
            if (regexp.test(idObj.value)) {
                alert(LANG_LOCALE['30331']);
                idObj.focus ();
                return false;
            }
        }
    }
    return true;
}

function numObj (id, minLen, minVal, maxVal, errMsg) {
    this.id = id;
    this.minLen = minLen;
    this.minVal = minVal;
    this.maxVal = maxVal;
    this.errMsg = errMsg;
}

function timeValidate()	{
    var _f=document.getElementById("tf1_startTimeMerid").value;
    var _10=document.getElementById("tf1_stopTimeMerid").value;
    if(_f==_10)
        {
            var hr1=parseInt(document.getElementById("tf1_startTimeHour").value,10);
            var hr2=parseInt(document.getElementById("tf1_stopTimeHour").value,10);
            var _11=parseInt(document.getElementById("tf1_startTimeMin").value,10);
            var _12=parseInt(document.getElementById("tf1_stopTimeMin").value,10);
            if(hr1==hr2) {
                    if(_11>=_12)
                        {
                            alert(LANG_LOCALE['30052']);
                            return false;
                        }				
            }
            else {
                    if(hr1>hr2) {
                        if(hr1!=12) {
                            alert(LANG_LOCALE['30053']);
                            return false;
			}
                    }			
            }
        }
    else
        {
            if(_f=="1" && _10=="0") {
                alert(LANG_LOCALE['30054']);
                return false;
            }		
        }
    return true;
}

function prependZero (fieldId) {
    var fieldObj = document.getElementById (fieldId);

    if (fieldObj) {
        var fieldVal = fieldObj.value;

        if (fieldVal.length == 1) {
            fieldObj.value = ('0'+fieldVal);
        }
    }
}
