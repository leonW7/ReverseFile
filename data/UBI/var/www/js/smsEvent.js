function pageValidate ()
    {


            var flag = atleastOneAuthSupport ('tf1_chkEnable tf1_vpnConnects tf1_cpuUtilization');

            if (flag)
                {
                    var txtValidArray = new Array();
                    txtValidArray[0] = "tf1_receiver, "+LANG_LOCALE['12060'];

                    if (txtFieldArrayCheck(txtValidArray) == false) 
                        return false; 
            
                    if (chkPhoneNumber('tf1_receiver') == false)
                        return false;
        }


    setHiddenChks('tf1_frmSmsEvent');
    return true;
    }

function chkPhoneNumber(fldId){
	var phno = $("#"+fldId).val ();	
	if((phno.length < 11) || (phno.length > 12))
          {
		  alert(LANG_LOCALE['30608']);
		  $("#"+fldId).focus();
		  return false;
	   }
      else
          {
		return true;
	    }
}
