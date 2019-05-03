/*
 * File: routingMode.js
 * Created on 4th March 2014 - Ramakrishna Reddy P.M
 * Copyright (c) 2014 TeamF1, Inc.
 * All rights reserved.
 */

/**
 * OnClick validation
 * @method enableDisableFieldsByImageClick
 * This function calls when user clicks on tf1_routingModeWan1 check box
 */
function enableDisableFieldsByImageClick(data, thisObj){
    onAnchorToggle(data);
    var errMsg = LANG_LOCALE['10913'] + " ?";
    alert(errMsg);
}

/**
 * Call onload
 */
$(document).ready(function(){  
	onloadCall (enableDisableFieldsByImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
	checkRoutingMode ('tf1_NAT');
});

/**
 * Call reset
 */
function routingModeOnReset(frmId){
	resetImgOnOff(frmId);
        checkRoutingMode ('tf1_NAT');
}

/****
 * Routing Mode Selection
 * @method showWarning
 * @param opflag - routingMode Radio button name
 */
function showWarning(opFlag){
    var selValue = radioCheckedValueGet(opFlag);
    var hdValue = document.getElementById ('hdEnable').value;
    var unitName = document.getElementById ('hdUnitName').value;
    var productId = document.getElementById ('hdProductId').value;
    if (!selValue)
        return;
	
	if (selValue == 1)
		{
		var confirmMsg1 = LANG_LOCALE['13508'];
		if (confirm (confirmMsg1, ''))
		    {
		    	checkRoutingMode ('tf1_NAT');
			return true;
		    }
		else
		    {
			if (hdValue == "1")
			    {
			    if(document.getElementById ('tf1_NAT'))
			        {
				    document.getElementById ('tf1_NAT').checked = true;
				}
			    }
			else if (hdValue == "2")
			    {
			    if(document.getElementById ('tf1_Transparent'))
			        {
				    document.getElementById ('tf1_Transparent').checked = true;
				}
			    }
	        	else
                	    {
                    		if(document.getElementById ('tf1_Bridge'))
                        	{
                            	    document.getElementById ('tf1_Bridge').checked = true;
                        	}
                	    }
			return false;
		    }
		}
	else if (selValue == 2)
		{
		    var confirmMsg2;
		    if (unitName == "DSR-500N" || unitName == "DSR-500" || unitName == "DSR-1000N" || unitName == "DSR-1000" || productId == "DSR-1000AC_Ax" || productId == "DSR-500AC_Ax" || productId == "DSR-1000_Bx" || productId == "DSR-500_Bx") {
	         confirmMsg2 = LANG_LOCALE['30458'];
	     }
	     else {
	              confirmMsg2 = LANG_LOCALE['13509'];
		}
		if (confirm (confirmMsg2, ''))
		    {
		        checkRoutingMode ('tf1_Transparent');
			return true;
		    }
		else
		    {
			 if (hdValue == "2")
			     {
			     if(document.getElementById ('tf1_Transparent'))
			         {
				     document.getElementById ('tf1_Transparent').checked = true;
				 }
			     }
			 else if(hdValue == "1")
			     {
			     if(document.getElementById ('tf1_NAT'))
			         {
				     document.getElementById ('tf1_NAT').checked =true;
				 }
			     }		    
             		else
                 	     {
                 	         if(document.getElementById('tf1_Bridge'))
                     		     {
                     		         document.getElementById('tf1_Bridge').checked = true;
                 		     }
            		     }
			 return false;
		     }
		}
	else if (selValue == 3)
        	{
            var confirmMsg3
  if (unitName == "DSR-500N" || unitName == "DSR-500" || unitName == "DSR-1000N" || unitName == "DSR-1000" || productId == "DSR-1000AC_Ax" || productId == "DSR-500AC_Ax" || productId == "DSR-1000_Bx" || productId == "DSR-500_Bx") {
	         confirmMsg3 = LANG_LOCALE['30142'];

        	     }
	     else {
             confirmMsg3 = LANG_LOCALE['30458'];
		}
        	    if (confirm (confirmMsg3, ''))
            		{
		            checkRoutingMode ('tf1_Bridge');
            		    return true;
            		}
        	    else
            		{
		            if (hdValue == "2")
                		{
			            if(document.getElementById ('tf1_Transparent'))
                    		        {
                   		            document.getElementById ('tf1_Transparent').checked = true;
                    		        }
                		}
            		    else if (hdValue == "1")
                		{
			            if(document.getElementById ('tf1_NAT'))
                    			{
                    			    document.getElementById ('tf1_NAT').checked =true;
                    			}
                		}
            		    else
                		{
                		    if(document.getElementById('tf1_Bridge'))
                    			{
                    			    document.getElementById('tf1_Bridge').checked = true;
                    			}
                		}
            		    return false;
            		}
        	}
	}

function checkRoutingMode (fieldId)
    {
    var routingModevalue = radioCheckedValueGet (fieldId);
    var unitName = document.getElementById ('hdUnitName').value;
    var productId = document.getElementById ('hdProductId').value;
    if(routingModevalue == "1") //NAT or Classical
        {
	    if (unitName == "DSR-500N" || unitName == "DSR-500" || unitName == "DSR-1000N" || unitName == "DSR-1000" || productId == "DSR-1000AC_Ax" || productId == "DSR-500AC_Ax" || productId == "DSR-1000_Bx" || productId == "DSR-500_Bx")
		{
            	    fieldStateChangeWr ('tf1_bridgeModeBlock_div', '', '', 'tf1_routingModebetweenWANsBlock_div');
	            vidualDisplay('tf1_routingModebetweenWANsBlock tf1_routingModeWan1 tf1_routingModeWan2', 'configRow');
	            vidualDisplay('routingModeWan1 routingModeWan2', 'break');
	            vidualDisplay('tf1_bridgeModeBlock tf1_bridgeIpAddr tf1_dmzIpAddr tf1_subnetMask', 'hide');
	            vidualDisplay('bridgeIpAddr dmzIpAddr subnetMask', 'hide');
		}
	    else
		{
            	    fieldStateChangeWr ('tf1_bridgeModeBlock_div tf1_routingModebetweenWANsBlock_div', '', '', '');
	            vidualDisplay('tf1_routingModebetweenWANsBlock tf1_routingModeWan1 tf1_routingModeWan2', 'hide');
	            vidualDisplay('routingModeWan1 routingModeWan2', 'hide');
	            vidualDisplay('tf1_bridgeModeBlock tf1_bridgeIpAddr tf1_dmzIpAddr tf1_subnetMask', 'hide');
	            vidualDisplay('bridgeIpAddr dmzIpAddr subnetMask', 'hide');
		}
        }
    else if (routingModevalue == "2") // Transparent
        {
            fieldStateChangeWr ('', 'tf1_routingModebetweenWANsBlock_div tf1_bridgeModeBlock_div', '', '');
	    vidualDisplay('tf1_routingModebetweenWANsBlock tf1_routingModeWan1 tf1_routingModeWan2 tf1_bridgeModeBlock tf1_bridgeIpAddr tf1_dmzIpAddr tf1_subnetMask', 'hide');
	    vidualDisplay('routingModeWan1 routingModeWan2 bridgeIpAddr dmzIpAddr subnetMask', 'hide');
        }
    else if (routingModevalue == "3") // Bridge
        {
            fieldStateChangeWr ('tf1_routingModeWan2', '', 'tf1_routingmodewan1', 'tf1_bridgeModeBlock_div');
	    vidualDisplay('tf1_bridgeModeBlock tf1_bridgeIpAddr tf1_dmzIpAddr tf1_subnetMask tf1_routingModebetweenWANsBlock tf1_routingModeWan1', 'configRow');
	    vidualDisplay('routingModeWan1 bridgeIpAddr dmzIpAddr subnetMask', 'break');
	    vidualDisplay('tf1_routingModeWan2 routingModeWan2', 'hide');
        }
    }

/**
 * On submit validation
 * @method getRoutingModeValidate
 * This function calls when user clicks on submit button
 */

function getRoutingModeValidate (frmId)
    {
	var bridgeModeCheckObj = document.getElementById('tf1_Bridge');
    	if (bridgeModeCheckObj && bridgeModeCheckObj.checked && !bridgeModeCheckObj.disabled)
            {
        	var txtFieldIdArr = new Array ();
        	txtFieldIdArr[0] = "tf1_bridgeIpAddr,"+LANG_LOCALE['30459'] ;
        	txtFieldIdArr[1] = "tf1_dmzIpAddr,"+LANG_LOCALE['30460'];
        	txtFieldIdArr[2] = "tf1_subnetMask,"+LANG_LOCALE['12402'];

			var dmzPort = document.getElementById('tf1_dmzPort').value;
            if ( "DMZ" != dmzPort )
                {
                alert("Please set Configurable Port to DMZ , to configure Routing Mode as Bridge.");
                return false
                }

        	if (txtFieldArrayCheck (txtFieldIdArr) == false)
            	    return false;
        
		if (ipv4Validate ('tf1_bridgeIpAddr', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
            	    return false;
	
        	if (ipv4Validate ('tf1_dmzIpAddr', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false)
            	    return false;
	
        	if (validNetMask ('tf1_subnetMask') == false)
            	    return false;

		/* Check Bridge Interface IP should be same subnet of DMZ Interface IP address or not */
		if ( !subnetValidationWr ( 'tf1_bridgeIpAddr', 'tf1_subnetMask', 'tf1_dmzIpAddr', 'tf1_subnetMask'))
                    {
            		alert(LANG_LOCALE['30143']);
            		return false;
            	    }

		/* Check Bridge Interface IP should be same subnet of LAN / VLAN IP address or not */
        	if ( !Validate.subnetValidate ( 'tf1_bridgeIpAddr', 'tf1_subnetMask', 'hdIPAddr', 'hdSnetAddr', 'vlanNumId', LANG_LOCALE['30144']) ) {
			document.getElementById('tf1_bridgeIpAddr').focus();
            		return false;
        	}

		/* Check DMZ Interface IP should be same subnet of LAN / VLAN IP address or not */
        	if ( !Validate.subnetValidate ('tf1_dmzIpAddr', 'tf1_subnetMask', 'hdIPAddr', 'hdSnetAddr', 'vlanNumId', LANG_LOCALE['30144']) ) {
			document.getElementById('tf1_dmzIpAddr').focus();
            		return false;
        	}

    	    }
	setHiddenChks(frmId);
    return true;
    }

