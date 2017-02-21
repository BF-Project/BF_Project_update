<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

<script>
	function goList() {
		document.form2.action = "cmmtWriteForm";
		document.form2.method = "post";
		document.form2.submit();
	}
</script>

<style>
#write {
	margin-left: 380px;
}

#writeBtn {
	
	margin-left: 40.9%;
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
		<div class="cmmtHeader">

			<!-- BREADCRUMBS -->
			<section class="breadcrumbs_block clearfix parallax">
				<div class="container center">
					<h2> 커뮤니티 게시판</h2>
					<br> <br>
				</div>
			</section>
			
			<!-- //BREADCRUMBS -->
			<br>
			<div class="container">
				<form name="form2" method="post" action="cmmtWriteForm" id="write" enctype="multipart/form-data">
					<div class="form-group">
						<label for="usr">Title</label> 
						<input type="text" name="cmmt_title"
							class="form-control" id="usr" style="width: 30%;">
					</div>
					
					<div class="form-group">
						<label for="comment">Comment</label>
						<textarea class="form-control" rows="5" name="cmmt_content"
							id="comment" style="width: 50%; height: 300px;"></textarea>
					</div>
				
				 	<div class="file_input" >
						<label>
						<i class="fa fa-photo"></i>&nbsp;사진첨부
						     <input type="file" name="file" onchange="javascript:document.getElementById('file_route').value=this.value">
						</label>
						<input type="text" readonly="readonly" title="File Route" id="file_route">
						
					</div> 
									
			</form>
		</div>
		
				
				<button type="button" id="writeBtn" class="btn" onclick="goList()"
				style="padding:8px; background-color:gray;
				border:1px solid gray; border-radius:6px; color:white;">
				<i class="fa fa-sign-in"></i>&nbsp;<b style="font-size:14px"></b>등록
				</button>
				
					
			<button type="button" class="btn" 
				onclick="location.href='cmmtList'"
				style="padding:8px; background-color:gray;
				border:1px solid gray; border-radius:6px; color:white;">
				<i class="fa fa-list-ul"></i>&nbsp;<b style="font-size:14px"></b>
				목록</button>	
				
		
		</div>
	</div>
</body>
