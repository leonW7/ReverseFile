LuaQ                {   
      @  A  @ @  AÀ  @   d   	@  d@  	@   d  	@  dÀ  	@   d  	@  d@ 	@   d 	@  dÀ 	@   d  	@   d@ 	@    d 	@   dÀ 	@    d  	@   d@ 	@    d 	@   dÀ 	@    d  	@   d@ 	@    d 	@   dÀ 	@    d  	@   d@ 	@    d 	@   dÀ 	@    d  	@   d@ 	@    d 	@   dÀ 	@    d  	@   d@ 	@    d 	@   dÀ 	@    d  	@   d@ 	@    d 	@   dÀ 	@    d 	 	@   d@	 	@   +      dot11Tr    require    teamf1lualib/dot11 	   dot11Lib    dot11    interfaceNameFromVapNameGet    firstVapNameGet    ChannelCheck    TxPowerCheck    OpModeCheck    ssidNameSyntaxCheck    wepKeyIdxValCheck    wepKeyPassPhraseCheck    wepEncrAlgoFromKeyLengthGet    basicEncrModeGet    basicAuthModeGet    wpaAuthModeGet    wpaEncrModeGet    securityModeGet    beaconTypeGet    encrModeGet    authMethodsGet    wepAuthMethodGet    deviceOpModeGet    maxOperationalRateGet 
   vapRowGet    RegDomainSet    wlanParamSet    wlanParamGet    numAssocDevicesGet    getRadioTxPowerRange    wlanStatsGet    WMMParamGet 
   WEPKeySet    WMMParamSet    ACLConfigSet    wirelessIfTblGet    ifnameLookup    ACLConfigGet    ACLAdd 
   ACLDelete    PreSharedKeySet    KeyPassphraseSet &          '        J      À   A   Å  ÆÀÀ @   Ü @ @Á @ Ã Þ  ÆÁ Þ       
   vapName='    '    db    getRowWhere    dot11Interface     interfaceName                     2   I     	&      Ê     À ÀAA    Á  ÁEÁ  FÁA À   \ À  À@ C^ FÁAÁ  EÁ  FÁ À   \   @@ C^ FAB^   
       interfaceName='    '    db    getRowWhere    dot11Radio    radioNo 	   radioNo=    dot11Interface    interfaceName                     U   d        Å   Æ@À   Ü À@     Á@@   A @ @E ÂA\ @   ^  !  Àý          dot11    firstVapNameGet     GetChanList            pairs 	   tostring    channel                     p             À@À   ÀÇ@        W@AÀ  AÀ  Á E  MÁÁ @    @BÀ    Å   Ü   ^  Ã Þ       	   startIdx    endIdx    string    find    dbm     sub       ð?   dot11Tr    getRadioTxPowerRange 	   tonumber                             
      @@À    @@ Ã Þ  Å   ÆÀÀ  Ü À@    @ @   ^  !  þ          dot11    firstVapNameGet     GetModesList    pairs                     ©   ®        ^                            ¹   Á        E      \ M@À À À @@            	   tonumber       ð?              @                    Ì   Ó        E   F@À    \ WÀ  AÀ  Z@  Àÿ  C  ^          string    len       @      *@                    Þ   ê           @@À    W@ÀÿAÀ     @@À    W AÀÿA@    @@À    WAÀÿAÀ ^          string    len       @   40-bit       *@   104-bit       0@   128-bit                     õ   ÿ     	    @ @ A@   @   AÀ  ^          Open    None    WEP    WEPEncryption                               @ @ A@    A  ^          Shared    SharedAuthentication    None                     "  /    #      @@À     WÀ@    @@À    WÀ@@ A@     @@À     WÀ@@ A À   @@À    WÀ@  AÀ ^          string    find    PSK     RADIUS    EAPandPSKAuthentication    PSKAuthentication    EAPAuthentication                     9  F    #      @@À     WÀ@    @@À    WÀ@@ A@     @@À     WÀ@@ A À   @@À    WÀ@  AÀ ^          string    find    CCMP     TKIP    TKIPandAESEncryption    AESEncryption    TKIPEncryption                     R  b        @ @ A@  @ @ AÀ   A @ A  @A @ A  ÀA   A  ^    	      None    Open    Basic    WEP    WPA    11i    WPA2 
   WPAand11i 	   WPA+WPA2                     m  }        @ @ A@  @ @ A  À@ @ A  @A @ A  ÀA   A  ^    	      Open    None    WPA    WPA2    11i 	   WPA+WPA2 
   WPAand11i    WEP    Basic                               @ @ A@  @ @ A@  À@ @ A  @A @ A  ÀA   A  ^    	      None        WEPEncryption    TKIPEncryption    TKIP    AESEncryption    CCMP    TKIPandAESEncryption 
   TKIP+CCMP                     ¥  ±        @ @ A@  @ @ AÀ    A   A@ ^          PSKAuthentication    PSK    EAPAuthentication    RADIUS    EAPandPSKAuthentication    RADIUS+PSK                     ¾  Ê        @ @ A@  @ @ A@   À@   A  ^          None        EAPAuthentication    SharedAuthentication    Shared                     Ö  ä        @ @ A@  @ @ AÀ   A @ A@  A   AÀ ^          AP    InfrastructureAccessPoint    WDS Repeater    Wireless Repeater    Client    WirelessStation 	   WDS Root    WirelessBridge                     ð      #   Á   A  @@   @  ÀÀ @   A  A@  À@@ C^ EA  \  ÆÂÁ Å  Ü   ÆÀÁa   ýÞ          0    dot11    firstVapNameGet     GetRateset    pairs 	   tonumber    rate                       -    )     A@À    ÁÀ     @À  Â  MÂ@    AA A@ ÃÞ FÁ@ ÃÞ ÁÁ  Õ BBA Â   A@ C^          string    find    sub       ð?	   tr69Glue    instanceMapLoad  	   _ROWID_=    db    getRowWhere 	   dot11VAP                     8  d    ;   
  C Å     ÜÀ@@@FÀÃ  F A CAAC   Â     A@ Ã   CBCB  A@ Ã   ÃB@  À   CC@   WC CC@ CÃ  á  @óÁÁ Þ         pairs    dot11Radio    dot11Radio.radioNo 	   _ROWID_=    db    getRowWhere     1    dot11    firstVapNameGet    radioNo    GetCountry    status    SetCountryCode            0                     p  #        @  AJ    ÆÂ ÂB  Â  AÀC  B  @ @Á@   ÀÁ@	BB  W@A@  IB  W@A@ ÀB@ IC  IBCC  W@A@  IÂ DÀCÄA Â À   WÀD@4Â  3 ÅBE  W@AÂ EÆÂÅ   W@A@  IF  W@A  ÀB@ IBÆÀÿF  W@AÂ ÂFÆÂÅ   W@A@  IG  W@AÂ BGÀ   W@A@  IÂ GÀÃÇA Â À   WÀD "Â  @! ÈÀ BH  W@AÂ HÆÂÈ   W@A@  II  W@A@B	 IÅ    W@A@  IÂI  W@A@Â JÅ    W@A@  IBJ  W@A@Â JÅ    W@A@  IÂJ  W@A@B	 KÅ    W@A@  IBK  W@A@B	 KÅ    W@A@  IÂK  W@A@B	 LÅ    W@A@  IBL  W@A@  IL  W@A@  IÂ ÂLÀÍA Â À   WÀD@ Â  !  ½A    5      pairs    query    ROWID=    db    getRowWhere        ð?	   dot11VAP    tmpVal    dot11VAP.vapEnabled    dot11VAP.defACLPolicy    1    Allow    Open    dot11VAP.uapsd    dot11    VAP_config    dot11VAP._ROWID_    edit    OK    dot11Radio    dot11Radio.configuredChannel    ChannelCheck    dot11Radio.interfaceName    dot11Radio.currentChannel    0    dot11Radio.opMode    OpModeCheck    dot11Radio.txPower    TxPowerCheck    radio_config    dot11Radio._ROWID_    dot11Profile    dot11Profile.ssid    ssidNameSyntaxCheck    dot11Profile.profileName    dot11Profile.security    dot11Tr    securityModeGet    dot11Profile.defWepkeyIdx    wepKeyIdxValCheck    dot11Profile.wepkeyPassphrase    wepKeyPassPhraseCheck    dot11Profile.pairwiseCiphers    encrModeGet    dot11Profile.authMethods    authMethodsGet    dot11Profile.wepAuth    wepAuthMethodGet    dot11Profile.broadcastSSID    dot11Profile.qosEnable    profile_config    dot11Profile._ROWID_                     /  ù      A   @  Ê    F@ Á@ Ã BA A @  ^AA @  ^AÂ  ÕE FBÂB À  \ À Á AÂ  ^EB FÃÁÂ \WÁFÄÀÂ@ @ @y ÀxEB FÃÁÂ \WÁ E FBÅÅ\  @ Â ÀtEB FÃÁ \WÁFBÆ À@ À Àq   @qEB FÃÁ \WÁÀE FÂÆÇ\ WÁ n m@GFBÇÇ@    ÀkÀ @kÀG@ ÀÇ@j H@  È@iEB FÃÁB \WÁ FÇWÈ@  @fAÂ ÉUBÅB	 ÆÉÃ Ü WÁÀc @cEB FÃÁÂ	 \WÁÀE FBÊÇ\ G
 E
 WÁ@  
  _ ^EB FÃÁ
 \WÁ@ FÇWÈÀÿE FËBË\ GÂ
 EÂ
 WÁÀYÀ
 @YEB FÃÁ \WÁÀ FÇÀËVE FÌBÌ\ WÁ U TEB FÃÁ \WÁÀ FÇÀËÀQE FÂÌÍ\ WÁ@P ÀOEB FÃÁB \WÁÀ FÇÍ ME FÌBÌ\ WÁK  KEB FÃÁÂ \WÁÀ FÇÍ@HE FÂÌÍ\ WÁÀF @FEB FÃÁ \WÁ@J  B ÅB	 ÆÎÅAÃ Ü@Å  Ü@W@N   AD B  E ÄÏ\ Bá  Àü   >EB FÃÁ \WÁ   <EB FÃÁB \WÁ 
