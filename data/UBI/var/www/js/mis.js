/*
 * File: mis.js
 * TeamF1 Inc, 2012
 * Created on 20th July 2012 - suresh
 */
 
var mockUp = false;
if(mockUp == false){
	var platformUrl="platform.cgi?page=";
}else{
	var platformUrl="";
}
var idSuffix = "Menu";

/**
 Define Global variables
*/
var ON_IMAGE = "button_on.png";
var OFF_IMAGE = "button_off.png";
var ON_ANCHOR = "enable-disable-on";
var OFF_ANCHOR = "enable-disable-off";
var ENABLE_ANCHOR = "enable-disable-enb";
var DISABLE_ANCHOR = "enable-disable-dis";
var ALLOW_ANCHOR = "enable-disable-allow";
var BLOCK_ANCHOR = "enable-disable-block";
var G_GRP={};
/*****
 Image Swaping for enable / disape buttons. Replacing checkbox with this for nice look.
 ******/                    
var onloadCall = function(func, data){

	/* old image onload code start	*/
	 $(".enable-disable").live('click', function(){     
	     	var imgSrc = this.src;     	
	     	if (imgSrc.indexOf("_off") != -1) /*off is found else on is found */
	     	{     	
	     		this.src = this.src.replace("_off", "_on");     	
	     	} else {     	
	     		this.src = this.src.replace("_on", "_off");     	
	     	}  
	      
		    if (func) {
		    	func(data, this);
		    }           
	});
	/* old image onload code End	*/

	/* New Li onload code start	*/
     $(".enable-disable-off").live('click', function(){     
         $(this).removeClass(OFF_ANCHOR);
		 $(this).addClass(ON_ANCHOR);
		 if (func) {
		   	func(data, this);
		 }
	});
	$(".enable-disable-on").live('click', function(){     
         $(this).removeClass(ON_ANCHOR);
		 $(this).addClass(OFF_ANCHOR);
		 if (func) {
		   	func(data, this);
		 }
	});
	/* New Li onload code End	*/

    /* New Li onload code start	*/
     $(".enable-disable-dis").live('click', function(){     
         $(this).removeClass(DISABLE_ANCHOR);
		 $(this).addClass(ENABLE_ANCHOR);
		 if (func) {
		   	func(data, this);
		 }
	});
	$(".enable-disable-enb").live('click', function(){     
         $(this).removeClass(ENABLE_ANCHOR);
		 $(this).addClass(DISABLE_ANCHOR);
		 if (func) {
		   	func(data, this);
		 }
	});
	/* New Li onload code End	*/

    /* New Li onload code start	*/
     $(".enable-disable-block").live('click', function(){     
         $(this).removeClass(BLOCK_ANCHOR);
		 $(this).addClass(ALLOW_ANCHOR);
		 if (func) {
		   	func(data, this);
		 }
	});
	$(".enable-disable-allow").live('click', function(){     
         $(this).removeClass(ALLOW_ANCHOR);
		 $(this).addClass(BLOCK_ANCHOR);
		 if (func) {
		   	func(data, this);
		 }
	});
	/* New Li onload code End	*/
	
};



/**
 * This function for enable or disable fields while clicking on on off image
 * Onclick event
 * @method enableTextFieldByAnchorClick
 * @param imgId - image Id
 * @param fieldIds - space separated field names
 * @param brk - space separated break names
 */
function enableTextFieldByAnchorClick(imgId,fieldIds,brk,blocks){
	var imgObj = document.getElementById(imgId);
    if (imgObj) {
		var currentClass=$(imgObj).attr("class");	
	     if((currentClass == ON_ANCHOR || currentClass == "enable-disable-on-noclick")){
			fieldStateChangeWr ('', '', fieldIds, '');
       		vidualDisplay(fieldIds,'configRow');	   
       		vidualDisplay (brk,'break');
       		vidualDisplay(blocks,'');
	     }else{
			fieldStateChangeWr (fieldIds, '', '', '');
	   	    vidualDisplay(fieldIds,'hide');
	   	    vidualDisplay (brk,'hide');
	   	    vidualDisplay(blocks,'hide');
	     }
    }
}

/**
 * This function for enable or disable fields while clicking on on off image
 * Onclick event
 * @method disableTextFieldByAnchorClick
 * @param imgId - image Id
 * @param fieldIds - space separated field names
 * @param brk - space separated break names
 */
function disableTextFieldByAnchorClick(imgId,fieldIds,brk,blocks){	
	var imgObj = document.getElementById(imgId);
    if (imgObj) {
		var currentClass=$(imgObj).attr("class");		
	     if(currentClass == OFF_ANCHOR){	     	
			fieldStateChangeWr ('', '', fieldIds, '');
       		vidualDisplay (fieldIds,'configRow');	  
       		vidualDisplay (brk,'break');
	   	    vidualDisplay(blocks,'');
	     }else{
			fieldStateChangeWr (fieldIds, '', '', '');
        	vidualDisplay (fieldIds,'hide');
        	vidualDisplay (brk,'hide');
       		vidualDisplay(blocks,'hide');	
	     }
    }
}

/**
 * This function for enable or disable fields while clicking on on off image
 * Onclick event
 * @method enaTextFieldByAnchorClick
 * @param imgId - image Id
 * @param fieldIds - space separated field names
 * @param brk - space separated break names
 */
function enaTextFieldByAnchorClick(imgId,fieldIds,brk,blocks){
	var imgObj = document.getElementById(imgId);
    if (imgObj) {
		var currentClass=$(imgObj).attr("class");	
	     if(currentClass == ENABLE_ANCHOR){
			fieldStateChangeWr ('', '', fieldIds, '');
       		vidualDisplay(fieldIds,'configRow');	   
       		vidualDisplay (brk,'break');
       		vidualDisplay(blocks,'');
	     }else{
			fieldStateChangeWr (fieldIds, '', '', '');
	   	    vidualDisplay(fieldIds,'hide');
	   	    vidualDisplay (brk,'hide');
	   	    vidualDisplay(blocks,'hide');
	     }
    }
}

/**
 * This function for enable or disable fields while clicking on on off image
 * Onclick event
 * @method disTextFieldByAnchorClick
 * @param imgId - image Id
 * @param fieldIds - space separated field names
 * @param brk - space separated break names
 */
