/*
 * File: ssidBlockedClients.js
 * Created on 14th Dec 2012 - Bala Krishna G
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */

$(document).ready(function() {
	/**
	 * This function calls when user clicks on Checkbox images
	 * OnClick validation
	 * @method onloadCall
	 */
	$('#tf1_blockedClients .gradeA').contextMenu('contextMenu', {
				bindings : {
				'editMenu' : function(t, e, rowId) {
					openForm('button.edit.blockedClients.blockedClients',rowId,'tf1_dialog','blockedClients','blockedClientsForm.html', 'tf1_blockedClientsDailogContent','');									
				},
				'deleteMenu' : function(t, e, rowId) {
					deleteRows('button.delete.blockedClients.blockedClients', 'tf1_frmBlockedClients', rowId, 'optionSelectAll', 'tf1_dialog', 'blockedClients', 'blockedClients');
				}
			}
			});
				oTable = $('#recordsData').dataTable({
					"bJQueryUI" : true,
					"sPaginationType" : "full_numbers"
				});
				dataRightClick(true);
				$("#btnClose").live("click",function(e){
					HideDialog('tf1_dialog', 'tf1_overlay');
					e.preventDefault();
			   	});
			});

function pageValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_macAddr,"+LANG_LOCALE['12049'];
    txtFieldIdArr[1] = "tf1_description,"+LANG_LOCALE['11987'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;    
       
    var macObj = document.getElementById('tf1_macAddr');
    if (macAddrValidate(macObj.value, true, "", '', macObj) == false) 
        return false;

     
    return true;
}