CB ÅB	 ÆÐÃÐÜ @Á ÁÂ  ÞÅB	 ÆBÑ Ü Ç Å Á ÁÂ  ÞÅ  Ü@W@N   AD B  E Ñ\ Bá  Àü   0EB FÃÁÂ \WÁ   .EB FÃÁ \WÁ@ @ÒÀ+EB FÃÁ \WÁ@E FÂÒÂÐ\  (EB FÃÁ \WÁ@E FBÓ\  AB  Á À@$EB FÃÁÂ \WÁEB	 FÔ ÆBÔ\GÂ EÂ WÁ@ EB	 FÔÂ \  AB  Á ÀÀEB FÃÁÂ \WÁEB	 FÔ ÆBÔ\GÂ EÂ WÁÀEB	 FÕÂ \  @EB FÃÁB \WÁ EB	 FÐÂÐ\ Á Â Á  ÅB	 ÆÕ Ü     @EB FÃÁÂ \WÁ EB	 FÐÂÐ\ Á Â Á  ÅB	 ÆÖ Ü     @EB FÃÁB \WÁÀE FÖÂÖ\ WÁ 	 EB FÃÁ \WÁEB FÃÍÁB \WÁ@  À  EB FÃÁ \WÁ@ @ØÀEB FÃÁ \WÁ  ÀØ@  ^  d      0         param    field 	   tr69Glue    instanceMapLoad  	   _ROWID_=    db    getRowWhere    table    1    DB_ERROR_TRY_AGAIN    string    find    Status    vapEnabled    Up 	   Disabled    MaxBitRate    dot11Tr    maxOperationalRateGet    interfaceName     mbps    AutoChannelEnable    configuredChannel    BeaconType    beaconTypeGet 	   security    defACLPolicy    Open    opMode    defWepKeyIdx    WEPEncryptionLevel    WEP    wepkey    defWepkeyIdx    dot11    wepEncrAlgoFromKeyLengthGet    BasicEncryptionModes 
   basicEncr    basicEncrModeGet    BasicAuthenticationMode 
   basicAuth    basicAuthModeGet    wepAuth    WPAEncryptionModes    WPA    wpaEncrModeGet    pairwiseCiphers    WPAAuthenticationMode    wpaAuthModeGet    authMethods    IEEE11iEncryptionModes    WPA2    IEEE11iAuthenticationMode    PossibleChannels        GetChanList            pairs    ,  	   tostring    channel    BasicDataTransmitRates    OperationalDataTransmitRates    interfaceNameFromVapNameGet    vapName    rates    GetRateset    rate    PossibleDataTransmitRates    SSIDAdvertisementEnabled    broadcastSSID    TotalAssociations    numAssocDevicesGet    TransmitPowerSupported    getRadioTxPowerRange     dbm    TransmitPower    firstVapNameGet    radioNo    GetTxPower    RegulatoryDomain    GetCountry    TotalPSKFailures    GetHshakeFailCount    TotalIntegrityFailures    GetMicFailCount    DeviceOperationMode    deviceOpModeGet 
   dot11Mode    AuthenticationServiceMode    RADIUS    RadiusClient    None 
   WMMEnable 
   qosEnable    UAPSDEnable    uapsd                           
0   A   @  À      Ê   Á  AAA  Â   À  Á@ Á  Â A E   Á  BAÁ  Â   À  Á@ Á   @  L@Ã !   ÿÁ @                  
   vapName='    '    db    getRowWhere    dot11Interface     0    interfaceName    interfaceName='    getRowsWhere 	   dot11STA    pairs       ð?   value 	   tostring                     (  B    %   F @ @À   F@ À   AÃ AA A@ Á@  Þ  ÅÀ  ÆÀÁ  Ü Á@ A    @EB B\ @ @ FÂB^ !  ýA           configuredChannel    0    currentChannel    dot11    firstVapNameGet    radioNo     GetChanList    pairs 	   tostring    channel    maxregpower                     O  ¨    R  A   @  Ê    F@ Á@ Ã BA A @  ^AA @  ^AÂ  ÕE FBÂB À  \ À Á AÂ  ^AB ÃÁÂ UÂ BBÁ  B   À  Á Â Á  ÂDÆÅCÅB Á Â Á  ÂEÆÅ  Á Â Á  BFÀ WAÂ Å ÆÇ CGÌ GÌ ÃGÌ   ; BFÀ WA@Â Å ÆBÈ HÌ ÃHÌ IÌ CIÌ IÌ ÃIÌ JÌ CJÌ JÌ ÃJÌ KÌ CKÌ KÌ ÃKÌ LÌ CLÌ LÌ ÃLÌ MÌ CMÌ MÌ ÃMÌ NÌ CNÌ NÌ ÃNÌ OÌ COÌ OÌ ÃOÌ PÌ CPÌ PÌ ÃPÌ QÌ CQÌ QÌ ÃQÌ RÌ CRÌ   @ BFÀ WA@Â ÅB ÆÂÒ     BFÀ WA@Â ÅB ÆBÓ   À BFÀ WA Â Å ÆÂÓ TÌ   À BFÀC WA@Â Å ÆÔ    BFÀÃ WA@Â Å ÆÕ   @	 BFÀC WA@Â Å ÆÕ     BFÀÃ WA@Â Å ÆÕ   À BFÀ WA Â Å ÆÕ    À   Y      0         param    field 	   tr69Glue    instanceMapLoad  	   _ROWID_=    db    getRowWhere    table    1    DB_ERROR_TRY_AGAIN 
   vapName='    vapName    '    dot11Interface 	   staStats    dot11    GetStaStats    interfaceName    macAddress    stats    GetVapStats    string    find    ErrorsSent 	   tostring    is_tx_nonode    is_tx_badcipher    is_tx_nodefkey    is_tx_fferrcnt    ErrorsReceived    is_rx_badversion    is_rx_tooshort    is_rx_wrongbss 
   is_rx_dup    is_rx_wrongdir    is_rx_mcastecho    is_rx_notassoc    is_rx_noprivacy    is_rx_unencrypted    is_rx_wepfail    is_rx_decap    is_rx_mgtdiscard 
   is_rx_ctl    is_rx_nodealloc    is_rx_elem_missing    is_rx_elem_toobig    is_rx_elem_toosmall    is_rx_badchan    is_rx_auth_fail    is_rx_auth_countermeasures    is_rx_assoc_bss    is_rx_assoc_norate    is_rx_assoc_notauth    is_rx_assoc_capmismatch    is_rx_assoc_badwpaie    is_rx_decryptcrc    is_rx_ahdemo_mgt    is_rx_bad_auth    is_rx_unauth    is_rx_badkeyid    is_rx_ccmpreplay    is_rx_ccmpformat    is_rx_ccmpmic    is_rx_tkipreplay    is_rx_tkipformat    is_rx_tkipmic    is_rx_tkipicv    is_rx_badcipher    is_rx_nocipherctx 
   is_rx_acl    is_rx_badathtnl    UnicastPacketsSent    ns_tx_ucast    UnicastPacketsReceived    ns_rx_ucast    DiscardPacketsSent    is_tx_nobuf    is_tx_noheadroom    DiscardPacketsReceived    is_rx_nobuf    MulticastPacketsSent    is_tx_mcast    MulticastPacketsReceived    is_rx_mcast    BroadcastPacketsSent    BroadcastPacketsReceived                     µ  Û    t   A      Æ@@   EÁ  FÁÁA \Á Á Á A BÆÁÂ A ÁÁ  ÞÅA ÆÃ AÂ ÜÇ ÅA  Ü ÍÄÇ ÅÁ ÆÅB@ AB ÜWÁÀÅA ÆÅ  E  Ü  ÅÁ ÆÅB@ AÂ ÜWÁÀÅA ÆÅ  E  Ü  À
ÅÁ ÆÅB@ AB ÜWÁÀÅA ÆÅ  E Â Ü   ÅÁ ÆÅB@ A ÜWÁÀÅA ÆÅ  E Â Ü  @ÅÁ ÆÅB@ A ÜWÁÅA ÆÅ  E B Ü  Å   Ü  À   Þ        0    param            dot11Tr 
   vapRowGet    APWMMParameter     1    DB_ERROR_TRY_AGAIN    dot11    interfaceNameFromVapNameGet    vapName 	   instance 	   tr69Glue    instanceNumberGet       @   accessCategory 	   tonumber       ð?   string    find    AIFSN    WMMParamGet    ECWMin        @   ECWMax    TXOP       @
   AckPolicy       @	   tostring                     é      
L   E   @  Å  ÆÀÀ   Ü À \@ E  F@Á A ÁÀ \ Â @   Á@ @  ÁÀ   Ã Á@   A Õ@Á DAA Â  @   Â @  A A  AÁ  AEFA  Á Á EÁ  FAA  UF IA GÀ ÂÇ A Á Ç Á Á W@H@  Á A  ÁÁ Á    $      print    Tbl:     util    tableToStringRec    dot11Tr 
   vapRowGet    param    WEPKey     no vap    1    DB_ERROR_TRY_AGAIN    profileName    profileName='    '    db    getRowWhere    dot11Profile    no profile 	   instance 	   tr69Glue    instanceNumberGet       @	   tostring       ð?   dot11Profile.wepkey    value    result    errCode    dot11    profile_config    dot11Profile._ROWID_    edit    OK    config error    0                       D    q   A      Æ@@   EÁ  FÁÁA \Á Á Á AÂÅ ÆÁÂÃÜ Á Â A  ÂC@ B  EB  B  FÂD     BEFB@  WAÀ ÂE@ B À  @  À BEFB@  WAÀ BF@ B À  @   	 BEFB@  WAÀ ÂF@ B À  @  @ BEFB@  WAÀ BG@ B À  @   BEFB@  WAÀÿ ÂG@ @  ^           0    param            dot11Tr 
   vapRowGet    APWMMParameter     1    DB_ERROR_TRY_AGAIN    profileName    dot11    interfaceNameFromVapNameGet    vapName 	   instance 	   tr69Glue    instanceNumberGet       @   accessCategory 	   tonumber    value    string    find    AIFSN    SetAIFS    ECWMin 	   SetCWmin    ECWMax 	   SetCWmax    TXOP    SetTXOPLimit 
   AckPolicy    SetProfile                     O      V   E   @  \@ A  À  ÁÀ   FA AA Å ÆÁÁ A Ü@Â@   Â CAB   @B@ A ^ E  \ ÃCÀÄ@DÀ  DÀC a  üW@Â  	Ì@EÂ FÅ ÁB  \Â   @ W@Â ÀEÂ FÅ ÀÀ \  @EÂ FÅ À\ EB  FÂÅ \ W@Â÷E FÆÀ \B öAB ^         require 	   ifDevLib       ð?           param    value    dot11Tr    wirelessIfTblGet    LANHostConfigManagement     1    db 	   getTable 	   dot11ACL    pairs    ifnameLookup    vapName 
   ACLDelete    string    find    ,    sub    macAddrCheck    ACLAdd    0                       Â    V     A@À    Á@    @À  Â  MÂ@ À   AA A@ ÃÞ À A@ ÃÞ ÁÁ   Õ BBA Â   A@ C^ FÂB ÀC Õ CÁÂ  B   A@ ÃÞ Ê  Ã  E  \@  D@	ÆÄÂE WA	  ÉÆÄÂÄÅ ÆÅ	E AÅ ÅÂÁÅ ÜÄÃ@a  ÀùÞ         string    find    sub       ð?	   tr69Glue    instanceMapLoad  	   _ROWID_=    db    getRowWhere    bridgeTable    interfaceName    bridgeInterface='    '    getRowsWhere    bridgePorts    pairs    vap    ifname    vapName    getAttribute    dot11Interface                     Í  ×    	      @@À   Å     Ü  ÂÀ @   á   þÂ   Þ          dot11    interfaceNameFromVapNameGet    pairs    ifname                     â      9   A   @  Æ@ Á  A@A A@ AÁ ^ EA FÂÁ Â  \G E Á@ AÁ ^ AA   Å  Ü A  AÃCÃ Ã  C@ CÃÀCÀWÁ  A CÄU  FAÄá   ú À   Þ        0        param    dot11Tr    wirelessIfTblGet    LANHostConfigManagement     1    rows    db 	   getTable 	   dot11ACL    pairs    vapName    ifnameLookup    ,    macAddress                       '          Å      Ü    FÂÀ À Â @ÂÀ B B@ Â Á Â G Â á   ûÅÀ  Þ         pairs    dot11ACL.hostName    tr69_    vapName    _    dot11ACL.macAddress    dot11ACL.vapName    status    errMsg    dot11    ACL_config    -1    add                     2  8       J   @@ I   @AÀ   AÁ À ÇÀ      ÅÀ              ð?   _ROWID_    status    errMsg    dot11    ACL_config    -1    delete                     C  c    ;   E   F@À @ ÁÀ  \ Á  @ Á  ÀÁ Á    AA Õ@ ÁBA Â  @   Á  A A C I I ÁA D@ C   WÀD A A A E@ ÁÅ Á Á GA   W@F A A           dot11Tr 
   vapRowGet    param    PreSharedKey     1    DB_ERROR_TRY_AGAIN    profileName    profileName='    '    db    getRowWhere    dot11Profile    dot11Profile.pskPassHex    value    dot11Profile.pskPassAscii    status    dot11 
   SetPSKHex            result    errCode    profile_config    dot11Profile._ROWID_    edit    OK    0                     p      .   E   F@À @ ÁÀ  \ Á  @ Á  ÀÁ Á    AA Õ@ ÁBA Â  @   Á  A A C I A D@ ÁÄ Á Á G Á Á W@E A A           dot11Tr 
   vapRowGet    param    PreSharedKey     1    DB_ERROR_TRY_AGAIN    profileName    profileName='    '    db    getRowWhere    dot11Profile    dot11Profile.pskPassAscii    value    result    errCode    dot11    profile_config    dot11Profile._ROWID_    edit    OK    0                             