/*
 *  * This JS file indicates to delete or add related wireless econa devices 
 *   */  
delete menuSearchList["wan3Settings"];
delete menuSearchList["captivePortalSessions"];
delete menuSearchList["rip"];
delete menuSearchList["ospf"];
delete menuSearchList["protocolBinding"];
delete menuSearchList["ospfV3"];
delete menuSearchList["wan3Info"];
delete menuSearchList["dynamicDnsWan1Settings"];
delete menuSearchList["dynamicDnsWan2Settings"];
delete menuSearchList["dynamicDnsWan3Settings"];
delete menuSearchList["bridgeBandwidthProfiles"];
delete menuSearchList["bridgeTrafficSelectors"];
delete menuSearchList["bridgeFirewallRules"];
delete menuSearchList["radiusAccountingCfg"];
delete menuSearchList["radiusAccountingCfgServer"];
menuSearchList["dynamicDnsWan1Settings"] = {
    'mainMenu': "Network",
    'secondLevelMenu': "Internet",
    'thirdLevelMenu': "Dynamic DNS",
    'fourthLevelMenu': "Dynamic DNS WAN Settings",
    'hrefAttrLink': "dynamicDnsWan1Settings"
};
menuSearchList["wan3Settings"] = {
    'mainMenu': "Network",
    'secondLevelMenu': "Internet",
    'thirdLevelMenu': "Rollover WAN Settings",
    'fourthLevelMenu': "",
    'hrefAttrLink': "wan3Settings" 
};
