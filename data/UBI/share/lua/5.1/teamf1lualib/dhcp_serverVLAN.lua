LuaQ                	Q     A@    À@@  A@ @   A @   AÀ @   A  @   A@ @   A @   AÀ @   A   E  @ \   Á  Å  Á Ü A  Á  A    
  	Æ	Æ	Ç	AÇ	ÁG	AH	ÁH	AI	I	ÁÉ	J	AÊ	J	ÁÊ	AK	K	ÁË	L	AÌAÁ G AA G AÁ G AA G AÁ G AA G AÁ G AA G AÁ G AA G AÁ G AA G AÁ G AA G AA G AÁ GÁ AA G AÁ G AA G FÁFÁ Å  UG 	ÁÆ¬	V­	ÁÖ­	W®	A×®	W¯	Ø¯	AØ°	I±	ÁØ±	Y²	AÙ²	Y³	ÁÙ³	Z´	AÚ´	Zµ	ÁÚµAA G AÁ G A GÁ A GA AÁ G A GÁ AA GA C WÀ]   ^@ AA   W^  À^@ A   AA ¤         ¤A        Á ¤            ¤Á     A  ¤         ¤A       Á  ¤         ! ¤Á       A! ¤    ! ¤A    Á! ¤    " ¤Á       A" ¤       " ¤A    Á" ¤       # ¤Á       A# ¤       # ¤A       Á# ¤       $ ¤Á         A$ ¤       $ ¤A       Á$ ¤         % ¤Á       A% ¤       % ¤A         Á% ¤       & ¤Á       A& ¤         & ¤A       Á& ¤       ' ¤Á         A' ¤       ' ¤A       Á' ¤       ( ¤Á       A( ¤	       ( ¤A	       Á( ¤	            ) ¤Á	                  A) ¤
       ) ¤A
       Á)   ¨      module     com.teamf1.core.dhcp.serverVLAN    package    seeall    require    teamf1lualib/db    teamf1lualib/util    teamf1lualib/ipv6_mode    teamf1lualib/vlan_validation    teamf1lualib/validations    teamf1lualib/returnCodes    teamf1lualib/dhcp_returnCodes    com.teamf1.core.ipv6.mode !   com.teamf1.core.dhcp_returnCodes    com.teamf1.core.returnCodes    com.teamf1.core.validations    serverTable    dhcp    subnetTable 	   ifStatic    networkInterfaceTable    networkInterface    bridgeTable 
   ipAddress 	   StaticIp    subnetMask    NetMask    interfaceName    logicalIfName    LogicalIfName    domain    domainName    startIpAddress    startAddress    endIpAddress    endAddress    gateway 
   defaultGw    primaryDnsServer    secondaryDnsServer    winsServer 
   leaseTime    AddressFamily    addressFamily 
   ifGateway    Gateway    dhcpEnabled    enableDnsProxy    bridgeIndex 	   portName    MAX_LENGTH_DOMAIN_NAME       p@   DEFAULT_LEASE_TIME    24    DefaultVlan    1    vlanMinNumber       ð?   vlanMaxNumber      ú¯@   leaseMinTime            leaseMaxTime     @
A	   LAN_NAME    LAN 	   DMZ_NAME    DMZ 
   VLAN_NAME    VLAN 	   BDG_NAME    bdg 
   WAN1_NAME    WAN1 
   WAN2_NAME    WAN2    defaultGateway    0.0.0.0 
   defaultIp    ENABLE    DISABLE    0    ROWID    _ROWID_    IPV4_ADDRESS_FAMILY    2    where     != '    '    networkInterfaceName    VirtualIfName    ConnectionType    ConnectionType6    ifType    MTU    ipAddr    ipaddr    subnetmask    gatewayNetwork 	   IfStatus    refreshInterval    autoRefreshFlag    capabilities    restartFwForMe 
   ifGroupId    dns1    dns2    DHCP    BRIDGE_CONNECTION    bridge    STATIC_CONNECTION    DEFAULT_MTU    1500    REFRESH_TIME    5    COOKIE    cookie    DEFAULT_GATEWAY    PRODUCT_ID    DSR-1000AC_Ax    DSR-1000_Bx       0@   DSR-500AC_Ax    DSR-500_Bx        @      @   ipAddressGet    ipAddressGetNext    ipAddressSet    ipAddressDelete    subnetMaskGet    subnetMaskGetNext    subnetMaskSet 	   typeFind    typeGet    typeGetNext    typeSet 
   vlanIdGet    vlanIdGetNext 
   vlanIdSet 
   domainGet    domainGetNext 
   domainSet    startIpAddressGet    startIpAddressGetNext    startIpAddressSet    endIpAddressGet    endIpAddressGetNext    endIpAddressSet    gatewayGet    gatewayGetNext    gatewaySet    primaryDnsServerGet    primaryDnsServerGetNext    primaryDnsServerSet    secondaryDnsServerGet    secondaryDnsServerGetNext    secondaryDnsServerSet    leaseTimeGet    leaseTimeGetNext    leaseTimeSet    dhcpServerVLANGet    dhcpServerVLANGetAll    dhcpServerVLANGetNext    dhcpServerVLANSet    dhcpServerVLANCreate    dhcpServerVLANDelete    dhcpServerVLANDeleteAll *          µ     
