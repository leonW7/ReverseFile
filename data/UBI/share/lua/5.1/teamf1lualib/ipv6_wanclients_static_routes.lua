LuaQ                      A@    À@@  A@ @   A @   AÀ @   A  @   A@ @   A @   AÀ @   A   E  @ \   Á  Å  Á Ü  A  A GA J  IÁÄIEIÅIÆIÆIÇIAÇ Ê  ÉÁÇÉHÉAÈÉHÂ J  G	 E	 IBÉE	 IIE	 IÂÉE	 IÂÇA
 IÊ Â
 B Ã WÀK@ W L  @L@ Á @ WÀL@ W M  @M@ Á  WÀM   N@ ÁB  WN  ÀN  Á $        C $C         $           Ã $Ã       $       C $C        $          Ã $Ã        $       C $C              $       Ã $Ã        $          C $C        $       Ã $Ã           $     C $C        $       Ã $Ã              $       C $C        $          Ã $Ã        $       C $C        $                          Ã $Ã                          $          C $C      $     Ã   \      module .   com.teamf1.core.ipv6_wanclients.static_routes    package    seeall    require    teamf1lualib/db    teamf1lualib/util    teamf1lualib/validations    teamf1lualib/returnCodes    teamf1lualib/ipv6_mode #   teamf1lualib/returnCodes_ipv6_nimf     teamf1lualib/returnCodes_route6    com.teamf1.core.returnCodes    com.teamf1.core.validations    com.teamf1.core.ipv6.mode &   com.teamf1.core.ipv6.nimf.returnCodes (   com.teamf1.core.ipv6.route6.returnCodes    static_routesTable    route6 
   routeName    active    destinationIpAddress 
   dstIpAddr    prefixLength    prefix 
   interface    interfaceName    gatewayIpAddress 	   gwIpAddr    metric 	   ifStatic    LogicalIfName    AddressFamily 	   StaticIp    PrefixLength    ipAddressTable    attributesIpv6    addressFamily    ipv6PrefixLen 
   ipAddress    0.0.0.0 	   ipv6Mode    netWorkMode    IPV6_ADDRESS_FAMILY    10    _ROWID_ 
   UNIT_NAME    DSR-1000AC 	   DSR-1000 
   DSR-1000N      ÀR@
   DSR-500AC    DSR-500 	   DSR-500N       I@   DSR-250 	   DSR-250N      A@   DSR-150 	   DSR-150N       .@   routeNameGet    routeNameGetNext    routeNameSet    routeNameDelete 
   activeGet    activeGetNext 
   activeSet    destinationIpAddressGet    destinationIpAddressGetNext    destinationIpAddressSet    prefixLengthGet    prefixLengthGetNext    prefixLengthSet    interfaceGet    interfaceGetNext    interfaceSet    interfaceDelete    gatewayIpAddressGet    gatewayIpAddressGetNext    gatewayIpAddressSet 
   metricGet    metricGetNext 
   metricSet    staticRouteGet    staticRouteGetCur    staticRouteGetNext    staticRouteSet    staticRouteCreate    staticRouteDelete    staticRoutesGetAll    staticRoutesDeleteAll        l   ~     !      @@ A  À  D   F Á @   D   F@Á ^  E   FÁ À  ÁÀ    D FÂ\    A     @A     @BÀ         
      db    getNextRowId            static_routesTable    NIL    FAILURE    getAttribute    _ROWID_ 
   routeName    SUCCESS                        ¦    0   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á    Å@ \    @     A  À  ÀAÅ@  @  ABÄ   Æ ÀÀ À Ä   ÆÁ  Þ Ä   ÆÂ  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db    getNextRowId    static_routesTable    FAILURE    getAttribute    _ROWID_ 
   routeName    SUCCESS                     ¶   Û    6       @  EA   \ WÀ D FÁÀ^ D FÁW@ EA    \  A D FAÁ^ D FÁ@  D FAÁ^ E FÁÁ ÁA    D FÂ \Á Ä ÆÁÂÀÀ Ä ÆÃ   ÞÄ ÆAÃ   Þ        ipv6ModeGet 	   tonumber       @   NOT_SUPPORTED    NIL    INVALID_ARGUMENT    db    setAttribute    static_routesTable    _ROWID_ 
   routeName    FALSE    FAILURE    SUCCESS                     è   ì           @À            NOT_SUPPORTED                     ú       !      @@ A  À  D   F Á @   D   F@Á ^  E   FÁ À  ÁÀ    D FÂ\    A     @A     @BÀ         
      db    getNextRowId            static_routesTable    NIL    FAILURE    getAttribute    _ROWID_    active    SUCCESS                       4   0   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á    Å@ \    @     A  À  ÀAÅ@  @  ABÄ   Æ ÀÀ À Ä   ÆÁ  Þ Ä   ÆÂ  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db    getNextRowId    static_routesTable    FAILURE    getAttribute    _ROWID_    active    SUCCESS                     D  g   6       @  EA   \ WÀ D FÁÀ^ D FÁW@ EA    \  A D FAÁ^ D FÁ@  D FAÁ^ E FÁÁ ÁA    D FÂ \Á Ä ÆÁÂÀÀ Ä ÆÃ   ÞÄ ÆAÃ   Þ        ipv6ModeGet 	   tonumber       @   NOT_SUPPORTED    NIL    INVALID_ARGUMENT    db    setAttribute    static_routesTable    _ROWID_    active    FALSE    FAILURE    SUCCESS                     u      !      @@ A  À  D   F Á @   D   F@Á ^  E   FÁ À  ÁÀ    D FÂ\    A     @A     @BÀ         
      db    getNextRowId            static_routesTable    NIL    FAILURE    getAttribute    _ROWID_    destinationIpAddress    SUCCESS                       ³   0   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á    Å@ \    @     A  À  ÀAÅ@  @  ABÄ   Æ ÀÀ À Ä   ÆÁ  Þ Ä   ÆÂ  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db    getNextRowId    static_routesTable    FAILURE    getAttribute    _ROWID_    destinationIpAddress    SUCCESS                     Ä  ð   D       @  EA   \ WÀ D FÁÀ^ C AW A  À   Ä ÆÁÀ  AA  A   AA  AÁÁ   @  BW  AA A BÅÁ  @  BCÀ Á  C À  ÂC@   B@          ipv6ModeGet 	   tonumber       @   NOT_SUPPORTED    NIL    INVALID_ARGUMENT    ipAddressCheck       $@   SUCCESS    db    setAttribute    static_routesTable    _ROWID_    destinationIpAddress    FALSE    FAILURE                     þ      !      @@ A  À  D   F Á @   D   F@Á ^  E   FÁ À  ÁÀ    D FÂ\    A     @A     @BÀ         
      db    getNextRowId            static_routesTable    NIL    FAILURE    getAttribute    _ROWID_    prefixLength    SUCCESS                        9   0   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á    Å@ \    @     A  À  ÀAÅ@  @  ABÄ   Æ ÀÀ À Ä   ÆÁ  Þ Ä   ÆÂ  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db    getNextRowId    static_routesTable    FAILURE    getAttribute    _ROWID_    prefixLength    SUCCESS                     I  o   @       @  EA   \ WÀ D FÁÀ^ D FÁW@ EA    \  A D FAÁ^ D FÁ@  D FAÁ^ EA   \ XÁ@ @  AA  ABÅ Â @   CÀ Á  BC À  C@   ÂC@          ipv6ModeGet 	   tonumber       @   NOT_SUPPORTED    NIL    INVALID_ARGUMENT               `@   db    setAttribute    static_routesTable    _ROWID_    prefixLength    FALSE    FAILURE    SUCCESS                     }      !      @@ A  À  D   F Á @   D   F@Á ^  E   FÁ À  ÁÀ    D FÂ\    A     @A     @BÀ         
      db    getNextRowId            static_routesTable    NIL    FAILURE    getAttribute    _ROWID_ 
   interface    SUCCESS                        ¸   0   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á    Å@ \    @     A  À  ÀAÅ@  @  ABÄ   Æ ÀÀ À Ä   ÆÁ  Þ Ä   ÆÂ  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db    getNextRowId    static_routesTable    FAILURE    getAttribute    _ROWID_ 
   interface    SUCCESS                     È  ë   =       @  EA   \ WÀ D FÁÀ^ D FÁW@ EA    \  A D FAÁ^ D FÁ@  D FAÁ^ WÁ  WÀÁ  D FAÁ^ E FAÂ ÁÁ    D FÃ \Á Ä ÆAÃÀÀ Ä ÆÃ   ÞÄ ÆÁÃ   Þ        ipv6ModeGet 	   tonumber       @   NOT_SUPPORTED    NIL    INVALID_ARGUMENT    WAN1    WAN2    db    setAttribute    static_routesTable    _ROWID_ 
   interface    FALSE    FAILURE    SUCCESS                     ø  ü          @À            NOT_SUPPORTED                     
      !      @@ A  À  D   F Á @   D   F@Á ^  E   FÁ À  ÁÀ    D FÂ\    A     @A     @BÀ         
      db    getNextRowId            static_routesTable    NIL    FAILURE    getAttribute    _ROWID_    gatewayIpAddress    SUCCESS                     .  G   0   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á    Å@ \    @     A  À  ÀAÅ@  @  ABÄ   Æ ÀÀ À Ä   ÆÁ  Þ Ä   ÆÂ  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db    getNextRowId    static_routesTable    FAILURE    getAttribute    _ROWID_    gatewayIpAddress    SUCCESS                     W     D       @  EA   \ WÀ D FÁÀ^ C AW A  À   Ä ÆÁÀ  AA  A   AA  AÁÁ   @  BW  AA A BÅÁ  @  BCÀ Á  C À  ÂC@   B@          ipv6ModeGet 	   tonumber       @   NOT_SUPPORTED    NIL    INVALID_ARGUMENT    ipAddressCheck       $@   SUCCESS    db    setAttribute    static_routesTable    _ROWID_    gatewayIpAddress    FALSE    FAILURE                       ¢    !      @@ A  À  D   F Á @   D   F@Á ^  E   FÁ À  ÁÀ    D FÂ\    A     @A     @BÀ         
      db    getNextRowId            static_routesTable    NIL    FAILURE    getAttribute    _ROWID_    metric    SUCCESS                     ²  Ë   0   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á    Å@ \    @     A  À  ÀAÅ@  @  ABÄ   Æ ÀÀ À Ä   ÆÁ  Þ Ä   ÆÂ  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db    getNextRowId    static_routesTable    FAILURE    getAttribute    _ROWID_    metric    SUCCESS                     Û  ÿ   @       @  EA   \ WÀ D FÁÀ^ D FÁW@ EA    \  A D FAÁ^ D FÁ@  D FAÁ^ EA   \ XÁ@ @  AA  ABÅ Â @   CÀ Á  BC À  C@   ÂC@          ipv6ModeGet 	   tonumber       @   NOT_SUPPORTED    NIL    INVALID_ARGUMENT        @      .@   db    setAttribute    static_routesTable    _ROWID_    metric    FALSE    FAILURE    SUCCESS                       ,    P      @@ A  À  D   F Á @   D   F@Á ^  E   FÁ À  ÁÀ    \     A À    @AÀ    À  Á   AB  ÅÀ   D FÂÕ@ÆÀ Á  A  ÁB EÁ   Ä ÆÃUÁFA Á  Á  BC ÅÁ   D FÃÕAÆÁ Â  A  ÂC D  FÄ  À  @ À  @ ^         db    getNextRowId            static_routesTable    NIL    FAILURE    getRow    _ROWID_    . 
   routeName    active    destinationIpAddress    prefixLength 
   interface    gatewayIpAddress    metric    SUCCESS                     >  X   R   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Á    \     @ À    ÀAÀ    @ Á   AB  Å@  D FÂÕ@ÆÀ A A  ÁB EA  Ä ÆÃUÁFA A Á  BC ÅA  D FÃÕAÆÁ B A  ÂC D  FÄ  À  @ À  @ ^         NIL 	   tonumber    INVALID_ARGUMENT    db    getRow    static_routesTable    _ROWID_    FAILURE    . 
   routeName    active    destinationIpAddress    prefixLength 
   interface    gatewayIpAddress    metric    SUCCESS                     o     ^   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á    Å@ \    @     A  À  ÀAÅ@  @  Ä   Æ ÀÀ À Ä   ÆÁ  Þ Å@ A D FÂÕ@ÆÀ A AA  ÁBEA A Ä ÆÃUÁFAA ÁA  BCÅA B D FÃÕAÆÁB AB  ÂCEB B Ä ÆÄUÂFB  BDÀ  @ À  @          NIL 	   tonumber    INVALID_ARGUMENT    db    getNextRowId    static_routesTable    FAILURE    getRow    _ROWID_    . 
   routeName    active    destinationIpAddress    prefixLength 
   interface    gatewayIpAddress    metric    SUCCESS                     «  :  	 /    @ ÅB    Ü WÀ Ä ÆÂÀÞ Ã AW  C  @   D FÁ@À  CA@   A   A  A  ÃA  A  B  CBA À  ÃBW  C  A  CC C  @  XC@   DFÄ^ D FÁ@ DFCÄ^ WÄWÀÄ W ÅW@Å WÅ DFÃÅ^ D FÁ@ DFÆ^ D FCÂ À \ÀD FÃÂW@ DFCÆ^ D FÁ@ DFÆ^ EC  \ XÀÆ@ @ CG  ÃGÅ  ÅC   Ü@ A ÅH
	À 
@ A I
	À
@ A  
	W  
 EI
 á  ÀøÅ ÆÉEÄ	 FÊD
 À
 EÅ	 FÅÊ
E
 Å 
 EÆ	 FFË ÅÆ	 ÆFËÇ D  UÜ @	 DLED \@ LÀ A Æ	 FK
D ÅÆ	 ÆÆÌUÆFF
    ÅB  @ a  ÀùD FDÌ@@DFÍ^ @C DM 
Ä E  ÄÆÍ	UÄ	DE  ÄÆÄÍ	UÄ	E  ÄÆÄÈ	UÄ	ÄE  ÄÆÎ	UÄ	E  ÄÆDÎ	UÄ	DE  ÄÆÎ	UÄ	E  ÄÆÉ	UÄ	ÄE FÄÎ À    \ A
 	À  EL
@   ÅB
@    <      ipv6ModeGet 	   tonumber       @   IPV6MODE_NOT_ENABLED    NIL    INVALID_ARGUMENT    ROUTE6_NAME_NIL    ROUTE6_ACTIVE_NIL    ROUTE6_DEST_IP_NIL    ipAddressCheck       $@   SUCCESS    INVALID_ROUTE6_DEST_IP    ROUTE6_PREFIXLENGTH_NIL               `@   INVALID_ROUTE6_PREFIXLENGTH    ROUTE6_INTERFACE_NIL    LAN    WAN1    WAN2 
   sit0-WAN1 
   sit0-WAN2    INVALID_ROUTE6_INTERFACE    ROUTE6_GW_NIL    INVALID_ROUTE6_GW    ROUTE6_METRIC_NIL        @      .@   INVALID_ROUTE6_METRIC    db 	   getTable    static_routesTable    pairs    .    destinationIpAddress    metric -   INVALID_ROUTE6_DEST_IP_DEST_IP_ALREADY_EXIST    getRowsWhere    attributesIpv6    LogicalIfName    ='    ' and     addressFamily    IPV6_ADDRESS_FAMILY 
   ipAddress     != '' and      != '    '    FAILURE    ipv6SingleMaskCheck    ipv6PrefixLen !   GATEWAY_NOT_IN_INTERFACE_NETWORK    INTERFACE_IS_DOWN 
   routeName    active    prefixLength 
   interface    gatewayIpAddress    update                     N  ã  	 @  Ä  ÆÀÜ B  À W@  Â@  Ä ÆÁÀ  ÄÆBÁÞ Ä ÆÁÀ  ÄÆÁÞ Ä ÆÁÀ ÄÆÂÁÞ Ä ÆÂC @ ÜÄ ÆÂWÀ ÄÆÂÂÞ Ä ÆÁÀ ÄÆÃÞ ÅB   Ü X@Ã@ À ÃC  A  D W@DWD WÀDW E W@E E  A  ÃE  BAC   BW  F  A  CF C  @  XF@   DFÇ^ EC FÇÃ \  À@ÅÄ E DFÈ
