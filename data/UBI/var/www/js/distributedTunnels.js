/*
 * File: distibutedTunnels.js
 * TeamF1 Inc, 2012
 * Created on 8th Nov 2012 - Bala Krishna G
 */
/****
 * validate the form
 * @method distibutedTunnelsValidate
 */
function distibutedTunnelsValidate(){
    var txtFieldIdArr = new Array();
    txtFieldIdArr[0] = "tf1_distibutedTunnelClients, Please enter a valid Distributed Tunnel Clients.";
    txtFieldIdArr[1] = "tf1_distibutedTunnelIdleTime, Please enter a valid Distributed Tunnel Idle Timeout.";
    txtFieldIdArr[2] = "tf1_distibutedTunnelTimeout, Please enter a valid Distributed Tunnel Timeout.";
    txtFieldIdArr[3] = "tf1_distibutedTunnelmax, Please enter a valid Distributed Tunnel Max Multicast Replications Allowed.";
    
    if (txtFieldArrayCheck(txtFieldIdArr) == false) 
        return false;
        
    if (isProblemCharArrayCheck(txtFieldIdArr, "'\" ", NOT_SUPPORTED) == false) 
        return false;
    
    /* Check for Distributed Tunnel Clients	 */
    var myObj = document.getElementById('tf1_distibutedTunnelClients');
    if (numericValueRangeCheck(myObj, '', '', 1, 8000, true, 'Invalid Distributed Tunnel Clients.', '') == false) 
        return false;
    
    /* Check for Tunnel Idle Timeout	 */
    var myObj = document.getElementById('tf1_distibutedTunnelIdleTime');
    if (numericValueRangeCheck(myObj, '', '', 30, 3600, true, 'Invalid Distributed Tunnel Idle Timeout.', '') == false) 
        return false;
    
    /* Check for idle timeout	 */
    var myObj = document.getElementById('tf1_distibutedTunnelTimeout');
    if (numericValueRangeCheck(myObj, '', '', 30, 86400, true, 'Invalid Distributed Tunnel Timeout.', '') == false) 
        return false;
    
    /* Check for Tunnel Max Multicast Replications Allowed	 */
    var myObj = document.getElementById('tf1_distibutedTunnelmax');
    if (numericValueRangeCheck(myObj, '', '', 1, 1024, true, 'Invalid Distributed Tunnel Max Multicast.', '') == false) 
        return false;
    
    
    
    
    
}
