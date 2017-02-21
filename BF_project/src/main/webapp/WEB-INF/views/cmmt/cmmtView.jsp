<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

<script>
   function goUpdate(cmmt_num) {
      document.formm.action = "update";
      document.formm.submit();
   }
   /*삭제  */
   function goDelete(cmmt_num) {
      document.formm.action = "delete?cmmt_num=" + cmmt_num;
      document.formm.submit();
   }
   
</script>

<script>
$(document).ready(function() {
    var cmmt_num = $('#cmmt_num').val();
    var data ={'cmmt_num' : cmmt_num};
    
    $.ajax({
       url:'<%=request.getContextPath()%>/cmmtcmt/cmmtcmtList',
       contentType:'application/json',
       dataType:'json',
       data:JSON.stringify(data),
       type:'post',
       success : function(data){
       	  var loginUser = $('#loginUser').val();
          $.each(data, function(i) {
             if(loginUser == data[i].mbr_id){
             var date = new Date(data[i].cmmtcmt_date);
             var year = date.getFullYear();
             var month = (1 + date.getMonth());
             month = month >= 10 ? month : '0' + month;
             var day = date.getDate();
             day = day >= 10 ? day : '0' + day;
             var fullD = year + '년' + month + '월' + day + '일';
             var cmmtcmtList = '<div id="'
						+ data[i].cmmtcmt_num   
						+ '">작성자 : '
						+ data[i].mbr_id
						+ '  /  ' + '작성 날짜 : '
						+ fullD
						+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
						+'<a href="" id="'
						+data[i].cmmtcmt_num
						+'" '
						+'class="writeForm" name="writeForm">수정</a>'
						+'&nbsp;&nbsp;'
						+'<a href="" id="'
						+data[i].cmmtcmt_num
						+'" ' 
						+'class="delete" name="delete">삭제</a>'
						+ '<div class="'
						+ data[i].cmmtcmt_num
						+ '">'
						+ data[i].cmmtcmt_content
						+'</div></div><br><br>';
          } else {
				var date = new Date(data[i].cmmtcmt_date);
				var year = date.getFullYear();
				var month = (1 + date.getMonth());
				month = month >= 10 ? month : '0' + month;
				var day = date.getDate();
				day = day >= 10 ? day : '0' + day;
				var fullD = year + '년' + month + '월' + day + '일';
				var cmmtcmtList = '<div id="'
								+ data[i].cmmtcmt_num   
								+ '">작성자 : '
								+ data[i].mbr_id
								+ '  /  ' + '작성 날짜 : '
								+ fullD
								+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
								+ '&nbsp;&nbsp;'
								+ '<div class="'
								+ data[i].cmmtcmt_num
								+ '">'
								+ data[i].cmmtcmt_content
								+'</div></div><br><br>';
          }
             $('div#comment').append(cmmtcmtList);
          });          
       },
       error:function(error){
    	   alert(error);   
       }
    });
});

