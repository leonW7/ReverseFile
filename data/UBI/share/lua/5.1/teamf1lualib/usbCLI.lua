LuaQ                /      A@  @    A�  @    A�  @    A  @ @ J   I�A�I���I@B�I�B��   �  �� �   A ܀ $  � $A  � $�   $�        �    A $ � $A � $�  $�       �   �A  �       require    teamf1lualib/usb    teamf1lualib/returnCodes    teamf1lualib/util    teamf1lualib/usb_status    environment    name    value    usb1Status    USB_STATUS_FILE1    usb2Status    USB_STATUS_FILE2    com.teamf1.core.returnCodes    com.teamf1.core.usb.status    usb1CfgInit    usb1CfgSave    usb1CfgInputVal 
   usbCfgGet    usb2CfgInit    usb2CfgSave    usb2CfgInputVal    usbcfgUnmount        !   -        E@  F�� ��  �  A \� G   E   �� � �J   G   E   I E   F�� G@ E@ �   ^ � � 
   
   configRow    db    getRow    USB    usbNum    0     USB._ROWID_    -1    configRowId                     2   F     6   A@  G   A@  G�  A@  G�  A@ G  F�A �� @�	@B���B @B  �	 Å�@ ��C�    � A� �� ǀ  �   ���@ ��C�    � A �� ǀ  �   �   @D� ��� ��D�@� �� � E�@ � E�  �� ����@    ���  ��  �   ��  � � �    
   errorFlag        statusCode    statusMessage    DBTable    USB    USB._ROWID_    -1    USB.usbNum    0    USB.USBStatus    USB.USBType    4    usb 
   usbConfig    add    edit    OK    db    save    getAttribute    stringsMap 	   stringId 	   LANGUAGE                     L   u     Z   F @ @� @�F�@ @� ��E�  �  \@ J   G@ B   ^  E� F � �@ �� \��G� E� ��  �E�  �  \@ B   ^  E� K�� �� \��G@ F @ @� ��E  F@� �@ �� \����  �E�  �� \@ B   ^  F�@ @� ��E  F@� �@ �  \����  �E�  �@ \@ B   ^  F�E W�� � �F�E ��  �E�  �  \@ B   ^  F�E @� ��F@F W�� � �F@F ��  �E�  �� \@ B   ^  B � ^   �       USB.StorageServer    1    USB.PrintServer    printCLIError -   Cant enable both Storage and Printer at once    __CLISH_EDIT_CONFIG_ROW    file1    io    open    /var/usb1Info    r     No Devices connected to usb    fileContent    read    *line    string    find    storage &   USB connected is not a storage device    Printer &   USB connected is not a printer device    USB.USBStatus        Enter Valid Enable Value    USB.USBType    Enter Valid USB Type                     z   �     9  
   A   �@  �@  A  AA  ��  ��  ��  D� FB��� ��A�� ���܁��  AD  �� �BA�� ��� �A��E�  F��B �� � AC \��W � ��B W�C@�W����� �BD���� �   �� ��D���� �� � �BEł � A� �� �� �  F ��B ��F��  ���ł @�� �A� A�  �ł W@�@�A A� �  @��BHA� ܂��B    ���  �H@��	 ��W�C��T @��� �� FƀI�IA 
 KCJ\C W�C��W��@�W�C� �W��@ ��� � �� Ƃ�� ��
 �K�  C @� �B ��
 �K�  � @ �B ��
 �K�  � @��B ��
 �K�   @ �B ��
 �K�  C @��B �� �� �B ��
 �M�  �  �B���  �A�B � A� �C ���W@M��W�M �W�M��W N �W C� ��B @��"��    AC  �C  �C  D  A�  ��  �A	�  � EA
D� F�
�� ��A���W�C	��� �D�	  	܄ �   �� ���	  	܄ Ǆ � �D�	� A� �� ܄ Ǆ A  ����D Ƅ�	� A ܄�� @G
� �� � ��� W@G
 � � �   �E�	�� ��E    �� E F��
