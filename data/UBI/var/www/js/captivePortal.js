/* captivePortal.js - API library for captive portal */

/* Copyright 2010 TeamF1, Inc. */

/*
modification history 
------------------------
01b,29Jul14,mnr Modified file permisssions to work in RU image. 
01a,10Jul10,vds written. 
*/

/**
 * Checks if the field is empty or not
 * @method isFieldEmpty
 * @param fieldId - field Id that is checked for emptyness
 * @param alertFlag - if it is true then show message otherwise not.
 * @param errMsg - message to be shown
 */
function isFieldEmpty(fieldId, alertFlag, errMsg){
    var obj = document.getElementById(fieldId);
    if (!obj || obj.disabled) 
        return false;
    if (!obj.value.length) {
        if (alertFlag) 
            alert(errMsg);
        obj.focus();
        return true;
    }
    return false;
}

/**
 * Wrapper for 'isFieldEmpty'
 * @method txtFieldArrayCheck
 * @param txtFieldIdArr array of fields which needs to be checked for emptyness
 */
function txtFieldArrayCheck(txtFieldIdArr){
    for (var i = 0; i < txtFieldIdArr.length; ++i) {
        var result = false;
        var strArr = txtFieldIdArr[i].split(",");
        result = isFieldEmpty(strArr[0]);
        if (result) {
            if (strArr.length > 1) 
                alert(strArr[1]);
            return false;
        }
    }
    return true;
}
/**********************************************************************
* getRequestObject - Function to get Http request object. This function
                     should be used to get an ajax related object
* RETURNS: HTTP request object
*
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



function fieldCssClassChange (fieldId, flag)
    {
    var DISABLE_STYLE_SUFFIX = "Dis";
   /*
    if (fieldId.className == DISABLE_STYLE_SUFFIX)
    	{
		alert ("'Dis' is a reserved style name.\n"+
    	       "Please use a different style name");
    	return;
    	}
    */	
    if ((fieldId.type == 'text') || (fieldId.type == 'password') ||
        (fieldId.type == 'submit') || (fieldId.type == 'select-one') ||
        (fieldId.type == 'button') || (fieldId.type == 'reset') )
        {
	    var enabledStyle;
	    var disabledStyle;
	    var idx = fieldId.className.lastIndexOf (DISABLE_STYLE_SUFFIX);
		if (idx == -1)
			{
			enabledStyle = fieldId.className;
			disabledStyle = fieldId.className + DISABLE_STYLE_SUFFIX;
			}  
		else
			{
			enabledStyle = fieldId.className.substring (0, idx);
			disabledStyle = fieldId.className;
			}
        fieldId.className = flag ? disabledStyle : enabledStyle ;
        if (fieldId.type == 'text' || fieldId.type == 'password')
        	{
        	if (document.getElementById (fieldId.id+"Err") && fieldId.disabled == true)
        		document.getElementById (fieldId.id+"Err").innerHTML = ""
        	}
        }
    }
function fieldArrStateChange (fieldsArr, state)
	{
    for (var idx = 0; idx < fieldsArr.length; idx++)
	    {
        fieldsArr[idx].disabled = state;
        fieldCssClassChange (fieldsArr[idx], state);
        }
 	}
function fieldStateChangeWr (disNrec, disRec, enNrec, enRec)
    {
    if (disNrec)
        fieldStateChange (disNrec, true, false);
    if (disRec)
        fieldStateChange (disRec, true, true);
    if (enNrec)
        fieldStateChange (enNrec, false, false);
    if (enRec)
        fieldStateChange (enRec, false, true);
    }

function fieldStateChangeWr (disNrec, disRec, enNrec, enRec)
    {
    if (disNrec)
        fieldStateChange (disNrec, true, false);
    if (disRec)
        fieldStateChange (disRec, true, true);
    if (enNrec)
        fieldStateChange (enNrec, false, false);
    if (enRec)
        fieldStateChange (enRec, false, true);
    }
