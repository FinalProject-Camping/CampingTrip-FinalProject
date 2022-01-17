<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//font.elice.io/EliceDigitalBaeum.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style type="text/css">
.eventdetail_content01 {
	font-family: "Elice Digital Baeum",sans-serif;
	margin: 30px;
}

.eventdetail_content01 h1 {
	color: #d49466;
	text-align: center;
	font-size: 40px;
	margin-top: 100px;
}

.eventdetail_content01 h1 div {
	font-size: 20px;
	color: #000;
	margin-top: 10px;
}

.coupon_box {
	padding: 30px;
	border: 1px solid #f1f1f1;
	width: 95%;
	height: 70px;
	line-height: 25px;
	text-align: center;
	background-color: #f1f1f1;
}

.coupon_box div{
	font-size: 25px;
	font-weight: bold;
	display: inline-block;
}

.coupon_box .detail_point {
	margin-top: 30px;
	font-size: 20px;
	color: #d49466;
}

.point_page {
	padding: 50px;
}

.table{
	width: 100%;
	border-collapse :collapse;
	border-spacing: 0;
	border-radius: 12px 12px 0 0;
	overflow: hidden;
	box-shadow: 0 2px 12px rgba(32,32,32,.3);
	background: #fafafa;
	text-align:center;
}

.table th,td{
	padding: 12px 15px;
}

.table th{
	background: #d49466;
	color: #fafafa;
	font-family: "Elice Digital Baeum",sans-serif;
	font-size: 20px;
}

.table td{
	
}

</style>

</head>
<body>
<!-- 페이지 상단 -->
<c:set var="loginId" value='<%=session.getAttribute("id")%>' />
<c:set var="loginName" value='<%=session.getAttribute("name")%>' />

	<div class="eventdetail_content01">
		<h1>
			<i class="far fa-file-powerpoint"></i> MY POINT !
			<div>지금까지 획득한 포인트 내역</div>
		</h1>
		<div class="coupon_box">
			<div>안녕하세요. ${loginName} 님! <span></span></div><br>
			<div class="detail_point">
			
			</div>
			<br>
		</div>
	</div>
<br><br><br>

	<div class="point_page">
		<h3 style="line-height: 3px;">포인트 및 쿠폰내역</h3>
		<hr style="width: 180px; float: left;">
		<br>
		<br>

		<!-- 테이블 -->
		
		<script type="text/javascript">
			$.ajax({
			url:"pointList.do",
			method:"get",
			success:function(data){
				var doc = document.querySelector('.table');
				var doc2 = document.querySelector('.detail_point');
				var html = 
		            '<tr>' +
		            '<th>번호</th>' +
		            '<th>이벤트 내용</th>' +
		            '<th>획득한 날짜</th>' +
		            '<th>획득 포인트</th>' +
		            '</tr>';
		            doc.innerHTML += html;
		            
		            
		            var totalPoint = 0;
				$.each(data, function(index, value) { // 값이 여러개 일 때는 반복문 사용
					var html2 =
						'<tr>' +
			            '<td>' + value.pointSeq + '</td>' +
			            '<td>' + value.pointDetail + '</td>' +
			            '<td>' + value.pointGetDate + '</td>' +
			            '<td>' + (value.getPoint).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + '점 </td>' +
			            '</tr>';
			            doc.innerHTML += html2;

					totalPoint += value.getPoint;
					
				})
				const tp = totalPoint.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				var html4 =
					'현재까지 획득한 포인트는 ' + tp + '점<span>&nbsp;&nbsp;입니다.</span>';
					doc2.innerHTML += html4;
			}
		});
		</script>

		<table class="table" border="1">

		</table>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>