function disTextFieldByAnchorClick(imgId,fieldIds,brk,blocks){	
	var imgObj = document.getElementById(imgId);
    if (imgObj) {
		var currentClass=$(imgObj).attr("class");		
	     if(currentClass == DISABLE_ANCHOR){	     	
			fieldStateChangeWr ('', '', fieldIds, '');
       		vidualDisplay (fieldIds,'configRow');	  
       		vidualDisplay (brk,'break');
	   	    vidualDisplay(blocks,'');
	     }else{
			fieldStateChangeWr (fieldIds, '', '', '');
        	vidualDisplay (fieldIds,'hide');
        	vidualDisplay (brk,'hide');
       		vidualDisplay(blocks,'hide');	
	     }
    }
}

/**
 * This function for enable or disable fields while clicking on on off image
 * Onclick event
 * @method allowTextFieldByAnchorClick
 * @param imgId - image Id
 * @param fieldIds - space separated field names
 * @param brk - space separated break names
 */
function allowTextFieldByAnchorClick(imgId,fieldIds,brk,blocks){
	var imgObj = document.getElementById(imgId);
    if (imgObj) {
		var currentClass=$(imgObj).attr("class");	
	     if(currentClass == ALLOW_ANCHOR){
			fieldStateChangeWr ('', '', fieldIds, '');
       		vidualDisplay(fieldIds,'configRow');	   
       		vidualDisplay (brk,'break');
       		vidualDisplay(blocks,'');
	     }else{
			fieldStateChangeWr (fieldIds, '', '', '');
	   	    vidualDisplay(fieldIds,'hide');
	   	    vidualDisplay (brk,'hide');
	   	    vidualDisplay(blocks,'hide');
	     }
    }
}

/**
 * This function for enable or disable fields while clicking on on off image
 * Onclick event
 * @method blockTextFieldByAnchorClick
 * @param imgId - image Id
 * @param fieldIds - space separated field names
 * @param brk - space separated break names
 */
function blockTextFieldByAnchorClick(imgId,fieldIds,brk,blocks){	
	var imgObj = document.getElementById(imgId);
    if (imgObj) {
		var currentClass=$(imgObj).attr("class");		
	     if(currentClass == BLOCK_ANCHOR){	     	
			fieldStateChangeWr ('', '', fieldIds, '');
       		vidualDisplay (fieldIds,'configRow');	  
       		vidualDisplay (brk,'break');
	   	    vidualDisplay(blocks,'');
	     }else{
			fieldStateChangeWr (fieldIds, '', '', '');
        	vidualDisplay (fieldIds,'hide');
        	vidualDisplay (brk,'hide');
       		vidualDisplay(blocks,'hide');	
	     }
    }
}

/*****
 For Main Menu Highlight.
 *****/
function mmSel(mmSelId){
    var identity = document.getElementById(mmSelId);
    identity.id = "Selected";
}

/*****
 Modal dialog show
 *****/
function ShowDialog(modal, dialogId, overlayId){
    $("#" + overlayId).show();
    $("#" + dialogId).fadeIn(300);
    if (modal) {
        $("#" + overlayId).unbind("click");
    }
    else {
        $("#" + overlayId).click(function(e){
            HideDialog();
        });
    }
}

/*****
 Modal dialog hide
 *****/
function HideDialog(dialogId, overlayId){
    $("#" + overlayId).hide();
    $("#" + dialogId).fadeOut(300);
}

/**
 * This function in called on document ready and sets events on the respective fields to pop and hide divs
 * @method setOnclickDialogs
 * @param onclkBtn - id of add button
 * @param closeBtn - id of close button
 * @param dialogDivId - id of dialog div
 * @param overlayDivId - id of overlay div
 */
function setOnclickDialogs(onclkBtn, closeBtn, dialogDivId, overlayDivId){
    $("#" + onclkBtn).click(function(e){
        ShowDialog(true, dialogDivId, overlayDivId);
        e.preventDefault();
    });
    
    $("#" + closeBtn).click(function(e){
        HideDialog(dialogDivId, overlayDivId);
        e.preventDefault();
    });
}

/**
 * This function should be called on when doing rowwise operations
 * @method performSelectedOperation
 * @param  OpInfoObj this object contains following information
 operation - operation to be performed for ex - delete/enable/disable
 tableId - id of table to which row belongs
 checkId - its a hidden field id. Based on its value number of rows to be
 deleted is defined. If its value is "0" then operation on one row
 takes place. If its value is 1 then operation on all row takes place.
 Value for this id is set when select all check box is checked on unchecked
 contextRowId - This is the id of row on which user right clicks
 url - file path which will handle ajax request and perform operations
 skipHeadIdRow - This should be the id of head section row. This row is out of consideration
 when rows on which action needs to take place is found
 */
function performDeleteOperation(OpInfoObj){
    var selectedData = null;
    var jsondata = null;
    var postData = null;
    // Check if the select all check box is selected
    var checkIdObj = document.getElementById(OpInfoObj.checkId);
    if (checkIdObj && checkIdObj.checked) {
        // Multiple delete operation
        //skipHeadIdRow id will be heading row that is part of thead
        //true is for multiple selection
        selectedData = getDataForAction(OpInfoObj.tableId, true, OpInfoObj.skipHeadIdRow);
    }
    else {
        // Single delete operation
        //false is for single selection
        //contextRowId is the id of row on which contextmenu event is generated
        selectedData = getDataForAction(OpInfoObj.contextRowId, false);
    }
    //Convert selected data to string
    jsondata = JSON.stringify(selectedData);
    postData = ({
        rows: jsondata,
        operationName: OpInfoObj.operation
    });
    $.post(OpInfoObj.url, postData, function(data){
        //Write a call backback function
    });
}


/**
 * This function should be called on when doing rowwise operations
 * @method performSelectedOperation
 * @param  OpInfoObj this object contains following information
 operation - operation to be performed for ex - delete/enable/disable
 tableId - id of table to which row belongs
 checkId - its a hidden field id. Based on its value number of rows to be
 deleted is defined. If its value is "0" then operation on one row
 takes place. If its value is 1 then operation on all row takes place.
 Value for this id is set when select all check box is checked on unchecked
 contextRowId - This is the id of row on which user right clicks
 url - file path which will handle ajax request and perform operations
 skipHeadIdRow - This should be the id of head section row. This row is out of consideration
 when rows on which action needs to take place is found
 */
