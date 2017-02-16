<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<style>
/*시뮬레이터 CSS*/
 	 .layer {display:none; position:fixed; _position:absolute; top:0; left:0; width:100%; height:100%; z-index:100;}
		.layer .bg {position:absolute; top:0; left:0; width:100%; height:100%; background:#000; opacity:.5; filter:alpha(opacity=50);}
		.layer .pop-layer {display:block;}

	.pop-layer {display:none; position: absolute; top: 150px; left: 300px; width: 500px; height:800px;  background-color:#fff; border: 5px solid #3571B5; z-index: 10;}	
	.pop-layer .pop-container {padding: 20px 25px;}
	.pop-layer p.ctxt {color: #666; line-height: 25px;}
	.pop-layer .btn-r {width: 100%; margin:10px 0 20px; padding-top: 10px; border-top: 1px solid #DDD; text-align:right;}
	
	.pop-layer2 {display:none; position: absolute; top: 150px; left: 900px; width: 850px; height:800px;  background-color:#fff; border: 5px solid #3571B5; z-index: 10;}	
	.pop-layer2 .pop-container {padding: 20px 25px;}
	.pop-layer2 p.ctxt {color: #666; line-height: 25px;}
	.pop-layer2 .btn-r {width: 100%; margin:10px 0 20px; padding-top: 10px; border-top: 1px solid #DDD; text-align:right;}

	a.cbtn {display:inline-block; height:25px; padding:0 14px 0; border:1px solid #304a8a; background-color:#3f5a9d; font-size:13px; color:#fff; line-height:25px;}	
	a.cbtn:hover {border: 1px solid #091940; background-color:#1f326a; color:#fff;}


/* input[type="checkbox"] {
    display:none;
}

input[type="checkbox"] + label {
    color:#f2f2f2;
}

input[type="checkbox"] + label span {
    display:inline-block;
    width:19px;
    height:19px;
    margin:-2px 10px 0 0;
    vertical-align:middle;
    background:url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png) left top no-repeat;
    cursor:pointer;
}

input[type="checkbox"]:checked + label span {
    background:url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png) -19px top no-repeat;
} */

input[type="radio"] {
    display:none;
}

input[type="radio"] + label {
    color:#f2f2f2;
    font-family:Arial, sans-serif;
}

input[type="radio"] + label span {
    display:inline-block;
    width:19px;
    height:19px;
    margin:-2px 10px 0 0;
    vertical-align:middle;
    background:url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png) -38px top no-repeat;
    cursor:pointer;
}

input[type="radio"]:checked + label span {
    background:url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png) -57px top no-repeat;
}


select { width: 70px; /* 원하는 너비설정 */ 
	padding: .3em .2em; /* 여백으로 높이 설정 */ 
	font-family: inherit; /* 폰트 상속 */ 
	background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
	border: 1px solid #999; border-radius: 0px; /* iOS 둥근모서리 제거 */ 
	-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	-moz-appearance: none; 
	appearance: none; 
}

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}

#myProgress {
  width: 100%;
  height: 30px;
  background-color: #ddd;
}

#myBar {
  width: 0%;
  height: 100%;
  background-color: #4CAF50;
}

#label {
  text-align: center;
  line-height: 30px;
  color: white;
}

.button {
  padding: 15px 25px;
  font-size: 15px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color: #6799FF;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button:hover {background-color: #4374D9}

.button:active {
  background-color: #4374D9;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

</style>
</head>
<body>
	<%-- <script src="<%=request.getContextPath()%>/resources/js/jquery-1.9.1.js"></script> --%>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/examples-base.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/highlight.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/simulator.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/fusioncharts.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/fusioncharts.charts.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/fusioncharts.powercharts.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/fusioncharts.widgets.js"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=B3S2a2PwxQRRyezwDNUx&amp;submodules=panorama"></script>
    
  <script>
        var HOME_PATH = '<%=request.getContextPath()%>/resources';
  </script>
 <section class="breadcrumbs_block clearfix parallax">
				<div class="container center">
					<h2>
						<b>SIMULATOR</b>
					</h2>
					<br> <br>
					<p>창업할 지역을 선택해 주세요</p>
				</div>
</section> 
 
<!-- @category DataLayer -->

<div id="page">

<div id="wrap" class="section">
<br><br>
<!-- <div style="text-align:center;"><h2>SIMULATOR</h2>
(창업할 지역을 선택해주세요)</div>
<hr color="grey" width="1000px"> -->
    <div id="map" style="width:70%;height:700px; margin:0 auto;"></div>
</div>



<script id="code">
var map = new naver.maps.Map(document.getElementById('map'), {
    zoom: 6,
    minZoom: 6,
    maxZoom: 6,
    mapTypeId: 'normal',
    center: new naver.maps.LatLng(33.3718377, 126.5298401)

});

var HOME_PATH = window.HOME_PATH || '.';

$.ajax({
    url: HOME_PATH +'/data/jeju.geojson',
    dataType: 'json',
    success: startDataLayer
});

var tooltip = $('<div style="position:absolute;z-index:1000;padding:5px 10px;background-color:#fff;border:solid 2px #000;font-size:14px;pointer-events:none;display:none;"></div>');
tooltip.appendTo(map.getPanes().floatPane);

function startDataLayer(geojson) {
    map.data.addGeoJson(geojson);

    map.data.setStyle(function(feature) {
        var color = 'lightgreen';

        if (feature.getProperty('isColorful')) {
            color = feature.getProperty('color');
        }
 
        return {
            //fillColor: none,
            strokeColor: color,
            strokeWeight: 2,
            icon: null
        };
    });

    map.data.addListener('click', function(e) {
        e.feature.setProperty('isColorful', true);
        //e.feature.getProperty('EMD_KOR_NM');
        document.getElementById('address').value=e.feature.getProperty('EMD_KOR_NM');
        layer_open('layer2');return false;
    });

    map.data.addListener('dblclick', function(e) {
        var bounds = e.feature.getBounds();

        if (bounds) {
            map.panToBounds(bounds);
        }
    });

    map.data.addListener('mouseover', function(e) {
        map.data.overrideStyle(e.feature, {
            strokeWeight: 8,
            icon: HOME_PATH +'/images/pin_spot.png'
        });
        
        var feature = e.feature,
        regionName = feature.getProperty('EMD_KOR_NM');
        
        tooltip.css({
            display: '',
            left: e.offset.x,
            top: e.offset.y
        }).text(regionName);
        
    });

    map.data.addListener('mouseout', function(e) {
    	tooltip.hide().empty();
        map.data.revertStyle();
    });
}


function layer_open(el){

	var temp = $('#' + el);
	var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

	if(bg){
		$('.layer').fadeIn();	//'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
	}else{
		temp.fadeIn();
	}
	
	$('#offOption').hide();

	/* // 화면의 중앙에 레이어를 띄운다.
	if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
	else temp.css('top', '0px');
	if (temp.outerWidth() < $(document).width() ) temp.css('margin-right', '-'+temp.outerWidth()/10+'px');
	else temp.css('right', '0px'); */

	temp.find('a.cbtn').click(function(e){
		if(bg){
			$('.layer').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
		}else{
			temp.fadeOut();
		}
		e.preventDefault();
		document.frm.reset();
	});

	/* $('.layer .bg').click(function(e){	//배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
		$('.layer').fadeOut();
		e.preventDefault();
	}); */

}


function layer_open2(el){

	var temp = $('#' + el);
	//var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수
	temp.fadeIn();

	/* // 화면의 중앙에 레이어를 띄운다.
	if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
	else temp.css('top', '0px');
	if (temp.outerWidth() < $(document).width() ) temp.css('margin-right', '-'+temp.outerWidth()/10+'px');
	else temp.css('right', '0px'); */
	temp.find('a.cbtn').click(function(e){
		temp.fadeOut();
		e.preventDefault();
	});

	/* $('.layer .bg').click(function(e){	//배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
		$('.layer').fadeOut();
		e.preventDefault();
	}); */

}

var cnt = 1;
var term = 0;
var salesAccount = 0;
var population = 0;
var tourist = 0;
var shop = 0;
var lent = 0;
var flowage = 0;
var expenditure = 0;
var benefit = 0;
var restart = 0;

function interval(){
	salesAccount=0;
	term = $("select[name=endPeriod]").val()*1 - $("select[name=startPeriod]").val()*1
	if($('#addrDetail').val()==''){
		alert('상세주소를 입력해 주세요');
		return;
	}else if($("select[name=startPeriod]").val()>=$("select[name=endPeriod]").val()){
		alert('영업기간을 정확히 입력해주세요');
		return;
	}else{
		layer_open2('layer3');	
		setTest = setInterval("start()",2000);
	}
	
	var elem = document.getElementById("myBar");   
	  var width = 0;
	  var id = setInterval(frame, 1000);
	  function frame() {
	    if (width >= 100) {
	      clearInterval(id);
	    } else {
	      width += 5;
	      elem.style.width = width + '%'; 
	      document.getElementById("label").innerHTML = width * 1  + '%';
	    }
	  }
	  restart++;
	  
}

function start(){
	
	$.ajax({
		url:"start",
		type:"post",
		async:false,
		data:{"radio":$('input:radio[name="radio"]:checked').val(),
			"addr":$('#address').val(),
			"startPeriod":$("select[name=startPeriod]").val(),
			"endPeriod":$("select[name=endPeriod]").val(),
			"addrDetail":$('#addrDetail').val(),
			"kind":$("select[name=kind]").val(),
			"marketing":$('input:radio[name="marketing"]:checked').val(),
			"prodManage":$('input:radio[name="prodManage"]:checked').val(),
			"benefit":$('input:radio[name="benefit"]:checked').val(),
			"sitemap":$('input:radio[name="sitemap"]:checked').val(),
			"prodDirect":$('input:radio[name="prodDirect"]:checked').val(),
			"cooperation":$('input:radio[name="cooperation"]:checked').val(),
			"itemCreativity":$('input:radio[name="itemCreativity"]:checked').val(),
			"customerManage":$('input:radio[name="customerManage"]:checked').val()
			
		},
		success:function(data){
			if($("input:radio[id='radio1']").is(":checked")){
				population = 0;
				tourist = 0;
				shop = 0;
				lent = 0;
				flowage = 0;
				salesAccount = salesAccount*1 + data[0]*term;
			}else{
				population = data[0];
				tourist = data[1];
				shop = data[2];
				lent = data[3];
				flowage = data[4];
				salesAccount = salesAccount*1 + data[5]*term;
			}
			expenditure = Math.floor((salesAccount*(Math.random()*7+73)/100)/1000)*1000;
			benefit = Math.floor((salesAccount*1 - expenditure*1)/1000)*1000;
		},
		error:function(){
			alert("통신실패!!!!!!!!!!!");
		}

	});
	
	if(cnt==1){
		if(restart==1){
			FusionCharts1();	
		}
		FusionCharts2();
		FusionCharts3();
	}
	
	if(restart>=2){
		//revBulletChart.restartUpdate();
		FusionCharts5();
	}
	
	
	if(cnt==10){		
		FusionCharts2();
		clearInterval(setTest);
		//salesAccount = 0;
		cnt=0;
		alert("시뮬레이션이 끝났습니다");
	}
	
	//alert(salesAccount);
	cnt++;
	//alert(cnt);		
}


function FusionCharts1() {
   var revBulletChart = new FusionCharts({
    	id: 'stackedbullet',
    	type: 'vbullet',
        renderAt: 'chart-container',
        width: '170',
        height: '300',
        dataFormat: 'json',
        dataSource: {
            "chart": {
            	"id":"test",
                "caption": "총매출",
                "subcaption": "(단위:천원)",
                "captionFontSize": "11.5",
                "subcaptionFontSize": "11.5",
                "subcaptionFontBold": "1",
                "captionPadding": "5",
                "animation": "1",
                "upperLimit": "12000",
                "numberprefix": "￦",
                "targetFillPercent": "75",
                "targetColor": "#444444",
                "plotFillPercent": "40",
                "plotFillColor": "#444444",
                "formatNumberScale": "0",
                "baseFontColor": "595959",
                "plotToolText": "<div>Sales : <b>$$value</b></div>",
                "targettooltext": "Target : <b>$$targetvalue</b>",
                "theme": "zune",
                "dataStreamURL": "../../resources/php/gauge-and-widgets-guide-bullet-chart-real-time-bullet-chart-php-1.php",
                "exportEnabled":"1",
                "refreshInterval": "2"
            },
            "colorRange": {
                "color": [
                    {
                    	"minValue":"0",
                    	"maxValue":"3000",
                    	"code":"#999498"
                    	
                    },
                    {
                        "minValue": "3000",
                        "maxValue": "6000",
                        "code": "#BDBDBD"
                    },
                    {
                        "minValue": "6000",
                        "maxValue": "9000",
                        "code": "#c5c2c6"
                    },
                    {
                        "minValue": "9000",
                        "maxValue": "12000",
                        "code": "#e1dee2"
                    }
                ]
            },
            "value":"0",
            //"target": "10000"
        },
        "events": {
            "initialized": function (e) {
                function updateData() {
                    // Get reference to the chart using its ID
                    var chartRef = FusionCharts("stackedbullet"),
                        // Build Data String in format &label=...&value=...
                        newValue=Math.floor(salesAccount/1000);
                        strData = "&value=" + newValue;
                    // Feed it to chart.
                    chartRef.feedData(strData);
                    
                    if(cnt==9){
                    	revBulletChart.stopUpdate();
                    	clearInterval(myVar);
                    }
                }
                
                var myVar = setInterval(function () {
                    updateData();
                }, 2000);
                
            }
        }
    })
    .render();
};

function FusionCharts5() {
    var revBulletChart1 = new FusionCharts({
    	id: 'stackedbullet',
    	type: 'vbullet',
        renderAt: 'chart-container5',
        width: '170',
        height: '300',
        dataFormat: 'json',
        dataSource: {
            "chart": {
            	"id":"test",
                "caption": "총매출",
                "subcaption": "(단위:천원)",
                "captionFontSize": "11.5",
                "subcaptionFontSize": "11.5",
                "subcaptionFontBold": "1",
                "captionPadding": "5",
                "animation": "1",
                "upperLimit": "12000",
                "numberprefix": "￦",
                "targetFillPercent": "75",
                "targetColor": "#444444",
                "plotFillPercent": "40",
                "plotFillColor": "#444444",
                "formatNumberScale": "0",
                "baseFontColor": "595959",
                "plotToolText": "<div>Sales : <b>$$value</b></div>",
                "targettooltext": "Target : <b>$$targetvalue</b>",
                "theme": "zune",
                "dataStreamURL": "../../resources/php/gauge-and-widgets-guide-bullet-chart-real-time-bullet-chart-php-1.php",
                "exportEnabled":"1",
                "refreshInterval": "2"
            },
            "colorRange": {
                "color": [
                    {
                    	"minValue":"0",
                    	"maxValue":"3000",
                    	"code":"#999498"
                    	
                    },
                    {
                        "minValue": "3000",
                        "maxValue": "6000",
                        "code": "#BDBDBD"
                    },
                    {
                        "minValue": "6000",
                        "maxValue": "9000",
                        "code": "#c5c2c6"
                    },
                    {
                        "minValue": "9000",
                        "maxValue": "12000",
                        "code": "#e1dee2"
                    }
                ]
            },
            "value":"0",
            //"target": "10000"
        },
        "events": {
            "initialized": function (e) {
                function updateData() {
                    // Get reference to the chart using its ID
                    var chartRef = FusionCharts("stackedbullet"),
                        // Build Data String in format &label=...&value=...
                        newValue=Math.floor(salesAccount/1000);
                        strData = "&value=" + newValue;
                    // Feed it to chart.
                    chartRef.feedData(strData);
                    if(cnt==9){
                    	revBulletChart1.stopUpdate();
                    	clearInterval(myVar);
                    }
                }
                
                var myVar = setInterval(function () {
                    updateData();
                }, 2000);
                
            }
        }
    })
    .render();
};



function FusionCharts2() {
    var ageGroupChart = new FusionCharts({
        type: 'pie2d',
        renderAt: 'chart-container2',
        width: '400',
        height: '300', 
        dataFormat: 'json',
        dataSource: {
            "chart": {
                "caption": "예상 총매출",
                "subcaption":"(단위:원)",
                "paletteColors": "#0075c2,#1aaf5d,#f2c500,#f45b00,#8e0000",
                "bgColor": "#ffffff",
                "showBorder": "0",
                "use3DLighting": "0",
                "showShadow": "0",
                "enableSmartLabels": "1",
                "startingAngle": "0",
                "showPercentValues": "1",
                "showPercentInTooltip": "0",
                "decimals": "1",
                "captionFontSize": "14",
                "subcaptionFontSize": "14",
                "subcaptionFontBold": "0",
                "toolTipColor": "#ffffff",
                "toolTipBorderThickness": "0",
                "toolTipBgColor": "#000000",
                "toolTipBgAlpha": "80",
                "toolTipBorderRadius": "2",
                "toolTipPadding": "5",
                "showHoverEffect":"1",
                "showLegend": "1",
                "legendBgColor": "#ffffff",
                "legendBorderAlpha": '0',
                "legendShadow": '0',
                "legendItemFontSize": '10',
                "legendItemFontColor": '#666666',
                "exportEnabled":"1",
                "formatNumberScale":"0",
                "numberPrefix":"￦"
            },
            "data": [
                {
                    "label": "총지출",
                    "value": expenditure
                }, 
                {
                    "label": "순이익",
                    "value": benefit
                }, 
            ]
        }
    }).render();
};


function FusionCharts3() {
    var budgetChart = new FusionCharts({
        type: 'radar',
        renderAt: 'chart-container3',
        width: '350',
        height: '300',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                "caption": "요소별 점수",
                "captionFontSize": "14",
                "subcaptionFontSize": "14",
                "numberPrefix":"Score:",
                "baseFontColor" : "#333333",
                "baseFont" : "Helvetica Neue,Arial",                        
                "subcaptionFontBold": "0",
                "paletteColors": "#008ee4,#6baa01",
                "bgColor" : "#ffffff",
                "radarfillcolor": "#ffffff",
                "showBorder" : "0",
                "showShadow" : "0",
                "showCanvasBorder": "0",
                "legendBorderAlpha": "0",
                "legendShadow": "0",
                "divLineAlpha": "10",
                "usePlotGradientColor": "0",
                "numberPreffix": "$",
                "legendBorderAlpha": "0",
                "exportEnabled":"1",
                "legendShadow": "0"
            },
            "categories": [
                {
                    "category": [
                        { "label": "인구" },
                        { "label": "주변상권" },
                        { "label": "동종업수" },
                        { "label": "임대료" },
                        { "label": "유동인구" }
                    ]
                }
            ],
            "dataset": [
                {
                    "data": [
                        { "value": population },
                        { "value": tourist },
                        { "value": shop },
                        { "value": lent },
                        { "value": flowage }
                    ]
                }
               /*  {
                    "seriesname": "Actual Cost",
                    "data": [
                        { "value": "6000" },
                        { "value": "9500" },
                        { "value": "11900" },
                        { "value": "8000" },
                        { "value": "9700" }
                    ]
                } */
            ]
        }
    }).render();    
};

/* FusionCharts.ready(function () {
    var revenueChart = new FusionCharts({
        type: 'scrollColumn2d',
        renderAt: 'chart-container4',
        width: '300',
        height: '300',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                "caption": "Sales Trends",
                "subcaption": "FY 2012 - FY 2013",
                "xaxisname": "Month",
                "yaxisname": "Revenue",
                "showvalues": "1",
                "placeValuesInside" : "1",
                "rotateValues": "1",
                "valueFontColor" : "#ffffff",
                "numberprefix": "$",
                "exportEnabled":"1",
                
                //Cosmetics
                "baseFontColor" : "#333333",
                "baseFont" : "Helvetica Neue,Arial",
                "captionFontSize" : "14",
                "subcaptionFontSize" : "14",
                "subcaptionFontBold" : "0",
                "showborder": "0",
                "paletteColors" : "#0075c2",
                "bgcolor": "#FFFFFF",
                "showalternatehgridcolor": "0",
                "showplotborder": "0",
                "labeldisplay": "WRAP",
                "divlinecolor": "#CCCCCC",
                "showcanvasborder": "0",
                "linethickness": "3",
                "plotfillalpha": "100",
                "plotgradientcolor": "",
                "numVisiblePlot" : "12",
                "divlineAlpha" : "100",
                "divlineColor" : "#999999",
                "divlineThickness" : "1",
                "divLineIsDashed" : "1",
                "divLineDashLen" : "1",
                "divLineGapLen" : "1",
                "scrollheight" : "10",
                "flatScrollBars" : "1",
                "scrollShowButtons" : "0",
                "scrollColor" : "#cccccc",
                "showHoverEffect" : "1",
            },
            "categories": [
                {
                    "category": [
                        { "label": "Jan 2012" },
                        { "label": "Feb 2012" },
                        { "label": "Mar 2012" },
                        { "label": "Apr 2012" },
                        { "label": "May 2012" },
                        { "label": "Jun 2012" },
                        { "label": "Jul 2012" },
                        { "label": "Aug 2012" },
                        { "label": "Sep 2012" },
                        { "label": "Oct 2012" },
                        { "label": "Nov 2012" },
                        { "label": "Dec 2012" },
                        { "label": "Jan 2013" }, 
                        { "label": "Feb 2013" }, 
                        { "label": "Mar 2013" }, 
                        { "label": "Apr 2013" }, 
                        { "label": "May 2013" }, 
                        { "label": "Jun 2013" }, 
                        { "label": "Jul 2013" }, 
                        { "label": "Aug 2013" }, 
                        { "label": "Sep 2013" }, 
                        { "label": "Oct 2013" }, 
                        { "label": "Nov 2013" }, 
                        { "label": "Dec 2013" }
                    ]
                }
            ],
            "dataset": [
                {
                    "data": [
                        { "value": "27400" },
                        { "value": "29800" },
                        { "value": "25800" },
                        { "value": "26800" },
                        { "value": "29600" },
                        { "value": "32600" },
                        { "value": "31800" },
                        { "value": "36700" },
                        { "value": "29700" },
                        { "value": "31900" },
                        { "value": "34800" },
                        { "value": "24800" },
                        { "value": "26300" },
                        { "value": "31800" },
                        { "value": "30900" },
                        { "value": "33000" },
                        { "value": "36200" },
                        { "value": "32100" },
                        { "value": "37500" },
                        { "value": "38500" },
                        { "value": "35400" },
                        { "value": "38200" },
                        { "value": "33300" },
                        { "value": "38300" }
                    ]
                }
            ]
        }
    });
    
    revenueChart.render();
});
 */

function changeOption1(){
	$('#offOption').hide();
	$('.onlineOption').show();
}

function changeOption2(){
	$('#offOption').show();
	$('.onlineOption').hide();
}

</script>
</div>
<!-- dimmed 레이어팝업 -->
<!-- <div class="layer"> -->  
	<!-- <div class="bg"></div> -->
	<div id="layer2" class="pop-layer">
		<div class="pop-container">
			<div class="pop-conts">
				<!--content //-->
					<form name="frm">
		<table styleborder:1px>
			<tr>
				<td style="text-align:center;">읍면동 :</td>
				<td><input type="text" id="address" value=""></td>
				<!-- <td><input type="button" value="주소검색" onclick="test();" class="btn-r"></td> -->
			</tr>
			<tr>
				<td style="text-align:center;">상세주소 : </td>
				<td><input type="text" id="addrDetail"></td>
			</tr>
			<tr>
				<td style="text-align:center;">보유자산 :</td>
				<td colspan="2"><input type="text" id="asset"></td>
			</tr>

			<tr>
				<td style="text-align:center;">창업종류 : </td>
				<td colspan="2">
						<input type="radio" name="radio" id="radio1" class="radio" value="online" checked onclick="changeOption1();"><label for="radio1" style="color:black;"><span></span>온라인 창업</label>&nbsp;&nbsp;
						<input type="radio" name="radio" id="radio2" class="radio" value="offline" onclick="changeOption2();"><label for="radio2" style="color:black;"><span></span>오프라인 창업</label>
				
				</td>
			</tr>
			<tr style="text-align:center;" id="offOption">
				<td></td>
				<td colspan="3"><select style="width: 200px;" name="kind">
						<option value="#">업종을 선택하세요</option>
						<option value="chicken">치킨/호프</option>
						<option value="cafe">까페</option>
						<option value="restaurant">요식업</option>
						<option value="pension">숙박/펜션</option>
				</select></td>
			</tr>
			<tr>
				<td style="text-align:center;">영업기간 : </td>
				<td>
				<%
					String open = "";
					List<String> openResult = new ArrayList<String>();
					for(int i=0;i<12;i++){
						int j=i+1;
						open = j+"";
						openResult.add(i, open);
					}
				%>
				<select name="startPeriod">
					<c:forEach items="<%=openResult%>" var="item" begin="0" end="11">
						<option value="${item}">${item}월</option>
					</c:forEach>
				</select>&nbsp;~&nbsp; 
				<select name="endPeriod">
					<c:forEach items="<%=openResult%>" var="item" begin="0" end="11">
						<option value="${item}">${item}월</option>
					</c:forEach>
				</select>
			</tr>
			<tr class="onlineOption">
				<td style="text-align:center;">마케팅 계획여부 : </td>
				<td><input type="radio" name="marketing" id="marketing1" value="yes" checked/><label for="marketing1" style="color:black;"><span></span>Yes</label>&nbsp;&nbsp;
				<input type="radio" name="marketing" id="marketing2" value="no"><label for="marketing2" style="color:black;"><span></span>No</label></td>
			</tr>
			<tr class="onlineOption">
				<td style="text-align:center;">상품관리여부 : </td>
				<td><input type="radio" name="prodManage" id="prodManage1" value="yes" checked/><label for="prodManage1" style="color:black;"><span></span>Yes</label>&nbsp;&nbsp;
				<input type="radio" name="prodManage" id="prodManage2" value="no"><label for="prodManage2" style="color:black;"><span></span>No</label></td>
			</tr>
			<tr class="onlineOption">
				<td style="text-align:center;">수익성 분석여부 : </td>
				<td><input type="radio" name="benefit" id="benefit1" value="yes" checked/><label for="benefit1" style="color:black;"><span></span>Yes</label>&nbsp;&nbsp;
				<input type="radio" name="benefit" id="benefit2" value="no"><label for="benefit2" style="color:black;"><span></span>No</label></td>
			</tr>
			<tr class="onlineOption">
				<td style="text-align:center;">사이트맵 여부 : </td>
				<td><input type="radio" name="sitemap" id="sitemap1" value="yes" checked/><label for="sitemap1" style="color:black;"><span></span>Yes</label>&nbsp;&nbsp;
				<input type="radio" name="sitemap" id="sitemap2" value="no"><label for="sitemap2" style="color:black;"><span></span>No</label></td>
			</tr>
			<tr class="onlineOption">
				<td style="text-align:center;">상품직접생산여부 : </td>
				<td><input type="radio" name="prodDirect" id="prodDirect1" value="yes" checked/><label for="prodDirect1" style="color:black;"><span></span>Yes</label>&nbsp;&nbsp;
				<input type="radio" name="prodDirect" id="prodDirect2" value="no"><label for="prodDirect2" style="color:black;"><span></span>No</label></td>
			</tr>
			<tr class="onlineOption">
				<td style="text-align:center;">제조협력업체유무 : </td>
				<td><input type="radio" name="cooperation" id="cooperation1" value="yes" checked/><label for="cooperation1" style="color:black;"><span></span>Yes</label>&nbsp;&nbsp;
				<input type="radio" name="cooperation" id="cooperation2" value="no"><label for="cooperation2" style="color:black;"><span></span>No</label></td>
			</tr>
			<tr class="onlineOption">
				<td style="text-align:center;">아이템독창성 : </td>
				<td><input type="radio" name="itemCreativity" id="itemCreativity1" value="high" checked/><label for="itemCreativity1" style="color:black;"><span></span>상</label>&nbsp;&nbsp;
				<input type="radio" name="itemCreativity" id="itemCreativity2" value="mid"><label for="itemCreativity2" style="color:black;"><span></span>중</label>
				<input type="radio" name="itemCreativity" id="itemCreativity3" value="low"><label for="itemCreativity3" style="color:black;"><span></span>하</label></td>
			</tr>
			<tr class="onlineOption">
				<td style="text-align:center;">고객관리계획여부 : </td>
				<td><input type="radio" name="customerManage" id="customerManage1" value="yes" checked/><label for="customerManage1" style="color:black;"><span></span>Yes</label>&nbsp;&nbsp;
				<input type="radio" name="customerManage" id="customerManage2" value="no"><label for="customerManage2" style="color:black;"><span></span>No</label></td>
			</tr>
			<tr style="height:30px;"></tr>
			<tr style="text-align:center;"><td colspan="2" style="text-align:center;"><b>시뮬레이션 진행율</b></td></tr>
			<tr style="text-align:center;">
				<td colspan="2" width="400px">
					<div id="myProgress">
  						<div id="myBar">
    						<div id="label">0%</div>
  						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="3" style="text-align:center;"><input class="button" type="button" value="START" onclick="interval();"/>&nbsp;&nbsp;&nbsp;&nbsp;<input class="button" type="reset" value="RESET"/></td>
			</tr>
			
		</table>
		
	</form>

				<div class="btn-r">
					<a href="#" class="cbtn">Close</a>
				</div>
				<!--// content-->
			</div>
		</div>
	</div>
<!-- </div> -->

<div id="layer3" class="pop-layer2">
		<div class="pop-container">
			<div class="pop-conts">
			
				<table>
					<tr>
						<td><div id="chart-container" style="text-align:center;">잠시만 기다려 주세요</div></td>
						<td><div id="chart-container2" style="text-align:center;">잠시만 기다려 주세요</div></td>
					</tr>
					<tr>
						<td><div id="chart-container3" style="text-align:center;">잠시만 기다려 주세요</div></td>
						<td><div id="chart-container4" style="text-align:center;">잠시만 기다려 주세요</div></td>
					</tr>
				
				</table>
			<div class="btn-r">
					<a href="#" class="cbtn">Close</a>
				</div>
			</div>
		</div>
</div>

<div style="height:70px;"></div>

</body>

