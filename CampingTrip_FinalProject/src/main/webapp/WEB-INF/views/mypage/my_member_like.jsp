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

.card-img-top {
	background-color: gray;
	width: 288px;
	height: 250px;
}

#card {
	display: flex;
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
								 id="mypageText" href="">마이페이지</a></li>
						<li class="nav-item">
							<a class="nav-link" href="memberreserve.do">예약 리스트</a>
							<ul class="submenu">
								<li><a class="nav-link" href="">캠핑일정</a>
								<li><a class="nav-link" href="memberreserve.do">예약완료/취소</a>
							</ul>
						</li>
						<li class="nav-item active">
							<a class="nav-link font-weight-bold" id="active" href="camplist.do">찜 리스트</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="pointlist.do">포인트 현황</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="memberDetail.do">개인정보</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="chatlist.do">채팅</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="reportlist.do">신고</a>
						</li>
					</ul>
				</nav>
			</div>




			<!-- Classic tabs -->
			<div class="col-md-10">
				<div class="row justify-content-center">
					<div class="col-md-15 order-md-1">
						<br>
						<ul class="nav tabs-orange justify-content-center"
							id="myClassicTabOrange" role="tablist">
							<li class="nav-item"><a
								class="nav-link  waves-light active show"
								id="profile-tab-classic-orange" data-toggle="tab"
								href="#profile-classic-orange" role="tab"
								aria-controls="profile-classic-orange" aria-selected="true">
									<button type="button" class="btn btn-primary btn-lg btn-block">&nbsp;&nbsp;캠핑지&nbsp;&nbsp;</button>
							</a></li>
							<li class="nav-item"><a class="nav-link waves-light"
								id="follow-tab-classic-orange" data-toggle="tab"
								href="#follow-classic-orange" role="tab"
								aria-controls="follow-classic-orange" aria-selected="false">
									<button type="button" class="btn btn-primary btn-lg btn-block">중고거래</button>
							</a></li>
						</ul>
						<!-- 탭부분 -->



						<div class="tab-content card pt-5" id="myClassicTabContentOrange"
							style="padding: 15px;">

							<div class="tab-pane fade active show"
								id="profile-classic-orange" role="tabpanel"
								aria-labelledby="profile-tab-classic-orange">
								<div class="row">
									<c:choose>
										<c:when test="${empty list }">
											<p>찜한 캠핑지가 없습니다</p>
										</c:when>

										<c:otherwise>
											<c:forEach items="${list }" var="dto">
												<div class="col-sm" id="card">
													<div class="card"
														style="width: 288px; margin-bottom: 30px;">

														<img class="card-img-top" src="${dto.imglist }"
															alt="Card image">

														<div class="card-body">
															<h4 class="card-title">${dto.title }</h4>
															<a href="#" class="btn btn-primary">보러가기</a>
														</div>
													</div>
												</div>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</div>
							</div>




							<!-- 중고거래부분 -->
							<div class="tab-pane fade" id="follow-classic-orange"
								role="tabpanel" aria-labelledby="follow-tab-classic-orange">
								<div class="row">
									<c:choose>
										<c:when test="${empty list }">
											<p>찜한 중고상품이 없습니다</p>
										</c:when>

										<c:otherwise>
											<c:forEach items="${list }" var="dto">
												<div class="col-sm" id="card">
													<div class="card"
														style="width: 288px; margin-bottom: 30px;">

														<img class="card-img-top" src="img_avatar1.png"
															alt="Card image">

														<div class="card-body">
															<h4 class="card-title">${dto.camp_name }</h4>
															<a href="#" class="btn btn-primary">보러가기</a>
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