function performEditOperation(OpInfoObj){
    var selectedData = null;
    var jsondata = null;
    var postData = null;
    cleanFields(OpInfoObj.editFldObj)
    //contextRowId is the id of row on which contextmenu event is generated
    selectedData = getDataForAction(OpInfoObj.contextRowId, false);
    
    //Convert selected data to string
    jsondata = JSON.stringify(selectedData);
    postData = ({
        rows: jsondata,
        operationName: OpInfoObj.operation
    });
    $.post(OpInfoObj.url, postData, function(data){
        //Write a call backback function
        fillEditFlds(data, OpInfoObj.editFldObj)
    }, 'json');
}


/**
 * This function is called from performSelectedOperation to get the data
 * @method getDataForAction
 * @param actionIds - table id or contextid
 * @param state - true is multiple row operation and false is single row operation
 * @param skipHeadIdRow - skip row id in head tag
 */
function getDataForAction(actionIds, state, skipHeadRowId){
    var dataArr = [];
    var dataObj = null;
    if (!state) {
        dataObj = {};
        dataObj["1"] = actionIds;
        dataArr.push(dataObj);
    }
    else {
        var tableObj = document.getElementById(actionIds);
        var trArr = tableObj.getElementsByTagName('tr');
        if (trArr) {
            for (var i = 0; i < trArr.length; i++) {
                dataObj = {};
                if (trArr[i].id != skipHeadRowId) {
                    dataObj[i] = trArr[i].id;
                    dataArr.push(dataObj);
                }
            }
        }
    }
    return dataArr;
}

/**
 * This function sets the value of the hidden field id
 * @method setSelectAll
 * @param thisObjId - selected checkbox id
 * @param editId - prefixId of the edit field
 function setSelectAll (thisObjId, editId) {
 var thisObj = document.getElementById (thisObjId);
 var editIdObj = document.getElementById (editId + idSuffix);
 if (thisObj && thisObj.checked) {
 editIdObj.style.display = "none";
 }
 else {
 editIdObj.style.display = "block";
 }
 }*/
/**
 * This function sets the value of the hidden field id
 * @method setSelectAll
 * @param thisObjId - selected checkbox id
 * @param editId - prefixId of the edit field
 */
function setSelectAll(thisObjId, editId){
    var thisObj = document.getElementById(thisObjId);
    if (!thisObj) 
        return;
    if(!editId) return;	
    var objIdArr = editId.split(" ");
    for (idx in objIdArr) {
        var editIdObj = document.getElementById(objIdArr[idx] + idSuffix);
	if (editIdObj) {
       	    if (thisObj && thisObj.checked) {
                editIdObj.style.display = "none";
            }
       	    else {
                editIdObj.style.display = "block";
            }
	}
    }
}


/**
 * This function fills the edit fields with json data
 * @method fillEditFlds
 * @param data - json data returned from server
 * @param idNameMap - name-id map object
 */
function fillEditFlds(data, idNameMap){
    for (var prop in data) {
        if (data[prop]) {
            var obj = document.getElementById(idNameMap[prop]);
            if (obj) {
                obj.value = data[prop];
            }
        }
    }
}

/**
 * This function cleans the edit fields
 * @method cleanFields
 * @param idNameMap - name-id map object
 */
function cleanFields(idNameMap){
    for (var prop in idNameMap) {
        if (idNameMap[prop]) {
            var obj = document.getElementById(idNameMap[prop]);
            if (obj) {
                obj.value = '';
            }
        }
    }
}

/**
 * This function suffixes 'Menu' on fields of cloned object
 * @method setMenuIds
 */
function setMenuIds(){
    var conetxtMenuObj = document.getElementById('jqContextMenu');
    var liObjs = conetxtMenuObj.getElementsByTagName('li');
    for (var i = 0; i < liObjs.length; i++) {
        liObjs[i].id = liObjs[i].id + idSuffix;
    }
    var inputObjs = conetxtMenuObj.getElementsByTagName('input');
    for (var i = 0; i < inputObjs.length; i++) {
        inputObjs[i].id = inputObjs[i].id + idSuffix;
    }
}


/* New trim function in javascript */

function trim(s){
    var l = 0;
    var r = s.length - 1;
    while (l < s.length && s[l] == ' ') {
        l++;
    }
    while (r > l && s[r] == ' ') {
        r -= 1;
    }
    return s.substring(l, r + 1);
}


/* New function to show tool bar text for clear instructions */

function dataRightClick(rBool, tabName){

	var rightClickOn = LANG_LOCALE['12713'];
	
	var rightClickOff = LANG_LOCALE['11785'];
	
	if(tabName)
		var tableName=tabName;
	else
		var tableName="recordsData";
	
	if (rBool == true){
	
	$("#"+tableName+"_length label").append('<span class="ctoolbar">['+rightClickOn+']</span>');
	
	}
	else {
	
	$("#"+tableName+"_length label").append('<span class="ctoolbar">['+rightClickOff+']</span>');
	/* for No right click options cursor should be default instead of pointer starts */
        $('#'+tableName).children('tbody').on("mouseenter", function() {
                 // hover starts code here
             $(this).find('tr').css('cursor','default');    });
        /* for No right click options cursor should be default instead of pointer ends */
	}
	
}

// Returns the version of Internet Explorer or a -1
// (indicating the use of another browser).

function getInternetExplorerVersion()
{
  var rv = -1; // Return value assumes failure.
  if (navigator.appName == 'Microsoft Internet Explorer')
  {
    var ua = navigator.userAgent;
    var re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
    if (re.exec(ua) != null)
      rv = parseFloat( RegExp.$1 );
  }
  return rv;
}

/* set the version */
var getIEVersion = getInternetExplorerVersion();

/* If IE less then 9 add HTML 5 elements */
if ( getIEVersion > 0 && getIEVersion < 9 )
{
    var e = ("abbr,article,aside,audio,canvas,close,datalist,details,figure,footer,header,hgroup,mark,menu,meter,nav,output,progress,section,time,video,figcaption,summary").split(',');

    for (var i = 0; i < e.length; i++){
        document.createElement(e[i]);
    }
}

