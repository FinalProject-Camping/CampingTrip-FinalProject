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

/* 채팅 */
table.tableChat {
	border-collapse: collapse;
	text-align: center;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 20px 10px;
}

table.tableChat thead th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	color: #fff;
	background: #e7708d;
	margin: 20px 10px;
}

table.tableChat tbody th {
	width: 150px;
	padding: 10px;
}

table.tableChat td {
	width: 350px;
	padding: 10px;
}

table.tableChat .even {
	background: #fdf3f5;
}

.chatDiv {
	display: flex;
	margin-left: 80px;
}

.pcontent {
	font-size: 18px;
	font-weight: bold;
	width: 300px;
}

/* 채팅 말풍선 */
.balloon {
	position: relative;
	width: 450px;
	height: 50px;
	background: pink;
	border-radius: 15px;
	padding-top: 12px;
	margin-left: 150px;
}

.balloon:after {
	border-top: 0px solid transparent;
	border-left: 10px solid transparent;
	border-right: 10px solid transparent;
	border-bottom: 10px solid pink;
	content: "";
	position: absolute;
	top: -10px;
	left: 50px;
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
								<li><a class="nav-link" href="member_calendar.do">캠핑일정</a>
								<li><a class="nav-link" href="member_reservlist.do">예약완료/취소</a>
							</ul>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="member_likelist.do">찜 리스트</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="member_pointlist.do">포인트 현황</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="memberDetail.do">개인정보</a>
						</li>
						<li class="nav-item active">
							<a class="nav-link font-weight-bold" id="active" href="">채팅</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="member_reportlist.do">신고</a>
						</li>
					</ul>
				</nav>
			</div>




			<div class="col-md-10" id="contentDiv">
				<div class="row justify-content-center">
					<div class="col-md-10 order-md-1">
						<br> <br>
						<table class="tableChat">
							<colgroup>
								<col width="300"><col width="900"><col width="1200">
							</colgroup>
							<thead>
								<tr>
									<th>NO</th>
									<th>아이디</th>
									<th>채팅</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty list }">
										<tr>
											<td colspan="3" align="center">-------------------- 작성된 글이
												없습니다--------------------</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${list }" var="dto">
											<tr>
												<th>${dto.chat_no }</th>
												<td>${dto.chat_id }</td>
												<td>
													<div class="chatDiv">
														<p class="pcontent">${dto.chat_title }</p>
														<p class="text-muted"><fmt:formatDate pattern="yyyy/MM/dd" value="${dto.chat_date }"/></p>
													</div>
													<div class="balloon">${dto.chat }</div>
												</td>
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
<br><br>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>