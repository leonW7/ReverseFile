LuaQ                *      A@  @    A�  @    A�  @    A  @    A@ � E   �� \� �   �� �� �   �  �@  �@ �         ǀ ��  �� �  �  �@ �@ �   �    ǀ �� ��  �       require    teamf1lualib/nimfView %   teamf1lualib/ipv6_option1Settings_bl %   teamf1lualib/ipv6_option2Settings_bl    teamf1lualib/errorMap    com.teamf1.bl.ipv6.wan.option1    com.teamf1.bl.ipv6.wan.option2    com.teamf1.core.errorMap    wanV6SetupGet    wanV6StatusGet    nimf6CfgSave    nimf6CfgInit    ipModeCfgInputVal    nimf6CfgInputVal    nimf6Wan2CfgSave    nimf6Wan2CfgInit            u     w  J   �   �   A  � ŀ  ��� @ ܀�A @  �A  �E�  F��� � \��������A �� �B �B �� � �� ��� �  @U���� C���B ��C�� � A �B �B ��C�� C A� �B ��  ��@� C @  �� ������ �B ��C�� � E� F�ZC    �A� �B �B ��C�� C E� F��ZC    �A� �B �B ��C�� � E� F�ZC    �A� �B �B ��C�� C E� F��ZC    �A� �B �B ��C�� � E� F�ZC    �A� �B ���@H 4��B ��C�� � A� �B ��  ��@�B C @  �C  ������ �� �� ���� @I@���	 �� ��I�� J���� �� ���� @J@���
 ��  ��@� C @  �C ������
 ��
 ƁK��
 �K�B ��C��  [C   �A� �B �B ��C�� C [C�  �A� �B �� ��L�  AC �� @ �B ��C�� � [C�  �A� �B �� ��M N���B ��C�� C A� �B @��� ��M�N���B ��C�� C A �B �	��� ��M@O���B ��C�� C A� �B ���� ��M�O���B ��C�� C A �B  ��� ��M@P���B ��C�� C A� �B @��� ��C�� C A �B �� �BQ�Q���B ��C�� � A �B �	��� �BQ N���B ��C�� � AC �B ���� �BQ�N���B ��C�� � A� �B  ��� �BQ@O���B ��C�� � A� �B @��B ��C�� � A �B �B ��C�� C E� F�ZC    �A� �B �B ��C�� � E� FC�ZC    �A� �B ����S@
��B ��C�� � A� �B �B ��C��  A� �B ��  ��@�B C @  �C  ������ �� ��T N���B ��C�� � A �B @��� ��T�Q@��B ��C�� C A �B �� ��    A �B��B �B �BV�� � �B� � [   )   AddressFamily = 10 and LogicalIfName = '    '    db    getRowWhere 	   NimfConf (   AddressFamily = 2 and LogicalIfName = '    NimfConf.ConnectionType    threeg    printCLIError <   Note : No IPv6 information as WAN2 is configured as threeG.    ipModeCfgInputVal    NimfConf.ConnectionType6 
   ifStatic6    resTab    insertField    IPv6 Connection Type    Static IPv6    Static IPv6 Configuration     	   setupRow 	   ifStatic    LogicalIfName='    ' and AddressFamily=10    IPv6 Address    ifStatic.StaticIp    IPv6 Prefix Length    ifStatic.PrefixLength    Default IPv6 Gateway    ifStatic.Gateway    Primary DNS Server    ifStatic.PrimaryDns    Secondary DNS Server    ifStatic.SecondaryDns    pppoe6    PPPoE over IPv6 	   tonumber    pppoe6.PppoeSessions       �?   Separate Session for IPv6    pppoe6.UserName    pppoe6.Password        @!   Common Session for IPv4 and IPv6    commonSetupRow    PppoeProfile "   ' AND ProfileName='pppoeProfile1'    PppoeProfile.UserName    PppoeProfile.Password    PppoeSessions 	   UserName    string    gsub    .    * 	   Password    pppoe6.AuthOpt    1    Authentication Type    Auto-negotiate    2    PAP    3    CHAP    4    MS-CHAP    5 
   MS-CHAPv2    restab    Unknown    pppoe6.Dhcpv6Opt    0    Dhcpv6 Options    disable dhcpv6    stateless dhcpv6    statefull dhcpv6 (   stateless dhcpv6 with Prefix delegation    pppoe6.PrimaryDns    pppoe6.SecondaryDns    dhcp6c    Dynamic IPv6 (DHCP) "   Dynamic IPv6 (DHCP) Configuration    dhcpv6c    dhcpv6c.statelessMode %   Stateless Address Auto Configuration    Enabled $   Stateful Address Auto Configuration    printLabel    IPv6      Setup    print                             y   �     �  J   �   �@     A�  �@��  AAA ����A� �  ��  U����  �A�A  ������A � ��A � �A �� � �� ܁� �  @[��C@�@ ���  ��C��@ ��  � ��C@�  ��� ��  W@�@�E� F��� �B Ƃ� �A� � � �܂ ��\B E� F��� �B Ƃ� �A� � �C �܂ ��\B E� F��� �B Ƃ� �A� � �� �܂ ��\B E� F��� �B Ƃ� �A� � �� �܂ ��\B E� F��� �B Ƃ� �A� � � �܂ ��\B E� F��� �B Ƃ� �A� � �C �܂ ��\B E� �� �����	 W@���E� F��� �B Ƃ� �A� �C	 �܂ ��\B E�  F���	 �
    AC
 �B�\��G�	 E�
 F���� �   \B E�
 F���� �B �	 �KC    �  \B A� �  ���D@��  LAC �
 �  � ����  ��  LAC �
 �  � ����  @���LB�FD��� Ƅ�W@�	 �Ƅ�W �	@��D � ��A� �����	��W�� �@M	� �� E ��	!�  ��  FCW@�� �FC����E�  F��C �
    A� �C�\��W@����@�FC@���E�  F��C �
    A� �C�\��W@�  ��E�
 F���� � D   �  \C FC@���E�  F��C ��    A� �C�\��G�	 E�	 F�W@�@ � ��	�� A
 �  ��  ĄE�  FD��� � � \� ��E � \� @���E� F��D ��    �	�� \��G� E� Z  ��E� K��D \���C�  ��  @�E� K��\D ��
 ��J�� � [D�  �A  �C @�E�  F��C ��    A� �C�\��G�	 E�	 W@�@�E�
 F���� �� �	 PD    �  \C E�  F�� ��    A� �C�\��G�	 E�	 W@���E�
 F���� �C �	 �TD    �  \C E�
 F���� �� �	 UD    �  \C EC �� �  � �\C E�
 F��� �� \C� � Y       )   AddressFamily = 10 and LogicalIfName = '    '    db    getRowWhere 	   NimfConf (   AddressFamily = 2 and LogicalIfName = '    NimfConf.ConnectionType    threeg    printCLIError <   Note : No IPv6 information as WAN2 is configured as threeG.    ipModeCfgInputVal    NimfConf.ConnectionType6 
   ifStatic6    Static IPv6    dhcp6c    Dynamic IPv6 (DHCP)    pppoe6    PPPoE over IPv6    /pfrm2.0/bin/nimfStatus    /tmp/system.db     util    appendDebugOut    Exec =     os    execute          WAN1 2 	    WAN1 10     WAN2 2 	    WAN2 10     WAN3 2 	    WAN3 10    ipMode 
   IPV6_MODE    /pfrm2.0/bin/iprouteIPv6GwAdd    DB_FILE_NAME 	   stat6Row    NimfStatus    LogicalIfName = '    ' and AddressFamily=10    resTab    insertField    IPv6 Connection Type    IPv6 Connection State    NimfStatus.Nimfstatus            getRowsWhere    ipAddressTable    PPPOE6' and AddressFamily = 10    ' and AddressFamily = 10    pairs       �?   ipAddressTable.ipAddress    /    ipAddressTable.ipv6PrefixLen    ,  3   ' and addressFamily = '10' and ipv6PrefixLen != '' 9   PPPOE6' and addressFamily = '10' and ipv6PrefixLen != ''    IPv6 Address/Prefix    defaultRouters    LogicalIfName='    ' and addressFamily=10    defaultRouters.nextHopGateway    getAttributeWhere    Pppoe6    PppoeSessions 	   tonumber        @   file    io    open    /tmp/pppoe6CommonSessionGW    .    r    read    *all    close    Default IPv6 Gateway    resolverConfig    Primary DNS Server    resolverConfig.nameserver1    Secondary DNS Server    resolverConfig.nameserver2    printLabel    IPv6      Status    print                     �   D   {   A   �@  �@  �  F�@ �  A �A E� F��� � \�����	�����	����A �A  � �AA� � ��E� F�@@ �B  ^ �ADW�� �E� � \B B  ^ C��B ł �B� @ �� ܂ @�ł   �܂ W�� ���  �B �  � �BF ��  �	�ƌ	@G��BF 	���BB 	�����B 	��ƂH 	����I 	���ƂI 	����J 	�����@ 	����G 	���  ���   ܂ @ ��� �� � ܂ � ��� @ �A@ ��A    �	@G�� �K@  � �A � � �@  � �LA� � � B ���  @� � �� �MA�  � @�� � 7      ERROR     	   tonumber    Pppoe6.PppoeSessions        @7   LogicalIfName = 'WAN1' AND ProfileName='pppoeProfile1'    db    getRowWhere    PppoeProfile    Pppoe6.UserName    PppoeProfile.UserName    Pppoe6.Password    PppoeProfile.Password -   LogicalIfName = 'WAN1' AND AddressFamily='2' 	   NimfConf    returnCodes    NIL    NimfConf.ConnectionType    pppoe    printCLIError (   Please configure IPv4 ISP type as PPPOE    getAttributeWhere    IdleTimeOutFlag         :   Please disable the Idle time out configured in Ipv4 PPPOE    NimfConf.ConnectionType6    pppoe6    3    NimfConf.LogicalIfName    WAN1    option1Settings.conType    option1Settings.userName    option1Settings.password    option1Settings.primaryDns    Pppoe6.PrimaryDns    option1Settings.secondaryDns    Pppoe6.SecondaryDns &   option1Settings.authenticationOptions    Pppoe6.AuthOpt    option1Settings.dhcpOptions    Pppoe6.Dhcpv6Opt    option1Settings.pppoeSessions    option1Settings.wanPort    option1SectionSet    errorStringGet    OK 	   nimfView    ipv6WanConfig    1    edit    getAttribute    stringsMap 	   stringId 	   LANGUAGE    save                     H  M       J   �   �@  ƀ��  ܀ @ �� �  � � � �          �	   nimfView    ipv6WanConfigGet    WAN1    NimfConf._ROWID_                     O  V       E   F@� ��  ��   \� �@�  A ��� �� �@ �   �  � � �   �       db    getRow    networkInfo    _ROWID_    1    networkInfo.netWorkMode    printCLIError F   Please Set IP Mode to IPv4/IPv6 to configure IPv6 WAN Configurations.                     X  �    �  E   F@� ��  ��   \� �@�  A ��� �� �@ �   �  � B @B�8���B W�B� ���B  C@��� �@ �@ �   �  @
��  �@ ƀ��B A� �� � G � ǀ �� W�����   � �A A� �� �� ܀�� ��    AA A�@ �   �  �@ ƀ��B ܀ � �W�D��ŀ   AA A�@ �   �  ��F W�B� ���F  C ��� �  �@ �   �  �@G W�B� ��@G  C@��� �� �@ �   �  @
��  �@ ƀ�AG A� �� � G � ǀ �� W�����   � �A A� �� �� ܀�� ��    A� A�@ �   �  �@ ƀ�AG ܀ � �W�D��ŀ   A A�@ �   �  �@H W�B� ��@H  C@��� �� �@ �   �  @
��  �@ ƀ�AH A� �� � G � ǀ �� W�����   � �A A� �� �� ܀�� ��    A� A�@ �   �  �@ ƀ�AH ܀ � �W�D��ŀ   A� A�@ �   �  � I W�B� �� I  C@��� �@	 �@ �   �  �6��  �@ ƀ�I A� �� � G � ǀ �� W�����   � �A A� �� �� ܀�� ��    A�	 A�@ �   �  �@ ƀ�I ܀ � �W�D�-�ŀ   A�	 A�@ �   �  �+�� B  J���@J W�B� ��@J  C ��� ��
 �@ �   �  ��J  A�'��@J  K�&��� �@ �@ �   �  @%�� B �K�$���K W C� ���K �B ��� �  �@ �   �  ��K @L@���L W C� ���L �B ��� �� �@ �   �  � M W C� �� M �B ��� �@ �@ �   �  ��M  K����M W�B� ���M  C@��� �  �@ �   �  @
��  �@ ƀ��M A� �� � G � ǀ �� W�����   � �A A� �� �� ܀�� ��    AA A�@ �   �  �@ ƀ��M ܀ � �W�D��ŀ   AA A�@ �   �  ��N W�B� ���N  C@��� �� �@ �   �  @
��  �@ ƀ��N A� �� � G � ǀ �� W�����   � �A A� �� �� ܀�� ��    A A�@ �   �  �@ ƀ��N ܀ � �W�D��ŀ   A A�@ �   �  � � �   � =      db    getRow    networkInfo    _ROWID_    1    networkInfo.netWorkMode    printCLIError F   Please Set IP Mode to IPv4/IPv6 to configure IPv6 WAN Configurations.    NimfConf.ConnectionType6 
   ifStatic6    ifStatic.StaticIp          Enter valid static ipv6 address    a    b    c    validations    ipv6AddrValidate    OK    getAttribute    stringsMap 	   stringId    en_US    print 
    for WAN.    ipv6LoopBackCheck    ifStatic.PrefixLength    Enter valid prefix length    ifStatic.Gateway !   Enter valid gateway ipv6 address     for WAN Gateway.     for WAN Gateway    ifStatic.PrimaryDns    Enter valid primary ipv6 dns
     for WAN Primary Dns    ifStatic.SecondaryDns    Enter valid secondary ipv6 dns     for WAN Secondary Dns.     for WAN Secondary Dns    dhcp6c    dhcpv6c.statelessMode -   Enter valid Configuration Mode for ipv6 Dhcp    dhcpv6c.prefixDelegation    0 5   Prefix Delegation cannot be enabled in stateful mode    pppoe6    Pppoe6.PppoeSessions    Enter Valid Session for PPPOE
       �?   Pppoe6.UserName !   Enter Valid User Name for PPPOE
    Pppoe6.Password     Enter Valid Password for PPPOE
    Pppoe6.Dhcpv6Opt    Pppoe6.PrimaryDns +   Enter valid primary dns address for PPPOE
     for Pppoe6 Primary Dns.    Pppoe6.SecondaryDns -   Enter valid secondary dns address for PPPOE
     for Pppoe6 Secondary Dns.                     �  =   {   A   �@  �@  �  F�@ �  A �A E� F��� � \�����	�����	����A �A  � �AA� � ��E� F�@@ �B  ^ �ADW�� �E� � \B B  ^ C��B ł �B� @ �� ܂ @�ł   �܂ W�� ���  �B �  � �BF ��  �	�ƌ	@G��BF 	���BB 	�����B 	��ƂH 	����I 	���ƂI 	����J 	�����@ 	����G 	���  ���   ܂ @ ��� �� � ܂ � ��� @ �A@ ��A    �	@G�� �K@  � �A � � �@  � �LA� � � B ���  @� � �� �MA�  � @�� � 7      ERROR     	   tonumber    Pppoe6.PppoeSessions        @7   LogicalIfName = 'WAN2' AND ProfileName='pppoeProfile1'    db    getRowWhere    PppoeProfile    Pppoe6.UserName    PppoeProfile.UserName    Pppoe6.Password    PppoeProfile.Password -   LogicalIfName = 'WAN2' AND AddressFamily='2' 	   NimfConf    returnCodes    NIL    NimfConf.ConnectionType    pppoe    printCLIError (   Please configure IPv4 ISP type as PPPOE    getAttributeWhere    IdleTimeOutFlag         :   Please disable the Idle time out configured in Ipv4 PPPOE    NimfConf.ConnectionType6    pppoe6    3    NimfConf.LogicalIfName    WAN2    option2Settings.conType    option2Settings.userName    option2Settings.password    option2Settings.primaryDns    Pppoe6.PrimaryDns    option2Settings.secondaryDns    Pppoe6.SecondaryDns &   option2Settings.authenticationOptions    Pppoe6.AuthOpt    option2Settings.dhcpOptions    Pppoe6.Dhcpv6Opt    option2Settings.pppoeSessions    option2Settings.wanPort    option2SectionSet    errorStringGet    OK 	   nimfView    ipv6WanConfig    1    edit    getAttribute    stringsMap 	   stringId 	   LANGUAGE    save                     A  F       J   �   �@  ƀ��  ܀ @ �� �  � � � �          �	   nimfView    ipv6WanConfigGet    WAN2    NimfConf._ROWID_                             