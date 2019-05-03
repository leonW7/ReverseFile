/*
 * File: networkTools.js
 * Created on 5th Nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * This function calls when user clicks on submit button
 * On submit validation
 * @method validateDiagnostics
 * @param action - identifies action (ping, trace route, dns lookup)
 */
function validateDiagnostics(action){
    var ipAddr = document.getElementById('tf1_txtIpaddr').value;
    switch (action) {
        case 1: /* ping */
            if (ipaddrValidate() == false) 
                return false
            break;
        case 2: /* trace route */
            if (ipaddrValidate() == false) 
                return false
            break;
        case 3: /* DNS lookup */
            if (intNameValidate() == false) 
                return false
            break;
    }
    return true;
}

/**
 * This function calls dynamically from "validateDiagnostics" to check the given domain name valid or not
 * On submit validation
 * @method ipaddrValidate
 */
function ipaddrValidate(){
    if (txtFieldArrayCheck(["tf1_txtIpaddr,"+LANG_LOCALE['12291']]) == false) 
        return false;

    if (isProblemCharArrayCheck(["tf1_txtIpaddr,"+LANG_LOCALE['12291']], '\'" ', NOT_SUPPORTED) == false) 
        return false;        

    if (checkHostName('tf1_txtIpaddr', true, LANG_LOCALE['11282']+':', false) == false) 
        return false;
    return true;
}

/**
 * This function calls dynamically from "validateDiagnostics" to check the given domain name valid or not
 * On submit validation
 * @method intNameValidate
 */
function intNameValidate(){
    if (txtFieldArrayCheck(["tf1_txtIntName,"+LANG_LOCALE['12289']]) == false) 
        return false;
        
    if (isProblemCharArrayCheck(["tf1_txtIntName,"+LANG_LOCALE['12289']], '\'" ', NOT_SUPPORTED) == false) 
        return false;     
        
    if (checkHostName('tf1_txtIntName', true, LANG_LOCALE['11279']+':', false) == false) 
        return false;
    return true;
}