function fieldStateChange (idStr, state, recurse)
    {
   var inputObjs;
   var objIdArr = idStr.split (" ");
   for (idx in objIdArr)
        {
        var objToChange = document.getElementById(objIdArr[idx])
        // If object doesn't exist then continue for loop
        if(objToChange)
            {
            if (recurse)
                {
                inputObjs = objToChange.getElementsByTagName("INPUT");
                fieldArrStateChange (inputObjs, state);
                inputObjs = objToChange.getElementsByTagName("SELECT");
                fieldArrStateChange (inputObjs, state);
                }
            else
                {
                objToChange.disabled = state;
                fieldCssClassChange (objToChange , state);
            	}
            }
        }
    }

function isProblemCharArrayCheck (txtFieldIdArr)
    {
    for (var i = 0; i < txtFieldIdArr.length; ++i)
        {
         var result = false;
         var strArr = txtFieldIdArr[i].split(",");
		 var obj = document.getElementById(strArr[0]);
         if (!obj || obj.disabled)
         	continue;
         else
             {
             if (strArr.length > 1)
             	{
             	if (obj.value.indexOf ("'") != -1 || obj.value.indexOf ("\"") != -1 || obj.value.indexOf (" ") != -1)
             		{
             		if (document.getElementById(strArr[0] + "Err"))
             			document.getElementById(strArr[0] + "Err").innerHTML = LANG_LOCALE['10874']
             		else
             		    alert (LANG_LOCALE['10874']);
             		obj.focus ();
	            	return false;
	            	}
             	}
             }
         }
    return true;
    }

/******************************************************************** 
* loginConfirmPassword - Used to match new password and confir password
*                         
* 
* RETURNS: true or false 
*/
var timerId=null;
var showAlertArr = ['Hours', 'Days', 'MB', 'GB'];
function loginConfirmPassword ()
	{
	var newPassObj = document.getElementById('txtNewPassWd');
	var confNewPassObj = document.getElementById('txtCnfPwd');
	var txtFieldIdArr = new Array ();	    
    txtFieldIdArr[0] = "txtNewPassWd,"+LANG_LOCALE['12074'];
    txtFieldIdArr[1] = "txtCnfPwd,"+LANG_LOCALE['11980'];
    
    if (txtFieldArrayCheck (txtFieldIdArr) == false)
         return false;
         
    if (isProblemCharArrayCheck (txtFieldIdArr) == false)
         return false;
         
	if (newPassObj.value != confNewPassObj.value)
		{
		alert (LANG_LOCALE['13546']);
		confNewPassObj.focus();
		return false;
		}
	return true;
	}

/******************************************************************** 
* changeScreen - Used to change screen                        
* 
* RETURNS: NA 
*/

function changeScreen 
    (
    hideScreenId,   // Id of the screen that we need to hide
    showScreenId    // Id of the screen that we need to show
    )
    {    
    displayOrHideFields (hideScreenId, showScreenId);
    }

function displayOrHideFields (hideFieldsLst,showFieldsLst)
	{
	if (hideFieldsLst && hideFieldsLst != "")
		{
		var fieldsArray = hideFieldsLst.split (" ");
		if (!fieldsArray || fieldsArray.length == 0) return;
		for (var idx = 0; idx < fieldsArray.length; idx++)
			{
			var trObj = document.getElementById("tr" + fieldsArray[idx]);
			if (trObj) trObj.className = "hide";
			}
		}
	if (showFieldsLst && showFieldsLst != "")
		{
		var fieldsArray = showFieldsLst.split (" ");
		if (!fieldsArray || fieldsArray.length == 0) return;
		for (var idx = 0; idx < fieldsArray.length; idx++)
			{
			var trObj = document.getElementById("tr" + fieldsArray[idx]);
			if (trObj) trObj.className = "show";
			}
		}
	}

/******************************************************************** 
* loginValidate - Used to validate login name and password                        
* 
* RETURNS: true or false 
*/
    
function loginValidate ()
    {
    var txtFieldIdArr = new Array ();
    txtFieldIdArr[0] = "txtUserName,"+LANG_LOCALE['12144'];
    txtFieldIdArr[1] = "txtPwd,"+LANG_LOCALE['12074'];
    if (txtFieldArrayCheck (txtFieldIdArr) == false)
         return false;

    if (document.getElementById ('hdUserAgent'))
        document.getElementById ('hdUserAgent').value = navigator.userAgent;

    return true;
    }

