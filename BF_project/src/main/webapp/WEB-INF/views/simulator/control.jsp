<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Controller</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"
	type="text/javascript"></script>

<script type="text/javascript">
	function layer_open(el){

		var temp = $('#' + el);
		var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

		if(bg){
			$('.layer').fadeIn();	//'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
		}else{
			temp.fadeIn();
		}

		// 화면의 중앙에 레이어를 띄운다.
		if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
		else temp.css('top', '0px');
		if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
		else temp.css('left', '0px');

		temp.find('a.cbtn').click(function(e){
			if(bg){
				$('.layer').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
			}else{
				temp.fadeOut();
			}
			e.preventDefault();
		});

		$('.layer .bg').click(function(e){	//배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
			$('.layer').fadeOut();
			e.preventDefault();
		});

	}				
</script>

<style type="text/css">
.layer {display:none; position:fixed; _position:absolute; top:0; left:0; width:100%; height:100%; z-index:100;}
.layer .bg {position:absolute; top:0; left:0; width:100%; height:100%; background:#000; opacity:.5; filter:alpha(opacity=50);}
.layer .pop-layer {display:block;}

.pop-layer {display:none; position: absolute; top: 50%; left: 50%; width: 410px; height:auto;  background-color:#fff; border: 5px solid #3571B5; z-index: 10;} 
.pop-layer .pop-container {padding: 20px 25px;}
.pop-layer p.ctxt {color: #666; line-height: 25px;}
.pop-layer .btn-r {width: 100%; margin:10px 0 20px; padding-top: 10px; border-top: 1px solid #DDD; text-align:right;}

a.cbtn {display:inline-block; height:25px; padding:0 14px 0; border:1px solid #304a8a; background-color:#3f5a9d; font-size:13px; color:#fff; line-height:25px;}
a.cbtn:hover {border: 1px solid #091940; background-color:#1f326a; color:#fff;}
</style>

</head>
<body>
	<a href="#" class="btn-example"
		onclick="layer_open('layer2');return false;">예제-2 보기</a>
	<div class="layer">
		<div class="bg"></div>
		<div id="layer2" class="pop-layer">
			<div class="pop-container">
				<div class="pop-conts">
				
					<!--content //-->
					<p class="ctxt mb20">
						Thank you.<br> Your registration was submitted successfully.<br>

						Selected invitees will be notified by e-mail on JANUARY 24th.<br>
						<br> Hope to see you soon!
					</p>
					<div class="btn-r">
						<a href="#" class="cbtn">Close</a>
					</div>
				
				
					<form>
		<table>
			<tr>
				<td>상세주소 :</td>
				<td><input type="text" id="address"></td>
				<td><input type="button" value="주소검색" onclick="test();">
				</td>
			</tr>
			<tr>
				<td>보유자산 :</td>
				<td colspan="2"><input type="text" id="asset"></td>
			</tr>

			<tr>
				<td>창업종류</td>
				<td colspan="2"><input type="radio" name="kind" value="온라인 창업">온라인
					창업&nbsp; <input type="radio" name="kind" value="오프라인 창업">오프라인
					창업</td>
			</tr>
			<tr>
				<td colspan="3"><select style="width: 200px;">
						<option value="#">선택하세요</option>
						<option value="chicken">치킨/호프</option>
						<option value="cafe">까페</option>
						<option value="restaurant">요식업</option>
						<option value="pension">숙박/펜션</option>
				</select></td>
			</tr>
			<tr>
				<td>영업기간</td>
				<td><select>
						<option value="1">1월</option>
						<option value="2">2월</option>
						<option value="3">3월</option>
				</select> ~ <select>
						<option value="1">1월</option>
						<option value="2">2월</option>
						<option value="3">3월</option>
				</select></td>
			</tr>
		</table>
	</form>
					

					<!--// content-->

				</div>

			</div>

		</div>

	</div>

	
</body>
</html>