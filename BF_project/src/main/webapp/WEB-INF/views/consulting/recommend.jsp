<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2017. 2. 23.      pc21      최초작성
* Copyright (c) 2017 by DDIT All right reserved
 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
table {
    border-collapse: collapse;
   /* width: 100%; */
   	margin:0 auto;
}

/* th, td {
    text-align: left;
    padding: 8px;
} */
</style>
<script>

var recAddr1;
var recAddr2;
var recAddr3;

function execution(){
	$.ajax({
		url:"recommend",
		type:"post",
		data:{"asset":$('#asset').val()},
		dataType:"json",
		success:function(data){
			var list = data.recList;
			recAddr1 = list[0] = list[0].lent_dong+" "+list[0].lent_firstzip+"-"+list[0].secondzip+"<br>";
			recAddr2 = list[1] = list[1].lent_dong+" "+list[1].lent_firstzip+"-"+list[1].secondzip+"<br>";
			recAddr3 = list[2] = list[2].lent_dong+" "+list[2].lent_firstzip+"-"+list[2].secondzip+"<br>";
			
			
			for(i=0;i<5;i++){
				//$('#pane').append("test"+i+" : "+list[i].lent_price2+"<br>"+list[i].lent_dong+" "+list[i].lent_firstzip+"-"+list[i].secondzip+"<br>");
				document.getElementById('pane').innerHTML = "<table><tr><td style='text-align:center;width:300px'><h3>추천지역1</h3></td><td></td><td style='text-align:center;width:300px'><h3>추천지역2</h3></td>"
											+"<td></td><td style='text-align:center;width:300px'><h3>추천지역3</h3></td></tr>"
											+"<tr style='text-align:center;width:300px'><td>"+recAddr1+"</td>"
											+"<td style='width:40px;'></td><td style='text-align:center;width:300px'>"+recAddr2+"</td>"
											+"<td style='width:40px;''></td><td style='text-align:center;width:300px'>"+recAddr3+"</td></tr>"
											+"</table>";
			}
			//alert(data);
		},
		error:function(){
			alert("톻신실패!!!!");	
		}
		
	});
}

</script>
</head>
<body>

<style type="text/css">
.search { position:absolute;z-index:1000;top:20px;left:20px; }
.search #address { width:150px;height:20px;line-height:20px;border:solid 1px #555;padding:5px;font-size:12px;box-sizing:content-box; }
.search #submit { height:30px;line-height:30px;padding:0 10px;font-size:12px;border:solid 1px #555;border-radius:3px;cursor:pointer;box-sizing:content-box; }
</style>

     <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/examples-base.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/highlight.min.js"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=OBqzAkYxvc_WcR797zlN&amp;submodules=geocoder"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/examples-base.css" />

<!-- PRELOADER -->
	<img id="preloader"
		src="<%=request.getContextPath()%>/resources/images/preloader.gif"
		alt="" />
	<!-- 로딩 이미지 -->

<!-- //PRELOADER -->
	
<!-- BREADCRUMBS -->
			<section class="breadcrumbs_block clearfix parallax">
				<div class="container center">
					<h2>
						지역<b>추천</b>
					</h2>
				</div>
			</section>
			
			
<!-- //BREADCRUMBS -->

<table>
	<tr>
		<td style="text-align:right;">상세주소 : </td>
		<td style="text-align:left;"><input type="text" id="addr"></td>
	</tr>
	<tr>
		<td style="text-align:right;">예상창업자금 : </td>
		<td style="text-align:left;"><input type="text" id="asset">만원</td>
	</tr>
	<tr><td colspan="2"><input type="button" id="execution" value="실행" onclick="execution()"></td></tr>
</table>

<div id="pane"></div>


<table>
	<tr>
		<td>
			<div id="wrap2" class="section" style>
    			<div id="map" style="width:300px;height:300px;">
        			<!-- <div class="search" style="">
            			<input id="address" type="text" placeholder="검색할 주소" value="" />
            			<input id="submit" type="button" value="주소 검색" />
        			</div> -->
    			</div>
			</div>
		</td>
		<td>
			<div id="wrap2" class="section" style>
    			<div id="map2" style="width:300px;height:300px;">
        			<!-- <div class="search" style="">
            			<input id="address" type="text" placeholder="검색할 주소" value="" />
            			<input id="submit" type="button" value="주소 검색" />
        			</div> -->
    			</div>
			</div>
		</td>
		<td>
			<div id="wrap3" class="section" style>
    			<div id="map3" style="width:300px;height:300px;">
        			<!-- <div class="search" style="">
            			<input id="address" type="text" placeholder="검색할 주소" value="" />
            			<input id="submit" type="button" value="주소 검색" />
        			</div> -->
    			</div>
			</div>
		</td>
	</tr>
