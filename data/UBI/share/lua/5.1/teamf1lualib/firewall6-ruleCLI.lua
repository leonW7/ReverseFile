LuaQ                $      A@  @    A  @ À  C  ä   Ç  ä@  Ç@ ä  Ç äÀ  ÇÀ ä  Ç  ä@       Ç@ ä Ç äÀ           ÇÀ ä  Ç  ä@ Ç@ ä Ç         require    teamf1lualib/fwView    teamf1lualib/fwRules *   PriorityId != 'NULL' and PriorityId !='0'    firewallRule6InfoGet    firewallSettings6CfgInit    firewallSettings6CfgSave    firewallSettings6InVal    accessControlRule6Modify    accessControlRule6CfgInit    accessControlRule6CfgSave    accessControlRule6CfgInputVal    rule6ReorderInit    rule6ReorderSave    rule6ReorderInVal        %          E   F@À   ÁÀ   AA \Z@    A  Á  À Á  @      @ Á @     CÁ@  AÁ  À À  D AÀ @ Á @ À  DÀD @ Á  @ @ À    Å   ÆÀÅ @ Ü  A@AA  ÁÁ  A     J    ÅA B ÜA WGWA ÅÁ ÆÈ  AB ÜWÈ@WÀHÂ E	 \À	 À@ÆDI	@	 I@ ¡  Àýa  @üÃ AÃ 	 À À$LÉÆDÅÉ	ÀD
@ Á
 À ÅÉ	 A
  ÁA
 Ê	ÀJ
@  À Ê	@K
   ÅË	 L
@ ÁB @ÅË	L
@ ÁÂ  ÅË	 M
@ ÁB À ÅË	M
  ÁÂ Î	ÀD
@ B ÀÎ	 A
@ Î	Î	ÀC
À Î	AÅ Ï	
EÏ	ÀD
@ AB ÀEÏ	 A
@ FÏ	EÏ	ÀC
À Ï	AÅ ÅÏ	U
Ð	 A
@ C À Ð	ÀC
   Å Q
