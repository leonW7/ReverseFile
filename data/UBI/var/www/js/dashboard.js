/*
 * File: dashboard.js
 * Created on 18th jan 2013 - Saikumar D
 * Copyright (c) 2012 TeamF1, Inc.
 * All rights reserved.
 */
 
/* 
	for Pie Chart
 	Run the code when the DOM is ready
*/

function nearest(value, min, max, steps){
    var zerone = Math.round((value-min)*steps/(max-min))/steps; // bring to 0-1 range
    return zerone*(max-min) + min;
}

function getScaleValues4Grid (maxValue) {

	var scaleObject = new Object();
	scaleObject.step = 1;
	scaleObject.maxValue = 1;

	if (maxValue >= 0 && maxValue <=8) {

		scaleObject.maxValue = 8;
		scaleObject.step = 2;

	}else if (maxValue > 8 && maxValue <=20) {
		scaleObject.maxValue = 20;
		scaleObject.step = 5;
	}else if (maxValue > 20 && maxValue <=100) {
		scaleObject.maxValue = 100;
		scaleObject.step = 25;
	}else if (maxValue > 100 && maxValue <=1000) {
		scaleObject.maxValue = 1000;
		scaleObject.step = 250;
	}else if (maxValue > 1000 && maxValue <=10000) {
		scaleObject.maxValue = 10000;
		scaleObject.step = 2500;
	}else if (maxValue > 10000 && maxValue <=50000) {
		scaleObject.maxValue = 50000;
		scaleObject.step = 12500;
	}else if (maxValue > 50000 && maxValue <=100000) {
		scaleObject.maxValue = 100000;
		scaleObject.step = 25000;
	}else if (maxValue > 100000 && maxValue <=1000000) {
		scaleObject.maxValue = 1000000;
		scaleObject.step = 250000;
	}
	
	return scaleObject;

}

function getScaleValues5Grid (maxValue) {

	var scaleObject = new Object();
	scaleObject.step = 1;
	scaleObject.maxValue = 1;

	if (maxValue >= 0 && maxValue <=10) {

		scaleObject.maxValue = 10;
		scaleObject.step = 2;

	}else if (maxValue > 10 && maxValue <=20) {
		scaleObject.maxValue = 20;
		scaleObject.step = 4;
	}else if (maxValue > 20 && maxValue <=100) {
		scaleObject.maxValue = 100;
		scaleObject.step = 20;
	}else if (maxValue > 100 && maxValue <=1000) {
		scaleObject.maxValue = 1000;
		scaleObject.step = 200;
	}else if (maxValue > 1000 && maxValue <=10000) {
		scaleObject.maxValue = 10000;
		scaleObject.step = 2000;
	}else if (maxValue > 10000 && maxValue <=100000) {
		scaleObject.maxValue = 100000;
		scaleObject.step = 20000;
	}else if (maxValue > 100000 && maxValue <=1000000) {
		scaleObject.maxValue = 100000;
		scaleObject.step = 2000000;
	}
	
	return scaleObject;

}
/* Fix for dashboard scaling issue starts */
function getScaleValuesfrBarCharts (maxValue) {

    var scaleObject = new Object();
    scaleObject.step = 1;
    scaleObject.maxValue = 1;
    var currValue = parseInt(maxValue,10);
    my_string = "";
    currValue = currValue.toString();
    var res = currValue.charAt(0);
    var firChar = parseInt(res) + 1;
    for (i=1;i<currValue.length;i++) {
       my_string +=  '0';
    }
    result = firChar+my_string;
    scaleObject.maxValue = result;
    scaleObject.step = result/4;
    return scaleObject;

}
/* Global values to display in html page */

htmlArrayDisplay = new Array();
htmlArrayDisplay[0] = {val:"",units:""}
htmlArrayDisplay[1] = {val:"",units:""}
htmlArrayDisplay[2] = {val:"",units:""}
htmlArrayDisplay[3] = {val:"",units:""}
htmlArrayDisplay[4] = {val:"",units:""}

checkList = "1000,1000000,1000000000,1000000000000,1000000000000000,1000000000000000000";
checkListArr = checkList.split(",");
checkListUnit = "MB,GB,TB,PB,EB,ZB";
checkListUnitArr = checkListUnit.split(",");

