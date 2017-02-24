<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2017. 2. 21.        차승현      최초작성
* Copyright (c) 2017 by DDIT All right reserved
 --%>

<head>
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
		
		// 이미지 원본크기 닫기
		function showClose(){
			if(document.all.spot.style.visibility=="visible"){
				document.all.spot.style.visibility="hidden";
				return false;
			}
		}
	</script>
	
	<script>
		// 댓글
		$(function(){
			var cmmtNumber = {'cmmt_num':'${cmmtVo.cmmt_num}'};
			$.ajax({
				url:"<%=request.getContextPath()%>/admin/communityCommentList",
				type:"post",
				dataType:"json",
				contentType:"application/json",
				data:JSON.stringify(cmmtNumber),
				success:function(data){
					if(data==null || data==""){
						var cmmtcmtList = "댓글이 없습니다." 
						$('div#comment').append(cmmtcmtList);
						$('#cmmtCommentWrite').css("margin-top","10px");
					}else{
						$.each(data, function(i){
							if(data[i].mbr_id==null){
								data[i].mbr_id = data[i].admin_id
							}
							var date = new Date(data[i].cmmtcmt_date);
							var year = date.getFullYear();
							var month = (1+date.getMonth());
							month = month >= 10 ? month : '0' + month;
							var day = date.getDate();
							day = day >= 10 ? day : '0' + day;
							var fullDay = year+'년 '+month+'월 '+day+'일'; // 시 분 초 ?
									//
									//
									//
							var cmmtcmtList = '<div id="'
											+ data[i].cmmtcmt_num
											+ '" class="commentHover" style="border:1px dotted #48BAE4; font-weight:bold; margin-bottom:10px;">작성자 : '
											+ data[i].mbr_id
											+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+'작성 날짜 : '
											+ fullDay
											+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
											+ '<a href="#" id="'
											+ data[i].cmmtcmt_num
											+ '" '
											+ 'class="writeForm" name="writeForm">수정</a>'
											+ '&nbsp;&nbsp;'
											+ '<a href="" id="'
											+ data[i].cmmtcmt_num
											+ '" '
											+ 'class="delete" name="delete">삭제</a>'
											+ '<div class="'
											+ data[i].cmmtcmt_num
											+ '" style="margin-top:7px; margin-left:9px; word-break:break-all; font-weight:normal">'
											+ data[i].cmmtcmt_content
											+ '</div></div>'
							$('div#comment').append(cmmtcmtList);
							if(i==1){ // 댓글이 2개일 때부터
								$('div.cmmtWrapper').css("height","");
// 								alert('댓글이 2개 이상이니까...화면페이지 height의 속성을 제거해서 검은화면 없게..');
							}
						});
					}
				},
				error:function(error){
					alert('error');
				}
			})
		})
		
			
		// 관리자 .. 댓글 등록
		function AdminCommentInsertToCommunity(e){
			e.preventDefault();
			var content = $('#cmmtCommentWrite').val();
			$.ajax({
				url:"<%=request.getContextPath()%>/admin/AdminCommentInsertToCommunity",
				type:"post",
				dataType:"text",
				data:({
					cmmtcmt_content : content, // 댓글내용
					cmmt_num : '${cmmtVo.cmmt_num}' // 댓글을 다는 게시글 번호
				}),
				success:function(data){
					if(data=='yes'){
						// 등록하고 
						$('div#comment').empty();						
						$('#cmmtCommentWrite').val("");
						$('#cmmtCommentWrite').css("margin-top","");
						// 다시 댓글리스트를 받아옴? 아니면 방금 등록한 것만 추가해? ㄴㄴ 다시 받아와야댐 다른사람이 올린것도 새로고침해야..
						
						// --------------------------------------------------------------------------------
						var cmmtNumber = {'cmmt_num':'${cmmtVo.cmmt_num}'};
						$.ajax({							
							url:"<%=request.getContextPath()%>/admin/communityCommentList",
							type:"post",
							dataType:"json",
							contentType:"application/json",
							data:JSON.stringify(cmmtNumber),
							success:function(data){
								if(data==null || data==""){
									var cmmtcmtList = "댓글이 없습니다." 
									$('div#comment').append(cmmtcmtList);
								}else{
									$.each(data, function(i){
										if(data[i].mbr_id==null){
											data[i].mbr_id = data[i].admin_id
										}
										var date = new Date(data[i].cmmtcmt_date);
										var year = date.getFullYear();
										var month = (1+date.getMonth());
										month = month >= 10 ? month : '0' + month;
										var day = date.getDate();
										day = day >= 10 ? day : '0' + day;
										var fullDay = year+'년 '+month+'월 '+day+'일'; // 시 분 초 ?
												//
												//
										var cmmtcmtList = '<div id="'
														+ data[i].cmmtcmt_num
														+ '" class="commentHover" style="border:1px dotted #48BAE4; font-weight:bold; margin-bottom:10px;">작성자 : '
														+ data[i].mbr_id
														+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+'작성 날짜 : '
														+ fullDay
														+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
														+ '<a href="#" id="'
														+ data[i].cmmtcmt_num
														+ '" '
														+ 'class="writeForm" name="writeForm">수정</a>'
														+ '&nbsp;&nbsp;'
														+ '<a href="" id="'
														+ data[i].cmmtcmt_num
														+ '" '
														+ 'class="delete" name="delete">삭제</a>'
														+ '<div class="'
														+ data[i].cmmtcmt_num
														+ '" style="margin-top:7px; margin-left:9px; word-break:break-all; font-weight:normal">'
														+ data[i].cmmtcmt_content
														+ '</div></div>'
										$('div#comment').append(cmmtcmtList);
										if(i==1){ // 댓글이 2개일 때부터
											$('div.cmmtWrapper').css("height","");
			// 								alert('댓글이 2개 이상이니까...화면페이지 height의 속성을 제거해서 검은화면 없게..');
										}
									});
									// 댓글 등록시 스크롤 제일 아래로 위치하도록
									var top = ($(window).scrollTop());
									var h=parseInt($('div#comment').css("height").substr(0,4));
									$("body").scrollTop(h);
// 								return false;
								}
							},
							error:function(error){
								alert('error');
							}
						})
						// --------------------------------------------------------------------------------
					}else{
						$('#cmmtCommentWrite').val("");
						$('#cmmtCommentWrite').focus();
						alert('댓글 내용을 입력해주세요.');
					}
				},
				error:function(){
					alert('error');
				}
			})
		}
		
		// 댓글 삭제
		$(function(){}).on('click','.delete',function(e){
		    e.preventDefault();
		    var result = $(this).attr('id');
// 		    alert(result);
		    $.ajax({
		    	url:"<%=request.getContextPath()%>/admin/cmmtcmtDelete",
		    	type:"post",
		    	dataType:"text",
		    	data:({
		    		result : result
		    	}),
		    	success:function(data){
		    		$('#'+data).remove();
		    		var selectCount = $('.commentHover').length;		    		
		    		if(selectCount<=1){
		    			$('div.cmmtWrapper').css("height","906.5px");
		    			if(selectCount==0){
		    				var cmmtcmtList = "댓글이 없습니다." 
							$('div#comment').append(cmmtcmtList);
							$('#cmmtCommentWrite').css("margin-top","10px");
		    			}
		    		}else{
		    			$('div.cmmtWrapper').css("height","");
		    		}
		    	},
		    	error:function(error){
		    		alert('error');
		    	}
		    })
		})

	</script>
	<style>
		.commentHover:hover{ 
 			background-color: #e8f8ff; 
 		} 
	</style>
