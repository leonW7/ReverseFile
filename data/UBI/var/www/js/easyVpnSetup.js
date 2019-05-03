/*
 * File: easyVpnSetup.js
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * This function calls when user clicks on Upload button and check validations
 * On Click validation
 * @method fileUploadCheck
 */
function fileUploadCheck (objId, exten, flag)
	{
	    var ext = document.getElementById(objId).value;
    	ext = ext.substring(ext.lastIndexOf('.')+1,ext.length);
	    ext = ext.toLowerCase();
    	if(ext == "")	
	        {
        	    alert(LANG_LOCALE['13441'] + " ." + exten + " " + LANG_LOCALE['13473']);
	            return false;
	        }	
    	else if (ext.length > 4)
	    	{
		        alert(LANG_LOCALE['12429'] + ' .' + exten + ' ' + LANG_LOCALE['13474']);
        		return false;
	    	}
    	else if(ext != exten)
	    	{
		        alert(LANG_LOCALE['13442'] + ' .' + ext + LANG_LOCALE['13474'] + ' ; ' + LANG_LOCALE['12429'] + '.' + exten + ' ' + LANG_LOCALE['13443']);
        		return false;
		    }	
    	return true;	
	}
