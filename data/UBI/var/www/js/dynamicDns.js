/*
 * File: dynamicDns.js
 * Created on 23rd nov 2012 - Vivek
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 * Modified on 20th Dec 2014 - Ramakrishna Reddy.
 */
/**
 * ddns field validation
 * OnSubmit event
 * @method ddnsValidate
 */

var timerId = null;
function ddnsValidate(frmId){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_dynDnsServer,"+LANG_LOCALE['30568'];
    txtFieldIdArr[1] = "tf1_userName,"+LANG_LOCALE['12144'];
    txtFieldIdArr[2] = "tf1_password,"+LANG_LOCALE['12333'];
    txtFieldIdArr[3] = "tf1_hostName,"+LANG_LOCALE['12020'];
    txtFieldIdArr[4] = "tf1_zoneName,"+LANG_LOCALE['30569'];
    txtFieldIdArr[5] = "tf1_forceUpdateInterval,"+LANG_LOCALE['30570'];
    txtFieldIdArr[6] = "tf1_url,"+LANG_LOCALE['30571'];
    txtFieldIdArr[7] = "tf1_uploadKey,"+LANG_LOCALE['30615'];
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

    var ddnsServiceType = comboSelectedValueGet ('tf1_dynDNSServiceType');
    if (ddnsServiceType != "1") {
        var userNameObj = document.getElementById('tf1_userName');
        if (userNameObj && !userNameObj.disabled) {
            var userNameVal = userNameObj.value;
            if (userNameVal.indexOf('#') != -1) {
                alert('# is not supported for User Name Field');
                return false;
            }
        }
        var pwdObj = document.getElementById('tf1_password');
        if (pwdObj && !pwdObj.disabled) {
            var pwdVal = pwdObj.value;
            if (pwdVal.indexOf('#') != -1) {
                alert('# is not supported for Password Field');
                return false;
            }
        }
        var hostNameObj = document.getElementById('tf1_hostName');
        if (hostNameObj && !hostNameObj.disabled) {
            var hostNameVal = hostNameObj.value;
            if (hostNameVal.indexOf('#') != -1) {
                alert('# is not supported for Host Name Field');
                return false;
            }
        }
    }

    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
    var forceUpdateObj = document.getElementById('tf1_forceUpdateInterval');
    if (forceUpdateObj && !forceUpdateObj.disabled) {
        if (numericValueRangeCheck(forceUpdateObj, '', '', 1, 30, true, LANG_LOCALE['30616'], LANG_LOCALE['10670']) == false) 
            return false;
    }

    var txtFieldIdArr2 = new Array();
    txtFieldIdArr2[0] = "tf1_additionalDDNS,Please enter a valid Additional DDNS Option";

    if (isProblemCharArrayCheck(txtFieldIdArr2, "'\"", NOT_SUPPORTED) == false) 
        return false;

    /*if (!validateFQDN('tf1_domainName1')) 
        return false;*/
        
    setHiddenChks(frmId);    
    return true;
    
}

/**
 * Dynamic DNS Service Type field validation
 * onChange event
 * @method selDDNSServiceType 
 */
