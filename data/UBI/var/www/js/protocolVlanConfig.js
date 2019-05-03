/*
 * File: voiceVlanConfig.js
 * Created on 20th nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method protocolVlanConfigValidate
 */
function protocolVlanConfigValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_txtVlan, Please enter valid VLAN ID";
    txtFieldIdArr[1] = "tf1_groupId, Please enter valid Group ID";
    txtFieldIdArr[2] = "tf1_groupName, Please enter valid Group Name";
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

	if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
    
    var vlanIdObj = document.getElementById('tf1_txtVlan');
    if (numericValueRangeCheck(vlanIdObj, 1, "", 1, 4096, true, "Invalid VLAN ID.", "") == false) 
        return false;
        
    var groupIdObj = document.getElementById('tf1_groupId');
    if (numericValueRangeCheck(groupIdObj, 1, "", 1, 4096, true, "Invalid Group ID.", "") == false) 
        return false;
    
    return true;
}
