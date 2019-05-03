/*
 * File: teredoTunnel.js
 */
/**
 * This function calls at the time of page loads
 * OnLoad validation
 * @method 
 */
$(document).ready(function(){  
	onloadCall (enableDisableFieldsByImageClick, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});

	enableTextFieldByAnchorClick('tf1_teredoTunnelStatus','tf1_primServer tf1_secServer','primServer_break secServer_break');
});

function enableDisableFieldsByImageClick(data, thisObj){
    onAnchorToggle(data);
    var imgId=thisObj.id;
    
    switch(imgId){
    
        case 'tf1_teredoTunnelStatus':
    		enableTextFieldByAnchorClick(imgId,'tf1_primServer tf1_secServer','primServer_break secServer_break');
    	break;
    }
}

/*
 * This function should call while click on cancel button 
 * */
 function teredoTunnelOnreset(){
      resetImgOnOff('tf1_frmteredoTunnel');
      enableTextFieldByAnchorClick('tf1_teredoTunnelStatus','tf1_primServer tf1_secServer','primServer_break secServer_break');
 }

/*
 * This function should call while click on Save button 
 * */

function pageValidate (frmId)
    {

        var txtFieldIdArr = new Array();
        txtFieldIdArr[0] = "tf1_primServer, Please enter a valid Server Name.";

        if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;

        setHiddenChks(frmId);
    
        return true;
    }

