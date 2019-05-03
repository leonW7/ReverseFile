var timerFlag = null;	
function firmwareVersionCheck()
    {
	var request = null;
	if (timerFlag) clearTimeout(timerFlag);
	var stAvailObj = document.getElementById ('hdStatusAvailable');				
	var regLinkObj = document.getElementById ('hdregLink');
	if(parseInt(document.getElementById('hdAutorefreshFlag').value,10) == 1)
	    {			
		try
		    { // Firefox, Opera 8.0+, Safari
			request=new XMLHttpRequest();
		    }
		catch (e)
		    { // Internet Explorer
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
						window.status = LANG_LOCALE['30075'];
						return false;
					    }   
				}
		    }
		    request.onreadystatechange=function()	
		        {				
			    if(request.readyState==4)				
			        {	
				    var str;
				    var splitStr;
				    str=request.responseText;
				    splitStr=str.split("||");
				    var tdObj = document.getElementById ('lblStatus');
				    if (tdObj) tdObj.innerHTML = splitStr[0];
				    if(stAvailObj) stAvailObj.value = splitStr[1];
				    if(regLinkObj) regLinkObj.value = splitStr[2]						
				    if(parseInt(stAvailObj.value,10) == 1)
					timerFlag = setTimeout("firmwareVersionCheck()",5000);			
				    else
					{
					    var tdObj = document.getElementById ('lblStatus');
					    if(parseInt(stAvailObj.value,10) == 2)
						{   					
					    var msg = tdObj.innerHTML + "<br/>" + LANG_LOCALE['30417'] + " <a href ='" + regLinkObj.value + "' target='_blank' style='color:blue'>" + "MyDSRSupport" + "</a>" + "Website";
						    tdObj.innerHTML = msg; 
						}
					    else if(parseInt(stAvailObj.value,10) == 3)
						{					
						    var msg = tdObj.innerHTML + "<br/>" + LANG_LOCALE['30418'] + " <a href ='" + regLinkObj.value + "' target='_blank' style='color:blue'>" + "D-Link MyDsr " + "</a>" + LANG_LOCALE['30419'];
						    tdObj.innerHTML = msg; 
						}		
					}
				}
			}
			request.open("GET","?page=getFirmwareStatus.html&time=" + new Date(),true);
			request.send(null);
		}
	}
