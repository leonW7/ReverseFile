LuaQ                8      A@  @    A�  @    E�  W � @�E�  W@� � �E�  �� @ �� @�E�  W � @�E�  W@� � �E�  �� @ �� ��E�  W � � �E�  @� @ �� ��E�  W�� � �E�   �   �@ d   G� d@  G� d�      G  d�  G@ d  G�  �       require    teamf1lualib/gre    iprouteLuaLib 
   UNIT_NAME    DSR-1000AC 	   DSR-1000 
   DSR-1000N       9@
   DSR-500AC    DSR-500 	   DSR-500N       .@   DSR-250 	   DSR-250N       $@   DSR-150 	   DSR-150N       @   getGreTunnels    greCfgInit    greCfgSave 
   greCfgDel    greCfgInputVal        !   8      �   
   E   F@� ��  \� ��  �  �@ �@ � � � ��Ł ���   A �BB�B    ��� �A Ł ���   A� �C�B    ��� �A Ł ���   AB ��C�B    ��� �A Ł ���   A� �D�B    ��� �A �A W�� ��A W��@��A W �� ��A @�@�ƁE����Ł ���   A �B �A  �Ł ���   A ��E�B    ��� �A Ł ���   A� ��F�B    ��� �A Ł ���   A �BG�B    ��� �A Ł ���   A� ��G�B    ��� �A Ł ���   A �BH�B    ��� �A Ł ���   A� ��H�B    ��� �A ��  @��� � I�   A	 �@� � &      db 	   getTable    GRE    printLabel B   -------------------Configured GRE Tunnels------------------------    pairs    resTab    insertField    ROWID    GRE._ROWID_        Tunnel Name    GRE.TunnelName    IP Address    GRE.IpAddress    Subnet Mask    GRE.SubnetMask 
   UNIT_NAME 	   DSR-250N    DSR-250    DSR-150 	   DSR-150N    GRE.InterfaceName    WAN2 
   Interface    ROLLOVER_WAN 
   Remote IP    GRE.RemoteIp    DDP Enable    GRE.DdpBrd    Destination IP    GRE.DstIpAddr    Route Subnet Mask    GRE.RouteNetMask 
   Gatway IP    GRE.GwIpAddr    print                             :   F        F @ @�  �J   G�  E�  I ����E@ F�� �� �  @ \� G�  E�  @� @�E@ �� \@ A� �   ^ �E�  F�� ��  ^ � �          �? 
   configRow    GRE._ROWID_    -1    db    getRow    GRE    _ROWID_    print    Entered rowid does not exist
       �                    G   a    :   A@  G   A@  G�  A@  G�  A@ G  E� G� F B �@ ��B�  �� W�B ��    �  ��  ��  �@ �  � ���  ��� � �   @� �A �� �  �   ���� � �   @� �� �� �  �   �   ��� ��@ � ��@� �@ �  �@ �   �  � � �    
   errorFlag        statusCode    statusMessage    DBTable    GRE 
   UNIT_NAME 	   MODEL_ID    GRE._ROWID_    db 	   getTable  *   Maximum limit for GRE tunnels is reached.    ERROR    -1    gre 
   greConfig    add    edit    OK    save    print                     c   |     6   J   �   �     B  �  �A  Ɓ��  A �BA ܁ ���A� ���  �A  � �A  �A��A� �A  Ɓ��  @ ܁�@�Z  ���A  ���� �A �A � � @��A  ����A� � � A � @�� ��A  Ɓ��A� ��   �A  �           db    getRow    GRE    _ROWID_       �?    print    Entered rowid does not exist
    beginTransaction    delete    commitTransaction 
   errorFlag    OK    Operation Succeeded 	   rollback    ERROR    Operation Failed    save                     ~   �     �   F @ W@� � �F @ ��  �E�  �  \@ B   ^  F@A W@� � �F@A ��  �E�  �� \@ B   ^  F�A W@� � �F�A ��  �E�  �  \@ B   ^  F@B W@� � �F@B ��  �E�  �� \@ B   ^  F�B W@� � �F�B ��  �E�  �  \@ B   ^  F@C W@� � �F@C ��  �E�  �� \@ B   ^  F�C W@� � �F�C ��  �E�  �  \@ B   ^  F@D W@� � �F@D ��  �E�  �� \@ B   ^  F�D W@� � �F�D ��  �E�  �  \@ B   ^  E@ F�� �� \� �  � � � ���A Ɓ��C F�C�BD܁ �  ����F �F �� ���F  � ���  B �A �  � ��  @��  � � � ���A Ɓ�BA FBA��A܁ �  ����F �F �� ���F  � ���  � �A �  � ��  @��  ��B A FAB �� ���� �@ ��H�� � ���W@@@���F  � ��  � �����  A	 �@ �   �  @���F � ����    �  ��F F��W@ ��  AB	 B    �   ��@ ƀ��D FAA ��A ܀ �   � �� � �   ���  �	 �@ �   �  � 	 �   � (      GRE.TunnelName         printCLIError    Please enter valid tunnel name    GRE.IpAddress -   Please enter valid IP Address for GRE tunnel    GRE.SubnetMask .   Please enter valid subnet mask for GRE tunnel    GRE.InterfaceName "   Please enter valid interface name    GRE.RemoteIp %   Please enter valid Remote IP Address    GRE.DdpBrd $   Please DDP broadcast enable/disable    GRE.DstIpAddr /   Please enter valid destination network address    GRE.RouteNetMask $   Please enter valid route subnetmask    GRE.GwIpAddr &   Please enter valid gateway IP Address    db 	   getTable    GRE    pairs    iprouteLuaLib    ipSubnetCheck    GRE._ROWID_    -1 3   Static route for this subnet is already configured ,   Tunnel in this subnet is already configured    where    RemoteIp= '    ' and InterfaceName = '    '    getRowsWhere         B   GRE Tunnel with configured Remote IP and Interface already exists    0 4   Gateway should be in the same network of the tunnel                             