///////////////////////////
function drawTable(dataGrid, containerId, optObj) {



	google.charts.load('current', {'packages':['table']});
        google.charts.setOnLoadCallback(drawTable);
        function drawTable(){
		var data = new google.visualization.DataTable();

		for (var j=0; j < dataGrid[0].length; j++){
                        data.addColumn(dataGrid[1][j], dataGrid[0][j]);
                }
                for (var i=2; i < dataGrid.length; i++){
			data.addRows([dataGrid[i]]);
                }
                var em = document.getElementById(containerId);
                var table = new google.visualization.Table(em);
		var options = {showRowNumber: false, width: '100%', height: '100%',
				page:'enable', pageSize:optObj["pagesize"], allowHtml:true, 
				cssClassNames:{headerRow: 'googlebigbold', tableCell:'googlecell'}
		};
		table.draw(data, options);
        }
        return;
}

///////////////////////////
function drawAreaPlot(seriesData, colNames, divName, plotTitle, xTitle, yTitle, tickFreq) {

        var data = new google.visualization.DataTable();
        data.addColumn('number', colNames[0]);
        data.addColumn('number', colNames[1]);
	data.addColumn('number', colNames[2]);
        data.addColumn({type: 'string', role: 'style'});

        var rows = [];
        for (var i in seriesData){
                rows.push([seriesData[i]["x"],  seriesData[i]["y1"], seriesData[i]["y2"], seriesData[i]["style"]]);
        }
        data.addRows(rows);

        var options = {
          title: plotTitle,
          hAxis: {title: xTitle, minValue: 0, maxValue: 15},
          vAxis: {title: yTitle, minValue: 0, maxValue: 15},
	  legend: {position: 'top', maxLines: 3}
        };

	var chart = new google.visualization.AreaChart(document.getElementById(divName));
        chart.draw(data, options);
}


///////////////////////////
function drawScatterPlot(seriesData, divName, plotTitle, xTitle, yTitle, tickFreq) {

        var data = new google.visualization.DataTable();

        data.addColumn('number', 'x-values');
        data.addColumn('number', 'y-values');
        data.addColumn({type: 'string', role: 'style'});

        var rows = [];
        for (var i in seriesData){
                rows.push([seriesData[i]["x"],  seriesData[i]["y1"], seriesData[i]["style"]]);
        }
        data.addRows(rows);

	
	var options = {
          title: plotTitle,
          hAxis: {title: xTitle, minValue: 0, maxValue: 15},
          vAxis: {title: yTitle, minValue: 0, maxValue: 15},
          legend: 'none'
        };
 	var chart = new google.visualization.ScatterChart(document.getElementById(divName));
        chart.draw(data, options);


}


///////////////////////////
function drawSingleSeries(seriesData, divName, xTitle, yTitle, tickFreq) {

        var data = new google.visualization.DataTable();
        data.addColumn('number', 'x-values');
        data.addColumn('number', 'y-values');
        data.addColumn({type: 'string', role: 'style'});
	data.addColumn({type: 'string', role: 'annotation'});
	var rows = [];
        for (var i in seriesData){
                rows.push([seriesData[i]["x"],  seriesData[i]["y1"], seriesData[i]["style"], 
				seriesData[i]["annotation"]]);
        }
        data.addRows(rows);


	var xTextStyle = { color: '#000', fontSize: '10'}; 
	var yTextStyle = {color: '#000',fontSize: '10'};
	var titleTextStyle = { color:'#777777', fontName:'', fontSize:11, bold:false, italic:false};
	var toolTip = {isHtml: true, textStyle:  {fontName: 'TimesNewRoman', fontSize: 10,bold: false}};

	var options = {'title':''
		,titleTextStyle: titleTextStyle
		,tooltip: toolTip
        	,annotations: {textStyle:  {fontName: 'TimesNewRoman', fontSize: 10,bold: false}, style: 'line'}
        	,explorer: {actions:['dragToZoom','rightClickToReset']}
		,vAxis:{title:yTitle, textStyle:yTextStyle, minValue:0}
		,hAxis: {title: xTitle,textStyle:xTextStyle,slantedText:true,slantedTextAngle:45,showTextEvery:2}
		,chartArea: { width: "100%", height: "50%", left:50, top:50}
		,bar:{groupWidth:2}
		,legend: 'none'
		,width: "100%"
        	,height: "100%"
		,explorer: {actions:['dragToZoom','rightClickToReset']}
	};
        
	var my_div = document.getElementById(divName);
	var my_chart = new google.visualization.ColumnChart(my_div);
        my_chart.draw(data, options);
	//google.visualization.events.addListener(my_chart, 'ready', function () {
      	//	my_div.innerHTML = '<img src="' + my_chart.getImageURI() + '">';
    	//});



}


/////////////////////////////////////
function drawToyChart(plotDivId) {

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['Mushrooms', 3],
          ['Onions', 1],
          ['Olives', 1],
          ['Zucchini', 1],
          ['Pepperoni', 2]
        ]);
        var options = {'title':'How Much Pizza I Ate Last Night',
                       'width':400,
                       'height':300};

        var chart = new google.visualization.PieChart(document.getElementById(plotDivId));
        chart.draw(data, options);

}






