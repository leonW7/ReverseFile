/*
 * File: ipAliasingConfig.js
 * Created on 20th nov 2012 - Laxmi
 * Modified on 25th July 2014 - Ramakrishna Reddy
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
    txtFieldIdArr[0] = "tf1_IPAddress, "+LANG_LOCALE['12028'];
    txtFieldIdArr[1] = "tf1_subnetMask, "+LANG_LOCALE['12133'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
    if (ipv4Validate('tf1_IPAddress', 'IP', false, true, LANG_LOCALE['11281'], LANG_LOCALE['11031'], true) == false) 
        return false;
    
    if (validNetMask('tf1_subnetMask') == false) 
        return false;

    var alreadyCofigMsg = LANG_LOCALE['30461'];
    var diffSubnetMsg = LANG_LOCALE['30462'];

    // Subnet checking
    var count = parseInt(document.getElementById('hdCount').value,10);
    var countWan1 = parseInt(document.getElementById('hdCountWan1').value,10);
    var countWan2 = parseInt(document.getElementById('hdCountWan2').value,10);
	var resIpObj = document.getElementById('tf1_IPAddress');
	for (var i = 1; i <= count; i++)
	    {
		var ifname = document.getElementById('ifName'+ i).value;
		var IpAddrId = "hdIPAddr" + ifname ;
		var SnetMaskId = "hdSnetAddr"+ ifname;		
		var IpStr = document.getElementById(IpAddrId).value;
		var IpMaskStr = document.getElementById(SnetMaskId).value;
		if(document.getElementById(IpAddrId).value != '0.0.0.0' && document.getElementById(SnetMaskId).value != '0.0.0.0')
		    {
		    if (subnetValidation ('tf1_IPAddress', 'tf1_subnetMask', IpAddrId, SnetMaskId))
		        {
		        var errorstr = alreadyCofigMsg+ "(" + ifname + ")." +diffSubnetMsg;
		            alert (errorstr);
		            resIpObj.focus ();
		            return false;
		        }
		    }
		}

	// For WAN1
	var selValue = radioCheckedValueGet("tf1_radioWAN1");
	    if(selValue == "WAN2")
	        {
	        for (var i = 1; i <= countWan1; i++)
	            {
		        var ifname = document.getElementById('ifNameWan1'+ i).value;
		        var IpAddrId = "hdIPAddr" + ifname + i;
		        var SnetMaskId = "hdSnetAddr"+ ifname + i;		        
		        var IpStr = document.getElementById(IpAddrId).value;
		        var IpMaskStr = document.getElementById(SnetMaskId).value;
		        if(document.getElementById(IpAddrId).value != '0.0.0.0' && document.getElementById(SnetMaskId).value != '0.0.0.0')
		            {
		            if (subnetValidation ('tf1_IPAddress', 'tf1_subnetMask', IpAddrId, SnetMaskId))
		                {
		                var errorstr = alreadyCofigMsg+ "(" + ifname + ")." +diffSubnetMsg;
		                    alert (errorstr);
		                    resIpObj.focus ();
		                    return false;
		                }
		            }
		        }
		    }
		else
		    {
		    // For WAN2
		    for (var i = 1; i <= countWan2; i++)
	            {
	            var ifname = document.getElementById('ifNameWan2'+ i).value;
	            var IpAddrId = "hdIPAddr" + ifname + i;
	            var SnetMaskId = "hdSnetAddr"+ ifname + i;
	            var IpStr = document.getElementById(IpAddrId).value;
	            var IpMaskStr = document.getElementById(SnetMaskId).value;
	            if(document.getElementById(IpAddrId).value != '0.0.0.0' && document.getElementById(SnetMaskId).value != '0.0.0.0')
	                {
	                if (subnetValidation ('tf1_IPAddress', 'tf1_subnetMask', IpAddrId, SnetMaskId))
	                    {
	                    var errorstr = alreadyCofigMsg+ "(" + ifname + ")." +diffSubnetMsg;
	                    alert (errorstr);
	                    resIpObj.focus ();
	                    return false;
	                    }
	                }
	            }
	        }
    return true;
}
