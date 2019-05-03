/*
 * File: backupRestore.js
 * Created on 5th Nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */

$(document).ready(function(){
    $("#btRestoreCfg").live('click', function(){

        var uploadFileObj = document.getElementById('tf1_txtUploadFile');

        if (uploadFileObj)
            {
                if ($('input[type="file"]').val() == "")
                    {
                        alert(LANG_LOCALE['30611']);
                        return false;
                    }
                else
                    {
                        var fName = uploadFileObj.files[0].name;
                        var fSize = uploadFileObj.files[0].size;
                        
                        var uploadFile = fName.split(".");
                        if (uploadFile.length > 1)
                            {
                                if (uploadFile[1] != "cfg" && uploadFile[1] != "ascii" && uploadFile[1] != ".enc")
                                    {
                                        var errMsg = LANG_LOCALE['13442'] + '. ' + uploadFile[1] + " " + LANG_LOCALE['30414'] + '.' + " cfg/ascii/enc " + LANG_LOCALE['13443'];
                                        alert(errMsg);
                                        return false;
                                    }
                            }
                        else
                            {
                                alert(LANG_LOCALE['30611']);
                                return false;
                            }

                        if (fSize > 2097152)
                            {
                                alert(LANG_LOCALE['30612']);
                                return false;
                            }
                    }
            }
    });
});
/**
 * This function calls when user clicks on Restore button in the Restore to System section
 * On Click validation
 * @method checkFileTypeValid
 */
function checkFileTypeValid (objId, exten, flag){
    var ext = document.getElementById(objId).value;
    if (ext == "") {
        alert(LANG_LOCALE['13441'] + " ." + exten + LANG_LOCALE['13473'] + ".")
        return false;
    }
    ext = ext.substring(ext.lastIndexOf('.') + 1, ext.length);
    ext = ext.toLowerCase();
    if (ext.length > 4) {
        alert(LANG_LOCALE['12429'] + '.' + exten + LANG_LOCALE['13474']);
        return false;
    }
    else if (ext != exten) {
        alert(LANG_LOCALE['13442'] + '.' + ext + LANG_LOCALE['30414'] + '.' + exten + LANG_LOCALE['13443']);
        return false;
    }
    else {
    if (flag == 1) {
        return restoreSettingsFromFile (10, objId, LANG_LOCALE['12183']);
        }
    else if (flag == 3) {
        return restoreSettingsFromFile (10, objId, LANG_LOCALE['12183']);
        }
    }
    return true;
}

function restoreSettingsFromFile (animationDelay, fileId, errMsg) {
    var fileObj = document.getElementById (fileId);
    if (!fileObj.value) {
        if (errMsg) {
            alert (errMsg);
        }
        return false;
    }
    var proceed = confirm (LANG_LOCALE['12530'], '');
    if (proceed) {
        return true;
    }
    return false;
}
