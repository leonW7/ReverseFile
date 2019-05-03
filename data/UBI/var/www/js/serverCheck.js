/*
 * File: serverCheck.js
 * Created on 5th Feb 2015 - Ramakrishna Reddy P.M
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/****
 * Ajax call for Radius Server, POP3 Server, LDAP Server, AD Server
 * @method 
 *
 */
var timerid = null;
var statusMsgArr = [LANG_LOCALE['30575'], LANG_LOCALE['13628'], LANG_LOCALE['13629'], LANG_LOCALE['13630'], LANG_LOCALE['13631']];

/*********************************************************************************
Function:serverStatusWr
This function generate a request object and calls checkServerStatus function to 
determine server status
Returns:NA
*/
function serverStatusWr (authType) {
    fieldStateChangeWr ('serverCheckBt', '', '', '');
    var requestObj = getRequestObject ();
    checkServerStatus (authType, requestObj);
}

/*********************************************************************************
Function:checkServerStatus
This function is used to display the status of the external authentication servers
using asynchronous request. This request goes to serverCheckAjax file. The request 
is sent again and again until it gets a signal to stop and show status
Parameters: authType - value of auth type server whose status we need to show
            requestObj - http request object
Returns:NA
*/
function checkServerStatus ( authType, requestObj ) {

    // Clear timer id if it exists    
    if (timerid) {
        clearTimeout (timerid);
    }
    if (requestObj) {
        requestObj.onreadystatechange = function () {            
            if( requestObj.readyState === 4 ) {
                if (requestObj.status === 200) {
                    var respText = requestObj.responseText;
                    if( respText ) {
                        var respArr = respText.split ('||');
                        if ( respArr[0] == "1" ) {
                            showServerStatus (respArr);                        
                            // send the request again after 2 seconds to get the status
                            timerid = setTimeout (function (){checkServerStatus (authType, requestObj)}, 2000);
                        }
                        else if (respArr[0] == "2") {
                            showServerStatus (respArr);
                            fieldStateChangeWr ('', '', 'serverCheckBt', '');
                            return;
                        }
                        else {
                      
                            // show the available status
                            fieldStateChangeWr ('', '', 'serverCheckBt', '');                        
                            return ;
                        }                    
                    }
                }
        }
    }
    requestObj.open("GET","?page=serverCheckAjax.html&AuthType=" + authType + "&time=" + new Date(),true);
    requestObj.send(null);       
    }    
}

/*********************************************************************************
Function:showServerStatus - called from checkServerStatus function to display
         server status
Parameters: respArr - this is array obtained from responseText property of request object
Returns:NA
*/
function showServerStatus (respArr) {
    for (var i = 1; i< 4; i++) {
        var idObj = document.getElementById ('serverId' + i);
        var configRowIdObj = document.getElementById ('authServerId' + i);
        var breakIdObj = document.getElementById ('authServerBreak' + i);
        var serverObj = document.getElementById ('serverObjId' + i);
        
        idObj.innerHTML = statusMsgArr[parseInt (respArr[i], 10)];
        configRowIdObj.className = "configRow";
        breakIdObj.className = "break";
    }
}
