/*
 * File: usersConfig.js
 * TeamF1 Inc, 2012
 * Created on 9th Nov 2012 - Bala Krishna G
 */


/**
 * This function calls when user clicks on Activate Jumbo Frames
 * OnClick validation
 * @method onloadCall
 */

/**
 * Onload function
 * @method usersOnload
 * @param toggleObj - object
 */
function onloadUserFn(){
   onloadCall (enableDisableFieldsByImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
   enableDisableFieldsByImageClick ();
   hideFldsByGroup('tf1_groupName');
}

function enableDisableFieldsByImageClick ()
    {
    	enableTextFieldByAnchorClick('tf1_enableEditPassword','tf1_currentPassword tf1_myPwd tf1_cnfMyPwd', 'break_currentPassword break_myPwd break_cnfMyPwd', '');
    }

/****
 * validate the form
 * @method pageValidate
 */


function pageValidate(frmId){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_userName,"+LANG_LOCALE['12410'];
    txtFieldIdArr[1] = "tf1_firstName,"+LANG_LOCALE['12182'];
    txtFieldIdArr[2] = "tf1_lastName,"+LANG_LOCALE['12185'];

    var myCurPwdObj = document.getElementById('tf1_currentPassword');
    if (myCurPwdObj != null && !myCurPwdObj.disabled) {
         txtFieldIdArr[txtFieldIdArr.length] = "tf1_currentPassword,"+LANG_LOCALE['12168'];
    } 

    var myPwdObj = document.getElementById('tf1_myPwd');
    if (!myPwdObj.disabled) {
        txtFieldIdArr[txtFieldIdArr.length] = "tf1_myPwd,"+LANG_LOCALE['12172'];
        txtFieldIdArr[txtFieldIdArr.length] = "tf1_cnfMyPwd,"+LANG_LOCALE['11953'];
    }

    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    if (alphaNumericValueCheck ("tf1_userName", '', '') == false)    
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
    
    var pwdObj = document.getElementById('tf1_myPwd');
    var cnfPwdObj = document.getElementById('tf1_cnfMyPwd');
    
    if (pwdObj && !pwdObj.disabled && cnfPwdObj && !cnfPwdObj.disabled && pwdObj.value != cnfPwdObj.value) {
        alert(LANG_LOCALE['11904']);
        document.getElementById('tf1_myPwd').focus();
        return false;
    }

    var configRowIdObj = document.getElementById ('hdConfigRowId');
    if (configRowIdObj)
      {
            if (configRowIdObj.value != "-1")
                {
                    var selectedVal = $( "#tf1_groupName option:selected" ).text();
                    var currentVal = $( "#hdGroupName" ).val();
                    if (selectedVal === currentVal)
                        {
                        }
                    else 
                        {
                            var defaultAdmin = $("#tf1_hdUserName").val();
                            if (defaultAdmin == "admin") {
                                alert(LANG_LOCALE['50044']);
                                return false;
                            } else {
                                var result = confirm (LANG_LOCALE['30607']);
                                return result;
                            }
                        }
                }
      }
    setHiddenChks(frmId);
    return true;
}