/**
 * Function for Add or Edit Form fields
 * @method openForm
 * buttonPrefix: submit button we need to send ex: button.edit.users.users
 * rowId: Record id
 * dialogId: popup id
 * rowPrefix: Row Prefix ex: users
 * pageName: Page Name ex: users.html
 */

function openForm(buttonPrefix, rowId, dialogId, rowPrefix, pageName, popupContent, onloadfun){
    $("#"+dialogId).html($("#tf1_loadingDiv").html());
    
    	ShowDialog(true, dialogId, 'tf1_overlay');    
    	
    	rowId=rowId.toString();
    	    
    	if (rowId != '-1') {
    		rowId = rowId.replace(rowPrefix,"");    		
	    	dataString = buttonPrefix + "."+rowId+"=edit&thispage="+pageName+"&configRowId="+rowId;   
    	} else {
    		dataString = buttonPrefix + "."+rowId+"=add&thispage="+pageName+"&configRowId="+rowId;
    	} 	
    	dataStringArry = dataString.split("&");    	
    	dataObj = new Object();
    	
    	for(i=0; i< dataStringArry.length; i++){
    		data =  dataStringArry[i].split("=");
    		dataObj[data[0]] = data[1]; 
    	}    	 
    	
    	$("#"+dialogId).load(platformUrl+pageName+" #"+popupContent, dataObj, function(response) {
			/* See if the page is a login page , then redirect to login from popup*/
			if (response.search("button.login.Users") != -1 || response.search("tf1_frontDeskLogin") != -1 )
				{															
					$("#"+dialogId).hide();
					$("#"+dialogId).html(response);
					if ($(".midWidth2 div.msgError p").length > 0 && $(".midWidth2 div.msgError p").html() != '') 
						{
							window.location="platform.cgi?page=index.html&redirectStatusMessage="+$(".midWidth2 div.msgError p").html();
						}else if ($("#tf1_frontDeskLogin").length > 0) {
                       
                            window.location="platform.cgi?page=billingDeskLogin.html";
                        }
                       
                         else {
							window.location="platform.cgi?page=index.html";
						}
			}	

            $("#"+popupContent).find('[data-localize]').each(function(index){
				var str = $(this).attr('data-localize');
				str = str.replace(/\./g, "\'][\'");
				str = "LANG_LOCALE['"+str+"']";
				if ($(this).attr("title")) {
					$(this).attr("title",eval(str));
					if ($(this).attr("type"))
						$(this).val(eval(str));
			    } else if ($(this).attr("type")) {
					$(this).val(eval(str));
				} else {
					$(this).html(eval(str));
				}
			});
			$("#btnCloseWizard").attr("title",LANG_LOCALE['14198']);
			$("#btnClose").attr("title",LANG_LOCALE['14198']);
		
			if(onloadfun != '')
			eval(onloadfun+"()");
		});	    	
     
}
/**
 * Function for Add or Edit Form fields
 * @method openForm
 * buttonPrefix: submit button we need to send ex: button.edit.users.users
 * rowId: Record id
 * dialogId: popup id
 * rowPrefix: Row Prefix ex: users
 * pageName: Page Name ex: users.html
 */

function openPreviewForm(buttonPrefix, fldName, rowId, dialogId, rowPrefix, pageName, popupContent, onloadfun){
    $("#"+dialogId).html($("#tf1_loadingDiv").html());
    
    	ShowDialog(true, dialogId, 'tf1_overlay');    
    	rowId = rowId.replace(rowPrefix,"");
    	
   		dataString = buttonPrefix + "."+rowId+"=view&thispage="+pageName+"&"+fldName+"="+rowId;
    	dataStringArry = dataString.split("&");    	
    	dataObj = new Object();
    	
    	for(i=0; i< dataStringArry.length; i++){
    		data =  dataStringArry[i].split("=");
    		dataObj[data[0]] = data[1]; 
    	}    	 
    	
    	$("#"+dialogId).load(platformUrl+pageName+" #"+popupContent, dataObj, function(response) {
			/* See if the page is a login page , then redirect to login from popup*/
			if (response.search("button.login.Users") != -1)
				{															
					$("#"+dialogId).hide();
					$("#"+dialogId).html(response);
					if ($(".midWidth2 div.msgError p").length > 0 && $(".midWidth2 div.msgError p").html() != '') 
						{
							window.location="platform.cgi?page=index.html&redirectStatusMessage="+$(".midWidth2 div.msgError p").html();
						} else {
							window.location="platform.cgi?page=index.html";
						}
			} 

            $("#"+popupContent).find('[data-localize]').each(function(index){
				var str = $(this).attr('data-localize');
				str = str.replace(/\./g, "\'][\'");
				str = "LANG_LOCALE['"+str+"']";
				if ($(this).attr("title")) {
					$(this).attr("title",eval(str));
					if ($(this).attr("type"))
						$(this).val(eval(str));
			    } else if ($(this).attr("type")) {
					$(this).val(eval(str));
				} else {
					$(this).html(eval(str));
				}
			});
			$("#btnCloseWizard").attr("title",Close);
			$("#btnClose").attr("title",Close);

			if(onloadfun != '')
			eval(onloadfun+"()");
		});
    	$("#"+dialogId).addClass("configDialogGray");	       
}

/**
 * Function for delete one or more records
 * @method deleteRows
 * buttonPrefix: submit button we need to send ex: button.edit.users.users
 * frmId: Form Name 
 * rowId: Record id
 * selBoxId: Select Box Id 
 * dialogId: popup id
 * rowPrefix: Row Prefix ex: users
 * checkBoxPrefix: Check box Prefix ex: users
 */
