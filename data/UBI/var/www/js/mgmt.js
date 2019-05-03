/*
 * File: mgmt.js
 * Created on 1st Nov 2012 - Vivek
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 Define Global variables
 */
var SHOW_CLASS = "show";
var HIDE_CLASS = "hide";

/**
 * Changes the state of fields sent in the array
 * @method fieldArrStateChange
 * @param fieldsArr
 * @param state - state can be true/false
 */
function fieldArrStateChange(fieldsArr, state){
    for (var idx = 0; idx < fieldsArr.length; idx++) {
        fieldsArr[idx].disabled = state;
    }
}

/**
 * Wrapper function
 * @method fieldStateChangeWr
 * @param disNrec individual ids separated by space which should be disabled
 * @param disRec table ids separated by space which should be disabled
 * @param enNrec individual ids separated by space which should be enabled
 * @param enRec table ids separated by space which should be enabled
 */
function fieldStateChangeWr(disNrec, disRec, enNrec, enRec){
    if (disNrec) 
        fieldStateChange(disNrec, true, false);
    if (disRec) 
        fieldStateChange(disRec, true, true);
    if (enNrec) 
        fieldStateChange(enNrec, false, false);
    if (enRec) 
        fieldStateChange(enRec, false, true);
}

/**
 * Enable disable fields by finding states
 * @method fieldStateChange
 * @param idStr ids of fields to enable and disable
 * @param state enable/disable state
 * @param recurse is a state which is for table fields to find all input and select fields in the table
 */
function fieldStateChange(idStr, state, recurse){
    var inputObjs;
    var objIdArr = idStr.split(" ");
    for (idx in objIdArr) {
        var objToChange = document.getElementById(objIdArr[idx])
        // If object doesn't exist then continue for loop
        if (objToChange) {
            if (recurse) {
                inputObjs = objToChange.getElementsByTagName("INPUT");
                fieldArrStateChange(inputObjs, state);
                inputObjs = objToChange.getElementsByTagName("SELECT");
                fieldArrStateChange(inputObjs, state);
            }
            else {
                objToChange.disabled = state;
            }
        }
    }
}

/**
 * Gets the selected radio button's value
 * @method radioCheckedValueGet
 * @param rdId id of the radio button
 */
function radioCheckedValueGet(rdId){
	var fldElement = document.getElementById(rdId);
	if(!fldElement)	return;
	var rdbName = fldElement.getAttribute('name')
    var rdbObjArr = document.getElementsByName(rdbName);
    if (rdbObjArr.length < 1) 
        return null;
    var value = null;
    for (var i = 0; i < rdbObjArr.length; ++i) {
        if ((!rdbObjArr[i].disabled) && rdbObjArr[i].checked) {
            value = rdbObjArr[i].value;
            break;
        }
    }
    return value;
}

/**
 * Selects the radio button whose value matches
 * @method radioObjWithValueSelect
 * @param rbjObjName name of radio button
 * @param valueToSelect value of radio button which should be matched
 */
function radioObjWithValueSelect(rbjObjName, valueToSelect){
    var rdbObjArr = document.getElementsByName(rbjObjName);
    if (rdbObjArr.length < 1) 
        return;
    var value = null;
    for (var i = 0; i < rdbObjArr.length; ++i) {
        if (rdbObjArr[i].value == valueToSelect) {
            rdbObjArr[i].checked = true;
            break;
        }
    }
    return;
}

/**
 * Returns the selected value in the dropdown
 * @method comboSelectedValueGet
 * @param selObjId Id of the dropdown
 * @param state
 */
function comboSelectedValueGet(selObjId){
    var selObj = document.getElementById(selObjId);
    if (!selObj || selObj.disabled) 
        return null;
    return selObj.options[selObj.selectedIndex].value;
}

/**
 * Returns the selected index from the dropdown
 * @method comboSelectedIndexGet
 * @param selObjId Id of the dropdown
 */
function comboSelectedIndexGet(selObjId){
    var selObj = document.getElementById(selObjId);
    if (!selObj || selObj.disabled) 
        return null;
    return selObj.selectedIndex;
}

/**
 * Sets the selected index
 * @method comboValueSet
 * @param selObjId Id of the dropdown
 * @param selIdx Selected index to be set
 */
function comboValueSet(selObjId, selIdx){
    if (!selObjId || (selIdx == null)) 
        return;
    var selObj = document.getElementById(selObjId);
    if (!selObj) 
        return;
    selObj.selectedIndex = selIdx;
}

/**
 * Selects the right option from the dropdown
 * @method optionValueSelect
 * @param selObjId dropdown whose value should be set
 * @param fldId Id of field whose value matches with dropdown value
 */
function optionValueSelect(selObjId, fldId){
    if (!selObjId || !fldId) 
        return;
    var selObj = document.getElementById(selObjId);
    if (!selObj) 
        return;
    var fldObj = document.getElementById(fldId);
    if (!fldObj || !(fldObj.value.length)) 
        return;
    var valueToSelect = fldObj.value;
    var idx = 0;
    for (idx = 0; idx < selObj.options.length; ++idx) {
        if (selObj.options[idx].value == valueToSelect) 
            break;
    }
    if (idx != selObj.options.length) 
        selObj.selectedIndex = idx;
    return;
}

/**
 * Selects the right option text from the dropdown
 * @method optionTextSelect
 * @param selObjId dropdown whose text should be set
 * @param fldId Id of field whose text matches with dropdown text
 */
