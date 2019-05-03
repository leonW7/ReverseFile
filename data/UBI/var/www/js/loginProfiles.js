/*
* File: loginProfiles.js
* Created on 27th Nov 2012 - Laxmi
* Copyright (c) 2012 TeamF1, Inc.
* All rights reserved.
*/
/**
 * This function calls Page loads
 * Onload validation
 * @method onloadCall
 */
function popPreview(urlObj)
        {
        popwindow = window.open(urlObj, "name", "height=550, width=800, left=10, top=50, resizable=yes, scrollbars=yes, toolbar=no, status=no");
        if (window.focus)
                {
                popwindow.focus();
                }
        }

$(document).ready(function() {
	$('#tf1_loginProfiles .gradeA').contextMenu('contextMenu', {
				bindings : {
				'editMenu' : function(t, e, rowId) {
				openForm('button.edit.loginProfiles.loginProfiles',rowId,'tf1_dialog','loginProfiles','loginProfilesForm.html', 'tf1_loginProfilesDailogContent','onloadCallloginProfilesFn');									
				},
				'deleteMenu' : function(t, e, rowId) {
				deleteRows('button.delete.loginProfiles.loginProfiles', 'tf1_frmLoginProfilesForm', rowId, 'optionSelectAll', 'tf1_dialog', 'loginProfiles', 'loginProfiles');
				},
				'detailsMenu': function(t, e, rowId) { 
                rowId = rowId.replace("loginProfiles","");  
                popPreview('platform.cgi?page=captivePortal.html&rowId='+rowId+'&ButtonType=Preview');  
             }

			}, onShowMenu: function(e,menu,rowId) {
			 var re  = new RegExp(":",'g');
			 rowId = rowId.replace(re,"\\:");
                        if (($("#"+rowId).attr("profile-name") == "default") || ($("#"+rowId).attr("profile-name") == "CP-default")){                  

                            $('#editMenu', menu).remove();
                            $('#deleteMenu', menu).remove();
                            $('#selectAllMenu', menu).remove();
                        }
                       return menu;
                    }


			});

	oTable = $('#recordsData').dataTable({
		"bJQueryUI": true,
		"sPaginationType": "full_numbers"
	});
	$("#btnClose").live("click",function(e){
					HideDialog('tf1_dialog', 'tf1_overlay');
					e.preventDefault();
	});
dataRightClick(true);

	

});