function deleteRows( buttonPrefix, frmId, rowId, selBoxId, dialogId, rowPrefix, checkBoxPrefix) {
    $("#"+dialogId).html('');

    if ( $("#"+selBoxId+"Menu").is(':checked') ) {
        var childrenRows = $("#"+rowId).parent().children('tr');
        for (var i = 0; i < childrenRows.length; i++) {
            var thisElement = $(childrenRows[i]);
            thisRowId = thisElement.attr('id');
           
            thisRowId = thisRowId.replace(rowPrefix,"");
            $("#"+dialogId).append('<input type="hidden" name="'+checkBoxPrefix+'.checkbox" value="'+thisRowId+'">');
        }
    } else {
        rowId = rowId.replace(rowPrefix,"");
        $("#"+dialogId).append('<input type="hidden" name="'+checkBoxPrefix+'.checkbox" value="'+rowId+'">');
    }
   
    $("#"+dialogId).append('<input type="hidden" name="'+buttonPrefix+'" value="delete">');
   
    $("#"+frmId).submit();
}
/**
 * Function for calling enable/disable form submit
 * @method changeRowStauts
 * status: Status to change
 * frmId: Form Name
 * rowId:  Record id
 * dialogId: popup id
 * rowPrefix: Row Prefix ex: users
 * checkBoxPrefix: CheckBox Prefix ex: users
 * buttonSuffix: Button Suffix
 */
function changeRowStauts(status, frmId, rowId, dialogId, rowPrefix, checkBoxPrefix, buttonSuffix, selBoxId) {
    $("#"+dialogId).html('');
    if (selBoxId) {
        if ( $("#"+selBoxId+"Menu").is(':checked') ) {
            var childrenRows = $("#"+rowId).parent().children('tr');
            for (var i = 0; i < childrenRows.length; i++) {
                var thisElement = $(childrenRows[i]);
                thisRowId = thisElement.attr('id');
                thisRowId = thisRowId.replace(rowPrefix,"");
                $("#"+dialogId).append('<input type="hidden" name="'+checkBoxPrefix+'.checkbox" value="'+thisRowId+'">');
            }
        } 
        else {
            rowId = rowId.replace(rowPrefix,"");
            $("#"+dialogId).append('<input type="hidden" name="'+checkBoxPrefix+'.checkbox" value="'+rowId+'">');
        }
    }
    else {
        rowId = rowId.replace(rowPrefix,"");
        $("#"+dialogId).append('<input type="hidden" name="'+checkBoxPrefix+'.checkbox" value="'+rowId+'">');
    }
    $("#"+dialogId).append('<input type="hidden" name="button.'+status+'.'+buttonSuffix+'" value="'+status+'">');
    $("#"+frmId).submit();
}


/**
 * Function for resetting Image based on hidden form field of Image
 * @method resetImgOnOff  
*/
function resetImgOnOff(frmId) {

	/* old */
	$( "#"+frmId+" img.enable-disable" ).each(function() {			
			var imgSrc = this.src;									 	
	     	if ($(this).next().val() == 0)  {	     		
				this.src = this.src.replace("_on", "_off");	 	     		      		  	
	     	} else {	     	
	     		this.src = this.src.replace("_off", "_on");	     		 
	     	}	     	    	     		
	});

	/* new */
	$( "#"+frmId+" a.enable-disable-off" ).each(function() {		
	     	if ($(this).next().val() == 1)  {	     		
				$(this).removeClass(OFF_ANCHOR);
				$(this).addClass(ON_ANCHOR); 	     		      		  	
	     	}     	    	     		
	});
	$( "#"+frmId+" a.enable-disable-on" ).each(function() {		
	     	if ($(this).next().val() == 0)  {	     		
				$(this).removeClass(ON_ANCHOR);
				$(this).addClass(OFF_ANCHOR); 	     		      		  	
	     	}     	    	     		
	});

    /* new */
	$( "#"+frmId+" a.enable-disable-dis" ).each(function() {		
	     	if ($(this).next().val() == 1)  {	     		
				$(this).removeClass(DISABLE_ANCHOR);
				$(this).addClass(ENABLE_ANCHOR); 	     		      		  	
	     	}     	    	     		
	});
	$( "#"+frmId+" a.enable-disable-enb" ).each(function() {		
	     	if ($(this).next().val() == 0)  {	     		
				$(this).removeClass(ENABLE_ANCHOR);
				$(this).addClass(DISABLE_ANCHOR); 	     		      		  	
	     	}     	    	     		
	});

    /* new */
	$( "#"+frmId+" a.enable-disable-block" ).each(function() {		
	     	if ($(this).next().val() == 1)  {	     		
				$(this).removeClass(BLOCK_ANCHOR);
				$(this).addClass(ALLOW_ANCHOR); 	     		      		  	
	     	}     	    	     		
	});
	$( "#"+frmId+" a.enable-disable-allow" ).each(function() {		
	     	if ($(this).next().val() == 0)  {	     		
				$(this).removeClass(ALLOW_ANCHOR);
				$(this).addClass(BLOCK_ANCHOR); 	     		      		  	
	     	}     	    	     		
	});
}


/**
 * Function for Set all hidden fields ON/OFF as per image src
 * @method setHiddenChks
*/

function setHiddenChks(frmId) {

	/* old */
	$( "#"+frmId+" img.enable-disable" ).each(function() {	
			var imgSrc = this.src;					 	
	     	if (imgSrc.indexOf("_off") != -1) /*off is found else on is found */
	     	{     	
	     		 $(this).next().val(0);		     		      		  	
	     	} else {
	     		$(this).next().val(1);
	     	}	     	     		     		
	});
	
	/* new */
	$( "#"+frmId+" a.enable-disable-off" ).each(function() {		
		$(this).next().val(0);   	    	     		
	});
	$( "#"+frmId+" a.enable-disable-on" ).each(function() {		
	   	$(this).next().val(1);  	    	     		
	});

    /* new */
	$( "#"+frmId+" a.enable-disable-dis" ).each(function() {		
		$(this).next().val(0);   	    	     		
	});
	$( "#"+frmId+" a.enable-disable-enb" ).each(function() {		
	   	$(this).next().val(1);  	    	     		
	});

    /* new */
	$( "#"+frmId+" a.enable-disable-block" ).each(function() {		
		$(this).next().val(0);   	    	     		
	});
	$( "#"+frmId+" a.enable-disable-allow" ).each(function() {		
	   	$(this).next().val(1);  	    	     		
	});
}
function print_r(theObj){
	if (theObj.constructor == Array || theObj.constructor == Object) {
		document.write("<ul>")
		for (var p in theObj) {
			if (theObj[p].constructor == Array || theObj[p].constructor == Object) {
				document.write("<li>[" + p + "] => " + typeof(theObj) + "</li>");
				document.write("<ul>")
				print_r(theObj[p]);
				document.write("</ul>")
			} else {
				document.write("<li>[" + p + "] => " + theObj[p] + "</li>");
			}
		}
	document.write("</ul>")
	}
}

