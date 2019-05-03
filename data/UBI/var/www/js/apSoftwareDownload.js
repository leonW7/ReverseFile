/*
 * File: apSoftwareDownload.js
 * Created on 5th Nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * This function calls when user clicks on Save button
 * On Submit validation
 * @method validateAccessPointSoftwareDownload
 */
function validateAccessPointSoftwareDownload(){

    var txtFieldIdArr = new Array();
    
    txtFieldIdArr[0] = "tf1_txtIpAddr,Please enter valid Server Address.";
    
    var selValue = comboSelectedValueGet ('tf1_imageDownloadType');
	if (!selValue) return;	
	switch (parseInt(selValue, 10)){
    	case 5:		    
		    txtFieldIdArr[1] = "tf1_txtFilePath1,Please enter a valid File Path.";
		    txtFieldIdArr[2] = "tf1_txtFileName1,Please enter a valid File Name.";
		    txtFieldIdArr[3] = "tf1_txtFilePath2,Please enter a valid File Path.";
		    txtFieldIdArr[4] = "tf1_txtFileName2,Please enter a valid File Name.";
		    txtFieldIdArr[5] = "tf1_txtFilePath3,Please enter a valid File Path.";
		    txtFieldIdArr[6] = "tf1_txtFileName3,Please enter a valid File Name.";
            txtFieldIdArr[7] = "tf1_txtFilePath4,Please enter a valid File Path.";
		    txtFieldIdArr[8] = "tf1_txtFileName4,Please enter a valid File Name.";
		    txtFieldIdArr[9] = "tf1_txtGroupSize,Please enter a valid Group Size.";
		break;
		case 1: /* Img_dwl8600 */
			txtFieldIdArr[1] = "tf1_txtFilePath1,Please enter a valid File Path.";
		    txtFieldIdArr[2] = "tf1_txtFileName1,Please enter a valid File Name.";
		    txtFieldIdArr[3] = "tf1_txtGroupSize,Please enter a valid Group Size.";
		break;
		case 2: /* Img_dwl6600/Img_dwl3600 */
			txtFieldIdArr[1] = "tf1_txtFilePath2,Please enter a valid File Path.";
		    txtFieldIdArr[2] = "tf1_txtFileName2,Please enter a valid File Name.";
		    txtFieldIdArr[3] = "tf1_txtGroupSize,Please enter a valid Group Size.";
		break;
		case 3: /* Img_dwl2600 */
			txtFieldIdArr[1] = "tf1_txtFilePath3,Please enter a valid File Path.";
		    txtFieldIdArr[2] = "tf1_txtFileName3,Please enter a valid File Name.";
		    txtFieldIdArr[3] = "tf1_txtGroupSize,Please enter a valid Group Size.";
		break;
        case 4: /* Img_dwl8610 */
			txtFieldIdArr[1] = "tf1_txtFilePath4,Please enter a valid File Path.";
		    txtFieldIdArr[2] = "tf1_txtFileName4,Please enter a valid File Name.";
		    txtFieldIdArr[3] = "tf1_txtGroupSize,Please enter a valid Group Size.";
		break;
		
	}
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
    if (isProblemCharArrayCheck(txtFieldIdArr, '\'" ', NOT_SUPPORTED) == false) 
        return false;
    
    if (ipv4Validate('tf1_txtIpAddr', 'IP', false, true, "Invalid Server Address.", "for octet ", true) == false) 
        return false;
    
    var grpSizeObj = document.getElementById('tf1_txtGroupSize');
    if (numericValueRangeCheck(grpSizeObj, '', '', 1, 6, true, 'Invalid Group Size.', '') == false) 
        return false;
    
    return true;
    
}

