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


.detail{
position:absolute;
top:105px;
left:900px;
line-height:85px;
font-size:13px;
}

.coupon{
border: 1px solid black;
width:250px;
height:100px;
position:absolute;
}

.download{
border: 1px solid orange;
width:250px;
height:25px;
position:absolute;
text-align:center;
font-weight:bold;
color:orange;
}

</style>

</head>
<body>
<h2>이달의 이벤트</h2>
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
	<div class="detail"><a href="eventdetail.jsp"><br>📜&nbsp;상세내역 보러가기>></a></div>
</div>
<br>

<!-- 룰렛 기능구현(임시로 영역 구분)-->

 <canvas id="canvas" style="width: 800px; height:500px; border: 1px solid black;">룰렛 기능 넣기</canvas> 

<!-- 쿠폰존 -->
<br><br>
<h3>불멍하조 전용혜택</h3>
<hr style="width:800px; float:left;">

<br><br>
<div class="coupon" style="left:400px;">
로고 나오면 로고랑 같이 넣기(이미지or text)
</div>
<div class="coupon" style="left:750px;">
로고 나오면 로고랑 같이 넣기(이미지or text)
</div>


<div class="download" style="left:400px; top:930px;">
쿠폰받기⬇
</div>
<div class="download" style="left:750px; top:930px;">
쿠폰받기⬇
</div>

<br><br><br><br><br><br><br><br>
<h3>제휴회원 전용혜택</h3>
<hr style="width:800px; float:left;">

<br><br>
<div class="coupon" style="left:400px;">
로고 나오면 로고랑 같이 넣기(이미지or text)
</div>
<div class="coupon" style="left:750px;">
로고 나오면 로고랑 같이 넣기(이미지or text)
</div>

<div class="download" style="left:400px; top:1205px;">
쿠폰받기⬇
</div>
<div class="download" style="left:750px; top:1205px;">
쿠폰받기⬇
</div>

<br><br><br><br><br><br><br><br><br>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>