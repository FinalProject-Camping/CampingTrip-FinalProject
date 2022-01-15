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

#mypageText {
	font-size: 25px;
}

#navbar {
	height: 530px;
	border-radius: 13px;
	background-color: #c5e1a5;
}

#active {
	color: #558b2f;
}

.submenu {
	list-style: none;
	margin-left: -30px;
	font-size: 13px;
}

.submenu li {
	margin-top: -5px;
	margin-bottom: 0px;
}

.nav-item {
	margin-bottom: 10px;
	font-size: 17px;
}

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
					</ul>
				</nav>
			</div>


			<div class="col-md-10" id="contentDiv">
				<div class="row justify-content-center">
					<div class="col-md-8 order-md-1">
						<br>
						<h3 class="mb-3" style="font-weight:bold;">캠핑지 정보수정</h3><br>

						<!--Carousel Wrapper-->
						<div id="carousel-example-1z" class="carousel slide carousel-fade"
							data-ride="carousel" data-touch="false" data-interval="false">
							<!--Indicators-->
							<ol class="carousel-indicators">
								<li data-target="#carousel-example-1z" data-slide-to="0"
									class="active"></li>
								<li data-target="#carousel-example-1z" data-slide-to="1"></li>
								<li data-target="#carousel-example-1z" data-slide-to="2"></li>
							</ol>
							<!--/.Indicators-->
							<!--Slides-->
							<div class="carousel-inner" role="listbox">
								<!--First slide-->
								<div class="carousel-item active">
									<img class="d-block w-100"
										src="https://mdbootstrap.com/img/Photos/Slides/img%20(70).webp"
										alt="First slide">
								</div>
								<!--/First slide-->
								<!--Second slide-->
								<div class="carousel-item">
									<img class="d-block w-100"
										src="https://mdbootstrap.com/img/Photos/Slides/img%20(129).webp"
										alt="Second slide">
								</div>
								<!--/Second slide-->
								<!--Third slide-->
								<div class="carousel-item">
									<img class="d-block w-100"
										src="https://mdbootstrap.com/img/Photos/Slides/img%20(130).webp"
										alt="Third slide">
								</div>
								<!--/Third slide-->
							</div>
							<!--/.Slides-->
							<!--Controls-->
							<a class="carousel-control-prev" href="#carousel-example-1z"
								role="button" data-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a>
							<a class="carousel-control-next" href="#carousel-example-1z"
								role="button" data-slide="next"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">Next</span>
							</a>
							<!--/.Controls-->
						</div>
						<!--/.Carousel Wrapper-->


						<br>
						
						<div style="text-align: center;">
							<input type="file">
						</div>
						<br> <br>
							<table class="table">
								<tr>
									<th class="grey lighten-2" scope="col">캠핑지</th>
									<td>${dto.myCampDto.name }</td>
								</tr>
								<tr>
									<th class="grey lighten-2" scope="row">객실</th>
									<td>${dto.room_name }</td>
								</tr>
								<tr>
									<th class="grey lighten-2" scope="row">가격</th>
									<td>${dto.room_price }</td>
								</tr>
								<tr>
									<th class="grey lighten-2" scope="row">최대 인원</th>
									<td>${dto.guest_number }</td>
								</tr>
								<tr>
									<th class="grey lighten-2" scope="row">내용</th>
									<td><textarea rows="10" cols="60" readonly>${dto.room_content }</textarea></td>
								</tr>
							</table>
							<br>
							<input type="button" value="수정" onclick="location.href='manager_roomupdateform.do?roomno=${dto.roomno}'"
							class="btn btn-light-green btn-lg btn-block">

					</div>
				</div>
			</div>
		</div>
	</div>
<br><br>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>