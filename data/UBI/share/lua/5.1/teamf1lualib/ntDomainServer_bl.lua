LuaQ                d      A@    ΐ@@  A@ @   A @   Aΐ @   A  @   A@ @   A @   Aΐ @   A   E  @ \   Α  Ε  Α ά  A  A GA CGΑ AA G AΑ G AΑ G AΑ GA AΑ G AΑ GΑ AΑ G AΑ GA AΑ G AA G J  G E IΙd        GA	 dA      G	 d              GΑ	 dΑ      G
 d     GA
 dA     G
 d       GΑ
 dΑ       G   -      module &   com.teamf1.bl.authentication.ntdomain    package    seeall    require    teamf1lualib/db    teamf1lualib/util    teamf1lualib/validations    teamf1lualib/returnCodes %   teamf1lualib/authentication_ntdomain    teamf1lualib/management_config    teamf1lualib/auth_returnCodes    com.teamf1.core.returnCodes    com.teamf1.core.validations    com.teamf1.core.config (   com.teamf1.core.authentication.ntdomain !   com.teamf1.core.auth_returnCodes    DEFAULT    Default    NIL    FIRST_COOKIE    1    SERVER1        SERVER2    SERVER3    DOMAIN1    DOMAIN2    DOMAIN3    TIMEOUT    RETRIES       @   sslVpnExAuthTable    USERDBDomains 
   attribute 	   authType    AuthenticationType    ntdomainServerGet    ntdomainServerGetNext    ntdomainServerSet    ntdomainServerDelete    ntdomainCreate    ntdomainServerDefaultsGet    getServerStatus    serverStatusSet        P   {     ?   Δ  ΖBΒάB  GΗ  ΗF  GΖ    ΗE    
@ 
 	ΐ 	@  ΐ   @    Δ ΖΒWΐ     Κ   Ι ΙΙΒΙΙBΙΙΒΙΙBΙ  ΙC  Ι  ΙΓ  Ι ΙC Ι ΙΓ Ι Ι   @        primaryAdminAccount    primaryAdminPassword    primaryServerHostName    secondaryAdminAccount    secondaryAdminPassword    secondaryServerHostName    tertiaryAdminAccount    tertiaryAdminPassword    tertiaryServerHostName 
   serverGet    SUCCESS    ntDomain.cookie    FIRST_COOKIE    ntDomain.primaryServer    DEFAULT    ntDomain.secondaryServer    ntDomain.tertiaryServer    ntDomain.primaryDomain    ntDomain.secondaryDomain    ntDomain.tertiaryDomain    ntDomain.timeout    ntDomain.maxRetries    ntDomain.primaryAdminAccount    ntDomain.primaryAdminPassword    ntDomain.primaryServerHostName    ntDomain.secondaryAdminAccount     ntDomain.secondaryAdminPassword !   ntDomain.secondaryServerHostName    ntDomain.tertiaryAdminAccount    ntDomain.tertiaryAdminPassword     ntDomain.tertiaryServerHostName                               F @ @ΐ   ΐ@Α  @    @A     A          ntDomain.cookie     util    appendDebugOut    GetNext : Invalid Cookie    BAD_PARAMETER    NOT_SUPPORTED                     «      )w   E   @  Ζ@ Α@ FA AA ΖA ΒA FB BB ΖB ΓB FC CC ΖC ΔC FD DD ΖD ΐΔ  EE
A E   ΕE
  
E W@Ζ
E FEΕ
 \E D  FΕΖ
^ E @Η
E FΕΗ
 \ E ΐ
 Ε ΖΘ AΗ Ε	 ΖGΙάΙ  ΗI ‘   όD FΚ
\E DFΚ
 ΐ  @ ΐ  @ ΐ  @ ΐ  	@	 	ΐ	 	 
	\Ε 
E
  
D  FΕΚ
W@
ΐE FEΕ
 ΐ 
Ε\E D FEΛ
\E @ 
 ^D FΛ
\E D FΕΛ
\E D  FΕΚ
E
 ^  0      FIRST_COOKIE    DEFAULT    ntDomain.primaryServer    ntDomain.secondaryServer    ntDomain.tertiaryServer    ntDomain.primaryDomain    ntDomain.secondaryDomain    ntDomain.tertiaryDomain    ntDomain.timeout    ntDomain.maxRetries    ntDomain.primaryAdminAccount    ntDomain.primaryAdminPassword    ntDomain.primaryServerHostName    ntDomain.secondaryAdminAccount     ntDomain.secondaryAdminPassword !   ntDomain.secondaryServerHostName    ntDomain.tertiaryAdminAccount    ntDomain.tertiaryAdminPassword     ntDomain.tertiaryServerHostName     util    appendDebugOut    Set : Invalid Cookie    BAD_PARAMETER    ACCESS_LEVEL         5   Detected Unauthorized access for page ntdomainServer    UNAUTHORIZED 	   HIGH_SEC    HIGH    db 	   getTable    sslVpnExAuthTable    pairs    getAttribute    _ROWID_ 
   attribute 	   authType 	   ntdomain    NTDOMAIN_SERVER_SSLPORTAL_CONF    start    cookie 
   serverSet    SUCCESS 6   Error in configuring values in page NT Domain Server     abort 	   complete    save                             F @ @ΐ   ΐ@Α  @    @A     Aΐ    ή         ntDomain.cookie     util    appendDebugOut    GetNext : Invalid Cookie    BAD_PARAMETER    NOT_SUPPORTED                     $  4      F @ @ΐ   ΐ@Α  @    @A     Aΐ    ή         ntDomain.cookie     util    appendDebugOut    GetNext : Invalid Cookie    BAD_PARAMETER    NOT_SUPPORTED                     :  Q           @ J     I  I I  I I  I I  I I  I   ΐ           SUCCESS    ntDomain.cookie    FIRST_COOKIE    ntDomain.profile    DEFAULT    ntDomain.primaryServer    SERVER1    ntDomain.secondaryServer    SERVER2    ntDomain.tertiaryServer    SERVER3    ntDomain.primaryDomain    DOMAIN1    ntDomain.secondaryDomain    DOMAIN2    ntDomain.tertiaryDomain    DOMAIN3    ntDomain.timeout    TIMEOUT    ntDomain.maxRetries    RETRIES                     Y  l      D   F ΐ    \ΐ Δ  Ζ@ΐWΐ  Δ  Ζΐή  ΐ    ή         getCheckNow    SUCCESS    FAILURE                     u            @ΐ     ΐ A@W   @   @        serverCheckConfig    SUCCESS    FAILURE                             