<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>

<!-- <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<script>
	function goList() {
		document.update.action = "freeUpdateForm";
		document.update.method = "post";
		document.update.submit();
	}
</script>

<style>
	#update {
		margin-left : 380px;
	}
	
	#updateBtn {
		margin-left : 36.3%;
	}
	
		.file_input label {
		    display: inline-block; 
 			padding: .5em .75em; 
 			color: #1E82FF; 
 			font-size: inherit; 
 			line-height: normal; 
 			vertical-align: middle; 
 			background-color: #fdfdfd; 
 			cursor: pointer; 
 			border: 1px solid #1E82FF; 
 			border-bottom-color: #1E82FF; 
 			border-radius: .25em; 
 			margin-right: 280px;
		}
		.file_input label input {
		    position:absolute;
		    width:0;
		    height:0;
		    overflow:hidden;
		}
		.file_input input[type=text] {
		    vertical-align:middle;
		    display:inline-block;
		    width:200px;
		    height:26px;
		    line-height:28px;
		    font-size:15px;
/* 		    color:#fdfdfd; */
/* 		    padding:0; */
 		    border:0px; 
/* 		    border:1px solid #777; */
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
						<b>자유</b> 게시판
					</h2>
						<p>'자유 게시판 수정' 페이지 입니다.</p>
				</div>
			</section>
			<!-- //BREADCRUMBS -->
			<div class="container">
				<form name="update" method="post" action="freeUpdateForm" id="update" enctype="multipart/form-data">
					<input type="text" name="fre_num" hidden="hidden"
						value="${param.fre_num}">
					
					<div class="form-group">
						<br> <label for="usr">제 목</label><br> 
						<input type="text"
							class="form-control" name="fre_title" id="usr"
							value="${freeVO.fre_title}" readonly style="width: 30%;">
					</div>
					
					<div class="form-gourp">
						<label for="comment">내 용</label><br>
						<textarea rows="5" id="comment" class="form-control"
							name="fre_content" style="width: 50%; height: 300px;">${freeVO.fre_content}</textarea>
					</div>
					
						<!--사진수정  -->
				<div class="form-group">
				<input type="hidden" class="form-control" name="nofile" value="${freeVO.fre_pict_afat}">
				<c:if test="${!empty freeVO.fre_pict_afat}">
				<img src="<%=request.getContextPath() %>/upload/${freeVO.fre_pict_afat}" width="200pt" id="hideimg"> 
				</c:if>
		 		</div> 
		 		
		
		 		<div class="file_input" >
					<label>
					<i class="fa fa-photo"></i>&nbsp;사진첨부
					<input type="file" name="file" >
					</label>
					</div>
					
				
			</div>
			
			<div id="updateBtn">
			<button type="button"  class="btn" onclick="goList()"
				 style="padding:8px; background-color: gray; border: 1px solid gray; 
					 border-radius: 6px; color:white;">
					  <i class="fa fa-exchange"></i>&nbsp;<b style="font-size:14px">수정</b>
			    	</button>
					
			<button type="button" class="btn" onclick="location.href='freeList'"
				style="padding:8px; background-color: gray; border: 1px solid gray; 
					border-radius: 6px; color:white;">
				 <i class="fa fa-list-ul"></i>&nbsp;<b style="font-size:14px">목록</b>
				 </button>
				
			</div>
			</div>
			</form>
		
		
	</div>
</body>
</html>