� 
�	 \��W��
@���
���� �F�
���
���
�E�	�E W����W�C@�W��� �W�C@ ��C� � �J
 ��
 ��	 �AE � �D ��
 ��	 �A� ���D ��
 ��	 �A� � �D ��
 ��	 �A ���D ��
 ��	 �AE � �D W C� ��D ��	� �ń � �D � �ń  �D ��
 ��	 �A�  �D� � =      DISCONNECTED    NA            db    getAttribute    name    usb1Status    value    usb2Status    system    _ROWID_    1 
   DSR-500AC    PRODUCT_ID    DSR-500_Bx     util    fileExists    usbStatus1    fileToString    string    gsub    
           �?   io    open    /var/usb1Info    r    0 
   Unmounted 
   Connected    mounted    read    *all    split    :       @       @      @
   CONNECTED    close    FAILURE    resTab    insertField    USB Connection status    USB Vendor 
   USB Model 	   USB Type    usb Mount status    printLabel    USB1 Status    print 
   DSR-1000N 	   DSR-1000 	   DWC-1000    DSR-1000AC    DSR_500_Bx    usbStatus2    /var/usb2Info    USB2 Status                     �          E@  F�� ��  �  A \� G   E   �� � �J   G   E   I E   F�� G@ E@ �   ^ � � 
   
   configRow    db    getRow    USB    usbNum    1     USB._ROWID_    -1    configRowId                           6   A@  G   A@  G�  A@  G�  A@ G  F�A �� @�	@B���B �B  �	@C��� ��C�    � A �� ǀ  �   ���� ��C�    � AA �� ǀ  �   �   �D� ��� � E�@� �� �@E�� � E�  � ����@    ���  ��  �   ��  � � �    
   errorFlag        statusCode    statusMessage    DBTable    USB    USB._ROWID_    -1    USB.usbNum    1    USB.USBStatus    0    USB.USBType    4    usb 
   usbConfig    add    edit    OK    db    save    getAttribute    stringsMap 	   stringId 	   LANGUAGE                        G    Z   F @ @� @�F�@ @� ��E�  �  \@ J   G@ B   ^  E� F � �@ �� \��G� E� ��  �E�  �  \@ B   ^  E� K�� �� \��G@ F @ @� ��E  F@� �@ �� \����  �E�  �� \@ B   ^  F�@ @� ��E  F@� �@ �  \����  �E�  �@ \@ B   ^  F�E W�� � �F�E ��  �E�  �  \@ B   ^  F�E @� ��F@F W�� � �F@F ��  �E�  �� \@ B   ^  B � ^   �       USB.StorageServer    1    USB.PrintServer    printCLIError -   Cant enable both Storage and Printer at once    __CLISH_EDIT_CONFIG_ROW    file2    io    open    /var/usb2Info    r     No Devices connected    fileContent    read    *line    string    find    storage &   USB connected is not a storage device    Printer &   USB connected is not a printer device    USB.USBStatus        Enter Valid Enable Value    USB.USBType    Enter Valid USB Type                     I  ~   �    @ ��E@  F�� �   � � ���� AD� FA�\��W�� �
��� � B� � �� �    ��� ��B� � �� �@ �� � C�@ A A� �� �@ �  �� �@ @D@��� �� �@ �   �  ���  � E�   �@ �� �@ �@ � � �   ��� �� �@ �   �  �E ��E@  F�� �  �@ � A�  \��W�� � ��  @G� ��� �� @ ��  �� �@  ��@�   � �@D� FA��� �AA���W�A@��� � �  ܀ �    	��� ƀ�  ܀ ǀ �� � �� AA �� ܀ ǀ �  �� ŀ @���ŀ � A� A�@ �   �  ���  � �   �@ ŀ � A	 A�@ � � �  ��ŀ � AA	 A�@ �   �   � &      usb1    db    getAttribute    name    usb1Status    value     util    fileExists    usbStatus1    fileToString    string    gsub    
        usb1StatusFlag       �?   0    print    Usb1 is already unmounted    usbUnmount    Usb1 is Successfully unmounted    Usb1 port is not connected    usb2    system    _ROWID_    1 
   DSR-500AC    PRODUCT_ID    DSR-500_Bx    usbPort    USB1    USB2    usb2Status    usbStatus2     is already unmounted     is Successfully unmounted     port is not connected                             