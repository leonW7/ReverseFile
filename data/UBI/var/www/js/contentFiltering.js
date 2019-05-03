/*
 * File: contentFiltering.js
 * Created on 18th jan 2013 - Laxmi
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
 
/**
* This function calls at the time of page loads
* OnLoad validation
* @method upnpOnload
*/
$(document).ready(function() {	
	onloadCall(contentFilteringOnload, {imageId:'tf1_enableContentFiltering', disableIndividual:'tf1_webProxy tf1_java tf1_activex tf1_browserCookies', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'break1 break2 break3 break4', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});
	
	contentFilteringOnload({imageId:'tf1_enableContentFiltering', disableIndividual:'tf1_webProxy tf1_java tf1_activex tf1_browserCookies', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'break1 break2 break3 break4', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});

});
function contentFilteringOnload(data){
	onAnchorToggle(data);
}

function contentFilteringOnReset(){
	contentFilteringOnload({imageId:'tf1_enableContentFiltering', disableIndividual:'tf1_webProxy tf1_java tf1_activex tf1_browserCookies', disableGrp:'', enableIndividual:'', enableGrp:'', hideClass:'hide', showClass:'configRow', breakDivs:'break1 break2 break3 break4', breakClass:'break', imagesInfo:{disableImages:'', enableImages:'', disableClass:'', enableClass:''}});

}