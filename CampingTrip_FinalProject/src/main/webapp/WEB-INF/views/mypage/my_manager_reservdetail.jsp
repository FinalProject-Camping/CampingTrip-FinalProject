<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고내역</title>

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">

<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>

<style type="text/css">
/* 테이블 */
table {
	/* 테이블 화면 중앙으로 정렬 */
	margin: auto;
	width: 80%;
	border-collapse: collapse;
	line-height: 1.5;
}
</style>

</head>
<body>
	<div class="container-fluid">

		<div class="col-md-14" id="contentDiv">
			<div class="row justify-content-center">
				<div class="col-md-5 order-md-1">
					<br><br><br>
					<h3 class="mb-3" style="font-weight: bold;"></h3>
					<br>
					${dto.myCampDto.name } 예약 상세내역
					<table class="table">
						<tr>
							<th class="grey lighten-2" scope="row">예약번호</th>
							<td>${dto.reservno }</td>
						</tr>
						<tr>
							<th class="grey lighten-2" scope="row">예약시간</th>
							<td><fmt:formatDate pattern="yyyy/MM/dd" value="${dto.create_date }"/></td>
						</tr>
						<tr>
							<th class="grey lighten-2" scope="row">캠핑지</th>
							<td>${dto.myCampDto.name }</td>
						</tr>
						<tr>
							<th class="grey lighten-2" scope="row">객실</th>
							<td>${dto.myRoomdto.room_name }</td>
						</tr>
						<tr>
							<th class="grey lighten-2" scope="row">예약자</th>
							<td>${dto.user_name }</td>
						</tr>
						<tr>
							<th class="grey lighten-2" scope="row">예약자 번호</th>
							<td>${dto.user_contact }</td>
						</tr>
						<tr>
							<th class="grey lighten-2" scope="row">체크인</th>
							<td><fmt:formatDate pattern="yyyy/MM/dd" value="${dto.check_in }"/></td>
						</tr>
						<tr>
							<th class="grey lighten-2" scope="row">체크아웃</th>
							<td><fmt:formatDate pattern="yyyy/MM/dd" value="${dto.check_out }"/></td>
						</tr>
						<tr>
							<th class="grey lighten-2" scope="row">인원</th>
							<td>${dto.guest_number }</td>
						</tr>
						<tr>
							<th class="grey lighten-2" scope="row">예약상태</th>
							<td>${dto.status }</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>