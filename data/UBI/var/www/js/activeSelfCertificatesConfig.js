/*
 * File: activeSelfCertificatesConfig.js
 * TeamF1 Inc, 2012
 * Created on 8th Nov 2012 - Bala Krishna G
 */
/****
 * uploading the file
 * @method fileUploadCheck
 */
function fileUploadCheck(fileId, errMsg){
    var obj = document.getElementById(fileId);
    if (!obj || obj.disabled) 
        return false;
    if (obj.value.length > 0) 
        return true;
    if (errMsg) 
        alert(errMsg);
    return false;
}
