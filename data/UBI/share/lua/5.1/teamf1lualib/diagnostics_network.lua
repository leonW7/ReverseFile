LuaQ                ±      A@    À@@  A@ @   A @   AÀ @   A  @   A@  E   \ À Á  A A Á Á B Õ
  J  G E IÅE IÅE IÂÅE IFE IBÆE IFE IÂÆE IGE IÇE IÈE IÈE IÉE IÉE IÊE IÊE IËE IËE IÌE IÌE IÍE IÍA Â ä                Ç äB      ÇB ä      Ç äÂ           ÇÂ ä     Ç äB     ÇB ä     Ç äÂ     ÇÂ ä     Ç äB     ÇB ä     Ç äÂ          ÇÂ ä     Ç äB     ÇB ä       Ç äÂ     ÇÂ ä     Ç äB          ÇB ä        Ç äÂ        ÇÂ ä     Ç äB        ÇB ä        Ç äÂ             ÇÂ ä        Ç äB ÇB ä 	Â©  S      module $   com.teamf1.core.diagnostics.network    package    seeall    require    teamf1lualib/db    teamf1lualib/util    teamf1lualib/validations    teamf1lualib/returnCodes    com.teamf1.core.returnCodes    com.teamf1.core.validations    diagnostics    environment    tcpdump 	   ifStatic    

Private routes table
 )   <Destination/Netmask> via <Gateway> dev     <Interface> metric <Metric>

 
   attribute    key    _ROWID_ 	   keyValue    1    ipv4RouteTable    ipv6RouteTable    address    ping    traceroute 
   dnsLookup 
   interface    LogicalIfName    packetCapture    tcpdumpEnabled    routeProgram    ROUTE_PROGRAM    route6Program    ROUTE6_PROGRAM    privateRouteProgram    PRIVATE_ROUTE_PROGRAM    privateRouteFileName    PRIVATE_ROUTE_FILE_NAME    pingFileName    PING_FILE_NAME    vpnPingProgram    VPN_PING_PROGRAM    pingProgram    PING_PROGRAM    ping6Program    PING6_PROGRAM    tracerouteProgram    TRACEROUTE_PROGRAM    traceroute6Program    TRACEROUTE6_PROGRAM    nsLookupProgram    NSLOOKUP_PROGRAM    0    ipv4RouteTableGet    ipv4RouteTableGetNext    ipv4RouteTableSet    ipv6RouteTableGet    ipv6RouteTableGetNext    ipv6RouteTableSet    addressGet    addressGetNext    addressSet    pingGet    pingGetNext    pingSet    tracerouteGet    tracerouteGetNext    tracerouteSet    dnsLookupGet    dnsLookupGetNext    dnsLookupSet    interfaceGet    interfaceGetNext    interfaceSet    packetCaptureGet    packetCaptureGetNext    packetCaptureSet    packetCaptureGroupGet    runShellCmd    execute        ^        v      @@ D     ÅÀ  Æ ÁA D  FÁ @   D  FÀÁ ^  E   F@À    Á  Á  BAA \  @BÀ    @ Õ@@   A    ÀA     ÅÀ Æ Ã  Ü  Ä  ÆÁÀ  Ä  ÆÀÁÞ  Å   Æ@À  A  Á  ACÁA Ü A   ÁA   A@D    ÅÁ  ÆÃB D FAÂÁ   \A D FÁ@  D FÁÁ^ J  Á CÀ  @  A  ÁA   Ä ÆÁÃWÀ@À D    Ä ÆÄB @ Þ         db    getAttribute    name 
   attribute    routeProgram    value    NIL    FAILURE    pingFileName    execute     >     util    fileToString    privateRouteProgram    privateRouteFileName    EMPTY    SUCCESS       ð?                    §   «       D   F À @  ^         NOT_SUPPORTED    rowId                     »   Á           @À            NOT_SUPPORTED                     Ï   é     8      @@ D     ÅÀ  Æ ÁA E   F@À    Á  Á  AAA \  ÀA     B    @BÀ   @  Õ@@   ÀA      B     ÅÀ Æ Ã   Ü  Ä  ÆÀÁÀ  Ä  Æ ÂÞ  Ä  Æ@Ã @ Þ          db    getAttribute    name 
   attribute    pingFileName    value    route6Program    NIL    FAILURE    execute     >     util    fileToString    SUCCESS       ð?                    ù   ÿ       D   F À @  ^         NOT_SUPPORTED    rowId                                 @À            NOT_SUPPORTED                     #  &           @           NOT_SUPPORTED                     6  <      D   F À    ^         NOT_SUPPORTED                     L  T          @À            NOT_SUPPORTED                     b  h          @          NOT_SUPPORTED                     x  ~      D   F À    ^         NOT_SUPPORTED                       ¿   p       @     @@  À À   AÄ  A E FÁÁ Á@ B Á    Á  AD A Å ÆÃ À    @    AC  @Á À    A  U ADÀA @Á  AD A Å ÆÄ À    @    AC  Á  AÁ   ÁÁ Â A  D FAÄ \A Á  AD A Å ÆÁÁ EA FÅ \ G     ÀE    Ä   Æ ÀÀ     @C      FÅ           NIL    INVALID_ARGUMENT    start    db    getAttribute    name 
   attribute    pingFileName    value        find    :    ping6Program    FAILURE     2>&1           >     execute    pingProgram 	   options1    outputText    util    fileToString    NOT_SUPPORTED    SUCCESS                     Í  Ñ      D   F À ^          NOT_SUPPORTED                     á  ç      D   F À    ^         NOT_SUPPORTED                     õ     E       @     @@  À 
