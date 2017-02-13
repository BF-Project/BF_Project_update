<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>

<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성공하는 사람들</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="shortcut icon" href="images/favicon.ico">

<!-- CSS -->
<link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/flexslider.css"	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/prettyPhoto.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/animate.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=request.getContextPath()%>/resources/css/owl.carousel.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet" type="text/css" />

<!-- FONTS -->
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500italic,700,500,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

<!-- SCRIPTS -->
<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<!--[if IE]><html class="ie" lang="en"> <![endif]-->

<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js" type="text/javascript"></script>
<script	src="<%=request.getContextPath()%>/resources/js/jquery.prettyPhoto.js" type="text/javascript"></script>
<script	src="<%=request.getContextPath()%>/resources/js/jquery.nicescroll.min.js" type="text/javascript"></script>
<script	src="<%=request.getContextPath()%>/resources/js/superfish.min.js" type="text/javascript"></script>
<script	src="<%=request.getContextPath()%>/resources/js/jquery.flexslider-min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/owl.carousel.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/animate.js"	type="text/javascript"></script>
<script	src="<%=request.getContextPath()%>/resources/js/jquery.BlackAndWhite.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/myscript.js" type="text/javascript"></script>

<script>
	//PrettyPhoto
	jQuery(document).ready(function() {
		$("a[rel^='prettyPhoto']").prettyPhoto();
	});

	//BlackAndWhite
	$(window).load(function() {
		$('.client_img').BlackAndWhite({
			hoverEffect : true, // default true
			// set the path to BnWWorker.js for a superfast implementation
			webworkerPath : false,
			// for the images with a fluid width and height 
			responsive : true,
			// to invert the hover effect
			invertHoverEffect : false,
			// this option works only on the modern browsers ( on IE lower than 9 it remains always 1)
			intensity : 1,
			speed : { //this property could also be just speed: value for both fadeIn and fadeOut
				fadeIn : 300, // 200ms for fadeIn animations
				fadeOut : 300
			// 800ms for fadeOut animations
			},
			onImageReady : function(img) {
				// this callback gets executed anytime an image is converted
			}
		});
	});
</script>
<!-- 주소 선택 -->
<script>
	function result(addr_zip_num, addr_sd, addr_gugun, addr_dong){
		opener.document.abc.InputAddr1.value = addr_zip_num+" "+addr_sd+" "+addr_gugun+" "+addr_dong;
		self.close();
	}
</script>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<!-- BREADCRUMBS -->
	<section class="breadcrumbs_block clearfix parallax">
		<div class="container center">
			<img src="<%=request.getContextPath()%>/resources/images/logo/logo.jpg"	style="z-index: 0; width: 100px; height: 30px; position: absolute; left:7px; top:7px;">
			<h2>
				<b>Search</b> address
			</h2>
			<p>'성공하는 사람들' 주소 검색 페이지 입니다.</p>
		</div>
	</section>
		
	<!-- 주소검색 Form -->
	<article class="container">
		<div class="page-header">
		</div>
		
		<div class="col-md-6 col-md-offset-3">
			<form role="form" method=post name=f action="findZipNum">
				<div class="form-group">
						<label for="dong" style="font-size:19px">동 이름</label> 
							<input type="text" class="form-control" name="dong" placeholder="검색하실 동을 입력해주세요" style="font-size: 16px; width:400px">
							<input type="submit" value="검색" class="btn btn-info" 
							style="position:absolute; right:146px; top:24.9px; background-color:#000000; color=#FFF0F0; height:35px; width:75px; margin:0; padding:0;" >
				</div>
			</form>
			<br>
			<!-- 검색한 정보 테이블 -->
			<table id="zipcode">
				<tr style="font-size:17px;">
					<th>우편번호</th>
					<th>주소</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
					<c:forEach items="${addressList}" var="addrVO">
						<tr>
							<th>&nbsp;&nbsp;${addrVO.addr_zip_num}</th>
							<td>
								<a href="#" onclick="return result('${addrVO.addr_zip_num}'
								,'${addrVO.addr_sd}', '${addrVO.addr_gugun}','${addrVO.addr_dong}')">
								${addrVO.addr_sd} ${addrVO.addr_gugun} ${addrVO.addr_dong} 
								</a>
							</td>
						</tr>
						<tr><td></td><td></td></tr>
					</c:forEach>
			</table>	
			<!-- 검색한 정보 테이블 -->	
		</div>
		
	</article>
	<!-- 주소검색 Form 끝 -->
</body>
</html>