function commm_go() {
	var cmmt_num = $('#cmmt_num').val();
	var cmmtcmt_content = $('#cmmtcmt_content').val();
	var dataWrite = {
       'cmmt_num' : cmmt_num,
       'cmmtcmt_content' : cmmtcmt_content
    };
    $.ajax({
      url : '<%=request.getContextPath()%>/cmmtcmt/cmmtcmtWrite',
      data : JSON.stringify(dataWrite),
      type : 'post',
      contentType : 'application/json',
      success : function(data) {
    	 var loginUser = $('#loginUser').val();
         $('#cmmtcmt_content').val('');
         $('div #comment').empty();
         $.each(data, function(i) {
        	if(loginUser == data[i].mbr_id) {
            var date = new Date(data[i].cmmtcmt_date);
            var year = date.getFullYear();
            var month = (1 + date.getMonth());
            month = month >= 10 ? month : '0' + month;
            var day = date.getDate();
            day = day >= 10 ? day : '0' + day;
            var fullD = year + '년' + month + '월' + day + '일';
            var cmmtcmtList = '<div id="'
						+ data[i].cmmtcmt_num   
						+ '">작성자 : '
						+ data[i].mbr_id
						+ '  /  ' + '작성 날짜 : '
						+ fullD
						+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
						+'<a href="" id="'
						+data[i].cmmtcmt_num
						+'" '
						+'class="writeForm" name="writeForm">수정</a>'
						+'&nbsp;&nbsp;'
						+'<a href="" id="'
						+data[i].cmmtcmt_num
						+'" ' 
						+'class="delete" name="delete">삭제</a>'
						+ '<div class="'
						+ data[i].cmmtcmt_num
						+ '">'
						+ data[i].cmmtcmt_content
						+'</div></div><br><br>';
        	} else {
        		 var date = new Date(data[i].cmmtcmt_date);
                 var year = date.getFullYear();
                 var month = (1 + date.getMonth());
                 month = month >= 10 ? month : '0' + month;
                 var day = date.getDate();
                 day = day >= 10 ? day : '0' + day;
                 var fullD = year + '년' + month + '월' + day + '일';
                 var cmmtcmtList = '<div id="'
     						+ data[i].cmmtcmt_num   
     						+ '">작성자 : '
     						+ data[i].mbr_id
     						+ '  /  ' + '작성 날짜 : '
     						+ fullD
     						+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
     						+'&nbsp;&nbsp;'
     						+ '<div class="'
     						+ data[i].cmmtcmt_num
     						+ '">'
     						+ data[i].cmmtcmt_content
     						+'</div></div><br><br>';
        	}
            $('div #comment').append(cmmtcmtList);
         });
      },
      error : function() {
         alert('댓글 등록 실패');
      }
   });
       
}
$(document).on('click','.delete',function(e){
    e.preventDefault();
    var result = $(this).attr('id');
    $.ajax({
       url:"<%=request.getContextPath()%>/cmmtcmt/cmmtcmtDelete",
       data: {"result" : result},
       dataType:'json',
       type:'post',
       success:function(map1){
          freeMap = jQuery.map(map1 , function(a){
             return a;
          })
          $('#'+freeMap).remove();
       }
    });
 });

$(document).on('click','.writeForm', function(e) {
	e.preventDefault();
    var result = $(this).attr('id');
    var aa = document.getElementsByClassName(result);
    $.ajax({
    	url : "<%=request.getContextPath()%>/cmmtcmt/cmmtcmtWriteForm",
    	data : {
    		"result" : result
    	},
    	dataType : 'json',
    	type : 'post',
    	success : function(map) {
			cmmtcmtList = jQuery.map(map, function(e){
				return e;
			});

                $('.'+cmmtcmtList).html(
                	'<textarea id="mm" >'
                	+ aa[0].innerHTML
                	+'</textarea>'
                	+'&nbsp;'
                	+'<button type="button" id="'+result+'" class="btnn btn" '
    				+ 'style="padding:8px; background-color: gray; border: 1px solid gray; font-size:14px; border-radius: 6px; color:white;">'
    				+ '<i class="fa fa-exchange"></i>수정 </button>'
                
                );

    	}
    });
});

$(document).on('click','.btnn', function(e) {
	e.preventDefault();
	var result = $(this).attr('id');
	var tt = $('#mm').val();
	$.ajax({
		url : "<%=request.getContextPath()%>/cmmtcmt/cmmtcmtUpdate",
			data : {
				"result" : result,
				"tt" : tt
			},
			dataType : 'json',
			type : 'post',
			success : function(tt) {
				$('.' + cmmtcmtList).html(tt.cmmtcmt_content);
			}
		});

	});
</script>

<style>
#mod, del, list {
	margin-left: 69%;
}

#cmmtcmt_content {
	width: 85%;
	height: 50%;
}

#cmmtView {
	margin: auto;
	width: 70%;
}

