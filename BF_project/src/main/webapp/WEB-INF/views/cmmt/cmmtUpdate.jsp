<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

<script>
function goList() {
	document.form2.action = "cmmtUpdateForm";
	document.form2.method = "post";
	document.form2.submit();
}
</script>

<style>
	#gobtn1{
		margin-left: 700px;
	
	}
	
	#titletext{
		margin-right: 135px;
	}
	
	#titletext1{
		margin-right: 341px;
	}
	#content1{
		margin-right: 320px;
	
	}
	#content2{
		margin-left: 100px;
	
	}
	#hideimg{
		margin-right: 165px;
		
	}
	#file{
		margin-right: 120px;
	}
</style>

</head>
<body>

	<!-- PRELOADER -->
	<img id="preloader"
		src="<%=request.getContextPath()%>/resources/images/preloader.gif"
		alt="" />
	<!-- 로딩 이미지 -->

	<!-- //PRELOADER -->
	<div class="preloader_hide">
		<div class="qnaHeader">

			<!-- BREADCRUMBS -->
			<section class="breadcrumbs_block clearfix parallax">
				<div class="container center">
					<h2>  
						<b>커뮤니티</b> 고객 게시판
					</h2>
					<br> <br>
					<p>'커뮤니티 게시판' 페이지 입니다.</p>
				</div>
			</section>
			<!-- //BREADCRUMBS -->
	
	<center>		
			<div class="container">
				<form name="form2" method="post" action="cmmtUpdateForm"  enctype="multipart/form-data">
					
					<input type="text" name="cmmt_num" hidden="hidden" value="${cmmtVO.cmmt_num}">
					<div class="form-group">
					<br>
			
					<label for="usr" id="titletext1">제목</label><br> 
					<input type="text"  id="titletext" class="form-control" name="cmmt_title" value="${cmmtVO.cmmt_title}" style="width:20% ;"><br> 
					</div>		
					
				<div class="form-group">
				<label id="content1">content</label><br>
				<textarea class="form-control" rows="8" cols="65" id="content2" name="cmmt_content" style="width:40%;" >${cmmtVO.cmmt_content}</textarea>
				
				</div>		
				
			<!--사진수정  -->
				<div class="form-group">
				<input type="hidden" class="form-control" name="nofile" value="${cmmtVO.cmmt_pict_afat}">
				<c:if test="${!empty cmmtVO.cmmt_pict_afat}">
				<img src="<%=request.getContextPath() %>/upload/${cmmtVO.cmmt_pict_afat}" width="200pt" id="hideimg"> 
				</c:if>
		 		</div> 
				<input type="file" name="file" id="file"><button type="button" id="gobtn1" class="btn" onclick="goList()" style="background-color: black;">등록</button>
		
			<!-- 목록 -->
				<button type="button" id="list" class="btn"
				onclick="location.href='cmmtList'"
				style=" background-color: black;">목록</button>
		
		</center>
		</form>
		</div>
			</div>
</body>
			