LuaQ                	�      A@  ��  ��@@�  A@ @   A� @   A� @   A  @   A@ @   A� @   A� � A@ G  A� G� A@ G  A� G� A@ G  A� G� A@ G  A� �� �� �@ �  �� �� 
  	AH�	�H�	�ȑ	I�	Aɒ	�I�	�ɓ	J�	Aʔ	�J�	�ʕ	�I�	K�	A˖	�K�	�˗	L�	A̘	�L�	�ʕ	�̙	Aɒ	M�	A͚	�M�	�͛	N�	AΜ	�N�	O�	AϞ	�O�	�ϟ	P�	AР	�P�	ѡ	�Ѣ	AΣ	AR�E �� \� � �� �� �  ܁ $     B $B     � $�       �� $�       � $   �B $B   �� $�      �� $�      � $   �B $B   �� $�   �� $�   �    $      �       B $B   �               �� $�   �� $�   � $       �   B $B   �       � $�      �� $�   �    $      �  �     B $B   �� $�      �� $�      � $   �            �B  � f      module    com.teamf1.core.wireless.wds    package    seeall    require    teamf1lualib/db    teamf1lualib/util    teamf1lualib/validations    teamf1lualib/returnCodes    teamf1lualib/dot11_returnCodes #   teamf1lualib/wireless_accessPoints +   com.teamf1.core.wireless.dot11.returnCodes    radioTable    dot11Radio    portMgmtTable    VlanPortMgmt    bridgePortsTable    bridgePorts    wdsPeersTable    dot11WDSPeers 
   vlanTable    vlan 	   vapTable 	   dot11VAP    profileTable    dot11Profile    radio11nTable    dot11Radio11n    interfaceTable    dot11Interface    /pfrm2.0/bin/iwconfig    wds    ROW_ID    _ROWID_    wdsEnabled    wdsPskPassAscii    pskPassAscii    wdsIndexNo    PortNumber    interfaceName    portEnabled    bridgeInterface    vlanEnabled    vlanId 	   PortName    PortLogicalName 	   PortType    PhyInterfaceName    PortVlanMode    DefaultPVID 	   portName 	   vlanName    profileName    pairwiseCiphers    pairwiseCipher    radioNo    ssid    vapName 
   defaultAP    ap1    authMethods 	   security    groupCipher    wepAuth    macAddress    trunk    vapEnabled    bridge    BRIDGE    vapDisabled    VAP-DISABLED    apName    defaultInterface    vap0    com.teamf1.core.returnCodes    com.teamf1.core.validations &   com.teamf1.core.wireless.accesspoints    getdefaultAP    getdefaultInterface    iswdsEnableEnabled    iswdsEnableEnabledNext    wdsEnableEnable    wdsEnableDisable    macAddressGet    macAddressGetNext    macAddressSet    wdsGroupGet    wdsGroupGetNext    dot11WDSPeersDummyUpdate    wdsGroupSet    acWdsGroupSet    wdsGroupCreate    wdsGroupDelete    wdsPeerGroupCreate    acWdsPeerGroupCreate    bridgeCreate    bridgeDelete    wdsGroupGetCur    wdsPeerGroupGetAll    wdsPeerGroupDelete    wdsPeerGroupDeleteAll    acWdsRadio_vap_restart        t   z        @ � �D   I���@ �D   I��� �          �?
   defaultAP    ap1    ap5                     |   �        @ � �D   I���@ �D   I��� �          �?   defaultInterface    vap0    vap4                     �   �        E   F@� ��  ��   D  FA�\���� � �� � ��A�  � � � B�@  � �   � 
      db    getAttribute 	   wdsTable    _ROWID_    1 
   wdsEnable     FAILURE    SUCCESS       �?                    �   �       �   �@��  A�  � �  ��܀�@�� �� �A@ �� �A@ ��  �       db    getAttribute 	   wdsTable    _ROWID_ 
   wdsEnable     FAILURE    SUCCESS                     �   �       �   @@� ��   ��@�   � ��   ��@�   � � �       status     FAILURE    SUCCESS                     �   �       �   @@� ��   ��@�   � ��   ��@�   � � �       status     FAILURE    SUCCESS                              E   F@� ��  ��   D  FA�\���� � �� � ��A�  � � � B�@  � �   � 
      db    getAttribute 	   wdsTable    _ROWID_    1    macAddress     FAILURE    SUCCESS       �?                    *  ?      �   �@��  A�  � �  ��܀�@�� �� �A@ �� �A@ ��  �       db    getAttribute 	   wdsTable    _ROWID_    macAddress     FAILURE    SUCCESS                     M  m       � � ��   �@��  ŀ   �� ��   ���   � ��   � �   � � �        INVALID_ARGUMENT    status    FAILURE    SUCCESS                     {  �          @@ � �   �@      �@ A  �@    �       status     FAILURE    SUCCESS       �?	   wdsGroup                     �  �      �   @@� ��   ��@�   � ��   ��@� �  �   �       status     FAILURE    SUCCESS 	   wdsGroup                     �  �    H   �   �   A  W�@@�A  �@� � @A  ���  �� �  �A  ABE� �� ��B� � BC��@   �� W�C  	� @  � �A�� ADE� �  ��D��@  �    @� @���AF�� �� �BE���� ���� D� F���� ��B����� �C�  ܂ ǂ !�  ��  �A  �            
   UNIT_NAME 	   DSR-150N 	   DSR-250N    HW_SER    Bx       �?   SUCCESS    db    getAttribute    radioTable    ROW_ID    1    wdsEnabled      	   tonumber 	   getTable    wdsPeersTable    FALSE    pairs    macAddress    valid    setAttribute                     �  T     �     A@E�  �  ��@�  ��  BA��D� F��W@ �E� � \�  �� �D FA��  ^�C��  �A@Ł   �B@  �  �C����  �A��  D  F���  �A�  �B�܁�  B@E� �  �BC��  �C��B    � A �B W�D@��B �D� �� @E  �A� �� � ��� �F� ���BF�� �� @ �� ��FW��� ��� �F� �� ��   C��@ �� ��AW���� �BG� �� �  @��  �B@ł   �B@  �  ��G����  �� ��   �G�ɀ �  ��Gł  �@  �� �E� ��� ��   ���  �B�� D� F��܂� E	 ��\���E���� �W@I@ ��I@��  ���	��	 �	 ��  ��	��	W �	@��  �D�	� D  F��
�  ��B��	܄ � A� �  ��I�
�D
� A� �  �J�
�D
  �G
E� ��	�  �����	� �E
��D� F�
�  ^�@
��� Ƅ�	W�@	��  ���	��	W� ��  Ƅ�	� D  F��
�  ��B��	�  ���  ܄ ��	���� Ƅ�	W����   ��  Ƅ�	� D  F��
�  ��B��	�  ���  ܄ ��	W@  ���  ��D   �K
	�E
��  ��	@��� ���   �K
	�E
��  ��	a�  ���   �D� F���  ^�� �D� F��  ^� � 1      db    getAttribute 	   vapTable    vapName 
   defaultAP    vapEnabled    NIL 	   tonumber            WDS_IS_CONFIGURED_ERR2    radioTable    ROW_ID    wdsEnabled    profileName    profileTable 	   security     
   UNIT_NAME 	   DSR-150N 	   DSR-250N    HW_SER    Bx       �?    INVALID_ARGUMENT    booleanCheck    SUCCESS    .    util    isAllMasked    wdsPskPassAscii    update    FAILURE 	   getTable    wdsPeersTable    FALSE    pairs    OPEN    WEP    pskPassAscii    pairwiseCipher    getRow    setAttribute    1 	   statCode    bridgeCreate    wdsIndexNo    0    bridgeDelete                     _  �   X  �   
  D  F��  �@�A  ��� ���     �A �� BAE� �� ��A�  � B��@� � �D  F��^ D F���� \� ��D  F�W@�� �D  F��^ E FB��B �� Ƃ�� �CD� F�\���  �@W�� ��B ���� �D� �����D�  ��� �BA�B � �CD� F���� �E���� �B�C D� F�� �� ƃ�܂��B    ���  CFD �� ���F A UC�C C  W�@� �C  @G �W@ ���� @� M�F � G� � ��@�  �� M�F � G� � � A� �� �B��@   @W ��	 CI@ �   @� CAE� �� ��A�  � �I���  � A� �� ��I�ɀ �� ��IŃ  �@  �@B� �D  F��  ^�@J� �E FD���
 \D E F��� �  �D�	\���� ń  ������F	��W��@ � �@�D� FF�FF�� �D� F��FFW��@�E F��� �� ���� �A\� � �� � GL�I�E� �� � �L�I�E� ��I�  �D� F��FG�� @B���  ��   ��@�D  F�W@@�D� FF�FFW@ �E F�� �� ���� �AD� FG�� \� ��EF  W��@�EF  W@���W@  ���  �E �� �FM����F\� �� ��@�@� ��E� �� �FM����F\� �� ���  ��� �D�	E D� F��
�� ��C�� ��܄���	@B� ��  ��	   ��� Ƅ�	E D� F�
�� �  U�
܄� �	�  @�W@B����  ��DN �	@�ƄN� @�	E
E FE�
� �� �M�F � ���\E �  ��	   ��� ��  ��	   �� � =      NIL 
   UNIT_NAME    DSR-1000AC    getdefaultAP    db    getAttribute    radioTable    ROW_ID    wdsEnabled     INVALID_ARGUMENT    booleanCheck    SUCCESS 	   vapTable    vapName 
   defaultAP    vapEnabled 	   tonumber            WDS_IS_CONFIGURED_ERR2    profileName    profileTable 	   security        os    execute            �?	    key off 
   DSR-500AC    1 	   statCode    bridgeCreate    0    bridgeDelete    .    util    isAllMasked    wdsPskPassAscii    update    FAILURE 
   NOUPDATES    rm -f /var/wdsPageAccessed 	   getTable    wdsPeersTable    FALSE    pairs    OPEN    WEP    pskPassAscii    pairwiseCipher    getRow    setAttribute    wdsIndexNo    getRowWhere    ='    '    dot11Profile.security    dot11Profile.defWepkeyIdx    dot11Profile.wepkey     key                               �   � @�   �       NOT_SUPPORTED                             D   F � ^   �       NOT_SUPPORTED                     #  {   �   J   �   �   A  W�@@�A  �@� � @A  ��� � BEA �  ��W�B��T ���@� �D  F�^ D� FA�@ � �D� F��^ E� F���A � ��   D F�\��W��� ��  �AD� �A ��  D�I  �� ��C��  EAB � ��E����� ���� D F��� � ��܁��A    ��A � �CE� � ��E�  �F��B    �B A� �B  W�@@��B  �@� �� @A  �A� � �BG��� ���W�B@�� ��� �L�B܂����B � D F��B�C�  �C I ��B � D FC��B�I@��B � D F���B�I���B � D F��B�I@��� ����	 D F��C � ���܂��B    ��B � EC �� � ��UÃ�� ��CŃ	  EAD � �J	���I���  �E� FC��C � ƃ�  \� Z  � ��B��  � �EC �� � ƃ�UÃI �����W�J@ � K��EC �� � ��UÃI@�EC �� � ��UÃI@�E� FC��C �� \��� �@� �EC �� � ƃ�UÃFC� �� �CC��@ ��� ��K� ����� �� �  �   � �D� FC�^ � �D� F��^  � 3         @
   UNIT_NAME 	   DSR-150N 	   DSR-250N    HW_SER    Bx       @   db 	   getTable    wdsPeersTable        �?   MAX_WDS_REACHED    NIL    INVALID_ARGUMENT    getAttribute    macAddress    MAC_ALREADY_IN_USE    . 	   vapTable    ROW_ID    1    profileName    profileTable    pairwiseCiphers     	   security            string    find    +    sub    pairwiseCipher    radioNo    ssid    tf1WdsMagic    pskPassAscii    dlink    radioTable    wdsEnabled    wdsPskPassAscii 
   existsRow    wdsIndexNo    OPEN    WEP    insert    FALSE 	   statCode    bridgeCreate    SUCCESS    FAILURE                     �  �   �   �   �     EA  ��  ��  D  F�@ � �D  FA�^ D  F�@� � �D  FA�^ E� F��� �� �A�   D� FB�\��W��� �� ��B� � � � BB��  �� ��A�A � �C@� �� ��C���Ł ��� D� F��� �� �B�܁��A    ��� � �AE �� ��C� � �D��B    �� E FB����� \��W�E@ � F@ �����W��@�� �BF�������� ��  ��� � � � G��B�  ��� ��� � � CG��@ � � � �G���G� � � H��@H�� ��Ał � �C@� �� ��H����B    ��� ��  A �� �H�E� F���� �� ƃ� � D� F�\���@ ���� CIE ��	 �� �	 @��
 ����  � �̂���  �@��� � CJ  A �� ��J���W�E@ � F�� A �� �G���D A �� �H���D� �JE � ���  C  W K@�C  W@K���K � A �� ��J�D  F�@@ �D  ���EC ��F\� � � ��   � �  �L � �  �L  � 4         @
   UNIT_NAME 	   DSR-150N       @   NIL    INVALID_ARGUMENT    db    getAttribute    wdsPeersTable    macAddress     MAC_ALREADY_IN_USE    . 	   vapTable    ROW_ID    profileName    profileTable    pairwiseCiphers     	   security    string    find    +    OPEN    WEP    sub       �?   TKIP    pairwiseCipher    radioNo    ssid    tf1WdsMagic    pskPassAscii    dlink    radioTable    wdsEnabled    wdsPskPassAscii    getRowWhere 
   radioNo='    ' and wdsIndexNo='    '    MAX_WDS_REACHED    wdsIndexNo    insert    DSR-1000AC 
   DSR-500AC    1    FALSE 	   statCode    bridgeCreate    SUCCESS    FAILURE                     �     �   B   �   �@  ƀ��  D  F�� ܀ �   ���@   ܀ ����  � � ����    AA �  ��B�A� �  U���@ AA �  �C��@C AA �  ��C���C AA �  �D��@D AA �  ��D��@C AA �  ��D��@CA  EE ����@  Z   ��
  E�  �A �  ��U��	��E�  �A �  �A�U��	��E�  �A �  ���U��� �A   ܁ ́���	��E�  �A �  �A�U��	��E�  �A �  ���U���� �  ��	��E W@�@�E W����E�  �A �  ���U��	�@�E�  �A �  ���U��	A�E�  �A �  �A�U��	A�EA  F���  � \��@ �Z   ��
  E� �A �  ���U��� �A   ܁ ́���	��EA  F��� �� �A�\����	 ��	  �� ���A��D  F��FC��@�E� �C �  ƃ�UÃ�  ��D��	��E� �C �  ��UÃ�  �J��	��Z   @�EC  F��� � \��@ ��   � � EA
 � � *      14    db 
   existsRow    portMgmtTable    PortNumber 	   tonumber       �?       bridgePortsTable    .    interfaceName    wds    portEnabled    1    bridgeInterface    bdg    vlanEnabled    0    vlanId    trunk    insert 	   PortName    dummy    PortLogicalName    port 	   PortType    BRIDGE    PhyInterfaceName 
   UNIT_NAME    DSR-1000AC 
   DSR-500AC    PortVlanMode    2    DefaultPVID 
   vlanTable 	   portName 	   getTable    FALSE            pairs 	   vlanName 	   statCode                       %   3   D   F � �@  ��@��  � AAA �  U���� ����@    ��� �@  � �A D� F��� ܀ @ �Z   @��@  � ��  D� F��A �  ��܀ @ �Z   @��@  � �� D� F��A �  ��܀ @ �� � A � � �       FALSE    db    getAttribute    portMgmtTable    PhyInterfaceName    wds    PortLogicalName     
   deleteRow 
   vlanTable 	   portName    bridgePortsTable    interfaceName 	   statCode                     4  �     �    @@� ��  @  B �  AEB �  ��A�  � D� F��@� �D� F�^ EB �B �  Ƃ�UF@EB �B �  ���UFB�� ��AW�� ��B �B   �B�� �B�C AC �  ��B�܂ 	��B �B   �B�F���  ��C��   DD  FC��  ��D�����  ��� D  F���C � � U�܂� AC �  ��E���@   ��   AC �  �CF��A   �  AC �  ��F�� � AC �  ��F���F� ��   @� AC �  ��F��@G@� AC �  ��G���@   ��   AC �  ��G��A   �  E   � �EC W��@�E� F��C	 \�  ���E  W@� �E  W��@�E� F���	 \�  ���EC �C �  ��UÃFC�C
 ���
 ��� ��  ܃  �A ��J ����CK�C �  @��  W@� ��  W��@ �@ @�Ń ���  A � ܃ � �K@��D �� � � @��  W@� ��  W��@���  ��� ܃ �����  ��D @  �� Ճ��  DMD ����� ��� ��� ��� ��  ƃ�� D  F��  �DD	�  ���	܃�� �AW ��� @�� @N����N@  �� �  �@ ���� � � �N@  �� �  �@ ���� �  � <   
   UNIT_NAME    DSR-1000AC    getdefaultAP    db    getRow    radioTable    ROW_ID    NIL    FAILURE    .    wdsEnabled    wdsPskPassAscii    util    mask    getAttribute 	   vapTable    vapName 
   defaultAP    profileName    getRowWhere    profileTable    ='    '    pairwiseCiphers        authMethods 	   security    OPEN    None    WEP    groupCipher    wepAuth 	   DSR-250N    HW_SER    Bx    io    popen 6   /sbin/ifconfig vap0 | grep 'HWaddr' | cut -d' ' -f 11 
   DSR-500AC 7   /sbin/ifconfig wifi0 | grep 'HWaddr' | cut -d' ' -f 10    interfaceName    /sbin/ifconfig  #    | grep 'HWaddr' | cut -d' ' -f 10    read    *all    close    string    gsub )   %-00%-00%-00%-00%-00%-00%-00%-00%-00%-00    %-    : 	   getTable    radioNo    getRowsWhere     vapEnabled 	   tonumber            WDS_IS_CONFIGURED_ERR2    SUCCESS                     �  �          @@ E�  �   ��@��D   F � @  � �D   F@� ^  D   F�� �   ^ � �       db 	   getTable    wdsPeersTable    FALSE    NIL    FAILURE    SUCCESS                     �  �   
G   J   �   �   A  �@  ���  A  W A 
�A  W@A@	�� �AE �  �AB��   �B��A    � �B��E� F���A �  �A�   D  F��\��� �A  �܁ ́��� �� �  �� ��D�� �� �AE� � �EEA �  �AB�  � D� F��@� �D� F��  ^�D� FA��  ^� �          @
   UNIT_NAME 	   DSR-150N       @   DSR-1000AC 
   DSR-500AC    db    getAttribute    radioTable    ROW_ID    1    wdsEnabled        wdsPeersTable    wdsIndexNo 	   statCode    bridgeDelete 	   tonumber       �?   FALSE    dot11ReturnCodes    BRIDGE_DELETE_FAILED 
   deleteRow    NIL    FAILURE    SUCCESS                     �  �    P   
   B   �   �@  ��  ���  �@  W � ��@  W@�@�ŀ ��� D  FA��� �  ���܀��@    ��  � ACE� �� ��C����@�E � \���� ��Ał   CBD  FC�FC��  �CD�����  @ � CE�� � @ ��� �����   �@ �a�  @�ŀ ƀ�� ܀ � �E �� �� FEA �� �FEA � �          @
   UNIT_NAME 	   DSR-150N       @   DSR-1000AC 
   DSR-500AC    db    getAttribute    radioTable    ROW_ID    1    wdsEnabled     	   getTable    wdsPeersTable    FALSE    pairs    wdsIndexNo 	   statCode    bridgeDelete 	   tonumber       �?   deleteAllRows    NIL    FAILURE    cookie    SUCCESS                       t   �   �   � @�@  ��� ���     �@ �  �@�� D� F���  �� ��܀�@� � �  �B  �B@� � �    CW � �  �B  AAEA �� ��C�� ���� D��D  FA�W@ �E� � \� ��� �D�F��  ^�EA  ����EA �  \A D� F��� �AA�� � FD� F���� ��C���@F� ���Ɓ�� W@��'��� @'�E FA��� �� ���   D� F�\��� �AGŁ � �A@  �� ��A���� �  �@  � ��  ��G�  ��� �AA�� � �A@  �� �G���� �A�� D� F���  �� ���  ܁ � ��@  � ��  Ɓ�   ��� ��B D  FB�܁�� @�@�D� F�FC�� �E FC��C �� ���� �AD� F��� \� � ��@  � �D  F���  ^�D� F�FC�� �D F��� �CI���� \��� �@�D� F�FC�� �D F��� �CI���  �C�\��� �E FC���	 �� ��� JD� FD�\���� �D���F��� ��J�� �C��� �D� F���� �  ���� �D���I@�� ��J�� �C��� �D� F��� �  !�  ���    �D  F��  ^�� �D  F���  ^� � -      TRUE 
   UNIT_NAME    DSR-1000AC    getdefaultAP    db    getAttribute    radioTable    ROW_ID    wdsEnabled     INVALID_ARGUMENT    booleanCheck    SUCCESS 	   vapTable    vapName 
   defaultAP    vapEnabled    NIL 	   tonumber            WDS_IS_CONFIGURED_ERR2    getdefaultInterface    defaultInterface    interfaceTable    interfaceName    unused    DEFAULT_IDENTITY_CHANGED    1    radioNo    setAttribute    FAILURE    radio11nTable 	   getTable    FALSE    pairs       �?   vapPortEnableSet    apName    0    profileTable    profileName    ssid    vlanPeerSSIDSet    bridge    vapDisabled                             