LuaQ                �      A@  ��  ��@@�  A@ @   A� @   A� @   A  @   A@ @   A� � E  �� \� �  �  �� �@ � A G� A� GA J  G� E� IAE�E� IAC�E� IƋE� I�ƌE� IǍE� I�ǎE� I�ǏE� IAH�E� I�H�E� IɑE� I�ɒA
 G�	 E� IAʔd      G�
 dA      G�
 d�    �    G d�         GA d     G� dA     G� d�       �G d�     GA d     G� dA          �G� d�     G d�     GA d          �G� dA     G� d�     G d�     GA d     G� dA     G� d�     G d�     GA d     G� dA     G� d�     G d�     GA d     G� dA     G� d�     G d�     GA d     G� dA     G� d�     G d�   �       �   GA d     G� dA     G� d�     G d�     GA d	     G� dA	     G� d�	     G d�	     GA d
     G�  � S      module    com.teamf1.core.services.upnp    package    seeall    require    teamf1lualib/db    teamf1lualib/util    teamf1lualib/validations    teamf1lualib/returnCodes !   teamf1lualib/libupnp_returnCodes    com.teamf1.core.returnCodes    com.teamf1.core.validations $   com.teamf1.core.libupnp.returnCodes    1    0 
   upnpTable    upnp    upnpPortMapTable    upnpPortMap 
   attribute    key    _ROWID_ 	   keyvalue    feature    upnpEnable 
   interface    interfaceName    advertisementPeriod 
   advPeriod    timeToLive    advTimeToLive    active 
   ipAddress    ipAddr 	   protocol    internalPort    intPort    externalPort    extPort 
   vlanTable    vlan    vlanId    isfeatureEnabled    isfeatureEnabledNext    featureEnable    featureDisable    interfaceGet    interfaceGetNext    interfaceSet    advertisementPeriodGet    advertisementPeriodGetNext    advertisementPeriodSet    timeToLiveGet    timeToLiveGetNext    timeToLiveSet 
   activeGet    activeGetNext 
   activeSet    ipAddressGet    ipAddressGetNext    ipAddressSet    ipAddressDelete    protocolGet    protocolGetNext    protocolSet    internalPortGet    internalPortGetNext    internalPortSet    externalPortGet    externalPortGetNext    externalPortSet    upnpConfigGet    upnpConfigGetNext    upnpConfigSet    upnpConfigCreate    upnpConfigDelete    upnpNetworkEntryGet    upnpNetworkEntryGetNext    upnpNetworEntrySet    upnpNetworEntryCreate    upnpNetworEntryDelete    upnpPortMapListGet    upnpRefreshSet )       L   Y           @@ E�  ��  � A��  �@��  �A��D   F�� @  � �D   F � ^  D   F@� �� �   ^   �       db    getAttribute 
   upnpTable 
   attribute    key 	   keyvalue    feature    NIL    FAILURE    SUCCESS       �?                    i   l       D   F � ^   �       NOT_SUPPORTED                     }   �       E   F@� ��  ��  � ��  AAE�  F���  \� � � ��A�� � �� � � B�   � �� � �@B�   � � � 
      db    setAttribute 
   upnpTable 
   attribute    key 	   keyvalue    feature    NIL    FAILURE    SUCCESS                     �   �       E   F@� ��  ��  � ��  AAE�  F���  \� � � ��A�� � �� � � B�   � �� � �@B�   � � � 
      db    setAttribute 
   upnpTable 
   attribute    key 	   keyvalue    feature    NIL    FAILURE    SUCCESS                     �   �           @@ E�  ��  � A��  �@��  �A��D   F�� @  � �D   F � ^  D   F@� �� �   ^   �       db    getAttribute 
   upnpTable 
   attribute    key 	   keyvalue 
   interface    NIL    FAILURE    SUCCESS       �?                    �   �       D   F � ^   �       NOT_SUPPORTED                     �      A   �  �@�� � ��  �A@� �� Ł  ���  A �B ܁ ��Ł ��� EB F��� ܁ @���� ��  �A�� � ��  ��  � ��� � �Ł �A�� EB F���B �D�B �B� � ܁ @�� ��  Ɓ�� �  ����� ��  Ɓ�   ���  ���   �� �       NIL    INVALID_ARGUMENT    string    gsub    bdg        db 
   existsRow 
   vlanTable 
   attribute    vlanId     isfeatureEnabled    setAttribute 
   upnpTable    key 	   keyvalue 
   interface    FAILURE    SUCCESS                       ,          @@ E�  ��  � A��  �@��  �A��D   F�� @  � �D   F � ^  D   F@� �� �   ^   �       db    getAttribute 
   upnpTable 
   attribute    key 	   keyvalue    advertisementPeriod    NIL    FAILURE    SUCCESS       �?                    <  @      D   F � ^   �       NOT_SUPPORTED                     P  z   6   �  �@�� � ��  �A@� ��  �� �� X�@@ ���� ��� �A�� Ł ��  ��  � �� � ��� ��B E� F���� �Cł �B� � ܁ @�� ��  Ɓ�� �  ����� ��  Ɓ�   ���  ���   �� �       NIL    INVALID_ARGUMENT 	   tonumber       �?     �@   ADVERTISEMENT_PERIOD_INVALID    isfeatureEnabled    db    setAttribute 
   upnpTable 
   attribute    key 	   keyvalue    advertisementPeriod    FAILURE    SUCCESS                     �  �          @@ E�  ��  � A��  �@��  �A��D   F�� @  � �D   F � ^  D   F@� �� �   ^   �       db    getAttribute 
   upnpTable 
   attribute    key 	   keyvalue    timeToLive    NIL    FAILURE    SUCCESS       �?                    �  �      D   F � ^   �       NOT_SUPPORTED                     �  �   6   �  �@�� � ��  �A@� ��  �� �� X�@@ ���� ��� �A�� Ł ��  ��  � �� � ��� ��B E� F���� �Cł �B� � ܁ @�� ��  Ɓ�� �  ����� ��  Ɓ�   ���  ���   �� �       NIL    INVALID_ARGUMENT 	   tonumber       �?     �o@"   ADVERTISEMENT_TIME_TOLIVE_INVALID    isfeatureEnabled    db    setAttribute 
   upnpTable 
   attribute    key 	   keyvalue    timeToLive    FAILURE    SUCCESS                     �  �          @@ A�  ��  ��E   F � ��  �@ ƀ�   EA F��\���   � B�� � ��   �@B�  �   ��B��  � �   �       db    getNextRowId    0    upnpPortMapTable    getAttribute 
   attribute    key    active    NIL    FAILURE    SUCCESS       �?                      )   :   D   F � W@  ��E@  �   \� �   � @�� @ �E�  ^  E�  F � �@ ŀ ���   \�  � @ �E�  ^  E�  F@� �   �@ \���   � @�� @ ��� �  ��  ��B�  � �A@� �� �AC����   � �� � ��   ƀ� � � ��   ��� � @ �   �       NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    upnpPortMapTable 
   attribute    key     getNextRowId    TABLE_IS_FULL    getAttribute 
   upnpTable    active    FAILURE    SUCCESS                     9  =      �   � @�   �       NOT_SUPPORTED                     I  W          @@ E�  ��  � A��  �@��  �A��D   F�� @  � �D   F � ^  D   F@� �� �   ^   �       db    getAttribute    upnpPortMapTable 
   attribute    key 	   keyvalue 
   ipAddress    NIL    FAILURE    SUCCESS       �?                    g  �   =   �   � @W�  ���@  �   �� �   � �� � ��   ��@�  ��  � A�@ � �A@  ��  B� ��   ��@�  ��  �@B�   A ����   � �� � ��   ƀ��  ��  ��� E� F��� Ł �A�܀�  @ �� �  �C@ �  �C@ ��  �       NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    upnpPortMapTable 
   attribute    key     getNextRowId    TABLE_IS_FULL    getAttribute 
   upnpTable 
   ipAddress    FAILURE    SUCCESS                     �  �      �   � @�   �       NOT_SUPPORTED                     �  �      �   � @�   �       NOT_SUPPORTED                     �  �          @@ E�  ��  � A��  �@��  �A��D   F�� @  � �D   F � ^  D   F@� �� �   ^   �       db    getAttribute    upnpPortMapTable 
   attribute    key 	   keyvalue 	   protocol    NIL    FAILURE    SUCCESS       �?                    �  �   =   �   � @W�  ���@  �   �� �   � �� � ��   ��@�  ��  � A�@ � �A@  ��  B� ��   ��@�  ��  �@B�   A ����   � �� � ��   ƀ��  ��  ���A E� F��� Ł ��܀�  @ �� �  AC@ �  �C@ ��  �       NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    upnpPortMapTable 
   attribute    key     getNextRowId    TABLE_IS_FULL    getAttribute 	   protocol    FAILURE    SUCCESS                       	      �   � @�   �       NOT_SUPPORTED                       %          @@ E�  ��  � A��  �@��  �A��D   F�� @  � �D   F � ^  D   F@� �� �   ^   �       db    getAttribute    upnpPortMapTable 
   attribute    key 	   keyvalue    internalPort    NIL    FAILURE    SUCCESS       �?                    5  S   =   �   � @W�  ���@  �   �� �   � �� � ��   ��@�  ��  � A�@ � �A@  ��  B� ��   ��@�  ��  �@B�   A ����   � �� � ��   ƀ��  ��  ��� E� F��� Ł �A�܀�  @ �� �  �C@ �  �C@ ��  �       NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    upnpPortMapTable 
   attribute    key     getNextRowId    TABLE_IS_FULL    getAttribute 
   upnpTable    internalPort    FAILURE    SUCCESS                     c  g      �   � @�   �       NOT_SUPPORTED                     u  �          @@ E�  ��  � A��  �@��  �A��D   F�� @  � �D   F � ^  D   F@� �� �   ^   �       db    getAttribute    upnpPortMapTable 
   attribute    key 	   keyvalue    externalPort    NIL    FAILURE    SUCCESS       �?                    �  �   =   �   � @W�  ���@  �   �� �   � �� � ��   ��@�  ��  � A�@ � �A@  ��  B� ��   ��@�  ��  �@B�   A ����   � �� � ��   ƀ��  ��  ��� E� F��� Ł �A�܀�  @ �� �  �C@ �  �C@ ��  �       NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    upnpPortMapTable 
   attribute    key     getNextRowId    TABLE_IS_FULL    getAttribute 
   upnpTable    externalPort    FAILURE    SUCCESS                     �  �      �   � @�   �       NOT_SUPPORTED                     �  �    E   
  E  FA���  ��  ���  BA\�  �D  F��@� �D  F��^ E�  � ��  �A�U��@E�  � ��  Ɓ�U��F@E�  � ��  ���U���@E�  � ��  ��U���@D  F��W@ ��D  F��W@� ��D  F��W@� �D  F��@�� �D  F��^ D  FA��� �   � @ ��^� �       db    getRow 
   upnpTable 
   attribute    key 	   keyvalue    NIL    FAILURE    .    feature 
   interface    advertisementPeriod    timeToLive    SUCCESS       �?                            D   F � ^   �       NOT_SUPPORTED                       E   W   �  �  �� � ܁ @��� �A�W��� ��� Ɓ�� � ��  ���   �܁ X �@ ����� ���A �  @ � X A@ � ��� �D�F�^ EB �� �� ��U�A�EB �� �� �B�U���EB �� �� Ƃ�U���EB �� �� ���U��@��A � E� F��A��A�� �A�B @ �� ��D܁ � �D �� �� E@  �� B@@  � �       booleanCheck    SUCCESS    INVALID_ARGUMENT 	   tonumber       �?     �@   ADVERTISEMENT_PERIOD_INVALID      �o@"   ADVERTISEMENT_TIME_TOLIVE_INVALID 
   upnpTable    . 
   attribute    feature 
   interface    advertisementPeriod    timeToLive    db    update 	   keyvalue    NIL    FAILURE                     V  Z        @  �       NOT_SUPPORTED                     f  j      D   F � ^   �       NOT_SUPPORTED                     }  �    P   J  �  �A@Ł  �  AE�  FB��� @ �  ��A��� ��  ��A� ��  � �  BB�����  � �  �B�F����  � �  �B������  � �  C�ƀ���  � �  BC����  ��AW� ���  ��AW�� ���  ��AW����  ��AW��� ��  ��A�� ��  ��A� �  ��C��    @� � ��  �  �       db    getRow    upnpPortMapTable 
   attribute    key 	   keyvalue    NIL    FAILURE    . 
   ipAddress    active 	   protocol    internalPort    externalPort    SUCCESS       �?                    �  �   t   D   F � W@  ��E@  �   \� �   � @�� � �D   F�� ^  E�  F � �@ ŀ ���   \�  � � �D   F�� ^  E�  F@� �   ŀ \���   � @�� � ��   ��B�  ��  � Cŀ � �A@� �� �   � �� � ��   �@��  � �� A� �� ��C�� � A� �� �D�� A� �� �BD�F� A� �� ��D��� A� �� ��D��  @W ���  @W ��  @W ���  @W � �  @ �� �  BC   E@� ���  �@ ��  �       NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    upnpPortMap 
   attribute    key     getNextRowId    upnpPortMapTable    TABLE_IS_FULL    getRow    FAILURE    . 
   ipAddress    active 	   protocol    internalPort    externalPort    SUCCESS                     �  �      �  �@�  �       NOT_SUPPORTED                             D  F�^  �       NOT_SUPPORTED                             D   F � ^   �       NOT_SUPPORTED                       (       
   E   F@� ��  \�   � D   F�� @  � �D   F � ^  D   F@� �� �   ^   �       db 	   getTable    upnpPortMapTable    NIL    FAILURE    SUCCESS       �?                    *  6           @ E@  F�� ��  �  A A� \��  � D   F � W@   �E  F@� �   �� � A �@\� G� D   F@� �� ^ � �       NIL    db    getAttribute    environment    name    UPNP_REFRESH_PROGRAM    value    status    os    execute         /tmp/system.db     > /dev/null    SUCCESS       �?                            