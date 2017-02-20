<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2017. 2. 20.        차승현      최초작성
* Copyright (c) 2017 by DDIT All right reserved
 --%>

<head>
	<script>
	function updateQnA(){
		var qnaRespond = $('#qnaRespond').val();
		$.ajax({
			url:"<%=request.getContextPath()%>/admin/QnaRespond",
			type:"post",
			dataType:"text",
			data:({
				qnaNumNum : '${qnaVo.qna_num}',
				qnaRespond : qnaRespond
			}),
			success:function(data){
				if(data=='yes'){
					location.href='QnAList?page=${param.page}&comboSelectQnA=${param.comboSelectQnA}'
				}
			},
			error:function(error){
				alert('error');
			}
		})
	}
	</script>
</head>
<body>
	<div id="wrapper">
		<div id="page-wrapper" style="text-align: center; height: 1015px;">
		<br><br>
			<h1><b>Q & A 상세보기(respond)</b></h1>
			<form>
				<!-- form -->
				<div class="form-group">
					<br>
					<label class="control-label" style="font-size: 18px; margin-left: 65px">
						<span style="margin-left:0px">
							<i class="fa fa-folder-open-o"></i>
							글번호 : <input type="text" value="${qnaVo.qna_num}" style="width:240px; border: 0px" readonly>
						</span>							
						<span style="margin-left: 110px">
							<i class="fa fa-eye-slash"></i>
							조회수 : <input type="text" value="${qnaVo.qna_cnt}" style="width:170px; border: 0px" readonly>
						</span>
						<br>
						<span style="margin-left:1px">
							<i class="fa fa-user"></i>
							&nbsp;작성자 : <input type="text" value="${qnaVo.mbr_id}" style="width:240px; border: 0px" readonly>
						</span>							
						<span style="margin-left: 110px">
							<i class="fa fa-clock-o"></i>
							게시일 : <input type="text" value="${qnaVo.qna_date}" style="width:170px; border: 0px" readonly>
						</span>
						<br>
					</label>
					<br>			
                	<label class="control-label" for="inputWarning" style="font-size: 22px; margin-left: -505px; margin-top: 10px">
                	<i class="fa fa-edit spaceLeft"></i>&nbsp;&nbsp;Q & A 제목</label>
                	<center>
                    <input type="text" class="form-control" id="inputWarning" name="qnaTitle" style="width:650px; font-size: 20px; background-color: white;"
                    value="${qnaVo.qna_title}" readonly>
                    </center>
                    <br>
                    <label class="control-label" for="inputWarning" style="font-size: 22px; margin-left: -570px">
                    <i class="fa fa-edit spaceLeft"></i>&nbsp;&nbsp;내용</label>
                    <center>
	                    <textarea class="form-control" rows="16" id="qnaContent" style="width:650px; font-size: 16px; position:relative;
	 					text-align:left; background-color: white;" readonly>${qnaVo.qna_content}
	 					</textarea>
 					</center>
 					<br>
 					<!-- 사진이 있으면 사진도 포함시켜주기 ☆★☆★ -->
 					<c:if test="${!empty qnaVo.qna_pict_afat}">
 						<a style="position:relative; left:-440px; top:-180px" onclick="showView('#spot')" href="#">&nbsp;
				    		<img src="<%=request.getContextPath()%>/upload/${qnaVo.qna_pict_afat}" title="원본 크기로 보시려면 클릭하세요." style="width:200px; height:160px;">
			    		</a>
 					</c:if>
 					<!-- 사진이 있으면 사진도 포함시켜주기 ☆★☆★ -->
 					<c:choose>
 						<c:when test="${qnaVo.qna_respond_yn eq 'N'}">
 							<div style="margin-top: -165px;">
			 					<label class="control-label" for="inputWarning" style="font-size: 22px; margin-left: -385px;">
			                    <i class="fa fa-edit spaceLeft"></i>&nbsp;&nbsp;관리자 답변<b style="color:red">&nbsp;(답변대기)</b></label>
		                    </div>
		                    <center>
			                    <textarea class="form-control" rows="8" id="qnaRespond" style="width:650px; font-size: 16px;
			 					text-align:left; background-color: white;">${qnaVo.qna_respond_content}
			 					</textarea>
		 					</center>
 						</c:when>
 						<c:otherwise>
 							<div style="margin-top: -165px;">
			 					<label class="control-label" for="inputWarning" style="font-size: 22px; margin-left: -385px;">
			                    <i class="fa fa-edit spaceLeft"></i>&nbsp;&nbsp;관리자 답변<b style="color:blue">&nbsp;(답변완료)</b></label>
		 					</div>
			                    <center>
				                    <textarea class="form-control" rows="8" id="qnaRespond" style="width:650px; font-size: 16px;
				 					text-align:left; background-color: white;">${qnaVo.qna_respond_content}
				 					</textarea>
			 					</center>
 						</c:otherwise>
 					</c:choose>
                </div>
				<!-- form : end -->
				<!-- button -->
					<button type="button" class="btn btn-success" onclick="location.href='QnAList?page=${param.page}&comboSelectQnA=${param.comboSelectQnA}'"
					 style="padding:8px; background-color: gray; border: 1px solid gray; margin-right:10px;">
						<i class="fa fa-list-ul"></i>&nbsp;<b style="font-size:14px">목록</b>
					</button>
					<button type="button" class="btn btn-danger" onclick="location.href='selectQnaDelete?page=${param.page}&qnaNum=${param.qnaNum}&comboSelectQnA=${param.comboSelectQnA}'" style="padding:8px; margin-right:10px;">
						<i class="fa fa-trash"></i>&nbsp;<b style="font-size:14px">삭제</b>
					</button>
					<c:choose>
						<c:when test="${qnaVo.qna_respond_yn eq 'N'}">
							<button type="button" class="btn btn-success" style="padding:8px;" onclick="updateQnA()">
								<i class="fa fa-check-square-o"></i>&nbsp;<b style="font-size:14px">답변등록</b>
							</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-success" style="padding:8px;" onclick="updateQnA()">
								<i class="fa fa-check-square-o"></i>&nbsp;<b style="font-size:14px">답변수정</b>
							</button>
						</c:otherwise>
					</c:choose>
				<!-- button -->
			</form>
		</div>
	</div>
</body>