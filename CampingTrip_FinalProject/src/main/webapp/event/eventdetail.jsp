<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style type="text/css">
.table{
border-collapse :collapse;
width:800px;
text-align:center;
}
</style>

</head>
<body>
<h2>마이 포인트</h2>
<br>

<!-- 페이지 상단 -->
<div style="border: 1px solid #f1f1f1; width:800px; height:70px; line-height:25px; background-color:#f1f1f1;">
<br>
		<div style="font-size:25px; font-weight:bold; float:left;  margin-left:100px;">
			MY COUPON
		</div>
	<!-- 000에 ID, 총 포인트 값 가져오기 -->	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	000 님의 총 포인트는 000점 입니다. 
</div>
<br>

<br><br>
<h3 style="line-height:3px;">포인트 및 쿠폰내역</h3>
<hr style="width:180px; float:left; ">
<br><br>

<!-- 테이블 -->
<table class="table" border="1"  >
	
	<tr>
		<th>번호</th>
		<th width="200">내역</th>
		<th>획득일</th>
		<th width="150">획득 및 사용 포인트</th>
		<th>TOTAL</th>
	</tr>
	<tr>
		<td>1</td>
		<td>이벤트</td>
		<td>2021.12.16</td>
		<td>30p</td>
		<td>30p</td>
	</tr>
	
	<tr>
		<td>2</td>
		<td>이벤트</td>
		<td>2021.12.16</td>
		<td>30p</td>
		<td>30p</td>
	</tr>
	
</table>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>