@E ÆÑ	ÚE    Á E Å Q
@Å ÛE  Á E Å Q
@ ÛE   Á E Å Q
@E ÆÒ	ÚE    Á E Å Q
@Å ÛE  Á E Å Q
@ ÛE   Á E Å Q
@E ÛE  Á E Å Q
@ ÛE   Á E ¡  @ÚÃ CDÀÄ C  O      db    getAttribute    networkInfo    _ROWID_    1    netWorkMode        printCLIError ;   Please Set IP Mode to IPv4/IPv6 to configure this option.
    printLabel    Default Outbound Policy    defRow    getRow    fwDefaultOutBoundPolicy    Ipmode    2 ,   fwDefaultOutBoundPolicy.DefaultPolicyStatus    print    For IPv6 : Allow Always
    0    For IPv6 : Block Always    RuleType = 'SECURE_INSECURE' !    or RuleType = 'INSECURE_SECURE'    getRowsWhere    FirewallRules6    fwPriorityMap6 	   RuleType    ALL    PriorityStr &   List of Available IPv6 Firewall Rules     util    split    ,             pairs    FirewallRules6.PriorityId       ð?   FirewallRules6.Status 	   Disabled    Enabled    FirewallRules6.RuleType    SECURE_INSECURE    LAN To WAN    INSECURE_SECURE    WAN To LAN    FirewallRules6.Action    ACCEPT    ALLOW Always    DROP    BLOCK Always    DROP_BY_SCHED_MATCH #   BLOCK by schedule, otherwise allow    ACCEPT_BY_SCHED_MATCH "   ALLOW by schedule,otherwise block !   FirewallRules6.SourceAddressType    Any "   FirewallRules6.SourceAddressStart     -      FirewallRules6.SourceAddressEnd &   FirewallRules6.DestinationAddressType '   FirewallRules6.DestinationAddressStart %   FirewallRules6.DestinationAddressEnd    FirewallRules6.LogLevel    Never    Always    resTab    insertField    ROW ID    FirewallRules6._ROWID_    Status 
   Rule Type    Service    FirewallRules6.ServiceName    Action    Source Users    Destination Users    Log                             	   F @    @À@@AÆ A  Þ            ð?   Ipv6.DefaultPolicyStatus    Ipv4.DefaultPolicyStatus     Ipv6._ROWID_    2                         °     	   A   @  Á@    Á@@  Á  @   AAA Á À  À  @Â À  BA @ AÀ Á    @        Error        fwView    defaultPolicyEdit    db    getAttribute    stringsMap 	   stringId 	   LANGUAGE    OK    save    ERROR 9   Default outbound rule not found for IPv6 Firewall Rules.                     ³   º            @@ A  À  Á  A @      A  EÀ   \@ B   ^  B  ^    	      db    getAttribute    networkInfo    _ROWID_    1    netWorkMode        printCLIError ;   Please Set IP Mode to IPv4/IPv6 to configure this option.
                     ½   î     [   E   F@À   ÁÀ   AA \Z@    A  Á  À Á  @      @ Á  AÁ G J  AC IC ÆÃÂ @  C EÂ B Á C AÃ B\B B  ^ E  FÅ ÁÂ   \ @Å Â Á B    Â FÀ  Â   @FÀ  FB ÀFÀ  ÁB B GÀ  ÁÂ B   H  ÁB B  B  À   #      db    getAttribute    networkInfo    _ROWID_    1    netWorkMode        printCLIError ;   Please Set IP Mode to IPv4/IPv6 to configure this option.
    Error    DBTable    FirewallRules6    rowId       ð?       @	   tonumber         3   The IPV6 Firewall Rule with rowId 1 is default and     cannot be     d. 
   existsRow  "   Configured Row ID does not exist.    fwView    modifyIPv6Rules    OK    save    delete    print #   Firewall rule(s) has been deleted.    enable #   Firewall rule(s) has been enabled.    disable $   Firewall rule(s) has been disabled.    firewallRule6InfoGet                     ó      ,   F @    @À  À@@AÀAÀAÂ ÃÁ@ È   Á È   ÅÀ   Ü  À  AA A   Á EAA  À    @@  AÁ A   È  Æ@  Þ            ð?    FirewallRules6._ROWID_    -1    FirewallRules6.ServiceName    ANY !   FirewallRules6.SourceAddressType    0 &   FirewallRules6.DestinationAddressType    FirewallRules6.LogLevel    1    FirewallRules6.Action    DROP    add    edit 	   tonumber    print G   The IPV6 Firewall Rule with rowId 1 is default and cannot be editable.       ð¿   db    getRow    FirewallRules6    _ROWID_    Row does not exist                       8    <   A   @  Á@  Á    A @A 	ÀA	@B A B@ 	@B	ÀAÁB  C  	@ÀC  C  	@ÀD @D ÁD@  Á À @   E@  D ÁÀ @  @Å   ÁEA D @DÀ  AA A   A A   @        Error        DBTable    FirewallRules6    FirewallRules6.RuleType    INSECURE_SECURE    FirewallRules6.FromZoneType 	   INSECURE    FirewallRules6.ToZoneType    SECURE    SECURE_INSECURE !   FirewallRules6.SourceAddressType    1 )   FirewallRules6.SourceAddressPrefixLength &   FirewallRules6.DestinationAddressType .   FirewallRules6.DestinationAddressPrefixLength    FirewallRules6._ROWID_    -1    fwView    ipv6FirewallRulesAdd    ipv6FirewallRulesEdit    OK    db    save    print !   Firewall rule(s) has been added. #   Firewall rule(s) has been eddited.                       æ   ×   F @ Z   ÀA@   @ Á  UÀ À   AÁ@   A ÅÀ  Ü@ Â   Þ  F@B WÂ  F@B ÀÂ  EÀ   \@ B   ^  F@C WÀÂ  F@C Â  EÀ  \@ B   ^  FÀC WÀÂ  FÀC Â  EÀ   \@ B   ^  F@C @Ä FD WÀÂ  FD Â  EÀ À \@ B   ^  F@C  Å  FD WÀÂ  FD WÂ @F@E WÀÂ  F@E Â  EÀ  \@ B   ^  FÀC @Ä FÀE WÀÂ  FÀE Â  EÀ   \@ B   ^  FÀC  Å  FÀE WÀÂ  FÀE WÂ @F@F WÀÂ  F@F Â  EÀ  \@ B   ^  C AB EÁ  FÁÆ Ä  \  G@Á ÁÁ A      H G   ÁA  Õ À ÀH 	 Ä UÀ  ÁA  AB	  ÕÁ  ÁFÁ  @ @
Á ÁÁ	 A    À J@ G   ÁA B
  À ÀH 	 Ä UÀ  ÁA B
 AB	  Á  ÁFÁ   @  Á Á
 A        +      FirewallRules6.ServiceName    ServiceName = '    '    db    existsRowWhere 	   Services     printCLIError    Invalid service name    FirewallRules6.RuleType         Enter valid Rule Type
 !   FirewallRules6.SourceAddressType !   Enter valid source address type
 &   FirewallRules6.DestinationAddressType &   Enter valid destination address type
    1 "   FirewallRules6.SourceAddressStart    Enter valid source address
    2     FirewallRules6.SourceAddressEnd "   Enter valid source address range
 '   FirewallRules6.DestinationAddressStart !   Enter valid destination address
 %   FirewallRules6.DestinationAddressEnd '   Enter valid destination address range
    getRowsWhere    FirewallRules      À@   add %   Maximum Firewall Rule Limit Exceeded    SECURE_INSECURE     and ruleType ==     'SECURE_INSECURE'    edit 
   rowid !=      and       Àr@&   Outbound Firewall Rule Limit Exceeded    INSECURE_SECURE    'INSECURE_SECURE' %   Inbound Firewall Rule Limit Exceeded                     é      N   J      Á   @ I Á  AF@ A    ÁAA A Æ@ Û@   ÁÀ W Ã@ ÀÂ@A A A Á C E FÄA Á Â \ W ÃÀ ÅA   Á W C@ ÀB Á ÃÁ  AÀ B Á  W@E @  ÌÀÀ @ IÀ@ !   þ AB BÂ @                 Rule6ToMove.rowIds       ð?   util    split    ,    db    getAttribute    FirewallRules6    _ROWID_    PriorityId         printCLIError    Invalid rowid       ð¿   getRow    fwPriorityMap6 	   RuleType    ALL    fwPriorityMap6.PriorityStr     pairs    Rule6ToMove.pos    print    curPos                       (    '   A   @  Ê     Á@FA A À   @ÀEÂ  À\BEÂ B À \B!  @ý ÁB@C Á @  @Ã   ÁCA   @         Error        util    split    Rule6ToMove.rowIds    ,    pairs    print    k    v    fwView    ipv6FirewallRulesMove    Rule6ToMove.pos    OK    db    save                     *  6        J      @@Æ@ Á  @    À   ÀÅ ÆÁÁ AB  Ü ÇA ÅA Â@ÅÁ   A ÜAÂ  Þ ¡  @û            util    split    Rule6ToMove.rowIds    ,    pairs 	   rowValid    db 
   existsRow    FirewallRules6    ROWID     printCLIError     is not a valid ROWID                             