</head>
<body>
	<div id="wrapper">
		<div id="page-wrapper" class="cmmtWrapper" style="text-align: center; height:906.5px;">
			<div class="row">
				<br><br>        
				<h1><b>커뮤니티 게시글(Read)</b></h1>
				<br>
					<div style="position:absolute; left:240px; top:90px; text-align:left; line-height:30px;">
						<span style="font-size: 25px;"><b><i class="fa fa-star"></i>&nbsp;바로가기</b></span><br>
						<a href="<%=request.getContextPath()%>/admin/FreeList" style="font-size:17px;">&nbsp;<i class="fa fa-tag"></i>&nbsp;&nbsp;자유 게시판</a><br>
						<a href="<%=request.getContextPath()%>/admin/QnAList" style="font-size:17px;">&nbsp;<i class="fa fa-tag"></i>&nbsp;&nbsp;Q & A 게시판</a>						
					</div>
				<!-- view : start -->
				<form>
					<div class="form-group">
						<div class="form-group">
							<br>
							<label class="control-label" style="font-size: 18px; margin-left: 65px">
								<span style="margin-left:0px">
									<i class="fa fa-folder-open-o"></i>
									글번호 : <input type="text" value="${cmmtVo.cmmt_num}" style="width:240px; border: 0px" readonly>
								</span>							
								<span style="margin-left: 110px">
									<i class="fa fa-eye-slash"></i>
									조회수 : <input type="text" value="${cmmtVo.cmmt_cnt}" style="width:170px; border: 0px" readonly>
								</span>
								<br>
								<span style="margin-left:1px">
									<i class="fa fa-user"></i>
									&nbsp;작성자 : <input type="text" value="${cmmtVo.mbr_id}" style="width:240px; border: 0px" readonly>
								</span>							
								<span style="margin-left: 110px">
									<i class="fa fa-clock-o"></i>
									게시일 : <input type="text" value="${cmmtVo.cmmt_date}" style="width:170px; border: 0px" readonly>
								</span>
								<br>
							</label>
							<br>
							<label class="control-label" for="inputWarning" style="font-size: 22px; margin-left: -480px; margin-top: 10px">
	                			<i class="fa fa-edit spaceLeft"></i>&nbsp;&nbsp;커뮤니티 제목
	                		</label>
	                		<center>
			                    <input type="text" class="form-control" id="inputWarning" name="cmmtTitle" style="width:650px; font-size: 20px; background-color: white;"
			                    value="${cmmtVo.cmmt_title}" readonly>
		                    </center>
		                    <br>
		                    <label class="control-label" for="inputWarning" style="font-size: 22px; margin-left: -570px">
			                    <i class="fa fa-edit spaceLeft"></i>&nbsp;&nbsp;내용
			                </label>
			                <center>
				                <textarea class="form-control" rows="16" id="noticeContent"	style="width:650px; font-size: 16px; 
								          text-align:left; background-color: white;" readonly>${cmmtVo.cmmt_content}
						    	</textarea>
						    </center>
						    <br>
						    <!-- 사진이 있으면 사진도 포함시켜주기 ☆★☆★ -->
		 					<c:if test="${!empty cmmtVo.cmmt_pict_afat}">
		 						<a href="<%=request.getContextPath()%>/cmmtphotoDownload/${cmmtVo.cmmt_num}" style="position:relative; left:-330px; top:-280px;">
							      	다운로드
							    </a>
		 						<a style="position:relative; left:-470px; top:-180px" onclick="showView('#spot')" href="#">&nbsp;
						    		<img src="<%=request.getContextPath()%>/upload/${cmmtVo.cmmt_pict_afat}" title="원본 크기로 보시려면 클릭하세요." style="width:200px; height:160px;">
					    		</a>
		 						<!-- 이미지 클릭시 원본 크기로 보게하기위한 div -->
					    		<div id="spot" style="visibility: hidden; position:absolute; bottom:187px; left:527px;">
					    			<a onclick="showClose('#spot')" href="#">
					    				<img src="<%=request.getContextPath()%>/upload/${cmmtVo.cmmt_pict_afat}" title="닫으시려면 클릭하세요.">
					    			</a>
					    		</div>
					    	</c:if>
		 					
		 					<c:choose>
		 						<c:when test="${!empty cmmtVo.cmmt_pict_afat}">
			 						<div style="margin-top: -165px;">
					 					<label class="control-label" for="inputWarning" style="font-size: 22px; margin-left: -565px;">
					                    <i class="fa fa-comment"></i>&nbsp;&nbsp;댓글<b style="color:red"></b></label>
				                    </div>
				 					<!-- 댓글 List : start-->
					                    <center>
					                    	<div style="width:650px; font-size:16px; text-align:left; background-color:white;">
						                    	<div id="comment"></div>
						                    </div>
					 					</center>
				 					<!-- 댓글 List : end -->
		 						</c:when>
		 						<c:otherwise>
		 							<div style="margin-top: 0px;">
					 					<label class="control-label" for="inputWarning" style="font-size: 22px; margin-left: -565px;">
					                    <i class="fa fa-comment"></i>&nbsp;&nbsp;댓글<b style="color:red"></b></label>
				                    </div>
				 					<!-- 댓글 List : start-->
					                    <center>
					                    	<div style="width:650px; font-size:16px; text-align:left; background-color:white;">
						                    	<div id="comment"></div>
						                    </div>
					 					</center>
				 					<!-- 댓글 List : end -->
		 						</c:otherwise>
		 					</c:choose>	
	 							<!-- 댓글 작성란 : start -->
		 						<div style="position:relative;">
		 						<textarea id="cmmtCommentWrite" name="cmmtCommentWrite" style="width:570px; height:28px; margin-top:0px; margin-left:-85px;"></textarea>
		 							<div style="position:relative; margin-top:-34px; margin-left:572px;">
										<button type="button" id="insertCommunityComment" name="insertCommunityComment"	onclick="AdminCommentInsertToCommunity(event)"
												style="padding:4px; background-color: white; border: 1px solid gray; border-radius: 6px; color:black;">
											<i class="fa fa-sign-in"></i>&nbsp;<b style="font-size:12px">댓글 등록</b>
										</button>
									</div>
								</div>
		 						<!-- 댓글 작성란 : end -->
						</div>
					</div>
				</form>
				<!-- view : end -->
				
			</div>
		</div>
	</div>
</body>