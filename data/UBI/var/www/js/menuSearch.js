/*
 * File: menuSearch.js
 * TeamF1 Inc, 2012
 * Created on 31th January 2013 - Sai Kumar D
 */
/* Global Objects */
var divObj;
var indexVal = 0;
/**
 * Showing the resutlt
 * @param: theObj - Array or Object
 */
function print_r(theObj){
    if (theObj.constructor == Array ||
    theObj.constructor == Object) {
        document.write("<ul>")
        for (var p in theObj) {
            if (theObj[p].constructor == Array ||
            theObj[p].constructor == Object) {
                document.write("<li>[" + p + "] => " + typeof(theObj) + "</li>");
                document.write("<ul>")
                print_r(theObj[p]);
                document.write("</ul>")
            }
            else {
                document.write("<li>[" + p + "] => " + theObj[p] + "</li>");
            }
        }
        document.write("</ul>")
    }
}

document.onkeyup = setKeyFunction;

/**
 * This routine converts the given value to lower case.
 * @method: convertToLowerCase
 * @param: fldObjVal - Value to be converted to lower case
 */
function convertToLowerCase(fldObjVal){
    return fldObjVal.toLowerCase();
}

/**
 * This routine appends objects created, based on the string provided, to the div object.
 * @method: searchEnteredValue
 * @param: fldValue - String entered to search for
 * @param: fldObj - Object that consists of an array of objects
 */
function searchEnteredValue(fldValue, fldObj){


    /* Trim the value */
    
    fldValue = trim(fldValue);
    
    
    
    if (fldValue.split(' ').length > 1) {
        fldValue = fldValue.split(' ')[1];
        
    }
    
    
    
    
    var groupObj = new Array();
    
    for (var key in fldObj) {
        /*
         var keyName1 = convertToLowerCase (fldObj[key].mainMenu);
         */
        var keyName4 = convertToLowerCase(fldObj[key].fourthLevelMenu);
        var keyName3 = convertToLowerCase(fldObj[key].thirdLevelMenu);
        var keyName2 = convertToLowerCase(fldObj[key].secondLevelMenu); 
        var keyName = convertToLowerCase(fldObj[key].mainMenu);

        var key3Found = false;
        var key2Found = false;
        var key1Found = false;

        if (keyName4.indexOf(fldValue) != -1) {
            key3Found = true;
            key2Found = true;
            key1Found = true;
            var liObj = createListObject4(fldObj[key], fldValue);
            
            if (divObj.innerHTML.indexOf(liObj.innerHTML) == -1) {
            
                divObj.appendChild(liObj);
                
            }
        }

        if (keyName3.indexOf(fldValue) != -1 && key3Found == false) {
            key2Found = true;
            key1Found = true;
            var liObj = createListObject3(fldObj[key], fldValue);
            
            if (divObj.innerHTML.indexOf(liObj.innerHTML) == -1) {
            
                divObj.appendChild(liObj);
                
            }
        }

        if (keyName2.indexOf(fldValue) != -1 && key2Found == false) {
            key1Found = true;
            var liObj = createListObject2(fldObj[key], fldValue);
            
            if (divObj.innerHTML.indexOf(liObj.innerHTML) == -1) {
            
                divObj.appendChild(liObj);
                
            }
        }

        if (keyName.indexOf(fldValue) != -1 && key1Found == false) {
            /* Loop all elements */
            
            var liObj = createListObject(fldObj[key], fldValue);
            
            if (divObj.innerHTML.indexOf(liObj.innerHTML) == -1) {
            
                divObj.appendChild(liObj);
            }
        }
        /* 50358 - Unable to select by down arrow from search menu starts */
       var menuLst = $("#menuList li").length;
       $("#menuList li").each(function(menuLst) {
            $(this).attr("id", "menuLi" + menuLst);
      });
       /* 50358 - Unable to select by down arrow from search menu ends */
    }
    if (divObj.hasChildNodes()) {
        setFirstAnchorClass();
        var lastNodeObj = divObj.lastChild;
        setClassName(lastNodeObj, 'menuLastChild');
    }
}

/**
 * This routine sets the class name of a given object to a given class name.
 * @method: setClassName
 * @param: fldObj - Object whose class has to be set
 * @param: styleValue - Class name to be set
 */
function setClassName(fldObj, styleValue){
    fldObj.className = styleValue;
}

/**
 * This routine created a list object with an anchor object as its child.
 * @method: createListObject
 * @param: fldObj - Object to be referenced to
 */