function selDDNSServiceType ()
    {
        var selVal = parseInt (comboSelectedValueGet ('tf1_dynDNSServiceType'), 10);
        
        if (!selVal) 
            return;
        
        switch (selVal)
            {
                case 1: /* Disable */
                    fieldStateChangeWr ('tf1_dynDnsServer tf1_userName tf1_password tf1_hostName tf1_zoneName tf1_orayUserType tf1_orayDomain tf1_type tf1_wildcard tf1_externalIpCheck tf1_forceUpdateInterval tf1_url tf1_additionalDDNS tf1_uploadKey', '', '', '');
                    vidualDisplay('tf1_dynDnsServer tf1_userName tf1_password tf1_hostName tf1_zoneName tf1_orayUserType tf1_orayDomain tf1_type tf1_wildcard tf1_externalIpCheck tf1_forceUpdateInterval tf1_url tf1_additionalDDNS tf1_uploadKey', 'hide');
                    vidualDisplay('break_dynDnsServer break_userName break_password break_hostName break_zoneName break_orayUserType break_orayDomain break_type break_wildcard break_externalIpCheck break_forceUpdateInterval break_url break_additionalDDNS break_uploadKey', 'hide');
                    break;
                case 2: /* DynDns */
                    fieldStateChangeWr ('tf1_dynDnsServer tf1_zoneName tf1_orayUserType tf1_orayDomain tf1_url tf1_additionalDDNS tf1_uploadKey', '', 'tf1_userName tf1_password tf1_hostName tf1_type tf1_wildcard tf1_externalIpCheck tf1_forceUpdateInterval', '');

                    vidualDisplay('tf1_userName tf1_password tf1_hostName tf1_type tf1_wildcard tf1_externalIpCheck tf1_forceUpdateInterval', 'configRow');
                    vidualDisplay('break_userName break_password break_hostName break_type break_wildcard break_externalIpCheck break_forceUpdateInterval', 'break');

                    vidualDisplay('tf1_dynDnsServer tf1_zoneName tf1_orayUserType tf1_orayDomain tf1_url tf1_additionalDDNS tf1_uploadKey', 'hide');
                    vidualDisplay('break_dynDnsServer break_zoneName break_orayUserType break_orayDomain break_url break_additionalDDNS break_uploadKey', 'hide');
                    break;
                case 3: /* DlinkDdns */
                    fieldStateChangeWr ('tf1_dynDnsServer tf1_zoneName tf1_orayUserType tf1_orayDomain tf1_type tf1_wildcard tf1_url tf1_additionalDDNS tf1_uploadKey', '', 'tf1_userName tf1_password tf1_hostName tf1_externalIpCheck tf1_forceUpdateInterval', '');

                    vidualDisplay('tf1_userName tf1_password tf1_hostName tf1_externalIpCheck tf1_forceUpdateInterval', 'configRow');
                    vidualDisplay('break_userName break_password break_hostName break_externalIpCheck break_forceUpdateInterval', 'break');

                    vidualDisplay('tf1_dynDnsServer tf1_zoneName tf1_orayUserType tf1_orayDomain tf1_type tf1_wildcard tf1_url tf1_additionalDDNS tf1_uploadKey', 'hide');
                    vidualDisplay('break_dynDnsServer break_zoneName break_orayUserType break_orayDomain break_type break_wildcard break_url break_additionalDDNS break_uploadKey', 'hide');
                    break;
                case 4: /* FreeDns */
                    fieldStateChangeWr ('tf1_dynDnsServer tf1_zoneName tf1_orayUserType tf1_orayDomain tf1_type tf1_wildcard tf1_url tf1_additionalDDNS tf1_uploadKey', '', 'tf1_userName tf1_password tf1_hostName tf1_externalIpCheck tf1_forceUpdateInterval', '');

                    vidualDisplay('tf1_userName tf1_password tf1_hostName tf1_externalIpCheck tf1_forceUpdateInterval', 'configRow');
                    vidualDisplay('break_userName break_password break_hostName break_externalIpCheck break_forceUpdateInterval', 'break');

                    vidualDisplay('tf1_dynDnsServer tf1_zoneName tf1_orayUserType tf1_orayDomain tf1_type tf1_wildcard tf1_url tf1_additionalDDNS tf1_uploadKey', 'hide');
                    vidualDisplay('break_dynDnsServer break_zoneName break_orayUserType break_orayDomain break_type break_wildcard break_url break_additionalDDNS break_uploadKey', 'hide');
                    break;
                case 5: /* ZoneEdit */
                    fieldStateChangeWr ('tf1_dynDnsServer tf1_zoneName tf1_orayUserType tf1_orayDomain tf1_type tf1_wildcard tf1_url tf1_additionalDDNS tf1_uploadKey', '', 'tf1_userName tf1_password tf1_hostName tf1_externalIpCheck tf1_forceUpdateInterval', '');

                    vidualDisplay('tf1_userName tf1_password tf1_hostName tf1_externalIpCheck tf1_forceUpdateInterval', 'configRow');
                    vidualDisplay('break_userName break_password break_hostName break_externalIpCheck break_forceUpdateInterval', 'break');

                    vidualDisplay('tf1_dynDnsServer tf1_zoneName tf1_orayUserType tf1_orayDomain tf1_type tf1_wildcard tf1_url tf1_additionalDDNS tf1_uploadKey', 'hide');
                    vidualDisplay('break_dynDnsServer break_zoneName break_orayUserType break_orayDomain break_type break_wildcard break_url break_additionalDDNS break_uploadKey', 'hide');
                    break;
                case 6: /* No-Ip */
                    fieldStateChangeWr ('tf1_dynDnsServer tf1_zoneName tf1_orayUserType tf1_orayDomain tf1_type tf1_wildcard tf1_url tf1_additionalDDNS tf1_uploadKey', '', 'tf1_userName tf1_password tf1_hostName tf1_externalIpCheck tf1_forceUpdateInterval', '');

                    vidualDisplay('tf1_userName tf1_password tf1_hostName tf1_externalIpCheck tf1_forceUpdateInterval', 'configRow');
                    vidualDisplay('break_userName break_password break_hostName break_externalIpCheck break_forceUpdateInterval', 'break');

                    vidualDisplay('tf1_dynDnsServer tf1_zoneName tf1_orayUserType tf1_orayDomain tf1_type tf1_wildcard tf1_url tf1_additionalDDNS tf1_uploadKey', 'hide');
                    vidualDisplay('break_dynDnsServer break_zoneName break_orayUserType break_orayDomain break_type break_wildcard break_url break_additionalDDNS break_uploadKey', 'hide');
                    break;
                case 7: /* 3322.org */
                    fieldStateChangeWr ('tf1_dynDnsServer tf1_zoneName tf1_orayUserType tf1_orayDomain tf1_type tf1_url tf1_additionalDDNS tf1_uploadKey', '', 'tf1_userName tf1_password tf1_hostName tf1_wildcard tf1_externalIpCheck tf1_forceUpdateInterval', '');

                    vidualDisplay('tf1_userName tf1_password tf1_hostName tf1_wildcard tf1_externalIpCheck tf1_forceUpdateInterval', 'configRow');
                    vidualDisplay('break_userName break_password break_hostName break_wildcard break_externalIpCheck break_forceUpdateInterval', 'break');

                    vidualDisplay('tf1_dynDnsServer tf1_zoneName tf1_orayUserType tf1_orayDomain tf1_type tf1_url tf1_additionalDDNS tf1_uploadKey', 'hide');
                    vidualDisplay('break_dynDnsServer break_zoneName break_orayUserType break_orayDomain break_type break_url break_additionalDDNS break_uploadKey', 'hide');
                    break;
                case 8: /* EasyDns */
                    fieldStateChangeWr ('tf1_dynDnsServer tf1_zoneName tf1_orayUserType tf1_orayDomain tf1_type tf1_url tf1_additionalDDNS tf1_uploadKey', '', 'tf1_userName tf1_password tf1_hostName tf1_wildcard tf1_externalIpCheck tf1_forceUpdateInterval', '');

                    vidualDisplay('tf1_userName tf1_password tf1_hostName tf1_wildcard tf1_externalIpCheck tf1_forceUpdateInterval', 'configRow');
                    vidualDisplay('break_userName break_password break_hostName break_wildcard break_externalIpCheck break_forceUpdateInterval', 'break');

                    vidualDisplay('tf1_dynDnsServer tf1_zoneName tf1_orayUserType tf1_orayDomain tf1_type tf1_url tf1_additionalDDNS tf1_uploadKey', 'hide');
                    vidualDisplay('break_dynDnsServer break_zoneName break_orayUserType break_orayDomain break_type break_url break_additionalDDNS break_uploadKey', 'hide');
                    break;
                case 9: /* TZO.com */
                    fieldStateChangeWr ('tf1_dynDnsServer tf1_zoneName tf1_orayUserType tf1_orayDomain tf1_type tf1_wildcard tf1_url tf1_additionalDDNS tf1_uploadKey', '', 'tf1_userName tf1_password tf1_hostName tf1_externalIpCheck tf1_forceUpdateInterval', '');

                    vidualDisplay('tf1_userName tf1_password tf1_hostName tf1_externalIpCheck tf1_forceUpdateInterval', 'configRow');
                    vidualDisplay('break_userName break_password break_hostName break_externalIpCheck break_forceUpdateInterval', 'break');

                    vidualDisplay('tf1_dynDnsServer tf1_zoneName tf1_orayUserType tf1_orayDomain tf1_type tf1_wildcard tf1_url tf1_additionalDDNS tf1_uploadKey', 'hide');
                    vidualDisplay('break_dynDnsServer break_zoneName break_orayUserType break_orayDomain break_type break_wildcard break_url break_additionalDDNS break_uploadKey', 'hide');
                    break;
                case 10: /* DynSip */
                    fieldStateChangeWr ('tf1_dynDnsServer tf1_zoneName tf1_orayUserType tf1_orayDomain tf1_type tf1_wildcard tf1_url tf1_additionalDDNS tf1_uploadKey', '', 'tf1_userName tf1_password tf1_hostName tf1_externalIpCheck tf1_forceUpdateInterval', '');

                    vidualDisplay('tf1_userName tf1_password tf1_hostName tf1_externalIpCheck tf1_forceUpdateInterval', 'configRow');
                    vidualDisplay('break_userName break_password break_hostName break_externalIpCheck break_forceUpdateInterval', 'break');

                    vidualDisplay('tf1_dynDnsServer tf1_zoneName tf1_orayUserType tf1_orayDomain tf1_type tf1_wildcard tf1_url tf1_additionalDDNS tf1_uploadKey', 'hide');
                    vidualDisplay('break_dynDnsServer break_zoneName break_orayUserType break_orayDomain break_type break_wildcard break_url break_additionalDDNS break_uploadKey', 'hide');
                    break;
                case 11: /* Custom */
                    fieldStateChangeWr ('tf1_zoneName tf1_orayUserType tf1_orayDomain tf1_type tf1_wildcard tf1_externalIpCheck tf1_uploadKey', '', 'tf1_dynDnsServer tf1_userName tf1_password tf1_hostName tf1_forceUpdateInterval tf1_url tf1_additionalDDNS', '');

                    vidualDisplay('tf1_dynDnsServer tf1_userName tf1_password tf1_hostName tf1_forceUpdateInterval tf1_url tf1_additionalDDNS', 'configRow');
                    vidualDisplay('break_dynDnsServer break_userName break_password break_hostName break_forceUpdateInterval break_url break_additionalDDNS', 'break');

                    vidualDisplay('tf1_zoneName tf1_orayUserType tf1_orayDomain tf1_type tf1_wildcard tf1_externalIpCheck tf1_uploadKey', 'hide');
                    vidualDisplay('break_zoneName break_orayUserType break_orayDomain break_type break_wildcard break_externalIpCheck break_uploadKey', 'hide');
                    break;
                case 12: /* Oray */
                    fieldStateChangeWr ('tf1_dynDnsServer tf1_hostName tf1_zoneName tf1_type tf1_wildcard tf1_externalIpCheck tf1_forceUpdateInterval tf1_url tf1_additionalDDNS tf1_uploadKey', '', 'tf1_userName tf1_password tf1_orayUserType tf1_orayDomain', '');

                    vidualDisplay('tf1_userName tf1_password tf1_orayUserType tf1_orayDomain', 'configRow');
                    vidualDisplay('break_userName break_password break_orayUserType break_orayDomain', 'break');

                    vidualDisplay('tf1_dynDnsServer tf1_hostName tf1_zoneName tf1_type tf1_wildcard tf1_externalIpCheck tf1_forceUpdateInterval tf1_url tf1_additionalDDNS tf1_uploadKey', 'hide');
                    vidualDisplay('break_dynDnsServer break_hostName break_zoneName break_type break_wildcard break_externalIpCheck break_forceUpdateInterval break_url break_additionalDDNS break_uploadKey', 'hide');
                    break;
                case 13: /* Dynamic Update */
                    fieldStateChangeWr ('tf1_orayUserType tf1_userName tf1_password tf1_orayDomain tf1_type tf1_wildcard tf1_url tf1_additionalDDNS', '', 'tf1_dynDnsServer tf1_hostName tf1_zoneName tf1_externalIpCheck tf1_forceUpdateInterval tf1_uploadKey', '');

                    vidualDisplay('tf1_dynDnsServer tf1_hostName tf1_zoneName tf1_externalIpCheck tf1_forceUpdateInterval tf1_uploadKey', 'configRow');
                    vidualDisplay('break_dynDnsServer break_hostName break_zoneName break_externalIpCheck break_forceUpdateInterval break_uploadKey', 'break');

                    vidualDisplay('tf1_orayUserType tf1_userName tf1_password tf1_orayDomain tf1_type tf1_wildcard tf1_url tf1_additionalDDNS', 'hide');
                    vidualDisplay('break_orayUserType break_userName break_password break_orayDomain break_type break_wildcard break_url break_additionalDDNS', 'hide');
                    break;
            }
    }


