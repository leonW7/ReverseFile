LuaQ                (�      A@  @    A�  @    A�  @    A  @ � @ �  B @B A� � E� F � F@� �� \� � � @  �B �A� �� �� U� �BD��   ����  ����D� ��C A� � �� ܂�� ��   AC �A�ł ���  ܂  � ��@ �   AC �A���   A� A��� ��C A� ܂����	 C�����C����	 C����C	 C����	 C� E F����	 �
 D
 \� @���@J@�K����
 \C�K���	 \C�K�\C E� F��� \�  ���A� �� U��GC E FC��� �� � \C ��E� F��C � � �\C A � �� UÃ�� � � ��� �� �A ܃�� MAD �� U��D � A �D � � A� � �D � @ �� U��� �D � A	 �� � 	 AF � �� 	 A� �� � H A� �� � I A� �		 �� ��		���@ �D����A	 �D����@ 	�D����A	 �D����D �� ��	 @��� �
�D �� ��	 �AE ܄���	���@��D����D �� ��	� �D �� ��	� �D � ��	 �@ �D� � Y      require    teamf1lualib/web    teamf1lualib/db    x509Lib    teamf1lualib/util    DEFAULT_CONFIG_FILE    client_config.ovpn    SAPI    Request    servervariable    REMOTE_ADDR    SERVER_ADDR    ipaddr = '    ' AND loginState = 'LOGGED_IN'    remote         db    getRowWhere    OpenvpnSession    OpenvpnSession.username    getAttribute    Users 	   UserName 	   Password    /var/certs/openvpn/    .ovpn    util    fileExists     client    _config.ovpn    io    open    /var/certs/openvpn/tmp.ovpn    w+    write    
 	   dev tun1    getRow    OpenVpn    _ROWID_    1    OpenVpn.userAuthSupportEnable    auth-user-pass    close    statusMessage 0   Please request administrator to generate Client     Configuration    web 	   goToPage    OmniSSLPortalLogin    os    execute    cat       >> /var/certs/openvpn/tmp.ovpn    _script.bat    w 7   awk '{print "REM1 " $0;}' /var/certs/openvpn/tmp.ovpn     > /var/certs/openvpn/temp.txt 	   cd %~dp0    
findstr /B "REM1" "%~nx0"     > "    _config.ovpn" 	   :ENDFILE    
set P2=.;%PATH% 5   
for %%e in (%PATHEXT%) do @for %%i in (openvpn%%e)      do @if NOT "%%~$P2:i"=="" copy  $   _config.ovpn "%%~$P2:i\..\..\config 
   @echo off    
setlocal enableextensions     disabledelayedexpansion    
set "search=REM1 "    
set "replace="    
set "textFile=    
for /f "delims=" %%i in  !   ('type "%textFile%" ^& break ^>     "%textFile%" ') do (    
 set "line=%%i" "   
 setlocal enabledelayedexpansion &   
set "line=!line:%search%=%replace%!"    
 >>"%textFile%" echo(!line! 
   
endlocal    
 )    
GOTO :ENDFILE #   cat /var/certs/openvpn/temp.txt >>    a+ "   rm -f /var/certs/openvpn/temp.txt "   rm -f /var/certs/openvpn/tmp.ovpn 	   download                 