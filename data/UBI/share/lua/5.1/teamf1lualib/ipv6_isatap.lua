LuaQ                	ͺ      A@    ΐ@@  A@ @   A @   Aΐ @   A  @   A@ @   A @   Aΐ @   A   E  @ \   Α  Ε  Α ά  A  A GA A GΑ J  IΕIΖIΖIΗIAΗIΑGIAHIΑHIAIΑ	 	 A
 
 
 ΑΑ
 $         $B        B $            $Β           Β $        $B       B $           $Β     Β $        $B       B $           $Β          Β $        $B       B $           $Β       Β $        $B       B $                        $Β                       Β $            $B     B $        C      module    com.teamf1.core.ipv6.isatap    package    seeall    require    teamf1lualib/db    teamf1lualib/util    teamf1lualib/validations    teamf1lualib/returnCodes    teamf1lualib/ipv6_mode     teamf1lualib/returnCodes_isatap #   teamf1lualib/returnCodes_ipv6_nimf    com.teamf1.core.returnCodes    com.teamf1.core.validations    com.teamf1.core.ipv6.mode (   com.teamf1.core.ipv6.isatap.returnCodes &   com.teamf1.core.ipv6.nimf.returnCodes    isatapTable    isatapTunnel    ifStaticTable 	   ifStatic    feature    isatapTunnelStatus    prefix    isatapPrefix    useLanAsEndpoint    useLanAddress    endPointAddress    localIPv4Address    transportIfName 	   ipv6Mode    netWorkMode    logicalIfName    LogicalIfName    addrFamily    AddressFamily    ipAddr 	   StaticIp    STATUS_ENABLE       π?   STATUS_DISABLE                @   LAN    isfeatureEnabled    isfeatureEnabledNext    featureEnable    featureDisable 
   prefixGet    prefixGetNext 
   prefixSet    prefixDelete    isuseLanAsEndpointEnabled    isuseLanAsEndpointEnabledNext    useLanAsEndpointEnable    useLanAsEndpointDisable    endPointAddressGet    endPointAddressGetNext    endPointAddressSet 
   tunnelGet    tunnelGetNext    tunnelGetCur 
   tunnelSet    tunnelCreate    tunnelDelete    isatapTunnelsGetAll    isatapTunnelsDeleteAll        X   p     +      @@ A  ΐ  D   F Α @   D   F@Α ^  E    \     A  D   FΐΑ ^  E   F Β ΐ  Α@    D FΒ\    A     @A     ΐBΐ               db    getNextRowId            isatapTable    NIL    FAILURE 	   tonumber    INVALID_ARGUMENT    getAttribute    _ROWID_    feature    SUCCESS                            3   D   F ΐ W@  E@     \     @  D   Fΐ ^  C  ΐ   Aΐ   A @      @ ΐ    Aΐ    ΐ  ΐAΕ@  @  ABΔ   Ζ ΐΐ ΐ Δ   ΖΒ  ή Δ   ΖΐΒ  @ ή          NIL 	   tonumber    INVALID_ARGUMENT    db    getNextRowId    isatapTable    TABLE_IS_FULL    getAttribute    _ROWID_    feature    FAILURE    SUCCESS                     ©   Δ    