function redirectToPage(pageName){
	if(pageName)
		window.location=pagName;
	else
		window.location="cgi-action.html";
}

/**
 * On image toggle disables,hides, enables and shows the fields depending on the image selected
 * @method onImageToggle
 * @param obj - this is an json object which contains properties along with respective values.
 This object is a customized object in which various ids will change depending on
 respective pages but the keys should remain same.
 obj.imageId gives the id of the image object
 obj.disableIndividual gives space separated list of fields which should be disabled
 obj.disableGrp gives space separated list of block field which should be disabled
 obj.enableIndividual gives space separated list of fields which should be enabled
 obj.enableGrp gives space separated list of block field which should be enabled
 obj.hideClass gives class used to hide fields
 obj.showClass gives class used to show fields
 obj.breakDivs gives space separated list of ids break divs
 obj.breakClass gives class to be used for break divs
 obj.imagesInfo gives another object that contains information about images to be enabled and disabled
 obj.imagesInfo.disableImages gives space separated list of image ids
 obj.imagesInfo.enableImages gives space separated list of image ids to be enabled
 obj.imagesInfo.enableImages gives space separated list of image ids to be enabled
 obj.imagesInfo.disableClass gives class used for disabling images
 obj.imagesInfo.enableClass gives class used for enabling images
 */
function onImageToggle(obj){
    var imgObj = document.getElementById(obj.imageId);
    if (imgObj) {
        var imgObjVal = imgObj.src;
        var imageName = imgObjVal.substring(imgObjVal.lastIndexOf('/') + 1);
        if (imageName == OFF_IMAGE) {
            //Enable and show fields 
            fieldStateChangeWr(obj.disableIndividual, obj.disableGrp, obj.enableIndividual, obj.enableGrp);
            vidualDisplay(obj.disableIndividual + ' ' + obj.disableGrp, obj.hideClass);
            vidualDisplay(obj.enableIndividual + ' ' + obj.enableGrp, obj.showClass);
            vidualDisplay(obj.breakDivs, obj.hideClass);
            changeImageToggleClass(obj.imagesInfo);
        }
        else 
            if (imageName == ON_IMAGE) {
                //Disable and hide fields
                fieldStateChangeWr(obj.enableIndividual, obj.enableGrp, obj.disableIndividual, obj.disableGrp);
                vidualDisplay(obj.disableIndividual + ' ' + obj.disableGrp, obj.showClass);
                vidualDisplay(obj.enableIndividual + ' ' + obj.enableGrp, obj.hideClass);
                vidualDisplay(obj.breakDivs, obj.breakClass);
                changeImageToggleClass(obj.imagesInfo);
            }
    }
    
}
function onAnchorToggle(obj){
	var imgObj = document.getElementById(obj.imageId);
    if (imgObj) {
		var currentClass=$(imgObj).attr("class");
		
	     if(currentClass == OFF_ANCHOR){
	     	$(this).removeClass(OFF_ANCHOR);
			$(this).addClass(ON_ANCHOR);
			 fieldStateChangeWr(obj.disableIndividual, obj.disableGrp, obj.enableIndividual, obj.enableGrp);
            vidualDisplay(obj.disableIndividual + ' ' + obj.disableGrp, obj.hideClass);
            vidualDisplay(obj.enableIndividual + ' ' + obj.enableGrp, obj.showClass);
            vidualDisplay(obj.breakDivs, obj.hideClass);
            changeImageToggleClass(obj.imagesInfo);
	     }else{
	     	$(this).removeClass(ON_ANCHOR);
			$(this).addClass(OFF_ANCHOR);
			 fieldStateChangeWr(obj.enableIndividual, obj.enableGrp, obj.disableIndividual, obj.disableGrp);
                vidualDisplay(obj.disableIndividual + ' ' + obj.disableGrp, obj.showClass);
                vidualDisplay(obj.enableIndividual + ' ' + obj.enableGrp, obj.hideClass);
                vidualDisplay(obj.breakDivs, obj.breakClass);
                changeImageToggleClass(obj.imagesInfo);
	     }
    }    
}

function helpPop (helpSection,helpConfigFile){
	/* For all browsers */	
	var url = "platform.cgi?page=showHelp.html&help="+helpSection+"&helpfile="+helpConfigFile;	
	/*Overwrite if it is Opera browser */	
	if ( navigator.appName.indexOf ('Opera') != -1 ) {	
			url = "platform.cgi?page=showHelp.html&help="+helpSection+"&helpfile="+helpConfigFile;			
		}	
	helpwindow=window.open(url,'name','height=398,width=560,left=200,top=150,resizable=no,scrollbars=yes,toolbar=no,status=no');	
	
	if (window.focus) {helpwindow.focus()}
	
	
}
/*
 Function for OmniSSL Help popup content
*/
function omniSSLHelpPop (helpSection,helpConfigFile){
	/* For all browsers */	
	var url = "platform.cgi?page=omniSSLShowHelp.html&help="+helpSection+"&helpfile="+helpConfigFile;	
	/*Overwrite if it is Opera browser */	
	if ( navigator.appName.indexOf ('Opera') != -1 ) {	
			url = "platform.cgi?page=omniSSLShowHelp.html&help="+helpSection+"&helpfile="+helpConfigFile;			
		}	
	helpwindow=window.open(url,'name','height=398,width=560,left=200,top=150,resizable=no,scrollbars=yes,toolbar=no,status=no');	
	
	if (window.focus) {helpwindow.focus()}
}
/**
 * Function for delete one or more records
 * @method deleteRowsNew
 * buttonPrefix: submit button we need to send ex: button.edit.users.users
 * frmId: Form Name
 * rowId: Record id
 * selBoxId: Select Box Id
 * dialogId: popup id
 * rowPrefix: Row Prefix ex: users
 * checkBoxPrefix: Check box Prefix ex: users
 */