/******************************************************************** 
* loginInit - Used to show and hide screens based on from which 
* action we are coming to the page* 
*/
    
    
function loginInit ()
    {
    var usrObj = document.getElementById ('txtUserName');    
    var screenShowObj = document.getElementById ('hdSreenVal');
    if(screenShowObj)
        {
        var screenVal = parseInt(screenShowObj.value, 10);
        switch (screenVal)
            {            
            case 1:
                    fieldStateChangeWr ('txtUserName txtPwd txtNewPassWd txtCnfPwd', '', '', '');
                    changeScreen ('LoginTbl PasswordChengeTbl ForcedLoginTbl', 'LoggedinTbl');
                    var requestObj = getRequestObject ();
		    var accessType = document.getElementById ('hdAccessType').value;
		    if(parseInt (accessType,10) == 3) 
				{
                    		runUserLoginCount (requestObj, document.getElementById ('hdUsrName').value,document.getElementById ('hdAlertType').value,document.getElementById ('hdMaxValue').value,document.getElementById ('hdAlertValue').value);
				}
                    break;
            case 2:
                    fieldStateChangeWr ('txtUserName txtPwd txtNewPassWd txtCnfPwd', '', '', '');
                    changeScreen ('LoginTbl PasswordChengeTbl LoggedinTbl', 'ForcedLoginTbl');
                    break;
	    case 4:
		   			fieldStateChangeWr ('txtNewPassWd txtCnfPwd', '', 'txtUserName txtPwd', '');
		   			changeScreen ('LoginTbl PasswordChengeTbl LoggedinTbl ForcedLoginTbl', '');
                    var chkAuthObj = document.getElementById ('chkAuthTypeEnable');
                    if (chkAuthObj)
                        {
                        if (chkAuthObj.checked)
                            {
                            fieldStateChangeWr ('', '', 'loginBtSla', '');
                            }
                        else
                            {
                            fieldStateChangeWr ('loginBtSla', '', '', '') ;
                            }
                        }
				    break;
        case 0:
        default:                    
                    fieldStateChangeWr ('txtNewPassWd txtCnfPwd', '', 'txtUserName txtPwd', '');
                    changeScreen ('PasswordChengeTbl LoggedinTbl ForcedLoginTbl', 'LoginTbl');
                    if (!usrObj) return;
                    usrObj.focus ();                    
                    break;
            }
        }                
    }


/******************************************************************** 
* changeScreenOnPassClick - Used to change screen                        
* 
* RETURNS: NA 
*/

function changeScreenOnPass 
    (
    hideScreenId,   // Id of the screen that we need to hide
    showScreenId    // Id of the screen that we need to show
    )
    {
    fieldStateChangeWr ('txtUserName txtPwd', '', 'txtNewPassWd txtCnfPwd', '');    
    displayOrHideFields (hideScreenId, showScreenId);
    }

/********************************************************************************************************************
*runUserLoginCount - query is sent to server to find out the user login timeout. It alerts user when minimum 
                     time is left and stops
*@param requestObj - http request object
*/

function runUserLoginCount (requestObj, userName,alertType,maxValue,alertValue) {
    // Clear timer id if it exists   
    if (timerId) {
        clearTimeout (timerId);
    }
    if (requestObj) {
        requestObj.onreadystatechange = function () {
            if (requestObj.readyState == 4) {
				var current = requestObj.responseText;
		left =parseInt (maxValue, 10) - parseInt (current, 10)
                if((left < parseInt(alertValue,10)) && left != 0) {
		    if(alertType==0){
			// Seconds to Hours
			left=left/(60*60)
		    }
		    else if(alertType==1){
			// Seconds to Days
			left=left/(60*60*24)   
		    }
		    else if(alertType==2){
			// into MB
			left=left
		    }
		    else if(alertType==3){
			// into GB
			left=left/1024
		     }                        
		    left=left.toFixed(2)
                    alert ("Quota remaining is " + left + " " + showAlertArr[parseInt (alertType, 10)]);
                    return;
                }
                else {
                    // send query again
                    setTimeout (function () {runUserLoginCount (requestObj, userName,alertType,maxValue,alertValue)}, 60000)
                }
            }
        }
    requestObj.open("GET","?page=cpAccAlertCheck.html&userName=" + userName + "&alertType=" + alertType + "&time=" + new Date(),true);
    
    requestObj.send(null);
    }
    
}