#list2 {
	margin-left: 80%;
	position: realative;
}
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
						<b>커뮤니티</b> 게시판
					</h2>

				</div>
			</section>
			<!-- //BREADCRUMBS -->
			<br>

			<form name="formm" method="post" action="cmmtView">
				<div class="container">
					<table class="table" id="cmmtView">
						<tr>
							<th><i class="fa fa-folder-open-o" />글번호</th>
							<td>${cmmtVO.cmmt_num }</td>
						</tr>

						<tr>
							<th><i class="fa fa-edit spaceLeft">제목</th>
							<td>${cmmtVO.cmmt_title }</td>
						</tr>

						<tr>
							<th><i class="fa fa-eye-slash" />조회수</th>
							<td>${cmmtVO.cmmt_cnt }</td>
						</tr>

						<tr>
							<th><i class="fa fa-edit spaceLeft" />내용</th>
							<td>${cmmtVO.cmmt_content }</td>
						</tr>

						<tr>
							<th><i class="fa fa-user" />작성자</th>
							<td>${cmmtVO.mbr_id }</td>
						</tr>

						<tr>
							<th><i class="fa fa-clock-o" />게시날짜</th>
							<td>${cmmtVO.cmmt_date }</td>
						</tr>

						<c:if test="${!empty cmmtVO.cmmt_pict_afat}">
							<tr>
								<th><i class="fa fa-image" />사진첨부</th>
								<td><img
									src="<%=request.getContextPath() %>/resources/upload/${cmmtVO.cmmt_pict_afat}"
									width="200px"> <%-- <a href="<%=request.getContextPath()%>/cmmtphotoDownload/${cmmtVO.cmmt_num}">  
						<b style="color:#6495ed">파일다운로드</b></a>
						 --%> <a
									href="<%=request.getContextPath()%>/cmmtphotoDownload/${cmmtVO.cmmt_num}">
										<b style="color: #6495ed">파일 다운로드</b>
								</a></td>

							</tr>
						</c:if>

						<tr>
							<th><i class="fa fa-link" />댓글</th>
							<td>
								<div id="comment"></div> 
								<input type="hidden" value="${cmmtVO.cmmt_num }" id="cmmt_num" name="cmmt_num">
								<textarea id="cmmtcmt_content" name="cmmtcmt_content" style="width: 467px;"></textarea>

								<button type="button" id="insertCmmtCmt" class="btn"
									name="insertCmmtCmt" onclick="commm_go();"
									style="padding: 8px; background-color: gray; border: 1px solid gray; border-radius: 6px; color: white;">
									<i class="fa fa-sign-in"></i>&nbsp;<b style="font-size: 14px">등록</b>
								</button>
							</td>
						</tr>
					</table>
					<c:choose>
						<c:when test="${cmmtVO.mbr_id==sessionScope.loginUser }">
							<!-- 수정  -->
							<button type="button" id="mod" class="btn"
								onclick="goUpdate('${cmmtVO.cmmt_num}')"
								style="padding: 8px; background-color: gray; border: 1px solid gray; border-radius: 6px; color: white;">
								<i class="fa fa-exchange"></i>&nbsp;<b style="font-size: 14px">수정</b>
							</button>

							<!-- 삭제  -->
							<button type="button" id="del" class="btn"
								onclick="goDelete('${cmmtVO.cmmt_num}')"
								style="padding: 8px; background-color: gray; border: 1px solid gray; border-radius: 6px; color: white;">
								<i class="fa fa-cut"></i>&nbsp;<b style="font-size: 14px">삭제</b>
							</button>

							<!-- 목록 -->
							<button type="button" id="list" class="btn"
								onclick="location.href='cmmtList'"
								style="padding: 8px; background-color: gray; border: 1px solid gray; border-radius: 6px; color: white;">
								<i class="fa fa-list-ul"></i>&nbsp;<b style="font-size: 14px">목록</b>
							</button>

						</c:when>

						<c:otherwise>
							<button type="button" id="list2" class="btn"
								onclick="location.href='cmmtList'"
								style="padding: 8px; background-color: gray; border: 1px solid gray; border-radius: 6px; color: white;">
								<i class="fa fa-list-ul"></i>&nbsp;<b style="font-size: 14px">목록</b>
							</button>

						</c:otherwise>
					</c:choose>
				</div>
				<input type="hidden" value=${loginUser } id="loginUser">
			</form>
		</div>
	</div>
</body>