function createListObject(fldObj, fldValue){
    var listObj = document.createElement("li");
    listObj.setAttribute("id", 'menuLi' + indexVal);
    indexVal++;
    var anchorObj = document.createElement("a");
    anchorObj.setAttribute("href", "platform.cgi?page="+fldObj.hrefAttrLink + ".html");
    if (fldObj.fourthLevelMenu == '') {
        anchorObj.innerHTML = fldObj.mainMenu + ' <span class="menuSpanArrow">&#187;</span> ' + fldObj.thirdLevelMenu;
        
    }
    else {
    
        if (fldObj.mainMenu.indexOf(fldValue) == -1 && fldObj.fourthLevelMenu.indexOf(fldValue) == -1) {
        
        
            anchorObj.innerHTML = fldObj.mainMenu + ' <span class="menuSpanArrow">&#187;</span> ' + fldObj.thirdLevelMenu + ' <span class="menuSpanArrow">&#187;</span> ' + fldObj.fourthLevelMenu;
            anchorObj.onclick = function(){
                return clickOnLink(fldObj.fourthLevelMenu);
            };
            
        }
        else {
            anchorObj.innerHTML = fldObj.mainMenu + ' <span class="menuSpanArrow">&#187;</span> ' + fldObj.fourthLevelMenu;
            anchorObj.onclick = function(){
                return clickOnLink(fldObj.thirdLevelMenu);
            };
        }
    }
    
    
    anchorObj.onmouseover = onMouseOverFunc;
    anchorObj.onmouseout = onMouseOutFunc;
    listObj.appendChild(anchorObj);
    return listObj;
}
/**
 * This routine created a list object with an anchor object as its child.
 * @method: createListObject
 * @param: fldObj - Object to be referenced to
 * Fourth Level Menu  item
 */
function createListObject4(fldObj, fldValue){
    var listObj = document.createElement("li");
    listObj.setAttribute("id", 'menuLi' + indexVal);
    indexVal++;
    var anchorObj = document.createElement("a");
    anchorObj.setAttribute("href", "platform.cgi?page="+fldObj.hrefAttrLink + ".html");
    
    anchorObj.innerHTML = fldObj.mainMenu + '<span class="menuSpanArrow">&#187;</span> ' + fldObj.fourthLevelMenu;
    
    anchorObj.onclick = function(){
        return clickOnLink(fldObj.fourthLevelMenu);
    };
    anchorObj.onmouseover = onMouseOverFunc;
    anchorObj.onmouseout = onMouseOutFunc;
    listObj.appendChild(anchorObj);
    return listObj;
}
/**
 * This routine created a list object with an anchor object as its child.
 * @method: createListObject
 * @param: fldObj - Object to be referenced to
 * Third Level Menu item
 */
function createListObject3(fldObj, fldValue){
    var listObj = document.createElement("li");
    listObj.setAttribute("id", 'menuLi' + indexVal);
    indexVal++;
    var anchorObj = document.createElement("a");
    anchorObj.setAttribute("href", "platform.cgi?page="+fldObj.hrefAttrLink + ".html");
    
    if (fldObj.fourthLevelMenu == '') {
        anchorObj.innerHTML = fldObj.mainMenu + ' <span class="menuSpanArrow">&#187;</span> ' + fldObj.thirdLevelMenu;
        
    }
    else {
    
        if (fldObj.mainMenu.indexOf(fldValue) == -1 && fldObj.fourthLevelMenu.indexOf(fldValue) == -1) {
            anchorObj.innerHTML = fldObj.mainMenu + ' <span class="menuSpanArrow">&#187;</span> ' + fldObj.thirdLevelMenu + ' <span class="menuSpanArrow">&#187;</span> ' + fldObj.fourthLevelMenu;
            
            
        }
        else {
            anchorObj.innerHTML = fldObj.mainMenu + ' <span class="menuSpanArrow">&#187;</span> ' + fldObj.fourthLevelMenu;
            
        }
    }
    
    anchorObj.onclick = function(){
        return clickOnLink(fldObj.thirdLevelMenu);
    };
    anchorObj.onmouseover = onMouseOverFunc;
    anchorObj.onmouseout = onMouseOutFunc;
    listObj.appendChild(anchorObj);
    return listObj;
}

/**
 * This routine created a list object with an anchor object as its child.
 * @method: createListObject
 * @param: fldObj - Object to be referenced to
 * Third Level Menu item
 */