function optionTextSelect(selObjId, fldId){
    if (!selObjId || !fldId) 
        return;
    var selObj = document.getElementById(selObjId);
    if (!selObj) 
        return;
    var fldObj = document.getElementById(fldId);
    if (!fldObj || !(fldObj.value.length)) 
        return;
    var valueToSelect = fldObj.value;
    var idx = 0;
    for (idx = 0; idx < selObj.options.length; ++idx) {
        if (selObj.options[idx].text == valueToSelect) 
            break;
    }
    if (idx != selObj.options.length) 
        selObj.selectedIndex = idx;
    return;
}

/**
 * Hides the fields
 * @method hideFields
 * @param fieldsLst Space separated list of ids which should be hidden
 */
function vidualDisplay(fieldsLst, classname){
    var div_suffix = "_div";
    if (fieldsLst && fieldsLst != "") {
        var fieldsArray = fieldsLst.split(" ");
        if (!fieldsArray || fieldsArray.length == 0) 
            return;
        for (var idx = 0; idx < fieldsArray.length; idx++) {
            var trObj = document.getElementById(fieldsArray[idx] + div_suffix);
            if (trObj) 
                trObj.className = classname;
        }
    }
}

/**
 * Used to change class of images
 * @method changeImageToggleClass
 * @param obj - Contains information about images as explained in onImageToggle function
 */
function changeImageToggleClass(obj){
    if (obj) {
        var disableImages = obj.disableImages;
        var enableImages = obj.enableImages;
        changeToggleImagesClass(disableImages, obj.disableClass);
        changeToggleImagesClass(enableImages, obj.enableClass);
    }
}

/**
 * Changes classes of images when required
 * @method changeToggleImagesClass
 * @param imageIds - ids of images
 * @param classname - class name to be used
 */
function changeToggleImagesClass(imageIds, classname){
    var imagesArr = imageIds.split(' ');
    if (imagesArr) {
        for (var i = 0; i < imagesArr.length; i++) {
            var imageObj = document.getElementById(imagesArr[i]);
            if (imageObj && classname != "") {
                imageObj.className = classname;
            }
        }
    }
}

/**
 * Changes classes of images when required
 * @method returnTarget
 * @param e - return the target object
 */
function returnTarget(e){
    var target = null;
    if (!e) 
        e = window.event;
    if (e.target) {
        target = e.target;
    }
    else 
        if (e.srcElement) {
            target = e.srcElement;
        }
    
    if (target.nodeType == 3) {// For Safari bug
        target = target.parentNode;
    }
    return target;
}

/**
 * Adds events to elements
 * @method addEventsToElements
 * @param elementObj - element object on which event handler has to be set
 * @param doFunc - function handler
 * @param eventType - type of event
 */
function addEventsToElements(elementObj, doFunc, eventType){
    if (window.addEventListener) {
        elementObj.addEventListener(eventType, doFunc, false);
    }
    else 
        if (window.attachEvent) {
            elementObj.attachEvent("on" + eventType, doFunc, false);
        }
}

/**
 * changes the class of the li elements
 * @method changeTabMenuClass
 * @param selectId - ul element id
 */
function changeTabMenuClass(selectId){
    var tabMenuObj = document.getElementById(selectId);
    var liObjs = tabMenuObj.getElementsByTagName('li');
    for (var i = 0; i < liObjs.length; i++) {
        if (liObjs[i]) {
            liObjs[i].className = "";
        }
    }
}

/*************************************************************************
Function: isDependent - This function check for fields whose ids are sent
           as an array. In this function all the fields should be blank or
           all the fields should have relevant value. Otherwise if some
           fields have values and some fields are blank, it throws error
Params:  fieledArr - array of fields to be checked
         message - to be thrown on error.
Returns: true or false
*/
function isDependent (fieledArr, message) {
    var notFilled = 0; // Counts the number of unfilled values
    var filled = 0; // Counts the number of filled values
    var mainObj = document.getElementById (fieledArr[0]);
    
    //Find out the number of filled values and unfilled values
    
    for (var i = 0; i < fieledArr.length; i++) {
        var obj = document.getElementById (fieledArr[i]);
        if (obj && !obj.disabled ) {        
            if (( obj.value == "" )) {
                notFilled++;
            }
            else {
                filled++;            
            }
        }
    }
    
    // Compare the filled or unfilled values with the length of array sent
        
    if ( !( notFilled == fieledArr.length || filled == fieledArr.length) ) {
        alert (message);
        if (mainObj)
            mainObj.focus ();
        return false;
    }
    return true;
}

/*
Function:validateAccount - if authentication server value is blank and admin password is given
                           then error message should be thrown
@params:adminAccId - account admin id
@params:fldArr - array of fields to be checked for blank values
*/
function validateAccount (adminAccId, fldArr) {
    var adminAccObj = document.getElementById(adminAccId);    
    if(adminAccObj && adminAccObj.value != "") {
        if (txtFieldArrayCheck (fldArr) == false)
            return false;
        if (isProblemCharArrayCheckSingleParam (fldArr) == false)
            return false;
    }
    return true;
}

/**********************************************************************
* getRequestObject - Function to get Http request object. This function
                     should be used to get an ajax related object
* RETURNS: HTTP request object
*/
function getRequestObject ()
    {
    var request = null;
    try 
        {  // Firefox, Opera 8.0+, Safari
        request=new XMLHttpRequest();
        }
    catch (e)
        {// Internet Explorer
        try
            {
            request=new ActiveXObject("Msxml2.XMLHTTP");
            }
        catch (e)
            {
            try
                {
                request=new ActiveXObject("Microsoft.XMLHTTP");
                }
            catch (e)
                {
                window.status = "Browser does not support Ajax!!";
                return false;
                }
            }
        }
    return request;
    }
