/*
 * File: servicesRouteMgmt.js
 * Created on 19th July 2016 - P.M.Ramakrishna Reddy
 * Copyright (c) 2016 TeamF1, Inc.
 * All rights reserved.
 */

/**
 * This function calls Page loads
 * Onload validation
 * @method onloadCall
 */ 
function onLoadServicesRouteMgmtFn () {
    selRouteInterface ('tf1_routeInterface');    
}

function selRouteInterface (selId) {
    var routeInterfaceObj = $("#"+selId);

    if (routeInterfaceObj) {
        var routeInterface = routeInterfaceObj.val ();
        
        if (routeInterface == "1") { // VLAN
            fieldStateChangeWr ('tf1_policyName', '', 'tf1_vlanName', '');
            vidualDisplay ('tf1_vlanName', 'configRow');
            vidualDisplay ('break_vlanName', 'break');
            vidualDisplay ('tf1_policyName break_policyName', 'hide');
        }
        else { // IPSec
            fieldStateChangeWr ('tf1_vlanName', '', 'tf1_policyName', '');
            vidualDisplay ('tf1_policyName', 'configRow');
            vidualDisplay ('break_policyName', 'break');
            vidualDisplay ('tf1_vlanName break_vlanName', 'hide');
        }
    }
}

function pageValidate (frmId) {
    var vlanNameObj = document.getElementById("tf1_vlanName");
    
    if (vlanNameObj && !(vlanNameObj.disabled)) {
        if($("#tf1_vlanName").val () == null) {
            alert(LANG_LOCALE['50080']);
            return false;
        }
    }

    var policyNameObj = document.getElementById("tf1_policyName");
    if (policyNameObj && !policyNameObj.disabled) {
        if($("#tf1_policyName").val () == null) {
            alert(LANG_LOCALE['50081']);
            return false;
        }
    }

    setHiddenChks(frmId);     
    return true;
}