function onloadCallloginProfilesFn() {
	pageBackgroundImageChange('tf1_pageBackground1');
	headerBackgroundImageChange('tf1_headerBackground1');
	
    
	oTable = $('#recordsData2').dataTable({
	"bJQueryUI" : true,
					"bPaginate" : false,
					"bLengthChange" : false,
					"bFilter" : false,
					"bSort" : false,
					"bInfo" : false,
					"bAutoWidth" : false
				});	   
    onloadCall(loginProfilesOnload, {
        imageId: '',
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
    
    
    enableTextFieldByAnchorClick('tf1_enableAdv','tf1_advPlace tf1_adContent tf1_font tf1_fontSize tf1_fontColor','break_advPlace break_advPlace break_font break_fontSize break_fontColor');
    enableTextFieldByAnchorClick('tf1_enableFooterContent','tf1_footerContent tf1_footerContentFontColor','break_footerContent break_footerContentFontColor');
	enableTextFieldByAnchorClick('tf1_enableExternalPaymentGateway','tf1_sessionTitle tf1_message tf1_sessionTitle2 tf1_successMessage tf1_sessionTitle3 tf1_failureMessage tf1_serviceDisclaimerText tf1_enableBillingProfiletable tf1_serviceDisclimer tf1_paymentServer','break_sessionTitle break_message break_sessionTitle2  break_successMessage break_sessionTitle3 break_failureMessage break_serviceDisclaimerText break_enableBillingProfiletable break_serviceDisclimer break_paymentServer');
	
}
/**
 * function for toggle the image
 * @method remoteManagementOnload
 * @param toggleObj - object
 */
function loginProfilesOnload(toggleObj, thisObj){
   onAnchorToggle(toggleObj);
    var imgId=thisObj.id;
    
    switch(imgId){
    	case 'tf1_enableAdv':    		
   		enableTextFieldByAnchorClick('tf1_enableAdv','tf1_advPlace tf1_adContent tf1_font tf1_fontSize tf1_fontColor','break_advPlace break_advPlace break_font break_fontSize break_fontColor');
    	break; 
    	case 'tf1_enableFooterContent':    		
   		enableTextFieldByAnchorClick('tf1_enableFooterContent','tf1_footerContent tf1_footerContentFontColor','break_footerContent break_footerContentFontColor');
    	break; 
    	case 'tf1_enableExternalPaymentGateway':    		
    		enableTextFieldByAnchorClick('tf1_enableExternalPaymentGateway','tf1_sessionTitle tf1_message tf1_sessionTitle2 tf1_successMessage tf1_sessionTitle3 tf1_failureMessage tf1_serviceDisclaimerText tf1_enableBillingProfiletable tf1_serviceDisclimer tf1_paymentServer','break_sessionTitle break_message break_sessionTitle2  break_successMessage break_sessionTitle3 break_failureMessage break_serviceDisclaimerText break_enableBillingProfiletable break_serviceDisclimer break_paymentServer');
    	break;   	
    }

/*target="uploader_iframe" */

    
}

/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method loginProfilesValidate
 */
function loginProfilesValidate(frmId) {


	$(".delete-filefield").remove();
        $(".upFile").html('');

	$("#tf1_frmLoginProfilesForm").removeAttr("target");

	var txtFieldIdArr = new Array();
	txtFieldIdArr[0] = "tf1_profileName,"+LANG_LOCALE['12348'];
	txtFieldIdArr[1] = "tf1_browserTitle,"+LANG_LOCALE['12232'];
	txtFieldIdArr[2] = "tf1_pageBackgroundCustom,"+LANG_LOCALE['12332'];
	txtFieldIdArr[3] = "tf1_headerBackgroundCustom,"+LANG_LOCALE['12280'];
	txtFieldIdArr[4] = "tf1_footerContent,"+LANG_LOCALE['12274'];
	txtFieldIdArr[5] = "tf1_sessionTitle,"+LANG_LOCALE['12377'];
	txtFieldIdArr[6] = "tf1_message,"+LANG_LOCALE['12322'];
	txtFieldIdArr[7] = "tf1_sessionTitle2,"+LANG_LOCALE['12377']+2;
	txtFieldIdArr[8] = "tf1_successMessage,"+LANG_LOCALE['12403'];
	txtFieldIdArr[9] = "tf1_sessionTitle3,"+LANG_LOCALE['12377']+3;
	txtFieldIdArr[10] = "tf1_failureMessage,"+LANG_LOCALE['12273'];
	txtFieldIdArr[11] = "tf1_serviceDisclaimerText,"+LANG_LOCALE['12375'];
    txtFieldIdArr[12] = "tf1_sessionTitle, "+LANG_LOCALE['12377']+1;
    txtFieldIdArr[13] = "tf1_message, "+LANG_LOCALE['12322'];
    txtFieldIdArr[14] = "tf1_sessionTitle2, "+LANG_LOCALE['12377']+2;
    txtFieldIdArr[15] = "tf1_successMessage, "+LANG_LOCALE['12403'];
    txtFieldIdArr[16] = "tf1_sessionTitle3, "+LANG_LOCALE['12377']+3;
    txtFieldIdArr[17] = "tf1_failureMessage, "+LANG_LOCALE['12273'];
    txtFieldIdArr[18] = "tf1_serviceDisclimer, "+LANG_LOCALE['12374'];

	if (txtFieldArrayCheck(txtFieldIdArr) == false)
		return false;

	if (alphaNumericValueCheck ("tf1_profileName", '', '') == false)    
        return false;	

	var txtFieldIdArrChar = new Array();
	txtFieldIdArrChar[0] = "tf1_profileName,"+LANG_LOCALE['12348'];
	txtFieldIdArrChar[1] = "tf1_pageBackgroundCustom,"+LANG_LOCALE['12332'];
	txtFieldIdArrChar[2] = "tf1_headerBackgroundCustom,"+LANG_LOCALE['12280'];
  
	if (isProblemCharArrayCheck(txtFieldIdArrChar, '\'" ', NOT_SUPPORTED) == false) 
        return false;		
	
	/* Single and double quotations are not support to below arry list fields */
	var txtFieldIdArr1 = new Array();
	txtFieldIdArr1[0] = "tf1_browserTitle,"+LANG_LOCALE['12232'];
	txtFieldIdArr1[1] = "tf1_loginTitle,"+LANG_LOCALE['30430'];
	txtFieldIdArr1[2] = "tf1_loginWelcomeMessage,"+LANG_LOCALE['30431'];
	txtFieldIdArr1[3] = "tf1_loginErrorMessage,"+LANG_LOCALE['30432'];
    txtFieldIdArr1[4] = "tf1_headerCaption,Please enter valid Header Caption ";
    txtFieldIdArr1[5] = "tf1_footerContent,Please enter valid Footer Content";
	if (isProblemCharArrayCheck(txtFieldIdArr1, '\'"', NOT_SUPPORTED1) == false) 
        return false;		
	
	if(isCustomColor('tf1_pageBackgroundCustom') == false)
		return false;
	
	if(isCustomColor('tf1_headerBackgroundCustom') == false)
		return false;

    if ($("#tf1_enableExternalPaymentGateway").attr("class") == "enable-disable-on" ) {

        

        var singleProfileOn = false;

        $('.payment-profile').each(function(i, obj) {
      
             if ( $(this).hasClass("enable-disable-on") ) {
              singleProfileOn = true;
              return false;
             }
        });

        if ( singleProfileOn == false ) {
            alert(LANG_LOCALE['30309']);
            return false;
        }

        if (document.getElementById("tf1_pwGatewayServer").length == 0) {
            alert(LANG_LOCALE['12438']);
            return false;
         }
     }
		
	setHiddenChks(frmId);
	return true;
}

/**
 * This function calls when user selects custom header Background
 * OnClick event
 * @method headerBackgroundImageChange
 * @params radioName - Radio Name
 */
function pageBackgroundImageChange(radioName) {
	var radioObj = radioCheckedValueGet(radioName);
	if (!radioObj)
		return;
	switch (parseInt (radioObj, 10)) {
		case 1:
			pageBackgroundColorChange('tf1_pageBackgroundColor');
			fieldStateChangeWr('tf1_pageBackgroundColor tf1_pageBackgroundCustom', '', '', 'tf1_pageBackgroundImage_div');
			vidualDisplay('tf1_pageBackgroundColor tf1_pageBackgroundCustom', 'hide');
			vidualDisplay('break_pageBackgroundColor break_pageBackgroundCustom', 'hide');
			vidualDisplay('tf1_pageBackgroundImage tf1_bgImageControl', 'configRow');
			vidualDisplay('break_pageBackgroundImage break_bgImageControl', 'break');
			break;
		case 2:
			pageBackgroundColorChange('tf1_pageBackgroundColor');
			fieldStateChangeWr('', 'tf1_pageBackgroundImage_div', 'tf1_pageBackgroundColor', '');
			vidualDisplay('tf1_pageBackgroundImage', 'hide');
			vidualDisplay('tf1_bgImageControl', 'hide');
			vidualDisplay('break_pageBackgroundImage', 'hitf1_hdImageControlde');
			vidualDisplay('break_bgImageControl', 'hide');
			vidualDisplay('tf1_pageBackgroundColor', 'configRow');
			vidualDisplay('break_pageBackgroundColor', 'break');
			headerBackgroundColorChange('tf1_pageBackgroundColor');
			$("#tf1_uploadBg_div").html('');
			break;
	}
}



/**
 * This function calls when user selects custom Page Background Color
 * OnChange event
 * @method pageBackgroundColorChange
 * @params selName - Selectbox Name
 */
function pageBackgroundColorChange(selName) {
	var selObj = comboSelectedValueGet(selName);
	if (!selObj)
		return;
	switch (parseInt (selObj, 10)) {
		case 1:
		case 2:
		case 3:
		case 4:
			fieldStateChangeWr('tf1_pageBackgroundCustom', '', '', '');
			vidualDisplay('tf1_pageBackgroundCustom', 'hide');
			vidualDisplay('break_pageBackgroundCustom', 'hide');
			break;
		case 5:
			fieldStateChangeWr('', '', 'tf1_pageBackgroundCustom', '');
			vidualDisplay('tf1_pageBackgroundCustom', 'configRow');
			vidualDisplay('break_pageBackgroundCustom', 'break');
			break;
	}
}

/**
 * This function calls when user selects custom header Background
 * OnClick event
 * @method headerBackgroundImageChange
 * @params radioName - Radio Name
 */
function headerBackgroundImageChange(radioName) {
	var radioObj = radioCheckedValueGet(radioName);
	if (!radioObj)
		return;
	switch (parseInt (radioObj, 10)) {
		case 1:
			headerBackgroundColorChange('tf1_headerBackgroundColor');
			fieldStateChangeWr('tf1_headerBackgroundColor tf1_hdImageControl tf1_hdImageControl2 tf1_headerBackgroundCustom', '', '', 'tf1_headerBackgroundImage_div tf1_headerBackgroundImage2_div');
			vidualDisplay('tf1_headerBackgroundColor tf1_headerBackgroundCustom', 'hide');
			vidualDisplay('break_headerBackgroundColor break_headerBackgroundCustom', 'hide');
			vidualDisplay('tf1_headerBackgroundImage tf1_headerBackgroundImage2 tf1_hdImageControl tf1_hdImageControl2', 'configRow');
			vidualDisplay('break_headerBackgroundImage break_headerBackgroundImage2 break_hdImageControl break_hdImageControl2', 'break');
			break;
		case 2:
			headerBackgroundColorChange('tf1_headerBackgroundColor');
			fieldStateChangeWr('', 'tf1_headerBackgroundImage_div tf1_headerBackgroundImage2_div', 'tf1_headerBackgroundColor', '');
			vidualDisplay('tf1_headerBackgroundImage tf1_headerBackgroundImage2 tf1_hdImageControl tf1_hdImageControl2', 'hide');
			vidualDisplay('break_headerBackgroundImage break_headerBackgroundImage2 break_hdImageControl break_hdImageControl2', 'hide');
			vidualDisplay('tf1_headerBackgroundColor', 'configRow');
			vidualDisplay('break_headerBackgroundColor', 'break');
			headerBackgroundColorChange('tf1_headerBackgroundColor');
			$("#tf1_uploadHd_div").html('');
			break;
	}
}

/**
 * This function calls when user selects custom header Background Color
 * OnChange event
 * @method headerBackgroundColorChange
 * @params selName - Selectbox Name
 */
function headerBackgroundColorChange(selName) {
	var selObj = comboSelectedValueGet(selName);
	if (!selObj)
		return;
	switch (parseInt (selObj, 10)) {
		case 1:
		case 2:
		case 3:
		case 4:
			fieldStateChangeWr('tf1_headerBackgroundCustom', '', '', '');
			vidualDisplay('tf1_headerBackgroundCustom', 'hide');
			vidualDisplay('break_headerBackgroundCustom', 'hide');
			break;
		case 5:
			fieldStateChangeWr('', '', 'tf1_headerBackgroundCustom', '');
			vidualDisplay('tf1_headerBackgroundCustom', 'configRow');
			vidualDisplay('break_headerBackgroundCustom', 'break');
			break;
	}
}

function headerBackGroundSelect(e){

	if ( $(e).attr("image") == "false" )
	{
		alert(LANG_LOCALE['12450']);
		return;
	}

	$(".headerloginProfileHide").each(function(){
		$(this).removeClass("headerloginProfileHideActive");
	});
	$(e).addClass("headerloginProfileHideActive");
	$("#tf1_headerBackgroundImage").val($(e).attr("header-bg-id"));
}
function pageBackgroundSelect(e){
	
	if ( $(e).attr("image") == "false" )
	{
		alert(LANG_LOCALE['12450']);
		return;
	}
	$(".pageloginProfileHide").each(function(){
		$(this).removeClass("pageloginProfileHideActive");
	});
	$(e).addClass("pageloginProfileHideActive");
	$("#tf1_pageBackgroundImage").val($(e).attr("page-bg-id"));
}

/**
 * Validates hexadecimal value
 * @method localOuiDatabaseValidations
*/
function isCustomColor(fldId){
	var obj = document.getElementById(fldId);		
	if(obj.disabled){
		return true;
	}
	var fldVal = document.getElementById(fldId).value;
	var reg = /^(#)?([0-9a-fA-F]{3})([0-9a-fA-F]{3})?$/;
	
	if(!fldVal.match(reg)){
		alert(LANG_LOCALE['11236']);
		document.getElementById(fldId).focus();	
		return false;	
	}
}