function createListObject2(fldObj, fldValue){
    var listObj = document.createElement("li");
    listObj.setAttribute("id", 'menuLi' + indexVal);
    indexVal++;
    var anchorObj = document.createElement("a");
    //anchorObj.setAttribute("href", fldObj.hrefAttrLink + ".html");
     anchorObj.setAttribute("href", "platform.cgi?page="+fldObj.hrefAttrLink + ".html");
    if (fldObj.fourthLevelMenu == '') {
        anchorObj.innerHTML = fldObj.mainMenu + ' <span class="menuSpanArrow">&#187;</span> ' + fldObj.secondLevelMenu + ' <span class="menuSpanArrow">&#187;</span> ' + fldObj.thirdLevelMenu;
        
    }
    else {
    
        if (fldObj.mainMenu.indexOf(fldValue) == -1 && fldObj.fourthLevelMenu.indexOf(fldValue) == -1) {
            anchorObj.innerHTML = fldObj.mainMenu + ' <span class="menuSpanArrow">&#187;</span> ' + fldObj.secondLevelMenu + ' <span class="menuSpanArrow">&#187;</span> ' +  fldObj.thirdLevelMenu + ' <span class="menuSpanArrow">&#187;</span> ' + fldObj.fourthLevelMenu;
            
            
        }
        else {
            anchorObj.innerHTML = fldObj.mainMenu + ' <span class="menuSpanArrow">&#187;</span> ' + fldObj.fourthLevelMenu;
            
        }
    }
    
    anchorObj.onclick = function(){
        return clickOnLink(fldObj.thirdLevelMenu);
    };
    anchorObj.onmouseover = onMouseOverFunc;
    anchorObj.onmouseout = onMouseOutFunc;
    listObj.appendChild(anchorObj);
    return listObj;
}

/**
 * This routine sets the selected link's text as value in the Search field.
 * @method: clickOnLink
 * @param: setValue - Value to be set for an object
 */
function clickOnLink(setValue){
    var fldObj = document.getElementById('menu1');
    if (fldObj) {
        fldObj.value = setValue;
    }    
    return true;
}

/**
 * This routine clears the search list existing in the div object.
 * @method: clearSearchList
 * @param: NONE
 */
function clearSearchList(){
    divObj.innerHTML = "";
    divObj.className = "hide";
}

/**
 * This routine searches for the menu list matching the entered values.
 * @method: autoCompleteSearch
 * @param: NONE
 */
function autoCompleteSearch(){
    var fldObj = document.getElementById('menuSearch');
    clearSearchList();
    var fldObjVal = convertToLowerCase(fldObj.value);
    fldObjVal = trim(fldObjVal);
    var hidWatermarkVal = trim(convertToLowerCase($("#tf1_hidWatermark").val()));

    /* If the value is same as water mark skip the search */

    if (fldObjVal == hidWatermarkVal) {       
        return;
     }
    

    indexVal = 0;
    if (fldObjVal.length > 1) {
        searchEnteredValue(fldObjVal, menuSearchList);
    }
}

/**
 * This routine gets the char code of the key stroke and calls its
 * respective funcion.
 * @method: setKeyFunction
 * @param: NONE
 */
function setKeyFunction(e){
    var key;
    divObj = document.getElementById('menuList');
    if (!e) 
        var e = window.event;
    (e.keyCode) ? key = e.keyCode : key = e.which;
    if (key == 40) {
        if (divObj != null || divObj.innerHTML != "") {
            setClassOnKeyDown();
        }
    }
    if (key == 38) {
        if (divObj != null || divObj.innerHTML != "") {
            setClassOnKeyUp();
        }
    }
    if (key == 13) {
        if (divObj != null || divObj.innerHTML != "") {
            setFuncOnKeyEnter();
        }
    }
    if ((key >= 97 && key <= 122) || (key >= 65 && key <= 90) || key == 8 || key == 46) {
        autoCompleteSearch();
    }
}

/**
 * This routine returns the index of the menu highlighted in the search list.
 * @method: getSelectedMenuIndex
 * @param: NONE
 * @return: Index value
 */
function getSelectedMenuIndex(){
    var arrObj = divObj.getElementsByTagName('a');
    for (var i = 0; i < arrObj.length; i++) {
        if (arrObj[i].className == "menu-selected") {
            return i;
        }
    }
    return -1;
}

/**
 * This routine returns the length of the array object.
 * @method: getNoOfAnchorObjs
 * @param: NONE
 * @return: Integer value
 */
function getNoOfAnchorObjs(){
    var arrObj = divObj.getElementsByTagName('a');
    return arrObj.length;
}

/**
 * This routine sets the class for an object.
 * @method: setAnchorObjClass
 * @param: cntNo - Index of the menu to be set
 * @param: anchorLength - Length of an object
 * @param: clsName - Class name to be set to
 */
function setAnchorObjClass(cntNo, anchorLength, clsName){
    if (cntNo >= anchorLength) {
        cntNo = anchorLength - 1;
    }
    if (cntNo < 0) {
        cntNo = 0;
        clsName = "menu-unselected";
    }
    var prevLiObj = document.getElementById('menuLi' + cntNo);
    if (prevLiObj) {
        var anchObj = prevLiObj.firstChild;
        setClassName(anchObj, clsName);
    }
}

/**
 * This routine sets the class for the first anchor object.
 * @method: setFirstAnchorClass
 * @param: NONE
 */
