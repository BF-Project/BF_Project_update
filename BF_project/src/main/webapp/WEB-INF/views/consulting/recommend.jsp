<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2017. 2. 23.      pc21      최초작성
* Copyright (c) 2017 by DDIT All right reserved
 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
table {
    border-collapse: collapse;
   /* width: 100%; */
   	margin:0 auto;
}

/* th, td {
    text-align: left;
    padding: 8px;
} */
</style>
</head>
<body>
<!-- PRELOADER -->
	<img id="preloader"
		src="<%=request.getContextPath()%>/resources/images/preloader.gif"
		alt="" />
	<!-- 로딩 이미지 -->

<!-- //PRELOADER -->
	
<!-- BREADCRUMBS -->
			<section class="breadcrumbs_block clearfix parallax">
				<div class="container center">
					<h2>
						지역<b>추천</b>
					</h2>
				</div>
			</section>
			
<!-- //BREADCRUMBS -->

<table>
	<tr>
		<td style="text-align:right;">상세주소 : </td>
		<td style="text-align:left;"><input type="text" id="addr"></td>
	</tr>
	<tr>
		<td style="text-align:right;">예상창업자금 : </td>
		<td style="text-align:left;"><input type="text" id="asset">만원</td>
	</tr>
	<tr><td colspan="2"><input type="button" id="execution" value="실행" onclick=""></td></tr>
</table>

<table style="border:1px solid black;">
	<tr>
		<td>주소</td>
		<td style="width:20px;"></td>
		<td>주소</td>
		<td style="width:20px;"></td>
		<td>주소</td>
		<td style="width:20px;"></td>
	</tr>
</table>



</body>
</html>