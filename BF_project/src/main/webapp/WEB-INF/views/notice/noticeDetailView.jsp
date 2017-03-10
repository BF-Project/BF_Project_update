<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<style>
		#noticeDetailView {
			margin: auto;
			width: 85%;
		}
		th{
			font-size: 16.5px;
			width:130px;
		}
		td{
			font-size: 14px;
		}
	</style>
	<script>
		// 이미지 원본크기로 보기
		function showView(){
			if(document.all.spot.style.visibility=="hidden"){
				document.all.spot.style.visibility="visible";
				return false;
			}
			if(document.all.spot.style.visibility=="visible"){
				document.all.spot.style.visibility="hidden";
				return false;
			}
		}
		// 이미지 닫기
		function showClose(){
			if(document.all.spot.style.visibility=="visible"){
				document.all.spot.style.visibility="hidden";
				return false;
			}
		}
	</script>
</head>
<body>
	<div class="preloader_hide">
		<section class="breadcrumbs_block clearfix parallax">
			<div class="container center">
				<h2>
					<b>공지사항</b> 게시판
				</h2>
			</div>
		</section>
		<br><br>
		
		<!-- 공지사항 상세보기 -->
		<form name="formm" method="post" action="#">
			<div class="container" style="height:700px">
				<table class="table" id="noticeDetailView">
					<tr>
						<th><i class="fa fa-folder-open-o"></i>
						&nbsp;&nbsp;글번호</th>
						<td style="width:590px">${noticeVo.notice_num}</td>
						<th><i class="fa fa-eye-slash"></i>&nbsp;&nbsp;조회수</th>
						<td>${noticeVo.notice_cnt}</td>
					</tr>
					<tr>
						<th><i class="fa fa-user"></i>&nbsp;&nbsp;작성자</th>
						<td>${noticeVo.admin_id}</td>
						<th><i class="fa fa-clock-o"></i>&nbsp;&nbsp;게시일</th>
						<td>${noticeVo.notice_date}</td>
					</tr>
					<tr>
						<th><i class="fa fa-edit spaceLeft"></i>&nbsp;&nbsp;제목</th>
						<td colspan="3">${noticeVo.notice_title}</td>
					</tr>
					<tr>
						<th><i class="fa fa-edit spaceLeft"></i>&nbsp;&nbsp;내용</th>
						<td colspan="3">${noticeVo.notice_content}</td>
					</tr>
					<c:if test="${!empty noticeVo.notice_pict_afat}">
						<tr>
							<th><i class="fa fa-image"></i>&nbsp;&nbsp;사진</th>
							<td colspan="3">
								<a href="#" onclick="showView('#spot')">
									<img src="<%=request.getContextPath()%>/upload/${noticeVo.notice_pict_afat}" title="원본 크기로 보시려면 클릭하세요." style="width:200px; height:160px;"> 
								</a>
								&nbsp;&nbsp;
								
								<a href="<%=request.getContextPath()%>/photoDownLoad/${noticeVo.notice_num}">
							    	<b style="color:#6495ed">파일 다운로드</b>
							    </a>
							
							</td>
							<!-- 이미지 클릭시 원본 크기로 보게하기위한 div -->
							<div id="spot" style="visibility: hidden; position:absolute; bottom:14%; left:31%">
				    			<a onclick="showClose('#spot')" href="#">
				    				<img src="<%=request.getContextPath()%>/upload/${noticeVo.notice_pict_afat}" title="닫으시려면 클릭하세요.">
				    			</a>
							</div>
						</tr>
					</c:if>
<!-- 					<tr> -->
<!-- 						<th><i class="fa fa-comment"></i>&nbsp;&nbsp;답변내용</th> -->
<!-- 						<td colspan="3"></td> -->
<!-- 					</tr> -->
					<tr>
						<td>
							<button type="button" class="btn btn-success" onclick="location.href='main?page=${page}'"
					            style="padding:8px; background-color: gray; border: 1px solid gray; 
					            border-radius: 6px; color:white;">
								<i class="fa fa-list-ul"></i>&nbsp;<b style="font-size:14px">목록</b>
							</button>
						</td>
						<th></th>
						<td></td>
					</tr>
				</table>
			</div>
		</form>
		<!-- 공지사항 상세보기 : end -->
	</div>			
</body>