8      E@    EÀ  @   D   F Á ^  E@ FÁ @  ÅÀ    D FÂ\À   À    @BÀ      BÁÀ  AA  CÁÁ   AÂ @Å@ Æ ÄA @  DÜ Á   À   AB@    ÁD@           firstCookieGet    serverTable    where    NIL    INVALID_COOKIE    db    getAttribute    ROWID    interfaceName    FAILURE    AddressFamily     = '    IPV4_ADDRESS_FAMILY    ' and     networkInterface    '    getAttributeWhere    subnetTable 
   ipAddress    SUCCESS                     Å   ã    @   E      Å@    \À ÅÀ  À @Å  À À Ä   Æ@ÁÞ   Ä   ÆÁÞ  ÅÀ Æ ÂA  EA  Ä ÆÂÜ  À   ÁB@  CAA  ÁÁ  DAB ÁB ÁEÁ FÄÁ À  E\  À   ÁBÀ   AEÀ           nextCookieGet    serverTable    where    FALSE    NIL    NEXT_ROWID_INVALID    INVALID_COOKIE    db    getAttribute    ROWID    interfaceName    FAILURE    AddressFamily     = '    IPV4_ADDRESS_FAMILY    ' and     networkInterface    '    getAttributeWhere    subnetTable 
   ipAddress    SUCCESS                     ó      M      À   A  E   ÅÀ  À      A  @      A     BÅ@   À À Ä   ÆÂÀ     A  À  CÅ@  A @   CÅ@ À À Ä   ÆÀÃ   Þ Ä  Æ ÄA EA  Ä ÆÁÄB @  ÕÁ AEE Ä ÆÁÅ  EA @À D  FÁÃ  ^D  FÆ  ^        checkCookieExists    serverTable    where    FALSE    INVALID_COOKIE    NIL    INVALID_ARGUMENT    valid    ipAddressCheck    IPV4_ADDRESS_FAMILY    ERROR    db    getAttribute    ROWID    interfaceName    FAILURE    AddressFamily     = '    ' and     networkInterface    '    setAttributeWhere    subnetTable 
   ipAddress    SUCCESS                     !  %      D   F À    ^         NOT_SUPPORTED                     3  N    G      E@    EÀ  @   D   F Á ^  E@ FÁ @  ÅÀ    D FÂ\À   À    @BÀ    @ AÅ@  Á @   BÅÀ  À À Ä   Æ@Â   Þ Ä  ÆÂÁ E A Ä ÆÃÂ @ Â ÕA DEA Ä ÆÄ EÁ  @À D  FAÂ  ^D  FÁÄ  À ^         firstCookieGet    serverTable    where    NIL    INVALID_COOKIE    db    getAttribute    ROWID    interfaceName    FAILURE    AddressFamily     = '    IPV4_ADDRESS_FAMILY    ' and     networkInterface    '    getAttributeWhere    subnetTable    subnetMask    SUCCESS                     ^  {   @   E      Å@    \À ÅÀ  À @Å  À À Ä   Æ@ÁÞ   Ä   ÆÁÞ  ÅÀ Æ ÂA  EA  Ä ÆÂÜ  À   ÁB@  CAA  ÁÁ  DAB ÁB ÁEÁ FÄÁ À  E\  À   ÁBÀ   AEÀ           nextCookieGet    serverTable    where    FALSE    NIL    NEXT_ROWID_INVALID    INVALID_COOKIE    db    getAttribute    ROWID    interfaceName    FAILURE    AddressFamily     = '    IPV4_ADDRESS_FAMILY    ' and     networkInterface    '    getAttributeWhere    subnetTable    subnetMask    SUCCESS                       ¬   M      À   A  E   ÅÀ  À      A  @      A     BÅ@   À À Ä   ÆÂÀ     A  À  CÅ@  A @   CÅ@ À À Ä   ÆÀÃ   Þ Ä  Æ ÄA EA  Ä ÆÁÄB @  ÕÁ AEE Ä ÆÁÅ  EA @À D  FÁÃ  ^D  FÆ  ^        checkCookieExists    serverTable    where    FALSE    INVALID_COOKIE    NIL    INVALID_ARGUMENT    valid    ipAddressCheck    IPV4_ADDRESS_FAMILY    ERROR    db    getAttribute    ROWID    interfaceName    FAILURE    AddressFamily     = '    ' and     networkInterface    '    setAttributeWhere    subnetTable    subnetMask    SUCCESS                     ¯  »      E   @   D   F@À ^  E  FÀÀ   Ä  Æ@Á   E \        ÀA      BÀ     	      NIL    INVALID_ARGUMENT    db    getAttribute    serverTable    interfaceName    ROWID    FAILURE    SUCCESS                     Æ  Ê           @ E@           NOT_SUPPORTED    cookie                     Ú  Þ      D   F À    ^         NOT_SUPPORTED                     î  ð          @À            NOT_SUPPORTED                     ú      +      E@    EÀ  @   D   F Á ^  E@ FÁ @  ÅÀ    D FÂ\À   À    @BÀ     ÀBÀ   ÅÀ  À À Ä   Æ@Â   Þ Ä   Æ@Ã   @ Þ          firstCookieGet    serverTable    where    NIL    INVALID_COOKIE    db    getAttribute    ROWID    interfaceName    FAILURE    string    match    %d+    SUCCESS                       8   3   E      Å@    \À ÅÀ  À @Å  À À Ä   Æ@ÁÞ   Ä   ÆÁÞ  ÅÀ Æ ÂA  EA  Ä ÆÂÜ  À   ÁB@  AC@ E @À D  FÁÂ  ^D  FÁÃ À ^         nextCookieGet    serverTable    where    FALSE    NIL    NEXT_ROWID_INVALID    INVALID_COOKIE    db    getAttribute    ROWID    interfaceName    FAILURE    string    match    %d+    SUCCESS                     H  J          @Å@           NOT_SUPPORTED    rowId                     W  e          E@    EÀ  @   D   F Á ^  E@ FÁ @  ÅÀ    D FÂ\À   À    @BÀ       BÀ               firstCookieGet    serverTable    where    NIL    INVALID_COOKIE    db    getAttribute    ROWID    domain    FAILURE    SUCCESS                     u     '   E      Å@    \À ÅÀ  À @Å  À À Ä   Æ@ÁÞ   Ä   ÆÁÞ  ÅÀ Æ ÂA  EA  Ä ÆÂÜ  À   ÁB@    C@           nextCookieGet    serverTable    where    FALSE    NIL    NEXT_ROWID_INVALID    INVALID_COOKIE    db    getAttribute    ROWID    domain    FAILURE    SUCCESS                       ª   &      À   A  E   ÅÀ  À      A  @      A  À  BÅ@  A @   BÀ  Å@ À À Ä   ÆÀÂ   Þ Ä   Æ Ã   Þ         checkCookieExists    serverTable    where    FALSE    INVALID_COOKIE    NIL    INVALID_ARGUMENT    db    setAttribute    ROWID    domain    FAILURE    SUCCESS                     ¸  Æ          E@    EÀ  @   D   F Á ^  E@ FÁ @  ÅÀ    D FÂ\À   À    @BÀ       BÀ               firstCookieGet    serverTable    where    NIL    INVALID_COOKIE    db    getAttribute    ROWID    startIpAddress    FAILURE    SUCCESS                     Ö  é   '   E      Å@    \À ÅÀ  À @Å  À À Ä   Æ@ÁÞ   Ä   ÆÁÞ  ÅÀ Æ ÂA  EA  Ä ÆÂÜ  À   ÁB@   C@          nextCookieGet    serverTable    where    FALSE    NIL    NEXT_ROWID_INVALID    INVALID_COOKIE    db    getAttribute    ROWID    startIpAddress    FAILURE    SUCCESS                     ù     4      À   A  E   ÅÀ  À      A  @      A     BÅ@   À À Ä   ÆÂÀ     A  À  CÅ@  A @   CÀ  Å@ À À Ä   ÆÀÃ   Þ Ä   Æ Ä   Þ         checkCookieExists    serverTable    where    FALSE    INVALID_COOKIE    NIL    INVALID_ARGUMENT    valid    ipAddressCheck    IPV4_ADDRESS_FAMILY    ERROR    db    setAttribute    ROWID    startIpAddress    FAILURE    SUCCESS                       )          E@    EÀ  @   D   F Á ^  E@ FÁ @  ÅÀ    D FÂ\À   À    @BÀ       BÀ               firstCookieGet    serverTable    where    NIL    INVALID_COOKIE    db    getAttribute    ROWID    endIpAddress    FAILURE    SUCCESS                     9  M   '   E      Å@    \À ÅÀ  À @Å  À À Ä   Æ@ÁÞ   Ä   ÆÁÞ  ÅÀ Æ ÂA  EA  Ä ÆÂÜ  À   ÁB@   C@          nextCookieGet    serverTable    where    FALSE    NIL    NEXT_ROWID_INVALID    INVALID_COOKIE    db    getAttribute    ROWID    endIpAddress    FAILURE    SUCCESS                     ]  s   4      À   A  E   ÅÀ  À      A  @      A     BÅ@   À À Ä   ÆÂÀ     A  À  CÅ@  A @   CÀ  Å@ À À Ä   ÆÀÃ   Þ Ä   Æ Ä   Þ         checkCookieExists    serverTable    where    FALSE    INVALID_COOKIE    NIL    INVALID_ARGUMENT    valid    ipAddressCheck    IPV4_ADDRESS_FAMILY    ERROR    db    getAttribute    ROWID    endIpAddress    FAILURE    SUCCESS                                 E@    EÀ  @   D   F Á ^  E@ FÁ @  ÅÀ    D FÂ\À   À    @BÀ       BÀ               firstCookieGet    serverTable    where    NIL    INVALID_COOKIE    db    getAttribute    ROWID    gateway    FAILURE    SUCCESS                       °   '   E      Å@    \À ÅÀ  À @Å  À À Ä   Æ@ÁÞ   Ä   ÆÁÞ  ÅÀ Æ ÂA  EA  Ä ÆÂÜ  À   ÁB@   C@          nextCookieGet    serverTable    where    FALSE    NIL    NEXT_ROWID_INVALID    INVALID_COOKIE    db    getAttribute    ROWID    gateway    FAILURE    SUCCESS                     À  ê   r      À   A  E   ÅÀ  À      A  @      A    Ä  ÆÀÁ @ Ü Ä   Æ@ÂÀ  Ä   ÆÁÞ  ÅÀ Æ ÃA  EA   Ä ÆÃÜÇ Ä  ÆÀÃ E A Ä ÆÄ E Â ÕÁ EEA Ä ÆÅ EA @À D  FÁÅ  ^EÁ FÅA À F\ A À   ÁEÀ   AFÀ  @      AB   A Á FÅA  B @   ÂFÀ  ÅA ÀÀ Ä  ÆÁÅ   ÞÄ  ÆÇ   Þ        checkCookieExists    serverTable    where    FALSE    INVALID_COOKIE    NIL    INVALID_ARGUMENT    ipAddressCheck    IPV4_ADDRESS_FAMILY    ERROR    interFaceName    db    getAttribute    ROWID    interfaceName    AddressFamily     = '    ' and     networkInterface    '    getAttributeWhere    subnetTable 
   ipAddress    FAILURE    subnetMask    ipv4SingleMaskCheck    setAttribute    gateway    SUCCESS                     ø            E@    EÀ  @   D   F Á ^  E@ FÁ @  ÅÀ    D FÂ\À   À    @BÀ       BÀ               firstCookieGet    serverTable    where    NIL    INVALID_COOKIE    db    getAttribute    ROWID    primaryDnsServer    FAILURE    SUCCESS                       '   '   E      Å@    \À ÅÀ  À @Å  À À Ä   Æ@ÁÞ   Ä   ÆÁÞ  ÅÀ Æ ÂA  EA  Ä ÆÂÜ  À   ÁB@   C@          nextCookieGet    serverTable    where    FALSE    NIL    NEXT_ROWID_INVALID    INVALID_COOKIE    db    getAttribute    ROWID    primaryDnsServer    FAILURE    SUCCESS                     7  N   	4      À   A  E   ÅÀ  À      A  @      A    Ä  ÆÀÁ @ Ü Ä   Æ@ÂÀ  Ä   ÆÁÞ  Å ÆÀÂA  E   Ä ÆAÃ  Ü A  À   C@    ÁC@          checkCookieExists    serverTable    where    FALSE    INVALID_COOKIE    NIL    INVALID_ARGUMENT    ipAddressCheck    IPV4_ADDRESS_FAMILY    ERROR    db    setAttribute    ROWID    primaryDnsServer    FAILURE    SUCCESS                     \  h          E@    EÀ  @   D   F Á ^  E@ FÁ @  ÅÀ    D FÂ\À   À    @BÀ       BÀ               firstCookieGet    serverTable    where    NIL    INVALID_COOKIE    db    getAttribute    ROWID    secondaryDnsServer    FAILURE    SUCCESS                     x     '   E      Å@    \À ÅÀ  À @Å  À À Ä   Æ@ÁÞ   Ä   ÆÁÞ  ÅÀ Æ ÂA  EA  Ä ÆÂÜ  À   ÁB@   C@          nextCookieGet    serverTable    where    FALSE    NIL    NEXT_ROWID_INVALID    INVALID_COOKIE    db    getAttribute    ROWID    secondaryDnsServer    FAILURE    SUCCESS                       ±   	4      À   A  E   ÅÀ  À      A  @      A    Ä  ÆÀÁ EA Ü Ä   ÆÂÀ  Ä   ÆÁÞ  ÅÀ Æ ÃA  EA   Ä ÆÃ  Ü A  À   ÁC@    D@          checkCookieExists    serverTable    where    FALSE    INVALID_COOKIE    NIL    INVALID_ARGUMENT    ipAddressCheck    IPV4_ADDRESS_FAMILY    primaryDnsServer    ERROR    db    setAttribute    ROWID    secondaryDnsServer    FAILURE    SUCCESS                     À  Ì          E@    EÀ  @   D   F Á ^  E@ FÁ @  ÅÀ    D FÂ\À   À    @BÀ       BÀ               firstCookieGet    serverTable    where    NIL    INVALID_COOKIE    db    getAttribute    ROWID 
   leaseTime    FAILURE    SUCCESS                     Ü  ï   '   E      Å@    \À ÅÀ  À @Å  À À Ä   Æ@ÁÞ   Ä   ÆÁÞ  ÅÀ Æ ÂA  EA  Ä ÆÂÜ  À   ÁB@   C@          nextCookieGet    serverTable    where    FALSE    NIL    NEXT_ROWID_INVALID    INVALID_COOKIE    db    getAttribute    ROWID 
   leaseTime    FAILURE    SUCCESS                     ÿ     	2      À   A  E   ÅÀ  À      A  @      A  À À   Å  XÀ  Å@  Ä   ÆÁÞ  Å ÆÀÂA  E   Ä ÆAÃ  Ü A  À   C@    ÁC@          checkCookieExists    serverTable    where    FALSE    INVALID_COOKIE    NIL    INVALID_ARGUMENT 	   tonumber    leaseMinTime    leaseMaxTime    db    setAttribute    ROWID 
   leaseTime    FAILURE    SUCCESS                     -  [   ~   E   @   D   F@À ^  E  FÀÀ   Å@    \     À    AÀ      ÀAÅ  A @   BÅ   À À Ä   ÆÁ   Þ Å@ ÆÂ  AÁ Ü     Á   ACA Á Á  BDA  Á ÁE  FÁÄ À \  À   AÀ    AEÀ   A  ÂEE  Ä ÆÆUÂFBÅ  D FCÆÕBÆÂ  A  F E  Ä ÆÃÆUÃFC  Á  G Å  D FDÇÕCÆÃ  A  G	 E  Ä ÆÄÇ	UÄFD          NIL    INVALID_COOKIE    db    getRow    serverTable    ROWID    FAILURE    getAttribute    interfaceName    string    match    %d+    1    AddressFamily     = '    IPV4_ADDRESS_FAMILY    ' and     networkInterface    '    getRowWhere    subnetTable    SUCCESS    . 
   ipAddress    subnetMask    startIpAddress    endIpAddress    gateway    primaryDnsServer    secondaryDnsServer    domain 
   leaseTime                     f      <      @@ E  À  E  @   D   F@Á ^  D  FÁ À Å  A D FÂÁ Å B A  BÁÂ Ã AC  Ä ÆÂÄ E D U    @@Å@   Å  À  Ä   Æ@ÁÞ  Å    @ Ü     AA   ÁD@        db    getRowsWhere    serverTable    where    NIL    FAILURE    AddressFamily     = '    IPV4_ADDRESS_FAMILY    ' and     networkInterface     != ' 	   DMZ_NAME    '     and  
   WAN1_NAME 
   WAN2_NAME    subnetTable    merge2DTable    SUCCESS                       Í      E      Å@    \À ÅÀ  À @Å  À À Ä   Æ@ÁÞ   Ä   ÆÁÞ  ÅÀ Æ ÂA  EA  Ü   À   B@ Á ÁBEA  A À  CE @À D  FÂ ^EA FÃ ÁÁ \   A  ADÁ Â A  BEÁ   A AÅÁ ÆÁÅ @ Ü  À   B@   BF@  Á  ÃFÅ  D FÇÕBÆÂ EC   Ä ÆCÇUÃFCC  Á  GÅC   D FÄÇÕCÆÃD  A  H	ED   Ä ÆDÈ	UÄFDD  Á  H
	ÅD   D FÅÈ
ÕD	ÆÄ  $      nextCookieGet    serverTable    where    FALSE    NIL    NEXT_ROWID_INVALID    INVALID_COOKIE    db    getRow    ROWID    FAILURE    getAttribute    interfaceName    string    match    %d+    1    AddressFamily     = '    IPV4_ADDRESS_FAMILY    ' and     networkInterface    '    getRowWhere    subnetTable    SUCCESS    . 
   ipAddress    subnetMask    startIpAddress    endIpAddress    gateway    primaryDnsServer    secondaryDnsServer    domain 
   leaseTime                     ä         @  C  Å   EÃ  @   A  EC @  D FÁ^ D FÃÁ À \ D  FCÂ@ D FÂ^ EC W@@EÃ FÃ\ C @ D FÃ^ EC @ D FÃÃ^ D FÃÁ À \ D  FCÂ@ D FÄ^ EC W@W@D ÄD FÃÁ À \ D  FCÂ@ D FÃÄ^ D FÅ À   \  D  FCÂ@ D FCÅ^ EC W@W@Ä ÄD FÃÁ À\ D  FCÂ@ D FÅ^ D FÅ À  \  D  FCÂ@ D FÃÅ^ EC W@ W@DD FÃÁ À \ D  FCÂ@ D FÆ^ D FÅ À   \  D  FCÂ@ D FCÆ^ EC W@W@Ä D FÃÁ À\ D  FCÂ@ D FÆ^ EC W@W@D D FÃÁ À \ D  FCÂ@ D FÃÆ^ EC @   EC  \  X Ã @  H   ÅC  D DFÈÕCCÅC  D DFÄÈÕCÅC  D DFÉÕCCÅC  D DFDÉÕCÅC  D DFÉÕCÃÅC  D DFÄÉÕCÅC  D DFÊÕCÅC
 ÆÊD  @   Ü D  À   ÄJ@  
  E D ÄÆDË	UÄ	DE D ÄÆË	UÄ	E D ÄÆÄË	UÄ 	ED
 FDÌD  Å    DFÅÌ
\D À   ÄJ	À  M	ÁD  A ÅMÁE  A D	ÅD
 ÆDÎ	 @ 	 Ü EK
AE  Á  A 	Á Å
EE
 FÏ
 À 
\GÅ EÅ Z   D FEÏ
^ EE
 FÊ
 À  	\ E 
À   ÅJÀ    Å F DFÆÏÕEEÅ F DFÐÕEÅE
 ÆEÌ DFFÐ ÀÆÅ ÜF
 JE  À EF @À D  FÆÊ  ^D  FÆÐ  ^  D      checkCookieExists    serverTable    where    FALSE    INVALID_COOKIE    NIL #   COMP_DHCP_SERVER_VLAN_IPADDESS_NIL    ipAddressCheck    IPV4_ADDRESS_FAMILY    ERROR '   COMP_DHCP_SERVER_VLAN_IPADDESS_INVALID    string    len    MAX_LENGTH_DOMAIN_NAME     COMP_DOMAIN_NAME_LENGTH_INVALID !   COMP_DHCP_SERVER_VLAN_SUBNET_NIL %   COMP_DHCP_SERVER_VLAN_SUBNET_INVALID        Server +   COMP_DHCP_SERVER_VLAN_STARTADDRESS_INVALID    ipv4SingleMaskCheck 1   COMP_DHCP_SERVER_VLAN_STARTADDRESS_NOTIN_NETWORK )   COMP_DHCP_SERVER_VLAN_ENDADDRESS_INVALID /   COMP_DHCP_SERVER_VLAN_ENDADDRESS_NOTIN_NETWORK &   COMP_DHCP_SERVER_VLAN_GATEWAY_INVALID ,   COMP_DHCP_SERVER_VLAN_GATEWAY_NOTIN_NETWORK )   COMP_DHCP_SERVER_VLAN_PRIMARYDNS_INVALID +   COMP_DHCP_SERVER_VLAN_SECONDARYDNS_INVALID    DEFAULT_LEASE_TIME 	   tonumber    leaseMinTime    leaseMaxTime (   COMP_DHCP_SERVER_VLAN_LEASETIME_INVALID    .    domain    startIpAddress    endIpAddress    gateway    primaryDnsServer    secondaryDnsServer 
   leaseTime    db    update    FAILURE    subnetTable 
   ipAddress    subnetMask 
   ifGateway    defaultGateway    getAttribute    ROWID    interfaceName    AddressFamily     = '    ' and     networkInterface    '    getAttributeWhere    !='    status    existsRowWhere '   COMP_DHCP_SERVER_VLAN_IPADDRESS_EXISTS    networkInterfaceTable    ipAddr    subnetmask    networkInterfaceName 	   BDG_NAME    SUCCESS                       {   !Y         C@   D FÃÀ\   À  DAE   W @Ä B@  ED     B ÄBE   À  DC    C        ÄC ÄBE  À  DC    D    À   DD À @  EÄ X@ E   D  FDÅ^ EÄ  UG  DFE  ÄF	Å     D  FÇ^ E FDÆD Ä ÆÇ	   \     D  FÄÇ^ E  W@W È @HDFÄÂ À\ÀD FDÃ@ D  FÈ^ DFÄÈ  À  \ ÀD FDÃ@ D  FÉ^ E  W@W H @HDFÄÂ À \ÀD FDÃ@ D  FDÉ^ DFÄÈ  À   \ ÀD FDÃ@ D  FÉ^ E  W@ W ÈDFÄÂ À\ÀD FDÃ@ D  FÄÉ^ DFÄÈ  À  \ ÀD FDÃ@ D  FÊ^ E  W@W H DFÄÂ À \ÀD FDÃ@ D  FDÊ^ E  W@W È DFÄÂ À\ÀD FDÃ@ D  FÊ^ E  @  EÂ
 E \  X D @	   K	   ÅÄ  D FEÌ
ÕD	 @ E
	ÅÄ  D FÅÌ
ÕD	 @  	Å ÆÍ	Å @ 	Ü   	À  EM
E  @ M
  Ã  N
AE E
E FÎ
Å À 
\W Ï

Ä  EO   Å  D FFÌÕE @ FÅ  D FÆÏÕEÆ @ FÅ  D FÐÕE @ FÅ  D FFÐÕE Å  D FÆÐÕEÈÅ  D FÑÕEF Å  D FÑÕEÆ Å  D FÒÕEÅ  D FFÒÕEEÅ  D FÒÕEÆ Å  D FÓÕEÆ Å  D FFÓÕE Å  D FÆÓÕEÆ Å  D FÔÕEF Å  D FÔÕEÆ Å  D FÕÕE Å  D FFÕÕEÅ  D FÕÕEF Å  D FÆÕÕEF Å ÆÍ @   Ü    À  FME 
  EF  Ä ÆÆÏUÆ 	EF  Ä ÆÇUÆ	EF  Ä ÆÖUÆ	FEF  Ä ÆFÖUÆ 	EF  Ä ÆÖUÆÆ 	E FÍF À \  À  FMÅ   Å  D F×ÕFG Å  D FÇÆÕF Å  D FG×ÕFÅ  D F×ÕFÆÅ  D FÇ×ÕFÅ  D FØÕFFÅ  D FGØÕFÅ  D FØÕFÆÅ  D FÇØÕFFÅ  D FÙÕFG Å ÆÍ @ Ü GYE  ÇFÅ  E  @À D FGÍ ^D FÇÙ ^  h      NIL #   COMP_DHCP_SERVER_VLAN_IPADDESS_NIL    1    ipv6ModeGet    DefaultVlan    NOT_SUPPORTED    cookie    string    len    MAX_LENGTH_DOMAIN_NAME 1   COMP_DHCP_SERVER_VLAN_DOMAIN_NAME_LENGTH_INVALID    ipAddressCheck    IPV4_ADDRESS_FAMILY    ERROR '   COMP_DHCP_SERVER_VLAN_IPADDESS_INVALID !   COMP_DHCP_SERVER_VLAN_SUBNET_NIL %   COMP_DHCP_SERVER_VLAN_SUBNET_INVALID !   COMP_DHCP_SERVER_VLAN_VLANID_NIL 	   tonumber    vlanMinNumber    vlanMaxNumber %   COMP_DHCP_SERVER_VLAN_VLANID_INVALID    interfaceType 	   LAN_NAME    db 
   existsRow    serverTable    interfaceName $   COMP_DHCP_SERVER_VLAN_VLANID_EXISTS    subnetTable 
   ipAddress '   COMP_DHCP_SERVER_VLAN_IPADDRESS_EXISTS        Server +   COMP_DHCP_SERVER_VLAN_STARTADDRESS_INVALID    ipv4SingleMaskCheck 1   COMP_DHCP_SERVER_VLAN_STARTADDRESS_NOTIN_NETWORK )   COMP_DHCP_SERVER_VLAN_ENDADDRESS_INVALID /   COMP_DHCP_SERVER_VLAN_ENDADDRESS_NOTIN_NETWORK &   COMP_DHCP_SERVER_VLAN_GATEWAY_INVALID ,   COMP_DHCP_SERVER_VLAN_GATEWAY_NOTIN_NETWORK )   COMP_DHCP_SERVER_VLAN_PRIMARYDNS_INVALID +   COMP_DHCP_SERVER_VLAN_SECONDARYDNS_INVALID    DEFAULT_LEASE_TIME    leaseMinTime    leaseMaxTime (   COMP_DHCP_SERVER_VLAN_LEASETIME_INVALID    bridgeTable    .    networkInterfaceName 	   BDG_NAME    bridgeIndex    insert    FAILURE       @   3 	   portName 
    ='dummy'    getRowsWhere    vlan     MAX_LIMIT_REACHED    networkInterfaceTable    networkInterface    VirtualIfName    ConnectionType    STATIC_CONNECTION    ConnectionType6    ifType    BRIDGE_CONNECTION    MTU    DEFAULT_MTU    ipAddr    subnetmask    dns1    DEFAULT_GATEWAY    dns2    DHCP    DISABLE    gatewayNetwork 	   IfStatus    ENABLE    refreshInterval    REFRESH_TIME    autoRefreshFlag    capabilities    restartFwForMe 
   ifGroupId    subnetMask    AddressFamily 
   ifGateway    defaultGateway    dhcpEnabled    domain    startIpAddress    endIpAddress    gateway    primaryDnsServer    secondaryDnsServer 
   leaseTime    enableDnsProxy    getAttribute    ROWID    SUCCESS                          0   E   F@À   ÅÀ     D  FÁ\@ AÀ  Á @      BÅ@   BEÁ  U Å  À À Ä  Æ@Ã   Þ Å   Æ Â  EÁ    Ü   À  AC@   C@          db    getAttribute    serverTable    ROWID    interfaceName    string    match    %d+ 
   deleteRow    bridgeTable    networkInterfaceName 	   BDG_NAME    NIL    FAILURE    SUCCESS                     ¢  ²    	/       @ A@    ÁÀ   D  FÀA  ÅA Â    E FÀÁ   À   \@  À   BÅÀ      CÁ@  A A @ ÀAÅÀ    Å@ À À Ä  ÆÂÁ Þ Ä  Æ ÄÁ Þ         interfaceName     != ' 	   DMZ_NAME    '     and  	   LAN_NAME    db    deleteRowWhere    serverTable    NIL    FAILURE    cookie    networkInterfaceName 	   BDG_NAME    1'    bridgeTable    SUCCESS                             