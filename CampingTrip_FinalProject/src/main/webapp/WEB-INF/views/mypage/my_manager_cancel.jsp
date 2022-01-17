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

tbody a {
	text-decoration : none;
	color : black;
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
						<li class="nav-item active">
							<a class="nav-link font-weight-bold" id="active" href="manager_reservlist.do">예약 현황</a>
							<ul class="submenu">
								<li><a class="nav-link" href="manager_reservfinishlist.do">예약 완료</a>
								<li><a class="nav-link font-weight-bold" id="active" href="manager_reservcancellist.do">예약 취소</a>
							</ul>
						</li>
						<li class="nav-item"><a class="nav-link" href="manager_camplist.do">캠핑지 정보수정</a></li>
						<li class="nav-item"><a class="nav-link" href="memberDetail.do">개인정보</a></li>
					</ul>
				</nav>
			</div>


			<div class="col-md-10" id="contentDiv">
				<div class="row justify-content-center">
					<div class="col-md-13 order-md-1">
						<br> <br>
						<c:choose>
							<c:when test="${map.count == 0 }">
								<td colspan="7" align="center">-------------------- 예약이 취소된 캠핑지가 없습니다 --------------------</td>
							</c:when>

							<c:otherwise>
								<table>
									<colgroup>
										<col width="350">
										<col width="1000">
										<col width="1000">
										<col width="1000">
										<col width="1000">
										<col width="1200">
										<col width="1000">
									</colgroup>
									<thead>
										<tr>
											<th>예약번호</th>
											<th>예약자</th>
											<th>체크인</th>
											<th>체크아웃</th>
											<th>인원</th>
											<th>예약상세보기</th>
											<th>예약 여부</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${map.list }" var="row" varStatus="i">
											<tr>
												<th>${row.reservno }</th>
												<td>${row.user_name }</td>
												<td><fmt:formatDate pattern="yyyy/MM/dd" value="${row.check_in }" /></td>
												<td><fmt:formatDate pattern="yyyy/MM/dd" value="${row.check_out }" /></td>
												<td>${row.guest_number }</td>
												<td><a href="manager_reservdetail.do?reservno=${row.reservno }"
												onclick="window.open('manager_reservdetail.do?reservno=${row.reservno }', '예약상세보기','width=700, height=650 top=50, left=400'); return false">상세보기</a></td>
												<td>${row.status }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
<br><br>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>