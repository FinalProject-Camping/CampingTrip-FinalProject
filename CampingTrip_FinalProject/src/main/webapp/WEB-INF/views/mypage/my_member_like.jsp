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

h3 {
	font-family: 'EliceDigitalBaeum_Bold';
}


#mypageText {
	font-family: 'EliceDigitalBaeum_Bold';
	font-size: 32px;
}

#navbar {
	height: 590px;
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

.card-img-top {
	background-color: gray;
	width: 288px;
	height: 250px;
}

#card {
	display: flex;
}


/* 테이블 */
table {
	/* 테이블 화면 중앙으로 정렬 */
	margin: auto;
	width: 80%;
	border-collapse: collapse;
	line-height: 1.5;
}

th, td {
	padding: 10px;
	text-align: center;
}

thead th {
	padding: 10px;
	font-weight: bold;
	text-align: center;
	vertical-align: top;
	color: #198754;
	border-bottom: 3px solid #125132;
}

tbody th {
	width: 150px;
	padidng: 10px;
	text-align: center;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}

td {
	width: 350px;
	padding: 10px;
	text-align: center;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
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
								 id="mypageText" href="member_reservlist.do">마이페이지</a></li>
						<li class="nav-item">
							<a class="nav-link" href="member_reservlist.do">예약 리스트</a>
							<ul class="submenu">
								<li><a class="nav-link" href="member_reservlist.do">예약완료/취소</a>
							</ul>
						</li>
						<li class="nav-item active">
							<a class="nav-link font-weight-bold" id="active" href="member_likelist.do">찜 리스트</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="memberDetail.do">개인정보</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="mychatlist.do">채팅</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="member_reportlist.do">신고</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#" onclick="ajaxEnabledUpdate.do ">회원탈퇴</a>
						</li>
					</ul>
				</nav>
			</div>




			<!-- Classic tabs -->
			<div class="col-md-10">
				<div class="row justify-content-center">
					<div class="col-md-15 order-md-1">
						<br>
						<h3 class="mb-3" style="font-weight: bold; margin:auto; width:20%;">${loginId }님 찜리스트</h3>
						<br>

						<div class="tab-content card pt-5" id="myClassicTabContentOrange"
							style="padding: 15px;">

							<div class="tab-pane fade active show"
								id="profile-classic-orange" role="tabpanel"
								aria-labelledby="profile-tab-classic-orange">
								<div class="row">
									<c:choose>
										<c:when test="${map.count == 0 }">
											<p>찜한 중고물품이 없습니다</p>
										</c:when>

										<c:otherwise>
											<c:forEach items="${map.list }" var="row" varStatus="i">
												<div class="col-sm" id="card">
													<div class="card" style="width: 288px; margin-bottom: 30px;">

														<img class="card-img-top" src="${row.imglist }">

														<div class="card-body">
															<h4 class="card-title">${row.title }</h4><br>
															<a href="joonggo_selectone.do?seq=${row.seq}" class="btn btn-light-green btn-lg btn-block">보러가기</a>
														</div>
													</div>
												</div>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Classic tabs -->
		</div>
	</div>
<br><br>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>