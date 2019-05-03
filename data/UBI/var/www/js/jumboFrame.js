/*
 * File: jumboFrame.js
 * Created on 31st Oct 2012 - Bala Krishna G
 * Modified on 8th Nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/**
 * This function calls when user clicks on Activate Jumbo Frames
 * OnClick validation
 * @method onloadCall
 */
$(document).ready(function(){
 
    onloadCall ();
    $(".enable-disable-on").live('click', function(){
        var proceed = confirm(LANG_LOCALE['50142']);
        if (proceed)
        {
            return true;
        }
        else {
         $("#tf1_jumboFrame").removeClass(OFF_ANCHOR);
		 $("#tf1_jumboFrame").addClass(ON_ANCHOR);
        }
    });
   
});



/****
 * This function calls when User clicks on Submit button
 * OnSubmit Validation
 * @method jumboFrameValidate
 *
 */
function jumboFrameValidate(frmId){
       setHiddenChks(frmId);     
       return true;
}
/*Function reset for cancel button

*/

function jumboFrameOnReset(frmId) {

	resetImgOnOff(frmId);
}
