/*
 * File: openVpnAuthentication.js
 * Created on 29th Jan 2016 - Ramakrishna Reddy
 * Copyright (c) 2016 TeamF1, Inc.
 * All rights reserved.
 */
 $(document).ready(function(){
    /**
     * This function calls when user clicks on Checkbox images
     * OnClick validation
     * @method onloadCall
     */
    onloadCall(openVpnAuthenticationOnload, {
        imageId: 'tf1_UploadCaCertificateOnly',
        disableIndividual: '',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: '',
        breakClass: 'break',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    });
    
    /**
     * This function calls when page loads
     * OnLoad validation
     */
    openVpnAuthenticationOnload({
        imageId: 'tf1_UploadCaCertificateOnly',
        disableIndividual: '',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: '',
        breakClass: 'break',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    });
   $("#btuploadcaCfg").live('click', function(){
    var uploadFileObj = document.getElementById('tf1_UploadFile');
	 if (uploadFileObj)
    	{
			if (uploadFileObj.value == "")
            	{
					alert(LANG_LOCALE['13632']);
					return false;
				}
			else
				{
					var fSize = uploadFileObj.files[0].size;
					if (fSize > 1048576)
      				{
           				alert(LANG_LOCALE['50038']);
            			return false;
        			}
				}
		}
	});
    $("#btuploadserCfg").live('click', function(){
	 var uploadFileObj2 = document.getElementById('tf1_UploadFile2');
	 if (uploadFileObj2)
    	{
			if (uploadFileObj2.value == "")
            	{
					alert(LANG_LOCALE['13633']);
					return false;
				}
			else
				{
					var fSize = uploadFileObj2.files[0].size;
					if (fSize > 1048576)
      				{
           				alert(LANG_LOCALE['50038']);
            			return false;
        			}
				}
		}
	});
    $("#btuploadkeyCfg").live('click', function(){
	 var uploadFileObj3 = document.getElementById('tf1_UploadFile3');
	 if (uploadFileObj3)
    	{
			if (uploadFileObj3.value == "")
            	{
					alert(LANG_LOCALE['13634']);
					return false;
				}
			else
				{
					var fSize = uploadFileObj3.files[0].size;
					if (fSize > 1048576)
      				{
           				alert(LANG_LOCALE['50038']);
            			return false;
        			}
				}
		}
	});
    $("#btuploaddhCfg").live('click', function(){
	 var uploadFileObj4 = document.getElementById('tf1_UploadFile4');
	 if (uploadFileObj4)
    	{
			if (uploadFileObj4.value == "")
            	{
					alert(LANG_LOCALE['13635']);
					return false;
				}
			else
				{
					var fSize = uploadFileObj4.files[0].size;
					if (fSize > 1048576)
      				{
           				alert(LANG_LOCALE['50038']);
            			return false;
        			}
				}
		}
	});
    $("#btuploadtlsCfg").live('click', function(){
	 var uploadFileObj5 = document.getElementById('tf1_UploadFile5');
	 if (uploadFileObj5)
    	{
			if (uploadFileObj5.value == "")
            	{
					alert(LANG_LOCALE['13636']);
					return false;
				}
			else
				{
					var fSize = uploadFileObj5.files[0].size;
					if (fSize > 1048576)
      				{
           				alert(LANG_LOCALE['50038']);
            			return false;
        			}
				}
		}
	});
    $("#btuploadcrlCfg").live('click', function(){
	 var uploadFileObj6 = document.getElementById('tf1_UploadFile6');
	 if (uploadFileObj6)
    	{
			if (uploadFileObj6.value == "")
            	{
					alert(LANG_LOCALE['30233']);
					return false;
				}
			else
				{
					var fSize = uploadFileObj6.files[0].size;
					if (fSize > 1048576)
      				{
           				alert(LANG_LOCALE['50038']);
            			return false;
        			}
				}
		}
	});
	
    return true;
});

function openVpnAuthenticationOnload(toggleObj){
   
   onAnchorToggle(toggleObj);
   var uploadCAimgObj = document.getElementById('tf1_UploadCaCertificateOnly').className;
   if (uploadCAimgObj == ON_ANCHOR)
       {
         vidualDisplay('tf1_certificateBlock tf1_accessType', 'hide');
       }
   else if(uploadCAimgObj == OFF_ANCHOR)
       {
           vidualDisplay('tf1_certificateBlock tf1_accessType', 'configRow');
       }
}

function openVpenAuthenticationOnreset(frmId) {

 resetImgOnOff(frmId);
 openVpnAuthenticationOnload({
        imageId: 'tf1_UploadCaCertificateOnly',
        disableIndividual: '',
        disableGrp: '',
        enableIndividual: '',
        enableGrp: '',
        hideClass: 'hide',
        showClass: 'configRow',
        breakDivs: '',
        breakClass: 'break',
        imagesInfo: {
            disableImages: '',
            enableImages: '',
            disableClass: '',
            enableClass: ''
        }
    })

}

