LuaQ                ¬     A@    À@@  A@ @   A @   AÀ @   A  @   A@ @   A @   AÀ  E    \   Á@  Å   Ü  Á  A 
  	Å	Å	Æ	Æ	Ç	Ç	È	È	É	É	Ê	Ê	ÁÊ	AKA Á Á  AB 	ÁL	AM	ÁM 	AN	N	ÁÎÁ Ç ÁB  AÃ  ÁC  AÄ  ÁD  AÅ  ÃF WRF WÀRÀF W S F W@S@F WS F ÀS@ Á   ÁE $              $F          Æ $           $Æ     F $             $F         Æ $          $Æ            F $          $F         Æ $             $Æ         F $          $F            Æ $          $Æ         F $             $F         Æ $             $Æ           F $             $F         Æ $             $Æ           F $             $F         Æ $             $Æ           F $             $F         Æ $             $Æ           F $             $F         Æ $             $Æ           F $	             $F	         Æ $	     $Æ	            F $
          $F
    Æ $
             $Æ
         F $          $F                     Æ $           $Æ         F  $                       $F                       
Æ  $             
                 ! $Æ                
F! $             
   ! $F       Æ! $           " $Æ      F" $ "         module $   com.teamf1.core.sslvpn.portallayout    package    seeall    require    teamf1lualib/db    teamf1lualib/util $   teamf1lualib/user-management_groups    teamf1lualib/validations    teamf1lualib/returnCodes     teamf1lualib/sslvpn_returnCodes #   com.teamf1.core.sslvpn.returnCodes    com.teamf1.core.returnCodes    com.teamf1.core.validations '   com.teamf1.core.user-management.groups    portallayoutTable    SSLVPNPortalLayout    loginProfileTable    LoginProfiles    portalLayoutName    PortalLayoutName    defaultPortal    DefaultPortal 
   siteTitle    PortalSiteTitle    bannerTitle    BannerTitle    bannerMessage    BannerMessage    portalBanner    DisplayBanner    HTTPMetaTags    EnableHTTPMetaTags    activeXWebCacheCleaner    EnableActiveXWebCacheCleaner 
   VPNTunnel    EnableVPNTunnel    portForwarding    EnablePortForwarding 	   useCount 	   UseCount 
   portalURL 
   PortalURL    profileName    loginProfileName    configurationName    _ROWID_    1    0    networkInterface    logicalIfname    LogicalIfName 
   interface    WAN1    ipAddr    ipaddr    accessMgmt    accessMgmtEnable    serviceType    port    SERVICE_REMOTE    SSLVPN    local    radius_pap    radius_chap    radius_mschap    radius_mschapv2    pop    ldap    active-directory 	   ntdomain    None    ext    PRODUCT_ID    DSR-1000AC_Ax    DSR-500AC_Ax    DSR-1000_Bx    DSR-500_Bx    DSR-1000_Ax    DSR-1000N_Ax       0@       @   portalLayoutNameGet    portalLayoutNameGetNext    portalLayoutNameSet    portalLayoutNameDelete    defaultPortalGet    defaultPortalGetNext    defaultPortalSet    siteTitleGet    siteTitleGetNext    siteTitleSet    bannerTitleGet    bannerTitleGetNext    bannerTitleSet    bannerMessageGet    bannerMessageGetNext    bannerMessageSet    isportalBannerEnabled    isportalBannerEnabledNext    portalBannerEnable    portalBannerDisable    isHTTPMetaTagsEnabled    isHTTPMetaTagsEnabledNext    HTTPMetaTagsEnable    HTTPMetaTagsDisable     isactiveXWebCacheCleanerEnabled $   isactiveXWebCacheCleanerEnabledNext    activeXWebCacheCleanerEnable    activeXWebCacheCleanerDisable    isVPNTunnelEnabled    isVPNTunnelEnabledNext    VPNTunnelEnable    VPNTunnelDisable    isportForwardingEnabled    isportForwardingEnabledNext    portForwardingEnable    portForwardingDisable    useCountGet    useCountGetNext    useCountSet    portalURLGet    portalURLGetNext    portalURLSet    profileNameGet    profileNameGetNext    profileNameSet 
   portalGet    portalGetCur    portalGetNext    portalGetAll 
   portalSet    portalCreate    portalDelete    portalDeleteAll    currentPortalInfoGet    sslDomainGetCur    sslDomainLocalGetAll    isSslVpnUser 9                     @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    portallayoutTable    getAttribute    portalLayoutName    NIL    FAILURE    SUCCESS                     ©   Â    =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute    portalLayoutName    FAILURE    SUCCESS                     Ò   î    8       @W  @  À    Ä   Æ ÀÀ     @  À   AÅ@  @   Ä   ÆÁÀ     @      @     @  À  ÀAÅ@  @   BÀ  Ä   ÆÁÀ À Ä   Æ@Â   Þ Ä   ÆÂ   Þ         NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    setAttribute    portalLayoutName    FAILURE    SUCCESS                     û              @À            NOT_SUPPORTED                                 @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    portallayoutTable    getAttribute    defaultPortal    NIL    FAILURE    SUCCESS                     ,  F   =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute    defaultPortal    FAILURE    SUCCESS                     V  z   	D       @W  @  À    Ä   Æ ÀÀ     @  À   AÅ@  @   Ä   ÆÁÀ     @      @     @  @  À   WÀAW B W@B Ä   ÆÀÞ  ÅÀ  ÆÂA D   Ä ÆÁÂ  Ü   A À   C@    AC@          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE               ð?       @   setAttribute    defaultPortal    FAILURE    SUCCESS                                 @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    portallayoutTable    getAttribute 
   siteTitle    NIL    FAILURE    SUCCESS                     ¥  ¿   =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute 
   siteTitle    FAILURE    SUCCESS                     Ï  ë   8       @W  @  À    Ä   Æ ÀÀ     @  À   AÅ@  @   Ä   ÆÁÀ     @      @     @  À  ÀAÅ@  @   BÀ  Ä   ÆÁÀ À Ä   Æ@Â   Þ Ä   ÆÂ   Þ         NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    setAttribute 
   siteTitle    FAILURE    SUCCESS                     ù            @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    portallayoutTable    getAttribute    bannerTitle    NIL    FAILURE    SUCCESS                       1   =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute    bannerTitle    FAILURE    SUCCESS                     A  ^   8       @W  @  À    Ä   Æ ÀÀ     @  À   AÅ@  @   Ä   ÆÁÀ     @      @     @  À  ÀAÅ@  @   BÀ  Ä   ÆÁÀ À Ä   Æ@Â   Þ Ä   ÆÂ   Þ         NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    setAttribute    bannerTitle    FAILURE    SUCCESS                     l  y          @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    portallayoutTable    getAttribute    bannerMessage    NIL    FAILURE    SUCCESS                       £   =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute    bannerMessage    FAILURE    SUCCESS                     ³  Ò   8       @W  @  À    Ä   Æ ÀÀ     @  À   AÅ@  @   Ä   ÆÁÀ     @      @     @  À  ÀAÅ@  @   BÀ  Ä   ÆÁÀ À Ä   Æ@Â   Þ Ä   ÆÂ   Þ         NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    setAttribute    bannerMessage    FAILURE    SUCCESS                     à  î          @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    portallayoutTable    getAttribute    portalBanner    NIL    FAILURE    SUCCESS                     þ     =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute    portalBanner    FAILURE    SUCCESS                     (  =   1   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ @ Ä     D FÂ\    A À    @BÀ       BÀ            NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    setAttribute    portalBanner    FAILURE    SUCCESS                     J  ^   1   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ @ Ä     D FÂ\    A À    @BÀ       BÀ            NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    setAttribute    portalBanner    FAILURE    SUCCESS                     l  y          @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    portallayoutTable    getAttribute    HTTPMetaTags    NIL    FAILURE    SUCCESS                       ¢   =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute    HTTPMetaTags    FAILURE    SUCCESS                     ²  Æ   1   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ @ Ä     D FÂ\    A À    @BÀ       BÀ            NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    setAttribute    HTTPMetaTags    FAILURE    SUCCESS                     Ó  ç   1   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ @ Ä     D FÂ\    A À    @BÀ       BÀ            NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    setAttribute    HTTPMetaTags    FAILURE    SUCCESS                     õ            @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    portallayoutTable    getAttribute    activeXWebCacheCleaner    NIL    FAILURE    SUCCESS                       ,   =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute    activeXWebCacheCleaner    FAILURE    SUCCESS                     @  T   1   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ @ Ä     D FÂ\    A À    @BÀ       BÀ            NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    setAttribute    activeXWebCacheCleaner    FAILURE    SUCCESS                     d  x   1   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ @ Ä     D FÂ\    A À    @BÀ       BÀ            NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    setAttribute    activeXWebCacheCleaner    FAILURE    SUCCESS                                 @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    portallayoutTable    getAttribute 
   VPNTunnel    NIL    FAILURE    SUCCESS                     ¢  »   =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute 
   VPNTunnel    FAILURE    SUCCESS                     Ë  ß   1   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ @ Ä     D FÂ\    A À    @BÀ       BÀ            NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    setAttribute 
   VPNTunnel    FAILURE    SUCCESS                     ì      1   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ @ Ä     D FÂ\    A À    @BÀ       BÀ            NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    setAttribute 
   VPNTunnel    FAILURE    SUCCESS                                 @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    portallayoutTable    getAttribute    portForwarding    NIL    FAILURE    SUCCESS                     *  C   =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute    portForwarding    FAILURE    SUCCESS                     S  g   1   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ @ Ä     D FÂ\    A À    @BÀ       BÀ            NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    setAttribute    portForwarding    FAILURE    SUCCESS                     t     1   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ @ Ä     D FÂ\    A À    @BÀ       BÀ            NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    setAttribute    portForwarding    FAILURE    SUCCESS                       ¥          @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    portallayoutTable    getAttribute 	   useCount    NIL    FAILURE    SUCCESS                     µ  Ï   =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute 	   useCount    FAILURE    SUCCESS                     ß  ä          @À            NOT_SUPPORTED                     ò             @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    portallayoutTable    getAttribute 
   portalURL    NIL    FAILURE    SUCCESS                       *   =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute 
   portalURL    FAILURE    SUCCESS                     :  ?          @À            NOT_SUPPORTED                     M  [          @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    portallayoutTable    getAttribute    profileName    NIL    FAILURE    SUCCESS                     k     =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute    profileName    FAILURE    SUCCESS                       ³   8       @W  @  À    Ä   Æ ÀÀ     @  À   AÅ@  @   Ä   ÆÁÀ     @      @     @  À  ÀAÅ@  @   BÀ  Ä   ÆÁÀ À Ä   Æ@Â   Þ Ä   ÆÂ   Þ         NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    setAttribute    profileName    FAILURE    SUCCESS                     Î  ÿ          @@ D     Ä  @D  @   D FÀÀ ^  E   F Á   Å@ \   AÅ@  @  Ä  ÆÀÁÀ  Ä  Æ ÂÞ  Ã D AD B	Æ D AD ÄB	D AD C	FD AD DC	D AD C	ÆD AD ÄC	D AD D	FD AD DD	D AD D	ÆD AD ÄD	FD AD E	D AD DE	D AD E	Æ ÄE@ À  @ À  @ À  @          db    getAttribute    accessMgmt !   SSLVPN_REMOTEMANAGEMENT_DISABLED    getNextRowId    portallayoutTable    getRow    NIL    FAILURE    .    portalLayoutName    defaultPortal 
   siteTitle    bannerTitle    bannerMessage    portalBanner    HTTPMetaTags    activeXWebCacheCleaner 
   VPNTunnel 	   useCount 
   portalURL    portForwarding    profileName    SUCCESS                       ,   n   E   F@À   Ä      \   À@     A    Å  D D FÁÕCÀ Å  D D FÄÁÕCÆÀ Å  D D FÂÕCÁ Å  D D FDÂÕCFÁ Å  D D FÂÕCÁ Å  D D FÄÂÕCÆÁ Å  D D FÃÕCÂ Å  D D FDÃÕCFÂ Å  D D FÃÕCÂ Å  D D FÄÃÕCÆÂ Å  D D FÄÕCÃ Å  D D FDÄÕCFÃ Å  D D FÄÕCÃ Ä ÆÃÄ   @ À  @ À  @ À  @ Þ         db    getRow    portallayoutTable    NIL    FAILURE    .    portalLayoutName    defaultPortal 
   siteTitle    bannerTitle    bannerMessage    portalBanner    HTTPMetaTags    activeXWebCacheCleaner 
   VPNTunnel    portForwarding 	   useCount 
   portalURL    profileName    SUCCESS                     H        D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  Ä   Æ ÀÀ  Ä   ÆÂÞ  Ã D AÄ  C	Æ D AÄ  DC	D AÄ  C	FD AÄ  ÄC	D AÄ  D	ÆD AÄ  DD	D AÄ  D	FD AÄ  ÄD	D AÄ  E	ÆD AÄ  DE	D AÄ  E	FD AÄ  ÄE	D AÄ  F	Æ  DF@ À  @ À  @ À  @          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    getNextRowId 
   NOT_EXIST    getRow    FAILURE    .    portalLayoutName    defaultPortal 
   siteTitle    bannerTitle    bannerMessage    portalBanner    HTTPMetaTags    activeXWebCacheCleaner 
   VPNTunnel    portForwarding 	   useCount 
   portalURL    profileName    SUCCESS                       ¿          @@ D     Ä  @C        FÀ@@   F A   @@Ä    D AAÊ     AEÁ   À   @ÀE  FBÂ ÁÂ  \ B WÃÆÂÃW Ä ÆÂÃ@Ä  ÄC  B Å  ÆÂÄ AC  Á UÃÜÃ WÃFÆC  C ÀE FÃÃ@Ä@ E  FÃÄ ÁC   A ÕC\ÀFÆC  C AÃ  Á   AD ÄG	UC ÁC ÄG@  ÆÄÆÇ	ÁÄ   A  ÁE ÆG	Å ÆDÈ	  A Å Ü 	 	ÁÄ   A  ÁE   U	ÆÄÉD!  @ç	    ÁI   @  (      db    getAttribute    accessMgmt !   SSLVPN_REMOTEMANAGEMENT_DISABLED    SUCCESS    port 	   getTable    portallayoutTable    pairs    getRow    WanMode    _ROWID_    1    WAN1     WanMode.Wanmode    0    2    WanMode.DedicatedLogicalIfName    getRowWhere    ipAddressTable    LogicalIfName='    ' and addressFamily=2    0.0.0.0    ipAddressTable.ipAddress        WAN2 	   https://    : 	   /portal/    PortalLayoutName       @@   string    sub       ð?      0@   ... 
   PortalURL    NIL    FAILURE                     Ü  ¼   â    @W C  À   Ä  ÆÀÀ   @ Ã  AÅC  @   Ä  ÆÁÀ  ÃA   Ä  ÆÀÀ  Ä  ÆÀÞ ÅC  DFDÂÕCCÄ  ÆÀÀ Ä  ÆÀÞ ÅC    Ü WÂWÀÂ W Ã   @ D A DC	   @W @D A C	Ã   @W @D A ÄC	  @W @D A D	C  @    @  D@  D D D  FÄÄW@   @ D A E	  @    @  D@ D D D  FÄÄW@   @ D A DE	Ã  @    @  D@  D D D  FÄÄW@   @ D A E	  @    @  D@ D D D  FÄÄW@   @ D A ÄE	C  @    @  D@  D D D  FÄÄW@   @ D A F	  @W ÀÄ  DFE ÄF	Á  AE D	Â   E  @ D  FÀ^ ED  ÄÆÇ	UÄÃ   @ Ä  ÄGED  À   D  FÀ@À D  FÈ  ^D  FÀ@ D  FÀ^ D@D  FÀ@ D  FÀ^ D@@.D  FDÈ	Å  A
D FÈ
EBÀ     
Å  ÅH
D FÈ
EBÀ  IFIW@
 EÅ  FÉ
 HÄ ÆÉÆEÉ  
DFFÂ\  
D  À D  FÈ
  ^D@D  DÈ
ÀD  FÁ
 W @   ÆDH
Z   W ÀÅ  ÅH
D FÈ
 IEIÀFBDW@
	C
Å  ÅHÅE FB@ 
ÆI@   @
À   HÀ  E  À
 ÅBÅÅ  ÆÉF DFFÂ 
ÄÆÆÉ  Ü ÚE  À   H@  EÅ  FÉ
 HÄ ÆÉÆEÉ DFFÂ \  
D  À D  FÈ
  ^Å  ÅH
EE EBÀ ÆID  FÀ
@
À D  FÈ
  ^Ú  À EE   
\ ÅÂ
  À EE   
\ ÅÂ
ÚD  @    EÅ  FÉ
E ÄÆEÂ  DFÆÉ 
\  
D  À D  FÈ
  ^D  FÄÄ  ^  (      NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    SSLVPN_COOKIE_INVALID    .    portalLayoutName               ð?       @   defaultPortal 
   siteTitle    bannerTitle    bannerMessage    valid 
   isBoolean    SUCCESS    portalBanner    HTTPMetaTags    activeXWebCacheCleaner 
   VPNTunnel    portForwarding    getRowWhere    loginProfileTable    loginProfileName    ='    '    profileName    update    FAILURE    TRUE    sslVpnTable    getAttribute 
   attribute    domain    setAttribute 	   useCount                     Ù  ª	   Ê  E  FCÀ  Ä  ÆÃÀ   \  AW D FCÁ^ J   A   ÃA    B   ÁC   Ä@I  A   ÃA  À  WÀBW C W@C Ä ÆÃÁÞ Å  D D  FÃÕCICÄ ÆÁWÀ@Å  D D  FÄÃÕCIÄ ÆÁWÀ@Å  D D  FÄÕCIÃÄ ÆÁWÀ@Å  D D  FDÄÕCIÄ ÆÁÀ Ä ÆÃÁÞ Ä ÆÃÄ Ü Ç Å  EW  Ä ÆÃÁÞ Å  D D  FDÅÕCICÄ ÆÁÀ Ä ÆÃÁÞ Ä ÆÃÄ  Ü Ç Å  EW  Ä ÆÃÁÞ Å  D D  FÅÕCIÄ ÆÁÀ Ä ÆÃÁÞ Ä ÆÃÄ Ü Ç Å  EW  Ä ÆÃÁÞ Å  D D  FÄÅÕCIÃÄ ÆÁÀ Ä ÆÃÁÞ Ä ÆÃÄ  Ü Ç Å  EW  Ä ÆÃÁÞ Å  D D  FÆÕCIÄ ÆÁÀ Ä ÆÃÁÞ Ä ÆÃÄ Ü Ç Å  EW  Ä ÆÃÁÞ Å  D D  FDÆÕCICÄ ÆÁWÀÀÅ  ÆÆÄ D  FÇD À  U  Ü     ÄA   AD   ÄG	I Ä ÆÃÁÞ Å  ÆÈD  FDÈ  H	Ä  ÆÄÈ	Ü  AD   I	AD	 Á	    UIC  ÄIE   W JT  @	 D FDÊ^ E  FÊ  À\ A	  ÄJ	  A	  ÄA	  A	  ÄA	 ÀW@  H	Ä ÆË	 EK
K
@   Å@ÄWÀ	ÀÅ  ÆÈ	  D  FÅÀ
 	Ä  ÆÅËÜ A
 	  ÅJ
  @	 ÍC
  L
E    Å@À 	  ÆK@	 @ 
ZD    ÅJ
 Å  ÆÌ	 K
D FEË
FË
 Ä  ÆÅÀ   Ü @	ZD   Ä ÆÄÊ	Þ Å  ÆÈ	  D  FÅÀ
  Ä  ÆÅËÜ A
 	  ÅJ
  @	 ÌC
  L
E    Å@À    ÆK@	 @ 
ZD    ÅJ
    ÁD 	 L	À  @  Ä  E
W 	Å M
AE  	U
E    H	Å    Å@
@   Ä ÆÅ	  	Þ  6      db 
   existsRow    portallayoutTable    portalLayoutName    FALSE    PORTAL_ALREADY_EXIST    NIL    INVALID_ARGUMENT    NONE_NOT_ALLOWED    . 	   tonumber               ð?       @   defaultPortal 
   siteTitle    bannerTitle    bannerMessage    valid 
   isBoolean    SUCCESS    portalBanner    HTTPMetaTags    activeXWebCacheCleaner 
   VPNTunnel    portForwarding    getRowWhere    loginProfileTable    loginProfileName    ='    '    profileName    getAttribute    logicalIfname 
   interface    ipAddr 
   portalURL 	   https:// 	   /portal/ 	   getTable     MAX_LIMIT_REACHED    insert    FAILURE    sslVpnTable 
   attribute    domain 	   useCount    setAttribute         sslVpnPolicyCreate    util    appendDebugOut "   Error in configuring sslVpnTable                      ·	  ã	   {   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  C  À  ÀAÅ@  @   Å@  D FAÂÕ@ÆÀ Á  ADFÂ ABÀ    Á  ÁADFÂ ABÀ DFÂ Ä UÁFABÁ ÂBCÄ WÀ ÅÁ  ÆAÃBD Ü @ ÅÁ  ÆÃBD Ä ÆBÂÜ @ Ä  ÆÀÀ À Ä  ÆÁÃ   ÞÁ  ACEA  À   @    @  À   ÁC@    D@          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    portallayoutTable    FALSE    getRow    .    portalLayoutName    sslVpnTable 
   attribute 	   authType 
   deleteRow    setAttribute    FAILURE    SUCCESS                     æ	  
    l   
   E   F@À   Â   \À  À   ÀÆA ÆÁW@ÁÀÅ  ÆÁ  D  B AÜ   AÂ  BE  FBÂ BÄ ÆÂ  \ Z  ÀE  FÁ BÄ ÆÂ  \  BÁÂ   Ä ÆÂÃ D FÃÂFÃÕBÆÂW    CCD FÂ  À       CD FÂ  À  BD     ÃC   D E  FBÃ  Ä  C A\   @   DFÄ^ ¡  @è @D          db 	   getTable    portallayoutTable    pairs    _ROWID_    1    getRow    .    portalLayoutName 
   existsRow    sslVpnTable 
   attribute 	   authType 
   deleteRow    setAttribute    NIL    FAILURE    SUCCESS                     
  
   !   E   F@À   Ä   ÆÀÀ   \    A    @A     A   ÁA    A   BÆ   AB@    
      db    getRow    portallayoutTable    portalLayoutName    NIL    FAILURE    . 
   VPNTunnel    portForwarding    SUCCESS                     
  +
   8   E   F@À   Ä      D FÁÀ\   A    @A     ADFÁÁ Á@À    À  BDFÁÁ Á@À  DFÁÁA ÄÆÂÆÁÂUÁ@DFÁÁA ÄÆÂÆÃUÁÆ@ AC@          db    getAttribute    portallayoutTable    portalLayoutName    NIL    FAILURE 
   existsRow    sslVpnTable    getRow    . 
   attribute 	   authType    domain    SUCCESS                     -
  <
    %   J      @@Ä   ÆÀ @   Ä  ÆÀÀÞ  Á  A @ @E   @ÁÂ   BCB\ Z  @ I Ì Á!  Àû B@         db 	   getTable    groupsTable    FAILURE       ð?   pairs    isSslVpnUser    . 
   attribute    capabilities    SUCCESS                     >
  G
       J      @@À     @  À  À   À  A@ Â Þ ¡  @þ             util    split    ,    pairs    0                             