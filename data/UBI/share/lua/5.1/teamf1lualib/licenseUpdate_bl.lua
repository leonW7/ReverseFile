LuaQ                k      A@    ΐ@@  A@ @   A @   Aΐ @   A  @   A@ @   A @   Aΐ @   A  @   A@ @   A  E  ΐ \   Α   Ε  A ά  A  J  GΑ EΑ   IEΑ FΕIΕEΑ FΕIΖEΑ FΕIΖEΑ FΕIΗEΑ FΕIΗEΑ FΕIΘEΑ FΕIΘA	 GΑ A	 GA	 A
 GΑ	 EΑ IΖd        G
 dA        GΑ
 d                 G dΑ               GA d       G   /      module    com.teamf1.bl.admin.license    package    seeall    require    teamf1lualib/db    teamf1lualib/util    teamf1lualib/validations    teamf1lualib/returnCodes    teamf1lualib/admin_license    teamf1lualib/management_config    teamf1lualib/lm_returnCodes    teamf1lualib/system_time    loginLuaLib    com.teamf1.core.lm.returnCodes    com.teamf1.core.returnCodes    com.teamf1.core.admin.license    com.teamf1.core.config    com.teamf1.core.system.time    lmDef    activation    failure            success       π?   no_ntp        @   no_ips       @   invalid_params       @   license_present       @   license_expired       @   freeTrialFile    /flash/tmp/lm/freeTrial    freeTrialTimeFile    /flash/tmp/lm/freeTrialTime    activationFile    /flash/tmp/lm/activation_keys 	   activate    licenseInfoSectionGet    licenseInfoSectionGetNext    licenseCodeSet    freeTriallicenseCodeSet    licenseListsGet        E   Y     
   D  Fΐ\  ΐ   @    D FAΐW@     @   ΐ  @ ^         licenseInfoGet    SUCCESS                     a       "   F @    @@   ΐ@Α  @    @A    Δ ΖΑ  ά@  ΐ   Δ  ΖΑΑWΐ    ΐ  @ ΐ ή         licenseUpdate.cookie    NIL    util    appendDebugOut    GetNext : Invalid Cookie    BAD_PARAMETER    licenseInfoGetNext    SUCCESS                        Ψ    
   E   W@ΐ E  Fΐΐ   \@ D   F@Α ^  FA ΐ Δ   Ζ Βΐ Ε  ΖΐΐA ά@ Δ   ΖΒή  Δ  ΖΐΒά   CW   AC CA  EΑ FΔA Α \Z   ΑΔ   W@EWE Α FΑA  AΒ A   G  ΑGΕ   ΑΗ A A HΑHΕ ΐΐIA AIA Α FΑ	  AΒ A  ΑI  A HJΕ ΐ@Α FΑA
 
 AΒ A  ΑJ  A HKΕ ΐΐ  AK A HKΕ ΐΐ  ΑK  A HLΕ ΐ@Α FΑA  AΒ A  L  A HΑLΕ ΐ  M A Ε   5      ACCESS_LEVEL            util    appendDebugOut 4   Detected Unauthorized access for page licenseUpdate    UNAUTHORIZED    licenseUpdate.activationKey    1    NIL    GetNext : Invalid Cookie    BAD_PARAMETER    isNtpDefaultEnabled    TRUE '   ACTIVATION_NTP_DEFAULT_ENABLE_REQUIRED    start    io    open    /flash/tmp/lm/activation_keys    r    read    *line         loginLuaLib    luaLogEventHandler    License already exists       @	   PLATFORM    LICENSES_EXISTING    returnCode    rc    activationCodeSet    cookie    lmDef    activation    success 	   complete    save P   Activated successfully, please reboot the device for the license to take effect    ACTIVATION_CODE_SUCCEEDED    failure    License activation failed       @   ACTIVATION_CODE_FAILED    no_ntp    ACTIVATION_NTP_ENABLE_REQUIRED    no_ips    ACTIVATION_IPS_LIC_REQUIRED    license_present +   License is already activated in the system    ACTIVATION_LIC_ACT_ALREADY    license_expired    ACTIVATION_LICENSE_EXPIRED                     Ϋ      
H   E   W@ΐ E  Fΐΐ   \@ D   F@Α ^  FA ΐ Δ   Ζ Βΐ Ε  ΖΐΐA ά@ Δ   ΖΒή  Δ  ΖΐΒά   CW   AC  E FΑΓ ΑA Β A \Α EΑA  WΐΕ@  F Δ ΖAΖή ΛFάA ΔΖΗB @ άΗΑ ΕΑ   G  Δ ΖΑΗή ΕΑ ή          ACCESS_LEVEL            util    appendDebugOut 4   Detected Unauthorized access for page licenseUpdate    UNAUTHORIZED    licenseUpdate.freeTrial    1    NIL    GetNext : Invalid Cookie    BAD_PARAMETER    isNtpDefaultEnabled    TRUE '   ACTIVATION_NTP_DEFAULT_ENABLE_REQUIRED    db    getAttribute    ntp    _ROWID_    enabled    io    open    /var/timeSynced    r    0     ACTIVATION_NTP_ENABLE_REQUIRED    close    returnCode    freeTrialActivationCodeSet    cookie    SUCCESS    ACTIVATION_CODE_SUCCEEDED                       >    V   J      @  @  Η@        Δ  ΖΐΐWΐ @        @AΕ Α Ε  Ζ@Α AΑ ά   @Ϊ   ΐAΒ WΐB@  C 
E FAΑA ΑΑ \AΒ Ε ΖΑΓά  @  E \ BEB FΔ ΐ  ΒD\  ΐ   E@ @  @@Β ΐ AC @  @ KF\A KΖ\A   EA   ΐ          returnCode    cookie    activatedLicenseGet    SUCCESS    io    open    freeTrialFile    r    activationFile    read    *line         freeTrialTimeFile    os    time 	   tonumber    math    floor      υ@      π?5   Trial version completed. Please activate the License            Just      days remaining in the Trial 	    version    close                             