// Call onload
window.onload = function(){
    onloadCall();
    selDDNSServiceType ();
}

function dynamicDnsOnReset(){
	selDDNSServiceType ();
}

function getDDNSStatus ()
	{
	var request;
	try 
		{  // Firefox, Opera 8.0+, Safari
		request=new XMLHttpRequest();
		}
		catch (e)
  			{	// Internet Explorer
			try
				{
			    request=new ActiveXObject("Msxml2.XMLHTTP");
    			}
  				catch (e)
    				{
    				try
						{
						request=new ActiveXObject("Microsoft.XMLHTTP");
						}
						catch (e)
      						{
							window.status = "Your browser does not support AJAX!";
							return false;
      						}
					}
				}
	request.onreadystatechange=function()
		{
		if(request.readyState === 4)
            {
            if (request.status === 200)
                {
			        var hdCurrentChnObj = document.getElementById ('tf1_ddnsStatus');
                    var response = request.responseText;
                    // If the ajax call response is having login page html content, then we should redirect to index page.
                    if (response.search("button.login.Users") != -1)
                        {
                            if ($(".midWidth2 div.msgError p").length > 0 && $(".midWidth2 div.msgError p").html() != '') 
						        {
							        window.location="platform.cgi?page=index.html&redirectStatusMessage="+$(".midWidth2 div.msgError p").html();
                                    return false;
						        }
                            else
                                {
                                    window.location="platform.cgi?page=index.html";
                                    return false;
                                }
                        }
                    tf1_ddnsStatus.innerHTML = response;
                }
			}
		}
    var dynaWan = document.getElementById("hdDynaWan").value;
    var dynDNSService = document.getElementById("hdDynDNSService").value;
	request.open("GET","?page=getDDNSStatus.html&dynaWan="+dynaWan+"&dynDNSService="+dynDNSService+"&time=" + new Date(),true);
	request.send(null);
	}

function getCurrDDNSStatus ()
	{
    getDDNSStatus ();
	if (timerId) { clearTimeout(timerId) }
        timerId = setTimeout ("getCurrDDNSStatus ()", 2000);    
   }