function deleteRowsNew( buttonPrefix, frmId, rowId, selBoxId, dialogId, rowPrefix, checkBoxPrefix,tableId) {   
    $("#"+dialogId).html('');
    var regex = new RegExp(":", "g");
    if ( $("#"+selBoxId+"Menu").is(':checked') ) {
        rowId = rowId.replace(regex,"\\:");
        rowId= jqSelector(rowId);
        if (typeof tableId != 'undefined' && tableId != "") {
            var childrenRows = $("#"+tableId).children('tbody').children('tr');
        } else {
            var childrenRows = $("#"+rowId).parent().children('tr');
        }
        for (var i = 0; i < childrenRows.length; i++) {
            var thisElement = $(childrenRows[i]);
            thisRowId = thisElement.attr('id');
           
            thisRowId = thisRowId.replace(rowPrefix,"");
            $("#"+dialogId).append('<input type="hidden" name="'+checkBoxPrefix+'.checkbox" value="'+thisRowId+'">');
        }
    } else {
        rowId = rowId.replace(rowPrefix,"");
        $("#"+dialogId).append('<input type="hidden" name="'+checkBoxPrefix+'.checkbox" value="'+rowId+'">');
    }
   
    $("#"+dialogId).append('<input type="hidden" name="'+buttonPrefix+'" value="delete">');
    $("#"+frmId).submit();
}

