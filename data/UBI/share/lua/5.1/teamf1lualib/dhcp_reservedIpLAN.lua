LuaQ                �      A@  ��  ��@@�  A@ @   A� @   A� @   A  @   A@ @   A� @   A� @   A  @   A@ @   A� � E  �� \� �  �  �� �  A ܀  A� � A G� A� GA A� �  �AF���F��AG���G��AH���H��AI���I��A
 �
 ��
 ǁ
 �� � �G� E
 �� Ձ��A �A � �� ǁ �A � �  ���ƁM��M�ƁM�AN�ƁM�AǎƁMɁN�� �� �  ����O�AϞ�OɁO��O��ϟ�    �   � �A    �   �A �    �      ǁ ��    ��� �      �� �A   �   �A �   �      ǁ ��   ��� �   �� �A   ��A �   �   ǁ ��   �   �� �      �� �A      �   �     ��A �   �      �   ǁ ��   �      �   �� �   �   � �A      ��A � ǁ  � S      module #   com.teamf1.core.dhcp.reservediplan    package    seeall    require    teamf1lualib/db    teamf1lualib/util    teamf1lualib/validations    teamf1lualib/returnCodes    teamf1lualib/vlan_validation    teamf1lualib/lan_addressing    teamf1lualib/dhcp_returnCodes    teamf1lualib/vlan_vlan    validationsLuaLib    com.teamf1.core.vlan.vlan !   com.teamf1.core.dhcp_returnCodes    com.teamf1.core.lan.addressing    com.teamf1.core.returnCodes    com.teamf1.core.validations    reservedipTable    DhcpfixedIpAddress    ipMacBindingTable    IPMACBinding    _ROWID_    macAddress    MacAddr 
   ipAddress    IpAddr    interfaceType    LogicalIfName    name    Name    ipMacBinding    AssociatingEnabled    sourceMACAddress    SourceMACAddress    ipMacIPAddress 
   IPAddress 
   logStatus 
   LogStatus 	   LAN_NAME    LAN 	   DMZ_NAME    DMZ    ROWID    where     = '    ' 
   WAN2_NAME    WAN2 
   WAN1_NAME    WAN1    subnetTable 	   ifStatic    subnet 	   StaticIp    subnetMask    NetMask    AddressFamily 
   dhcpTable    dhcp    logicalIfName    startAddress    endAddress    macAddressGet    macAddressGetNext    macAddressSet    macAddressDelete    ipAddressGet    ipAddressGetNext    ipAddressSet    interfaceTypeGet    interfaceTypeGetNext    interfaceTypeSet    IpMacReservationLANGet    IpMacReservationLANGetNext    IpMacReservationLANGetAll    IpMacReservationLANSet    IpMacReservationLANCreate #   IpMacReservationLANFromLeaseCreate    IpMacReservationLANDelete    IpMacReservationLANDeleteAll    reservedLANIpGet        g   x           E@  ��  ��E�  @  � �D   F � ^  E@ F�� �@  ��    D� F�\����  �� � ��   �@B�   � ��   ��B�    � �   �       firstCookieGet    reservedipTable    where    NIL    INVALID_ARGUMENT    db    getAttribute    ROWID    macAddress    FAILURE    SUCCESS                     �   �    '   E   �   �@  �  \� ��  �� @��  � � ��   �@��  � ��   ƀ��  �� � �A  EA �� �� Ɓ�܀�  �� �  �B@� �  C@� ��  �       nextCookieGet    reservedipTable    where    FALSE    NIL    NEXT_ROWID_INVALID    INVALID_COOKIE    db    getAttribute    ROWID    macAddress    FAILURE    SUCCESS                     �   �    	3   �   �   A  E�  �� ��  � � ��   � A�  �@ �� � ��   ��A�  �  � � ��� � ܀ � ��   � �� � ��   ƀ��  �@ ƀ�A  E� �  � �� � ܀ A  �� �  AC@  �  �CE� � �       checkCookieExists    reservedipTable    where    FALSE    INVALID_COOKIE    NIL    INVALID_ARGUMENT    isMacAddress    ERROR    db    setAttribute    ROWID    macAddress    FAILURE    SUCCESS 	   cookieie                     �   �       �   �   A  E�  �� ��  � � ��   � A�  �@ ��A�@  � @  �� �  � � ��   �@�   � ��   ƀ�   � � �       checkCookieExists    reservedipTable    where    FALSE    INVALID_COOKIE    db 
   deleteRow    ROWID    NIL    FAILURE    SUCCESS                     �   �           E@  ��  ��E�  F � �@  �@    D  F��\���� �� � �� � � B�   � �� � �@B�    � �   � 
      firstCookieGet    reservedipTable    where    db    getAttribute    ROWID 
   ipAddress    NIL    FAILURE    SUCCESS                     	     '   E   �   �@  �  \� ��  �� @��  � � ��   �@��  � ��   ƀ��  �� � �A  EA �� �� Ɓ�܀�  �� �  �B@� �  C@� ��  �       nextCookieGet    reservedipTable    where    FALSE    NIL    NEXT_ROWID_INVALID    INVALID_COOKIE    db    getAttribute    ROWID 
   ipAddress    FAILURE    SUCCESS                     .  J   	4   �   �   A  E�  �� ��  � � ��   � A�  �@ �� � ��   ��A�  �  � � ��� @� ܀�� ��   �@�� � ��   ƀ��  ŀ ���A  E �  � �A� � ܀ A  �� �  �C@  �  �C@  � �       checkCookieExists    reservedipTable    where    FALSE    INVALID_COOKIE    NIL    INVALID_ARGUMENT    ipAddressCheck    IPV4_ADDRESS_FAMILY    ERROR    db    setAttribute    ROWID 
   ipAddress    FAILURE    SUCCESS                     Y  ]           @    �       NOT_SUPPORTED                     m  q      D   F � ^   �       NOT_SUPPORTED                     �  �      �   � @�   �       NOT_SUPPORTED                     �  �   Y   E   F@� ��  ��     \� �  �@ �� � ��   ƀ�   � �ŀ  � D� F��@���� �  A� �� �AB�� D� F���� �� D� FB��� � � U��  ��C�  �����   ��  �A� E�  � �� Ƃ�܁�� ��  ���   E�  �� �� ��UFB� ��  �� � CB���� ł  � D� F��B�� �  A� �� �CE�� E�  �� �� ƃ�UÃFC� � �� �       db    getRow    reservedipTable    ROWID    0    NIL    FAILURE    .    macAddress 
   ipAddress    sourceMACAddress     = '    ' AND     ipMacIPAddress    '    existsRowWhere    ipMacBindingTable    getAttribute 
   logStatus    SUCCESS    interfaceType    name    ipMacBinding                     �  �   B   E   �   �@  �  \� ��  �� @��  � � ��   �@��  � ��   ƀ��  �� � �A  EA �� ܀   �� �  �B@  �  �B@  �A  � � BC�����A   D� F���A����B  A �� ��C��EB  � �� ��UFB��B  � � CD����  �       nextCookieGet    reservedipTable    where    FALSE    NIL    NEXT_ROWID_INVALID    INVALID_COOKIE    db    getRow    ROWID    FAILURE    SUCCESS    .    macAddress 
   ipAddress    interfaceType    name    ipMacBinding                     �       	=      D   F@� ��  ��   U � �@ ��A��  � ����  � � �� � �@��  ŀ � A� �  �C�܀ @����� � D  F���@��� A �CE �A ��� ���E @� �D� FA�^ @�E �� �  ���U��@� � � �  @  �   �       0    interfaceType     LIKE ' 	   LAN_NAME    %'    db    getRowsWhere    reservedipTable    NIL    FAILURE 	   tonumber    .    ipMacBinding       �?   name    getRowWhere    ipMacBindingTable    Name='    ' 
   logStatus    SUCCESS                          (\  �  �C��  E�  �  �  ��	܃����  �C��  E�  �  �  �D�	܃� ��  ƃ�� @ � �  �D�	� @��� ����  ��D @ ܃��� �C���� �� ��  �C�D ܃ � � ��� �� ��� ���� � ��W� ���C    ܃  E �� �� ƃ�� �  ����  E�  �  ܃  F �� �� ƃ�� � �� � ��� �C�� �  ƃ�� @� � �  �D�	� @ �� Ճ�  CED ����K�� �� \���� � �  AE �  �EA��  �A� ��  �    A� �D	�  ��	�  @ 	܄��  � �� EH
 ��H
@� � � 
 �H
 � �� I
   � �� EI
   A
A� � �� �  A �  �� �
E  F�
��  � 
\��Z  � ��� ��I� ��	 �J� F ���� W@J ��E ƅJ�� W�J���E ƅJ�� X������E ƅJ�� W K@ �@K� ��� ��K� �� �L� �� ��� @L� ��� ��K� �C@��C���  ��LŅ   @  �� @J� �� ���� ���MFMF�M�  ��A��  �A �  �GB��   A �  �N��  	�A� �F	�  �F�G @ ܆�W@�@�� @���E� � \@��N �@�� ��	� �IH�	  O ���� ��	� ��I�	 a�  ��!�  @�� �  AF �  ��O��O�   �OGPA �� ��   �OHPA �� �� 	  �OIPA	 �	 �� ��	�  �F�G @ ܆�� @��
�C �H I D	  F��F	��H�F��H I D	  F��F���H�������� 	 @	��	 ܈ ��� ��� ���
 �H I D	  F��FI��H�F����H� 	 @	�܈����R  ��
 !�  �� �� �� �R �J� �� S   �LEG �  ��S��S��� E @� �D F���  ^�EG �G �  Ƈ���UǇFBEG �G �  Ƈ��G�UǇBE� F��� ��  \� ��@L� �D� F��^ E @�� �D� FG�^ J  �  Ň  H D  FH��G�IG�Ň  H D  F��G�I��Ň  H D  F��G�IǀŇ  H D  F��G�I�Ň  H D  FH��G�IG��  �G��  E�  �  �  ��܇�Ǉ �  �G��  E�  �  �  ��܇���   �� V@�Ň  H D  F��G�I���G H D  F��G��ǀ�G H D  F���G��G��G H D  FH��G�����G H D  F��G����C ��  �G�H D  FH��� ��  ܇��  @�H AH �  �HV��G  �VEH � ��� @ @�H AH �  �HV��G  ��  �VEH � � � @ @�  �VEH � ��@   �
� � �L@  ��� �� � V���  �G�H D  FH��� ��  ܇��   ��  AH �  �U�IV  WEH ��  ��� @ � ��
� �� ���   ���  Ƈ��  @��  ܇   �� � �L@  � R@  � � ]      db    getAttribute    reservedipTable    ROWID 
   ipAddress    macAddress    sourceMACAddress     = '    ' AND     ipMacIPAddress    '    isIPMacBindingRow    existsRowWhere    ipMacBindingTable    1     count 	   getTable    RESERVED_IP_MAXLIMIT 1   COMP_DHCP_IPMACBINDING_LAN_IPADDRESS_MAX_REACHED    NIL 	   tonumber    INVALID_ARGUMENT 
   existsRow    FALSE (   COMP_DHCP_RESERVEDIP_LAN_MACADDRESS_NIL    lower    where     and lower(    .    )='    ' and     !=' +   COMP_DHCP_RESERVEDIP_LAN_MACADDRESS_EXISTS    isMacAddress    ERROR ,   COMP_DHCP_RESERVEDIP_LAN_MACADDRESS_INVALID '   COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_NIL *   COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_EXISTS    util    split        �?      l@           0.0.0.0 +   COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_INVALID    validationsLuaLib    ipv4AddrAsciiToNum       �   getRow    FAILURE    DhcpfixedIpAddress.Name    DhcpfixedIpAddress.IpAddr    DhcpfixedIpAddress.MacAddr     != '    name    getRowsWhere    pairs    IPMACBinding.SourceMACAddress    IPMACBinding.IPAddress    LAN    subnet    AddressFamily 
   ='2' and     LogicalIfName 
   WAN1_NAME 
   WAN2_NAME 	   DMZ_NAME    subnetTable    subnetMask    ipv4SingleMaskCheck    SUCCESS    ipv4AddressesCompare        @1   COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_NOTIN_NETWORK (   COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_SAME 
   dhcpTable    dhcp    logicalIfName    startAddress    endAddress    ipv4AddrTokenAddrRangeCheck 0   COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_INDHCP_RANGE    ipMacBinding    interfaceType    ipMac_IPAddress 
   oldstatus    0 
   logStatus    update    insert 
   deleteRow                     #      &�  �  �B@ł  �� � �  �� ��  ��� @A���  �B�� ܂ ��� �  �� ��  ���� ��   � �  CB � �B@  � �  �B �� �  C �CCA� �  �� �DA� �� �D �E  F���� � \��@A���� ��  �EŃ �DC@  �� �  � ��  �C�� �  ��� D�F��� ܃ ���  � ��  ƃ�� ��  �� �FAD ���D ���  ƃ��  @ ܃��  � �  �F �F �  ��E �D ń  � D�F��
�� � F U��  ��D	ń   �����  � ��  �D�	� �  ��	�  D�F�
�� ܄ �  � �  �E
   � � �  EH
 � �H
@� �� ��� 
W I �E	 F�I� W�I
��E	 F�I� X ����E	 F�I� W J
@ �@� � �  �J
 �
 K
@� � ��
� 
@�� �  �J
   E
E� ���EC� �   � �  EE
  
A
 �
 �� ��KLAF ����K��L��  AG ����K��L�� � AH ����K��L�� � AI F	E  F��F � \���� ����
�� EH �� �������UȈ�GEH �� ��������UȈHD� F��� �� 	 \� ��D FH�@�@�A�	 EH �� �����ƈ�UȈ�ED� F���� ��\�� ��O
� ���	 @ ���  @� �
� ��  �P� �I� ��  �FP� �  ��P�� �QGQ@��� � �� �� Ɔ�� ���� � D�F�F��F�F��� � D�F�FG��F����
 Ɔ� � @�� ܆ ��@�� ��  ���� � ��� ��  �F�� �  
  E�  �� ��Ƈ�UǇ��E�  �� ����UǇ�F�E�  �� ����UǇ�ƅE�  �� ����UǇ�ƀE�  �� ���G�UǇ��Z  @�E�  �� ���G�UǇ�F�E  F����  ��\���� �� �F�	� �� �� �HC�	 �� �� �D�	G �� �� �HS�	@A���� ��� �� ��S�	G�  ��SŇ   ���@ ��@A@ �ZC  @ �Z   ��� �� ��S�	G�  �TŇ   @��� @ � ��� �� ��Q�� �����H��  � AH ����G��  	  AI �G	�  �G��  @ �� ܇   �� � �Q@�� HO@�� � S      db 	   getTable    reservedipTable    RESERVED_IP_MAXLIMIT /   COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_MAX_REACHED    1    ipMacBindingTable 1   COMP_DHCP_IPMACBINDING_LAN_IPADDRESS_MAX_REACHED    NIL (   COMP_DHCP_RESERVEDIP_LAN_MACADDRESS_NIL    isMacAddress    ERROR ,   COMP_DHCP_RESERVEDIP_LAN_MACADDRESS_INVALID    sourceMACAddress     = '    ' AND     ipMacIPAddress    '    existsRowWhere  
   existsRow +   COMP_DHCP_RESERVEDIP_LAN_MACADDRESS_EXISTS *   COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_EXISTS    .    name     =' #   COMP_DHCP_IPMACBINDING_NAME_EXISTS    lower    where     and lower(    macAddress    )=' 
   ipAddress '   COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_NIL    util    split  	   tonumber       �?      l@           0.0.0.0 +   COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_INVALID    validationsLuaLib    ipv4AddrAsciiToNum       �   LAN    subnet    AddressFamily 
   ='2' and     LogicalIfName    !=' 
   WAN1_NAME    ' and  
   WAN2_NAME 	   DMZ_NAME    getRowsWhere    subnetTable    pairs    subnetMask    ipv4SingleMaskCheck    SUCCESS    ipv4AddressesCompare        @1   COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_NOTIN_NETWORK (   COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_SAME    getRow 
   dhcpTable    dhcp    logicalIfName    FAILURE    cookie    startAddress    endAddress    ipv4AddrTokenAddrRangeCheck 0   COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_INDHCP_RANGE    interfaceType    ipMacBinding    insert 
   logStatus    update    getAttributeWhere    ROWID                       �    l  E  FA���  \� ����  ��� ��  �A� � �A � � ��  Ɓ�� �� ���   ܁ ��� ���� ��  �A�� ˁB @  ܁�� A ��  �B ��CA� ��� �E  FB���  � \��Z  � ��  ��D� �  ��Dł  �E@� �� �  � ��  �B�� �B �� � ��  Ƃ�� �� ��� @� ܂���� ���� ��  �B�� �  ���� D�F����܂ �  � ��  Ƃ�� �� A �C ��ƃ���� D�F��FD��� �� 	 D�F��
FE�
�� �E	 	 D�F��FF��� ņ	  ��  �IE
 ����ED
 � \�
���
 AF ����G�E���

 AF ����G��J���
� �J@� � ��� �  K @�C 
 AF ����G�FH���
� �K@� � ��� ��� �AC @ �a�  @� G� �D  F�^ @�� �D  FD�^ E  F���� ����	�D�	  \� �� ��M	�� E D�F�
F�
�D�	�ĄE ���ń ���	� AE ���M�EN�
�AE ܄�� �M
@� �E ��E� ��N	\� �� ���	�� ��
��E� �O
\� �� �O	�� X��
��E� �O
\� �� ��	�� @��D  FE�
^ ��E� ��N	\� �� ���	�� @�	�E� ��N
\� �� ��N	�� ��
��E� �O
\� �� �O	�� ��
��D  FE�
^ ��E� ��N
\� �� ���	�� ��
��E� �O
\� �� ��	�� @� �D  FE�
^ J  �  Ņ  F D�F���E�I�Ņ  F D�F��E�IE�Ņ  F D�F���E�I��Ņ  F D�F���E�IŀŅ  F D�F��E�I��  �E��  @�
܅��EA� �� �	 ��CA� �  � �E  F����  �  \� �F ��� �� �FQ����� �K���� � F      db 	   getTable    reservedipTable    RESERVED_IP_MAXLIMIT /   COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_MAX_REACHED    NIL (   COMP_DHCP_RESERVEDIP_LAN_MACADDRESS_NIL    isMacAddress    ERROR ,   COMP_DHCP_RESERVEDIP_LAN_MACADDRESS_INVALID    lower    where     and lower(    .    macAddress    )='    '    existsRowWhere +   COMP_DHCP_RESERVEDIP_LAN_MACADDRESS_EXISTS 
   existsRow 
   ipAddress *   COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_EXISTS '   COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_NIL    ipAddressCheck    IPV4_ADDRESS_FAMILY +   COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_INVALID    ipMacBindingTable    sourceMACAddress            LAN    subnet    AddressFamily 
   ='2' and     LogicalIfName    !=' 
   WAN1_NAME    ' and  
   WAN2_NAME 	   DMZ_NAME    getRowsWhere    subnetTable    pairs    subnetMask    ipv4SingleMaskCheck    SUCCESS       �?   ipv4AddressesCompare        @1   COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_NOTIN_NETWORK (   COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_SAME    getRow 
   dhcpTable    dhcp    logicalIfName    util    split    startAddress    endAddress 	   tonumber       @      @0   COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_INDHCP_RANGE    interfaceType    name    ipMacBinding    insert     = '    getAttributeWhere    ROWID    FAILURE                     �  �   
V   D   F � W@  ��E@  �   \� �   � @�� � �D   F�� ^  E�  F � �@ ŀ    \� �   ��A�� � �D   F�� ^  E�  F � �@ ŀ    \� �@ �@ � �B� ��� �@ A D� F���@���� �  CEA �� �  � E  @� �D  FA��  ^��C �E�  F��� �� �A� �E� \����  �C� � @��� �  �� ��  �A�   ��D  F���  ^� �       NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    reservedipTable    ROWID    FALSE    getRow    .    ipMacBinding 
   ipAddress 
   deleteRow    FAILURE    1    getAttribute    ipMacBindingTable    ipMacIPAddress    SUCCESS                     �  �    .       @ A@  ��  ��  �  E  F@� �� �   \���� �� � �� � � B�@ � ��  ��B�� �� �  � ����   �@��  ��  �@�� @  ܀��  �� �� BEA �� � ���A � � �       interfaceType     LIKE ' 	   LAN_NAME    %'    db    deleteRowWhere    reservedipTable    NIL    FAILURE    cookie 	   getTable    ipMacBindingTable       �?   ipMacBinding     LIKE '1%'     SUCCESS                     �  �           @@ E�  ��  �� A @ �J     �    �       db    getRowsWhere    reservedipTable    where                              