/*
 * File: systemPc.js
 * TeamF1 Inc, 2012
 * Created on 19th Nov 2012 - Bala Krishna G
 */
/****
 * validate the form
 * @method fileUploadCheck
 */
function fileUploadCheck(fileId, errMsg){
    var obj = document.getElementById(fileId);
    if (!obj || obj.disabled) 
        return false;
    if (obj.value.length > 0) {
     var proceed = confirm (LANG_LOCALE['14018'], '');
	if (proceed == false)
		{
        return false
        }
     /* killall deamons before upload image*/
       killDaemons ();
    if (obj.value.length > 0) {
               //timeHandler = setInterval(function(){checkUpgradeStatus()},2000);
       // $(".barMeter").show();
                $("#tf1_pageLoadingMask p").html(LANG_LOCALE['30405']+'...');
		return true;
	   }
    }
    if (errMsg) 
        alert(errMsg);
    return false;
}

/******************************************************************** 
* killDaemons - calls script to kills
* daemons
* 
* 
* RETURNS: N/A
*/
function killDaemons ()
    {
    var requestObj = getRequestObject ();
    if(requestObj)
        {
        requestObj.onreadystatechange = function()
            {
            // Nothing is to be done
            }
        requestObj.open("GET","?page=killDeamons.html" + "&time=" + new Date(),false);
        requestObj.send(null);
        }
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

