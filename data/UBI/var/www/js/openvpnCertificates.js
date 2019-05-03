/****
 * This function calls when user clicks on submit button
 * On submit validation
 * @method selfCertInfoValidate 
 */

function pageValidate () {

    var txtFieldIdArr = new Array ();
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_txtCountryName, "+LANG_LOCALE['50122'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_txtCommonName, "+LANG_LOCALE['50123'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_txtServerName, "+LANG_LOCALE['50101'];
    txtFieldIdArr[txtFieldIdArr.length] = "tf1_txtClientName, "+LANG_LOCALE['50102'];

    if (txtFieldArrayCheck (txtFieldIdArr) == false)
         return false;

    var txtFieldIdArr1 = new Array ();
    txtFieldIdArr1[txtFieldIdArr1.length] = "tf1_txtServerName, "+LANG_LOCALE['50101'];
    txtFieldIdArr1[txtFieldIdArr1.length] = "tf1_txtClientName, "+LANG_LOCALE['50102'];

    if (preventSpaceChar (txtFieldIdArr1) == false)
         return false;

    var emailVal = $('#tf1_txtEmailName').val();
    if (emailVal.length > 0) {
        if (validateEmail (emailVal) == false)
            return false;
    }

    return true;
}

function validateEmail(email) {
    var reg = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
    if (reg.test(email)) {
        return true;
    }
    else {
        alert(LANG_LOCALE['50124']);
        $('#tf1_txtEmailName').focus();
        return false;
    }
}
