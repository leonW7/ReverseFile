LuaQ                L      A@  @    A�  @ 
   J   �   ��   EA ��E� F��� ��  �  \�  �@ �I�@@ �� ����!�  @�$    � dA      GA d�  ��        �    B A� ��B�B A� � B�B A ��B��@  @��@   @�B�   � �� �CB� B � DB� �@ B� � �B A� B  �       require    teamf1lualib/pkgMgmt    teamf1lualib/db       �?   ipairs    arg    string    sub    -    commandAdd    update    install    remove    -d    pkgMgmt    logStdoutEnable    pkgdbConnect    print �   
Commands: 
   update - Retrieve new lists of packages 
   install - Install new packages (pkg is libc6 not libc6.deb) 
   remove - Remove packages 
 
Options: 
  -d    show log messages on console 
  --download-only  
        Download only - do NOT install or unpack archives 
  --no-upgrade 
        Do not upgrade packages if already installed; used with install command. 
  --reinstall 
        Re-Install packages that are already installed and at the newest version. 
                   c    �    � @��@  ��@��   @  �A �B  �� @  Z   @��   ��A�A@��  �@B�    � ����B@ ��� �  C � Z   @��   ��B�A@ ��  �  �@ Z     ���� �@  ��� A �  �A U���  ܀ W �� ��@D@� �DE� � �  B �A�  � ��@� �DE� �� �   �A��  ���CE FA�� � \��@���E F���� ��   A� �  � ���\A�A ^ F��FA�W �@�F��FA�W��@�E F�����A \��G� EA �� \@���� @��� ��Dł � @ �	 �  ��B��� � a�  ��E FA����\� ��  �^ �  Ɓ��� ���	 � A
 �  �B
 U�A�� � � Ɓ�  ܁ W����� Ɓ� @  B�A �� �  � -       db    getRowWhere    pkgInstalled 
   Package='    '    --reinstall       �?   pkgMgmt    remove    error    --no-upgrade    ok    0.0.0    Version    getRowsWhere    pkgMgmtRepo            log    INFO 	   package  (    not in repo. not installing/upgrading.    ERROR 
   package       found in multiple repos.    compareVersion    latest version      of package      already instealled.    Depends        dependencies    checkDependencies    pairs    package    unmet dependency      while installing  	   download    --download-only    pgkMgmtLog    skip installing  %    as --download-only option specified    install 
   Installed    failed installing                      f   h       �   �@   �                         j   l            @@  �     �       pkgMgmt    update                     n   t           D     ����� �D� � \A !�   � �       ipairs       �?                    v   �     :      E@  F�� ��  �   \���  �@   � �
���@
�B @� ��F�A@���E FC���� \������E F��� �C  ���\C����� @  ���� ��!�  �� A � �BA� B @� �B@  � U��B �  @� �           db 	   getTable    pkgInstalled            ipairs       �?   Package    pkgMgmt    remove    error    log    ERROR    failed in removing package          no package removed. 	   removed.                             