À  Ë A AA ÜÚ   @Å ÆÀÁ A A BÁÁ Ü  Å ÆÀÁ A A CÁÁ Ü Ä   Æ ÀÀ  Ä   Æ@ÃÞ  Á   AÁ   ÀÁEA  \ G     D    Ä   Æ ÀÀ À    @CÅ      ÀDÅ           NIL    INVALID_ARGUMENT    start        find    .    db    getAttribute    name 
   attribute    tracerouteProgram    value    traceroute6Program    FAILURE     2>&1 | grep -v argc      
   cmdOutput    runShellCmd    NOT_SUPPORTED    SUCCESS                     (  /      D   F À ^          NOT_SUPPORTED                     ?  F      D   F À    ^         NOT_SUPPORTED                     V  y   
N       @     @@  À ÀÀ   AÄ  A E FÁÁ Ä   Æ ÀÀ  Ä   Æ@ÀÞ  ÅÀ  Æ Á AA  ABÁ Ü  @    A@  B@ Á À   @UAA Á  AD A ÁA  EÁ FÄ \ G     @D   Ä   Æ ÀÀ À    @@À       DÅ          NIL    FAILURE    start    db    getAttribute    name 
   attribute    nsLookupProgram    value    pingFileName    execute          >     PING_FILE_NAME    outputText    util    fileToString    NOT_SUPPORTED    SUCCESS                                 @@ D     À@Å  Æ Á  AAD  FÁ @   D  FÀÁ ^  D  F Â @ À   ^    
      db    getAttribute 
   attribute    key 	   keyValue 
   interface    NIL    FAILURE    SUCCESS       ð?                    ¦  Á   =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á   Å@ ÆÁ   \ ÀÁ  D   FÀ ^  EÀ  F Â    Ä  \    @     @B  À  BÄ  A A@ A ÁBÄ   Æ ÀÀ À Ä   ÆÀ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    FAILURE    db 
   existsRow 
   attribute    key     getNextRowId    TABLE_IS_FULL    getAttribute 
   interface    SUCCESS                     Ñ  Õ          @À            NOT_SUPPORTED                     ã  ò          @@ D     À@Å  Æ Á  AAD  FÁ @   D  FÀÁ ^  D  F Â @ À   ^    
      db    getAttribute 
   attribute    key 	   keyValue    packetCapture    NIL    FAILURE    SUCCESS       ð?                         =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á   Å@ ÆÁ   \ ÀÁ  D   FÀ ^  EÀ  F Â    Ä  \    @     @B  À  BÄ  A A@ A ÁBÄ   Æ ÀÀ À Ä   Æ Ã  Þ Ä   Æ@Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow 
   attribute    key     getNextRowId    TABLE_IS_FULL    getAttribute    packetCapture    FAILURE    SUCCESS                     /  c   b       @      @@     Á  Á  E FAÁ À \  @   ÁA  À@Ì@ÂÆÂÆÂÀ     ¡  ÀýWÀB  W C W@C  @     A@   @    A@ WÃ  WÀÃ    A@ Ã À ADÄ  ÂD@   EÄ    ADÄ  ÂD@   EÄ   Ä  ÆÀÀÀ   ÁAÀ    AEÀ          NIL    INVALID_ARGUMENT            ifType = 'bridge'    db    getRowsWhere    networkInterface    FAILURE    pairs       ð?   networkInterface.LogicalIfName    WAN1    WAN2    WAN3    start    stop    status    setAttribute 
   attribute 
   interface    packetCapture    SUCCESS                     e  q          @@ D      D  FÀ @   D  FÀÀ ^  D  F Á    ^         db 	   getTable    NIL    FAILURE    SUCCESS                     t  y       E   F@À    Á  À \ ÀÀ  Ë@Á Ü@           io    popen     2>&1    read    *a    close                     {  }       E   F@À    \@         os    execute                             