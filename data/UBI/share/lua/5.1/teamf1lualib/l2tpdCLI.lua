LuaQ                .      A@  @    A  @    Aΐ  @    A  @    A@ @    A  E   ΐ \    Α   Ε   A ά $  dA     €   €Α  Α €              €A A €            require    teamf1lualib/l2tpServer    teamf1lualib/validations    teamf1lualib/returnCodes    teamf1lualib/vpn_l2tpServer    teamf1lualib/errorMap    com.teamf1.core.errorMap    com.teamf1.core.validations    com.teamf1.core.returnCodes    com.teamf1.core.vpn.l2tpserver    l2tpServerCfgInit    l2tpServerCfgSave    l2tpServerInputVal 
   l2tpdtGet    l2tpdtclientGet                    E   F@ΐ    Α  \Z   @ ΐΐ @  Α   @              io    open    rb    close                      "   )       D      \ Z@  @ J   ^  J   G   E@  F ΐ    \  E     @Ia@   ώE   ^          lines    io       π?                    +   .        E@  Fΐ ΐ  Α  A \ G   A    ^      
   configRow    db    getRow    Xl2tpServerIPRange    _ROWID_    1       π?                    0   9     	    A   @  Α@  Α     AA@   ΑΑ Α  @   Β  A BA A ΑBA A ΐ  Ϋ@   ΐ    @        ERROR        DBTable    Xl2tpServerIPRange    l2tpServer    serverConfig    1    edit    OK    db    save    getAttribute    stringsMap 	   stringId 	   LANGUAGE                     ;   £    μ      @@Α  Α  A  Ζ@AΑ ΖΐA W ΒΖB Α FC Υ@	ΐ  	@ΓΖ@A ΑΐΖC  Α Εΐ  ά@ Β   ή  ΖC  ΑΐΖ@D  Α Εΐ  ά@ Β   ή  ΖC  Α ΖC W Β ΖC @Γ Εΐ Α ά@ Ζ@D  Α Ζ E W Β@Ζ E W@Γ Ζ E @Ε Εΐ  ά@ Β   ή  Δ   Ζ ΖE FAF άΐΑ @ Δ  ΖΖWΐ ΐΔ  Ζ Η  ά Ηΐ Β   Α ή Ζ@F W Β@Ζ@F W@Γ Ζ@F @Ε Εΐ A ά@ Β   ή  Δ ΖΗE ά WΐΗ Εΐ  ά@ Β   ή  Δ ΖΗAF ά WΐΗ Εΐ A ά@ Β   ή  Δ ΖΘAF FE Α ά  FW  Εΐ 	 ά@ Β   ή  Δ Ζ@ΙE FAF ά@ WΙ ΐ WΐΙ @  Κ  Εΐ A
 ά@ Β   ή  ΖJ WΑ ΖJ ΐΚΖ K W Α Ζ@K  Α Εΐ  ά@ Β   ή  ΖJ ΐΛ@Ζ@K W Α@Ζ L W Α Ζ@L  Α Εΐ  ά@ Β   ή  ΖJ ΐΜΖ K W Α Ζ@K W Α@Ζ L W Α Ζ@L  Α Εΐ  ά@ Β   ή  Ζ@M W Α@ΖM W Α ΖΐM  Α Εΐ  ά@ Β   ή  Ζ@N Ξ Εΐ Α ά@ Β   ή  Β  ή    <      db    getRow    networkInfo    _ROWID_    1    networkInfo.netWorkMode    3 ,   pptpServerIPRange.pptpdIpv6PrefixLenghtInit  $   Xl2tpServerIPRange.Xl2tpdIpv6Prefix (   Xl2tpServerIPRange.Xl2tpdIpv6PrefixInit    / .   Xl2tpServerIPRange.Xl2tpdIpv6PrefixLengthInit     !   Xl2tpServerIPRange.Xl2tpd6Enable    printCLIError G   Please change Ip Mode to IPV4/IPV6 first to enable L2TP server on ipv6     Xl2tpServerIPRange.Xl2tpdEnable ?   You cannot enable l2tp Server in both ipv4 and ipv4/ipv6 mode.     Invalid l2tp server ipv6 prefix "   Xl2tpServerIPRange.StartIPAddress    0.0.0.0 (   Invalid l2tp server start address range    range    subnetCheckValidation     Xl2tpServerIPRange.EndIPAddress    SUCCESS    statusErrorMessage    errorStringGet '   Invalid l2tp server  end address range    checkIpv4Address ]   Start IP Address is Invalid.Octet 1 should be in 1-223 and Octet 4 should be in 1-254 range. [   End IP Address is Invalid.Octet 1 should be in 1-223 and Octet 4 should be in 1-254 range.    ipv4SingleMaskCheck    255.255.255.0 ?   Staring IP address and Ending IP address must be in same range    ipv4AddressesCompare               @       @0   End address should be higher than Start address &   Xl2tpServerIPRange.AuthenticationType    4    Xl2tpServerIPRange.PapEnable    Xl2tpServerIPRange.ChapEnable '   pap and chap are unsupported protocols    5     Xl2tpServerIPRange.MSChapEnable "   Xl2tpServerIPRange.MSChapv2Enable     pop3 only supports PAP protocol    6 )   do no select any authentication protocol     Xl2tpServerIPRange.Mppe40Enable !   Xl2tpServerIPRange.Mppe128Enable '   Xl2tpServerIPRange.MppeStatefullEnable %   do no select any encryption protocol    Xl2tpServerIPRange.UserTimeOut    0 *   please Enter the value between 300 - 1800                     €           J   @  @Αΐ   AA      Αΐ @     B@B    B@B  ΐ     B@A    B@B        B@B    B@A  @  ΐCΐ   @  @    @D@B ΐ  @     ΐCΐ  A E ZA    A @  ΐCΐ  Α E  FΖZA    A @  ΐCΐ  A E  FΖZA    A @  ΐCΐ  Α E  FΗ@    @G@B ΐ   
   @G@A    @   @G@H      @GΐH  	  ΐ   @G@I 	      @GΐI  
  @   @G@J@ 
   ΐCΐ  Α
 E @    B@A@ ΐCΐ   E  FΗZA    A @    @K@B ΐ  @ ΐ   ΐCΐ   E ZA    A @    @L@B ΐ  @ ΐ   ΐCΐ  Α E ZA    A @     M@B ΐ @ @ ΐ @  ΐCΐ   EA ZA    A @    ΐM@B ΐ   @ ΐ    ΐCΐ  A E ZA    A @    N@B ΐ ΐ @ ΐ ΐ  ΐCΐ   EΑ ZA    A @  ΐCΐ  A E  FΟZA    A @  ΐCΐ  Α E  FΠ@  @Pΐ   @  C   
   configRow    db    getRow    Xl2tpServerIPRange    _ROWID_    1    printLabel    L2TP Server Configuration     Xl2tpServerIPRange.Xl2tpdEnable    0 !   Xl2tpServerIPRange.Xl2tpd6Enable 	   Disabled    Enabled (Ipv4 only)    Enabled (Ipv4/Ipv6)    resTab    insertField    L2TP Server status :  #   Xl2tpServerIPRange.l2tpRoutingMode    NatMode 
   Classical    NAT    L2TP Server routing mode :      #   L2TP Server starting ip address :  "   Xl2tpServerIPRange.StartIPAddress !   L2TP Server ending ip address :      Xl2tpServerIPRange.EndIPAddress    IPV6 Prefix $   Xl2tpServerIPRange.Xl2tpdIpv6Prefix &   Xl2tpServerIPRange.AuthenticationType    Authentication    Local User Database    External Radius Server    2    External LDAP Server    3 !   External Active Directory Server    4    External NT Domain Server    5    External POP3 Server    6    None Authentication    Authentication Database "   L2TP Server ipv6 prefix/length :     Xl2tpServerIPRange.PapEnable 
   PapEnable    Enabled "   L2TP Server pap authentication :     Xl2tpServerIPRange.ChapEnable    ChapEnable #   L2TP Server chap authentication :      Xl2tpServerIPRange.MSChapEnable    MSChapEnable %   L2TP Server mschap authentication :  "   Xl2tpServerIPRange.MSChapv2Enable    MSChapv2Enable '   L2TP Server mschapv2 authentication :  '   Xl2tpServerIPRange.l2tpSecretKeyEnable    l2tpSecretKeyEnable     L2TP Server secret key status:     L2TP Server secret key :     Xl2tpServerIPRange.secretKey    L2TP Server user time out :     Xl2tpServerIPRange.UserTimeOut    print                               7          D      \    Ε@    ά ΐ
     J  Βΐ @ IB@‘B  ΐώ@A ΒAΖΐΒΖΒΒ ΖΐΒΖΒΒΖΒΒΒα  @χΚ     EA   \  ΙBB C ΖΖΑΒΖΖΒΒΕ ΖBΔ AΓ  ΑC άΪB    Α Β@a  ψJ   ADΑ Β A Β A     Ε B άA  E@
ΐ EB  \ @ΕΓ ΖΗ AD DCD     άC ΕΓ ΖΗ AΔ CD     άC ΕΓ ΖΗ A ΔCD     άC a   ψEΒ FBΘΑ \B  "      /var/ppp_user_session    pairs       π?   gmatch    %S+       @   user    *    rmoteip    server        @      @   l2tpServer 	   userName 	   RemoteIP    Xl2tpIP    db    getAttribute    Xl2tpServerIPRange    _ROWID_    1    StartIPAddress    0    Xl2tpdEnable    printLabel    List of L2TP Active Users            resTab    insertField 
   User Name     
   Remote IP    L2TP IP    print                             