LuaQ                i     A@    À@@  A@ @   A @   AÀ @   A  @   A@ @   A @   AÀ @   A   E  @ \   Á  Á  ÇÀ Á Ç@ Á  ÇÀ Ê   ÉÅÉ ÆÉÆÉ ÇÉÇÉ ÈÉÈÉ ÉÉÉÉ ÊÉÊÉ ËÉËÉ ÌÉÌÉ ÍÉÍÉ ÎÉÎÉ ÏA A ¤            Á ¤A           ¤     A ¤Á      ¤           Á ¤A          ¤    A ¤Á            ¤         Á ¤A     ¤           A ¤Á          ¤    Á ¤A            ¤         A ¤Á     ¤           Á ¤A          ¤    A ¤Á            ¤         Á ¤A     ¤           A ¤Á          ¤    Á ¤A            ¤         A ¤Á     ¤           Á ¤A          ¤    A ¤Á            ¤         Á ¤A     ¤           A ¤Á          ¤	    Á ¤A	            ¤	         A ¤Á	     ¤
           Á ¤A
          ¤
    A ¤Á
            ¤         Á ¤A     ¤           A ¤Á          ¤    Á ¤A            ¤         A ¤Á     ¤           Á ¤A          ¤    A ¤Á            ¤             Á ¤A     ¤    A ¤Á     ¤        Á ¤A  ¤             A ¤Á     ¤          Á         module $   com.teamf1.core.sslvpn.currentusers    package    seeall    require    teamf1lualib/db    teamf1lualib/util    teamf1lualib/validations    teamf1lualib/returnCodes     teamf1lualib/sslvpn_returnCodes    teamf1lualib/sslAdmin    sslvpnLuaLib #   com.teamf1.core.sslvpn.returnCodes    com.teamf1.core.returnCodes    com.teamf1.core.validations    currentusersTable    SSLVPNActiveUsers    groupsTable    UserGroups    usersTable    Users 	   userName 	   UserName 
   sessionId 
   SessionID    cookie    Cookie 
   groupName 
   GroupName    groupId    GroupId 
   loginTime 
   LoginTime    loginAddress    LoginAddress    lastAccessTime    LastAccessTime    pppInterfaceName    PPPInterface    pppInterfaceIP    PPPInterfaceIP    peerPPPInterfaceIP    PeerPPPInterfaceIP    sessionStatus    SessionStatus 
   txPackets 
   TxPackets    txPacketsDropped    TxPacketsDropped    txBytes    TxBytes 
   rxPackets 
   RxPackets    rxPacketsDropped    RxPacketsDropped    rxBytes    RxBytes    refererValue    RefererValue 	   password 	   Password    _ROWID_    0    userNameGet    userNameGetNext    userNameSet    userNameDelete    sessionIdGet    sessionIdGetNext    sessionIdSet 
   cookieGet    cookieGetNext 
   cookieSet    groupNameGet    groupNameGetNext    groupNameSet    loginTimeGet    loginTimeGetNext    loginTimeSet    loginAddressGet    loginAddressGetNext    loginAddressSet    lastAccessTimeGet    lastAccessTimeGetNext    lastAccessTimeSet    pppInterfaceNameGet    pppInterfaceNameGetNext    pppInterfaceNameSet    pppInterfaceIPGet    pppInterfaceIPGetNext    pppInterfaceIPSet    peerPPPInterfaceIPGet    peerPPPInterfaceIPGetNext    peerPPPInterfaceIPSet    sessionStatusGet    sessionStatusGetNext    sessionStatusSet    txPacketsGet    txPacketsGetNext    txPacketsSet    txPacketsDroppedGet    txPacketsDroppedGetNext    txPacketsDroppedSet    txBytesGet    txBytesGetNext    txBytesSet    rxPacketsGet    rxPacketsGetNext    rxPacketsSet    rxPacketsDroppedGet    rxPacketsDroppedGetNext    rxPacketsDroppedSet    rxBytesGet    rxBytesGetNext    rxBytesSet    refererValueGet    refererValueGetNext    refererValueSet    userGet    userGetNext    userSet    userCreate    userDelete    usersGetAll    tunnelStatusGet    connectionStateSet    isSessionTimedOut    changePassword A       f   s           @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    currentusersTable    getAttribute 	   userName    NIL    FAILURE    SUCCESS                            =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    currentusersTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute 	   userName    FAILURE    SUCCESS                     ­   ²           @À            NOT_SUPPORTED                     ¿   Ä           @À            NOT_SUPPORTED                     Ò   ß           @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    currentusersTable    getAttribute 
   sessionId    NIL    FAILURE    SUCCESS                     ï   	   =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    currentusersTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute 
   sessionId    FAILURE    SUCCESS                                 @À            NOT_SUPPORTED                     *  7          @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    currentusersTable    getAttribute    cookie    NIL    FAILURE    SUCCESS                     G  a   =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    currentusersTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute    cookie    FAILURE    SUCCESS                     q  t          @À           NOT_SUPPORTED                                 @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    currentusersTable    getAttribute 
   groupName    NIL    FAILURE    SUCCESS                       ¹   =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    currentusersTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute 
   groupName    FAILURE    SUCCESS                     É  Ë          @À            NOT_SUPPORTED                     Ù  æ          @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    currentusersTable    getAttribute 
   loginTime    NIL    FAILURE    SUCCESS                     ö     =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    currentusersTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute 
   loginTime    FAILURE    SUCCESS                        "          @À            NOT_SUPPORTED                     0  =          @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    currentusersTable    getAttribute    loginAddress    NIL    FAILURE    SUCCESS                     M  g   =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    currentusersTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute    loginAddress    FAILURE    SUCCESS                     w  y          @À            NOT_SUPPORTED                                 @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    currentusersTable    getAttribute    lastAccessTime    NIL    FAILURE    SUCCESS                     ¤  ¿   =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    currentusersTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute    lastAccessTime    FAILURE    SUCCESS                     Ï  Ñ          @À            NOT_SUPPORTED                     ß  ì          @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    currentusersTable    getAttribute    pppInterfaceName    NIL    FAILURE    SUCCESS                     ü     =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    currentusersTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute    pppInterfaceName    FAILURE    SUCCESS                     &  (          @À            NOT_SUPPORTED                     6  C          @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    currentusersTable    getAttribute    pppInterfaceIP    NIL    FAILURE    SUCCESS                     S  m   =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    currentusersTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute    pppInterfaceIP    FAILURE    SUCCESS                     }            @À            NOT_SUPPORTED                                 @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    currentusersTable    getAttribute    peerPPPInterfaceIP    NIL    FAILURE    SUCCESS                     ª  Ã   =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    currentusersTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute    peerPPPInterfaceIP    FAILURE    SUCCESS                     Ó  Õ          @À            NOT_SUPPORTED                     ã  ð          @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÁ        	      db    getNextRowId    currentusersTable    getAttribute    sessionStatus    NIL    FAILURE    SUCCESS       ð?                          =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    currentusersTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute    sessionStatus    FAILURE    SUCCESS                     *  .          @À            NOT_SUPPORTED                     <  I          @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    currentusersTable    getAttribute 
   txPackets    NIL    FAILURE    SUCCESS                     Y  r   =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    currentusersTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute 
   txPackets    FAILURE    SUCCESS                                 @À            NOT_SUPPORTED                                 @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    currentusersTable    getAttribute    txPacketsDropped    NIL    FAILURE    SUCCESS                     ¯  É   =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    currentusersTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute    txPacketsDropped    FAILURE    SUCCESS                     Ù  Û          @À            NOT_SUPPORTED                     é  ö          @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    currentusersTable    getAttribute    txBytes    NIL    FAILURE    SUCCESS                           =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    currentusersTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute    txBytes    FAILURE    SUCCESS                     0  2          @À            NOT_SUPPORTED                     @  M          @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    currentusersTable    getAttribute 
   rxPackets    NIL    FAILURE    SUCCESS                     ]  w   =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    currentusersTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute 
   rxPackets    FAILURE    SUCCESS                                 @À            NOT_SUPPORTED                       ¤          @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    currentusersTable    getAttribute    rxPacketsDropped    NIL    FAILURE    SUCCESS                     ´  Î   =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    currentusersTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute    rxPacketsDropped    FAILURE    SUCCESS                     Þ  à          @À            NOT_SUPPORTED                     î  û          @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    currentusersTable    getAttribute    rxBytes    NIL    FAILURE    SUCCESS                       %   =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    currentusersTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute    rxBytes    FAILURE    SUCCESS                     5  8          @À            NOT_SUPPORTED                     F  S          @@ D     E   FÀÀ   Ä     D FÁ\ @A   A   ÀAÀ               db    getNextRowId    currentusersTable    getAttribute    refererValue    NIL    FAILURE    SUCCESS                     c  }   =   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D   FÀ ^  EÀ  FÀÁ    Å@ \    @      B  À  @BÅ@  @  BÄ   Æ ÀÀ À Ä   ÆÀÂ  Þ Ä   Æ Ã  @ Þ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    currentusersTable    FALSE    getNextRowId 
   NOT_EXIST    getAttribute    refererValue    FAILURE    SUCCESS                                 @À            NOT_SUPPORTED                     ¯  è    (      @@ D     E   FÀÀ   Ä     \    A    @A   	  A ÅA
    A B
Æ    A EB
   A B
F   A ÅB
   A C
Æ   A EC
   A C
F   A ÅC
   A D
Æ   A ED
   A D
F   A ÅD
   A E
Æ   A EE
   A E
F   A ÅE
   A F
Æ  EF
@   À  @ À  @ À  @ À 	 @		 	À		
        db    getNextRowId    currentusersTable    getRow    NIL    FAILURE    . 	   userName 
   sessionId    cookie 
   groupName 
   loginTime    loginAddress    lastAccessTime    pppInterfaceName    pppInterfaceIP    peerPPPInterfaceIP    sessionStatus 
   txPackets    txPacketsDropped    txBytes 
   rxPackets    rxPacketsDropped    rxBytes    refererValue    SUCCESS                     
  N   )¸   D   F À W@  E@     \     @  D   FÀ ^  EÀ  F Á @ Ä     \    A  D  FÀÁ ^  EÀ  F Â    Å@ \    @    @B  À  BÅ@  @  Ä   Æ ÀÀ  Ä   ÆÀÂÞ  Ã  
