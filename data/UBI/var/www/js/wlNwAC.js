/*
Copyright (c) 2009 TeamF1, Inc. (www.TeamF1.com)
Copyright (c) 2008-2017, TeamF1 Networks Pvt. Ltd. 
(Subsidiary of D-Link India)
Modified History - Changes Committed for 47926 (28Aug2015)
All rights reserved.
*/

$(document).ready(function() {	
	onloadCall(radioConfigOnload, {imageId:'', disableIndividual:'', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
	pageInit(); 
	wlNwInit ();
});
/****
 * cancel click
 * @method radioConfigReset
 */
function radioConfigReset(){
	this.tf1_frmradioSettings.reset();
	pageInit(); 
	wlNwInit ()	;
}
function radioConfigOnload(data){
	onAnchorToggle(data);
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
	if (chSpValue == 20 || chSpValue == 80)
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
    else if (chSpValue == 80)
        {
			chLst1  = wlNwObjLst[cntIdx].chSp80NaChLst;
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
	  var selectedCnt1 = comboSelectedValueGet  ('tf1_selCountry');
     
/* Adding 80 MHZ for 2 modes a/c/n and ac only */
     	 if ( modeVal == 983040 || modeVal == 983041) {
      	/* if chSp80NaChLst list is empty,80MHz list need not be shown starts */
      		if(wlNwObjLst[cntIdx].chSp80NaChLst == "" || wlNwObjLst[cntIdx].chSp80NaChLst == null){
      		}
      		/* if chSp80NaChLst list is empty,80MHz list need not be shown ends */
      		else{
         		var mdStr = chSpLst[3];
         		var mdText =  mdStr.substring (mdStr.indexOf(",") + 1);
         		var mdValue = mdStr.substring (0, mdStr.indexOf(","));
         		chSpObj.options[chSpObj.length] = new Option (mdText, mdValue, false, false);
     		}
      	}
    /* remove 20/40MHz if chSpSt 1 and chSpEnd 1 starts */
	 if(wlNwObjLst[cntIdx].chSpSt == 1 && wlNwObjLst[cntIdx].chSpEnd == 1){	
	 	$("#tf1_selChannelWidth option[value='2040']").remove();
	 }
	 /* remove 20/40MHz if chSpSt 1 and chSpEnd 1 ends */

	 /* if chSpSt 0 and chSpEnd 1 and chSp40LowNaChLst/chSp40UpNaChLst is empty 
	 then  need to hide 20/40 Mhz channel space for mode ng and n only mode for 2.4GHZ starts */
	var selOpFrq11 = comboSelectedValueGet  ('tf1_selOpFrq');
	if(selOpFrq11 == "b"){
	 	if((wlNwObjLst[cntIdx].chSpSt == 0 && wlNwObjLst[cntIdx].chSpEnd == 1) && (wlNwObjLst[cntIdx].chSp40LowNgChLst == "" || wlNwObjLst[cntIdx].chSp40UpNgChLst == "")){	
	 		if(modeVal == 475136 || modeVal == 131072){
	 			$("#tf1_selChannelWidth option[value='2040']").remove();
	 		}
	 	}
	}
	 /* if chSpSt 0 and chSpEnd 1 and chSp40LowNaChLst/chSp40UpNaChLst is empty 
	 then  need to hide 20/40 Mhz channel space for mode ng and n only mode  for 2.4GHZ ends */
	
	/* if chSpSt 0 and chSpEnd 1 and chSp40LowNaChLst/chSp40UpNaChLst is empty 
	 then  need to hide 20/40 Mhz channel space for mode na and n only mode for 5GHZ starts */
	if(selOpFrq == "a"){
	 	if((wlNwObjLst[cntIdx].chSpSt == 0 && wlNwObjLst[cntIdx].chSpEnd == 1) && (wlNwObjLst[cntIdx].chSp40LowNaChLst == "" || wlNwObjLst[cntIdx].chSp40UpNaChLst == "")){	
	 		if(modeVal == 393216 || modeVal == 131072){
	 			$("#tf1_selChannelWidth option[value='2040']").remove();
	 		}
	 	}
	}
	 /* if chSpSt 0 and chSpEnd 1 and chSp40LowNaChLst/chSp40UpNaChLst is empty 
	 then  need to hide 20/40 Mhz channel space for mode na and n only mode  for 5GHZ ends */

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
    var modelIdObj = document.getElementById ('tf1_unitName');
    if(modelIdObj)
        {  
        modelIdObjVal = modelIdObj.value;    
        if (modelIdObjVal == "DSR-500AC")
	{
        if (opFrq == "b")
    	   mdLst = modeLst2GHz;
        else
	   mdLst = modeLst5GHz;
        }
	else
	   mdLst = modeLst2GHz;
    }	    
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
    /* remove n only(131072),na(393216),ac only(983041),a/n/ac(983040)- 5Ghz
    		ng(475136),n only(131072)- 2.4Ghz if ElevenNDisabled =1 starts */
	if(wlNwObjLst[cntIdx].ElevenNDisabled == 1){
		var selOpFrqEleven = comboSelectedValueGet  ('tf1_selOpFrq');
		if(selOpFrqEleven == "a"){
			$("#tf1_selMode option[value='393216']").remove();
			$("#tf1_selMode option[value='131072']").remove();
			$("#tf1_selMode option[value='983041']").remove();
			$("#tf1_selMode option[value='983040']").remove();
		}
		else if(selOpFrqEleven =="b"){
			$("#tf1_selMode option[value='475136']").remove();
			$("#tf1_selMode option[value='131072']").remove();
		}
	}
	 /* remove n only(131072),na(393216),ac only(983041),a/n/ac(983040)- 5Ghz
    		ng(475136),n only(131072)- 2.4Ghz if ElevenNDisabled =1 ends */	

    

   /* Below code is written to remove empty options appending to select box for 2.4GHZstarts */
    	  var selModeArray =[];
    	  var pushedValue = "";
    	  var toBePush ="";
    	  n=modeObj.options.length
    	  	for(k=0;k<n;k++){
    	    	pushedValue = modeObj.options[k].value;
    	    	pushedTxt = modeObj.options[k].text;
    	    	toBePush = pushedTxt + ","+pushedValue;
    	    	if(pushedTxt != "" && pushedValue != "" )
    	    		selModeArray.push(toBePush); 
    	    }
//    	   console.log(selModeArray);
    	  $("#tf1_selMode").empty();
    	   for(var i=0; i< selModeArray.length;i++){    	   	 	  
    	   	 	var actualModeList = selModeArray[i].split(",");
    	   	 	$("#tf1_selMode").append("<option value='"+actualModeList[1]+"'>"+actualModeList[0]+"</option>");

    	   }

    	   /* Below code is written to remove empty options appending to select box ends */  

	updateChannelSpacing ();
	}
function getCountryIndex ()
	{
   // var selectedCnt = comboSelectedValueGet  ('tf1_selCountry');
   var selectedCnt = $("#hdWlanCountry1").val();
         //  console.log("in1"+selectedCnt);
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
    var model = 'DSR-500N';
    var model2 = 'DSR-250N';    
    var model3 = 'DSR-150N';
    var opIdx = 0, opFrqLstIdx = wlNwObjLst[cntIdx].opFrqSt;
    var opFrqEndId = wlNwObjLst[cntIdx].opFrqEnd;
    var modelIdObj = document.getElementById ('tf1_unitName');
    if(modelIdObj)
        {  
        modelIdObjVal = modelIdObj.value;    
        if(modelIdObjVal == model || modelIdObjVal == model2 || modelIdObjVal == model3)
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
    optionValueSelect ('tf1_selCountry','hdWlanCountry1');
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
	var cntCode = document.getElementById ('hdWlanCountry1').value;
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
        if (hdCurrentChnObj)
            {
            var freq = parseInt(hdCurrentChnObj.value,10);
            var txPowerValObj = document.getElementById ('txPowerValId');
            if(isNaN (freq))
                {
                tdCurChan.innerHTML = hdCurrentChnObj.value;
                if (txPowerValObj) {
                        txPowerValId.innerHTML = "0 dBm";
                    }
                }
                /* below condition is added to check accesspoints are in enabled/disabled state starts - 49648 */
                else if (freq == "-1" ){
                	tdCurChan.innerHTML = "N/A";
                    if (txPowerValObj) {
                        txPowerValId.innerHTML = "0 dBm";
                    }
                }
                /* below condition is added to check accesspoints are in enabled/disabled state ends -49648 */
            else
                {                
                if(unitName.value != "DSR-250N") 
            	    {
	                if (freq >= 2412)
	                    {
	                    if (freq == 2484)
	                	    {
	                        var channelNum = 14;
	                        tdCurChan.innerHTML = chLst[channelNum];
	                        }
	                    else if (freq < 2484)
	                	    {
	                        var channelNum =  (freq - 2407)/5;
	                        tdCurChan.innerHTML = chLst[channelNum];
	                        }
	                    else if (freq < 5000)
	                	    {
	                        var channelNum = 15 + ((freq - 2512) / 20);
	                        tdCurChan.innerHTML = chLst[channelNum];
	                        }
	                    else
	                	    {
	                        var channelNum = (freq - 5000) / 5;
	                        tdCurChan.innerHTML = chLst[channelNum];
	                        }
	                    }
            	    }
           	        else
           	            {           	            
				        tdCurChan.innerHTML = chLst[freq];
				        }
				  }
		    }            
    //	getCurrentChannel();
    //	getCurrChannel ();
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
		if(request.readyState==4)
			{			 
			var hdCurrentChnObj = document.getElementById ('hdWlanAutoChannel');			
			var txPowerValObj = document.getElementById ('txPowerValId');			
            var response = request.responseText;
            // If the ajax call response is having login page html content, then we should redirect to index page. (Start - 47926)
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
			resetChannelAndMode ()			
			}
		}
    
	if (($("#tf1_unitName").val()) == "DSR-1000AC") {
        radioCardNo = 2
    }
    else {
        radioCardNo = 1
    }
	request.open("GET","?page=getCurrentChannel.html&radioCardNo="+radioCardNo+"&time=" + new Date(),true);    
	request.send(null);
	}

function getCurrChannel ()
	{
    getCurrentChannel ();
	if (timerId) { clearTimeout(timerId) }
        timerId = setTimeout ("getCurrChannel()", 4000);    
   }

function radioValidate ()
	{
    var transPwrObj = document.getElementById('tf1_txtDefTransPwr')
    var hdObj = document.getElementById('hdTxPowerMax');
    var maxValue = 31;
    if (hdObj && !isNaN(hdObj.value)) maxValue = parseInt (hdObj.value, 10);
	if (numericValueRangeCheck (transPwrObj, '', '', 1, maxValue, false, '', "dBm") == false)
		{
		var errStr = "Please enter a value between 1 to " + maxValue + "dBm"
			alert (errStr);
		return false;
		}
		var vapCount = parseInt(document.getElementById('hdVapWepCount').value,10);
		var nwMode = document.getElementById('tf1_selMode').value;
		/* added check  for ac only(983041) and a/n/ac(983040) also --- 46520 starts */
		if((nwMode == '475136' || nwMode == '131072' || nwMode == '393216' || nwMode == '983041' || nwMode == '983040') && vapCount > 0)
		   {
		   var mode = ""
		   if(nwMode == '475136')
			   mode = "G/N-Mixed"
		   else if(nwMode == '131072')
			   mode = "N only"
		   else if(nwMode == '393216')
			   mode = "A/N-Mixed"
			else if(nwMode == '983041')
			   mode = "A/C only"
			else if(nwMode == '983040')
			   mode = "A/N/AC-Mixed"
			   
           var errStr = mode + " cannot be configured as one of the AP''s is configured in WEP/WPA(TKIP) security mode. Please change the security setting to configure the Radio in " + mode;
               alert (errStr);
		   return false;	
		   } 
		   /* added check  for ac only(983041) and a/n/ac(983040) also --- 46520 ends */
		return true
    }
function pageInit ()
	{
	/* pick the correct ISO country code corresponding to atheros country code */
	var cntryobj = document.getElementById ('hdWlanCountry1');
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

function changeTransmission(){ 
	var selectionMode = $('#tf1_selMode').val();
	var selectionChannelWidth = $('#tf1_selChannelWidth').val();
	var radioFreq = $('#tf1_selOpFrq').val();
	var transMissionRatesAC;
	var transMissionRateOptions;
	if (radioFreq == "a" && $("#tf1_unitName").val() == "DSR-500AC" ){
	 changeTransmission5GHz();
		return;
   }
	if(selectionMode == "196608"  &&  selectionChannelWidth == "20"){ 
		
	$("#selTransmitRate").find('option').remove();

	   if ($("#tf1_unitName").val() == "DSR-1000AC" || $("#tf1_unitName").val() == "DSR-500AC" ) {

		transMissionRatesAC = [{'val':0,'label':'Best(Automatic)'},{'val':11,'label':6},{'val':15,'label':9},{'val':10,'label':12},{'val':14,'label':18},{'val':9,'label':24},{'val':13,'label':36},{'val':8,'label':48},{'val':12,'label':54}]

	  }  
		for (var i =0; i < transMissionRatesAC.length; i++) {

			

			transMissionRateOptions = transMissionRateOptions + '<option value="' + transMissionRatesAC[i].val + '">' + transMissionRatesAC[i].label + "</option>";

		}

		$("#selTransmitRate").html(transMissionRateOptions);
	 
	 
	}
    else if(selectionMode == "196607"  &&  selectionChannelWidth == "20"){ 
		
	$("#selTransmitRate").find('option').remove();

	   if ($("#tf1_unitName").val() == "DSR-1000AC" || $("#tf1_unitName").val() == "DSR-500AC" ) {

		transMissionRatesAC = [{'val':0,'label':'Best(Automatic)'},{'val':11,'label':6},{'val':15,'label':9},{'val':10,'label':12},{'val':14,'label':18},{'val':9,'label':24},{'val':13,'label':36},{'val':8,'label':48},{'val':12,'label':54}]

	  }  
		for (var i =0; i < transMissionRatesAC.length; i++) {

			

			transMissionRateOptions = transMissionRateOptions + '<option value="' + transMissionRatesAC[i].val + '">' + transMissionRatesAC[i].label + "</option>";

		}

		$("#selTransmitRate").html(transMissionRateOptions);
	 
	 
	
    }else if(selectionMode == "212992"  &&  selectionChannelWidth == "20") { 
	$("#selTransmitRate").find('option').remove();

	   if ($("#tf1_unitName").val() == "DSR-1000AC" || $("#tf1_unitName").val() == "DSR-500AC" ) {

		transMissionRatesAC = [{'val':0,'label':'Best(Automatic)'},{'val':25,'label':5.5},{'val':27,'label':1},{'val':26,'label':2},{'val':11,'label':6},{'val':15,'label':9},{'val':10,'label':12},{'val':14,'label':18},{'val':9,'label':24},{'val':13,'label':36},{'val':8,'label':48},{'val':12,'label':54}]

	  }  
		for (var i =0; i < transMissionRatesAC.length; i++) {

			transMissionRateOptions = transMissionRateOptions + '<option value="' + transMissionRatesAC[i].val + '">' + transMissionRatesAC[i].label + "</option>";

		}

		$("#selTransmitRate").html(transMissionRateOptions);

	

	 
	}else if(selectionMode == "475136"  &&  (selectionChannelWidth == "20" || selectionChannelWidth == "2040" )){
	$("#selTransmitRate").find('option').remove();
	
  if ($("#tf1_unitName").val() == "DSR-1000AC") {

transMissionRatesAC =[{'val':0,'label':'Best(Automatic)'},{'val':11,'label':6},{'val':15,'label':9},{'val':10,'label':12},{'val':14,'label':18},{'val':9,'label':24},{'val':13,'label':36},{'val':8,'label':48},{'val':12,'label':54},{'val':128,'label':'MCS0'},{'val':129,'label':'MCS1'},{'val':130,'label':'MCS2'},{'val':131,'label':'MCS3'},{'val':132,'label':'MCS4'},{'val':133,'label':'MCS5'},{'val':134,'label':'MCS6'},{'val':135,'label':'MCS7'},{'val':136,'label':'MCS8'},{'val':137,'label':'MCS9'},{'val':138,'label':'MCS10'},{'val':139,'label':'MCS11'},{'val':140,'label':'MCS12'},{'val':141,'label':'MCS13'},{'val':142,'label':'MCS14'},{'val':143,'label':'MCS15'},{'val':144,'label':'MCS16'},{'val':145,'label':'MCS17'},{'val':146,'label':'MCS18'},{'val':147,'label':'MCS19'},{'val':148,'label':'MCS20'},{'val':149,'label':'MCS21'},{'val':150,'label':'MCS22'},{'val':151,'label':'MCS23'}]
	  } 
	else if($("#tf1_unitName").val() == "DSR-500AC") {
transMissionRatesAC =[{'val':0,'label':'Best(Automatic)'},{'val':11,'label':6},{'val':15,'label':9},{'val':10,'label':12},{'val':14,'label':18},{'val':9,'label':24},{'val':13,'label':36},{'val':8,'label':48},{'val':12,'label':54},{'val':128,'label':'MCS0'},{'val':129,'label':'MCS1'},{'val':130,'label':'MCS2'},{'val':131,'label':'MCS3'},{'val':132,'label':'MCS4'},{'val':133,'label':'MCS5'},{'val':134,'label':'MCS6'},{'val':135,'label':'MCS7'},{'val':136,'label':'MCS8'},{'val':137,'label':'MCS9'},{'val':138,'label':'MCS10'},{'val':139,'label':'MCS11'},{'val':140,'label':'MCS12'},{'val':141,'label':'MCS13'},{'val':142,'label':'MCS14'},{'val':143,'label':'MCS15'}]
      }
		for (var i =0; i < transMissionRatesAC.length; i++) {

		transMissionRateOptions = transMissionRateOptions + '<option value="' + transMissionRatesAC[i].val + '">' + transMissionRatesAC[i].label + "</option>";

		}

		$("#selTransmitRate").html(transMissionRateOptions);

 
		
	}else if(selectionMode == "131072"  &&  (selectionChannelWidth == "20" || selectionChannelWidth == "2040")){
		$("#selTransmitRate").find('option').remove();
	
  if ($("#tf1_unitName").val() == "DSR-1000AC") {

		transMissionRatesAC =[{'val':0,'label':'Best(Automatic)'},{'val':128,'label':'MCS0'},{'val':129,'label':'MCS1'},{'val':130,'label':'MCS2'},{'val':131,'label':'MCS3'},{'val':132,'label':'MCS4'},{'val':133,'label':'MCS5'},{'val':134,'label':'MCS6'},{'val':135,'label':'MCS7'},{'val':136,'label':'MCS8'},{'val':137,'label':'MCS9'},{'val':138,'label':'MCS10'},{'val':139,'label':'MCS11'},{'val':140,'label':'MCS12'},{'val':141,'label':'MCS13'},{'val':142,'label':'MCS14'},{'val':143,'label':'MCS15'},{'val':144,'label':'MCS16'},{'val':145,'label':'MCS17'},{'val':146,'label':'MCS18'},{'val':147,'label':'MCS19'},{'val':148,'label':'MCS20'},{'val':149,'label':'MCS21'},{'val':150,'label':'MCS22'},{'val':151,'label':'MCS23'}]
	  } 
	else if($("#tf1_unitName").val() == "DSR-500AC") {
		transMissionRatesAC =[{'val':0,'label':'Best(Automatic)'},{'val':128,'label':'MCS0'},{'val':129,'label':'MCS1'},{'val':130,'label':'MCS2'},{'val':131,'label':'MCS3'},{'val':132,'label':'MCS4'},{'val':133,'label':'MCS5'},{'val':134,'label':'MCS6'},{'val':135,'label':'MCS7'},{'val':136,'label':'MCS8'},{'val':137,'label':'MCS9'},{'val':138,'label':'MCS10'},{'val':139,'label':'MCS11'},{'val':140,'label':'MCS12'},{'val':141,'label':'MCS13'},{'val':142,'label':'MCS14'},{'val':143,'label':'MCS15'}]
      }
		for (var i =0; i < transMissionRatesAC.length; i++) {

		transMissionRateOptions = transMissionRateOptions + '<option value="' + transMissionRatesAC[i].val + '">' + transMissionRatesAC[i].label + "</option>";

		}

		$("#selTransmitRate").html(transMissionRateOptions);

 
		 
	}

	 	$("#selTransmitRate").val($("#tf1_hid_selTransmitRate").val());

}




function changeTransmission5GHz(){ 
	var selectionMode = $('#tf1_selMode').val();
	var selectionChannelWidth = $('#tf1_selChannelWidth').val();
	var transMissionRatesAC;
	var transMissionRateOptions = "";
	if(selectionMode == "65536"  &&  selectionChannelWidth == "20"){
		
	 
	$("#selTransmitRate").find('option').remove();

	   if ($("#tf1_unitName").val() == "DSR-1000AC" || $("#tf1_unitName").val() == "DSR-500AC" ) {

		transMissionRatesAC = [{'val':0,'label':'Best(Automatic)'},{'val':11,'label':6},{'val':15,'label':9},{'val':10,'label':12},{'val':14,'label':18},{'val':9,'label':24},{'val':13,'label':36},{'val':8,'label':48},{'val':12,'label':54}];

	  }  
		for (var i =0; i < transMissionRatesAC.length; i++) {

			transMissionRateOptions = transMissionRateOptions + '<option value="' + transMissionRatesAC[i].val + '">' + transMissionRatesAC[i].label + "</option>";

		}

		$("#selTransmitRate").html(transMissionRateOptions);
	 
	 
	}else if(selectionMode == "393216"  &&  (selectionChannelWidth == "20" || selectionChannelWidth == "2040" )){
	$("#selTransmitRate").find('option').remove();

	   if ($("#tf1_unitName").val() == "DSR-1000AC") {

		transMissionRatesAC = [{'val':0,'label':'Best(Automatic)'},{'val':11,'label':6},{'val':15,'label':9},{'val':10,'label':12},{'val':14,'label':18},{'val':9,'label':24},{'val':13,'label':36},{'val':8,'label':48},{'val':12,'label':54},{'val':128,'label':'MCS0'},{'val':129,'label':'MCS1'},{'val':130,'label':'MCS2'},{'val':131,'label':'MCS3'},{'val':132,'label':'MCS4'},{'val':133,'label':'MCS5'},{'val':134,'label':'MCS6'},{'val':135,'label':'MCS7'},{'val':136,'label':'MCS8'},{'val':137,'label':'MCS9'},{'val':138,'label':'MCS10'},{'val':139,'label':'MCS11'},{'val':140,'label':'MCS12'},{'val':141,'label':'MCS13'},{'val':142,'label':'MCS14'},{'val':143,'label':'MCS15'},{'val':144,'label':'MCS16'},{'val':145,'label':'MCS17'},{'val':146,'label':'MCS18'},{'val':147,'label':'MCS19'},{'val':148,'label':'MCS20'},{'val':149,'label':'MCS21'},{'val':150,'label':'MCS22'},{'val':151,'label':'MCS23'}];

	  } else if ($("#tf1_unitName").val() == "DSR-500AC" ) {
		transMissionRatesAC = [{'val':0,'label':'Best(Automatic)'},{'val':11,'label':6},{'val':15,'label':9},{'val':10,'label':12},{'val':14,'label':18},{'val':9,'label':24},{'val':13,'label':36},{'val':8,'label':48},{'val':12,'label':54},{'val':128,'label':'MCS0'},{'val':129,'label':'MCS1'},{'val':130,'label':'MCS2'},{'val':131,'label':'MCS3'},{'val':132,'label':'MCS4'},{'val':133,'label':'MCS5'},{'val':134,'label':'MCS6'},{'val':135,'label':'MCS7'},{'val':136,'label':'MCS8'},{'val':137,'label':'MCS9'},{'val':138,'label':'MCS10'},{'val':139,'label':'MCS11'},{'val':140,'label':'MCS12'},{'val':141,'label':'MCS13'},{'val':142,'label':'MCS14'},{'val':143,'label':'MCS15'}];
	  }
		for (var i =0; i < transMissionRatesAC.length; i++) {

			transMissionRateOptions = transMissionRateOptions + '<option value="' + transMissionRatesAC[i].val + '">' + transMissionRatesAC[i].label + "</option>";

		}

		$("#selTransmitRate").html(transMissionRateOptions);

	 
	}else if(selectionMode == "131072"  &&  (selectionChannelWidth == "20" || selectionChannelWidth == "2040" )){
	$("#selTransmitRate").find('option').remove();
	
	   if ($("#tf1_unitName").val() == "DSR-1000AC") {

transMissionRatesAC =[{'val':0,'label':'Best(Automatic)'},{'val':128,'label':'MCS0'},{'val':129,'label':'MCS1'},{'val':130,'label':'MCS2'},{'val':131,'label':'MCS3'},{'val':132,'label':'MCS4'},{'val':133,'label':'MCS5'},{'val':134,'label':'MCS6'},{'val':135,'label':'MCS7'},{'val':136,'label':'MCS8'},{'val':137,'label':'MCS9'},{'val':138,'label':'MCS10'},{'val':139,'label':'MCS11'},{'val':140,'label':'MCS12'},{'val':141,'label':'MCS13'},{'val':142,'label':'MCS14'},{'val':143,'label':'MCS15'},{'val':144,'label':'MCS16'},{'val':145,'label':'MCS17'},{'val':146,'label':'MCS18'},{'val':147,'label':'MCS19'},{'val':148,'label':'MCS20'},{'val':149,'label':'MCS21'},{'val':150,'label':'MCS22'},{'val':151,'label':'MCS23'}];
	  } else if ($("#tf1_unitName").val() == "DSR-500AC" ) {
transMissionRatesAC =[{'val':0,'label':'Best(Automatic)'},{'val':128,'label':'MCS0'},{'val':129,'label':'MCS1'},{'val':130,'label':'MCS2'},{'val':131,'label':'MCS3'},{'val':132,'label':'MCS4'},{'val':133,'label':'MCS5'},{'val':134,'label':'MCS6'},{'val':135,'label':'MCS7'},{'val':136,'label':'MCS8'},{'val':137,'label':'MCS9'},{'val':138,'label':'MCS10'},{'val':139,'label':'MCS11'},{'val':140,'label':'MCS12'},{'val':141,'label':'MCS13'},{'val':142,'label':'MCS14'},{'val':143,'label':'MCS15'}];

	  }
	 
		for (var i =0; i < transMissionRatesAC.length; i++) {

		transMissionRateOptions = transMissionRateOptions + '<option value="' + transMissionRatesAC[i].val + '">' + transMissionRatesAC[i].label + "</option>";

		}

		$("#selTransmitRate").html(transMissionRateOptions);

 
		
	}else if(selectionMode == "983041"  &&  (selectionChannelWidth == "20" || selectionChannelWidth == "2040")){
		$("#selTransmitRate").find('option').remove();
	
	   if ($("#tf1_unitName").val() == "DSR-1000AC") {

		transMissionRatesAC =[{'val':0,'label':'Best(Automatic)'},{'val':11,'label':6},{'val':15,'label':9},{'val':10,'label':12},{'val':14,'label':18},{'val':9,'label':24},{'val':13,'label':36},{'val':8,'label':48},{'val':12,'label':54},{'val':128,'label':'MCS0'},{'val':129,'label':'MCS1'},{'val':130,'label':'MCS2'},{'val':131,'label':'MCS3'},{'val':132,'label':'MCS4'},{'val':133,'label':'MCS5'},{'val':134,'label':'MCS6'},{'val':135,'label':'MCS7'},{'val':136,'label':'MCS8'},{'val':137,'label':'MCS9'},{'val':138,'label':'MCS10'},{'val':139,'label':'MCS11'},{'val':140,'label':'MCS12'},{'val':141,'label':'MCS13'},{'val':142,'label':'MCS14'},{'val':143,'label':'MCS15'},{'val':144,'label':'MCS16'},{'val':145,'label':'MCS17'},{'val':146,'label':'MCS18'},{'val':147,'label':'MCS19'},{'val':148,'label':'MCS20'},{'val':149,'label':'MCS21'},{'val':150,'label':'MCS22'},{'val':151,'label':'MCS23'}];

	  } else if ($("#tf1_unitName").val() == "DSR-500AC" ) {
		transMissionRatesAC =[{'val':0,'label':'Best(Automatic)'},{'val':152,'label':'VHT0'},{'val':153,'label':'VHT1'},{'val':154,'label':'VHT2'},{'val':155,'label':'VHT3'},{'val':156,'label':'VHT4'},{'val':157,'label':'VHT5'},{'val':158,'label':'VHT6'},{'val':159,'label':'VHT7'},{'val':160,'label':'VHT8'},{'val':161,'label':'VHT9'}];

	  } 
	 
		for (var i =0; i < transMissionRatesAC.length; i++) {

		transMissionRateOptions = transMissionRateOptions + '<option value="' + transMissionRatesAC[i].val + '">' + transMissionRatesAC[i].label + "</option>";

		}

		$("#selTransmitRate").html(transMissionRateOptions);

 
}else if(selectionMode == "983041"  &&  (selectionChannelWidth == "80")){
		$("#selTransmitRate").find('option').remove();
	
	   if ($("#tf1_unitName").val() == "DSR-1000AC") {

		transMissionRatesAC =[{'val':0,'label':'Best(Automatic)'},{'val':11,'label':6},{'val':15,'label':9},{'val':10,'label':12},{'val':14,'label':18},{'val':9,'label':24},{'val':13,'label':36},{'val':8,'label':48},{'val':12,'label':54},{'val':128,'label':'MCS0'},{'val':129,'label':'MCS1'},{'val':130,'label':'MCS2'},{'val':131,'label':'MCS3'},{'val':132,'label':'MCS4'},{'val':133,'label':'MCS5'},{'val':134,'label':'MCS6'},{'val':135,'label':'MCS7'},{'val':136,'label':'MCS8'},{'val':137,'label':'MCS9'},{'val':138,'label':'MCS10'},{'val':139,'label':'MCS11'},{'val':140,'label':'MCS12'},{'val':141,'label':'MCS13'},{'val':142,'label':'MCS14'},{'val':143,'label':'MCS15'},{'val':144,'label':'MCS16'},{'val':145,'label':'MCS17'},{'val':146,'label':'MCS18'},{'val':147,'label':'MCS19'},{'val':148,'label':'MCS20'},{'val':149,'label':'MCS21'},{'val':151,'label':'MCS23'}];

	  }else if ($("#tf1_unitName").val() == "DSR-500AC" ) {

		transMissionRatesAC =[{'val':0,'label':'Best(Automatic)'},{'val':11,'label':6},{'val':15,'label':9},{'val':10,'label':12},{'val':14,'label':18},{'val':9,'label':24},{'val':13,'label':36},{'val':8,'label':48},{'val':12,'label':54},{'val':128,'label':'MCS0'},{'val':129,'label':'MCS1'},{'val':130,'label':'MCS2'},{'val':131,'label':'MCS3'},{'val':132,'label':'MCS4'},{'val':133,'label':'MCS5'},{'val':134,'label':'MCS6'},{'val':135,'label':'MCS7'},{'val':136,'label':'MCS8'},{'val':137,'label':'MCS9'},{'val':138,'label':'MCS10'},{'val':139,'label':'MCS11'},{'val':140,'label':'MCS12'},{'val':141,'label':'MCS13'},{'val':142,'label':'MCS14'},{'val':143,'label':'MCS15'},{'val':152,'label':'VHT0'},{'val':153,'label':'VHT1'},{'val':154,'label':'VHT2'},{'val':155,'label':'VHT3'},{'val':156,'label':'VHT4'},{'val':157,'label':'VHT5'},{'val':158,'label':'VHT6'},{'val':159,'label':'VHT7'},{'val':160,'label':'VHT8'},{'val':161,'label':'VHT9'}];

	  } 
	 
		for (var i =0; i < transMissionRatesAC.length; i++) {

		transMissionRateOptions = transMissionRateOptions + '<option value="' + transMissionRatesAC[i].val + '">' + transMissionRatesAC[i].label + "</option>";

		}

		$("#selTransmitRate").html(transMissionRateOptions);

 
}else if(selectionMode == "983040"  &&  (selectionChannelWidth == "20" || selectionChannelWidth == "2040" )){
		$("#selTransmitRate").find('option').remove();
	
	   if ($("#tf1_unitName").val() == "DSR-1000AC"){

		transMissionRatesAC =[{'val':0,'label':'Best(Automatic)'},{'val':11,'label':6},{'val':15,'label':9},{'val':10,'label':12},{'val':14,'label':18},{'val':9,'label':24},{'val':13,'label':36},{'val':8,'label':48},{'val':12,'label':54},{'val':128,'label':'MCS0'},{'val':129,'label':'MCS1'},{'val':130,'label':'MCS2'},{'val':131,'label':'MCS3'},{'val':132,'label':'MCS4'},{'val':133,'label':'MCS5'},{'val':134,'label':'MCS6'},{'val':135,'label':'MCS7'},{'val':136,'label':'MCS8'},{'val':137,'label':'MCS9'},{'val':138,'label':'MCS10'},{'val':139,'label':'MCS11'},{'val':140,'label':'MCS12'},{'val':141,'label':'MCS13'},{'val':142,'label':'MCS14'},{'val':143,'label':'MCS15'},{'val':144,'label':'MCS16'},{'val':145,'label':'MCS17'},{'val':146,'label':'MCS18'},{'val':147,'label':'MCS19'},{'val':148,'label':'MCS20'},{'val':149,'label':'MCS21'},{'val':150,'label':'MCS22'},{'val':151,'label':'MCS23'}];
	  }else if($("#tf1_unitName").val() == "DSR-500AC" ){
		transMissionRatesAC =[{'val':0,'label':'Best(Automatic)'},{'val':11,'label':6},{'val':15,'label':9},{'val':10,'label':12},{'val':9,'label':24},{'val':13,'label':36},{'val':8,'label':48},{'val':12,'label':54},{'val':128,'label':'MCS0'},{'val':129,'label':'MCS1'},{'val':130,'label':'MCS2'},{'val':131,'label':'MCS3'},{'val':132,'label':'MCS4'},{'val':133,'label':'MCS5'},{'val':134,'label':'MCS6'},{'val':135,'label':'MCS7'},{'val':136,'label':'MCS8'},{'val':137,'label':'MCS9'},{'val':138,'label':'MCS10'},{'val':139,'label':'MCS11'},{'val':140,'label':'MCS12'},{'val':141,'label':'MCS13'},{'val':142,'label':'MCS14'},{'val':143,'label':'MCS15'},{'val':144,'label':'MCS16'},{'val':145,'label':'MCS17'},{'val':146,'label':'MCS18'},{'val':147,'label':'MCS19'},{'val':148,'label':'MCS20'},{'val':149,'label':'MCS21'},{'val':150,'label':'MCS22'},{'val':151,'label':'MCS23'},{'val':152,'label':'VHT0'},{'val':153,'label':'VHT1'},{'val':154,'label':'VHT2'},{'val':155,'label':'VHT3'},{'val':156,'label':'VHT4'},{'val':157,'label':'VHT5'},{'val':158,'label':'VHT6'},{'val':159,'label':'VHT7'},{'val':160,'label':'VHT8'},{'val':161,'label':'VHT9'}];
}
	 
		for (var i =0; i < transMissionRatesAC.length; i++) {

		transMissionRateOptions = transMissionRateOptions + '<option value="' + transMissionRatesAC[i].val + '">' + transMissionRatesAC[i].label + "</option>";

		}

		$("#selTransmitRate").html(transMissionRateOptions);

 
		 
}else if(selectionMode == "983040"  &&  (selectionChannelWidth == "80")){
		$("#selTransmitRate").find('option').remove();
	
	   if ($("#tf1_unitName").val() == "DSR-1000AC" || $("#tf1_unitName").val() == "DSR-500AC" ) {

		transMissionRatesAC =[{'val':0,'label':'Best(Automatic)'},{'val':11,'label':6},{'val':15,'label':9},{'val':10,'label':12},{'val':14,'label':18},{'val':9,'label':24},{'val':13,'label':36},{'val':8,'label':48},{'val':12,'label':54},{'val':128,'label':'MCS0'},{'val':129,'label':'MCS1'},{'val':130,'label':'MCS2'},{'val':131,'label':'MCS3'},{'val':132,'label':'MCS4'},{'val':133,'label':'MCS5'},{'val':134,'label':'MCS6'},{'val':135,'label':'MCS7'},{'val':136,'label':'MCS8'},{'val':137,'label':'MCS9'},{'val':138,'label':'MCS10'},{'val':139,'label':'MCS11'},{'val':140,'label':'MCS12'},{'val':141,'label':'MCS13'},{'val':142,'label':'MCS14'},{'val':143,'label':'MCS15'},{'val':152,'label':'VHT0'},{'val':153,'label':'VHT1'},{'val':154,'label':'VHT2'},{'val':155,'label':'VHT3'},{'val':156,'label':'VHT4'},{'val':157,'label':'VHT5'},{'val':158,'label':'VHT6'},{'val':159,'label':'VHT7'},{'val':160,'label':'VHT8'},{'val':161,'label':'VHT9'}];

	  } 
	 
		for (var i =0; i < transMissionRatesAC.length; i++) {

		transMissionRateOptions = transMissionRateOptions + '<option value="' + transMissionRatesAC[i].val + '">' + transMissionRatesAC[i].label + "</option>";

		}

		$("#selTransmitRate").html(transMissionRateOptions);

 
}


	 	$("#selTransmitRate").val($("#tf1_hid_selTransmitRate").val());

}
