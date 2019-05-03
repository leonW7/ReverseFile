/*
* File: loginProfilesSla.js
* Created on 27th Nov 2012 - Laxmi
* Copyright (c) 2012 TeamF1, Inc.
* All rights reserved.
*/
/**
 * This function calls Page loads
 * Onload validation
 * @method onloadCall
 */


$(document).ready(function() {
	$('#tf1_loginProfilesSla .activeGradeA').contextMenu('contextMenu', {
				bindings : {
				'editMenu' : function(t, e, rowId) {
				openForm('button.edit.loginProfilesSla.loginProfilesSla',rowId,'tf1_dialog','loginProfilesSla','loginProfilesSlaForm.html', 'tf1_loginProfilesSlaDailogContent','');									
				},
				'deleteMenu' : function(t, e, rowId) {
				deleteRows('button.delete.loginProfilesSla.loginProfilesSla', 'tf1_frmloginProfilesSlaForm', rowId, 'optionSelectAll', 'tf1_dialog', 'loginProfilesSla', 'loginProfilesSla');
				}

			}, onShowMenu: function(e,menu,rowId) {
			 var re  = new RegExp(":",'g');
			 rowId = rowId.replace(re,"\\:");
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



/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method loginProfilesValidate
 */
function loginProfilesSlaValidate() {

	var txtFieldIdArr = new Array();
	txtFieldIdArr[0] = "tf1_profileName, Please enter valid Profile Name";
	txtFieldIdArr[1] = "tf1_browserTitle,Please enter valid Browser Title";
    txtFieldIdArr[2] = "tf1_termsOfServiceRule, Please enter valid Terms of service rule Settings";

	if (txtFieldArrayCheck(txtFieldIdArr) == false)
		return false;

    var txtFieldIdArr1 = new Array();
	txtFieldIdArr1[0] = "tf1_profileName, Please enter valid Profile Name";
	txtFieldIdArr1[1] = "tf1_browserTitle,Please enter valid Browser Title";

    if (isProblemCharArrayCheck(txtFieldIdArr1, "", NOT_SUPPORTED) == false) 
        return false;

	return true;
}


