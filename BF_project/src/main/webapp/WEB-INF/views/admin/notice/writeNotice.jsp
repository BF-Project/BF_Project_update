<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<style>
		.navbar-inverse .navbar-nav>.dddd>a, .navbar-inverse .navbar-nav>.active>a:focus,
		.navbar-inverse .navbar-nav>.active>a:hover {
		color: #fff;
		background-color: #080808;
	}	
	</style>
	<style>
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
	<c:if test="${!empty sessionScope.noticeINsertNO}">
		<script>
			alert('공지사항의 제목과 내용을 입력해주세요');
		</script>
		<c:remove var="noticeINsertNO" scope="session"/>
	</c:if>
	
	<div id="wrapper">
		<div id="page-wrapper" style="text-align: center; height: 924px;">
			<br><br>
			<h1><b>공지사항 작성</b></h1>
			<!-- 공지사항 작성 -->
			<form enctype="multipart/form-data" method="post" action="<%=request.getContextPath()%>/admin/InsertNotice">
				<div class="form-group">
					<div class="form-group">
						<br>					
	                	<label class="control-label" for="inputWarning" style="font-size: 22px; margin-left: -480px">
	                	<i class="fa fa-edit spaceLeft"></i>&nbsp;&nbsp;공지사항 제목</label>
	                	<center>                	
	                    <input type="text" class="form-control" id="inputWarning" name="noticeTitle" style="width:650px; font-size: 20px">
	                    </center>
	                    <br>
	                    <label class="control-label" for="inputWarning" style="font-size: 22px; margin-left: -570px">
	                    <i class="fa fa-edit spaceLeft"></i>&nbsp;&nbsp;내용</label>
	                    <center>
	                    <textarea class="form-control" rows="16" name="noticeContent" style="width:650px; font-size: 16px"></textarea>
	                    </center>
	                </div>
	            </div>
            
	            <!-- 공지사항 작성 : end -->
	            <button type="submit" class="btn btn-success" style="padding:8px; margin-left: 480px; position:relative; z-index:100">
					<i class="fa fa-check-square-o"></i>&nbsp;<b style="font-size:14px">등록</b>
				</button>
				&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-danger" onclick="location.href='notice?page=${page}'"
				style="padding:8px; position:relative; z-index:100">
					<i class="fa fa-times spaceLeft"></i>&nbsp;<b style="font-size:14px">취소</b>
				</button>
				
				<!-- MultipartFile 사용하여 파일 업로드 -->
				<div class="file_input" style="margin-left: -325px; margin-top: -36px">
				    <label>
				        <i class="fa fa-photo"></i>&nbsp;사진첨부
				        <input type="file" name="fileUpload" onchange="javascript:document.getElementById('file_route').value=this.value">
				    </label>

				    <input type="text" readonly="readonly" title="File Route" id="file_route">

				</div>
				<input type="hidden" id="page" name="page" value="${page}">
			</form>
		</div>
	</div>
</body>