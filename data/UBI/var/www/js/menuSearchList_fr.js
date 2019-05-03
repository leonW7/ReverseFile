/*
 * File: menuSearchList.js
 * TeamF1 Inc, 2012
 * Created on 31th January 2013 - Sai Kumar D
 */
/* MenuStructure */
menuSearchList = {
    dashboard: {
        mainMenu: "État",
        secondLevelMenu: "Tableau de bord",
        thirdLevelMenu: "Tableau de bord",
        fourthLevelMenu: "",
        hrefAttrLink: "dashboard"
    },
    deviceInfo: {
        mainMenu: "État",
        secondLevelMenu: "Informations système",
        thirdLevelMenu: "Périphérique",
        fourthLevelMenu: "Système",
        hrefAttrLink: "deviceInfo"
    },
    lanInfo: {
        mainMenu: "État",
        secondLevelMenu: "Informations système",
        thirdLevelMenu: "Périphérique",
        fourthLevelMenu: "Réseau local",
        hrefAttrLink: "lanInfo"
    },
    wan1Info: {
        mainMenu: "État",
        secondLevelMenu: "Informations système",
        thirdLevelMenu: "Périphérique",
        fourthLevelMenu: "WAN1",
        hrefAttrLink: "wan1Info"
    },
    dmzInfo: {
        mainMenu: "État",
        secondLevelMenu: "Informations système",
        thirdLevelMenu: "Périphérique",
        fourthLevelMenu: "DMZ (Zone démilitarisée)",
        hrefAttrLink: "dmzInfo"
    },
    wan2Info: {
        mainMenu: "État",
        secondLevelMenu: "Informations système",
        thirdLevelMenu: "Périphérique",
        fourthLevelMenu: "WAN2",
        hrefAttrLink: "wan2Info"
    },
    wan3Info: {
        mainMenu: "État",
        secondLevelMenu: "Informations système",
        thirdLevelMenu: "Périphérique",
        fourthLevelMenu: "WAN3",
        hrefAttrLink: "wan3Info"
    },
    wirelessInfo: {
        mainMenu: "État",
        secondLevelMenu: "Informations système",
        thirdLevelMenu: "Périphérique",
        fourthLevelMenu: "Sans fil",
        hrefAttrLink: "wirelessInfo"
    },
    logInfo: {
        mainMenu: "État",
        secondLevelMenu: "Informations système",
        thirdLevelMenu: "Tous les journaux",
        fourthLevelMenu: "Journaux actuels",
        hrefAttrLink: "logInfo"
    },
    usbStatus: {
        mainMenu: "État",
        secondLevelMenu: "Informations système",
        thirdLevelMenu: "État USB",
        fourthLevelMenu: "",
        hrefAttrLink: "usbStatus"
    },
    dhcpClientInfoLan: {
        mainMenu: "État",
        secondLevelMenu: "Informations réseau",
        thirdLevelMenu: "Clients DHCP avec bail",
        fourthLevelMenu: "Clients concédés du réseau local",
        hrefAttrLink: "dhcpClientInfoLan"
    },
    dhcpClientInfoV6: {
        mainMenu: "État",
        secondLevelMenu: "Informations réseau",
        thirdLevelMenu: "Clients DHCP avec bail",
        fourthLevelMenu: "Clients concédés IPv6",
        hrefAttrLink: "dhcpClientInfoV6"
    },
    dhcpClientInfoDmz: {
        mainMenu: "État",
        secondLevelMenu: "Informations réseau",
        thirdLevelMenu: "Clients DHCP avec bail",
        fourthLevelMenu: "Clients de la DMZ",
        hrefAttrLink: "dhcpClientInfoDmz"
    },
    captivePortalSessions: {
        mainMenu: "État",
        secondLevelMenu: "Informations réseau",
        thirdLevelMenu: "Sessions du portail captif",
        fourthLevelMenu: "",
        hrefAttrLink: "captivePortalSessions"
    },
    activeSessions: {
        mainMenu: "État",
        secondLevelMenu: "Informations réseau",
        thirdLevelMenu: "Sessions actives",
        fourthLevelMenu: "",
        hrefAttrLink: "activeSessions"
    },
    activeVpns: {
        mainMenu: "État",
        secondLevelMenu: "Informations réseau",
        thirdLevelMenu: "VPN actifs",
        fourthLevelMenu: "Associations de sécurité IPsec",
        hrefAttrLink: "activeVpns"
    },
    activeSslVpns: {
        mainMenu: "État",
        secondLevelMenu: "Informations réseau",
        thirdLevelMenu: "VPN actifs",
        fourthLevelMenu: "Connexions VPN SSL",
        hrefAttrLink: "activeSslVpns"
    },
    activePptpVpns: {
        mainMenu: "État",
        secondLevelMenu: "Informations réseau",
        thirdLevelMenu: "VPN actifs",
        fourthLevelMenu: "Connexions PPTP VPN",
        hrefAttrLink: "activePptpVpns"
    },
    activeOpenVpns: {
        mainMenu: "État",
        secondLevelMenu: "Informations réseau",
        thirdLevelMenu: "VPN actifs",
        fourthLevelMenu: "Ouvrir les connexions VPN",
        hrefAttrLink: "activeOpenVpns"
    },
    activeL2tpVpns: {
        mainMenu: "État",
        secondLevelMenu: "Informations réseau",
        thirdLevelMenu: "VPN actifs",
        fourthLevelMenu: "Connexion VPN L2TP",
        hrefAttrLink: "activeL2tpVpns"
    },
    greTunnelsStatus: {
        mainMenu: "État",
        secondLevelMenu: "Informations réseau",
        thirdLevelMenu: "VPN actifs",
        fourthLevelMenu: "GRE Tunnel Status",
        hrefAttrLink: "greTunnelsStatus"
    },
    interfaces: {
        mainMenu: "État",
        secondLevelMenu: "Informations réseau",
        thirdLevelMenu: "Statistiques de l''interface",
        fourthLevelMenu: "",
        hrefAttrLink: "interfaces"
    },
    wirelessClients: {
        mainMenu: "État",
        secondLevelMenu: "Informations réseau",
        thirdLevelMenu: "Clients sans fil",
        fourthLevelMenu: "",
        hrefAttrLink: "wirelessClients"
    },
    deviceStatistics: {
        mainMenu: "État",
        secondLevelMenu: "Informations réseau",
        thirdLevelMenu: "Statistiques du périphérique",
        fourthLevelMenu: "",
        hrefAttrLink: "deviceStatistics"
    },
    wirelessStatistics: {
        mainMenu: "État",
        secondLevelMenu: "Informations réseau",
        thirdLevelMenu: "Statistiques du réseau sans fil",
        fourthLevelMenu: "",
        hrefAttrLink: "wirelessStatistics"
    },
    lanClients: {
        mainMenu: "État",
        secondLevelMenu: "Informations réseau",
        thirdLevelMenu: "Clients du réseau local",
        fourthLevelMenu: "",
        hrefAttrLink: "lanClients"
    },
    sessionLimitStatus: {
        mainMenu: "État",
        secondLevelMenu: "Informations réseau",
        thirdLevelMenu: "Session Limiting Status",
        fourthLevelMenu: "",
        hrefAttrLink: "sessionLimitStatus"
    },
    accessPoints: {
        mainMenu: "Sans fil",
        secondLevelMenu: "Général",
        thirdLevelMenu: "Points d''accès",
        fourthLevelMenu: "",
        hrefAttrLink: "accessPoints"
    },
    accessPointMacFilters: {
        mainMenu: "Sans fil",
        secondLevelMenu: "Général",
        thirdLevelMenu: "Points d''accès",
        fourthLevelMenu: "Filtre MAC",
        hrefAttrLink: "accessPointMacFilters"
    },
    profiles: {
        mainMenu: "Sans fil",
        secondLevelMenu: "Général",
        thirdLevelMenu: "Profils",
        fourthLevelMenu: "",
        hrefAttrLink: "profiles"
    },
    radioConfig: {
        mainMenu: "Sans fil",
        secondLevelMenu: "Général",
        thirdLevelMenu: "Paramètres carte réseau sans fil",
        fourthLevelMenu: "",
        hrefAttrLink: "radioConfig"
    },
    wmm: {
        mainMenu: "Sans fil",
        secondLevelMenu: "Avancé",
        thirdLevelMenu: "WMM",
        fourthLevelMenu: "",
        hrefAttrLink: "wmm"
    },
    wds: {
        mainMenu: "Sans fil",
        secondLevelMenu: "Avancé",
        thirdLevelMenu: "WDS",
        fourthLevelMenu: "",
        hrefAttrLink: "wds"
    },
    advancedWireless: {
        mainMenu: "Sans fil",
        secondLevelMenu: "Avancé",
        thirdLevelMenu: "Paramètres avancés",
        fourthLevelMenu: "",
        hrefAttrLink: "advancedWireless"
    },
    wps: {
        mainMenu: "Sans fil",
        secondLevelMenu: "Avancé",
        thirdLevelMenu: "WPS",
        fourthLevelMenu: "",
        hrefAttrLink: "wps"
    },
    /*fbWiFi: {
        mainMenu: "Sans fil",
        secondLevelMenu: "Avancé",
        thirdLevelMenu: "Facebook WiFi",
        fourthLevelMenu: "",
        hrefAttrLink: "fbWiFi"
    },Remove this comment if feature is required */
    lanSettings: {
        mainMenu: "Réseau",
        secondLevelMenu: "Réseau local",
        thirdLevelMenu: "Paramètres du réseau local",
        fourthLevelMenu: "",
        hrefAttrLink: "lanSettings"
    },
    lanDhcpReservedIps: {
        mainMenu: "Réseau",
        secondLevelMenu: "Réseau local",
        thirdLevelMenu: "Adresses IP réservées au DHCP pour le réseau local",
        fourthLevelMenu: "",
        hrefAttrLink: "lanDhcpReservedIps"
    },
    ipMacBinding: {
        mainMenu: "Réseau",
        secondLevelMenu: "Réseau local",
        thirdLevelMenu: "IP/MAC Binding",
        fourthLevelMenu: "",
        hrefAttrLink: "ipMacBinding"
    },
    igmpSetup: {
        mainMenu: "Réseau",
        secondLevelMenu: "Réseau local",
        thirdLevelMenu: "Configuration IGMP",
        fourthLevelMenu: "",
        hrefAttrLink: "igmpSetup"
    },
    igmpSnooping: {
        mainMenu: "Réseau",
        secondLevelMenu: "Réseau local",
        thirdLevelMenu: "Configuration IGMP",
        fourthLevelMenu: "IGMP Snooping",
        hrefAttrLink: "igmpSnooping"
    },
    upnp: {
        mainMenu: "Réseau",
        secondLevelMenu: "Réseau local",
        thirdLevelMenu: "UPnP",
        fourthLevelMenu: "",
        hrefAttrLink: "upnp"
    },
    jumboFrame: {
        mainMenu: "Réseau",
        secondLevelMenu: "Réseau local",
        thirdLevelMenu: "Trame Jumbo",
        fourthLevelMenu: "",
        hrefAttrLink: "jumboFrame"
    },
    vlanSettings: {
        mainMenu: "Réseau",
        secondLevelMenu: "Réseau local virtuel",
        thirdLevelMenu: "Paramètres du réseau local virtuel",
        fourthLevelMenu: "",
        hrefAttrLink: "vlanSettings"
    },
    portVlan: {
        mainMenu: "Réseau",
        secondLevelMenu: "Réseau local virtuel",
        thirdLevelMenu: "Réseau local virtuel par port",
        fourthLevelMenu: "",
        hrefAttrLink: "portVlan"
    },
    ipv4Wan1Settings: {
        mainMenu: "Réseau",
        secondLevelMenu: "Internet",
        thirdLevelMenu: "Paramètres de WAN1",
        fourthLevelMenu: "",
        hrefAttrLink: "ipv4Wan1Settings"
    },
    ipv4Wan2DmzSetting: {
        mainMenu: "Réseau",
        secondLevelMenu: "Internet",
        thirdLevelMenu: "Configuration WAN2 / DMZ",
        fourthLevelMenu: "",
        hrefAttrLink: "ipv4Wan2DmzSetting"
    },
    wan3Settings: {
        mainMenu: "Réseau",
        secondLevelMenu: "Internet",
        thirdLevelMenu: "Paramètres WAN3",
        fourthLevelMenu: "",
        hrefAttrLink: "wan3Settings"
    },
    wanMode: {
        mainMenu: "Réseau",
        secondLevelMenu: "Internet",
        thirdLevelMenu: "Mode WAN",
        fourthLevelMenu: "",
        hrefAttrLink: "wanMode"
    },
    simCardPin: {
        mainMenu: "Network",
        secondLevelMenu: "Internet",
        thirdLevelMenu: "SIM Card Authentication",
        fourthLevelMenu: "",
        hrefAttrLink: "simCardPin"
    },
    routingMode: {
        mainMenu: "Réseau",
        secondLevelMenu: "Internet",
        thirdLevelMenu: "Redirection",
        fourthLevelMenu: "",
        hrefAttrLink: "routingMode"
    },
    ipAliasing: {
        mainMenu: "Réseau",
        secondLevelMenu: "Internet",
        thirdLevelMenu: "Alias IP",
        fourthLevelMenu: "",
        hrefAttrLink: "ipAliasing"
    },
    dmzSettings: {
        mainMenu: "Réseau",
        secondLevelMenu: "Internet",
        thirdLevelMenu: "Paramètres de la DMZ",
        fourthLevelMenu: "",
        hrefAttrLink: "dmzSettings"
    },
    dmzDhcpReservedIps: {
        mainMenu: "Réseau",
        secondLevelMenu: "Internet",
        thirdLevelMenu: "Adresses IP réservées au DHCP pour la DMZ",
        fourthLevelMenu: "",
        hrefAttrLink: "dmzDhcpReservedIps"
    },
    dynamicDnsWan1Settings: {
        mainMenu: "Réseau",
        secondLevelMenu: "Internet",
        thirdLevelMenu: "DNS dynamique",
        fourthLevelMenu: "Paramètres WAN1 DNS dynamique",
        hrefAttrLink: "dynamicDnsWan1Settings"
    },
    dynamicDnsWan2Settings: {
        mainMenu: "Réseau",
        secondLevelMenu: "Internet",
        thirdLevelMenu: "DNS dynamique",
        fourthLevelMenu: "Paramètres WAN2 DNS dynamique",
        hrefAttrLink: "dynamicDnsWan2Settings"
    },
    dynamicDnsWan3Settings: {
        mainMenu: "Réseau",
        secondLevelMenu: "Internet",
        thirdLevelMenu: "DNS dynamique",
        fourthLevelMenu: "Paramètres WAN3 DNS dynamique",
        hrefAttrLink: "dynamicDnsWan3Settings"
    },
    bandwidthProfiles: {
        mainMenu: "Réseau",
        secondLevelMenu: "Internet",
        thirdLevelMenu: "Gestion du trafic",
        fourthLevelMenu: "Profils de bande passante",
        hrefAttrLink: "bandwidthProfiles"
    },
    trafficSelectors: {
        mainMenu: "Réseau",
        secondLevelMenu: "Internet",
        thirdLevelMenu: "Gestion du trafic",
        fourthLevelMenu: "Mise en forme du trafic",
        hrefAttrLink: "trafficSelectors"
    },
    bridgeBandwidthProfiles: {
        mainMenu: "Réseau",
        secondLevelMenu: "Internet",
        thirdLevelMenu: "Gestion du trafic",
        fourthLevelMenu: "Profils de bande passante du pont",
        hrefAttrLink: "bridgeBandwidthProfiles"
    },
    bridgeTrafficSelectors: {
        mainMenu: "Réseau",
        secondLevelMenu: "Internet",
        thirdLevelMenu: "Gestion du trafic",
        fourthLevelMenu: "Sélecteurs de trafic du pont",
        hrefAttrLink: "bridgeTrafficSelectors"
    },
    sessionLimit: {
        mainMenu: "Réseau",
        secondLevelMenu: "Internet",
        thirdLevelMenu: "Gestion du trafic",
        fourthLevelMenu: "Session Limit",
        hrefAttrLink: "sessionLimit"
    },
    bandwidthManagement: {
        mainMenu: "Réseau",
        secondLevelMenu: "Internet",
        thirdLevelMenu: "Gestion du trafic",
        fourthLevelMenu: "Gestion de la bande passante",
        hrefAttrLink: "bandwidthManagement"
    },
    staticRouting: {
        mainMenu: "Réseau",
        secondLevelMenu: "Redirection",
        thirdLevelMenu: "Acheminements statiques",
        fourthLevelMenu: "",
        hrefAttrLink: "staticRouting"
    },
    rip: {
        mainMenu: "Réseau",
        secondLevelMenu: "Redirection",
        thirdLevelMenu: "RIP",
        fourthLevelMenu: "",
        hrefAttrLink: "rip"
    },
    ospf: {
        mainMenu: "Réseau",
        secondLevelMenu: "Redirection",
        thirdLevelMenu: "OSPF ",
        fourthLevelMenu: "",
        hrefAttrLink: "ospf"
    },
    protocolBinding: {
        mainMenu: "Réseau",
        secondLevelMenu: "Redirection",
        thirdLevelMenu: "Association de protocoles",
        fourthLevelMenu: "",
        hrefAttrLink: "protocolBinding"
    },
    ipMode: {
        mainMenu: "Réseau",
        secondLevelMenu: "IPv6",
        thirdLevelMenu: "Mode IP",
        fourthLevelMenu: "",
        hrefAttrLink: "ipMode"
    },
    ipv6Wan1Settings: {
        mainMenu: "Réseau",
        secondLevelMenu: "IPv6",
        thirdLevelMenu: "Paramètres de WAN1 IPv6",
        fourthLevelMenu: "",
        hrefAttrLink: "ipv6Wan1Settings"
    },
    ipv6Wan2Settings: {
        mainMenu: "Réseau",
        secondLevelMenu: "IPv6",
        thirdLevelMenu: "Paramètres de WAN2 IPv6",
        fourthLevelMenu: "",
        hrefAttrLink: "ipv6Wan2Settings"
    },
    ipv6StaticRouting: {
        mainMenu: "Réseau",
        secondLevelMenu: "IPv6",
        thirdLevelMenu: "Routage statique",
        fourthLevelMenu: "",
        hrefAttrLink: "ipv6StaticRouting"
    },
    ospfV3: {
        mainMenu: "Réseau",
        secondLevelMenu: "IPv6",
        thirdLevelMenu: "OSPFv3",
        fourthLevelMenu: "",
        hrefAttrLink: "ospfV3"
    },
    ipv6ToIpv4: {
        mainMenu: "Réseau",
        secondLevelMenu: "IPv6",
        thirdLevelMenu: "Tunnellisation 6 à 4",
        fourthLevelMenu: "",
        hrefAttrLink: "ipv6ToIpv4"
    },
    isatapTunnels: {
        mainMenu: "Réseau",
        secondLevelMenu: "IPv6",
        thirdLevelMenu: "Tunnels ISATAP",
        fourthLevelMenu: "",
        hrefAttrLink: "isatapTunnels"
    },
    ipv6TunnelsStatus: {
        mainMenu: "Réseau",
        secondLevelMenu: "IPv6",
        thirdLevelMenu: "État des tunnels IPv6",
        fourthLevelMenu: "",
        hrefAttrLink: "ipv6TunnelsStatus"
    },
    ipv6LanSettings: {
        mainMenu: "Réseau",
        secondLevelMenu: "IPv6",
        thirdLevelMenu: "",
        fourthLevelMenu: "Paramètres du réseau local IPv6",
        hrefAttrLink: "ipv6LanSettings"
    },
    ipv6AddressPools: {
        mainMenu: "Réseau",
        secondLevelMenu: "IPv6",
        thirdLevelMenu: "Paramètres du réseau local IPv6",
        fourthLevelMenu: "Groupes d''adresses IPv6",
        hrefAttrLink: "ipv6AddressPools"
    },
    ipv6PrefixLength: {
        mainMenu: "Réseau",
        secondLevelMenu: "IPv6",
        thirdLevelMenu: "Paramètres du réseau local IPv6",
        fourthLevelMenu: "Préfixes pour la délégation de préfixes",
        hrefAttrLink: "ipv6PrefixLength"
    },
    routerAdvertisement: {
        mainMenu: "Réseau",
        secondLevelMenu: "IPv6",
        thirdLevelMenu: "Paramètres du réseau local IPv6",
        fourthLevelMenu: "Annonce du routeur",
        hrefAttrLink: "routerAdvertisement"
    },
    advertisementPrefixes: {
        mainMenu: "Réseau",
        secondLevelMenu: "IPv6",
        thirdLevelMenu: "Paramètres du réseau local IPv6",
        fourthLevelMenu: "Préfixes d''annonce",
        hrefAttrLink: "advertisementPrefixes"
    },
    policies: {
        mainMenu: "VPN",
        secondLevelMenu: "VPN IPSec",
        thirdLevelMenu: "Politiques",
        fourthLevelMenu: "",
        hrefAttrLink: "policies"
    },
    tunnelMode: {
        mainMenu: "VPN",
        secondLevelMenu: "VPN IPSec",
        thirdLevelMenu: "Mode Tunnel",
        fourthLevelMenu: "Mode Tunnel",
        hrefAttrLink: "tunnelMode"
    },
    splitDnsNames: {
        mainMenu: "VPN",
        secondLevelMenu: "VPN IPSec",
        thirdLevelMenu: "Mode Tunnel",
        fourthLevelMenu: "Noms Split DNS",
        hrefAttrLink: "splitDnsNames"
    },
    dhcpRange: {
        mainMenu: "VPN",
        secondLevelMenu: "VPN IPSec",
        thirdLevelMenu: "Plage DHCP",
        fourthLevelMenu: "",
        hrefAttrLink: "dhcpRange"
    },
    trustedCertificates: {
        mainMenu: "VPN",
        secondLevelMenu: "VPN IPSec",
        thirdLevelMenu: "Certificats",
        fourthLevelMenu: "Certificats d''authenticité",
        hrefAttrLink: "trustedCertificates"
    },
    easyVpnSetup: {
        mainMenu: "VPN",
        secondLevelMenu: "VPN IPSec",
        thirdLevelMenu: "Configuration VPN simple",
        fourthLevelMenu: "",
        hrefAttrLink: "easyVpnSetup"
    },
    oneToOneMapping: {
        mainMenu: "VPN",
        secondLevelMenu: "VPN IPSec",
        thirdLevelMenu: "Mappage One-to-One",
        fourthLevelMenu: "",
        hrefAttrLink: "oneToOneMapping"
    },
    activeSelfCertificates: {
        mainMenu: "VPN",
        secondLevelMenu: "VPN IPSec",
        thirdLevelMenu: "Certificats",
        fourthLevelMenu: "Autocertificats actifs",
        hrefAttrLink: "activeSelfCertificates"
    },
    selfCertificateRequest: {
        mainMenu: "VPN",
        secondLevelMenu: "VPN IPSec",
        thirdLevelMenu: "Certificats",
        fourthLevelMenu: "Demandes d''autocertificats",
        hrefAttrLink: "selfCertificateRequest"
    },
    pptpServer: {
        mainMenu: "VPN",
        secondLevelMenu: "VPN PPTP",
        thirdLevelMenu: "Serveur PPTP",
        fourthLevelMenu: "",
        hrefAttrLink: "pptpServer"
    },
    pptpClient: {
        mainMenu: "VPN",
        secondLevelMenu: "VPN PPTP",
        thirdLevelMenu: "Client PPTP",
        fourthLevelMenu: "",
        hrefAttrLink: "pptpClient"
    },
    pptpActiveUsers: {
        mainMenu: "VPN",
        secondLevelMenu: "VPN PPTP",
        thirdLevelMenu: "PPTP Active Users",
        fourthLevelMenu: "",
        hrefAttrLink: "pptpActiveUsers"
    },
    l2tpServer: {
        mainMenu: "VPN",
        secondLevelMenu: "VPN L2TP",
        thirdLevelMenu: "Serveur L2TP",
        fourthLevelMenu: "",
        hrefAttrLink: "l2tpServer"
    },
    l2tpClient: {
        mainMenu: "VPN",
        secondLevelMenu: "VPN L2TP",
        thirdLevelMenu: "Client L2TP",
        fourthLevelMenu: "",
        hrefAttrLink: "l2tpClient"
    },
    l2tpActiveUsers: {
        mainMenu: "VPN",
        secondLevelMenu: "VPN L2TP",
        thirdLevelMenu: "L2TP Active Users",
        fourthLevelMenu: "",
        hrefAttrLink: "l2tpActiveUsers"
    },
    sslVpnServer: {
        mainMenu: "VPN",
        secondLevelMenu: "VPN SSL",
        thirdLevelMenu: "Stratégie des serveurs VPN SSL",
        fourthLevelMenu: "",
        hrefAttrLink: "sslVpnServer"
    },
    sslVpnPortalLayouts: {
        mainMenu: "VPN",
        secondLevelMenu: "VPN SSL",
        thirdLevelMenu: "Mises en page du portail",
        fourthLevelMenu: "",
        hrefAttrLink: "sslVpnPortalLayouts"
    },
    sslVpnResources: {
        mainMenu: "VPN",
        secondLevelMenu: "VPN SSL",
        thirdLevelMenu: "Ressources ",
        fourthLevelMenu: "",
        hrefAttrLink: "sslVpnResources"
    },
    sslVpnClient: {
        mainMenu: "VPN",
        secondLevelMenu: "VPN SSL",
        thirdLevelMenu: "Client VPN SSL",
        fourthLevelMenu: "",
        hrefAttrLink: "sslVpnClient"
    },
    sslVpnClientRoutes: {
        mainMenu: "VPN",
        secondLevelMenu: "VPN SSL",
        thirdLevelMenu: "Routes des clients",
        fourthLevelMenu: "",
        hrefAttrLink: "sslVpnClientRoutes"
    },
    openVpnSettings: {
        mainMenu: "VPN",
        secondLevelMenu: "OpenVPN",
        thirdLevelMenu: "Paramètres OpenVPN",
        fourthLevelMenu: "",
        hrefAttrLink: "openVpnSettings"
    },
    openVpnLocalNetworks: {
        mainMenu: "VPN",
        secondLevelMenu: "OpenVPN",
        thirdLevelMenu: "Réseaux locaux",
        fourthLevelMenu: "",
        hrefAttrLink: "openVpnLocalNetworks"
    },
    openVpnRemoteNetworks: {
        mainMenu: "VPN",
        secondLevelMenu: "OpenVPN",
        thirdLevelMenu: "Réseaux distants",
        fourthLevelMenu: "",
        hrefAttrLink: "openVpnRemoteNetworks"
    },
    serverClientCertificate: {
        mainMenu: "VPN",
        secondLevelMenu: "OpenVPN",
        thirdLevelMenu: "Authentication",
        fourthLevelMenu: "Server/Client Certificate",
        hrefAttrLink: "serverClientCertificate"
    },
    tlsCertificates: {
        mainMenu: "VPN",
        secondLevelMenu: "OpenVPN",
        thirdLevelMenu: "Authentication",
        fourthLevelMenu: "TLS Key",
        hrefAttrLink: "tlsCertificates"
    },
    crlCertificates: {
        mainMenu: "VPN",
        secondLevelMenu: "OpenVPN",
        thirdLevelMenu: "Authentication",
        fourthLevelMenu: "CRL Certificate",
        hrefAttrLink: "crlCertificates"
    },
    omniSslConfiguration: {
        mainMenu: "VPN",
        secondLevelMenu: "OpenVPN",
        thirdLevelMenu: "OmniSSL Configuration",
        fourthLevelMenu: "",
        hrefAttrLink: "omniSslConfiguration"
    },
    omniSSLServerPolicy: {
        mainMenu: "VPN",
        secondLevelMenu: "OpenVPN",
        thirdLevelMenu: "OmniSSL Server Policy",
        fourthLevelMenu: "",
        hrefAttrLink: "omniSSLServerPolicy"
    },
    openvpnCertificates: {
        mainMenu: "VPN",
        secondLevelMenu: "OpenVPN",
        thirdLevelMenu: "OpenVPN Certificates",
        fourthLevelMenu: "",
        hrefAttrLink: "openvpnCertificates"
    },
    greTunnels: {
        mainMenu: "VPN",
        secondLevelMenu: "GRE",
        thirdLevelMenu: "Tunnels GRE",
        fourthLevelMenu: "",
        hrefAttrLink: "greTunnels"
    },
    getUsersDb: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Authentification",
        thirdLevelMenu: "Base de donnés utilisateurs interne",
        fourthLevelMenu: "Obtenir la base de données des utilisateurs",
        hrefAttrLink: "getUsersDb"
    },
    groups: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Authentification",
        thirdLevelMenu: "Base de donnés utilisateurs interne",
        fourthLevelMenu: "Groupes",
        hrefAttrLink: "groups"
    },
    users: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Authentification",
        thirdLevelMenu: "Base de donnés utilisateurs interne",
        fourthLevelMenu: "Utilisateurs",
        hrefAttrLink: "users"
    },
    radiusServer: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Authentification",
        thirdLevelMenu: "Serveur d''authentification externe",
        fourthLevelMenu: "Serveur RADIUS",
        hrefAttrLink: "radiusServer"
    },
    pop3Server: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Authentification",
        thirdLevelMenu: "Serveur d''authentification externe",
        fourthLevelMenu: "Serveur POP3",
        hrefAttrLink: "pop3Server"
    },
    pop3TrustedCa: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Authentification",
        thirdLevelMenu: "Serveur d''authentification externe",
        fourthLevelMenu: "CA de confiancePOP3",
        hrefAttrLink: "pop3TrustedCa"
    },
    ldapServer: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Authentification",
        thirdLevelMenu: "Serveur d''authentification externe",
        fourthLevelMenu: "LDAP Server",
        hrefAttrLink: "ldapServer"
    },
    adServer: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Authentification",
        thirdLevelMenu: "Serveur d''authentification externe",
        fourthLevelMenu: "Serveur AD",
        hrefAttrLink: "adServer"
    },
    ntDomain: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Authentification",
        thirdLevelMenu: "Serveur d''authentification externe",
        fourthLevelMenu: "Domaine NT",
        hrefAttrLink: "ntDomain"
    },
    radiusAccountingCfg: {
        mainMenu: "Security",
        secondLevelMenu: "Authentication",
        thirdLevelMenu: "Radius Accounting",
        fourthLevelMenu: "",
        hrefAttrLink: "radiusAccountingCfg"
    },
    radiusAccountingCfgServer: {
        mainMenu: "Security",
        secondLevelMenu: "Authentication",
        thirdLevelMenu: "Radius Accounting",
        fourthLevelMenu: "Radius Accounting Server",
        hrefAttrLink: "radiusAccountingCfgServer"
    },
    loginProfiles: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Authentification",
        thirdLevelMenu: "Profils d''ouverture de session",
        fourthLevelMenu: "",
        hrefAttrLink: "loginProfiles"
    },
    servicesRouteMgmt: {
        mainMenu: "Security",
        secondLevelMenu: "Authentication",
        thirdLevelMenu: "Services Route Management",
        fourthLevelMenu: "",
        hrefAttrLink: "servicesRouteMgmt"
    },
    contentFiltering: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Filtre du contenu Web",
        thirdLevelMenu: "Filtrage statique",
        fourthLevelMenu: "Filtrage statique",
        hrefAttrLink: "contentFiltering"
    },
    approvedUrls: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Filtre du contenu Web",
        thirdLevelMenu: "Filtrage statique",
        fourthLevelMenu: "URL autorisée",
        hrefAttrLink: "approvedUrls"
    },
    urlFilteringACL: {
        mainMenu: "Security",
        secondLevelMenu: "Web Content Filter",
        thirdLevelMenu: "URL Filtering ACL",
        fourthLevelMenu: "",
        hrefAttrLink: "urlFilteringACL"
    },
    blockedKeywords: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Filtre du contenu Web",
        thirdLevelMenu: "Filtrage statique",
        fourthLevelMenu: "Blocked Keywords",
        hrefAttrLink: "blockedKeywords"
    },
    approvedCategory: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Filtre du contenu Web",
        thirdLevelMenu: "Filtrage dynamique",
        fourthLevelMenu: "",
        hrefAttrLink: "approvedCategory"
    },
    firewallRules: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Pare-feu",
        thirdLevelMenu: "Règles de pare-feu",
        fourthLevelMenu: "Règles de pare-feu IPv4",
        hrefAttrLink: "firewallRules"
    },
    firewallRulesIpv6: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Pare-feu",
        thirdLevelMenu: "Règles de pare-feu",
        fourthLevelMenu: "Règles de pare-feu IPv6",
        hrefAttrLink: "firewallRulesIpv6"
    },
    bridgeFirewallRules: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Pare-feu",
        thirdLevelMenu: "Règles de pare-feu",
        fourthLevelMenu: "Règles de pare-feu de pont",
        hrefAttrLink: "bridgeFirewallRules"
    },
    blockedClients: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Pare-feu",
        thirdLevelMenu: "Clients bloqués",
        fourthLevelMenu: "",
        hrefAttrLink: "blockedClients"
    },
    schedules: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Pare-feu",
        thirdLevelMenu: "Calendriers",
        fourthLevelMenu: "",
        hrefAttrLink: "schedules"
    },
    customServices: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Pare-feu",
        thirdLevelMenu: "Services personnalisés",
        fourthLevelMenu: "",
        hrefAttrLink: "customServices"
    },
    algs: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Pare-feu",
        thirdLevelMenu: "ALG",
        fourthLevelMenu: "ALG",
        hrefAttrLink: "algs"
    },
    smtpAlg: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Pare-feu",
        thirdLevelMenu: "ALG",
        fourthLevelMenu: "ALG SMTP",
        hrefAttrLink: "smtpAlg"
    },
    approvedMailIds: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Pare-feu",
        thirdLevelMenu: "ALG",
        fourthLevelMenu: "ID d''adresses électroniques approuvés",
        hrefAttrLink: "approvedMailIds"
    },
    blockedMailIds: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Pare-feu",
        thirdLevelMenu: "ALG",
        fourthLevelMenu: "ID des adresses électroniques bloquées",
        hrefAttrLink: "blockedMailIds"
    },
    mailFiltering: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Pare-feu",
        thirdLevelMenu: "ALG",
        fourthLevelMenu: "Filtrage de messagerie électronique",
        hrefAttrLink: "mailFiltering"
    },
    vpnPassthrough: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Pare-feu",
        thirdLevelMenu: "Intercommunication VPN",
        fourthLevelMenu: "",
        hrefAttrLink: "vpnPassthrough"
    },
    applicationRules: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Pare-feu",
        thirdLevelMenu: "Redirection de port dynamique",
        fourthLevelMenu: "Règles d''application",
        hrefAttrLink: "applicationRules"
    },
    applicationRulesStatus: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Pare-feu",
        thirdLevelMenu: "Redirection de port dynamique",
        fourthLevelMenu: "État des règles d''application",
        hrefAttrLink: "applicationRulesStatus"
    },
    attackChecks: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Pare-feu",
        thirdLevelMenu: "Contrôle des attaques",
        fourthLevelMenu: "",
        hrefAttrLink: "attackChecks"
    },
    intelAmt: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Pare-feu",
        thirdLevelMenu: "Intel&#174; AMT",
        fourthLevelMenu: "",
        hrefAttrLink: "intelAmt"
    },
    ips: {
        mainMenu: "Sécurité",
        secondLevelMenu: "Pare-feu",
        thirdLevelMenu: "IPS",
        fourthLevelMenu: "",
        hrefAttrLink: "ips"
    },
    adminSettings: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Administration",
        thirdLevelMenu: "Paramètres système",
        fourthLevelMenu: "Paramètres système",
        hrefAttrLink: "adminSettings"
    },
    dateTime: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Administration",
        thirdLevelMenu: "Date et heure",
        fourthLevelMenu: "",
        hrefAttrLink: "dateTime"
    },
    sessionSettings: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Administration",
        thirdLevelMenu: "Paramètres de session",
        fourthLevelMenu: "",
        hrefAttrLink: "sessionSettings"
    },
    licenseUpdate: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Administration",
        thirdLevelMenu: "Mise à jour de la licence",
        fourthLevelMenu: "",
        hrefAttrLink: "licenseUpdate"
    },
    usbSharePorts: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Administration",
        thirdLevelMenu: "Ports de partage USB",
        fourthLevelMenu: "",
        hrefAttrLink: "usbSharePorts"
    },
    packageManager: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Administration",
        thirdLevelMenu: "Gestionnaire de pack",
        fourthLevelMenu: "",
        hrefAttrLink: "packageManager"
    },
    setLanguage: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Administration",
        thirdLevelMenu: "Définir la langue",
        fourthLevelMenu: "",
        hrefAttrLink: "setLanguage"
    },
    webAccessFilter: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Administration",
        thirdLevelMenu: "Gestion de l''interface graphique Web",
        fourthLevelMenu: "",
        hrefAttrLink: "webAccessFilter"
    },
    inbox: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Administration",
        thirdLevelMenu: "Service SMS",
        fourthLevelMenu: "Boîte de réception",
        hrefAttrLink: "inbox"
    },
    createSms: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Administration",
        thirdLevelMenu: "Service SMS",
        fourthLevelMenu: "Créer un SMS",
        hrefAttrLink: "createSms"
    },
    remoteManagement: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Gestion",
        thirdLevelMenu: "Gestion à distance",
        fourthLevelMenu: "",
        hrefAttrLink: "remoteManagement"
    },
    snmp: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Gestion",
        thirdLevelMenu: "SNMP",
        fourthLevelMenu: "SNMP",
        hrefAttrLink: "snmp"
    },
    snmpTrapList: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Gestion",
        thirdLevelMenu: "SNMP",
        fourthLevelMenu: "SNMP Trap List",
        hrefAttrLink: "snmpTrapList"
    },
    snmpAccessControllList: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Gestion",
        thirdLevelMenu: "SNMP",
        fourthLevelMenu: "Liste des contrôles d''accès",
        hrefAttrLink: "snmpAccessControllList"
    },
    snmpSystemInfo: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Gestion",
        thirdLevelMenu: "SNMP",
        fourthLevelMenu: "Informations système SNMP",
        hrefAttrLink: "snmpSystemInfo"
    },
    networkTools: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Gestion",
        thirdLevelMenu: "Diagnostics",
        fourthLevelMenu: "Network Tools (Outils réseau)",
        hrefAttrLink: "networkTools"
    },
    capturePackets: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Gestion",
        thirdLevelMenu: "Diagnostics",
        fourthLevelMenu: "Capturer les paquets",
        hrefAttrLink: "capturePackets"
    },
    systemCheck: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Gestion",
        thirdLevelMenu: "Diagnostics",
        fourthLevelMenu: "Contrôle du système",
        hrefAttrLink: "systemCheck"
    },
    powerSaving: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Gestion",
        thirdLevelMenu: "Économie d’énergie",
        fourthLevelMenu: "",
        hrefAttrLink: "powerSaving"
    },
    systemPc: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Microprogramme et config",
        thirdLevelMenu: "Mise à jour du microprogramme",
        fourthLevelMenu: "Utilisation du système (PC)",
        hrefAttrLink: "systemPc"
    },
    usb: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Microprogramme et config",
        thirdLevelMenu: "Mise à jour du microprogramme",
        fourthLevelMenu: "Utilisation de l''USB",
        hrefAttrLink: "usb"
    },
    checkUpdate: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Microprogramme et config",
        thirdLevelMenu: "Mise à jour du microprogramme",
        fourthLevelMenu: "Vérifier la mise à jour",
        hrefAttrLink: "checkUpdate"
    },
    backupRestore: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Microprogramme et config",
        thirdLevelMenu: "Sauvegarde/Restauration",
        fourthLevelMenu: "",
        hrefAttrLink: "backupRestore"
    },
    backupConfigurations: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Microprogramme et config",
        thirdLevelMenu: "Sauvegarde/Restauration",
        fourthLevelMenu: "Backup Settings (Sauvegarder les paramètres)",
        hrefAttrLink: "backupConfigurations"
    },
    softReboot: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Microprogramme et config",
        thirdLevelMenu: "Réinitialisation douce",
        fourthLevelMenu: "",
        hrefAttrLink: "softReboot"
    },
    facilityLogs: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Paramètres des journaux",
        thirdLevelMenu: "Services des journaux",
        fourthLevelMenu: "",
        hrefAttrLink: "facilityLogs"
    },
    routingLogs: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Paramètres des journaux",
        thirdLevelMenu: "Journaux de routage",
        fourthLevelMenu: "IPv4",
        hrefAttrLink: "routingLogs"
    },
    ipv6Logs: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Paramètres des journaux",
        thirdLevelMenu: "Journaux de routage",
        fourthLevelMenu: "IPv6",
        hrefAttrLink: "ipv6Logs"
    },
    systemLogs: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Paramètres des journaux",
        thirdLevelMenu: "Journaux système",
        fourthLevelMenu: "",
        hrefAttrLink: "systemLogs"
    },
    remoteLogging: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Paramètres des journaux",
        thirdLevelMenu: "Journalisation distante",
        fourthLevelMenu: "Adresse électronique",
        hrefAttrLink: "remoteLogging"
    },
    sysLogServer: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Paramètres des journaux",
        thirdLevelMenu: "Journalisation distante",
        fourthLevelMenu: "Syslog",
        hrefAttrLink: "sysLogServer"
    },
    smsEvent: {
        mainMenu: "Maintenance",
        secondLevelMenu: "Paramètres des journaux",
        thirdLevelMenu: "SMS Logging",
        fourthLevelMenu: "",
        hrefAttrLink: "smsEvent"
    }
};
