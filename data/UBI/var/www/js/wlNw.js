/*
Copyright (c) 2009 TeamF1, Inc. (www.TeamF1.com)
All rights reserved.
*/

$(document).ready(function() {	
	onloadCall(radioConfigOnload, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
	pageInit(); 
	wlNwInit ();	
});
function radioConfigOnload(data){
	onAnchorToggle(data);
}

/* Cancel button functionality */
function radioConfigReset() {
    this.tf1_frmradioSettings.reset();
	pageInit();
	wlNwInit();
}

var timerId = null;
function deleteOptions (selObj)
	{
	while(selObj.options.length != 0)
		selObj.options[0]=null;
	}
function updateChannel ()
	{
    var cntIdx = getCountryIndex ();

    var selectedOpFrq = comboSelectedValueGet  ('tf1_selOpFrq');
    if (!selectedOpFrq) return;
    var opFrqValue = selectedOpFrq;

    var selectedChSpacing = comboSelectedValueGet  ('tf1_selChannelWidth');
    if (!selectedChSpacing) return;
    var chSpValue = parseInt (selectedChSpacing, 10);

    var sideBandValue = ""
	if (chSpValue == 20)
		{
    			fieldStateChangeWr ('tf1_selSideBand','','','');
			vidualDisplay('tf1_selSideBand break_selSideBand', 'hide');	
		}
	else
		{
		fieldStateChangeWr ('','','tf1_selSideBand','');
		vidualDisplay('tf1_selSideBand', 'configRow');	
		vidualDisplay('break_selSideBand', 'break');	
	    sideBandValue = comboSelectedValueGet  ('tf1_selSideBand');
	    if (!sideBandValue) return;
	    }

    var chStIdx = 0;
    var chEndIdx = 0;
    var chLst1 = null;
    if (chSpValue == 20)
    	{
    	if (opFrqValue == "b")
			chLst1  = wlNwObjLst[cntIdx].chSp20NgChLst;
	    else if (opFrqValue == "a")
			chLst1  = wlNwObjLst[cntIdx].chSp20NaChLst;
	    }
    else if (chSpValue == 40 || chSpValue == 2040)
    	{
    	if (opFrqValue == "b" && sideBandValue == "Upper")
			chLst1  = wlNwObjLst[cntIdx].chSp40LowNgChLst;
	    else if (opFrqValue == "b" && sideBandValue == "Lower")
			chLst1  = wlNwObjLst[cntIdx].chSp40UpNgChLst;
	    else if (opFrqValue == "a" && sideBandValue == "Upper")
			chLst1  = wlNwObjLst[cntIdx].chSp40LowNaChLst;
	    else if (opFrqValue == "a" && sideBandValue == "Lower")
			chLst1  = wlNwObjLst[cntIdx].chSp40UpNaChLst;
		}

    var chObj = document.getElementById ('tf1_selChannels');
    deleteOptions (chObj);    

    /* updating channels */    
    chObj.options [0] = new Option (chLst[0],0,false, false);
    if (chLst1 != null)
    	{
	    for (var opIdx = 1,chIdx = 0; chIdx < chLst1.length; chIdx++)
        	{
	         if (chLst1[chIdx] < chLst.length)
				 {
		         chObj.options [opIdx] = new Option (chLst[chLst1[chIdx]],chLst1[chIdx],false, false);
		 		 opIdx++;
				 }
	        }
		}
    changeTransmission();
	}
function updateChannelSpacing ()
	{
    cntIdx = getCountryIndex ();
    
    var selectedMode = comboSelectedValueGet ('tf1_selMode');    
    if (!selectedMode) return;
    modeVal = parseInt (selectedMode, 10);
    
    var chSpIdx = wlNwObjLst[cntIdx].chSpSt;
    var chSpEndIdx = wlNwObjLst[cntIdx].chSpEnd;
    if (modeVal == 212992 || modeVal == 196608 || modeVal == 65536 || modeVal == 196607)
    	{
    	chSpIdx = 1;
    	chSpEndIdx = 1;
    	}
    
	if (chSpIdx == 1 && chSpEndIdx == 1) 
		{ }
	else
		{
		var selOpFrq = comboSelectedValueGet  ('tf1_selOpFrq');
    	var lowNg40ChLst = wlNwObjLst[cntIdx].chSp40LowNgChLst;
	    var upNg40ChLst = wlNwObjLst[cntIdx].chSp40UpNgChLst;
	    var lowNa40ChLst = wlNwObjLst[cntIdx].chSp40LowNaChLst;
	    var upNa40ChLst = wlNwObjLst[cntIdx].chSp40UpNaChLst;
	    
	    if (selOpFrq == "b" && lowNg40ChLst.length == 0 && upNg40ChLst.length == 0)
	    	{
	    	//alert ("2GHz - " + lowNg40ChLst.length + " - " + upNg40ChLst.length);
	    	chSpIdx = 1;
	    	chSpEndIdx = 1;
	    	}
	    else if (selOpFrq == "a" && lowNa40ChLst.length == 0 && upNa40ChLst.length == 0)
	    	{
	    	//alert ("5GHz - " + lowNa40ChLst.length + " - " + upNa40ChLst.length);
	    	chSpIdx = 1;
	    	chSpEndIdx = 1;
	    	}
		}

    var chSpObj = document.getElementById ('tf1_selChannelWidth');
    deleteOptions (chSpObj);    
    var opIdx = 0;
	    
    while (chSpIdx <= chSpEndIdx)
    	{ 
         var mdStr = chSpLst[chSpIdx];
         var mdText =  mdStr.substring (mdStr.indexOf(",") + 1);
         var mdValue = mdStr.substring (0, mdStr.indexOf(","));
         chSpObj.options[opIdx] = new Option (mdText, mdValue, false, false);
		 opIdx++;
         chSpIdx++;
    	}

    updateChannel ();	
	}
function updateMode ()
	{
    var cntIdx = getCountryIndex ();
	var ElevenNDisabled = wlNwObjLst[cntIdx].ElevenNDisabled
    var selectedOpFrq = comboSelectedValueGet  ('tf1_selOpFrq');
    if (!selectedOpFrq) return;
    var opFrq = selectedOpFrq;
    
    var mdLst = null;
    if (opFrq == "b")
    	mdLst = modeLst2GHz;
    else
	    mdLst = modeLst5GHz;
	    
    var modeObj = document.getElementById ('tf1_selMode');
    deleteOptions (modeObj);
	for (opIdx = 0; opIdx < mdLst.length; opIdx++)
    	{ 
         var mdStr = modeLst[mdLst[opIdx]];
         var mdText =  mdStr.substring (mdStr.indexOf(",") + 1);
         var mdValue = mdStr.substring (0, mdStr.indexOf(","));
         if (ElevenNDisabled == 1 && (mdValue == 475136 || mdValue == 393216 || mdValue == 131072))
         	{}
         else
	         modeObj.options[opIdx] = new Option (mdText, mdValue, false, false);
    	}	
	updateChannelSpacing ();
	}
function getCountryIndex ()
	{
    var selectedCnt = comboSelectedValueGet  ('tf1_selCountry');
    if (!selectedCnt) return 0;
    var cntIdx = 0;
    for (var i = 0; i < wlNwObjLst.length; i++)
    	{
    	if (wlNwObjLst[i].countryCode == selectedCnt)
    		{
    		cntIdx = i;
    		break;
    		}
    	}
    return cntIdx;
	}
function updateOperationFrequency ()
	{
    var cntIdx = getCountryIndex ();
    var opFrqObj = document.getElementById ('tf1_selOpFrq');
    deleteOptions (opFrqObj);
    var opIdx = 0, opFrqLstIdx = wlNwObjLst[cntIdx].opFrqSt;
    var opFrqEndId = wlNwObjLst[cntIdx].opFrqEnd;
    var modelIdObj = document.getElementById ('tf1_unitName');
    if(modelIdObj)
        {  
        modelIdObjVal = modelIdObj.value;    
        if(modelIdObjVal == 'DSR-500N' || modelIdObjVal == 'DSR-250N' || modelIdObjVal == 'DSR-150N')
            opFrqEndId = opFrqLstIdx;
        }
    while (opFrqLstIdx <= opFrqEndId)
    	{ 
         var mdStr = opFrqLst[opFrqLstIdx];
         var mdText =  mdStr.substring (mdStr.indexOf(",") + 1);
         var mdValue = mdStr.substring (0, mdStr.indexOf(","));
         opFrqObj.options[opIdx] = new Option (mdText, mdValue, false, false);
		 opIdx++;
         opFrqLstIdx++;
    	}
    updateMode ();
	}
function updateCountries ()
	{
    var selectedRegion = comboSelectedValueGet  ('tf1_selRegions');
    if (!selectedRegion) return;
    lstIdx = parseInt (selectedRegion, 10);
    if(lstIdx < 0 || lstIdx > 6)
	return;
    cntStIdx  = parseInt (cntStLst[lstIdx], 10);
    cntEndIdx = parseInt (cntEndLst[lstIdx], 10);
    var cntObj = document.getElementById ('tf1_selCountry');
    deleteOptions (cntObj);
    //cntObj.options [0] = new Option (wlNwObjLst[0].country,0,false, false);
    for (var opIdx = 0, cntLstIdx = cntStIdx; cntLstIdx <= cntEndIdx;cntLstIdx++)
		{
		if(wlNwObjLst[cntLstIdx].opFrqSt == 0) //country must support 2.4GHz
			cntObj.options [opIdx++] = new Option (wlNwObjLst[cntLstIdx].country,wlNwObjLst[cntLstIdx].countryCode,false, false);
		}
    updateOperationFrequency ();
	}
function wlNwInit ()
    {
    var regObj = document.getElementById ('tf1_selRegions');
    for (var opIdx=0; opIdx < regLst.length; ++opIdx)
         regObj.options [opIdx] = new Option (regLst[opIdx],opIdx,false, false);
	selectRegion ();
    updateCountries ();
    optionValueSelect ('tf1_selCountry','hdWlanCountry');
    updateOperationFrequency ();
    optionValueSelect ('tf1_selOpFrq','hdWlanOpFrq');
    updateMode ();
    optionValueSelect ('tf1_selMode','hdWlanMode');
    updateChannelSpacing ()
    optionValueSelect ('tf1_selChannelWidth','hdWlanChannelWidth');
    updateChannel ()   
    optionValueSelect ('tf1_selChannels','hdWlanChannel');
    resetChannelAndMode ();   
    getCurrChannel ();
    }
function selectRegion ()
	{
	var cntCode = document.getElementById ('hdWlanCountry').value;
	if (!cntCode || cntCode == "") return;
	for (var i = 0; i < wlNwObjLst.length; i++)
		{
		if (wlNwObjLst[i].countryCode == cntCode)
			break;
		}
	if (i == wlNwObjLst.length) return;
	for (var j = 0; j < cntStLst.length; j++)
		{
		var lstSt = parseInt(cntStLst[j], 10)
		var lstEnd = parseInt(cntEndLst[j], 10)
		if (i >= lstSt && i <= lstEnd)
			{
			var regObj = document.getElementById ('tf1_selRegions');
			regObj.selectedIndex = j;
			return;
			}
		}
	}
function resetChannelAndMode ()
	{	
       //var channelNum = 0;
        var hdCurrentChnObj = document.getElementById ('hdWlanAutoChannel');
        var unitName = document.getElementById ('tf1_unitName');   
        var hwVersion = document.getElementById ('hdhwVer');  
        var tdCurChanObj = document.getElementById ('tdCurChan');        
        if (hdCurrentChnObj)
            {
            var freq = parseInt(hdCurrentChnObj.value,10);
            if(isNaN (freq))
                {
                tdCurChanObj.innerHTML = hdCurrentChnObj.value;
                }
            else
                {                
                if(unitName.value == "DSR-250N" && (hwVersion.value == "Ax")) 
            	    tdCurChanObj.innerHTML = chLst[freq];
                else
                    {
	                if (freq >= 2412)
	                    {
	                    if (freq == 2484)
	                	    {
	                        var channelNum = 14;
	                        tdCurChanObj.innerHTML = chLst[channelNum];
	                        }
	                    else if (freq < 2484)
	                	    {
	                        var channelNum =  (freq - 2407)/5;
	                        tdCurChanObj.innerHTML = chLst[channelNum];
	                        }
	                    else if (freq < 5000)
	                	    {
	                        var channelNum = 15 + ((freq - 2512) / 20);
	                        tdCurChanObj.innerHTML = chLst[channelNum];
	                        }
	                    else
	                	    {
	                        var channelNum = (freq - 5000) / 5;
	                        tdCurChanObj.innerHTML = chLst[channelNum];
	                        }
	                    }
            	    }
			 }
		    }            
	}
function getCurrentChannel()
	{
	var request;
	try 
		{  // Firefox, Opera 8.0+, Safari
		request=new XMLHttpRequest();
		}
		catch (e)
  			{	// Internet Explorer
			try
				{
			    request=new ActiveXObject("Msxml2.XMLHTTP");
    			}
  				catch (e)
    				{
    				try
						{
						request=new ActiveXObject("Microsoft.XMLHTTP");
						}
						catch (e)
      						{
							window.status = "Your browser does not support AJAX!";
							return false;
      						}
					}
				}
	request.onreadystatechange=function()
		{
		if(request.readyState === 4)
            {
            if (request.status === 200)
                {
			        var hdCurrentChnObj = document.getElementById ('hdWlanAutoChannel');
                    var txPowerValObj = document.getElementById ('txPowerValId');
                    var response = request.responseText;
                    // If the ajax call response is having login page html content, then we should redirect to index page.
                    if (response.search("button.login.Users") != -1)
                        {
                            if ($(".midWidth2 div.msgError p").length > 0 && $(".midWidth2 div.msgError p").html() != '') 
						        {
							        window.location="platform.cgi?page=index.html&redirectStatusMessage="+$(".midWidth2 div.msgError p").html();
                                    return false;
						        }
                            else
                                {
                                    window.location="platform.cgi?page=index.html";
                                    return false;
                                }
                        }
                    var resSplit = response.split("||");
			        hdCurrentChnObj.value = resSplit[0];
                    if (txPowerValObj){
                        if (resSplit[1] && resSplit[1] != "")
                        txPowerValId.innerHTML = resSplit[1]+" dBm";
                    }
			        resetChannelAndMode ();
                }
			}
		}
    request.open("GET","?page=getCurrentChannel.html&time=" + new Date(),true);
	request.send(null);
	}

function getCurrChannel ()
	{
    getCurrentChannel ();
	if (timerId) { clearTimeout(timerId) }
        timerId = setTimeout ("getCurrChannel()", 4000);    
   }

function txPowerValueRangeCheck ()
    {
        var transPwrObj = document.getElementById('tf1_txtDefTransPwr');
        var hdObj = document.getElementById('hdTxPowerMax');
        var maxValue = 31;
        if (hdObj)
            {
                maxValue = parseInt (hdObj.value, 10);
            }
	    if (numericValueRangeCheck (transPwrObj, '', '', 1, maxValue, true, '', " dBm") == false)
            {
                return false;
            }
        return true;
    }

function radioValidate ()
	{
	    if (txPowerValueRangeCheck () == false)
		{
		    return false;
		}
		var vapCount = parseInt(document.getElementById('hdVapWepCount').value,10);
		var nwMode = document.getElementById('tf1_selMode').value;
		if((nwMode == '475136' || nwMode == '131072' || nwMode == '393216') && vapCount > 0)
		   {
		   var mode = ""
		   if(nwMode == '475136')
			   mode = LANG_LOCALE['30077']
		   else if(nwMode == '131072')
			   mode = LANG_LOCALE['30078']
		   else if(nwMode == '393216')
			   mode = LANG_LOCALE['30079']
			   
           var errStr = mode + LANG_LOCALE['30080'] + mode;
               alert (errStr);
		   return false;	
		   } 
		return true
    }
function pageInit ()
	{
	/* pick the correct ISO country code corresponding to atheros country code */
	var cntryobj = document.getElementById ('hdWlanCountry');
	var configuredCountry = document.getElementById ('hdCountry').value;
	
	for (count =0; count < wlNwAthObjLst.length; count++)
		{
		try {
			if (wlNwAthObjLst[count].countryCode == configuredCountry) 
				break;
			} catch (err) {}
		}

	cntryobj.value = wlNwAthObjLst[count].countryISOName;
	}

function changeTransmission ()
    {
        var selectionMode = $('#tf1_selMode').val();//Option Mode value
	    var selectionChannelWidth = $('#tf1_selChannelWidth').val();//Channel Spacing value
        var transMissionRates;
      	var transMissionRateOptions;
        
        if (!selectionMode) return;
        switch (parseInt (selectionMode, 10))
            {
                case 196608:    /* g only */
                case 65536:    /* a only */
                case 196607:  /* b only */
                    if(selectionChannelWidth == "20")
                        {
                            $("#selTransmitRate").find('option').remove();
                            transMissionRates = [{'val':0,'label':'Best(Automatic)'},{'val':11,'label':6},{'val':15,'label':9},{'val':10,'label':12},{'val':14,'label':18},{'val':9,'label':24},{'val':13,'label':36},{'val':8,'label':48},{'val':12,'label':54}];
                        }
                    break;
                case 131072:    /* n only */
                    if(selectionChannelWidth == "20" || selectionChannelWidth == "2040")
                        {
                            $("#selTransmitRate").find('option').remove();
                            transMissionRates =[{'val':0,'label':'Best(Automatic)'},{'val':128,'label':'MCS0'},{'val':129,'label':'MCS1'},{'val':130,'label':'MCS2'},{'val':131,'label':'MCS3'},{'val':132,'label':'MCS4'},{'val':133,'label':'MCS5'},{'val':134,'label':'MCS6'},{'val':135,'label':'MCS7'},{'val':136,'label':'MCS8'},{'val':137,'label':'MCS9'},{'val':138,'label':'MCS10'},{'val':139,'label':'MCS11'},{'val':140,'label':'MCS12'},{'val':141,'label':'MCS13'},{'val':142,'label':'MCS14'},{'val':143,'label':'MCS15'}];
                        }
                    break;                    
                case 212992:    /* g and b */
                    if(selectionChannelWidth == "20")
                        {
                            $("#selTransmitRate").find('option').remove();
                            transMissionRates = [{'val':0,'label':'Best(Automatic)'},{'val':27,'label':1},{'val':26,'label':2},{'val':25,'label':5.5},{'val':11,'label':6},{'val':15,'label':9},{'val':24,'label':11},{'val':10,'label':12},{'val':14,'label':18},{'val':9,'label':24},{'val':13,'label':36},{'val':8,'label':48},{'val':12,'label':54}];
                        }
                    break;
                case 393216:    /* na */
                    if(selectionChannelWidth == "20" || selectionChannelWidth == "2040")
                        {
                            $("#selTransmitRate").find('option').remove();
                            transMissionRates =[{'val':0,'label':'Best(Automatic)'},{'val':11,'label':6},{'val':15,'label':9},{'val':10,'label':12},{'val':14,'label':18},{'val':9,'label':24},{'val':13,'label':36},{'val':8,'label':48},{'val':12,'label':54},{'val':128,'label':'MCS0'},{'val':129,'label':'MCS1'},{'val':130,'label':'MCS2'},{'val':131,'label':'MCS3'},{'val':132,'label':'MCS4'},{'val':133,'label':'MCS5'},{'val':134,'label':'MCS6'},{'val':135,'label':'MCS7'},{'val':136,'label':'MCS8'},{'val':137,'label':'MCS9'},{'val':138,'label':'MCS10'},{'val':139,'label':'MCS11'},{'val':140,'label':'MCS12'},{'val':141,'label':'MCS13'},{'val':142,'label':'MCS14'},{'val':143,'label':'MCS15'}];
                        }
                    break;
                default:    /* ng */
                    if(selectionChannelWidth == "20" || selectionChannelWidth == "2040")
                        {
                            $("#selTransmitRate").find('option').remove();
                            transMissionRates =[{'val':0,'label':'Best(Automatic)'},{'val':11,'label':6},{'val':15,'label':9},{'val':10,'label':12},{'val':14,'label':18},{'val':9,'label':24},{'val':13,'label':36},{'val':8,'label':48},{'val':12,'label':54},{'val':128,'label':'MCS0'},{'val':129,'label':'MCS1'},{'val':130,'label':'MCS2'},{'val':131,'label':'MCS3'},{'val':132,'label':'MCS4'},{'val':133,'label':'MCS5'},{'val':134,'label':'MCS6'},{'val':135,'label':'MCS7'},{'val':136,'label':'MCS8'},{'val':137,'label':'MCS9'},{'val':138,'label':'MCS10'},{'val':139,'label':'MCS11'},{'val':140,'label':'MCS12'},{'val':141,'label':'MCS13'},{'val':142,'label':'MCS14'},{'val':143,'label':'MCS15'}];
                        }
                    break;
            }
        
        if (transMissionRates.length > 0)
            {
                for (var i =0; i < transMissionRates.length; i++)
                    {
                        transMissionRateOptions = transMissionRateOptions + '<option value="' + transMissionRates[i].val + '">' + transMissionRates[i].label + "</option>";
                    }
                $("#selTransmitRate").html(transMissionRateOptions);
            }
        
        $("#selTransmitRate").val($("#tf1_hid_selTransmitRate").val());
    }
