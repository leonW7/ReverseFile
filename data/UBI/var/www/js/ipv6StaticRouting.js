/*
 * File: ipv6StaticRouting.js
 * Created on 23rd nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
 

/**
 * function for validate form when user clicks on submit button
 * OnSubmit event
 * @method ipv6StaticRoutingValidate
 */
function ipv6StaticRoutingValidate(frmId){

    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_txtRouteName,"+LANG_LOCALE['12368'];
    txtFieldIdArr[1] = "tf1_txtDestIpAddr,"+LANG_LOCALE['12298'];
    txtFieldIdArr[2] = "tf1_txtPreLen,"+LANG_LOCALE['12036'];
    txtFieldIdArr[3] = "tf1_txtGwIpAddr,"+LANG_LOCALE['12299'];
    txtFieldIdArr[4] = "tf1_txtMetric,"+LANG_LOCALE['12323'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    if (alphaNumericValueCheck ("tf1_txtRouteName", '', '') == false)    
        return false;

    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv6Validate('tf1_txtDestIpAddr', false, true, '') == false) 
        return false;
    
    var preLenObj = document.getElementById('tf1_txtPreLen');
    if (preLenObj && !preLenObj.disabled) {
        if (numericValueRangeCheck(preLenObj, '', '', 0, 128, true, LANG_LOCALE['11286']+': ', '') == false) 
            return false;
    }
    
    if (ipv6Validate('tf1_txtGwIpAddr', true, true, '') == false) 
        return false;
    
    var metricObj = document.getElementById('tf1_txtMetric');
    if (metricObj && !metricObj.disabled) {
        if (numericValueRangeCheck(metricObj, '', '', 2, 15, true, LANG_LOCALE['11303']+': ', ' ') == false) 
            return false;
    }
    setHiddenChks(frmId);
    var check="tf1_txtGwIpAddr"
    var setIp = "";
    var setPrefix = "";
    var selectedInt = radioCheckedValueGet('tf1_rdInterface1');
    if (selectedInt == "sit0-WAN1")
    {
    var sit0Wan1 = $("#hdSit0Wan1").val();
    // If the Interface Link is not up then we show below condition msg
    if (sit0Wan1 == "0" || sit0Wan1 == "1")
        {
        alert(LANG_LOCALE['30618']);
        return false;
        }
    else
        {    
        cnt=1;
        var txthdLanv6Ip = "hdTunnelv6IPAddr";
        var txtTmpVal = false;
        var ipV4Flag = false;        
        var gatewayObj = document.getElementById("tf1_txtGwIpAddr");
        var ext = gatewayObj.value;
		var ipAddr = ext.substring (ext.indexOf("::") + 2,ext.length);		
		var txtIPAddrObj = document.getElementById("hdStaticRouteIP");		
		if (txtIPAddrObj && !txtIPAddrObj.disabled && (ext.indexOf("::") == 0))
		    {
		    txtIPAddrObj.value = ipAddr;
		    if(ipV4FormatCheck(ipAddr))
		        {
		        if(ipv4AddrValidate (txtIPAddrObj, 'IP', false, false, '', '', true) == true)
		            {
		            ipV4Flag=true;
		            }
		        }
		    }		    		
		if(ipV4Flag == false)
		    {		    
		    while(document.getElementById(txthdLanv6Ip+cnt))
		        {
		        txthdTunnelv6 = "hdTunnelv6IPAddr"+cnt;
		        txthdTunnelPrefix = "hdtunnelPrefix"+cnt;
		        if(ipv6SubnetValidation1(txthdTunnelv6,txthdTunnelPrefix,check)==true)
		            {
		            txtTmpVal=true;
		            }
		        cnt++;
		        }
		    }
        if(cnt>1 && txtTmpVal==false)
            {
            alert(LANG_LOCALE['10942']);
            return false;
            }
        }       
    }
    else if (selectedInt == "LAN")
        {
        cnt="1";
        
        var str = "hdLanv6IPAddr";
        while(document.getElementById(str+cnt))
            {
            setIp="hdLanv6IPAddr"+cnt
            setPrefix="hdLanv6Prefix"+cnt
            if(ipv6SubnetValidation1(setIp,setPrefix,check) == true) return true;
            cnt++;
            }
            
        alert(LANG_LOCALE['10942']);
        return false
        }
    else if (selectedInt == "sit0-WAN2")
    {
    var sit0Wan2 = $("#hdSit0Wan2").val();
    // If the Interface Link is not up then we show below condition msg
    if (sit0Wan2 == "0" || sit0Wan2 == "1")
        {
        alert("Selected interface is not having a valid IPv6 address or the link is not connected.");
        return false;
        }
    else
        {    
        cnt=1;
        var txthdLanv6Ip = "hdSitTunnelv6IPAddr";
        var txtTmpVal = false;
        var ipV4Flag = false;        
        var gatewayObj = document.getElementById("tf1_txtGwIpAddr");
        var ext = gatewayObj.value;
		var ipAddr = ext.substring (ext.indexOf("::") + 2,ext.length);		
		var txtIPAddrObj = document.getElementById("hdStaticRouteIP");		
		if (txtIPAddrObj && !txtIPAddrObj.disabled && (ext.indexOf("::") == 0))
		    {
		    txtIPAddrObj.value = ipAddr;
		    if(ipV4FormatCheck(ipAddr))
		        {
		        if(ipv4AddrValidate (txtIPAddrObj, 'IP', false, false, '', '', true) == true)
		            {
		            ipV4Flag=true;
		            }
		        }
		    }		    		
		if(ipV4Flag == false)
		    {		    
		    while(document.getElementById(txthdLanv6Ip+cnt))
		        {
		        txthdTunnelv6 = "hdSitTunnelv6IPAddr"+cnt;
		        txthdTunnelPrefix = "hdSittunnelPrefix"+cnt;
		        if(ipv6SubnetValidation1(txthdTunnelv6,txthdTunnelPrefix,check)==true)
		            {
		            txtTmpVal=true;
		            }
		        cnt++;
		        }
		    }
        if(cnt>1 && txtTmpVal==false)
            {
            alert(LANG_LOCALE['10942']);
            return false;
            }
        }       
    }
    else if (selectedInt == "WAN1")
        {
        var ifStatusWan1 = $("#hdIfStatusWAN1").val();
            // If the Interface Link is not up then we show below condition msg
            if (ifStatusWan1 == "0" || ifStatusWan1 == "1")
            {
            alert("Selected interface is not having a valid IPv6 address or the link is not connected.");
            return false;
            }
            else
            {
            var str = "hdWanv6IPAddr";
            cnt=1;
            while(document.getElementById(str+cnt))
                {
                setIp = "hdWanv6IPAddr"+cnt;
                setPrefix = "hdWanv6Prefix"+cnt;
                if ($("#"+setIp).val() != "" && $("#"+setPrefix).val() != "")
                {                
                    if(ipv6SubnetValidation1(setIp,setPrefix,check) == true) return true
                }
                cnt++
                }
            alert(LANG_LOCALE['10942']);
            return false;
            }
        }
    else if (selectedInt == "WAN2")
        {
        var ifStatusWan2 = $("#hdIfStatusWAN2").val();
            // If the Interface Link is not up then we show below condition msg
            if (ifStatusWan2 == "0" || ifStatusWan2 == "1")
            {
            alert("Selected interface is not having a valid IPv6 address or the link is not connected.");
            return false;
            }
            else
            {
                var str = "hdWan2v6IPAddr";
                cnt=1;
                while(document.getElementById(str+cnt))
                    {
                    setIp = "hdWan2v6IPAddr"+cnt;
                    setPrefix = "hdWan2v6Prefix"+cnt;
                    if ($("#"+setIp).val() != "" && $("#"+setPrefix).val() != "")
                    {
                        if(ipv6SubnetValidation1(setIp,setPrefix,check) == true) return true
                    }
                    cnt++
                    }
                alert(LANG_LOCALE['10942']);
                return false;
            }
        }
    return true;
}