1   D   F ΐ \  A  @ W@  Α@  AW  A  @   D FΑ@  AA  @  AEΑ FΒA ΐ  BEΒ \ΑΔ ΖΓΐΐ Δ ΖAΓ   ήΔ ΖΓ   ή        ipv6ModeGet 	   tonumber       @   NOT_SUPPORTED    NIL    INVALID_ARGUMENT    _ROWID_ =     db    setAttributeWhere    isatapTable    feature    STATUS_ENABLE    FALSE    FAILURE    SUCCESS                     Π   κ    
1   D   F ΐ \  A  @ W@  Α@  AW  A  @   D FΑ@  AA  @  AEΑ FΒA ΐ  BEΒ \ΑΔ ΖΓΐΐ Δ ΖAΓ   ήΔ ΖΓ   ή        ipv6ModeGet 	   tonumber       @   NOT_SUPPORTED    NIL    INVALID_ARGUMENT    _ROWID_ =     db    setAttributeWhere    isatapTable    feature    STATUS_DISABLE    FALSE    FAILURE    SUCCESS                     ψ       +      @@ A  ΐ  D   F Α @   D   F@Α ^  E    \     A  D   FΐΑ ^  E   F Β ΐ  Α@    D FΒ\    A     ΐB      Cΐ               db    getNextRowId            isatapTable    NIL    EMPTY_TABLE 	   tonumber    INVALID_ARGUMENT    getAttribute    _ROWID_    prefix    FAILURE    SUCCESS                       9   3   D   F ΐ W@  E@     \     @  D   Fΐ ^  C  ΐ   Aΐ   A @      @ ΐ    Aΐ    ΐ  ΐAΕ@  @  ABΔ   Ζ ΐΐ ΐ Δ   ΖΒ  ή Δ   ΖΐΒ  @ ή          NIL 	   tonumber    INVALID_ARGUMENT    db    getNextRowId    isatapTable    TABLE_IS_FULL    getAttribute    _ROWID_    prefix    FAILURE    SUCCESS                     I  v   9       @  EA   \ Wΐ D FΑΐ^ C AW A  ΐ   Δ ΖΑΐ  AA  A   AA  ΐ  ΑΕΑ ΖΒB @  Bΐ άΑD FΒΒ@ΐ D FΓ  ^D FBΓ  ^        ipv6ModeGet 	   tonumber       @   NOT_SUPPORTED    NIL    INVALID_ARGUMENT    _ROWID_ =     db    setAttributeWhere    isatapTable    prefix    FALSE    FAILURE    SUCCESS                             D   F ΐ    ^         NOT_SUPPORTED                       ―    *      @@ A  ΐ  D   F Α @  @ E@ ^  E    \     A  D   FΐΑ ^  E   F Β ΐ  Α@    D FΒ\    A     ΐB      Cΐ               db    getNextRowId            isatapTable    NIL    EMPTY_TABLE 	   tonumber    INVALID_ARGUMENT    getAttribute    _ROWID_    useLanAsEndpoint    FAILURE    SUCCESS                     Ώ  Ω   3   D   F ΐ W@  E@     \     @  D   Fΐ ^  C  ΐ   Aΐ   A @      @ ΐ    Aΐ    ΐ  ΐAΕ@  @  ABΔ   Ζ ΐΐ ΐ Δ   ΖΒ  ή Δ   ΖΐΒ  @ ή          NIL 	   tonumber    INVALID_ARGUMENT    db    getNextRowId    isatapTable    TABLE_IS_FULL    getAttribute    _ROWID_    useLanAsEndpoint    FAILURE    SUCCESS                     θ     2   D   F ΐ \  A  @ W@  Α@  AW  A  @   D FΑ@  AA  ΑAΕ B @   BΕΒ Α @   Cΐ  ACΐ   Cΐ          ipv6ModeGet 	   tonumber       @   NOT_SUPPORTED    NIL    INVALID_ARGUMENT    db    setAttribute    isatapTable    _ROWID_    useLanAsEndpoint    STATUS_ENABLE    FALSE    FAILURE    SUCCESS                       -   4   D   F ΐ \  A  @ W@  Α@  AW  A  @   D FΑ@  AA  @  AC Ε ΖAΒ @  ΒBΕ άΑΒ @Δ ΖAΓΐΐ Δ ΖΓ   ήΔ ΖΑΓ   ή        ipv6ModeGet 	   tonumber       @   NOT_SUPPORTED    NIL    INVALID_ARGUMENT    _ROWID_ =     status    db    setAttributeWhere    isatapTable    useLanAsEndpoint    STATUS_DISABLE    FALSE    FAILURE    SUCCESS                     ;  R    +      @@ A  ΐ  D   F Α @   D   F@Α ^  E    \     A  D   FΐΑ ^  E   F Β ΐ  Α@    D FΒ\    A     ΐB      Cΐ               db    getNextRowId            isatapTable    NIL    EMPTY_TABLE 	   tonumber    INVALID_ARGUMENT    getAttribute    _ROWID_    endPointAddress    FAILURE    SUCCESS                     b  |   3   D   F ΐ W@  E@     \     @  D   Fΐ ^  C  ΐ   Aΐ   A @      @ ΐ    Aΐ    ΐ  ΐAΕ@  @  ABΔ   Ζ ΐΐ ΐ Δ   ΖΒ  ή Δ   ΖΐΒ  @ ή          NIL 	   tonumber    INVALID_ARGUMENT    db    getNextRowId    isatapTable    TABLE_IS_FULL    getAttribute    _ROWID_    endPointAddress    FAILURE    SUCCESS                       ½   G       @  EA   \ Wΐ D FΑΐ^ C AW A  ΐ   Δ ΖΑΐ  AA  A   AA  ΝΑA EB   \ ΐΑ D FΒΐ^ C Α    ΥC BEΓ Δ ΖΓ  Γ@  CC ΐ  C@   ΓC@          ipv6ModeGet 	   tonumber       @   NOT_SUPPORTED    NIL    INVALID_ARGUMENT    isuseLanAsEndpointEnabledNext       π?   _ROWID_ =     db    setAttributeWhere    isatapTable    endPointAddress    FALSE    FAILURE    SUCCESS                     Ξ  ξ    I      @@ A  ΐ  D   F Α @   D   F@Α ^  E    \     A  D   FΐΑ ^  J     ΐ   ΐ Ε   Ζ@ΒΑ  @ ά@ Εΐ   D FΑΒΥ@Ζΐ Α  A  C EΑ   Δ ΖAΓUΑFA   AWΐ  AWΐ   A   AA   Cΐ   @          db    getNextRowId            isatapTable    NIL    FAILURE 	   tonumber    INVALID_ARGUMENT    _ROWID_ =     getRowWhere    .    prefix    useLanAsEndpoint    endPointAddress    SUCCESS                       %   Q   D   F ΐ W@  E@     \     @  D   Fΐ ^  C  ΐ   Aΐ   A @      @ ΐ    Aΐ       Αΐ   Υ Α  BEA   A AA  BEA A Δ ΖΑΒUΑFAA ΑA  CΔ  ΖΐWΐΐΔ  ΖΐWΐΐ Δ  Ζΐΐΐ Δ  ΖΑ  ήΔ  ΖAΓ  @ ΐ ή         NIL 	   tonumber    INVALID_ARGUMENT    db    getNextRowId    isatapTable    FAILURE    _ROWID_ =     getRowWhere    .    prefix    useLanAsEndpoint    endPointAddress    SUCCESS                     7  S   B   D   F ΐ W@  E@     \     @  D   Fΐ ^  J   ΐ  ΐ   ΐ Ε  Ζ@Α @ ά@ Ε Α D FΒΥ@Ζΐ  AΑ  AB E Α Δ ΖΒUΑFA   @Wΐ  @Wΐ   @ΐ   ΑBΐ    Cΐ   @          NIL 	   tonumber    INVALID_ARGUMENT    _ROWID_ =     db    getRowWhere    isatapTable    .    prefix    useLanAsEndpoint    endPointAddress    FAILURE    SUCCESS                     b  »   Γ     @ ΕA    ά Wΐ Δ ΖΑΐή Γ AW  B  @   D FΑ@  BA  A   A  ΒAA  ΐ  BBW  B  A  ΒB  C@  ΐ  BBW  BC B  @  C A  ΒC B  @   D@BDA  ΑΒ EA ΑC ΒE FΒΕ ΐ CF\ ΐ D FΑ@ D FΖ^ ΒFA ΑB    AC BE FΗΒ ΐ \ AW H BHΑ   AC   ΑC ΒΕ ΖΗΓ @ ά AW  H 
 EΓ Γ ΔΖCΘUΓ	CEΓ Γ ΔΖΙUΓ	EΓ Γ ΔΖΓΖUΓ	ΓEΓ Γ ΔΖCΙUΓ	ΙC Ε ΖΓΙΔ @   άΓ  @Δ ΖΑΐΐ Δ ΖΖ   ήΔ ΖCΒ   ή  (      ipv6ModeGet 	   tonumber       @   IPV6MODE_NOT_ENABLED    NIL    INVALID_COOKIE    PREFIX_IS_NIL    ipAddressCheck       $@   SUCCESS    INVALID_PREFIX    USELAN_IS_NIL 
   isBoolean    INVALID_USELAN            USELAN_NOT_ENABLED       π?   logicalIfName     = '    ' and     addrFamily    '    db    getAttributeWhere    ifStaticTable    ipAddr    FAILURE    endPointAddress    =='    ' and _ROWID_ !='    getRowWhere    isatapTable    DUPLICATE_ADDRESS    prefix    DUPLICATE_PREFIX    .    useLanAsEndpoint    transportIfName    LAN    update                     Λ  *   Ξ   Δ   Ζ ΐά  A  ΐ W@  Α@  Δ ΖΑΐ  ΔΖAΑή Δ ΖΑΒ @  άΔ ΖΒWΐ ΔΖAΒή Δ ΖΑΐ  ΔΖΒή Δ ΖΑΒ  ά Δ ΖΒWΐ ΔΖΓή ΕA    ά @ΓΔ ΖΑΐ ΔΖΓή ΕA    ά ΐΓ@ΔΖΔB D  ΔΖΒΔC D ΥB EEΒ ΔΖΖ    A   BF ΕA    ά @Γ Δ ΖΑ @ άΔ ΖΒWΐ ΔΖΑΖή ΔΖΗB @  ΥB GEΒ D FΑW@ DFΘ^ DFBΘB ΐ   UB GΕΒ  Δ ΖΑWΐ ΔΖΘή ΕB ΖΒΘΓ ά ΜΒΓ
 EΓ 	 ΔΖCΘUΓ	EΓ 	 ΔΖCΙUΓ	CEΓ 	 ΔΖΗUΓ	EΓ 	 ΔΖΙUΓ	ΓΙC ΕC ΖΚΔ @ άΓ @Δ ΖΑΐ Δ ΖCΖή ΕC ΖCΚΔ DFDΘ  Α
 ά B@  +      ipv6ModeGet 	   tonumber       @   IPV6MODE_NOT_ENABLED    NIL    PREFIX_IS_NIL    ipAddressCheck       $@   SUCCESS    INVALID_PREFIX    USELAN_IS_NIL 
   isBoolean    INVALID_USELAN            USELAN_NOT_ENABLED       π?   logicalIfName     = '    ' and     addrFamily    '    db    getAttributeWhere    ifStaticTable    ipAddr    FAILURE        @   INVALID_ENDPOINTADDR    endPointAddress    =='    getRowWhere    isatapTable    DUPLICATE_ADDRESS    prefix    DUPLICATE_PREFIX 
   tableSize    .    useLanAsEndpoint    transportIfName    LAN    insert    getAttribute    _ROWID_                     8  Q   
1   D   F ΐ \  A  @ W@  Α@  AW  A  @   D FΑ@  AA  ΐ  ΑΕΑ ΖΒB @ άΑ@  Δ ΖΑΐΐ Δ ΖΒ   ήΔ ΖΑΒ   ή        ipv6ModeGet 	   tonumber       @   IPV6MODE_NOT_ENABLED    NIL    INVALID_ARGUMENT    _ROWID_ =     db    deleteRowWhere    isatapTable    FAILURE    SUCCESS                     [  g          @@ E     D   Fΐΐ @   D   F Α ^  D   F@Α    ^         db 	   getTable    isatapTable    NIL    FAILURE    SUCCESS                     p  w          @@ E   D   Fΐΐ ^          db 	   getTable    isatapTable    SUCCESS                             