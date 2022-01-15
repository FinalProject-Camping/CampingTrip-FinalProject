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


<style type="text/css">
#mypageText {
	font-size: 25px;
}

.navbar {
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

/* 예약 테이블 */
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
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				<nav class="navbar navbar-light">
					<ul class="navbar-nav">
						<li class="nav-item">
							<a class="text-decoration-none text-body font-weight-bold"
								 id="mypageText" href="">마이페이지</a></li>
						<li class="nav-item active">
							<a class="nav-link font-weight-bold" id="active" href="memberreserve.do">예약 리스트</a>
							<ul class="submenu">
								<li><a class="nav-link" href="">캠핑일정</a>
								<li><a class="nav-link font-weight-bold" id="active" href="memberreserve.do">예약완료/취소</a>
							</ul>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="camplist.do">찜 리스트</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="pointlist.do">포인트 현황</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="loginform.do">개인정보</a>
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




			<div class="col-md-10" id="contentDiv">
				<div class="row justify-content-center">
					<div class="col-md-12 order-md-1">
						<br> <br>
						<table>
							<colgroup>
								<col width="170">
								<col width="1250">
								<col width="1250">
								<col width="1250">
								<col width="1200">
							</colgroup>
							<thead>
								<tr>
									<th>NO</th>
									<th>캠핑지</th>
									<th>객실</th>
									<th>일자</th>
									<th>예약 여부</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty list }">
										<tr>
											<td colspan="5" align="center">-------------------- 작성된 글이
												없습니다--------------------</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${list }" var="dto">
											<tr>
												<th>${dto.reserve_no }</th>
												<td>${dto.reserve_name }</td>
												<td>${dto.reserve_type }</td>
												<td><fmt:formatDate pattern="yyyy/MM/dd" value="${dto.reserve_date }"/></td>
												<td>${dto.reserve }</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
			
		</div>
	</div>
</html>
</body>