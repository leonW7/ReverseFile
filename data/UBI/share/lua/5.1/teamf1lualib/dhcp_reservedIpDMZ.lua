LuaQ                	�      A@  ��  ��@@�  A@ @   A� @   A� @   A  @   A@ @   A� @   A� @   A  @   A@ � E  �� \� �  �� �� �   ܀ � A 
  	ŉ	�Ŋ	Ƌ	�ƌ	ǍA� GA A G� A� GA F�E�	 �� B	 U�G� A�	 G�	 J  	A��F�IIJ�F�IIAʔF�II�J�d        G�
 dA        G d�       �   GA d�     G� d       G� dA       G d�      �   GA d�    G� d    G� dA    G d�       GA d�       G� d    G� dA             �  � G d�       �        � GA d�    G� d       G�  � <      module #   com.teamf1.core.dhcp.reservedipdmz    package    seeall    require    teamf1lualib/db    teamf1lualib/util    teamf1lualib/validations    teamf1lualib/returnCodes    teamf1lualib/vlan_validation    teamf1lualib/dmz_addressing    teamf1lualib/dhcp_returnCodes    validationsLuaLib !   com.teamf1.core.dhcp_returnCodes    com.teamf1.core.dmz.addressing    com.teamf1.core.returnCodes    com.teamf1.core.validations    reservedipTable    DhcpfixedIpAddress    macAddress    MacAddr 
   ipAddress    IpAddr    interfaceType    LogicalIfName    name    Name    ipMacBinding    AssociatingEnabled 	   LAN_NAME    LAN 	   DMZ_NAME    DMZ    ROWID    _ROWID_    where     = '    ' 
   dhcpTable    dhcp    logicalIfName    startAddress    endAddress    macAddressGet    macAddressGetNext    macAddressSet    macAddressDelete    ipAddressGet    ipAddressGetNext    ipAddressSet    interfaceTypeGet    interfaceTypeGetNext    interfaceTypeSet    IpMacReservationDMZGet    IpMacReservationDMZGetNext    IpMacReservationDMZGetAll    IpMacReservationDMZSet    IpMacReservationDMZCreate    IpMacReservationDMZDelete    IpMacReservationDMZDeleteAll        T   e           E@  ��  ��E�  @  � �D   F � ^  E@ F�� �@  ��    D� F�\����  �� � ��   �@B�   � ��   ��B�    � �   �       firstCookieGet    reservedipTable    where    NIL    INVALID_ARGUMENT    db    getAttribute    ROWID    macAddress    FAILURE    SUCCESS                     u   �    '   E   �   �@  �  \� ��  �� @��  � � ��   �@��  � ��   ƀ��  �� � �A  EA �� �� Ɓ�܀�  �� �  �B@� �  C@� ��  �       nextCookieGet    reservedipTable    where    FALSE    NIL    NEXT_ROWID_INVALID    INVALID_COOKIE    db    getAttribute    ROWID    macAddress    FAILURE    SUCCESS                     �   �    	3   �   �   A  E�  �� ��  � � ��   � A�  �@ �� � ��   ��A�  �  � � ��� � ܀ � ��   � �� � ��   ƀ��  �@ ƀ�A  E� �  � �� � ܀ A  �� �  AC@  �  �CE� � �       checkCookieExists    reservedipTable    where    FALSE    INVALID_COOKIE    NIL    INVALID_ARGUMENT    isMacAddress    ERROR    db    setAttribute    ROWID    macAddress    FAILURE    SUCCESS 	   cookieie                     �   �       �   �   A  E�  �� ��  � � ��   � A�  �@ ��A�@  � @  �� �  � � ��   �@�   � ��   ƀ�   � � �       checkCookieExists    reservedipTable    where    FALSE    INVALID_COOKIE    db 
   deleteRow    ROWID    NIL    FAILURE    SUCCESS                     �   �           E@  ��  ��E�  F � �@  �@    D  F��\���� �� � �� � � B�   � �� � �@B�    � �   � 
      firstCookieGet    reservedipTable    where    db    getAttribute    ROWID 
   ipAddress    NIL    FAILURE    SUCCESS                     �      '   E   �   �@  �  \� ��  �� @��  � � ��   �@��  � ��   ƀ��  �� � �A  EA �� �� Ɓ�܀�  �� �  �B@� �  C@� ��  �       nextCookieGet    reservedipTable    where    FALSE    NIL    NEXT_ROWID_INVALID    INVALID_COOKIE    db    getAttribute    ROWID 
   ipAddress    FAILURE    SUCCESS                       7   	4   �   �   A  E�  �� ��  � � ��   � A�  �@ �� � ��   ��A�  �  � � ��� @� ܀�� ��   �@�� � ��   ƀ��  ŀ ���A  E �  � �A� � ܀ A  �� �  �C@  �  �C@  � �       checkCookieExists    reservedipTable    where    FALSE    INVALID_COOKIE    NIL    INVALID_ARGUMENT    ipAddressCheck    IPV4_ADDRESS_FAMILY    ERROR    db    setAttribute    ROWID 
   ipAddress    FAILURE    SUCCESS                     F  I           @    �       NOT_SUPPORTED                     Y  \      D   F � ^   �       NOT_SUPPORTED                     l  o      �   � @�   �       NOT_SUPPORTED                       �   	$   E   F@� ��  ��     \� �  �� � ��   �@A�   � ��   ��A�   �  A� �� �B�� E�  �� �� �A�U��FA� ��  �� � �B���� �   �       db    getRow    reservedipTable    ROWID    NIL    FAILURE    SUCCESS    .    macAddress 
   ipAddress    interfaceType                     �  �   6   E   �   �@  �  \� ��  �� @��  � � ��   �@��  � ��   ƀ��  �� � �A  EA �� ܀   �� �  �B@  �  �B@  �A  � � BC�����A   D� F���A����B  A �� ��C��  �       nextCookieGet    reservedipTable    where    FALSE    NIL    NEXT_ROWID_INVALID    INVALID_COOKIE    db    getRow    ROWID    FAILURE    SUCCESS    .    macAddress 
   ipAddress    interfaceType                     �  �          @@ E�  ��  ��E  @  � �D   F@� ^  D   F�� �   ^ � �       db    getRowsWhere    reservedipTable    where    NIL    FAILURE    SUCCESS                     �  R   �     @  �B  ł  � E�  @� �  A B  � � �� �A �� �� ��E�  � �B  C D F���� �  ED �� �  � U�� �BD�B   �����  � ��� Ƃ�� ����� � ܂ ���  ����� ��� �B�� �B �� ��� Ƃ�� �� ��  AC ܂�� �W@� �ł ��܂ W ���ł ��܂ X����ł ��܂ W@�@ ��G� ��� ���� � �B�  ��   ����� ��� ���� � ���	 @ � �C � @  �� Ղ� CDEC  ����  � �D� FC�^ D F��\�   �IW �� �� J  DJ� �  ���	W�� ��� Ƅ�	� �����	  @�� 	܄ ��	�  ��	��� ��� ��	� ���D�	  @�܄���	��� ��� ���	� � ��	E D F��
F��
� ܄ E AE � ��L�EM�
��	E AE � ��L��M�
F�	 �M
@ � ��� � 
��� �� N
 
  EE  �E � ƅ�UŅ
	E�
EE  �E � ���UŅ
	��
E FE�
�E  � 
   \� �E ��
� ��  ��N�  ���  ��I�  �� � ;      checkCookieExists    reservedipTable    where    FALSE    INVALID_COOKIE    NIL (   COMP_DHCP_RESERVEDIP_DMZ_MACADDRESS_NIL    lower     and lower(    .    macAddress    )='    ' and     ROWID    !='    '    db    existsRowWhere +   COMP_DHCP_RESERVEDIP_DMZ_MACADDRESS_EXISTS    isMacAddress    ERROR ,   COMP_DHCP_RESERVEDIP_DMZ_MACADDRESS_INVALID '   COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_NIL    util    split  	   tonumber       �?      l@           0.0.0.0 +   COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_INVALID    validationsLuaLib    ipv4AddrAsciiToNum       �
   ipAddress     = ' *   COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_EXISTS    ipAddressGet    SUCCESS '   COMP_DMZ_ADDRESSING_IPADDRESS_GET_FAIL    subnetMaskGet $   COMP_DMZ_ADDRESSING_SUBNET_GET_FAIL    ipv4SingleMaskCheck 1   COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_NOTIN_NETWORK    ipv4AddressesCompare        @(   COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_SAME    getRow 
   dhcpTable    dhcp    logicalIfName 	   DMZ_NAME    startAddress    endAddress    ipv4AddrTokenAddrRangeCheck 0   COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_INDHCP_RANGE    update    FAILURE                     b  �   	    B@E�  � T ��  @� �D  F�^ EB @ � �D  F��^ D� F���  \� ��D F�@�� �D  FB�^ EB @� � �D  F��^ E� F��� �B \��� �W�� �E� ��\� W@���E� ��\� X@����E� ��\� W��@ ��� � �D  F�^ EB F���� \�   ����� �D  F�^ KF �  \���B �� �  AC ����F�  �AD �B�  Ƃ��  @ ܂��  � �  �G   HE�  ���CH�� �   � �D  F��^ EC @� �D  F��^ E	 W@� �D  FC�^ D F��\�  �IW �� �  J  DJ� � ���	W�� ��  Ƅ�	� �� ���	 � @�� 	܄ ��	� ��	��� ��  ��	� �� �D�	 � @�܄���	��� ��  ���	� �  ��	E D�F��
F��
�	 ܄ E AE ����L�M�
��	E AE ����L�EM�
F�	E �M
@� � ��� � 
��� �  �M
 
  E�  �E �����UŅ
	�
E�  �E ���E�UŅ
	E�
E�  �E ����UŅ
	��
E�  �E ���E�UŅ
	��
E�  �E �����UŅ
	�
E  FE�
��  � 
\�����EH��  � A� ����F��    AG �E�  ���  @ �F ܅ F  �
� � �P@�� �I@�� � C      db 	   getTable    reservedipTable    RESERVED_IP_MAXLIMIT /   COMP_DHCP_RESERVEDIP_LAN_IPADDRESS_MAX_REACHED    NIL (   COMP_DHCP_RESERVEDIP_DMZ_MACADDRESS_NIL    isMacAddress    ERROR ,   COMP_DHCP_RESERVEDIP_DMZ_MACADDRESS_INVALID '   COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_NIL    util    split    .  	   tonumber       �?      l@           0.0.0.0 +   COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_INVALID    validationsLuaLib    ipv4AddrAsciiToNum       �   lower    where     and lower(    macAddress    )='    '    existsRowWhere +   COMP_DHCP_RESERVEDIP_DMZ_MACADDRESS_EXISTS 
   existsRow 
   ipAddress *   COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_EXISTS '   COMP_DHCP_RESERVEDIP_DMZ_INTERFACE_NIL 	   DMZ_NAME +   COMP_DHCP_RESERVEDIP_DMZ_INTERFACE_INVALID    ipAddressGet    SUCCESS '   COMP_DMZ_ADDRESSING_IPADDRESS_GET_FAIL    subnetMaskGet $   COMP_DMZ_ADDRESSING_SUBNET_GET_FAIL    ipv4SingleMaskCheck 1   COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_NOTIN_NETWORK    ipv4AddressesCompare        @(   COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_SAME    getRow 
   dhcpTable    dhcp    logicalIfName    startAddress    endAddress    ipv4AddrTokenAddrRangeCheck 0   COMP_DHCP_RESERVEDIP_DMZ_IPADDRESS_INDHCP_RANGE    interfaceType    name        ipMacBinding    0    insert     = '    ' and     getAttributeWhere    ROWID    FAILURE                     �  �      E   �   �@  �  \� ��  �� � �D   F � ^  E@ F�� �@  ��    \� �  �� � ��   �@B�   � ��   ��B�   � � �       checkCookieExists    reservedipTable    where    FALSE    INVALID_COOKIE    db 
   deleteRow    ROWID    NIL    FAILURE    SUCCESS                     	             @ A@  ��  ��  �  E  F@� �� �   \���� �� � �� � � B�@ � �� � ��B�@ � � �       interfaceType     = ' 	   DMZ_NAME    '    db    deleteRowWhere    reservedipTable    NIL    FAILURE    cookie    SUCCESS                             