function getAccountLabels (downLoadVal) {
    var downLoadObject = {val:downLoadVal,units:"KB"};
    var cVal;
    for (v = 0 ; v <= checkListArr.length; v++) {
            cVal = downLoadVal/parseInt(checkListArr[v],10);           
            if ( cVal < 1) {        
                break;
            }           
    downLoadObject = {val:(downLoadVal/parseInt(checkListArr[v],10)).toFixed(2),units: checkListUnitArr[v]};        
    }    
    return downLoadObject;
}
/* Fix for dashboard scaling issue ends */
function pieChart(canvasId,tableId){
    // Config settings
    var chartSizePercent = 60; // The chart radius relative to the canvas width/height (in percent)
    var sliceBorderWidth = 1; // Width (in pixels) of the border around each slice
    var sliceBorderStyle = "#FFFFFF"; // Colour of the border around each slice
    var sliceGradientColour = "#EEEEEE"; // Colour to use for one end of the chart gradient
    var maxPullOutDistance = 5; // How far, in pixels, to pull slices out when clicked
    var pullOutFrameStep = 4; // How many pixels to move a slice with each animation frame
    var pullOutFrameInterval = 40; // How long (in ms) between each animation frame
    var pullOutLabelPadding = 35; // Padding between pulled-out slice and its label 
    var pullOutLabelFont = "bold 10px 'Trebuchet MS', Verdana, sans-serif"; // Pull-out slice label font
    var pullOutValueFont = "none 10px 'Trebuchet MS', Verdana, sans-serif"; // Pull-out slice value font
    var pullOutValuePrefix = ""; // Pull-out slice value prefix
    var pullOutShadowColour = "rgba( 9, 9, 9, .2 )"; // Colour to use for the pull-out slice shadow
    var pullOutShadowOffsetX = 5; // X-offset (in pixels) of the pull-out slice shadow
    var pullOutShadowOffsetY = 5; // Y-offset (in pixels) of the pull-out slice shadow
    var pullOutShadowBlur = 5; // How much to blur the pull-out slice shadow
    var pullOutBorderWidth = 1; // Width (in pixels) of the pull-out slice border
    var pullOutBorderStyle = "#000000"; // Colour of the pull-out slice border
    var chartStartAngle = -.5 * Math.PI; // Start the chart at 12 o'clock instead of 3 o'clock
    // Declare some variables for the chart
    var canvas; // The canvas element in the page
    var currentPullOutSlice = -1; // The slice currently pulled out (-1 = no slice)
    var currentPullOutDistance = 0; // How many pixels the pulled-out slice is currently pulled out in the animation
    var animationId = 0; // Tracks the interval ID for the animation created by setInterval()
    var chartData = []; // Chart data (labels, values, and angles)
    var chartColours = []; // Chart colours (pulled from the HTML table)
    var totalValue = 0; // Total of all the values in the chart
    var canvasWidth; // Width of the canvas, in pixels
    var canvasHeight; // Height of the canvas, in pixels
    var centreX; // X-coordinate of centre of the canvas/chart
    var centreY; // Y-coordinate of centre of the canvas/chart
    var chartRadius; // Radius of the pie chart, in pixels
    init();
    
    function init(){
        // Get the canvas element in the page
        canvas = document.getElementById(canvasId);
        
        // Exit if the browser isn't canvas-capable
        if (typeof canvas.getContext === 'undefined') 
            return;
        
        // Initialise some properties of the canvas and chart
        canvasWidth = canvas.width;
        canvasHeight = canvas.height;
        centreX = canvasWidth / 2;
        centreY = canvasHeight / 2;
        chartRadius = Math.min(canvasWidth, canvasHeight) / 2 * (chartSizePercent / 75);
        
        // Grab the data from the table,
        // and assign click handlers to the table data cells
        
        var currentRow = -1;
        var currentCell = 0;
        
        $('#'+tableId+' td').each(function(){
            currentCell++;
            if (currentCell % 2 != 0) {
                currentRow++;
                chartData[currentRow] = [];
                chartData[currentRow]['label'] = $(this).text();
            }
            else {
                var value = parseFloat($(this).text());
                totalValue += value;
                value = value.toFixed(2);
                chartData[currentRow]['value'] = value;
            }
            
            // Store the slice index in this cell, and attach a click handler to it
            $(this).data('slice', currentRow);
            $(this).click(handleTableClick);
            
            // Extract and store the cell colour
            if (rgb = $(this).css('color').match(/rgb\((\d+), (\d+), (\d+)/)) {
                chartColours[currentRow] = [rgb[1], rgb[2], rgb[3]];
            }
            else 
                if (hex = $(this).css('color').match(/#([a-fA-F0-9]{2})([a-fA-F0-9]{2})([a-fA-F0-9]{2})/)) {
                    chartColours[currentRow] = [parseInt(hex[1], 16), parseInt(hex[2], 16), parseInt(hex[3], 16)];
                }
                else {
                    alert(LANG_LOCALE['10953']);
                    return;
                }
            
        });
        
        // Now compute and store the start and end angles of each slice in the chart data
        
        var currentPos = 0; // The current position of the slice in the pie (from 0 to 1)
        for (var slice in chartData) {
            chartData[slice]['startAngle'] = 2 * Math.PI * currentPos;
            chartData[slice]['endAngle'] = 2 * Math.PI * (currentPos + (chartData[slice]['value'] / totalValue));
            currentPos += chartData[slice]['value'] / totalValue;
        }
        
        drawChart();
        $('#'+canvasId).click(handleChartClick);
    }
    
    function handleChartClick(clickEvent){
    
        // Get the mouse cursor position at the time of the click, relative to the canvas
        var mouseX = clickEvent.pageX - this.offsetLeft;
        var mouseY = clickEvent.pageY - this.offsetTop;
        
        // Was the click inside the pie chart?
        var xFromCentre = mouseX - centreX;
        var yFromCentre = mouseY - centreY;
        var distanceFromCentre = Math.sqrt(Math.pow(Math.abs(xFromCentre), 2) + Math.pow(Math.abs(yFromCentre), 2));
        
        if (distanceFromCentre <= chartRadius) {
            var clickAngle = Math.atan2(yFromCentre, xFromCentre) - chartStartAngle;
            if (clickAngle < 0) 
                clickAngle = 2 * Math.PI + clickAngle;
            
            for (var slice in chartData) {
                if (clickAngle >= chartData[slice]['startAngle'] && clickAngle <= chartData[slice]['endAngle']) {
                    toggleSlice(slice);
                    return;
                }
            }
        }
        pushIn();
    }
    
    function handleTableClick(clickEvent){
        var slice = $(this).data('slice');
        toggleSlice(slice);
    }
    
    function toggleSlice(slice){
        if (slice == currentPullOutSlice) {
            pushIn();
        }
        else {
            startPullOut(slice);
        }
    }
    
    function startPullOut(slice){
        if (currentPullOutSlice == slice) 
            return;
        currentPullOutSlice = slice;
        currentPullOutDistance = 0;
        clearInterval(animationId);
        animationId = setInterval(function(){
            animatePullOut(slice);
        }, pullOutFrameInterval);
        $('#'+tableId+' td').removeClass('highlight');
        var labelCell = $('#'+tableId+' td:eq(' + (slice * 2) + ')');
        var valueCell = $('#'+tableId+' td:eq(' + (slice * 2 + 1) + ')');
        labelCell.addClass('highlight');
        valueCell.addClass('highlight');
    }
    
    function animatePullOut(slice){
        currentPullOutDistance += pullOutFrameStep;
        if (currentPullOutDistance >= maxPullOutDistance) {
            clearInterval(animationId);
            return;
        }
        drawChart();
    }
    
    function pushIn(){
        currentPullOutSlice = -1;
        currentPullOutDistance = 0;
        clearInterval(animationId);
        drawChart();
        $('#'+tableId+' td').removeClass('highlight');
    }
    
    function drawChart(){
        var context = canvas.getContext('2d');
        context.clearRect(0, 0, canvasWidth, canvasHeight);
        for (var slice in chartData) {
            if (slice != currentPullOutSlice) 
                drawSlice(context, slice);
        }
        if (currentPullOutSlice != -1) 
            drawSlice(context, currentPullOutSlice);
    }
    
    function drawSlice(context, slice){
        var startAngle = chartData[slice]['startAngle'] + chartStartAngle;
        var endAngle = chartData[slice]['endAngle'] + chartStartAngle;
        if (slice == currentPullOutSlice) {
            var midAngle = (startAngle + endAngle) / 2;
            var actualPullOutDistance = currentPullOutDistance * easeOut(currentPullOutDistance / maxPullOutDistance, .8);
            startX = centreX + Math.cos(midAngle) * actualPullOutDistance;
            startY = centreY + Math.sin(midAngle) * actualPullOutDistance;
            context.fillStyle = 'rgb(' + chartColours[slice].join(',') + ')';
            context.textAlign = "center";
            context.font = pullOutLabelFont;
            context.font = pullOutValueFont;
            context.shadowOffsetX = pullOutShadowOffsetX;
            context.shadowOffsetY = pullOutShadowOffsetY;
            context.shadowBlur = pullOutShadowBlur;
            
        }
        else {
            startX = centreX;
            startY = centreY;
        }
        var sliceGradient = context.createLinearGradient(0, 0, canvasWidth * .75, canvasHeight * .75);
        sliceGradient.addColorStop(0, sliceGradientColour);
        sliceGradient.addColorStop(1, 'rgb(' + chartColours[slice].join(',') + ')');
        context.beginPath();
        context.moveTo(startX, startY);
        context.arc(startX, startY, chartRadius, startAngle, endAngle, false);
        context.lineTo(startX, startY);
        context.closePath();
        context.fillStyle = sliceGradient;
        context.shadowColor = (slice == currentPullOutSlice) ? pullOutShadowColour : "rgba( 0, 0, 0, 0 )";
        context.fill();
        context.shadowColor = "rgba( 0, 0, 0, 0 )";
        if (slice == currentPullOutSlice) {
            context.lineWidth = pullOutBorderWidth;
            context.strokeStyle = pullOutBorderStyle;
        }
        else {
            context.lineWidth = sliceBorderWidth;
            context.strokeStyle = sliceBorderStyle;
        }
        context.stroke();
    }
    function easeOut(ratio, power){
        return (Math.pow(1 - ratio, power) + 1);
    }
};

  /* 
  	Bar charts  	
 */
 
 /* 
 	For Lines with dotted  display 	
 */
 
  if (window.CanvasRenderingContext2D && CanvasRenderingContext2D.prototype.lineTo){
			CanvasRenderingContext2D.prototype.dashedLine = function(x, y, x2, y2, da) {
        if (!da) da = [10,5];
        this.save();
        var dx = (x2-x), dy = (y2-y);
        var len = Math.sqrt(dx*dx + dy*dy);
        var rot = Math.atan2(dy, dx);
        this.translate(x, y);
        this.moveTo(0, 0);
        this.rotate(rot);       
        var dc = da.length;
        var di = 0, draw = true;
        x = 0;
        while (len > x) {
            x += da[di++ % dc];
            if (x > len) x = len;
            draw ? this.lineTo(x, 0): this.moveTo(x, 0);
            draw = !draw;
        }       
        this.restore();
   	 }
    
	}
            /*
             * Vertical BarChart constructor
             */
            function BarChart(config){
                // user defined properties
                
                
                this.canvas = document.getElementById(config.canvasId);
                var el = document.createElement('canvas');

                this.data = config.data;
                this.color = config.color;
                this.barWidth = config.barWidth;
                this.gridLineIncrement = config.gridLineIncrement;
				this.bottomColor = config.bottomColor;
                /*
                 * adjust max value to highest possible value divisible
                 * by the grid line increment value and less than
                 * the requested max value
                 */
                this.maxValue = config.maxValue - Math.floor(config.maxValue % this.gridLineIncrement);
                this.minValue = config.minValue;
                
                // constants
                this.font = "8pt Trebuchet MS";
                this.axisColor = "#d8d8d8";
                this.gridColor = "#d8d8d8";
                this.padding = 10;
                
                // relationships
                this.context = this.canvas.getContext("2d");
                this.range = this.maxValue - this.minValue;
                this.numGridLines =  Math.round(this.range / this.gridLineIncrement);  
				this.longestValueWidth = this.getLongestValueWidth();
                this.x = this.padding + this.longestValueWidth;
                this.y = this.padding * 2;
                this.width = this.canvas.width - (this.longestValueWidth + this.padding * 2);
                this.height = this.canvas.height - (this.getLabelAreaHeight() + this.padding * 4);
                
                // draw bar chart
                this.drawGridlines();
                this.drawYAxis();
               this.drawXAxis();
               this.drawBars();
               this.drawYVAlues();
               this.drawXLabels();
                
                this.graphAreaHeight = this.height;
                
                if (config.lefttext != '')
                {
                
                			this.context.fillStyle = "#333";
						    this.context.font = "8pt Trebuchet MS";
						    this.context.textAlign = "center";
						    
						    this.context.fillText(config.lefttext,20,this.canvas.height-41);

                
                
                }
            }
            
            /*
             * gets the label height by finding the max label width and
             * using trig to figure out the projected height since
             * the text will be rotated by 45 degrees
             */
            BarChart.prototype.getLabelAreaHeight = function(){
                this.context.font = this.font;
                var maxLabelWidth = 0;
                
                /*
                 * loop through all labels and determine which
                 * label is the longest.  Use this informatoin
                 * to determine the label width
                 */
                for (var n = 0; n < this.data.length; n++) {
                    var label = this.data[n].label;
                    maxLabelWidth = Math.max(maxLabelWidth, this.context.measureText(label).width);
                }
                
                /*
                 * return y component of the labelWidth which
                 * is at a 45 degree angle:
                 *
                 * a^2 + b^2 = c^2
                 * a = b
                 * c = labelWidth
                 * a = height component of right triangle
                 * solve for a
                 */
                return Math.round(maxLabelWidth / Math.sqrt(2));
            };
            
            BarChart.prototype.getLongestValueWidth = function(){
                this.context.font = this.font;
                var longestValueWidth = 0;
                for (var n = 0; n <= this.numGridLines; n++) {
                    var value = this.maxValue - (n * this.gridLineIncrement);
                    longestValueWidth = Math.max(longestValueWidth, this.context.measureText(value).width);
                    
                }
                return longestValueWidth;
            };
            
            BarChart.prototype.drawXLabels = function(){
                var context = this.context;
                context.save();
                var data = this.data;
                var barSpacing = this.width / data.length ;
                
                for (var n = 0; n < data.length; n++) {
                    var label = data[n].label;
                    context.save();
                    context.translate(this.x + ((n + 1 / 2) * barSpacing), this.y + this.height + 10);
                    //context.rotate(-1 * Math.PI / 4); // rotate 45 degrees
                    context.font = this.font;
                    context.fillStyle = this.bottomColor;
                    context.textAlign = "center";
                    context.textBaseline = "middle";
                    context.fillText(label, 0, 0);
                    context.restore();
                }
                context.restore();
            };
            
            BarChart.prototype.drawYVAlues = function(){
                var context = this.context;
                context.save();
                context.font = this.font;
                context.fillStyle = "#666666";
                context.textAlign = "right";
                context.textBaseline = "middle";
                
                for (var n = 0; n <= this.numGridLines; n++) {
                    var value = this.maxValue - (n * this.gridLineIncrement);
                    var thisY = (n * this.height / this.numGridLines) + this.y;
                    context.fillText(value, this.x -7, thisY);
                }
                
                context.restore();
            };
            
            BarChart.prototype.drawBars = function(){
                var context = this.context;
                context.save();
                var data = this.data;
                var barSpacing = this.width / data.length;
                var unitHeight = this.height / this.range;
                
            
                
                for (var n = 0; n < data.length; n++) {
                    var bar = data[n];
                    var barHeight = (data[n].value - this.minValue) * unitHeight;
                  
                     // Create fill gradient
					var gradient = context.createLinearGradient(0, 0, 0, barHeight);
					gradient.addColorStop(0, "#ffc821");
					gradient.addColorStop(1, "#faf100");
                    
                    /*
                     * if bar height is less than zero, this means that its
                     * value is less than the min value.  Since we don't want to draw
                     * bars below the x-axis, only draw bars whose height is greater
                     * than zero
                     */
                    if (barHeight > 0) {
                        context.save();
                        context.translate(Math.round(this.x + ((n + 1 / 2) * barSpacing)), Math.round(this.y + this.height));
                        /*
                         * for convenience, we can draw the bars upsidedown
                         * starting at the x-axis and then flip
                         * them back into the correct orientation using
                         * scale(1, -1).  This is a great example of how
                         * transformations can help reduce computations
                         */
                        context.scale(1, -1);
                        
                        context.beginPath();
                        context.rect(-this.barWidth / 2, 0, this.barWidth, barHeight);
                        context.fillStyle = data[n].background;
                        context.fill();
                        context.restore();
						 

                        
                        context.lineWidth = 2;						
						context.strokeStyle = "#FFFFFF";
						context.stroke();
						context.restore();

						context.lineWidth = 1;					
						context.strokeStyle = data[n].borderouter;
						context.stroke();
						
						context.restore();
                        /* commented below code not to show top label for vertical bar charts */
						
			// 			if (data[n].toplabel != '')
			// 			{
						
			// 				context.fillStyle = "#4485bb";
			// 			    context.font = this.font;
			// 			    context.textAlign = "center";
						    
			// 			    context.fillText(data[n].toplabel,
			// n * this.width / data.length  + (this.width / data.length) / 2 + data.length * this.padding + 5,
			// this.height - barHeight + 10);
					    
					   
			// 		   }
            /* commented code not to show top label for vertical bar charts */
						
                        context.restore();
                    }
                }
                context.restore();
            };
            
            BarChart.prototype.drawGridlines = function(){
                var context = this.context;
                context.save();
                context.strokeStyle = this.gridColor;
                context.lineWidth = 1;
                
                
                  
                
                // draw y axis grid lines
                for (var n = 0; n < this.numGridLines; n++) {
                    var y = (n * this.height / this.numGridLines) + this.y;
                    context.beginPath();                   
                    //context.moveTo(this.x, y);
                   // context.lineTo(this.x + this.width, y);
                    
                    context.dashedLine(this.x, y,this.x + this.width, y,[2,1]);
                   	 context.stroke();

                }
                
                
                
                
                 // draw x axis grid lines
                for (var n = 0; n <= this.data.length; n++) {
                    var x = (n * this.width / this.data.length) + this.x;
                    context.beginPath();                   
                    //context.moveTo(x, this.y);
                    //context.lineTo(x, this.y+this.height);
                    
                    context.dashedLine(x, this.y, x,this.y+this.height,[2,1]);
                    context.stroke();
                }
                               
                
                context.restore();
            };
            
            BarChart.prototype.drawXAxis = function(){
                var context = this.context;
                context.save();
                context.beginPath();
                //context.moveTo(this.x, this.y + this.height);
                //context.lineTo(this.x + this.width, this.y + this.height);
                
                context.dashedLine(this.x, this.y + this.height,this.x + this.width, this.y + this.height,[2,1]);


                context.strokeStyle = this.gridColor;
                context.lineWidth = 2;
                context.stroke();
                context.restore();
            };
            
            BarChart.prototype.drawYAxis = function(){
                var context = this.context;
                context.save();
                context.beginPath();
              	//context.moveTo(this.x, this.y);
              	//context.lineTo(this.x, this.height + this.y);
                       
              	context.dashedLine(this.x, this.y, this.x, this.height + this.y, [2,1]);
                context.strokeStyle = this.gridColor;
                context.lineWidth = 2;
                context.stroke();
                context.restore();
            };
            
            
   function getTrafficData(url,canvasId,tableId) {
		    
		   var selTrafficDataValue = '';
		   if(tableId == 'chartData'){
		
				var selTrafficDataTypeObj = document.getElementById("tf1_trafficOver");
				selTrafficDataValue = selTrafficDataTypeObj.options[selTrafficDataTypeObj.selectedIndex].value;
			
                    }

		    	
		    	$.ajax({ 
				    type: 'POST', url: url, data: { 'Interface.name1': selTrafficDataValue  }, dataType: 'json',
				    success: function (data) { 	
					
					if (tableId == "cpuChartData") {
						
						$("#tf1_loadingCPUDiv").hide();
						$("#tf1_CPUSec").show();					
	
					}else{
						$("#tf1_loadingTrafficDiv").hide();
						$("#tf1_trafficSec").show();
					}

				    if(tableId == "chartData"){
						 $("#"+tableId+"R1").html(data.HTTP);
						 $("#"+tableId+"R2").html(data.HTTPS);
						 $("#"+tableId+"R3").html(data.Email);
						 $("#"+tableId+"R4").html(data.DNS);						 			
					}else{
						$("#"+tableId+"R1").html(data.User);
						$("#"+tableId+"R2").html(data.Kernal);
						$("#"+tableId+"R3").html(data.IdleTime);
						$("#"+tableId+"R4").html(data.IOs);
					}    
				    pieChart(canvasId,tableId);	
			       }
				});


		    
		    }
		    function getVerticalBarData(url,graphType){
		     
		    	var totalCount=0;
                var selBandwidthValue = "";
                	if(graphType == 'bandwidthUsage'){

				var selBandwidthTypeObj = document.getElementById("tf1_bandwidth");
				var selBandwidthValue = selBandwidthTypeObj.options[selBandwidthTypeObj.selectedIndex].value;
                    }
                    	if(graphType == 'wlanStatistics'){

				var selBandwidthTypeObj = document.getElementById("tf1_wlanDataType");
				var selBandwidthValue = selBandwidthTypeObj.options[selBandwidthTypeObj.selectedIndex].value;
                    }

				$.ajax({ 
				    type: 'POST', url: url, data: { 'Interface.Name1': selBandwidthValue}, dataType: 'json',
				    success: function (data) {
						var valuesArray = new Array();
					   	var res ='';
					   	res ='[';
				    	for(i=0; i<data.data.length;i++){
				    		res = res +"{";
				    		lableObj = '"label":"' + data.data[i].label + '",';
				    		valueObj = '"value":"' + parseInt(data.data[i].value,10).toFixed(1) + '",';
								valuesArray[valuesArray.length] = data.data[i].value;
				    		backgroundObj = '"background":"' + data.data[i].background + '",';
							borderouterObj = '"borderouter":"' + data.data[i].borderouter + '",';
							borderinnerObj  = '"borderinner":"' + data.data[i].borderinner + '",';
							if(graphType == 'bandwidthUsage'){
								toplabelObj = '"toplabel":"' + parseInt(data.data[i].toplabel,10).toFixed(1) + '"';
							} else {
								toplabelObj = '"toplabel":"' + data.data[i].toplabel + '"';
							}
				    		res = res + lableObj + valueObj + backgroundObj + borderouterObj + borderinnerObj  + toplabelObj +"},";
				    		totalCount = parseInt(totalCount)+ parseInt(data.data[i].value);
				    	}
				    	
							var maxValue = Math.max.apply(Math,valuesArray);		    	
				    	var minValue = 0;
							
				    	finalData=res.substring(0, res.length - 1);
				    	finalData = finalData + ']';

				    	var finalData1=jQuery.parseJSON(finalData);								
							
				    	
				    	if(graphType == 'discoveredAps'){

							var scaleObject = getScaleValues4Grid(maxValue);
							maxValue = scaleObject.maxValue;
							step = scaleObject.step;						  

							$("#tf1_loadingDiscoveredApsDiv").hide();
							$("#tf1_discoveredApsSec").show();


							var graph1 = new BarChart({
								canvasId : "barChart",
								data : finalData1,
								color : "blue",
								barWidth : 25,
								minValue : 0,
								maxValue : maxValue,
								gridLineIncrement : step,
								lefttext : '',
								bottomColor : '#4485bb'
							});
							$("#discoveredApsTotalCount").html(LANG_LOCALE['13113']+": "+totalCount); 
						}
						if(graphType == 'bandwidthUsage'){

							var scaleObject = getScaleValues4Grid(maxValue);
							maxValue = scaleObject.maxValue;
							step = scaleObject.step;

							$("#tf1_loadingBandwidthDiv").hide();
							$("#tf1_bandwidthSec").show();
							 
							
              var bwCtx = document.getElementById('bandWidthChart').getContext('2d');
              bwCtx.clearRect(0,0,280,160);
							var graph2 = new BarChart({
								canvasId : "bandWidthChart",
								data : finalData1,
								color : "blue",
								barWidth : 25,
								minValue : 0,
								maxValue : maxValue,
								gridLineIncrement : step,
								lefttext : '(in KB) ',
								bottomColor : '#6a6a6a'
							});
							$("#bandwidthUsageTotalCount").html("Total Bandwidth Usage: "+totalCount); 
						}

						if(graphType == 'wlanStatistics'){

							var scaleObject = getScaleValues4Grid(maxValue);
							maxValue = scaleObject.maxValue;
							step = scaleObject.step;

					 
							$("#tf1_loadingWlanStatisticsDiv").hide();
							$("#tf1_wlanStatisticsSec").show();
              var bwCtx = document.getElementById('wlanBarChart').getContext('2d');
              bwCtx.clearRect(0,0,200,190);
							var graph2 = new BarChart({
								canvasId : "wlanBarChart",
								data : finalData1,
								color : "blue",
								barWidth : 25,
								minValue : 0,
								maxValue : maxValue,
								gridLineIncrement : step,
								lefttext : '',
								bottomColor : '#6a6a6a'
							});
                            var wlanTotalCount = parseInt(finalData1[0].value,10)+parseInt(finalData1[1].value,10)+parseInt(finalData1[2].value,10)+parseInt(finalData1[3].value,10)
                                
                            $("#WLANStatisticsTotalCount1").html(LANG_LOCALE['13120']+": "+wlanTotalCount);
							
						}

						if(graphType == 'memoryUtilization'){

							var scaleObject = getScaleValues4Grid(maxValue);
							maxValue = scaleObject.maxValue;
							step = scaleObject.step;

							$("#tf1_loadingMemoryDiv").hide();
							$("#tf1_memorySec").show();
							var graph1 = new BarChart({
								canvasId : "MemoryBarChart",
								data : finalData1,
								color : "blue",
								barWidth : 25,
								minValue : 0,
								maxValue : maxValue,
								gridLineIncrement : step,
								lefttext : '',
								bottomColor : '#4485bb'
							});
                            // Here we can get totMemory from the addition of
                            // used memory and free memory
                            var totMemory = parseInt(finalData1[0].value,10)+parseInt(finalData1[1].value,10);
							$("#memoryUtilizationTotalCount").html(LANG_LOCALE['13114']+": "+totMemory+" KB"); 
						}
						if(graphType == 'activeInfo'){

							$("#tf1_loadingActiveInfoDiv").hide();
							$("#tf1_activeInfoSec").show();
							
							var scaleObject = getScaleValues4Grid(maxValue);
							maxValue = scaleObject.maxValue;
							step = scaleObject.step;

							var graph1 = new BarChart({
								canvasId : "ActivInfoBarChart",
								data : finalData1,
								color : "blue",
								barWidth : 25,
								minValue : 0,
								maxValue : maxValue,
								gridLineIncrement : step,
								lefttext : '',
								bottomColor : '#4485bb'
							});
							$("#activeInfoTotalCount").html("Total Active Users: "+totalCount);
						}			    	 
					
			       }
				});
		    }
/* Fix for dashboard scaling issue starts */
function getVerticalDataforBarCharts(url,graphType){
    var graphText = "";
    var graphMeasure = "";
    var selBandwidthValue = "";
        if(graphType == 'bandwidthUsage'){
            var selBandwidthTypeObj = document.getElementById("tf1_bandwidth");
            var selBandwidthValue = selBandwidthTypeObj.options[selBandwidthTypeObj.selectedIndex].value;
        }

    $.ajax({ 
        type: 'POST', url: url, data: { 'Interface.Name1': selBandwidthValue}, dataType: 'json',
        success: function (data) {
            var valuesArray = new Array();
            var convertedValues = new Array();
            if(graphType == 'bandwidthUsage'){
               graphText = 'Total Bandwidth Usage';
               graphMeasure = 'KB';
            }else if(graphType == 'memoryUtilization'){
                 graphText = 'Total Memory Usage';
                 graphMeasure = 'KB';
            }
            var totalCount=0;
            var res ='';
            res ='[';
            for(i=0; i<data.data.length;i++){
                res = res +"{";
                lableObj = '"label":"' + (i+1) + '",';
                valueObj = '"value":"' + parseInt(data.data[i].value,10) + '",';
                convertedValues.push(parseInt(data.data[i].value,10));
                valuesArray[valuesArray.length] = data.data[i].value;
                backgroundObj = '"background":"' + data.data[i].background + '",';
                borderouterObj = '"borderouter":"' + data.data[i].borderouter + '",';
                borderinnerObj  = '"borderinner":"' + data.data[i].borderinner + '",';
                if(graphType == 'bandwidthUsage'){
                    toplabelObj = '"toplabel":"' + parseFloat(data.data[i].toplabel,10).toFixed(1) + '"';
                } 
                else {
                    toplabelObj = '"toplabel":"' + data.data[i].toplabel + '"';
                }
                res = res + lableObj + valueObj + backgroundObj + borderouterObj + borderinnerObj  + toplabelObj +"},";
            }

            var maxValue = Math.max.apply(Math,valuesArray); 
            /* Adding additional bigger values from MB to ZB*/
            if(maxValue > 1000 && maxValue <= 1000000 ){
                convertedValues.length = 0;
              if(graphType == 'bandwidthUsage'){
                    graphText = 'Total Bandwidth Usage';
                    graphMeasure = 'MB';
                }else if(graphType == 'memoryUtilization'){
                    graphText = 'Total Memory Usage';
                    graphMeasure = 'MB';
                }
               var totalCount=0;
               var res ='';
                res ='[';
                for(i=0; i<data.data.length;i++){
                    res = res +"{";
                    lableObj = '"label":"' + (i+1)+ '",';
                    valueObj = '"value":"' + (parseInt(data.data[i].value,10))/1000 + '",';
                    convertedValues.push(parseInt(data.data[i].value,10)/1000);
                        valuesArray[valuesArray.length] = data.data[i].value;
                    backgroundObj = '"background":"' + data.data[i].background + '",';
                    borderouterObj = '"borderouter":"' + data.data[i].borderouter + '",';
                    borderinnerObj  = '"borderinner":"' + data.data[i].borderinner + '",';
                    if(graphType == 'bandwidthUsage'){
                        toplabelObj = '"toplabel":"' + (parseFloat(data.data[i].toplabel,10)/1000).toFixed(1) + '"';
                    } 
                    else {
                        toplabelObj = '"toplabel":"' + data.data[i].toplabel + '"';
                    }
                    res = res + lableObj + valueObj + backgroundObj + borderouterObj + borderinnerObj  + toplabelObj +"},";
             
                }
                var maxValue = (Math.max.apply(Math,valuesArray))/1000;
            }    
            else if(maxValue > 1000000 && maxValue <= 1000000000){
                convertedValues.length = 0;
                if(graphType == 'bandwidthUsage'){
                    graphText = 'Total Bandwidth Usage';
                    graphMeasure = 'GB';
                }else if(graphType == 'memoryUtilization'){
                    graphText = 'Total Memory Usage';
                    graphMeasure = 'GB';
                }
                var totalCount=0;
                var res ='';
                res ='[';
                for(i=0; i<data.data.length;i++){
                    res = res +"{";
                    lableObj = '"label":"' +(i+1) + '",';
                    valueObj = '"value":"' + (parseInt(data.data[i].value,10))/1000000 + '",';
                    convertedValues.push(parseInt(data.data[i].value,10)/1000000);
                        valuesArray[valuesArray.length] = data.data[i].value;
                    backgroundObj = '"background":"' + data.data[i].background + '",';
                    borderouterObj = '"borderouter":"' + data.data[i].borderouter + '",';
                    borderinnerObj  = '"borderinner":"' + data.data[i].borderinner + '",';
                    if(graphType == 'bandwidthUsage'){
                        toplabelObj = '"toplabel":"' + (parseFloat(data.data[i].toplabel,10)/1000000).toFixed(1) + '"';
                    } 
                    else {
                        toplabelObj = '"toplabel":"' + data.data[i].toplabel + '"';
                    }
                    res = res + lableObj + valueObj + backgroundObj + borderouterObj + borderinnerObj  + toplabelObj +"},";
                }
                var maxValue = (Math.max.apply(Math,valuesArray))/1000000;
            }  
            else if(maxValue > 1000000000 && maxValue <= 1000000000000){
                convertedValues.length = 0;
                if(graphType == 'bandwidthUsage'){
                    graphText = 'Total Bandwidth Usage';
                    graphMeasure = 'TB';
                }else if(graphType == 'memoryUtilization'){
                    graphText = 'Total Memory Usage';
                    graphMeasure = 'TB';
                }
                var totalCount=0;
                var res ='';
                res ='[';
                for(i=0; i<data.data.length;i++){
                    res = res +"{";
                    lableObj = '"label":"' +(i+1) + '",';
                    valueObj = '"value":"' + (parseInt(data.data[i].value,10))/1000000000 + '",';
                    convertedValues.push(parseInt(data.data[i].value,10)/1000000000);
                        valuesArray[valuesArray.length] = data.data[i].value;
                    backgroundObj = '"background":"' + data.data[i].background + '",';
                    borderouterObj = '"borderouter":"' + data.data[i].borderouter + '",';
                    borderinnerObj  = '"borderinner":"' + data.data[i].borderinner + '",';
                    if(graphType == 'bandwidthUsage'){
                        toplabelObj = '"toplabel":"' + (parseFloat(data.data[i].toplabel,10)/1000000000).toFixed(1) + '"';
                    } 
                    res = res + lableObj + valueObj + backgroundObj + borderouterObj + borderinnerObj  + toplabelObj +"},";
                }
                var maxValue = (Math.max.apply(Math,valuesArray))/1000000000;
            }  
            else if(maxValue > 1000000000000 && maxValue <= 1000000000000000){
                convertedValues.length = 0;
                if(graphType == 'bandwidthUsage'){
                    graphText = 'Total Bandwidth Usage';
                    graphMeasure = 'PB';
                }else if(graphType == 'memoryUtilization'){
                    graphText = 'Total Memory Usage';
                    graphMeasure = 'PB';
                }
                var totalCount=0;
                var res ='';
                res ='[';
                for(i=0; i<data.data.length;i++){
                    res = res +"{";
                    lableObj = '"label":"' + (i+1) + '",';
                    valueObj = '"value":"' + (parseInt(data.data[i].value,10))/1000000000000 + '",';
                    convertedValues.push(parseInt(data.data[i].value,10)/1000000000000);
                        valuesArray[valuesArray.length] = data.data[i].value;
                    backgroundObj = '"background":"' + data.data[i].background + '",';
                    borderouterObj = '"borderouter":"' + data.data[i].borderouter + '",';
                    borderinnerObj  = '"borderinner":"' + data.data[i].borderinner + '",';
                    if(graphType == 'bandwidthUsage'){
                        toplabelObj = '"toplabel":"' + (parseFloat(data.data[i].toplabel,10)/1000000000000).toFixed(1) + '"';
                    } 
                    else {
                        toplabelObj = '"toplabel":"' + data.data[i].toplabel + '"';
                    }
                    res = res + lableObj + valueObj + backgroundObj + borderouterObj + borderinnerObj  + toplabelObj +"},";
                }
                var maxValue = (Math.max.apply(Math,valuesArray))/1000000000000;
            }   
            else if(maxValue > 1000000000000000 && maxValue <= 1000000000000000000){
                convertedValues.length = 0; 
                if(graphType == 'bandwidthUsage'){
                    graphText = 'Total Bandwidth Usage';
                    graphMeasure = 'EB';
                }else if(graphType == 'memoryUtilization'){
                    graphText = 'Total Memory Usage';
                    graphMeasure = 'EB';
                }
                var totalCount=0;
                var res ='';
                res ='[';
                for(i=0; i<data.data.length;i++){
                    res = res +"{";
                    lableObj = '"label":"' + (i+1) + '",';
                    valueObj = '"value":"' + (parseInt(data.data[i].value,10))/1000000000000000 + '",';
                    convertedValues.push(parseInt(data.data[i].value,10)/1000000000000000);
                        valuesArray[valuesArray.length] = data.data[i].value;
                    backgroundObj = '"background":"' + data.data[i].background + '",';
                    borderouterObj = '"borderouter":"' + data.data[i].borderouter + '",';
                    borderinnerObj  = '"borderinner":"' + data.data[i].borderinner + '",';
                    if(graphType == 'bandwidthUsage'){
                        toplabelObj = '"toplabel":"' + (parseFloat(data.data[i].toplabel,10)/1000000000000000).toFixed(1) + '"';
                    } 
                    else {
                        toplabelObj = '"toplabel":"' + data.data[i].toplabel + '"';
                    }
                    res = res + lableObj + valueObj + backgroundObj + borderouterObj + borderinnerObj  + toplabelObj +"},";
                }
                 var maxValue = (Math.max.apply(Math,valuesArray))/1000000000000000;
            }  
            else if(maxValue > 1000000000000000000){
                convertedValues.length = 0;
                if(graphType == 'bandwidthUsage'){
                    graphText = 'Total Bandwidth Usage';
                    graphMeasure = 'ZB';
                }else if(graphType == 'memoryUtilization'){
                    graphText = 'Total Memory Usage';
                    graphMeasure = 'ZB';
                }
                var totalCount=0;
                var res ='';
                res ='[';
                for(i=0; i<data.data.length;i++){
                    res = res +"{";
                    lableObj = '"label":"' + (i+1) + '",';
                    valueObj = '"value":"' + (parseInt(data.data[i].value,10))/1000000000000000000 + '",';
                    convertedValues.push(parseInt(data.data[i].value,10)/1000000000000000000);
                        valuesArray[valuesArray.length] = data.data[i].value;
                    backgroundObj = '"background":"' + data.data[i].background + '",';
                    borderouterObj = '"borderouter":"' + data.data[i].borderouter + '",';
                    borderinnerObj  = '"borderinner":"' + data.data[i].borderinner + '",';
                    if(graphType == 'bandwidthUsage'){
                        toplabelObj = '"toplabel":"' + (parseFloat(data.data[i].toplabel,10)/1000000000000000000).toFixed(1) + '"';
                    } 
                    else {
                        toplabelObj = '"toplabel":"' + data.data[i].toplabel + '"';
                    }
                    res = res + lableObj + valueObj + backgroundObj + borderouterObj + borderinnerObj  + toplabelObj +"},";
                }
                var maxValue = (Math.max.apply(Math,valuesArray))/1000000000000000000;
            }
            var minValue = 0;
            finalData=res.substring(0, res.length - 1);
            finalData = finalData + ']';
            var finalData1=jQuery.parseJSON(finalData);
            /* Set the global value */
            for(i=0; i<data.data.length;i++){
                retLabel = getAccountLabels(convertedValues[i]);
                retLabel.val = retLabel.val.toFixed(2);
                htmlArrayDisplay[i].val = retLabel.val;
                htmlArrayDisplay[i].units = retLabel.units;
            }
            var displayVal;
            if(graphType == 'bandwidthUsage'){
                //$("#tf1_bandWidth_heading").html(graphMeasure);
                $("#tf1_http").html(htmlArrayDisplay[0].val);
                $("#tf1_https").html(htmlArrayDisplay[1].val);
                $("#tf1_dns").html(htmlArrayDisplay[2].val);
                $("#tf1_snmp").html(htmlArrayDisplay[3].val);
                $("#tf1_other").html(htmlArrayDisplay[4].val);
                totalCount = parseFloat(htmlArrayDisplay[0].val,10)+parseFloat(htmlArrayDisplay[1].val,10)+parseFloat(htmlArrayDisplay[2].val,10)+parseFloat(htmlArrayDisplay[3].val,10)+parseFloat(htmlArrayDisplay[4].val,10);
                totalCount = totalCount.toFixed(2);
                var scaleObject = getScaleValuesfrBarCharts(maxValue);
                maxValue = scaleObject.maxValue;
                step = scaleObject.step;
                $("#tf1_loadingBandwidthDiv").hide();
                $("#tf1_bandwidthSec").show();
                var bwCtx = document.getElementById('bandWidthChart').getContext('2d');
                bwCtx.clearRect(0,0,280,160);
                var graph2 = new BarChart({
                    canvasId : "bandWidthChart",
                    data : finalData1,
                    color : "blue",
                    barWidth : 25,
                    minValue : 0,
                    maxValue : maxValue,
                    gridLineIncrement : step,
                    lefttext : '',
                    bottomColor : '#6a6a6a'
                });
                displayVal = graphText + ': ' + totalCount + ' ' + graphMeasure;
             $("#bandwidthUsageTotalCount").html(displayVal);
        }
            if(graphType == 'memoryUtilization'){
                //$("#tf1_memory_heading").html(graphMeasure);
                $("#tf1_used").html(htmlArrayDisplay[0].val);
                $("#tf1_free").html(htmlArrayDisplay[1].val);
                $("#tf1_cached").html(htmlArrayDisplay[2].val);
                $("#tf1_buffers").html(htmlArrayDisplay[3].val);
                var scaleObject = getScaleValuesfrBarCharts(maxValue);
                maxValue = scaleObject.maxValue;
                step = scaleObject.step;

                $("#tf1_loadingMemoryDiv").hide();
                $("#tf1_memorySec").show();
                var graph1 = new BarChart({
                    canvasId : "MemoryBarChart",
                    data : finalData1,
                    color : "blue",
                    barWidth : 25,
                    minValue : 0,
                    maxValue : maxValue,
                    gridLineIncrement : step,
                    lefttext : '',
                    bottomColor : '#4485bb'
                });
                // Here we can get totMemory from the addition of
                // used memory and free memory
                var totMemory = parseFloat(htmlArrayDisplay[0].val,10)+parseFloat(htmlArrayDisplay[1].val,10);
                totMemory = totMemory.toFixed(2);
                displayVal = graphText + ': ' + totMemory + ' ' + graphMeasure;
                $("#memoryUtilizationTotalCount").html(displayVal); 
            }
       }
    });
}
/* Fix for dashboard scaling issue ends */
	var can, ctx, maxVal, minVal, xScalar, yScalar, numSamples, header, set1, set2, set3, stepSize;
	
	function lineGraphInit() {

            // set these values for your data						 
 
            var colHead = 5;

            var rowHead = 35;

            var margin = 0;           

            ctx = can.getContext("2d");

            ctx.fillStyle = "#666666"

            ctx.font = "8pt Trebuchet MS"; 
            // set vertical scalar to available height / data points
            yScalar = (can.height - colHead - margin  - 20) / (maxVal - minVal);			
            // set horizontal scalar to available width / number of samples
            xScalar = (can.width - rowHead) / numSamples;                       
 
			bottom = can.height - margin;			
            
			ctx.lineWidth = 1;
			ctx.strokeStyle = "#ccc";
   
			if ( ctx.setLineDash !== undefined )   ctx.setLineDash([2,1]);
			if ( ctx.mozDash !== undefined )       ctx.mozDash = [2,1];

            ctx.beginPath();		
			


            // print  column header and draw vertical grid lines
			ctx.fillText("MB", 10, can.height - 2);
			
			
           for (i = 1; i <= 6; i++) {
                var x = i * xScalar;
               // ctx.fillText(header[i], x, colHead - margin);
               if (header[i]) {
               ctx.fillText(header[i], x, can.height - 2 - margin);
               }
               ctx.moveTo(x, colHead);
               ctx.lineTo(x, can.height - 20);
               
            }
            // print row header and draw horizontal grid lines

            var count = 0;

            for (scale = maxVal; scale >= minVal; scale -= stepSize) {
                var y = colHead + (yScalar * count * stepSize);
                ctx.fillText(scale, margin+10, y + margin + 4);
                ctx.moveTo(rowHead+5, y )
				tmpWidth = can.width - 35;
                ctx.lineTo(tmpWidth, y );
                count++;
            }

            ctx.stroke(); 

            // set a color and make one call to plotData()
            // for each data set
            
             

        }

function lineGraphInit2() {

            // set these values for your data						 
 
            var colHead = 5;

            var rowHead = 35;

            var margin = 0;           

            ctx = can.getContext("2d");

            ctx.fillStyle = "#666666"

            ctx.font = "8pt Trebuchet MS"; 
            // set vertical scalar to available height / data points
            yScalar = (can.height - colHead - margin  - 20) / (maxVal - minVal);			
            // set horizontal scalar to available width / number of samples
            xScalar = (can.width - rowHead) / numSamples;                       
 
			bottom = can.height - margin;			
            
			ctx.lineWidth = 1;
			ctx.strokeStyle = "#ccc";
   
			if ( ctx.setLineDash !== undefined )   ctx.setLineDash([2,1]);
			if ( ctx.mozDash !== undefined )       ctx.mozDash = [2,1];

            ctx.beginPath();		
			


            // print  column header and draw vertical grid lines
			//ctx.fillText("MB", 10, can.height - 2);
			
			
           for (i = 1; i <= numSamples; i++) {
                var x = i * xScalar;
               // ctx.fillText(header[i], x, colHead - margin);
                if (header[i]) {         
               ctx.fillText(header[i], x, can.height - 2);
                }
               ctx.moveTo(x, colHead);
               ctx.lineTo(x, can.height - 20);
            }
            // print row header and draw horizontal grid lines

            var count = 0;

            for (scale = maxVal; scale >= minVal; scale -= stepSize) {
                var y = colHead + (yScalar * count * stepSize);
                ctx.fillText(scale, margin+10, y + margin + 4);
                ctx.moveTo(rowHead+5, y )
				tmpWidth = can.width - 35;
                ctx.lineTo(tmpWidth, y );
                count++;
            }

            ctx.stroke(); 

            // set a color and make one call to plotData()
            // for each data set
            
             

        }

 

        function plotData(dataSet) {

            ctx.beginPath();
			//dataSet = dataSet.splice(0,0,0);
			y = bottom - dataSet[0] * yScalar + yScalar * minVal;
           	ctx.moveTo(xScalar, y - 20);           	
           	if ( ctx.setLineDash !== undefined )   
           		ctx.setLineDash([2,0]);           	
			if ( ctx.mozDash !== undefined )       
				ctx.mozDash = [2,0];          	 

            for (i = 0; i < numSamples; i++) {
            	if(dataSet[i])
               		y = bottom - dataSet[i] * yScalar + yScalar * minVal;
               	else
               		y = bottom - 0 * yScalar + yScalar * minVal;
               		
               tmpi = i + 1;               
               ctx.lineTo(tmpi* xScalar, y-20);            
               
            }
            ctx.stroke();

        }
		
		function getOptionPortsGraph(url) {	
			//url: "dashboardOptionPortsData.txt", 
		 	
			$.ajax({ 
				    type: 'POST', 
					url: url,
					data: { get_param: 'value' },
					dataType: 'json',
				    success: function (data) { 	
						
						$("#tf1_loadingOptionPortsDiv").hide();
						$("#tf1_optionPortsSec").show();
		 
						option1Tmp = data.option1.split(",");
						option2Tmp = data.option2.split(",");
						option3Tmp = data.option3.split(",");
                        headerTmp = data.header.split(",");

                        option1Tmp = option1Tmp.reverse();
                        option2Tmp = option2Tmp.reverse();
			 option3Tmp = option3Tmp.reverse();
                        headerTmp = headerTmp.reverse();
                        
                        option1 = new Array();
                        option2 = new Array();
			 option3 = new Array();
                        header = new Array();

                        for (i=0; i < option1Tmp.length ; i++) {

                            

                         option1[i] = option1Tmp[i];
                         option2[i] = option2Tmp[i];
			  option3[i] = option3Tmp[i];
                         header[i] = headerTmp[i];
                         if (i == 5) {
                            break;
                          }
                        }

                        option1 = option1.reverse();
                        option2 = option2.reverse();
			 option3 = option3.reverse();
                        header = header.reverse();

						numSamples = parseInt(option1.length,10);
                        numSamples = 6;

						var valuesArray = new Array();
            			for (i=0; i<option1.length; i++) {
							valuesArray[valuesArray.length] = option1[i];
						}
						for (i=0; i<option2.length; i++) {
							valuesArray[valuesArray.length] = option2[i];
						}
						for (i=0; i<option3.length; i++) {
							valuesArray[valuesArray.length] = option3[i];
						}          
                   
						
                        minVal = 0;
                        var maxValue = Math.max.apply(Math,valuesArray);						 
						var scaleObject = getScaleValues5Grid(maxValue);
						maxVal = scaleObject.maxValue;
						stepSize = scaleObject.step;					
						
						can = document.getElementById("optionPortsChart");								
						lineGraphInit(can);
						
						ctx.strokeStyle = "#5999c3";
						plotData(option1);
						
						ctx.strokeStyle = "#d53d54";
						plotData(option2);
						
						if ($("#tf1_unit_name").val() == "DSR-1000" || $("#tf1_unit_name").val() == "DSR-1000N" || $("#tf1_product_id").val() == "DSR-1000AC_Ax" || $("#tf1_product_id").val() == "DSR-1000_Bx") {
							ctx.strokeStyle = "#f6c11d";
							plotData(option3);
						}
                    
                       var currentOption1data = Number(data.currentOption1data);		                   
                       currentOption1data = currentOption1data.toFixed(2);
                       $("#tf1_currentOptionData1").html('WAN1 ' + currentOption1data + "  MB/s");

                       var currentOption2data = Number(data.currentOption2data);
                       currentOption2data = currentOption2data.toFixed(2);
                       $("#tf1_currentOptionData2").html('WAN2 ' + currentOption2data + "  MB/s");



                     if (data.wan1status == "UP") {                        
                          $("#tf1_option1Status").attr("class","option1ImgUp");                        
                     } else {
                        $("#tf1_option1Status").attr("class","option1ImgDown");
                     }
                
                     if (data.wan2status == "UP") {                        
                          $("#tf1_option2Status").attr("class","option2ImgUp");                        
                     } else {
                        $("#tf1_option2Status").attr("class","option2ImgDown");
                     }
					 if ($("#tf1_product_id").val() == "DSR-1000AC_Ax" || $("#tf1_product_id").val() == "DSR-1000_Bx" || $("#tf1_unit_name").val() == "DSR-1000" || $("#tf1_unit_name").val() == "DSR-1000N") {
						 var currentOption3data = Number(data.currentOption3data);
		                   currentOption3data = currentOption3data.toFixed(2);
		                   $("#tf1_currentOptionData3").html('WAN3 ' + currentOption3data + "  MB/s");
	 					 if (data.wan3status == "UP") {                        
		                      $("#tf1_option3Status").attr("class","option3ImgUp");                        
		                 } else {
		                    $("#tf1_option3Status").attr("class","option3ImgDown");
		                 }
					}


						 
					}
				   });
			 
			
			
			
		
		}
		
		function getVpnGraph(url,imageType) {
	
			
			$.ajax({ 
				    type: 'POST', 
					url: url, 
					data: { get_param: 'value' },
					dataType: 'json',
				    success: function (data) { 	
						
						$("#tf1_loadingVpnsDiv").hide();
						$("#tf1_vpnsSec").show();
						vpn1 = data.vpn1.split(",");
						vpn2 = data.vpn2.split(",");
                        vpn3 = data.vpn3.split(","); 
						numSamples = parseInt(data.numSamples,10);
						maxVal = parseInt(data.maxVal,10);
						minVal = parseInt(data.minVal,10);
						stepSize = 2;

                        var valuesArray = new Array();
                        for (i=0; i<vpn1.length; i++) {
							valuesArray[valuesArray.length] = vpn1[i];
						}
						for (i=0; i<vpn2.length; i++) {
							valuesArray[valuesArray.length] = vpn2[i];
						}
                        for (i=0; i<vpn3.length; i++) {
							valuesArray[valuesArray.length] = vpn3[i];
						}              
                   
						
                        minVal = 0;
                        var maxValue = Math.max.apply(Math,valuesArray);						 
						var scaleObject = getScaleValues5Grid(maxValue);
						maxVal = scaleObject.maxValue;
						stepSize = scaleObject.step;	

                        numSamples = 6;
						header = data.header.split(",");
						can = document.getElementById("vpnChart");			
						lineGraphInit2(can);
						
						ctx.strokeStyle = "#5797C2";
						plotData(vpn1);
						
						
                        if (imageType == "HIGH"){
                        ctx.strokeStyle = "#F8CD4A";
						plotData(vpn2);
                         $("#tf1_sslVpn").html(data.sslVpn);
                        }
                        $("#tf1_ipsecGateway").html(data.ipsecGateway);
                        $("#tf1_ipsecClient").html(data.ipsecClient);
                        ctx.strokeStyle = "#AB3383";
                        plotData(vpn3);
                       
                        
						 
					}
				   });
			 
		
		
		}
		
		
		var wLanTypes, rangeValues, wLanValues, yrgVal, vGoal, BarCanvas


function wLanGraphInit() {
var totalCount=0;
  // extract percentages
  for (i=0; i<4; i++) {  
  	 
    var vPct = wLanValues[i]/vGoal;
    yrgVal[i] = vPct;
    
    totalCount = parseInt(totalCount)+parseInt(wLanValues[i]);
  }
 
  var bcctx = BarCanvas.getContext("2d");
 


  // build header
  bcctx.beginPath();
  

  bcctx.font = "bold 9pt Trebuchet MS";
  bcctx.textBaseline = "top";
  bcctx.textAlign = "left";
  bcctx.fillStyle = "#000000"; // text color

  //bcctx.fillText("Current 12 Month Sales Goal Achievement Levels", 8, 5);

 
// draw grid
  for (var x = 75; x < 250; x += 40) {
    bcctx.moveTo(x, 0);
    bcctx.lineTo(x, 150);
  }
  
  for (var y = 0; y < 190; y += 38) {
    bcctx.moveTo(75, y);
    bcctx.lineTo(237, y);
		 
  }
  bcctx.strokeStyle = "#ebebeb";
  bcctx.stroke();
  

  // initialize chart variables
  var vYpos = 0;
  var c_ddPct = 0;
  var cBarIncr = 180;
  var barX = 75;
  var pctX = 200;

  // draw chart
  for (var i = 0; i < wLanTypes.length; i++) {

    // month/year display
     if ( i == 0 )
	 {
	 	vYpos = 5;
		
	 } else if ( i == 1 ) {
	 	vYpos = 42;
	 } else if (i == 2 ) {
	 	vYpos = 80;
	 } else {	 		
		vYpos = 118;
	 }
     
	 if ( i == 0 ) {
	 	bcctx.fillStyle = "#515151";
    	bcctx.fillText(wLanTypes[i], 8, vYpos + 6);
		bcctx.fillStyle = "#428eb4";
	} 
	
	if ( i == 1 ) {
		bcctx.fillStyle = "#515151";
	 	bcctx.fillText(wLanTypes[i], 8, vYpos + 6);
		bcctx.fillStyle = "#d3bf5b";
	 
	 }
	if ( i == 2 ) {
		bcctx.fillStyle = "#515151";
		bcctx.fillText("Transmit", 8, vYpos + 3);
		bcctx.fillText("Dropped", 8, vYpos + 20);
		bcctx.fillStyle = "#5c8533";
	}
	
	if ( i == 3 ) {
		bcctx.fillStyle = "#515151";
		bcctx.fillText("Recieve", 8, vYpos + 3);
		bcctx.fillText("Dropped", 8, vYpos + 20);		
		bcctx.fillStyle = "#ab3383";
				 
	}

    // draw bar
    var cChrtBr = (yrgVal[i]-c_ddPct);
    var cBarLen = parseInt(cBarIncr*cChrtBr) - 5;
     
	
	if (cBarLen  > 160 )
	{
		cBarLen = 160;
	}
    
	if (vYpos > 5 ) {
		bcctx.fillRect(barX, vYpos, cBarLen, 30);
	}
	 
    	bcctx.fillStyle = "#428eb4";
   	bcctx.fillText(wLanValues[i], 240, vYpos + 6);

  }
  $("#WLANStatisticsTotalCount").html(LANG_LOCALE['13120']+": "+totalCount);
}


		function getWlanHorizontalGraph(url) {
			 
			var selWlanDataTypeObj = document.getElementById("tf1_wlanDataType");
			var selWlanDataTypeValue = selWlanDataTypeObj.options[selWlanDataTypeObj.selectedIndex].value;
			$.ajax({ 
				    type: 'POST', 
					url: url, 
					data: { 'wlan.dataType': selWlanDataTypeValue },
					dataType: 'json',
				    success: function (data) { 

							
						$("#tf1_loadingWlanStatisticsDiv").hide();
						$("#tf1_wlanStatisticsSec").show();
					
						wLanTypes = data.wLanTypes.split(",");
						rangeValues = data.rangeValues.split(",");
						wLanValues = data.wLanValues.split(",");
						vGoal = parseInt(data.vGoal,10);
						yrgVal = new Array();			
						BarCanvas = document.getElementById("wlanBarChart");
						wLanGraphInit();
						
						}
				   });
			
			/*
			wLanTypes = ["Transmitted","Recieved","Transmit Dropped","Recieve Dropped"];
			rangeValues = [0,5000,10000,15000,20000];
			wLanValues = [0,5000,8368,19000];
			vGoal = 20000;
			*/
			
		
		}



function validateDashboardMaps(){									
	showHideSection('tf1_trafficOverviewValue','tf1_trafficSec');
	showHideSection('tf1_discoveredAPsValue','tf1_discoveredApsSec');
	showHideSection('tf1_optionPortsValue','tf1_optionPortsSec');
				
	showHideSection('tf1_bandwidthUsageValue','tf1_bandwidthSec');
	showHideSection('tf1_WLANStatisticsValue','tf1_wlanStatisticsSec');	
	showHideSection('tf1_VPNsValue','tf1_vpnsSec');
				
	showHideSection('tf1_CPUUtilizationValue','tf1_CPUSec');
	showHideSection('tf1_MemoryUtilizationValue','tf1_memorySec');	
	showHideSection('tf1_ActiveInfoValue','tf1_activeInfoSec');
	HideDialog('tf1_dialog', 'tf1_overlay');
}
function enableDisableFieldsByImageClick(data, thisObj) { 
	onAnchorToggle (data);
	var imgId=thisObj.id;
    
	switch(imgId){
	   	case 'tf1_trafficOverview':
	   		setImageHiddenValue('tf1_trafficOverviewValue');    			   		
	   	break;
	   	case 'tf1_discoveredAPs':
	   		setImageHiddenValue('tf1_discoveredAPsValue');
	   	break;
	   	case 'tf1_optionPorts':
	   		setImageHiddenValue('tf1_optionPortsValue');
	   	break;
    			   	
	   	case 'tf1_bandwidthUsage':
	   		setImageHiddenValue('tf1_bandwidthUsageValue');
	   	break;
	   	case 'tf1_WLANStatistics':
			setImageHiddenValue('tf1_WLANStatisticsValue');
	   	break;
	   	case 'tf1_VPNs':
	  		setImageHiddenValue('tf1_VPNsValue');
	   	break;
    			   	
    	case 'tf1_CPUUtilization':
    		setImageHiddenValue('tf1_CPUUtilizationValue');
    	break;
    	case 'tf1_MemoryUtilization':
    		setImageHiddenValue('tf1_MemoryUtilizationValue');
    	break;
    	case 'tf1_ActiveInfo':
    		setImageHiddenValue('tf1_ActiveInfoValue');
    	break;   	
   	}
}
function setImageHiddenValue(imgHid){
	var hdVal=$("#"+imgHid).val();
	if(hdVal == 0){
	   	$("#"+imgHid).val(1);  			   
	}else{
	   	$("#"+imgHid).val(0);
	}
}
function showHideSection(imgHid,imgSection){
	if($("#"+imgHid).val() == 0)
		$("#"+imgSection).css("display","none");
	else
		$("#"+imgSection).css("display","block");
}
function hideSectionsOnload(imgSection){
	$("#"+imgSection).css("display","none");
}


