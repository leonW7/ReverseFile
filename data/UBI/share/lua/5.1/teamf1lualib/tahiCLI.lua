LuaQ                5   $      $@  @  $    $À  À  $    $@ @ $  $À À $    $@ @ $  $À À $    $@ @ $  $À À $    $@ @ $  $À À $    $@ @ $  $À À $    $@ @      
   modeCheck    tahiDefaultRouteAdd    tahiDefaultRouteDel    tahiStopRA    tahiStartRA    tahiProcSet    v6UpGlobal    tahiAliasAdd    tahiAliasDel    tahiNeighCacheDel    tahiReachableTimeSet    tahiMcastStart    tahiMcastStop 
   tahiPing6    tahiBPing6    tahiMping6    tahiRouteAdd    tahiRouteDel    tahiPmtuRouteAdd    firewall6Disable 
   lanIpShow    lanIpInterface    runTftpRadvd    runCustomRadvdInit    customRadvdInputVal    runCustomRadvd                       @@ A  À  Á  A WA  EÀ   \@ B   ^  B  ^    	      db    getAttribute    networkInfo    _ROWID_       ð?   netWorkMode    3    printCLIError     Please Set IP Mode to IPv4/IPv6                                E   \ @À     E  \@ EÀ  F Á @ À     \      
   modeCheck     tahiDefaultRouteDel    os    execute    route -A inet6 add default gw  
    dev bdg1                              
       @@       À@ A        
   modeCheck     os    execute    ip -6 route del default                        (             @@       À@ A   E@ FÁ À Á  \Z   @@Â @   BÁÀ @      
   modeCheck     os    execute    killall radvd 2>/dev/null    io    open    /tmp/radvdCheck    r    close    remove                     +   5        E   \ @À     E  \@ EÀ  F Á @ À   À \  ÀAÁ  A    @ ËBÜ@      
   modeCheck     tahiStopRA    os    execute 
   radvd -C     io    open    /tmp/radvdCheck    w    close                     8   D        E   \ @À     @  EÀ  F Á @ \ À   AÁ  @ÀA ÀEÀ  F Á   \ À   AÁ@    
   
   modeCheck             os    execute 3   echo "1">/proc/sys/net/ipv6/conf/bdg1/disable_ipv6 3   echo "1">/proc/sys/net/ipv6/conf/eth1/disable_ipv6       ð?3   echo "0">/proc/sys/net/ipv6/conf/bdg1/disable_ipv6 3   echo "0">/proc/sys/net/ipv6/conf/eth1/disable_ipv6                     G   P             @@       AÀ  @   E@ FÁ À À   \ Â Å@ ÆÂÁ @ AÜ      
   modeCheck     tahiProcSet       ð?)   LogicalIfName='LAN' and AddressFamily=10    db    getRowWhere 	   ifStatic    ifStatic.StaticIp    os    execute    ifconfig bdg1 add                      S   X            @@      À@Á    AA   Á ÕÀ      
   modeCheck     os    execute 
   ifconfig      add     /64                     [   `            @@      À@Á    AA   Á ÕÀ      
   modeCheck     os    execute    ifconfig       del     /64                     c   h      
       @@       À@ A        
   modeCheck     os    execute    ip -6 neigh flush all                     k   p        E   \ @À     E  FÀÀ   À   A  \      
   modeCheck     os    execute    echo  5    > /proc/sys/net/ipv6/neigh/bdg1/base_reachable_time                     s   }             @@       À@ A  @ KA ÁÀ \@KA Á  \@KA Á@ \@KB \@ EÀ F Ã @ \      
   modeCheck     io    open    /var/mfc.conf    w    write @   ff1e::1:2 from 3ffe:501:ffff:100:200:ff:fe00:100@bdg1 to eth1;
 @   ff1f::1:2 from 3ffe:501:ffff:100:200:ff:fe00:100@bdg1 to eth1;
 3   ff1e::1:2 from 3ffe:501:ffff:100::1@bdg1 to eth1;
    close    os    execute    mfc /var/mfc.conf &                                     @@       À@ A   E  FÀÀ @ \      
   modeCheck     os    execute    killall mfc 2>/dev/null    rm -f /var/mfc.conf                                    @@      À@Á    AA   Õ      
   modeCheck     os    execute 
   ping6 -s      -c 1 -I bdg1                                     @@      À@Á    AA   Õ      
   modeCheck     os    execute    /bin/busybox ping6 -s                                      E   \ @À     E  FÀÀ   À   À \      
   modeCheck     os    execute    /bin/busybox ping6  -I bdg1                      ¡   ¦            @@      À@Á     AA  Á ÕÀ      
   modeCheck     os    execute    route -A inet6 add     /64 gw  
    dev bdg1                     ©   ®            @@      À@Á     AA  Á ÕÀ      
   modeCheck     os    execute    route -A inet6 del     /64 gw  
    dev bdg1                     ±   ¶        E   \ @À     E  FÀÀ   À   A  \      
   modeCheck     os    execute    route -A inet6 add  
    dev bdg1                     ¹   Ä             @@       À@ A  @    @ KA \@ EÀ F Â @ \ À  BÁ  ÅÀ Æ ÂÁ Ü      
   modeCheck     io    open    /var/fwIpv6LogoCheck    w    close    os    execute *   /pfrm2.0/bin/ip6tables -I INPUT -j ACCEPT ,   /pfrm2.0/bin/ip6tables -I FORWARD -j ACCEPT [   /pfrm2.0/bin/ip6tables -t raw -A PREROUTING -p icmpv6 -i bdg1 -m frag --fragres -j NOTRACK                     Æ   Ù      &       @@       AÀ    @AÁ   ÁÀ    @ @  @B F ÆÂÃ FÃÕ@ W  ÁB ÕÀ!   ü @A      
   modeCheck          /   LogicalIfName = 'LAN' AND addressFamily = '10'    db    getRowsWhere    ipAddressTable        pairs       ð?   ipAddressTable.ipAddress    /    ipAddressTable.ipv6PrefixLen    ,     printCLIError                     Û   å             @@      À@Á  A @   ÀÁ ÀÅ  Æ@Â @ Á Ü@   Ã Å  Æ@Â @ A Ü@      
   modeCheck     db    getAttribute    networkInterface    LogicalIfName    interfaceName    up    os    execute 
   ifconfig      up    down     down                     ç   î        @  @ÁÀ     A  Õ       @A  ÁÀ @        Á@ @   
      x    os    execute    tftp -g -r      -l /var/mradvd.conf        p@   print    TFTP failed     tahiStartRA    /var/mradvd.conf                     ð          A      ÀÀ@À@À@À@À@À@À@À@À    Þ            ð?
   interface     AdvSendAdvert    MaxRtrAdvInterval    MinRtrAdvInterval    AdvCurHopLimit    AdvManagedFlag    AdvOtherConfigFlag    AdvDefaultLifetime    AdvReachableTime    AdvRetransTimer    AdvLinkMTU    ipAddr    prefixLength 
   AdvOnLink    AdvAutonomous    AdvValidLifetime    AdvPreferredLifetime                              F @ @À  E  À  \@ B   ^  F A @À  E  @ \@ B   ^  FA @À  E  À \@ B   ^          prefix     printCLIError    need valid prefix to start RA    prefixLength %   need valid prefix length to start RA 
   interface !   need valid interface to start RA                       O    
¯   E   F@À   ÁÀ  A AA \Á  À Á  @      @B A  	ÂÀ  CÁ@  ËÀCA  ÁA UÁÜ@ËÀCA Ü@ËÀCAÁ AB Á UÁÜ@Æ@E WÁ@ËÀCA AE Á UÁÜ@ÆÀE WÁ@ËÀCA ÁE Á UÁÜ@Æ@F WÁ@ËÀCA AF Á UÁÜ@ÆÀF WÁ@ËÀCA ÁF Á UÁÜ@Æ@G WÁ@ËÀCA AG Á UÁÜ@ÆÀG WÁ@ËÀCA ÁG Á UÁÜ@Æ@H WÁ@ËÀCA AH Á UÁÜ@ÆÀH WÁ@ËÀCA	 ÁH Á UÁÜ@Æ@I WÁ@ËÀCA	 AI Á UÁÜ@ËÀCAÁ	 J ÁA
 J AÂ
 UAÜ@Æ K WÁ@ËÀCAA K Á UÁÜ@ÆK WÁ@ËÀCAÁ K Á UÁÜ@Æ L WÁ@ËÀCAA L Á UÁÜ@ÆL WÁ@ËÀCAÁ L Á UÁÜ@ËÀCA Ü@Ë@MÜ@ Å A Ü@ ÁÀ  Þ   9      db    getAttribute    networkInterface    LogicalIfName 
   interface    interfaceName     printCLIError !   unable to get the interface name    AdvSendAdvert    on    io    open    /var/cusRa.conf    w    write    interface     
    	{
    	AdvSendAdvert     ;
    MaxRtrAdvInterval    	MaxRtrAdvInterval     MinRtrAdvInterval    	MinRtrAdvInterval     AdvCurHopLimit    	AdvCurHopLimit     AdvManagedFlag    	AdvManagedFlag     AdvOtherConfigFlag    	AdvOtherConfigFlag     AdvDefaultLifetime    	AdvDefaultLifetime     AdvReachableTime    	AdvReachableTime     AdvRetransTimer    	AdvRetransTimer     AdvLinkMTU    	AdvLinkMTU  	   	prefix     prefix    /    prefixLength    
		{
 
   AdvOnLink    		AdvOnLink     AdvAutonomous    		AdvAutonomous     AdvValidLifetime    		AdvValidLifetime     AdvPreferredLifetime    		AdvPreferredLifetime  
   		};
	};
    close    tahiStartRA    OK    Successfull                             