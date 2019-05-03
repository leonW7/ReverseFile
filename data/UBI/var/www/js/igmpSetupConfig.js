/*
 * File: igmpSetupConfig.js
 * TeamF1 Inc, 2014
 * Created on 17th March 2014 - Rama Krishna PM
 */
/****
 * validate the form
 * @method pageValidate
 */
$(document).ready(function() {
        
		enableTextFieldByAnchorClick('tf1_igmpStatus','tf1_selUpstreamWan1 tf1_selUpstreamWan2','break_selUpstreamWan1 break_selUpstreamWan2');
                onloadCall(setIgmpFields, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
		igmpEnable ('tf1_igmpStatus');       

            });
/*
 * Cancel button functionality
 */
function igmpOnReset (frmId)
    {
    resetImgOnOff(frmId);
    enableTextFieldByAnchorClick('tf1_igmpStatus','tf1_selUpstreamWan1 tf1_selUpstreamWan2','break_selUpstreamWan1 break_selUpstreamWan2');
    igmpEnable ('tf1_igmpStatus'); 
    }
function setIgmpFields(data, thisObj){
    var imgId= thisObj.id;
    switch (imgId) {
        case 'tf1_igmpStatus': 
        	enableTextFieldByAnchorClick('tf1_igmpStatus','tf1_selUpstreamWan1 tf1_selUpstreamWan2','break_selUpstreamWan1 break_selUpstreamWan2');
		igmpEnable ('tf1_igmpStatus');       
            break;
	}
}
function igmpEnable (fieldId)
    {
    var imgObjVal = document.getElementById(fieldId).className;
    var imageName = imgObjVal.substring (imgObjVal.lastIndexOf ('/') + 1);
    var wanModeObj = document.getElementById('hdwanMode');
    var wanMode = wanModeObj.value;
    var logicalIfNameObj = document.getElementById('hdlogicalIfName');
    var logicalIfNameVal = logicalIfNameObj.value;
    var dualAccessObj = document.getElementById('hddualAccess');
    var dualAccVal = dualAccessObj.value;
    var priDualAccObj = document.getElementById('hddualAccPri');
    var priDualAcc = priDualAccObj.value;
    var secDualAccObj = document.getElementById('hddualAccSec');
    var secDualAcc = secDualAccObj.value;
    var failoverLogicalPriObj = document.getElementById('hdfailoverLogicalPri');
    var failoverLogicalPri = failoverLogicalPriObj.value;
    var failoverLogicalSecObj = document.getElementById('hdfailoverLogicalSec');
    var failoverLogicalSec = failoverLogicalSecObj.value;
    var conTypeObj = document.getElementById('hdconType');
    var conTypeVal = conTypeObj.value;
    var conTypePriObj = document.getElementById('hdconTypePri');
    var conTypePriVal = conTypePriObj.value;
    var conTypeSecObj = document.getElementById('hdconTypeSec');
    var conTypeSecVal = conTypeSecObj.value;

        
        var selWan1Obj = document.getElementById('tf1_selUpstreamWan1');
        if (selWan1Obj) {
            while(selWan1Obj.options.length != 0)
                selWan1Obj.options[0]=null;
        }

        var selWan2Obj = document.getElementById('tf1_selUpstreamWan2');
        if (selWan2Obj) {
            while(selWan2Obj.options.length != 0)
                selWan2Obj.options[0]=null;
        }

        var unitName = document.getElementById('hdUnitName').value;
        if (unitName == 'DSR-250N' || unitName == 'DSR-250' || unitName == 'DSR-150N' || unitName == 'DSR-150')
            {
                wanDhcp = "WAN-DHCP"
                wanPptp = "WAN-PPTP"
                wanL2tp = "WAN-L2TP"
            }
        else
            {
                wanDhcp = "WAN1-DHCP"
                wanPptp = "WAN1-PPTP"
                wanL2tp = "WAN1-L2TP"
            }

        if (imageName == ON_ANCHOR)
        {
            if (wanMode == '0')
                {
                    if (logicalIfNameVal == 'WAN1')
                        {
                            if (dualAccVal == '1')
                                {
                                    fieldStateChangeWr ('tf1_selUpstreamWan2','','tf1_selUpstreamWan1','');
				                    vidualDisplay('tf1_selUpstreamWan1', 'configRow');
                				    vidualDisplay('break_selUpstreamWan1', 'break');
				                    vidualDisplay('tf1_selUpstreamWan2 break_selUpstreamWan2', 'hide');
                                    selWan1Obj.options[0] = new Option (wanDhcp, "0", false, false);
                                    
                                    if (conTypeVal == 'pptp')
                                        {
                                            selWan1Obj.options[1] = new Option (wanPptp, "1", false, false);
                                        }
                                    else if (conTypeVal == 'l2tp')
                                        {
                                            selWan1Obj.options[1] = new Option (wanL2tp, "2", false, false);
                                        }
                                    optionValueSelect ('tf1_selUpstreamWan1', 'hdselUpstreamWan1');
                                    //upstreamWanOne ();
                                }
                            else
				                {
                                    fieldStateChangeWr ('tf1_selUpstreamWan1 tf1_selUpstreamWan2','','','');
                				    vidualDisplay('tf1_selUpstreamWan1 tf1_selUpstreamWan2 break_selUpstreamWan1 break_selUpstreamWan2', 'hide');
				                }
                        } // end logicalIfNameVal as WAN1
                    else if (logicalIfNameVal == 'WAN2')
                        {
                            if (dualAccVal == '1')
                                {
                                    fieldStateChangeWr ('tf1_selUpstreamWan1','','tf1_selUpstreamWan2','');
				                    vidualDisplay('tf1_selUpstreamWan1 break_selUpstreamWan1', 'hide');
                				    vidualDisplay('tf1_selUpstreamWan2', 'configRow');
				                    vidualDisplay('break_selUpstreamWan2', 'break');
                                    selWan2Obj.options[0] = new Option ("WAN2-DHCP", "0", false, false);
                                    if (conTypeVal == 'pptp')
                                        {
                                            selWan2Obj.options[1] = new Option ("WAN2-PPTP", "1", false, false);
                                        }
                                    else if (conTypeVal == 'l2tp')
                                        {
                                            selWan2Obj.options[1] = new Option ("WAN2-L2TP", "2", false, false);
                                        }
                                    optionValueSelect ('tf1_selUpstreamWan2', 'hdselUpstreamWan2');
                                    //upstreamWanTwo ();
                                }
                            else
				                {
                                    fieldStateChangeWr ('tf1_selUpstreamWan1 tf1_selUpstreamWan2','','','');
                				    vidualDisplay('tf1_selUpstreamWan1 tf1_selUpstreamWan2 break_selUpstreamWan1 break_selUpstreamWan2', 'hide');
				                }
                        } // end logicalIfNameVal as WAN2
                    else
			            {
                            fieldStateChangeWr ('tf1_selUpstreamWan1 tf1_selUpstreamWan2','','','');
            			    vidualDisplay('tf1_selUpstreamWan1 tf1_selUpstreamWan2 break_selUpstreamWan1 break_selUpstreamWan2', 'hide');
			            } // end logicalIfNameVal nither WAN1 nor WAN2
                } // wanMode as 0 is end here
            else if (wanMode == '2')
                {
                    if (((failoverLogicalPri == 'WAN1' && priDualAcc == '1') && (failoverLogicalSec == 'WAN2' && secDualAcc == '1')) || ((failoverLogicalPri == 'WAN2' && priDualAcc == '1') && (failoverLogicalSec == 'WAN1' && secDualAcc == '1')))
                        {  
                            fieldStateChangeWr ('','','tf1_selUpstreamWan1 tf1_selUpstreamWan2','');
			                vidualDisplay('tf1_selUpstreamWan1 tf1_selUpstreamWan1', 'configRow');
            			    vidualDisplay('break_selUpstreamWan1 break_selUpstreamWan2', 'break');
 
                   
                            selWan1Obj.options[0] = new Option (wanDhcp, "0", false, false);
                            selWan2Obj.options[0] = new Option ("WAN2-DHCP", "0", false, false);
                            if (((failoverLogicalPri == 'WAN1' && priDualAcc == '1') && (failoverLogicalSec == 'WAN2' && secDualAcc == '1')))
                                {
                                switch (conTypePriVal)
                                {
                                    case 'pptp':
                                        selWan1Obj.options[1] = new Option (wanPptp, "1", false, false);
                                        break;
                                    case 'l2tp':
                                        selWan1Obj.options[1] = new Option (wanL2tp, "2", false, false);
                                        break;
                                }
                                switch (conTypeSecVal)
                                {
                                    case 'pptp':
                                        selWan2Obj.options[1] = new Option ("WAN2-PPTP", "1", false, false);
                                        break;
                                    case 'l2tp':
                                        selWan2Obj.options[1] = new Option ("WAN2-L2TP", "2", false, false);
                                        break;
                                }
                            }
                            else{
                                
                                switch (conTypePriVal)
                                {
                                    case 'pptp':
                                        selWan2Obj.options[1] = new Option ("WAN2-PPTP", "1", false, false);
                                        break;
                                    case 'l2tp':
                                        selWan2Obj.options[1] = new Option ("WAN2-L2TP", "2", false, false);
                                        break;
                                }
                                switch (conTypeSecVal)
                                {
                                    case 'pptp':
                                        selWan1Obj.options[1] = new Option (wanPptp, "1", false, false);
                                        break;
                                    case 'l2tp':
                                        selWan1Obj.options[1] = new Option (wanL2tp, "2", false, false)
                                        break;
                                }

                            }            
                            optionValueSelect ('tf1_selUpstreamWan1', 'hdselUpstreamWan1');
                            optionValueSelect ('tf1_selUpstreamWan2', 'hdselUpstreamWan2');
                        }
                    else if ((failoverLogicalPri == 'WAN1' && priDualAcc == '1') || (failoverLogicalSec == 'WAN1' && secDualAcc == '1'))
                        {
                            fieldStateChangeWr ('tf1_selUpstreamWan2','','tf1_selUpstreamWan1','');
		    	            vidualDisplay('tf1_selUpstreamWan1', 'configRow');
		    	            vidualDisplay('break_selUpstreamWan1', 'break');
		    	            vidualDisplay('tf1_selUpstreamWan2 break_selUpstreamWan2', 'hide');

                            selWan1Obj.options[0] = new Option (wanDhcp, "0", false, false);
                            if (conTypePriVal == 'pptp' || conTypeSecVal == 'pptp')
                                {
                                    selWan1Obj.options[1] = new Option (wanPptp, "1", false, false);
                                }
                            else if (conTypePriVal == 'l2tp' || conTypeSecVal == 'l2tp')
                                {
                                    selWan1Obj.options[1] = new Option (wanL2tp, "2", false, false);
                                }
                            optionValueSelect ('tf1_selUpstreamWan1', 'hdselUpstreamWan1');
                            //upstreamWanOne ();
                        }
                    else if ((failoverLogicalPri == 'WAN2' && priDualAcc == '1') || (failoverLogicalSec == 'WAN2' && secDualAcc == '1'))
                        {
                            fieldStateChangeWr ('tf1_selUpstreamWan1','','tf1_selUpstreamWan2','');
		    	            vidualDisplay('tf1_selUpstreamWan1 break_selUpstreamWan1', 'hide');
		    	            vidualDisplay('tf1_selUpstreamWan2', 'configRow');
		    	            vidualDisplay('break_selUpstreamWan2', 'break');

                            selWan2Obj.options[0] = new Option ("WAN2-DHCP", "0", false, false);
                            if (conTypePriVal == 'pptp' || conTypeSecVal == 'pptp')
                                {
                                    selWan2Obj.options[1] = new Option ("WAN2-PPTP", "1", false, false);
                                }
                            else if (conTypePriVal == 'l2tp' || conTypeSecVal == 'l2tp')
                                {
                                    selWan2Obj.options[1] = new Option ("WAN2-L2TP", "2", false, false);
                                }
                            optionValueSelect ('tf1_selUpstreamWan2', 'hdselUpstreamWan2');
                            //upstreamWanTwo ();
                        }
                    else
			            {
                            fieldStateChangeWr ('tf1_selUpstreamWan1 tf1_selUpstreamWan2','','','');
		    	            vidualDisplay('tf1_selUpstreamWan1 tf1_selUpstreamWan2 break_selUpstreamWan1 break_selUpstreamWan2', 'hide');
			            }
                }// wanMode as 2 is end here
            else
                {
                    fieldStateChangeWr ('tf1_selUpstreamWan1 tf1_selUpstreamWan2','','','');
		            vidualDisplay('tf1_selUpstreamWan1 tf1_selUpstreamWan2 break_selUpstreamWan1 break_selUpstreamWan2', 'hide');
                }
        } // ON_ANCHOR end here
    else
        {
            fieldStateChangeWr ('tf1_selUpstreamWan1 tf1_selUpstreamWan2','','','');
	        vidualDisplay('tf1_selUpstreamWan1 tf1_selUpstreamWan2 break_selUpstreamWan1 break_selUpstreamWan2', 'hide');
        }
    }
