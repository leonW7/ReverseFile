LuaQ                      A@  @    A  @    Aΐ  @    A  @    A@ @    A @    Aΐ @    A   E   @ \  Αΐ   A  E  A \   Α  Ε  Β ά  W@D@ WD  ΐD  A   W@E@ WE  ΐE  A   W@F  F Β AΒ ΐ W G  @G@  A €  Β €B      €  B €Β   € Β €B    	 € B	 €Β 	 € Β	 €B     
 €     B
 €Β   
 €    Β
 €B  €     B €Β  €      Β €B  € B €Β  €   Β €B  € B €Β  €      Β €B  € B €Β  € Β   <      require    teamf1lualib/fwView !   teamf1lualib/ul_contentFiltering    teamf1lualib/admin_license    teamf1lualib/validations *   teamf1lualib/urlFilteringAccessControl_bl     teamf1lualib/blockedKeywords_bl    teamf1lualib/errorMap    com.teamf1.core.admin.license    com.teamf1.ul.filter.content      ΰo@     O@   com.teamf1.core.validations #   com.teamf1.bl.filter.accessControl %   com.teamf1.bl.filter.blockedKeywords    com.teamf1.core.errorMap 
   UNIT_NAME    DSR-1000AC 	   DSR-1000 
   DSR-1000N       i@
   DSR-500AC    DSR-500 	   DSR-500N       Y@   DSR-250 	   DSR-250N       I@   DSR-150 	   DSR-150N       9@   contentFilteringCfgInit    contentFilteringCfgSave    contentFilteringCfgInputVal    contentFilteringCfgGet    trustedDomainsCfgInit    trustedDomainsCfgSave    trustedDomainsCfgDel    trustedDomainsCfgInputVal    urlFilteringACLProfileCfgInit    urlFilteringACLProfileCfgSave    urlFilteringACLProfileCfgDel     urlFilteringACLProfileCfgDelall "   urlFilteringACLProfileCfgInputVal    urlFilteringACLCfgInit    urlFilteringACLCfgSave    urlFilteringACLCfgInputVal    urlValidation    urlProtocolCheck    trustedDomainsCfgGet    blockedKeywordsCfgInit    blockedKeywordsCfgSave    blockedKeywordsCfgDel    blockedKeywordsCfgInputVal    blockedallKeywordsCfgInit    blockedallKeywordsCfgSave    blockedallKeywordsCfgInputVal    blockedKeywordsStatusModify    blockedKeywordsCfgGet    urlFilteringACLProfileCfgGet        3   8        E@  Fΐ ΐ  Α  A \ G   E@  Fΐ  Α  A \ ΐ  BΕ        @ Ε      
   
   configRow    db    getRow    ContentFiltering    _ROWID_    1    WebComponents    util    tableAppend       π?                    :   W    =   A@  G   Aΐ  G  Aΐ  G  A G@ FΐA  Β D   F@Β \ Β ΐ Α  @       FΐA Β @D   F@Γ \ Β  ΐ Α  @      E FΐΓ    Α   \ΐ   G   E   @Δ  E FΐΔ \@ E F Ε @ Α   EΑ \G  E     ^      
   errorFlag    ERROR    statusCode        statusMessage    DBTable    ContentFiltering    ContentFiltering.Status    1    contentFilteringEnable    0    printCLIError '   Error in configuring contentFiltering.    contentFilteringDisable    fwView    contentFileteringConfig    edit    OK    db    save    getAttribute    stringsMap 	   stringId 	   LANGUAGE                     Y   b        E   F@ΐ   Αΐ   AA \Α ΐΐA A   Α@ @            
      db    getAttribute    contentFiltering    _ROWID_    1    Status    0    ContentFiltering.Status    printCLIError $   Content filter is already disabled.                     d        P   E   F@ΐ   Αΐ   \    @@Α@ Α  A  Α @Aΐ Εΐ  ά@ Ε@  ά@ Εΐ Α ά@ Ζ Γ  Αΐ Εΐ A ά@  Εΐ  ά@ Εΐ Α ά@ Ζ D Αΐ Εΐ A ά@  Εΐ  ά@ ΖΐD Αΐ Εΐ  ά@  Εΐ A ά@ ΖE Αΐ Εΐ Α ά@  Εΐ  ά@ Ζ@F Αΐ Εΐ  ά@  Εΐ Α ά@         db    getRow    ContentFiltering    _ROWID_    1    WebComponents     print 0   Content Filtering Configurations Not Available
    printLabel    Content Filtering    WAN Security Checks
    ContentFiltering.Status    Content Filtering : Enabled
    Content Filtering : Disabled
    LAN Security Checks
    WebComponents.ProxyEnable    Proxy : Enabled
    Proxy : Disabled
 "   WebComponents.JavaComponentEnable    Java : Enabled
    Java : Disabled
 #   WebComponents.ActivexControlEnable    ActiveX : Enabled
    ActiveX : Disabled
    WebComponents.CookiesEnable    Cookies : Enabled
    Cookies : Disabled
                                 F@@ G   E   ΐ E  F@Α   Α \Gΐ  E  FΐΑ  Α    \ Gΐ  Eΐ  ΐ @E@  \@ Aΐ    ^ A@  ΐ  ^         RowId       π? 
   configRow    db    getDefaults    TrustedDomains    getRow    TrustedDomains._ROWID_    print ?   Row doesnt exist probably deleted. Please exit from this mode
       πΏ                       ΅    A   A@  G   A@  G  A@  Gΐ  A@ G  FΐA G E  Β @E@ FΒ   Αΐ \W Β    Δ      ΐ  @ Εΐ   	 Bΐ  Dΐ   A A ΐ Η     ΐEΐ F Δ    Ε Α \ΐ   G   E    Ε  E@ F@Ε \@ E@ FΕ ΐ Α    EA \Gΐ  E   ΐ  ^      
   errorFlag        statusCode    statusMessage    DBTable    TrustedDomains    RowId    TrustedDomains._ROWID_     db    getRowsWhere     KeywordToAllow is NOT NULL ,   Maximum limit for approved URLs is reached.    ERROR    TrustedDomains.OID    fwView    trustedDomainConfig    -1    add    edit    OK    save    getAttribute    stringsMap 	   stringId 	   LANGUAGE                     ·   Ξ     =   A@  G   A@  G  A@  Gΐ  A@ G  J   G J   ΐ  BΑ@ A FB  @  ΐΒ      @ ΐ   Α@ @    Εΐ   @ Ζ Δ ΐ    @@ DΕ ΐ Η        ΐD ΐ  E@ ΐ @EΑ Α E   ΐ     Εΐ        
   errorFlag        statusCode    statusMessage    DBTable    TrustedDomains    rows    db    getRow    _ROWID_       π?    ERROR    Row doesnt exist    printCLIError    rowid    TrustedDomains._ROWID_    fwView    deleteDomains    OK    save    getAttribute    stringsMap 	   stringId 	   LANGUAGE                     Π   ε     1   E   F@ΐ   Αΐ   \ @Α A ΐ Α  @      @B WB @B ΐB ΐ Α  @      @ Ζ@B  @   Εΐ  ά@ Β   ή  Εΐ AB ά  @   Εΐ  ά@ Β   ή  Β  ή          db    getRow    ContentFiltering    _ROWID_    1    ContentFiltering.Status    0    printCLIError &   please Enable content filtering first    TrustedDomains.KeywordToAllow         please enter a valid url    urlValidation    Please enter a valid url    urlProtocolCheck 8   Please enter a valid url without protocol specification                     ι   χ         F@@ G   E   ΐ E  F@Α   Α \Gΐ  E  FΐΑ  Α    \ Gΐ  Eΐ  ΐ @E@  \@ Aΐ    ^ A@  ΐ  ^         RowId       π? 
   configRow    db    getDefaults     urlFilteringAccessControlPolicy    getRow (   urlFilteringAccessControlPolicy._ROWID_    print @   Row doesnt exist probably deleted. Please exit from this mode.
       πΏ                    ω      J   A@  G   A@  G  A@  Gΐ  A@ G  C  ΐA    Bΐ   @Bΐ   ΐ @      BΕ    ΐ   ΐA Εΐ Ζ ΓA AA  Α ά Β@ W@ΐΐΑC W   AA A    ΑA 	   ΑD@  Α @    BE   Α      E@@    ΐ E@ @ ΐ       Εΐ        
   errorFlag        statusCode    statusMessage    DBTable     urlFilteringAccessControlPolicy    RowId (   urlFilteringAccessControlPolicy._ROWID_  #   urlFilteringACLPolicySectionCreate    errorStringGet    db    getAttribute    _ROWID_    policyName !   urlFilteringACLPolicy.policyName    printCLIError *   Existing Policy name edit is not allowed.    urlFilteringACLPolicy.cookie     urlFilteringACLPolicySectionSet            OK    save    ERROR                       8   :   A@  G   A@  G  A@  Gΐ  C  @      Ε ΖΐΑA A AB ά  BΑΐ Η   Α  Ηΐ  Ε@  ά@ Ε   Α  ή  ΖΐCΐ Δ   Ζ Δ  άΐ @  Η   Δ  Ζ@Δ  ά Ηΐ  Ε   Δ@Αΐ Η   Ε Ζ Εά@ @ Αΐ Η   Ε   Α  ή      
   errorFlag        statusCode    statusMessage    DBTable     urlFilteringAccessControlPolicy    db    getRow    _ROWID_       π?    ERROR    Row doesnt exist    printCLIError    urlFilteringACLPolicy.cookie (   urlFilteringAccessControlPolicy._ROWID_ #   urlFilteringACLPolicySectionDelete    errorStringGet            OK    save                     :  M          J   @  @Αΐ   @   Α ΐ    Α@  ΐ    A    ΐA    @  @B@          
      ERROR    db 	   getTable     urlFilteringAccessControlPolicy     No exisitng routes to delete &   urlFilteringACLPolicySectionDeleteAll            OK    save                     O     Ρ   E   F@ΐ   Αΐ   \ @Α A ΐ Α  @      @B WB @B ΐB ΐ Α  @      @C WB @C ΐB ΐ Α @      @C A@ΐC WB@ΐC WΐB ΐC  D ΐ Α@ @         DΖΐC  WΐD ΐ Α  @      @ EΖΐC Α Ε  AFά WΖ@Ε  AFά Xΐ Ε  AFά  Η Εΐ A ά@ Β   ή  @C  AΐG WB@G WΐB G  D ΐ Αΐ @         DΖG  WΐD ΐ Α  @      @ EΖG Α Ε  AFά WΖ@Ε  AFά Xΐ Ε  AFά  Η Εΐ A ά@ Β   ή  ΖH WΒ@ΖH WΐΒ ΖH  Δ Εΐ Α ά@ Β   ή  Δ   ΖΔH ά WΐΔ Εΐ Α ά@ Β   ή  Ε@ ΖΕH AΑ ά FAΖ WF@ FAΖ X   FAΖ  G Α A	 A    @C @II WB I ΐB ΐ Αΐ	 @            (      db    getRow    urlFilteringAccessControl    _ROWID_    1 !   urlFilteringAccessControl.enable    0    printCLIError &   please Enable URL filtering ACL first !   urlFilteringACLPolicy.policyName         please gave valid policy name !   urlFilteringACLPolicy.policyType     please select valid policy Type     urlFilteringACLPolicy.ipAddress    0.0.0.0    Invalid ip address    checkFirewallIPAddress H   IP Address is Invalid.Octet 1 should be in 1-223 and 1-254 for octet 4.    util    split    . 	   tonumber       @     ΰo@     ΐo@        E   Invalid IP address. Please enter a value between 1 - 254 for octet 4 %   urlFilteringACLPolicy.startIpAddress    Invalid source_address_start U   Source Start IP Address is Invalid.Octet 1 should be in 1-223 and 1-254 for octet 4. R   Invalid source Start IP address. Please enter a value between 1 - 254 for octet 4 #   urlFilteringACLPolicy.endIpAddress S   Source end IP Address is Invalid.Octet 1 should be in 1-223 and 1-254 for octet 4. P   Invalid Source end IP address. Please enter a value between 1 - 254 for octet 4    2 $   urlFilteringACLPolicy.interfaceName /   Please select atleast one Interface from vlans                       ­        F@@ G   E   ΐ E  F@Α   Α \Gΐ  E  FΐΑ  Α    \ Gΐ  Eΐ  ΐ @E@  \@ Aΐ    ^ A@  ΐ  ^         RowId       π? 
   configRow    db    getDefaults    urlFilteringAccessControl    getRow "   urlFilteringAccessControl._ROWID_    print @   Row doesnt exist probably deleted. Please exit from this mode.
       πΏ                    ―  ΐ   !   A@  G   A@  G  A@  Gΐ  C      Aΐ   ΐ @      @AΕ    ΐ     A@ΐ      @B@ @        Εΐ        
   errorFlag        statusCode    statusMessage $   urlFilteringAccessControlSectionSet    errorStringGet            OK    db    save    ERROR                     Δ  Φ    '   E   F@ΐ   Αΐ   \ @Α A ΐ Α  @      @B WB @B ΐB ΐ Α  @      @C WB @C ΐB ΐ Α @                  db    getRow    ContentFiltering    _ROWID_    1    ContentFiltering.Status    0    printCLIError '   please Enable content filtering first. !   urlFilteringAccessControl.enable      +   please select valid action enable/disable. !   urlFilteringAccessControl.action -   please select valid action black/white list.                     β  ώ      B   G   W@@ E  Fΐΐ    \    @ @ E   ^  A  @A     ΐUΐ‘@  ώΐΑ     @        ΐ@ΐ    Ε  Ζ@Β   A  ά WΐΒΐΕ  Ζ@Β   A  ά W ΓΐΕ  Ζ@Β   A  ά W@Γΐ	Ε  Ζ@Β   A  ά WΓΐΕ  Ζ@Β   @  ά WΐΒΐΕ  Ζ@Β   @  ά W ΓΐΕ  Ζ@Β   @  ά W@ΓΐΕ  Ζ@Β   @  ά Γ@ Ε   ή  Εΐ Ζ Δ   AΑ άA @ΐE  FΒΐ \  XB D @ E  ^ !  @ό              valid     string    len        gmatch 
   [^-.:/^*]    match    %W    sub       π?   .    -    :    /    util    split    pairs                              B   G   C A@   ΐ   @  Ϊ   @                  valid    find    ^([a-zA-Z][-+.a-zA-Z0-9]*):                       '    7   J      Α@  @   Εΐ  Ζ ΑA ά Αΐ   AΑ A @ @ΐ@BFWAΐ ΒBΐ  FCΓZC    A B  ΒBΐ Γ FΔZC    A B  ΒBΐ C A B !  @ψ @@   A        print !   List of available  Approved URLS            db 	   getTable    TrustedDomains  +   trusted domains configurations unavailable    pairs       π?   resTab    insertField    ROW ID    TrustedDomains._ROWID_        Domain    TrustedDomains.KeywordToAllow 	   Protocol    HTTP                     +  9        F@@ G   E   ΐ E  F@Α   Α \Gΐ  E  FΐΑ  Α    \ Gΐ  Eΐ  ΐ @E@  \@ Aΐ    ^ A@  ΐ  ^         RowId       π? 
   configRow    db    getDefaults    BlockSites    getRow    BlockSites._ROWID_    print ?   Row doesnt exist probably deleted. Please exit from this mode
       πΏ                    ;  W   C   A@  G   A@  G  A@  Gΐ  A@ G  FΐA G E  Β ΐE@ FΒ   Αΐ \W Β    Δ      ΐ  @ Εΐ   	 B	 Δ	 Δ ΐDΐ    AA ΐ Η     ΐE FΐΔ    Ε  \ΐ   G   E   ΐΕ  E@ F Ζ \@ E@ F@Ζ  Αΐ   E \Gΐ  E   ΐ  ^      
   errorFlag        statusCode    statusMessage    DBTable    BlockSites    RowId    BlockSites._ROWID_     db    getRowsWhere     KeywordToBlock != '.' +   Maximum limit for blocked URLs is reached.    ERROR    BlockSites.OID    BlockSites.KeywordBlockingTo    1    BlockSites.Status    fwView    blockedKeywordConfig    -1    add    edit    OK    save    getAttribute    stringsMap 	   stringId 	   LANGUAGE                     Y  q    =   A@  G   A@  G  A@  Gΐ  A@ G  J   G J   ΐ  BΑ@ A FB  @  ΐΒ      @ ΐ   Α@ @    Εΐ   @ Ζ Δ ΐ    @@ DΕ ΐ Η        ΐD ΐ  E@ ΐ @EΑ Α E   ΐ     Εΐ        
   errorFlag        statusCode    statusMessage    DBTable    BlockSites    rows    db    getRow    _ROWID_       π?    ERROR    Row doesnt exist    printCLIError    rowid    BlockSites._ROWID_    fwView    deleteKeywords    OK    save    getAttribute    stringsMap 	   stringId 	   LANGUAGE                     s      1   E   F@ΐ   Αΐ   \ @Α A ΐ Α  @      @B WB @B ΐB ΐ Α  @      @ Ζ@B  @   Εΐ  ά@ Β   ή  Εΐ AB ά  @   Εΐ  ά@ Β   ή  Β  ή          db    getRow    ContentFiltering    _ROWID_    1    ContentFiltering.Status    0    printCLIError &   please Enable content filtering first    BlockSites.KeywordToBlock         Enter valid blocked_URL    urlValidation    Please enter a valid url    urlProtocolCheck 8   Please enter a valid url without protocol specification                               F@@ G   E   ΐ E  F@Α   Α \Gΐ  E  FΐΑ  Α    \ Gΐ  Eΐ  ΐ @E@  \@ Aΐ    ^ A@  ΐ  ^         RowId       π? 
   configRow    db    getDefaults    BlockSites    getRow    BlockSites._ROWID_    print ?   Row doesnt exist probably deleted. Please exit from this mode
       πΏ                      Ά   0   A@  G   A@  G  A@  Gΐ  A@ G  FΐA G F@B 	@ E Β @D   FΐΒ    \ G    D   FΐΒ    \ G   D  F Γ    \ Gΐ  E   @ C @Aΐ G   E  F@Δ \@ @ A G   E   ΐ  ^      
   errorFlag        statusCode    statusMessage    DBTable    BlockSites    RowId    BlockSites._ROWID_    blockAllURLStatus.Status    BlockSites.KeywordToBlock     blockAllURLConfig    errorStringGet    returnCodes    SUCCESS    OK    db    save    ERROR                     Έ  Γ       E   F@ΐ   Αΐ   \ @Α A ΐ Α  @      @B WB @B ΐB ΐ Α  @                  db    getRow    ContentFiltering    _ROWID_    1    ContentFiltering.Status    0    printCLIError &   please Enable content filtering first    BlockSites.KeywordToBlock      G   Please select the valid option to enable/disable block all url feature                     Η  Ϋ    8   A@  G   J   G  J   ΐ   AΑ@  A FA  @  ΐΑ @   ΐ    Αΐ @   Ε    ΖA ΐ     ΐ  DΕ  AD ΐΗ     D ΐ  ΐD@ ΐ   EΑ@  E Α    Ε          DBTable    BlockSites    rows    db    getRow    _ROWID_       π? 
   errorFlag    ERROR    statusMessage    Row doesnt exist    printCLIError    rowid    statusCode    fwView    modifyKeywordStatus        @   OK    save    getAttribute    stringsMap 	   stringId 	   LANGUAGE                     έ  ψ    D   J      Α@  @   Αΐ  @   Α@  ΑAA  @Bΐ E   \A 
EΑ  \ 	 C W@B ΕB ΖΓ  AΓ DC    C άB ΖBDΔ@ Αΐ ΐ ΖBD Ε  Α@ ΕB ΖΓ  A άB ΕB ΖΓ  AΓ FC    C άB a   φEA Fΐ Α \A        printLabel    Blocked URLs    print     List of available Blocked URLs
                db 	   getTable    BlockSites  '   Blocked URLs configuration unavailable    pairs       π?   resTab    insertField    ROW ID    BlockSites._ROWID_    BlockSites.Status    1    Enabled    0 	   Disabled    Status    Blocked Keyword     BlockSites.KeywordToBlock                     ϊ  &       E   F@ΐ   Αΐ   \ @ Α @ ΐΑ  Aΐ   Α@ @    Α @ ΐΒ  Aΐ   Α  @    Α@ @    Ε   ά@ Αΐ   DAA  Dΐ E Α \A ΐE  \@Μ@ΕΒ WΔ@Ε ΖΒΕ  A CFC     άB Ε ΖΒΕ  AΓ GC     άB ΖBGΗ@ ΒΗ@ΖBG Α@ Θ  BΘΕ ΖΒΕ  A CGC     άB Ε ΖΒΕ  AΓ IC     άB Ε ΖΒΕ  AC	 IC     άB Ε ΖΒΕ  AΓ	 JC     άB Ε ΖΒΕ  AC
 JC     άB a  ΐλE FΒ ΑΑ \A  +      db    getRow    urlFilteringAccessControl    _ROWID_    1    printLabel    URL filtering ACL !   urlFilteringAccessControl.enable    print    URL filtering ACL : Enabled
    URL filtering ACL : Disabled
 !   urlFilteringAccessControl.action    Action : White List
    Action : Black List
 -   List of available URL filtering ACL profiles         	   getTable     urlFilteringAccessControlPolicy  6   URL filtering ACL profiles configurations unavailable    pairs       π?   resTab    insertField    ROW ID (   urlFilteringAccessControlPolicy._ROWID_        policy Name +   urlFilteringAccessControlPolicy.policyName +   urlFilteringAccessControlPolicy.policyType    0 
   SINGLE_IP    ADDRESS_RANGE 
   INTERFACE    policy Type    ip address  *   urlFilteringAccessControlPolicy.ipAddress    start address /   urlFilteringAccessControlPolicy.startIpAddress    end address -   urlFilteringAccessControlPolicy.endIpAddress    interaface .   urlFilteringAccessControlPolicy.interfaceName                             