/**
 * Function to escape special characters in ID field
 * @method jqSelector
*/
function jqSelector(str)
{
    return str.replace(/([;&,\.\+\*\~':"\!\^#$%@\[\]\(\)=>\|])/g, '\\$1');

}

/****************************************************************************
function : atleastOneAuthSupport - Checks if atleast one item is selected out of
           a set
parameter: strIds - ids of set from which fileds should be selected
returns : True/False
pages : This function needs to used in PPTP and L2TP server pages.
*/

function atleastOneAuthSupport (strIds) {
	var strIdsArray = strIds.split (' ');
    var notSelectedCount = 0;
    for (var i = 0; i <= strIdsArray.length; i++) {
        // take every id one by one and check if it is selected
        // if it is selected then break and return true
        selAuth = $('#'+strIdsArray[i]).attr('class');
        if(selAuth && (selAuth == ON_ANCHOR)) {
            notSelectedCount++;
            break;
        }       
    }        
    //  If notSelectedCount is zero then no id is selected
    if(notSelectedCount == 0) return false;    
    return true;
	}

/****************************************************************************
function : atleastOneAuthSupportAll - Checks if atleast one item is selected out of
           a set
parameter: strIds - ids of set from which fileds should be selected
returns : True/False
pages : This function needs to used in OpenVPNSettings page.
*/

function atleastOneAuthSupportAll (strIds) {
	var strIdsArray = strIds.split (' ');
    var notSelectedCount = 0;
    for (var i = 0; i <= strIdsArray.length; i++) {
        // take every id one by one and check if it is selected
        // if it is selected then break and return true
        selAuth = $('#'+strIdsArray[i]).attr('class');
        if(selAuth && (selAuth == ON_ANCHOR || selAuth == ENABLE_ANCHOR)) {
            notSelectedCount++;
            break;
        }       
    }        
    //  If notSelectedCount is zero then no id is selected
    if(notSelectedCount == 0) return false;    
    return true;
	}

function isDirty(oldObject, newObject) {
    var flag = 0;
    for(var prop in newObject)
        {
            if (newObject[prop] !== oldObject[prop])
                {
                    flag = 1;
                    return flag;
                }
        }
    return flag;
    }

/* ip-address sorting starts */

/* added if condition not to load data tables for HTML pages containing static data */
if ($.fn.dataTableExt) {
    /* time sorting in the format containing 11:45 PM.08:00 AM starts */
    jQuery.fn.dataTable.ext.type.order['time-grade-pre'] = function ( d ) {
        var timeCheck = d.split(" ");
        var sortCharTimeFirst = timeCheck[0]; 
        var sortCharTimeSecond = timeCheck[1];
        var y = "";
        y = sortCharTimeFirst;
    switch ( sortCharTimeSecond ) {
        case 'AM': 
            return [1, y];
        case 'PM': 
            return [2, y];

        }
  
    return 0;
    };
 /* time sorting in the format containing 11:45 PM.08:00 AM ends */ 

/* ip addresss sorting starts */
/**
* Sorts a column containing IP addresses in typical dot notation. This can
* be most useful when using DataTables for a networking application, and
* reporting information containing IP address. Also has a matching type
* detection plug-in for automatic type detection.
*
* @name IP addresses
* @summary Sort IP addresses numerically
* @author Brad Wasson
*
* @example
* $('#example').dataTable( {
* columnDefs: [
* { type: 'ip-address', targets: 0 }
* ]
* } );
*/

jQuery.extend( jQuery.fn.dataTableExt.oSort, {
"ip-address-pre": function ( a ) {
    /* added if condition check to sort ipaddress with start & end 
    ports [ ex: 192.168.10.9/3:3-28 or 0.0.0.0/3-3 ]in the SSL VPN Server Policy  starts */
    if(a.indexOf('/') !== -1 && a.indexOf('-') !== -1){
      var rangeCheck = a.split("/"); 
      var sortCharFirst =  rangeCheck[0];
      var m = sortCharFirst.split("."), x = "";
        for(var i = 0; i < m.length; i++) {
        var item = m[i];
        if(item.length == 1) {
        x += "00" + item;
        } else if(item.length == 2) {
        x += "0" + item;
        } else {
        x += item;
        }
        }
        return x; 

    }
    /* added if condition check to sort ipaddress,mask length with start & end 
    ports [ ex: 192.168.10.9/3:3-28 or 0.0.0.0/3-3 ]in the SSL VPN Server Policy ends */

    /* added else if condition check to sort ipaddress with start & end 
    ports [ ex: 1.1.1.1:1-3 ]in the SSL VPN Server Policy  starts */
    else if(a.indexOf(':') !== -1 && a.indexOf('-') !== -1){
      var rangeCheck = a.split(":"); 
      var sortCharFirst =  rangeCheck[0];
      var m = sortCharFirst.split("."), x = "";
        for(var i = 0; i < m.length; i++) {
        var item = m[i];
        if(item.length == 1) {
        x += "00" + item;
        } else if(item.length == 2) {
        x += "0" + item;
        } else {
        x += item;
        }
        }
        return x; 

    }
    /* added else if condition check to sort ipaddress  with start & end 
    ports  [ ex: 1.1.1.1:1-3 ]in the SSL VPN Server Policy  ends */

    /* added else if condition check whether ipaddress contains only alphabets
    in the SSL VPN Server Policy  starts */

    else if(a.search(/[^a-zA-Z]+/) === -1) {

        return a;
    }
   /* added else if condition check whether ipaddress contains only alphabets
    in the SSL VPN Server Policy  ends */

    /* added else if condition check to sort ipaddress 
     [ ex:  192.168.29.1 , 192.168.29.10 ]in the Groups IP Policy starts */
    else if(a.indexOf(',') !== -1){
      var rangeCheck = a.split(","); 
      var sortCharFirst =  rangeCheck[0];
      var sortCharSecond =  rangeCheck[1];
      sortCharFirst = sortCharFirst.trim();
      sortCharSecond = sortCharSecond.trim(); 
      var m = sortCharFirst.split("."), x = "";
        for(var i = 0; i < m.length; i++) {
        var item = m[i];
        if(item.length == 1) {
        x += "00" + item;
        } else if(item.length == 2) {
        x += "0" + item;
        } else {
        x += item;
        }
        }
        var n = sortCharSecond.split("."), y = "";
        for(var i = 0; i < n.length; i++) {
        var item = n[i];
        if(item.length == 1) {
        y += "00" + item;
        } else if(item.length == 2) {
        y += "0" + item;
        } else {
        y += item;
        }
        }
        return [x, y];

    }
    /* added else if condition check to sort ipaddress 
     [ ex:  192.168.29.1 , 192.168.29.10 ]in the Groups IP Policy  ends */

    /* added else if condition check to sort ipaddress in the range
     [ ex: 192.168.29.1 - 192.168.29.10]in the same column  starts */
    else if (a.indexOf('-') !== -1) {
      var rangeCheck = a.split("-"); 
      var sortCharFirst =  rangeCheck[0];
      var sortCharSecond =  rangeCheck[1];
      sortCharFirst = sortCharFirst.trim();
      sortCharSecond = sortCharSecond.trim(); 
      var m = sortCharFirst.split("."), x = "";
        for(var i = 0; i < m.length; i++) {
        var item = m[i];
        if(item.length == 1) {
        x += "00" + item;
        } else if(item.length == 2) {
        x += "0" + item;
        } else {
        x += item;
        }
        }
        var n = sortCharSecond.split("."), y = "";
        for(var i = 0; i < n.length; i++) {
        var item = n[i];
        if(item.length == 1) {
        y += "00" + item;
        } else if(item.length == 2) {
        y += "0" + item;
        } else {
        y += item;
        }
        }
        return [x, y];
    }
    /* added else if condition check to sort ipaddress in the range
     [ ex: 192.168.29.1 - 192.168.29.10]in the same column ends */

    /* added else if condition check to sort ipaddress with port number
    [ ex: 192.168.29.1:30000 in the same column  starts */
    else if (a.indexOf(':') !== -1) {
      var rangeCheck = a.split(":"); 
      var sortCharFirst =  rangeCheck[0];
      var sortCharSecond =  rangeCheck[1];
      var m = sortCharFirst.split("."), x = "";
        for(var i = 0; i < m.length; i++) {
        var item = m[i];
        if(item.length == 1) {
        x += "00" + item;
        } else if(item.length == 2) {
        x += "0" + item;
        } else {
        x += item;
        }
        }
       var item = sortCharSecond,y = "";
        if(item.length == 1) {
        y += "0000" + item;
        } else if(item.length == 2) {
        y += "000" + item;
        }else if(item.length == 3) {
        y += "00" + item;
        }else if(item.length == 4) {
        y += "0" + item;
        }else {
        y += item;
        }
      // y = sortCharSecond;
        return [x, y];
    }
    /* added else if condition check to sort ipaddress with port number
    [ ex: 192.168.29.1:30000 in the same column  ends */

     /* added else if condition check to sort ipaddress with subnetmask
      [ ex: 192.168.29.1/255.0.0.0 ]in the policy page  starts */
    else if (a.indexOf('/') !== -1) {
      var rangeCheck = a.split("/"); 
      var sortCharFirst =  rangeCheck[0];
      var sortCharSecond =  rangeCheck[1];
      var m = sortCharFirst.split("."), x = "";
        for(var i = 0; i < m.length; i++) {
        var item = m[i];
        if(item.length == 1) {
        x += "00" + item;
        } else if(item.length == 2) {
        x += "0" + item;
        } else {
        x += item;
        }
        }
       var item = sortCharSecond,y = "";
        if(item.length == 1) {
        y += "0000" + item;
        } else if(item.length == 2) {
        y += "000" + item;
        }else if(item.length == 3) {
        y += "00" + item;
        }else if(item.length == 4) {
        y += "0" + item;
        }else {
        y += item;
        }
      // y = sortCharSecond;
        return [x, y];
    }
    /* added else if condition check to sort ipaddress with subnetmask
      [ ex: 192.168.29.1/255.0.0.0 ]in the policy page ends */

    /* added else  condition check to sort ipaddress  
    [ ex: 192.168.29.1]in the same column  starts */
    else{
        var sortCharSingle = a;
        var m = sortCharSingle.split("."), x = "";
        for(var i = 0; i < m.length; i++) {
        var item = m[i];
        if(item.length == 1) {
        x += "00" + item;
        } else if(item.length == 2) {
        x += "0" + item;
        } else {
        x += item;
        }
        }
        return x;
    }
    /* added else  condition check to sort ipaddress  
    [ ex: 192.168.29.1]in the same column  ends */

},
"ip-address-asc": function ( a, b ) {
return ((a < b) ? -1 : ((a > b) ? 1 : 0));
},
"ip-address-desc": function ( a, b ) {
return ((a < b) ? 1 : ((a > b) ? -1 : 0));
}
} );

/* ip addresss sorting ends */


}

/*ip-address sorting ends */
