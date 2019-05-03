/*
 * File: discoveredIPAddress.js
 * Created on 26th Nov 2012 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
/****
 * This function calls when user clicks on submit button
 * On submit validation
 * @method pageValidate
 */
function pageValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_startIpAddress, Please enter a valid Start IP Adress.";
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
    
    if (ipv4Validate('tf1_startIpAddress', 'IP', false, true, "Invalid IP address.", "for octet ", true) == false) 
        return false;
    if (ipv4Validate('tf1_endIpAddress', 'SN', true, true, "Invalid IP address.", "for octet ", true) == false) 
        return false;
	var stObj = document.getElementById('tf1_startIpAddress').value;
	var edObj = document.getElementById('tf1_endIpAddress').value;
		
	if(verifyIPRange(stObj,edObj) == false)
		return false;
		
    return true;
}


/****
 * This function calls to check Ip subnet
 * On submit validation
 * @method pageValidate
 */
function verifyIPRange(val1, val2)
{
	if(val1 == '') return;
	if(val2 == '') return;
  errorString = "";

  var ipPattern = /^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/;
  var ipArray1 = val1.match(ipPattern);
  var ipArray2 = val2.match(ipPattern);

  if (val1 == "0.0.0.0")
    errorString = val1 + ' is a special IP address and cannot be used here.';
  else if (val1 == "255.255.255.255")
    errorString = val1 + ' is a special IP address and cannot be used here.';

  if (errorString != "")
  {
    alert(errorString);
        return false
  }

  if (val2 == "0.0.0.0")
    errorString = val2 + ' is a special IP address and cannot be used here.';
  else if (val2 == "255.255.255.255")
    errorString = val2 + ' is a special IP address and cannot be used here.';

  if (errorString != "")
  {
    alert(errorString);
        return false
  }

  if (val1 == "")
  {
    alert('Starting IP address of the range should be mentioned.');
    return false
  }

  if (ipArray1 == null)
  {
    alert('Starting IP address of the range is not in an appropriate form.');
    return false
  }

  if ((ipArray2 == null) && (val2 != ""))
  {
    alert('Last IP address of the range is not in an appropriate form.');
    return false
  }

  for (i=1;i<5;i++)
  {
    if (parseInt(ipArray1[i]) > 255)
    {
      alert(val1 + ' is not a valid IP address.');
      return false
    }
    else if (ipArray2 != null)
    {
      if (parseInt(ipArray2[i]) > 255)
      {
        alert(val2 + ' is not a valid IP address.');
        return false
      }
    }
  }

  if (ipArray2 != null)
  {
    for (j=1;j<4;j++)
    {
      if (ipArray1[j] != ipArray2[j])
      {
        alert('IP addresses may differ only in their final octet.');
        return false
      }
    }

    if (parseInt(ipArray2[j]) < parseInt(ipArray1[j]))
    {
      alert('IP address values do not form an increasing range.');
      return false
    }
  }
  return true
}