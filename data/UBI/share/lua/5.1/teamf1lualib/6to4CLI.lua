LuaQ                5      A@  @   ŀ  W�� �ŀ  W �@��@ W��� ��@ �� ��    �@ �   A �@ �   � �@ �   � ܀   ��    ܀ @ ��   A ܀ � ��   ǀ �@  �� �  �  ��      �@ �  $A   �d�    G�  �       require    teamf1lualib/nimfView 
   UNIT_NAME    DSR-1000AC 
   DSR-500AC    PRODUCT_ID    DSR-1000_Bx    DSR-500_Bx    teamf1lualib/bl_teredoTunnel    teamf1lualib/returnCodes    teamf1lualib/errorMap    com.teamf1.bl.ipv6.teredo    com.teamf1.core.errorMap    com.teamf1.core.returnCodes    sixToFourTunnelCfgInit    sixToFourTunnelCfgSave    sixToFourTunnelCfgInputVal    ipv6TunnelsCfgGet    ipv6TunnelsStatusGet                    E@  F�� ��  �  A \� G   E   �� @�E@  F�� � � ��  \��G   A  �   ^ � � 	   
   configRow    db    getRow    sixToFourTunnel    _ROWID_    1     getDefaults       �?                    "   )        A@  G   E  F@� �   �� � \� ��  G�  E�   � � �E@ F�� \@� E@ F � �@ �� �  E� \��G� E�  �� ^ � �       DBTable    sixToFourTunnel 
   errorFlag    statusCode 	   nimfView    sixtoFourTunnelConfig    1    edit    OK    db    save    statusMessage    getAttribute    stringsMap 	   stringId 	   LANGUAGE                     +   2        E   F@� ��  ��   AA \�� �  ��� �� �@ �   �  � � �   �       db    getAttribute    networkInfo    _ROWID_    1    netWorkMode    printCLIError ;   Please Set IP Mode to IPv4/IPv6 to configure IPv6 Tunnels.                     4   ]    �   J   �   �@@��  �  A �� �@ � �@ �� ܀� �   @��  A �@ ƀB �� ��  � �@ @�ƀB �� ��  A �@ ŀ W�� �ŀ W �@��@ W��� ��@ �����   � ��@� � B �A  A��� � �A � � @�� ��A � B @ � ��A � �� � �A �  � �@ �    AGA� � E� � \�
�� ��� �BH�B    ��� �H A��  IAC	 ��	 ��W�I� �FJ�B�  ��� C
 �J@� ��
 �K�C    ��� C C
 �J@� �C ��C C
 �J@� �� ��K�C    ��� C a�  @�EA
 F��� � \A� � 0      db    getRow    sixToFourTunnel    _ROWID_    1    printLabel    IPv6 Tunnels    sixToFourTunnelCfgInputVal    print    6 to 4 Tunneling
    sixToFourTunnel.tunnelStatus     Automatic Tunneling is Enabled
    0 !   Automatic Tunneling is Disabled
 
   UNIT_NAME    DSR-1000AC 
   DSR-500AC    PRODUCT_ID    DSR-1000_Bx    DSR-500_Bx    teredoConfigGet    Teredo Tunneling
    Teredo Tunneling is Enabled
    Primary Server :	    
    Secondary Server :	    Teredo Tunneling is Disabled
 "   List of Available ISATAP Tunnels
         	   getTable    isatapTunnel    pairs       �?   isatapTunnel.localIPv4Address        isatapTunnel.useLanAddress    getRowWhere    ipAddressTable (   LogicalIfName='LAN' AND AddressFamily=2     ipAddressTable.ipAddress    resTab    insertField    ROW ID    isatapTunnel._ROWID_    LocalEndpoint    ISATAP Subnet Prefix    isatapTunnel.isatapPrefix                     _   c        E   F@� �   ��  \��Z   @ ���� �@  �   ��@  � � �   �       io    open    rb    close                      e   l       D   �   \� Z@  @ �J   ^  J   G   E@  F � �   \  �E  �  � ��@Ia@   �E   ^   �       lines    io       �?                    o   �    �   J   �   �   A  A�  A �  A A A ��   �'�� �AA �A ��E� � \�#���B�� ł ��C A� �� � ܂��B    ��B ��@ ���   �� CEC    �C E� F���� ��   A �C�\���C �  W�D@ � E�� ��
�� @������FŃ@D ��E�
�� ��
�@�� � F�
A� ���
��!�  �� �� @������FŃ@D ��E�
�E ��
�@�� � F�
AF ���
��!�  ��� W�G �� W H@�D W�H� �D �H �  A	 � T W �� �FDI��Bɀ��	 �I@� �
 � D �	 �I@� �D
 � D � W�G �� W H@�D W�H� �D �H@�� @���E�	 F��
�� �
  �	\E E�	 F��
�� �E
   
\E !�  @�a�  ��E�	 F���� �  \A� � *              printLabel    IPv6 Tunnels    print    IPv6 Tunnels Status    sixToFourTunnelCfgInputVal    db    getRowsWhere    networkInterface    ifType='tunnel'    pairs       �?   getAttribute    WanMode    _ROWID_    1    DedicatedLogicalIfName        WAN1 
   sit0-WAN1 
   sit0-WAN2    networkInterface.LogicalIfName    ipAddressTable    LogicalIfName='    '    ipAddressTable.ipAddress    /    ipAddressTable.ipv6PrefixLen    ,      /  
   UNIT_NAME    DSR-1000AC 
   DSR-500AC    PRODUCT_ID    DSR-1000_Bx    DSR-500_Bx    /etc/miredo/teredoStatus        @   resTab    insertField    Tunnel Name    IPv6 Address(es)                             