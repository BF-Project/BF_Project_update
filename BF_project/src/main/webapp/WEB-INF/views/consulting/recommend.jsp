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

.button {
  padding: 5px 25px;
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
<script>

var recAddr1;
var recAddr2;
var recAddr3;

function execution(){
	if($('#addr').val()==''){
		alert("주소를 입력해주세요");
		return;
	}
	if($('#asset').val()==''){
		alert("예상창업자금을 입력해주세요");
		return;
	}
	
	$.ajax({
		url:"recommend",
		type:"post",
		data:{"asset":$('#asset').val(),
			"addr":$('#addr').val()},
		dataType:"json",
		success:function(data){
			var list = data.recList;
			if(list[0].lent_secondzip == "0"){
				recAddr1 = list[0].lent_dong+" "+list[0].lent_firstzip;
			}else{			
				recAddr1 = list[0].lent_dong+" "+list[0].lent_firstzip+"-"+list[0].lent_secondzip;
			}

			if(list[1].lent_secondzip == "0"){
				recAddr2 = list[1].lent_dong+" "+list[1].lent_firstzip;
			}else{			
				recAddr2 = list[1].lent_dong+" "+list[1].lent_firstzip+"-"+list[1].lent_secondzip;
			}
			if(list[2].secondzip == "0"){
				recAddr3 = list[2].lent_dong+" "+list[2].lent_firstzip;
			}else{			
				recAddr3 = list[2].lent_dong+" "+list[2].lent_firstzip+"-"+list[2].lent_secondzip;
			}
			
			
			for(i=0;i<5;i++){
				//$('#pane').append("test"+i+" : "+list[i].lent_price2+"<br>"+list[i].lent_dong+" "+list[i].lent_firstzip+"-"+list[i].secondzip+"<br>");
				document.getElementById('pane').innerHTML = "<table><tr style='text-align:center;width:300px;font-size:17px;'><td td style='text-align:center;width:300px'><b>주소 : </b>"+recAddr1+"</td>"
											+"<td style='width:40px;'></td><td style='text-align:center;width:300px'><b>주소 : </b>"+recAddr2+"</td>"
											+"<td style='width:40px;''></td><td style='text-align:center;width:300px'><b>주소 : </b>"+recAddr3+"</td></tr>"
											+"</table>";
			}
			//alert(data);
		    searchAddressToCoordinate(recAddr1);
		    searchAddressToCoordinate2(recAddr2);
		    searchAddressToCoordinate3(recAddr3);
		    
		    $('#recMap').show();
		    
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
    <%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/examples-base.css" /> --%>

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

<br><br>
<table>
	<tr>
		<td style="text-align:right;font-size:15px;">상세주소(읍면동) : </h5></td>
		<td style="text-align:left;font-size:15px;">&nbsp;<input type="text" id="addr"></td>
	</tr>
	<tr>
		<td style="text-align:right;font-size:15px;">예상창업자금 &nbsp;&nbsp; : </td>
		<td style="text-align:left;font-size:15px;">&nbsp;<input type="text" id="asset">&nbsp;&nbsp;만원</td>
	</tr>
	<tr><td colspan="2" style="text-align:center;height:50px;"><input type="button" id="execution" value="추천지역검색" onclick="execution()" class="button"></td></tr>
</table>
<br><br>

<table id="recMap" style="display:none;">
	<tr style="text-align:center;">
		<td><h3><b>추천지역1</b></h3></td>
		<td></td>
		<td><h3><b>추천지역2</b></h3></td>
		<td></td>
		<td><h3><b>추천지역3</b></h3></td>
	</tr>
	<tr>
		<td>
			<div id="wrap" class="section" style>
    			<div id="map" style="width:300px;height:300px;"></div>
			</div>
		</td>
		<td style="width:50px;"></td>
		<td>
			<div id="wrap" class="section" style>
    			<div id="map2" style="width:300px;height:300px;"></div>
			</div>
		</td>
		<td style="width:50px;"></td>
		<td>
			<div id="wrap" class="section" style>
    			<div id="map3" style="width:300px;height:300px;"></div>
			</div>
		</td>
	</tr>
</table>

<div id="pane"></div>
 
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

var map2 = new naver.maps.Map(document.getElementById('map2'), {
    zoom: 12,
    minZoom: 12,
    maxZoom: 12,
    mapTypeId: 'normal',
    center: new naver.maps.LatLng(33.3718377, 126.5298401)

});

var map3 = new naver.maps.Map(document.getElementById('map3'), {
    zoom: 12,
    minZoom: 12,
    maxZoom: 12,
    mapTypeId: 'normal',
    center: new naver.maps.LatLng(33.4718377, 126.5298401)

});

var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(37.3595704, 127.105399),
    map: map
});

var marker2 = new naver.maps.Marker({
    position: new naver.maps.LatLng(37.3595704, 127.105399),
    map: map2
});

var marker3 = new naver.maps.Marker({
    position: new naver.maps.LatLng(37.3595704, 127.105399),
    map: map3
});

 
var infoWindow = new naver.maps.InfoWindow({
    anchorSkew: true
});

map.setCursor('pointer');
map2.setCursor('pointer');
map3.setCursor('pointer');

// search by tm128 coordinate
function searchCoordinateToAddress(latlng) {
    var tm128 = naver.maps.TransCoord.fromLatLngToTM128(latlng);

    infoWindow.close();

    naver.maps.Service.reverseGeocode({
        location: tm128,
        coordType: naver.maps.Service.CoordType.TM128
    }, function(status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
            return;
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
            return;
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
        marker.setPosition(point);
        //infoWindow.open(map, point);
    });
}

function searchAddressToCoordinate2(address) {
    naver.maps.Service.geocode({
        address: address
    }, function(status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
            return;
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


        map2.setCenter(point);
        marker2.setPosition(point);
        //infoWindow.open(map, point);
    });
}

function searchAddressToCoordinate3(address) {
    naver.maps.Service.geocode({
        address: address
    }, function(status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
            return;
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


        map3.setCenter(point);
        marker3.setPosition(point);
       // infoWindow.open(map, point);
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
    
    searchAddressToCoordinate('성산읍');
    searchAddressToCoordinate2('성산읍');
    searchAddressToCoordinate3('성산읍');
}

naver.maps.onJSContentLoaded = initGeocoder;
</script>


</body>
</html>