LuaQ                 �      A@  @    A�  @    A�  @    A  @ � @   � @ �B �B A  � E@ F�� F�� �@ \� � �� @  �� �A �� U���B ��D��   ����  ��� E�B �B�� A� � � ܂�� ��B   A� �A��� ��  ܂ @� ��� �B   A� �A�� � �� �B�� A� ܂���C	 C����C���C	 C����	 C���C	 C� EC F���
 �C
 �
 \� @����J@�K�� \C�K��C	 \C�E� F�� \� @���A� �� U��GC E FC��� �� � \C  �E FC�� �� \����D �����AD	 �C���@ �C�˃��C ˃��C �C   A� �C� @ �� �E FD��D �� \������D �� ��N	� E ��	�D � �DH	��� ���� � A� � �E � A� � �F � A� � �G �ć	I	��	E�I	�E	 E� EH
AE �� ��KM
�E \���I	 �
�E��I	F	 �E���M
�E ��M	�E �� ��N�� � ���E � ��R��  �E� � L      require    teamf1lualib/web    teamf1lualib/db    x509Lib    teamf1lualib/util    DEFAULT_CONFIG_FILE    client_config.ovpn    CLIENT_CONFIG_FILE    /var/certs/client_config.ovpn    SAPI    Request    servervariable    REMOTE_ADDR    SERVER_ADDR    ipaddr = '    ' AND loginState = 'LOGGED_IN'    remote     db    getRowWhere    OpenvpnSession    OpenvpnSession.username    getAttribute    Users 	   UserName 	   Password    /var/certs/openvpn/    .ovpn    util    fileExists     client    _config.ovpn    io    open    /var/certs/openvpn/tmp.ovpn    w+    write    
 	   dev tun1    getRow    OpenVpn    _ROWID_    1    OpenVpn.userAuthSupportEnable    auth-user-pass    statusMessage 1   Please request administrator to generate Client     Configuration    web 	   goToPage    OmniSSLPortalLogin    r    read    *all    close    _config.sh        /var/certs/openvpn/tmp.sh    os    execute 6   awk '{print "### " $0;}' /var/certs/openvpn/tmp.ovpn     > /var/certs/openvpn/tmp.sh *   
sed -n '/###/p' $0 >> client_config.ovpn ;   
sed -n '/grep/!p' client_config.ovpn > configuration.ovpn :   
sed -n '/sed/!p' configuration.ovpn > client_config.ovpn @   
sed 's/### //' client_config.ovpn > openvpn_client_config.ovpn    
sudo rm -f configuration.ovpn    
sudo rm -f client_config.ovpn    
sudo apt-get install openvpn    
if [ $? -ne 0 ]    
then    
sudo yum install openvpn    
fi 2   
sudo openvpn --config openvpn_client_config.ovpn     rm -f /var/certs/openvpn/tmp.sh 	   download                 