EE  ÄÆEÃUÅ
Æ@EE  ÄÆÃUÅ
AEE  ÄÆÅÃUÅ
FAEE  ÄÆÄUÅ
AEE  ÄÆEÄUÅ
ÆAEE  ÄÆÄUÅ
BEE  ÄÆÅÄUÅ
FBEE  ÄÆÅUÅ
BEE  ÄÆEÅUÅ
ÆBEE  ÄÆÅUÅ
CEE  ÄÆÅÅUÅ
FCEE  ÄÆÆUÅ
CEE  ÄÆEÆUÅ
ÆCEE  ÄÆÆUÅ
DEE  ÄÆÅÆUÅ
FDEE  ÄÆÇUÅ
DEE  ÄÆEÇUÅ
ÆDEE  ÄÆÇUÅ
ED  FÅÇ
 À  @ À  @ À  @ À 	 @		 	À		 
 
^
         NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    currentusersTable    FALSE    SSLVPN_COOKIE_INVALID    getNextRowId    SSLVPN_NEXTCOOKIE_INVALID    getRow    FAILURE    . 	   userName 
   sessionId    cookie 
   groupName 
   loginTime    loginAddress    lastAccessTime    pppInterfaceName    pppInterfaceIP    peerPPPInterfaceIP    sessionStatus 
   txPackets    txPacketsDropped    txBytes 
   rxPackets    rxPacketsDropped    rxBytes    refererValue    SUCCESS                     m  t      Ä  ÆÀ	 Þ        NOT_SUPPORTED                               @	         NOT_SUPPORTED                     ¥  ¨      D   F À    ^         NOT_SUPPORTED                     ¶  Á          @@ E     D   FÀÀ @   D  F Á ^  D   F@Á    ^         db 	   getTable    currentusersTable    NIL    SSLVPN_CLINET_TABLENIL    SUCCESS                     Å  Ì           @@  @  A  ^  @ AÀ  ^          sslvpnLuaLib    sslTunnelStatsGet               ð¿                    Î  æ   X   B       @W  @  À    Ä   Æ ÀÀ     @  À   AÅ@  @   Ä   ÆÁÀ     @  À  ÀAÅ@  @   Ä   Æ ÀWÀ  	Ä  Æ ÂA EA  Ä ÆÂUÁFAÁ Ä ÆÃB EB  Ä ÆÃUÂFBB Õ ÁCEA  Ä ÆÃUÁFA EÁ  FÄA À\@  Ä Æ@ÄÞ  Z   À Ä   ÆÄÞ   Ä   ÆÀÄÞ          NIL 	   tonumber    INVALID_ARGUMENT    db 
   existsRow    currentusersTable    FALSE    getRow    loginAddress     = '    .    ' And     cookie    '    sslvpnLuaLib 
   sslLogout    deleteRowWhere    USER_DISCONNECT_FAILED    SUCCESS    FAILURE                     ê  ò      Å   Æ@À  @  ÜÚ   @ À      Ä   Æ@Á  Þ         db    existsRowWhere    loginSession 	   NextPage    index    SUCCESS                     õ     W   D  FÀW@  EA  FÀ  \   EA  FÁÀ Ä ÆAÁ   D FÁ\  @  ÁA A  Á@Å  BA@   BÄ  ÆÀÀ Ä ÆAÂÞ ÅA  ÆÁÀ D FÂ Ä ÆÂÂÜ  @   C  AAB Á  ÃBAC ÁÃ ÂEB  FÄB À  D@\  ÂD   E   BE         NIL    db    escape    getAttribute    currentusersTable    cookie 	   userName    USER_NOT_EXIST 
   groupName    GROUP_NOT_EXIST    groupsTable    groupId    GROUPID_MISSING    ='    ' AND     '    setAttributeWhere    usersTable 	   password    FALSE    FAILURE    SUCCESS                             