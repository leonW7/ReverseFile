LuaQ                      A@    À@@  A@ @   A @   AÀ @   A  @   A@  E   \ À Á  A J  ICIÁÃID  AÄÁDAEEÁÅFAÄÆÁÆÁ Â A Â ÁB  AÃ   HCÄÃÃDÊ  ÉÈÉÉÉÉÉÊÉÊÉËÉËÉÌD d             G dD           GÄ d                       G dÄ                         GD d                      G dD                        GÄ d                G dÄ     GD d     G dD     GÄ d     G dÄ     GD d                G   ?      module    com.teamf1.core.logging.view    package    seeall    require    teamf1lualib/db    teamf1lualib/util    teamf1lualib/validations    teamf1lualib/returnCodes    com.teamf1.core.returnCodes    com.teamf1.core.validations    environment    eventLogging    displayLogs    facilityID 	   logLevel 	   category 
   component    sslvpnLogFile    UMI_COMP_SSLVPN    vpnLogFile    VPN_LOG_FILE_NAME    name    value    textMessage    captiveportalLogFile    UMI_COMP_CAPTIVEPORTAL    _ROWID_       ð?   EMAILLOGS_PROGRAM    1    /var/currentLogs.txt    facilityId    kernelToken    UMI_COMP_KERNEL_LOG    systemToken    UMI_COMP_SYSTEM_LOG    wirelessToken    UMI_COMP_WIRELESS_LOG    networkToken    UMI_COMP_NETWORKING_LOG 	   vpnToken    UMI_COMP_VPN_LOG 	   wcfToken    UMI_COMP_WCF_LOG    firewallToken    UMI_COMP_FIREWALL_LOG    pkgMngrToken    UMI_COMP_PKGMGMT    /data/tmp/logging.db    logEncValuesSet    logEncLogValuesDelete    logEncLogValuesDeleteAll    logEncLogValuesSend    logEncValuesGet    logEncValuesSaveToFile    logTypeGet    logTypeGetNext    logTypeSet    logGet    logGetNext    logSet 
   logDelete        d       
1     A@D    Ä  Â@@   À  Ú@    AA   A@D    Ä  A@  À  Ú@    AA   A@D    Ä  ÂA@  À  Ú@    AA B   	      db    setAttribute    _ROWID_    facilityID    returnCode    ERROR 	   logLevel 	   category    SUCCESS                               E   F@À   Ä   Á   \@ C      AÄ  A @   @  Z@     A    ÀA          db    execute 	   ATTACH '    ' as loggingDB 
   deleteRow    _ROWID_    FAILURE    SUCCESS                     ¢   ö    #è   E   F@À   Ä   Á   \@ D  F Á    AÄ  Æ Á AC  AAÄ  D ÂA@    AAÄ  D B    AAÄ  D BBÀ   AW À AWÀ  A  B Á À  @  Á À       @Ã ÀCÁÁ  DAB AÀÄ ÀCÁÁ  ÂDAB A@ Å ÀCÁÁ  BEAB AÀÅ ÀCÁÁ  ÂEAB A@ Æ ÀCÁÁ  BFAB AÀÆ ÀCÁÁ  ÂFAB A@ Ç ÀCÁÁ  BGAB AÀ
 ÄÆÃÂ D FÄÂ ÄÆÃÃ D FÃÄÃ ÄÆÃÄ D FDÅÄ ÄÆÃ	Å D FÅÅ
