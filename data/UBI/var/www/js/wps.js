var timerId = null;
$(document).ready(function(){    
	
    onloadCall(wpsOnload, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
    //enableTextFieldByAnchorClick('tf1_enableWPSStatus','tf1_txtPINNum tf1_btPINNum tf1_btPInPbc tf1_wpsSetupSubmit','break_txtPINNum break_btPINNum break_btPInPbc break_wpsSetupSubmit');
    wpsStatusCheck();
});

function wpsStatusCheck ()
    {	
    var wpsStatus = 0;	
    var wpsStatusObj = document.getElementById ('hdWpsStatus');
    if(wpsStatusObj && !isNaN(wpsStatusObj.value)) wpsStatus = parseInt(wpsStatusObj.value, 10)
    var sesSta = document.getElementById ('hdSessionStatus');
    if (wpsStatus != "1" || (sesSta && sesSta.value == "1"))
        {	
        fieldStateChangeWr ('', 'tf1_wpsSetupMethod_div', '', '');
        vidualDisplay('tf1_wpsSetupMethod','hide');
        vidualDisplay('break_wpsSetupMethod','hide');
        }
    else
        {
        fieldStateChangeWr ('', '', '', 'tf1_wpsSetupMethod_div');
        vidualDisplay('tf1_wpsSetupMethod','configRow');
        vidualDisplay('break_wpsSetupMethod','break');
        }
    getSessionStatus();
    getStatus ();		
    }
function getSessionStatus()
	{
	
	var request;
	try 
		{  // Firefox, Opera 8.0+, Safari
		request=new XMLHttpRequest();
		}
		catch (e)
  			{	// Internet Explorer
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
							window.status = LANG_LOCALE['30075'];
							return false;
      						}
					}
				}
	request.onreadystatechange=function()
		{
		if(request.readyState==4)
            {			
            var textArr = request.responseText.split ('||||');
            if(textArr.length == 2)
                {
                document.getElementById ('hdSessionStatus').value = textArr[0];
                    if (document.getElementById ('lblSessionStatus')) {
                        document.getElementById ('lblSessionStatus').innerHTML = textArr[1];
                    }
                }
            var wpsStatus = 0;	
            var wpsStatusObj = document.getElementById ('hdWpsStatus');
            if(wpsStatusObj && !isNaN(wpsStatusObj.value)) wpsStatus = parseInt(wpsStatusObj.value, 10);
            var sesSta = document.getElementById ('hdSessionStatus');
            if (wpsStatus != "1" || (sesSta && sesSta.value == "1"))
                {	
                fieldStateChangeWr ('', 'tf1_wpsSetupMethod_div', '', '');
                vidualDisplay('tf1_wpsSetupMethod','hide');
                vidualDisplay('break_wpsSetupMethod','hide');
                }    
            else
                {
                fieldStateChangeWr ('', '', '', 'tf1_wpsSetupMethod_div');
                vidualDisplay('tf1_wpsSetupMethod','configRow');
                vidualDisplay('break_wpsSetupMethod','break');
                }
            }
		}
	request.open("GET","?page=wpsStatus.html&time=" + new Date(),true);
	request.send(null);
	}
function getStatus ()
	{
	if (timerId) { clearTimeout(timerId) }
        timerId = setTimeout ("wpsStatusCheck ()", 2000);    
   }
  
function wpsOnload (data, thisObj)
    {
	onAnchorToggle(data);
        /*var imgId=thisObj.id;
    
        switch(imgId){
    	    case 'tf1_enableWPSStatus':
    		enableTextFieldByAnchorClick(imgId,'tf1_txtPINNum tf1_btPINNum tf1_btPInPbc tf1_wpsSetupSubmit','break_txtPINNum break_btPINNum break_btPInPbc break_wpsSetupSubmit');    		
    	break;
        }*/
    }

/**
 * Wrapper function called onReset
 * @method wpsOnReset
 */
function wpsOnReset(frmId){

	resetImgOnOff(frmId)
	/*enableWPSStatus({
        imageId: 'tf1_enableWPSStatus',
        disableIndividual: 'tf1_txtPINNum tf1_btPINNum tf1_btPInPbc tf1_wpsSetupSubmit',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: 'break_txtPINNum break_btPINNum break_btPInPbc break_wpsSetupSubmit',
        breakClass: 'break',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    });*/
}


/**
 * Form Validation
 * @method vapConfigValidate
 */
function pageValidate(frmId){
    
    var pinObj = document.getElementById('tf1_txtPINNum');
    if (pinObj && !pinObj.disabled) {
        if (!pinObj.value.length) {
            alert(LANG_LOCALE['30095']);
            pinObj.focus();
            return false;
        }
    var pinValue = pinObj.value;
    if (pinValue.length % 4 != 0) {
        var errStr = LANG_LOCALE['13003'];
        alert(errStr);
        pinObj.focus();
        return false;
        }
    
    if (isNaN(pinValue)) {
        alert(errStr);
        pinObj.focus();
        return false;
        }
    }
	setHiddenChks(frmId);
    return true;
}