ÕD	ÆÄ	 	 ÄÆÄÈ	Þ ÅÄ E DFÉ
ÕD	ÆÄ		ÅÄ E DFEÉ
ÕD	ÆÄ		 ÄÆÄÈ	Þ ¡  À÷C IÄ Ä	 JAD
  Á
 Å	 ÅJ
AE
  Á
 Æ	 FKA Æ	 FKÁÆ A DÔ À@	Ä ÆCÌ @ @D FÌ
Ä F EÆ	 FFËÕEÆÅ
 AF Æ	 ÆL
\ À
D FÂ
@  @ !  Àù DL @M @Ô @Ã ÄÆCÍÞ ÊÃ Ä AD H	É Ä AD M	ÉC Ä AD I	É Ä AD ÄM	ÉÃ Ä AD N	ÉÄ AD DN	ÉCÄ AD DI	ÉNA N	ÁÄ ÄED FÉÄ À \W ÏÄ 	  DO	 D O	ÅÄ  Ä A
 	À  EL
EÅ E P
EÅ HÀ  F D FÂ
 
^  B      ipv6ModeGet 	   tonumber       @   IPV6MODE_NOT_ENABLED    NIL    ROUTE6_NAME_NIL    ROUTE6_ACTIVE_NIL    ROUTE6_DEST_IP_NIL    ipAddressCheck       $@   SUCCESS    INVALID_ROUTE6_DEST_IP    ROUTE6_PREFIXLENGTH_NIL               `@   INVALID_ROUTE6_PREFIXLENGTH    ROUTE6_INTERFACE_NIL    LAN    WAN1    WAN2 
   sit0-WAN1 
   sit0-WAN2    INVALID_ROUTE6_INTERFACE    ROUTE6_GW_NIL    INVALID_ROUTE6_GW    ROUTE6_METRIC_NIL        @      .@   INVALID_ROUTE6_METRIC    db 	   getTable    static_routesTable    pairs    . 
   routeName -   INVALID_ROUTE6_DEST_IP_DEST_IP_ALREADY_EXIST    destinationIpAddress    metric    getRowsWhere    attributesIpv6    LogicalIfName    ='    ' and     addressFamily    IPV6_ADDRESS_FAMILY 
   ipAddress     != '' and      != '    '    FAILURE    ipv6SingleMaskCheck    ipv6PrefixLen !   GATEWAY_NOT_IN_INTERFACE_NETWORK    INTERFACE_IS_DOWN    active    prefixLength 
   interface    gatewayIpAddress     !='WAN2PPPOE2' and      !='WAN1PPPOE2'     MAX_LIMIT_REACHED    insert    cookie    getAttribute    _ROWID_                     ï     ,   D   F À \  A  @ W@  Á@  AW  A  @   D FÁ@  AA  ÁAE A À  Á  AÀ  BÀ   ÁBÀ          ipv6ModeGet 	   tonumber       @   IPV6MODE_NOT_ENABLED    NIL    INVALID_ARGUMENT    db 
   deleteRow    static_routesTable    _ROWID_    FAILURE    SUCCESS                                 @@ E     D   FÀÀ @   D   F Á ^  D   F@Á    ^         db 	   getTable    static_routesTable    NIL    FAILURE    SUCCESS                     &  2          @@ E  À    À@      A     @A          db    deleteAllRows    static_routesTable    NIL    FAILURE    SUCCESS                             