Å ÄÆÃÆ D FFÆÆ ÄÆÃÇ D FÇÆÇ ÄÆÃÈ D FHÇ W@C  A@BÁA    Á BAB  WÀÈ AABÁÁ  AB AÀ Á BBAÂ ÁB Á  IÄ  @  AI   &      db    execute 	   ATTACH '    ' as loggingDB    NIL    getAttribute    _ROWID_    facilityID 	   logLevel 	   category    ERROR 	   tonumber    tempTab         
   component    ='    kernelToken    '       @   systemToken       0@   wirelessToken       2@   networkToken       3@	   vpnToken       4@	   wcfToken       5@   firewallToken    (    ' or     ')    =     and     all    deleteRowWhere    SUCCESS                     ý   D  	    D   F À     @Ä   Æ À  @D  FÀ ÅA  ÆÀ AÂ   ÄÆÁÜ@ ÅA  ÆÀ AÂ   ÄÆBÁÜ ÅA  ÆÀ AÂ   ÄÆÁÜÀ Ä  ÆÀWÀ ÀÄ  ÆÀWÀÀ Ä  ÆÀÀ Ä  ÆÁÁÞ Å   Ü @ Å   Ü  Ê  ÇA Â  Ä FÁÂ  Ã  Ä FAÃÀÃ  Ä FÁÃ Ä  Ä FAÄ@Ä  Ä FÁÄ  Å  Ä FAÅÀ Å @ Ä FÁÅÅA  ÆÀD Ä Ü Ä  ÆÀÀ Ä  ÆÆÞ À B E AÄ  ÆÀWÀÀ À Â @AWBÀ À  @ AW@G À À  @  AÅÁ ÆÈ  Ü    !      NIL    db    getAttribute    _ROWID_    facilityID 	   logLevel 	   category    ERROR 	   tonumber    tempTab            kernelToken       @   systemToken       0@   wirelessToken       2@   networkToken       3@	   vpnToken       4@	   wcfToken       5@   firewallToken    FAILURE         DB_FILE_NAME     -c      -l        ð¿    -r     os    execute                     N  ¦    #õ      @@ A     ÁÀ  UÀ @    A D  F Á    AÄ  Æ Á
  J    AAÄ  D ÂA     AAÄ  D B@    AAÄ  D BB   AW À AW À  A@ A À   @   À   E A À      A À  @     B ÀCÁÁ  DAB Õ@ÀD ÀCÁÁ  ÂDAB Õ@@ E ÀCÁÁ  BEAB Õ@ÀE ÀCÁÁ  ÂEAB Õ@@ F ÀCÁÁ  BFAB Õ@ÀF ÀCÁÁ  ÂFAB Õ@@ G ÀCÁÁ  BGAB Õ@À
 ÄÆÃÂ D FÄÂ ÄÆÃÃ D FÃÄÃ ÄÆÃÄ D FDÅÄ ÄÆÃ	Å D FÅÅ
Å ÄÆÃÆ D FFÆÆ ÄÆÃÇ D FÇÆÇ ÄÆÃÈ D FHÇ ÕWÂ   A@BÁA   Õ Á BAB  ÕWÀB AABÁÁ   AB Õ@ÀÁ BBAÂ  ÁB ÕÀÁÁ ÕÀ  IÄ    À   E   %      db    execute 	   ATTACH '    ' as loggingDB    NIL    getAttribute    _ROWID_    facilityID 	   logLevel 	   category            all    tempTab 	   tonumber 
   component    ='    kernelToken    '       @   systemToken       0@   wirelessToken       2@   networkToken       3@	   vpnToken       4@	   wcfToken       5@   firewallToken    (    ' or     ')    =     and      ORDER BY logTimeStamp DESC    getRowsWhere                     ­  a  	  &z     @@ A     ÁÀ  UÀ @    A D  F@Á   @AÄ  Æ@Á AAJ    Ã E FÂÁ Á \À@Â    W@ÂKÂÁÂ \BKÂÁ \BEB FÃ\  @BÀ KÂÃ\B Ã  KÂÁ   AC ÕB\BKÂÁ \BKÂÁÂ \BKÂÁ \BE  FÅÁB  DFÅ\@ E  FÅÁB  DFÃÅ\ E  FÅÁB  DFÆ\À D FBÁW@ ÀD FBÁW@À D FBÁ@@A@ @ Á J  W@Â@ KÂÃ\B   EÂ  \ @ EÂ  \  J  G @Æ ÀD FBÇ ÄÆÂÇ À@È ÀD FBÇ ÄÆÈ @ÀÈ ÀD FBÇ ÄÆÉ À@É ÀD FBÇ ÄÆÉ @ÀÉ ÀD FBÇ ÄÆÊ À@Ê ÀD FBÇ ÄÆÊ @ÀÊ ÀD FBÇ ÄÆË À
