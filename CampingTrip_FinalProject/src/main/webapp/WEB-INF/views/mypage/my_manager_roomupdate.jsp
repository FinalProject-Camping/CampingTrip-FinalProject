<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

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

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style type="text/css">

@font-face {
    font-family: 'EliceDigitalBaeum_Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/EliceDigitalBaeum_Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'EliceDigitalBaeum_Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/EliceDigitalBaeum_Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

h2 {
	font-family: 'EliceDigitalBaeum_Bold';
}


#mypageText {
	font-family: 'EliceDigitalBaeum_Bold';
	font-size: 32px;
}

#navbar {
	height: 550px;
	border-radius: 13px;
	background-color: #c5e1a5;
	font-family: 'EliceDigitalBaeum_Regular';
}

#active {
	color: #558b2f;
	font-family: 'EliceDigitalBaeum_Bold';
}

.submenu {
	list-style: none;
	margin-left: -30px;
	font-size: 16px;
}

.submenu li {
	margin-top: -5px;
	margin-bottom: 0px;
}

.nav-item {
	margin-bottom: 10px;
	font-size: 20px;
}

/* 테이블 */
table {
	/* 테이블 화면 중앙으로 정렬 */
	margin: auto;
	width: 80%;
	border-collapse: collapse;
	line-height: 1.5;
}
tr > th {
	font-family: 'EliceDigitalBaeum_Regular';
	font-size : 18px;
}
tr > td {
	font-size : 18px;
}

</style>
</head>
<body>
<br><br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				<nav class="navbar navbar-light" id="navbar">
					<ul class="navbar-nav">
						<li class="nav-item">
							<a class="text-decoration-none text-body font-weight-bold"
								 id="mypageText" href="manager_reservlist.do">마이페이지</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="manager_reservlist.do">예약 현황</a>
							<ul class="submenu">
								<li><a class="nav-link" href="manager_reservfinishlist.do">예약 완료</a>
								<li><a class="nav-link" href="manager_reservcancellist.do">예약 취소</a>
							</ul>
						</li>
						<li class="nav-item active"><a class="nav-link font-weight-bold" id="active" href="manager_camplist.do">캠핑지 정보수정</a></li>
						<li class="nav-item"><a class="nav-link" href="memberDetail.do">개인정보</a></li>
						<li class="nav-item">
							<a class="nav-link" href="#" onclick="ajaxEnabledUpdate.do ">회원탈퇴</a>
						</li>
					</ul>
				</nav>
			</div>


			<div class="col-md-10" id="contentDiv">
				<div class="row justify-content-center">
					<div class="col-md-8 order-md-1">
						<br>
						<h2 class="mb-3" style="font-weight:bold;">캠핑지 정보수정</h2><br>
						<form action="manager_roomupdate.do" method="post">
							<input type="hidden" name="roomno" value="${dto.roomno}">
							<table class="table">
								<tr>
									<th class="grey lighten-2" scope="row">객실</th>
									<td><input type="text" class="form-control col-md-6" name="room_name"
										value="${dto.room_name }"></td>
								</tr>
								<tr>
									<th class="grey lighten-2" scope="row">가격</th>
									<td><input type="text" class="form-control col-md-6" name="room_price"
										value="${dto.room_price }"></td>
								</tr>
								<tr>
									<th class="grey lighten-2" scope="row">최대 인원</th>
									<td><input type="text" class="form-control col-md-6" name="guest_number"
										value="${dto.guest_number }"></td>
								</tr>
								<tr>
									<th class="grey lighten-2" scope="row">내용</th>
									<td><textarea rows="10" cols="60" name="room_content">${dto.room_content }</textarea></td>
								</tr>
							</table>
							<br>
							<button class="btn btn-outline-success btn-rounded waves-effect"
								type="submit" style="width: 40%; margin: auto; margin-left:350px;font-size:18px;">확인</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
<br><br>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>