function setFirstAnchorClass(){
    divObj.className = "menuSearchTf1";
    var countNo = getSelectedMenuIndex();
    if (countNo < 0) {
        var liObj = divObj.firstChild;
        var anchObj = liObj.firstChild;
        setClassName(anchObj, "menu-selected");
    }
}

/**
 * This routine sets the class names of the objects on key up stroke.
 * @method: setClassOnKeyUp
 * @param: NONE
 */
function setClassOnKeyUp(){
    var countNo = getSelectedMenuIndex();
    if (countNo < 0) {
        clearSearchList();
    }
    else {
        var noOfAnchors = getNoOfAnchorObjs();
        setAnchorObjClass(countNo, noOfAnchors, "menu-unselected");
        setAnchorObjClass((countNo - 1), noOfAnchors, "menu-selected");
    }
}

/**
 * This routine sets the class names of the objects on key down stroke.
 * @method: setClassOnKeyDown
 * @param: NONE
 */
function setClassOnKeyDown(){
    var countNo = getSelectedMenuIndex();
    var noOfAnchors = getNoOfAnchorObjs();
    setAnchorObjClass(countNo, noOfAnchors, "menu-unselected");
    setAnchorObjClass((countNo + 1), noOfAnchors, "menu-selected");
}

/**
 * This routine leads to the respective page based on the link of the
 * highlighted object on key enter stroke.
 * @method: setFuncOnKeyEnter
 * @param: NONE
 */
function setFuncOnKeyEnter(){
    var countNo = getSelectedMenuIndex();
    var liObj = document.getElementById('menuLi' + countNo);
    if (liObj) {
        var anchObj = liObj.firstChild;
        location.href = anchObj.href;
    }
}

var onMouseOverFunc = function(){
    setClassName(this, 'menu-selected');
};
var onMouseOutFunc = function(){
    setClassName(this, 'menu-unselected');
};

/**
 * Function For get The BreadCrumb
 * @method getBreadCrumb
 * @param: listKey - File name without extension
 */
function getBreadCrumb(listKey){
    var label1 = eval("menuSearchList['" + listKey + "'].mainMenu");
    var label2 = eval("menuSearchList['" + listKey + "'].secondLevelMenu");
    var label3 = eval("menuSearchList['" + listKey + "'].thirdLevelMenu");
    var label4 = eval("menuSearchList['" + listKey + "'].fourthLevelMenu");
    
    bString = label1;
    
   if (label2.length > 0 && label1 != label2) {
	bString = bString + "<span>&#187;</span>" + label2;
	}
	if (label3.length > 0 && label3 != label2) {
	bString = bString + "<span>&#187;</span>" + label3;
	}
	if (label4.length > 0 && label4 != label3) {
	bString = bString + "<span>&#187;</span>" + label4;
	}
	document.getElementById("breadCrumb").innerHTML = bString;
}


/**
 * Function For get The file Name form anchor href
 * OnClick event
 * @method getFileName
 */
function getFileName() {

	/*this gets the full url  */
	var url = document.location.href;

	/*Live box condition  */
	if (url.indexOf("platform.cgi?page=") != -1) {

		/* If string 'platform.cgi?page=' found split and get the string after '=' */
		url = url.split("=")[1];
		/*this removes the anchor at the end, if there is one */
		url = url.substring(0, (url.indexOf("#") == -1) ? url.length : url.indexOf("#"));

	} else {

		/*this removes the anchor at the end, if there is one  */
		url = url.substring(0, (url.indexOf("#") == -1) ? url.length : url.indexOf("#"));
		/*this removes the query after the file name, if there is one  */
		url = url.substring(0, (url.indexOf("?") == -1) ? url.length : url.indexOf("?"));
		/*this removes everything before the last slash in the path  */
		url = url.substring(url.lastIndexOf("/") + 1, url.length);

	}

	/*return  */
	return url;
}
if ( getFileName() != 'platform.cgi' ) {

	fileName = getFileName();

}

fileName = fileName.replace('.html', '');
getBreadCrumb(fileName);

/**
 * Placeholder like function
 * OnFoucs and OnBlur events
 * @method watermark
 * @param: inputId - Input text enterd by user
 * @param: text - Default text
 */
function watermark(inputId, text){
    var inputBox = document.getElementById(inputId);
    if (inputBox.value.length > 0) {
        if (trim(inputBox.value) == trim(text)) 
            inputBox.value = '';
    }
    else 
        inputBox.value = trim(text);
}
/**
 * This function calls when page loads
 * OnLoad Call
 */
$(document).ready(function(){
    $(".nolink").click(function(event){
        event.preventDefault();
    });
    
    $('html').click(function(){
        clearSearchList ();
        document.getElementById('menuList').innerHTML = '';
        document.getElementById('menuSearch').value = LANG_LOCALE['14232'];
    });
    
    $('.systemSearch').click(function(event){
        event.stopPropagation();
    });
});