AB  BGÁ ÃGA  CGÁ HA  DG	Á I
A  EGÁ IA  FGÁ JA  GGÁ JA  HGÁ 		KAÉ AW@F D FBÁ@@D FÂÅ À Á@ B Ä ÆÂÅ @ AWÆD FBÁ@D FÆ À À@ B Ä ÆÆ @ E  FÌ À \G E W@Â@W@ÂÀE T@ÀE  \@ ÆCMÍ@ ÁÃ   Î@ ÁC  Î@ ÁÃ   Ï@ ÁC  Ï@ ÁÃ   Ð@ ÁC  Ð@ ÁÃ   Á DQQ@ Ä  R@ D R@ Ä  S@ D N@  ÀS@  @T@   ÀT   FDUÂ A  Á  AF E
Da  ÀìW@Â@ KÂÃ\B D ÀÕ    X      db    execute 	   ATTACH '    ' as loggingDB    FAILURE    NIL    io    open    w     write    CURRENT LOGS 
    ============ 
    os    date    close '   Capture the current Logs to file at :     
 Q   ===============================================================================
    Facility	Severity	Log Message
    getAttribute    _ROWID_    facilityID 	   logLevel 	   category            all 	   tonumber    tempTab 
   component    ='    kernelToken    '       @   systemToken       0@   wirelessToken       2@   networkToken       3@	   vpnToken       4@	   wcfToken       5@   firewallToken    (    ' or     ')    =     and     getRowsWhere       ð?   pairs    eventLogging.facilityId    0    KERNEL    3    SYSTEM    16 	   WIRELESS    18    NETWORK    19    VPN    20    WCF    21 	   FIREWALL    All    eventLogging.logLevel    1 
   Emergency    2    Alert    4 	   Critical    8    Error    Warning    32    Notice    64    Information    128    Debug    eventLogging.textMessage 	               SUCCESS                     l  ç   ò   E   F@À   Ä   Á   \@ C   A    @A  WA WÀA  W B W@B  WB WÀB  W C W@C  WC    ÀC   B À       @DÁ  ADAÁ @Å   Æ Å@ Ü ÁÀ  AE À  E@@C À        ÀEÄ   AÀ Ä  Æ@ÅÞ  À Ä  ÆÅ  Þ ÀB À       @DÁ   ADAA @Å   Æ Å@ Ü ÁÀ  AE À  E@@B         FÄ  ADAÁ   AÀ Ä  Æ@ÅÞ  À Ä  ÆÅ  Þ  C À        FÄ  ADD FÇ  AÀ Ä  Æ@ÅÞ  À Ä  ÆÅ  Þ C À        FÄ  ADD FAÇ  AÀ Ä  Æ@ÅÞ  À Ä  ÆÅ  Þ B À   GÄ   ÁGD FÈ AHÄ  ÆÈÀ  Ä  Æ@ÅÞ  Å 	 Æ@É  Ü ÇÀ ÅÀ  H  Ä  Æ@ÅÞ  ÁÀ	 Ç	 Á@
 Ç 
 Ê   Ç
 ÅÀ ËÀÊA 
 ÁA 
 U¤  Ü@ Ê    E
 À E
 ÂËFÉ@!  @þ E@ A    @E    EÁÀ        0      db    execute 	   ATTACH '    ' as loggingDB     INVALID_ARGUMENT    lan    wan 	   firewall    wlan    ipsec    wcf    sslvpn    syslog    captiveportal    INVALID_LOGTYPE 
   logsTable 
   component     = 'UMI_COMP_FIREWALL' or      = 'UMI_COMP_KERNEL_FIREWALL'    getRowsWhere    FAILURE    SUCCESS 	   getTable     = 'UMI_COMP_WCF' or      = 'UMI_COMP_KERNEL_WCF'    getRows    UMI_COMP_WIRELESS_CTRL    sslvpnLogFile    captiveportalLogFile    getAttribute    name    vpnLogFile    value    NIL    vpnLogsText    util    fileToString    vpnLogs        sep    
    fields    gsub    ([^    ]*)    pairs       ð?       Ò  Ô       E   F@À   À   \@        table    insert    fields                                 ö  ý      D   F À    ^         NOT_SUPPORTED                                 @À            NOT_SUPPORTED                     !  (           @           NOT_SUPPORTED                     7  =      D   F À    ^         NOT_SUPPORTED                     M  U          @À            NOT_SUPPORTED                     Z        E   F@À   Ä   Á   \@ C   A    @A  WA WÀA  W B W@B  WB WÀB  W C    @C  A @  CÁÀ  CA @Å   ÆÄ@ ÜÇ@ ÀB     ÀDÄ  CA  @   C     ÀDÄ  CAA  @ @ B @   ÀEÄ   FD FAÆ F À @@Á   Õ  @ @  A	  @GÀ    @ÀA     ÀDÄ  CA  @ @B @  CÁÀ  CA @Å   ÆÄ@ ÜÇ@ ÀB     @HÄ  @ @  AÀ   @GÀ      H    #      db    execute 	   ATTACH '    ' as loggingDB     INVALID_ARGUMENT 	   firewall    wlan    ipsec    wcf    sslvpn    syslog    captiveportal    INVALID_LOGTYPE 
   component     = 'UMI_COMP_FIREWALL' or      = 'UMI_COMP_KERNEL_FIREWALL'    status    deleteRowWhere 
   deleteRow    UMI_COMP_SSLVPN    UMI_COMP_CAPTIVEPORTAL    vpnLogsFile    getAttribute    name    vpnLogFile    value    os    echo '' >     FAILURE    UMI_COMP_WIRELESS_CTRL     = 'UMI_COMP_WCF' or      = 'UMI_COMP_KERNEL_WCF'    deleteAllEntries    SUCCESS                             