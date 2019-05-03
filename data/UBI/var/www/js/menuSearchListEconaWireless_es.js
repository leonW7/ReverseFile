/*
 *  * This JS file indicates to delete or add related wireless econa devices 
 *   */  
delete menuSearchList["ipv4Wan1Settings"];
delete menuSearchList["ipv4Wan2DmzSetting"];
delete menuSearchList["wan3Settings"];
delete menuSearchList["captivePortalSessions"];
delete menuSearchList["rip"];
delete menuSearchList["ospf"];
delete menuSearchList["protocolBinding"];
delete menuSearchList["ipv6Wan2Settings"];
delete menuSearchList["ospfV3"];
delete menuSearchList["wan1Info"];
delete menuSearchList["wan2Info"];
delete menuSearchList["wan3Info"];
delete menuSearchList["dynamicDnsWan1Settings"];
delete menuSearchList["dynamicDnsWan2Settings"];
delete menuSearchList["dynamicDnsWan3Settings"];
delete menuSearchList["bridgeBandwidthProfiles"];
delete menuSearchList["bridgeTrafficSelectors"];
delete menuSearchList["ipv6Wan1Settings"];
delete menuSearchList["bridgeFirewallRules"];
delete menuSearchList["radiusAccountingCfg"];
delete menuSearchList["radiusAccountingCfgServer"];
menuSearchList["ipv6Wan1Settings"] = {
    'mainMenu': "Red",
    'secondLevelMenu': "IPv6",
    'thirdLevelMenu': "Parámetros Wan de IPv6",
    'fourthLevelMenu': "",
    'hrefAttrLink': "ipv6Wan1Settings"
};
menuSearchList["ipv4Wan1Settings"] = {
    'mainMenu': "Red",
    'secondLevelMenu': "Internet",
    'thirdLevelMenu': "Parámetros de WAN",
    'fourthLevelMenu': "",
    'hrefAttrLink': "ipv4Wan1Settings" 
};
menuSearchList["dynamicDnsWan1Settings"] = {
    'mainMenu': "Red",
    'secondLevelMenu': "Internet",
    'thirdLevelMenu': "DNS dinámico",
    'fourthLevelMenu': "Dynamic DNS WAN Settings",
    'hrefAttrLink': "dynamicDnsWan1Settings"
};
menuSearchList["wan2Info"] = {
    'mainMenu': "Estado",
    'secondLevelMenu': "Información del sistema",
    'thirdLevelMenu': "Dispositivo",
    'fourthLevelMenu': "WAN de relevo",
    'hrefAttrLink': "wan2Info" 
};
menuSearchList["wan1Info"] = {
    'mainMenu': "Estado",
    'secondLevelMenu': "Información del sistema",
    'thirdLevelMenu': "Dispositivo",
    'fourthLevelMenu': "WAN dedicada",
    'hrefAttrLink': "wan1Info" 
};
menuSearchList["wan3Settings"] = {
    'mainMenu': "Red",
    'secondLevelMenu': "Internet",
    'thirdLevelMenu': "Parámetros de WAN de relevo",
    'fourthLevelMenu': "",
    'hrefAttrLink': "wan3Settings" 
};
