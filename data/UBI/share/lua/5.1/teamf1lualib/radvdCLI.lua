LuaQ                6      A@  @    A�  @   �     E@ W�� ��E@ W�� ��E@ W �  �E@ W@� @�E@ W�� � �E@ �� @ �    �@ E   �� \� �   �� �@  �  ��  �@ ��    � �� �  �� �@ �  �� �@ ��     �� �  ��  �       require    teamf1lualib/radvd    teamf1lualib/validations    radvdLANPrefixPoolTable    radvdLANPrefixPool    PRODUCT_ID    DSR-1000AC_Ax    DSR-500AC_Ax    DSR-1000_Bx    DSR-500_Bx    DSR-1000_Ax    DSR-1000N_Ax       0@       @   com.teamf1.core.validations    radvdCfgSave    radvdCfgInit    radvdCfgInputVal    radvdPoolCfgInputVal    radvdCfgGet    radvdpoolCfgGet    radvdPoolCfgInit    radvdPoolCfgSave    radvdPoolCfgDel 	       $   *        A@  G   E@  F � �   �@A � \� ��  G�  E�  �� � �E  F@� \@� E  F�� �  �@ �  E� \��G� E�  �� ^ � �       DBTable    radvd 
   errorFlag    statusCode    profileConfig    radvd._ROWID_    edit    OK    db    save    statusMessage    getAttribute    stringsMap 	   stringId 	   LANGUAGE                     ,   D     <   F @ �@  ��@��   @� �� @A@�ŀ � �@ �  
  � ��@  �@��  A �� �� ܀�W��@�� A A  J  � � ��   �A@ A� �� U���A  �AB��  @��B ����A  Ɓ�� AB � ܁ ǁ Ł Ɂ��Ł �A�Ł ���� �� �          �?   db    getRow    vlan    vlanId     print    Vlan doesn't exist.
       �   getAttribute 	   vlanIPv6    1 C   Enabled IPv6 first on selected vlan interface to configure RADVD.
        LAN    radvd    LogicalIfName    _ROWID_ 
   configRow    radvd._ROWID_    radvd.LogicalIfName                     F   g     H   E   F@� ��  ��   AA \��Z@    �A�  �  ��� �  �@ �   �  �@B �B����B W C� ���B �A ��� �@ �@ �   �  �� ��B �� X�C@ �� � ��� A �@ �   �  ŀ �D ܀ � �X�D@ �� � ��� A �@ �   �  ŀ �E ܀ � �X�E@ �� � ��� A �@ �   �  � � �   �       db    getAttribute    networkInfo    _ROWID_    1    netWorkMode        printCLIError 5   Please Set IP Mode to IPv4/IPv6 to configure RADVD.
    radvd.UnicastOnly    0    radvd.MaxRtrAdvInterval  !   Enter valid advertise interval.
 	   tonumber       $@      �@#   Invalid advertise interval value.
    radvd.AdvLinkMTU       �@     p�@   Invalid MTU value.
    radvd.AdvDefaultLifetime       >@     ��@!   Invalid Router lifr time value.
                     i   �    