</table>


<div id="wrap" class="section" style>
    <div id="map" style="width:500px;height:300px;">
        <div class="search" style="">
            <input id="address" type="text" placeholder="검색할 주소" value="" />
            <input id="submit" type="button" value="주소 검색" />
        </div>
    </div>
</div>

 
<script id="code">
/* var map = new naver.maps.Map("map", {
    center: new naver.maps.LatLng(37.3595316, 127.1052133),
    zoom: 10,
    mapTypeControl: true
}); */

 
var map = new naver.maps.Map(document.getElementById('map'), {
	    zoom: 12,
	    minZoom: 12,
	    maxZoom: 12,
	    mapTypeId: 'normal',
	    center: new naver.maps.LatLng(33.5718377, 126.5298401)

	});

var map = new naver.maps.Map(document.getElementById('map2'), {
    zoom: 12,
    minZoom: 12,
    maxZoom: 12,
    mapTypeId: 'normal',
    center: new naver.maps.LatLng(33.3718377, 126.5298401)

});

var map = new naver.maps.Map(document.getElementById('map3'), {
    zoom: 12,
    minZoom: 12,
    maxZoom: 12,
    mapTypeId: 'normal',
    center: new naver.maps.LatLng(33.4718377, 126.5298401)

});
 
var infoWindow = new naver.maps.InfoWindow({
    anchorSkew: true
});

map.setCursor('pointer');

// search by tm128 coordinate
function searchCoordinateToAddress(latlng) {
    var tm128 = naver.maps.TransCoord.fromLatLngToTM128(latlng);

    infoWindow.close();

    naver.maps.Service.reverseGeocode({
        location: tm128,
        coordType: naver.maps.Service.CoordType.TM128
    }, function(status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
            return alert('Something Wrong!');
        }

        var items = response.result.items,
            htmlAddresses = [];

        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
            item = items[i];
            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]';

            htmlAddresses.push((i+1) +'. '+ addrType +' '+ item.address);
            htmlAddresses.push('&nbsp&nbsp&nbsp -> '+ item.point.x +','+ item.point.y);
        }

      /*  infoWindow.setContent([
                '<div style="padding:10px;min-width:200px;line-height:150%;">',
                '<h4 style="margin-top:5px;">검색 좌표 : '+ response.result.userquery +'</h4><br />',
                htmlAddresses.join('<br />'),
                '</div>'
            ].join('\n'));

        infoWindow.open(map, latlng); */
    });
}

// result by latlng coordinate
function searchAddressToCoordinate(address) {
    naver.maps.Service.geocode({
        address: address
    }, function(status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
            return alert('Something Wrong!');
        }

        var item = response.result.items[0],
            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]',
            point = new naver.maps.Point(item.point.x, item.point.y);

        infoWindow.setContent([
                '<div style="padding:10px;min-width:200px;line-height:150%;">',
                '<h4 style="margin-top:5px;">검색 주소 : '+ response.result.userquery +'</h4><br />',
                addrType +' '+ item.address +'<br />',
                '&nbsp&nbsp&nbsp -> '+ point.x +','+ point.y,
                '</div>'
            ].join('\n'));


        map.setCenter(point);
        infoWindow.open(map, point);
    });
}

function initGeocoder() {
    map.addListener('click', function(e) {
        searchCoordinateToAddress(e.coord);
    });

    $('#address').on('keydown', function(e) {
        var keyCode = e.which;

        if (keyCode === 13) { // Enter Key
            searchAddressToCoordinate($('#address').val());
        }
    });

    $('#submit').on('click', function(e) {
        e.preventDefault();

        searchAddressToCoordinate($('#address').val());
    });

    searchAddressToCoordinate('제주도');
}

naver.maps.onJSContentLoaded = initGeocoder;
</script>


</body>
</html>