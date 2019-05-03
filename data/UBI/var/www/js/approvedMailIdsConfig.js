/*
 * File: approvedMailIdsConfig.js
 * TeamF1 Inc, 2012
 * Created on 8th Nov 2012 - Bala Krishna G
 */
/****
 * validate the form
 * @method approvedMailIdsValidate
 */
function approvedMailIdsValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_approvedMail,"+LANG_LOCALE['12312'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (echeck('tf1_approvedMail') == false) 
        return false;
    
    return true
}

/****
 * validate the E-mail Function
 * @method echeck
 */
/**
 * validate E-mail
 * @method OnClick validation
 */
function echeck(mailAddr){
    var mail = document.getElementById(mailAddr);
    if (mail.disabled) 
        return true;
    var str = mail.value;
    if (str == "") 
        return true;
    var message = "";
    var errFlag = true;
    var at = "@"
    var dot = "."
    var lat = str.indexOf(at)
    var lstr = str.length
    var ldot = str.indexOf(dot)
    var message = ""
    
    if (lat == -1) {
        message = LANG_LOCALE['10868'];
        errFlag = false
    }
    
    else 
        if (lat == 0 || ((lat + 1) == lstr)) {
            message = LANG_LOCALE['11258'];
            errFlag = false
        }
        
        else 
            if (ldot == -1) {
                message = LANG_LOCALE['10867'];
                errFlag = false
            }
            
            else 
                if (ldot == 0 || ((ldot + 1) == lstr)) {
                    message = LANG_LOCALE['11257'];
                    errFlag = false
                }
                
                else 
                    if (str.indexOf(at, (lat + 1)) != -1) {
                        message = LANG_LOCALE['11256'];
                        errFlag = false
                    }
                    
                    else 
                        if (str.substring(lat - 1, lat) == dot || str.substring(lat + 1, lat + 2) == dot) {
                            message = LANG_LOCALE['11256'];
                            errFlag = false
                        }
                        
                        else 
                            if (str.indexOf(dot, (lat + 2)) == -1) {
                                message = LANG_LOCALE['11256'];
                                errFlag = false
                            }
                            
                            else 
                                if (str.indexOf(" ") != -1) {
                                    message = LANG_LOCALE['11256'];
                                    errFlag = false
                                }
    var errFieldId = mailAddr + "Err";
    if (!errFlag) {
        alert(message);
    }
    
    return errFlag;
}

