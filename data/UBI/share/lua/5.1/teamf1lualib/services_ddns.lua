LuaQ                     A@    À@@  A@ @   A @   AÀ @   A  @   A@ @   A  E  À \   Á   Á Ç@ Á  ÇÀ Á  Ç@ Á Ç Á  ÇÀ Á Ç@ Á  ÇÀ Á Ç@ Á  Ç Á ÇÀ Á  Ç  Á  Ç@ Á Ç Á  ÇÀ Á Ç@ Á 	 ÇÀ Á	 Ç@	 Á 
 ÇÀ	 Á
 Ç@
 Á  ÇÀ
 Á@ Ç@ ÁÀ Ç Ê  A  Á 	 A	 
 Á
  A C Á  â@Ç  Ê   A
  ÁA Â A  Á 	 A	 
 Á â@  A  Á  A  Á 
  A A 	ÁNA 	CA 	ÏA 	ÐA 	Ð A 	Ñ¡A 	AÑ¢A 	ÁQ£A 	AR¤A 	ÁR¥A 	S¡A 	AÓ¦A 	ÁS§A 	AT¨A 	ÁT©A 	UªA 	AÕªA 	N«A 	Ö«$      A $A       $      Á $Á       $     A $A      $        Á $Á      $     A $A            $     Á $Á      $        A $A      $     Á $Á         $     A $A      $     Á $Á      $     A $A         $     Á $Á      $     A $A      $     Á $Á      $     A $A      $     Á $Á      $     A $A      $     Á $Á            $	     A $A	      $	     Á $Á	       $
     A  $A
             module    com.teamf1.core.services.ddns    package    seeall    require    teamf1lualib/db    teamf1lualib/util    teamf1lualib/validations    teamf1lualib/returnCodes    teamf1lualib/ddns_returnCodes    com.teamf1.core.returnCodes    com.teamf1.core.validations !   com.teamf1.core.ddns.returnCodes    ENABLE    1    DISABLE    0    SERVICE_NONE    SERVICE_DDNS    SERVICE_DLINKDNS    3    SERVICE_ORAY    4    OPTION2    2    OPTION1    WAN3    SERVICE_DISABLE    SERVICE_DYNDNS    SERVICE_DLINKDDNS    SERVICE_FREEDNS    SERVICE_ZONEEDIT    5    SERVICE_NOIP    6    SERVICE_3322ORG    7    SERVICE_EASYDNS    8    SERVICE_TZOCOM    9    SERVICE_DYNSIP    10    SERVICE_CUSTOM    11    12    SERVICE_DYNAMICUPDATE    13    serviceTbl 	   KEY_FILE    nsupdate.key.    KEY_LOC    /flash/tmp/ddns/key/ 
   ddnsTable    ddns    ddnsStatusTable    ddnsStatus 
   attribute    key    _ROWID_ 	   keyvalue    wanPort    interfaceName    service    ddnsService    ddnsServer    server 	   userName 	   username 	   password    domainName 	   hostname 	   zoneName 	   zonename 	   userType 	   orayType    orayDomain 	   ddnsType 
   wildCards 	   wildflag 
   exIpCheck    ipcheck    periodicUpdate    timePeriod    ddnsUrl    ddnsOptUrl    ddnsKey    status    Status    wanPortGet    wanPortGetNext    wanPortSet    wanPortDelete    serviceGet    serviceGetNext    serviceSet 
   serverGet    serverGetNext 
   serverSet    userNameGet    userNameGetNext    userNameSet    passwordGet    passwordGetNext    passwordSet    userTypeGet    userTypeGetNext    userTypeSet    domainNameGet    domainNameGetNext    domainNameSet 
   statusGet    statusGetNext 
   statusSet    iswildCardsEnabled    iswildCardsEnabledNext    wildCardsEnable    wildCardsDisable    isperiodicUpdateEnabled    isperiodicUpdateEnabledNext    periodicUpdateEnable    periodicUpdateDisable    ddnsConfigGet    ddnsConfigGetNext    ddnsConfigSet    ddnsConfigCreate    ddnsConfigDelete    ddnsOption2GetAll    ddnsOption1GetAll    ddnsWan3GetAll    ddnsTblModify *       t              @@ A  À  E   F Á À  Å@ ÆÁ   EA FÁÁ\    B     @B     BÁÀ             db    getNextRowId    0 
   ddnsTable    getAttribute 
   attribute    key    wanPort    NIL    FAILURE    SUCCESS       ð?                       ­    1   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á    Å@ \    @     A  À  ÀAÅ@  AB@  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db    getNextRowId 
   ddnsTable    TABLE_IS_FULL    getAttribute 
   attribute    key    wanPort    FAILURE    SUCCESS                     ½   Á           @À            NOT_SUPPORTED                     Î   Ò           @À            NOT_SUPPORTED                     à   î           @@ A  À  E   F Á À  Å@ ÆÁ   EA FÁÁ\    B     @B     BÁÀ             db    getNextRowId    0 
   ddnsTable    getAttribute 
   attribute    key    service    NIL    FAILURE    SUCCESS       ð?                    þ      1   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á    Å@ \    @     A  À  ÀAÅ@  AB@  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db    getNextRowId 
   ddnsTable    TABLE_IS_FULL    getAttribute 
   attribute    key    service    FAILURE    SUCCESS                     (  J   G       @W  @  À    Ä   Æ ÀÀ     @  À   AÅ@  ÁA@    B    @      @    @B   W ÀÀ W    W @@ W    @B  À  CÅ@  ÁA@   ÁCÀ  Ä   Æ ÀÀ À Ä   Æ Ä   Þ Ä   Æ@Ä   Þ         NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow 
   ddnsTable 
   attribute    key     SERVICE_INVALID    SERVICE_DDNS    SERVICE_ORAY    SERVICE_DLINKDNS    SERVICE_NONE    setAttribute    service    FAILURE    SUCCESS                     X  f          @@ A  À  E   F Á À  Å@ ÆÁ   EA FÁÁ\    B     @B     BÁÀ             db    getNextRowId    0    ddnsStatusTable    getAttribute 
   attribute    key    server    NIL    FAILURE    SUCCESS       ð?                    v     1       @W  @  À    Ä   Æ ÀÀ     @  À   AÀ   A Ä   Æ ÀÀ  Ä   ÆÁÞ  ÅÀ  ÆÀÁ EA FÂ ÅA ÆÁÂÜ  @ À   C@   AC@          NIL 	   tonumber    INVALID_ARGUMENT    db    getNextRowId 
   ddnsTable    TABLE_IS_FULL    getAttribute    ddnsStatusTable 
   attribute    key    server    FAILURE    SUCCESS                     £  Æ   F       @W  @  À    Ä   Æ ÀÀ     @  À   AÅ@  ÁA@    B    @      @    @B    ÀBÁ      Ä   Æ@ÃWÀ    @B  À  CÅ@  ÁA@   ÁCÀ  Ä   Æ ÀÀ À Ä   Æ Ä   Þ Ä   Æ@Ã   Þ         NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow 
   ddnsTable 
   attribute    key     SERVER_INVALID    valid    ipAddressCheck    2    SUCCESS    setAttribute    server    FAILURE                     Ô  â          @@ A  À  E   F Á À  Å@ ÆÁ   EA FÁÁ\    B     @B     BÁÀ             db    getNextRowId    0 
   ddnsTable    getAttribute 
   attribute    key 	   userName    NIL    FAILURE    SUCCESS       ð?                    ò     1   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á    Å@ \    @     A  À  ÀAÅ@  AB@  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db    getNextRowId 
   ddnsTable    TABLE_IS_FULL    getAttribute 
   attribute    key 	   userName    FAILURE    SUCCESS                       ;   	8   Ä   Æ ÀWÀ  Å@     Ü   @  Ä   ÆÀÞ  ÅÀ  Æ ÁA E FÁÁ  Ü  Â Ä   ÆÀÞ  Ä   Æ ÀÀ  Ä  Æ@ÂÞ  ÅÀ  ÆÂA E FÁÁ  Å ÆÁÂ  Ü   @ À   C@    AC@          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow 
   ddnsTable 
   attribute    key     USERNAME_INVALID    setAttribute 	   userName    FAILURE    SUCCESS                     I  X          @@ A  À  E   F Á À  Å@ ÆÁ   EA FÁÁ\    B     @B     BÁÀ             db    getNextRowId    0 
   ddnsTable    getAttribute 
   attribute    key 	   password    NIL    FAILURE    SUCCESS       ð?                    h     =       @W  @  À    Ä   Æ ÀÀ     @  À   AÅ@  ÁA@    B    @  À  @BÀ   A Ä   Æ ÀÀ  Ä   ÆÂÞ  ÅÀ  ÆÀÂA E FÁÁ Å ÆÃÜ  @ À   AC@   C@          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow 
   ddnsTable 
   attribute    key     getNextRowId    TABLE_IS_FULL    getAttribute 	   password    FAILURE    SUCCESS                       ¹   	8   Ä   Æ ÀWÀ  Å@     Ü   @  Ä   ÆÀÞ  ÅÀ  Æ ÁA E FÁÁ  Ü  Â Ä   ÆÀÞ  Ä   Æ ÀÀ  Ä  Æ@ÂÞ  ÅÀ  ÆÂA E FÁÁ  Å ÆÁÂ  Ü   @ À   C@    AC@          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow 
   ddnsTable 
   attribute    key     PASSWORD_INVALID    setAttribute 	   password    FAILURE    SUCCESS                     Ç  Õ          @@ A  À  E   F Á À  Å@ ÆÁ   EA FÁÁ\    B     @B     BÁÀ             db    getNextRowId    0    ddnsStatusTable    getAttribute 
   attribute    key 	   userType    NIL    FAILURE    SUCCESS       ð?                    å     =       @W  @  À    Ä   Æ ÀÀ     @  À   AÅ@  ÁA@    B    @  À  @BÀ   A Ä   Æ ÀÀ  Ä   ÆÂÞ  ÅÀ  ÆÀÂA E FÁÁ Å ÆÃÜ  @ À   AC@   C@          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    ddnsStatusTable 
   attribute    key     getNextRowId    TABLE_IS_FULL    getAttribute 	   userType    FAILURE    SUCCESS                                 @À            NOT_SUPPORTED                     (  7          @@ A  À  E   F Á À  Å@ ÆÁ   EA FÁÁ\    B     @B     BÁÀ             db    getNextRowId    0 
   ddnsTable    getAttribute 
   attribute    key    domainName    NIL    FAILURE    SUCCESS       ð?                    H  d   1       @W  @  À    Ä   Æ ÀÀ     @  À   AÀ   A Ä   Æ ÀÀ  Ä   ÆÁÞ  ÅÀ  ÆÀÁ EA FÂ ÅA ÆÁÂÜ  @ À   C@   AC@          NIL 	   tonumber    INVALID_ARGUMENT    db    getNextRowId 
   ddnsTable    TABLE_IS_FULL    getAttribute    ddnsStatusTable 
   attribute    key    domainName    FAILURE    SUCCESS                     u     8       @W  @  À    Ä   Æ ÀÀ     @  À   AÅ@  ÁA@    B    @      @    @B  À  BÅ@  ÁA@   ÁBÀ  Ä   Æ ÀÀ À Ä   Æ Ã   Þ Ä   Æ@Ã   Þ         NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow 
   ddnsTable 
   attribute    key     DOMAIN_NAME_INVALID    setAttribute    domainName    FAILURE    SUCCESS                     ¢  °          @@ A  À  E   F Á À  Å@ ÆÁ   EA FÁÁ\    B     @B     BÁÀ             db    getNextRowId    0    ddnsStatusTable    getAttribute 
   attribute    key    status    NIL    FAILURE    SUCCESS       ð?                    À  Ü   1       @W  @  À    Ä   Æ ÀÀ     @  À   AÀ   A Ä   Æ ÀÀ  Ä   ÆÁÞ  ÅÀ  ÆÀÁA E FAÂ Å ÆÂÜ  @ À   ÁB@   C@          NIL 	   tonumber    INVALID_ARGUMENT    db    getNextRowId    ddnsStatusTable    TABLE_IS_FULL    getAttribute 
   attribute    key    status    FAILURE    SUCCESS                     í  ñ          @À            NOT_SUPPORTED                     ÿ            @@ A  À  E   F Á À  Å@ ÆÁ   EA FÁÁ\    B     @B     BÁÀ             db    getNextRowId    0 
   ddnsTable    getAttribute 
   attribute    key 
   wildCards    NIL    FAILURE    SUCCESS       ð?                      :   1       @W  @  À    Ä   Æ ÀÀ     @  À   AÀ   A Ä   Æ ÀÀ  Ä   ÆÁÞ  ÅÀ  ÆÀÁA E FAÂ Å ÆÂÜ  @ À   ÁB@   C@          NIL 	   tonumber    INVALID_ARGUMENT    db    getNextRowId 
   ddnsTable    TABLE_IS_FULL    getAttribute 
   attribute    key 
   wildCards    FAILURE    SUCCESS                     J  c   1       @W  @  À    Ä   Æ ÀÀ     @  À   AÅ@  ÁA@    B    @  À  @BÅ@  ÁA@   BÅÁ  Ä   Æ ÀÀ À Ä   Æ Ã   Þ Ä   Æ@Ã   Þ         NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow 
   ddnsTable 
   attribute    key     setAttribute 
   wildCards    ENABLE    FAILURE    SUCCESS                     p     1   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Å ÆÀÁ   \  Â  D   FÀ ^  EÀ  F@Â @ Å ÆÀÁ   E FÂÁ \     @ À     CÀ       @CÀ            NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow 
   ddnsTable 
   attribute    key     setAttribute 
   wildCards    DISABLE    FAILURE    SUCCESS                       £          @@ A  À  E   F Á À  Å@ ÆÁ   EA FÁÁ\    B     @B     BÁÀ             db    getNextRowId    0 
   ddnsTable    getAttribute 
   attribute    key    periodicUpdate    NIL    FAILURE    SUCCESS       ð?                    ³  Ï   1       @W  @  À    Ä   Æ ÀÀ     @  À   AÀ   A Ä   Æ ÀÀ  Ä   ÆÁÞ  ÅÀ  ÆÀÁA E FAÂ Å ÆÂÜ  @ À   ÁB@   C@          NIL 	   tonumber    INVALID_ARGUMENT    db    getNextRowId 
   ddnsTable    TABLE_IS_FULL    getAttribute 
   attribute    key    periodicUpdate    FAILURE    SUCCESS                     ß  ÷   1   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Å ÆÀÁ   \  Â  D   FÀ ^  EÀ  F@Â @ Å ÆÀÁ   E FÂÁ \     @ À     CÀ       @CÀ            NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow 
   ddnsTable 
   attribute    key     setAttribute    periodicUpdate    ENABLE    FAILURE    SUCCESS                          1   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Å ÆÀÁ   \  Â  D   FÀ ^  EÀ  F@Â @ Å ÆÀÁ   E FÂÁ \     @ À     CÀ       @CÀ            NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow 
   ddnsTable 
   attribute    key     setAttribute    periodicUpdate    DISABLE    FAILURE    SUCCESS                     5  ]    l   
   J      @@Á  Á  Å   Æ ÁÁ  EA FÁ Ü   Ä   ÆÀÁÀ   Ä   Æ ÂÞ  Ã Â  ÁB C BÆ Â  ÁB C ÃB Â  ÁB C CÆ Â  ÁB C CCF Â  ÁB C C Â  ÁB C ÃC Â  ÁB C DF   ÂAWÀ  ÂAWÀ  ÂAWÀ  ÂAWÀ  ÂAWÀ  ÂAWÀ   ÂA   B   BDÁ  @ À  @          db    getNextRowId    0 
   ddnsTable    getRow 
   attribute    key    NIL    FAILURE    .    wanPort    service    domainName 	   userName 	   password 
   wildCards    periodicUpdate    SUCCESS       ð?                    w  ±      D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Å ÆÀÁ   \  Â  D   FÀ ^  EÀ  F Á @ Å ÆÀÁ   \  Â  D   FÀ ^  EÀ  FÂ    Å@ \    @     ÀB  À   CÅ@  ÁA@  Ä   Æ ÀÀ @ Å@ Þ  Ã  EC  Å ÆÃÃUÃÆ@EC  Å ÆÄUÃAEC  Å ÆCÄUÃFBEC  Å ÆÄUÃAEC  Å ÆÃÄUÃÆAEC  Å ÆÅUÃÆBEC  Å ÆCÅUÃCD  FÀW@ÀD  FÀW@ÀD  FÀW@ÀD  FÀW@ÀD  FÀW@ÀD  FÀW@À D  FÀ@@ EC ^ D  FÅ À  @ À @ ^         NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow 
   ddnsTable 
   attribute    key     ddnsStatusTable    getNextRowId    TABLE_IS_FULL    getRow    FAILURE    .    wanPort    service    domainName 	   userName 	   password 
   wildCards    periodicUpdate    SUCCESS                     É  _   f  Ê    @W  D  @   D  FÀ@   @   @W  @Ä  W  	 W  ÀD W    W  @Ä W   W  ÀD W    W  @Ä W   W  ÀD W    W  @Ä W    D D A Ä E	ED D  À  FÉC   @   @W D A Ä E	É @D A Ä E	ÉÃE  @W D A Ä F	ÉÃ @D A Ä F	ÉCF  @W D A Ä F	É@D A Ä F	ÉÃF  @W D A Ä G	ÉC@D A Ä G	ÉCG  @W D A Ä G	É@D A Ä G	ÉÃG  @W D A Ä H	ÉÃ@D A Ä H	ÉCH  @W  H@     ÄHW    @ D A Ä I	É@D A Ä I	ÉCH  @W  H@    ÄHW    @ D A Ä DI	ÉC@D A Ä DI	ÉI  @W D A Ä ÄI	É@D A Ä ÄI	ÉCH  @W D A Ä J	ÉÃ@D A Ä J	ÉCJ  @W  WJD A Ä ÄJ	É@D A Ä ÄJ	ÉKD KED Ä ÄK	À  Å L
D  FÀW@ED FÌÄ Å Ä	\D ED FÌD À E Å À Ä	\D ED  ÅÄ ÆÎ	UÄÉÉ@ED FÌD Å Å @ D	\D ED  ÅÄ ÆÎ	UÄÉCÈED FÎD À   \   @	À   ÄN	À    ÄH	À    <      NIL 	   tonumber    INVALID_ARGUMENT    SERVICE_DISABLE    SERVICE_DYNDNS    SERVICE_DLINKDNS    SERVICE_FREEDNS    SERVICE_ZONEEDIT    SERVICE_NOIP    SERVICE_3322ORG    SERVICE_EASYDNS    SERVICE_TZOCOM    SERVICE_DYNSIP    SERVICE_CUSTOM    SERVICE_ORAY    SERVICE_DYNAMICUPDATE    SERVICE_INVALID 
   ddnsTable    . 
   attribute    service    serviceTbl    ddnsServer 	   NOSERVER 	   userName    NOUSER 	   password 	   NOPASSWD    domainName    NOHOST 	   zoneName    NOZONE 	   ddnsType         
   isBoolean    SUCCESS 
   wildCards 
   exIpCheck       ð?   periodicUpdate    ddnsUrl    NOURL        ddnsOptUrl 	   NOOPTURL    db    getAttribute    key    wanPort    os    execute 
   mkdir -p     KEY_LOC    mv -f /tmp/      	   KEY_FILE    ddnsKey    rm -f     update    FAILURE                     v  {  
      @ÅB          NOT_SUPPORTED    rowid                             D   F À    ^         NOT_SUPPORTED                       ¢    +   
   J      @@Å  Á  AEA        A      ÀA     @@Å  Á  AEA  @     A     ÀA  @ À          BÁÀ    @          db    getRow 
   ddnsTable 
   attribute    key    OPTION2    NIL    FAILURE    ddnsStatusTable    ddnsTblModify    SUCCESS       ð?                    §  º    +   
   J      @@Å  Á  AEA        A      ÀA     @@Å  Á  AEA  @     A     ÀA  @ À          BÁÀ    @          db    getRow 
   ddnsTable 
   attribute    key    OPTION1    NIL    FAILURE    ddnsStatusTable    ddnsTblModify    SUCCESS       ð?                    À  Ó    +   
   J      @@Å  Á  AEA        A      ÀA     @@Å  Á  AEA  @     A     ÀA  @ À          BÁÀ    @          db    getRow 
   ddnsTable 
   attribute    key    WAN3    NIL    FAILURE    ddnsStatusTable    ddnsTblModify    SUCCESS       ð?                    Ú      -   D   @  Æ @  F Z@    A  	@ F @ À@ À  Ê     	@	  W Á  W@Á   	ÀAW@Á   	ÀA@Á @ 	ÀÁ	ÀAW Á  	ÀÁ	ÀAÀ Æ C @Ã  	ÀAÃ @ 	ÀÁ	ÀA          ddns.ddnsService 	   tonumber    1    ddns.interfaceName    11    13    ddns.server     ddns.zonename    ddns.username    ddns.password    ddns.ddnsUrl    ddns.ddnsOptUrl 	   NOOPTURL    12    ddns.hostname    ddns.timePeriod                             