�   E   F@� ��  ��   AA \��Z@    �A�  �  ��� �  �@ �   �  �@B W�B� ��@B �A ��� �� �@ �   �  �@B �   � �A A� � ܀ �� �� A� A     A  ���  @ AE  FA��A ��   A� \��ZA    �A� W � ��� � �A �  � 	 ����E W�B� ���E �A ��� �� �A �  � ��E  F ��� �A �A �  � ��E �F@���F W�B� ���F �A ��� � �A �  � �  �AG�� �F ���W�G ���  �A �  � �AH W��� ��AH �� ��� � �A �  � �� BH ܁ X �@ ���� �� A�	 B    ��E  A����I W�B� ���I �A ��� �
 �A �  � �� ��I �� �A
   ܁ ����
   A�
 �A�	����� �I ܁ X �@ ��� �� AB B    ��K W�B� ���K �A ��� �� �A �  � �� ƁK �� X L@ ���� ��� � �A �  � �� �  � 3      db    getAttribute    networkInfo    _ROWID_    1    netWorkMode        printCLIError :   Please Set IP Mode to IPv4/IPv6 to configure IPv6 RADVD.
    radvdLANPrefixPool.vlanId     Enter valid vlan Id.
    getRow    vlan    vlanId    No Row exist with this Vlan ID    LAN    radvd    LogicalIfName 
   isEnabled ,   Please Enable Radvd for this vlan interface !   radvdLANPrefixPool.interfaceName #   radvdLANPrefixPool.radvdPrefixType    Enter valid ipv6 prefix type
    3 9   Prefix Obtain by DHCPv6 server supports Non-Edit format
    2 "   radvdLANPrefixPool.radvdAdvPrefix    Enter valid ipv6 prefix
    ipAddressCheck       $@           Invalid prefix value
 (   radvdLANPrefixPool.radvdAdvPrefixLength     Enter valid ipv6 prefix length
 	   tonumber       �?      `@*   Invalid advertisement prefix length value !   radvdLANPrefixPool.SLAIdentifier    Enter valid SLA ID 
    num2hex 
   2002:0:0:    ::      8�@   Invalid SLA parameter value 
 *   radvdLANPrefixPool.radvdAdvPrefixLifetime    Enter valid prefix life time
       @      �@.   Invalid advertisement prefix lifetime value 
                     �       �   E   F@� ��  \� �   ��    AAA �� ��  ��A    �A �A� �E� �� \A �$�E� � \A EA �� \@"�̀�� ��  @��C ��B ƂD��� ��� � �B @�ƂD �� ��� C �B ƂD��@�ƂE �@��� � �B ��  FCFCC  � �C A� C�B @�ƂE��� ��� � �B ��  �B �BG �� ��� � �B @��BG��� ��� � �B �H �� ��� C �B @��H��� ��� � �B ��H��� ��� 	 �B  ���H@�� ��� �	 �B @���H��� ��� 
 �B �BJW��@��� �
 FCJ�C ��B �KW��@��� C FK�� ��B ��K CL@��� ��W�J@ �@B  �� E  F��� �   AD \���� ��  �A� �C��C a�  ��E F��� ��  \A� � 9      db 	   getTable    radvd            getAttribute    networkInfo    _ROWID_    1    netWorkMode        printLabel 5   Please Set IP Mode to IPv4/IPv6 to configure RADVD.
 &   Router Advertisement Daemon ( RADVD )    pairs       �?   print 	   Row Id:          radvd.isEnabled    RADVD Status: Enabled    0    RADVD Status: Disabled    radvd.UnicastOnly '   Advertise Mode: Unsolicited Multicast.    Advertise Interval:     radvd.MaxRtrAdvInterval 
    Seconds
    Advertise Mode: Unicast only
    RA Flags : 
    radvd.AdvManagedFlag    Managed: Disabled    Managed: Enabled    radvd.AdvOtherConfigFlag    Other: Disabled    Other: Enabled    radvd.AdvDefaultPreference    Router Preference: Low    2    Router Preference: Medium    3    Router Preference: High    radvd.AdvLinkMTU     MTU:     radvd.AdvDefaultLifetime    Router Lifetime:  	    Seconds    radvd.LogicalIfName    string    sub       @   vlan    vlanId 	   vlanName    Interface:     
    resTab                       *    n   E   F@� ��  \� �   ��   AA A � @�  ����F ���  �B�� A� � � ܂��B    ��B ����� D@ �C �� C @�� D@ �C �� C � D@ � �C��C    ��C C � D@ �� ����C    ��C C � D@ � �C��C    ��C C � D@ �� ����C    ��C C  CG@ �� ��W�G@ �@C  �� E  FC�� �C   A� \���� �D� � [D�  �AD �C !�   �� I@ ��  A� � %      db 	   getTable    radvdLANPrefixPool            printLabel (   List of Available Prefixes to Advertise    pairs       �?!   radvdLANPrefixPool.interfaceName    getAttribute    radvd    LogicalIfName 
   isEnabled        1    resTab    insertField    Radvd Status    Enabled 	   Disabled    ROW ID    radvdLANPrefixPool._ROWID_    IPv6 Prefix "   radvdLANPrefixPool.radvdAdvPrefix    IPv6 Prefix Length (   radvdLANPrefixPool.radvdAdvPrefixLength 
   Life Time *   radvdLANPrefixPool.radvdAdvPrefixLifetime    string    sub       @    vlan    vlanId 	   vlanName 
   Interface    print                     ,  K    
>   @ @@��
  �  �  	��A �AA� � �A � ��E�  IÅE�  I����F @ � � @�   �A� � @� �@A DAA �� ��� �  �  @@@�� A A A J  �@ W@@���  EA F���A ��  �A \��	A���  	� ��  �@E�  � �          �? 
   configRow    radvdLANPrefixPool._ROWID_    -1    db    getAttribute    WanMode    _ROWID_    1    DedicatedLogicalIfName (   radvdLANPrefixPool.radvdAdvPrefixLength    64 %   radvdLANPrefixPool.Base6to4Interface        LAN    getRow    radvdLANPrefixPool    interfaceName    print    Row doesn't exist.
       �   radvdLANPrefixPool.vlanId                     M  _   7   A@  G   E�  F�� �  \� W@�  �� � �   �� ��� �� �  ŀ � ��@B �B ��@ ��C�   AB A� �� �  �� ���@ ��C�   AB A �� �  �� �� @D� ���  ��D�@� ��  ��D�  A E �� ����� �� ŀ � � �       DBTable    radvdLANPrefixPool    db 	   getTable    radvdLANPrefixPoolTable     statusMessage 5   Maximum limit for Advertisement prefixes is reached.    ERROR    radvdLANPrefixPool._ROWID_    -1 
   errorFlag    statusCode    radvd    profileConfig    add    edit    OK    save    getAttribute    stringsMap 	   stringId 	   LANGUAGE                     a  m    "   A@  G   J   G�  E�  � A I���E�  Z   @�E� F � ��  \� �� G@ E@ @� � �E� F�� \@� E� F@� �� �� � E \��G  E@ �  ^ � �       DBTable    radvdLANPrefixPool    rows    rowid    radvdLANPrefixPool._ROWID_ 
   errorFlag    statusCode    radvdPrefix    deleteProfiles    OK    db    save    statusMessage    getAttribute    stringsMap 	   stringId 	   LANGUAGE                             