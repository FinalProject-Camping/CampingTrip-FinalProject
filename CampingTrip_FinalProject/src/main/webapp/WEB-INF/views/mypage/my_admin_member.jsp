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
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Google Fonts -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<!-- Bootstrap core CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Material Design Bootstrap -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css"
	rel="stylesheet">

<!-- JQuery -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>


<%@ include file="/WEB-INF/views/common/header.jsp" %>


<script type="text/javascript">
	function memberdelete() {
		alert("회원 탈퇴를 완료했습니다.");
	}
	function memberpenalty() {
		alert("회원에게 페널티를 부과했습니다.");
	}
	
</script>




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

.buttonDiv {
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
								id="mypageText" href="admin_camplist.do">마이페이지</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="admin_camplist.do">캠핑지 등록 리스트</a>
						</li>
						<li class="nav-item active"><a class="nav-link font-weight-bold" id="active" href="admin_memberlist.do">회원 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="admin_reportlist.do">신고 내역</a></li>
						<li class="nav-item"><a class="nav-link" href="">관리자 계정 추가</a></li>
					</ul>
				</nav>
			</div>


			<div class="col-md-10" id="contentDiv">
				<div class="row justify-content-center">
					<div class="col-md-11 order-md-1">
						<table>
							<colgroup>
								<col width="300">
								<col width="1000">
								<col width="1000">
								<col width="1000">
								<col width="450">
							</colgroup>
							<thead>
								<tr>
									<th>회원번호</th>
									<th>아이디</th>
									<th>등급</th>
									<th>페널티</th>
									<th>관리</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty list }">
										<tr>
											<td colspan="5" align="center">---------- 가입된 회원이 없습니다 ----------</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${list }" var="dto">
											<tr>
												<th>${dto.myno }</th>
												<td>${dto.myid }</td>
												<td>${dto.myrole }</td>
												<td>${dto.mypenalty }</td>
												<td>
													<div class="buttonDiv">
														<button type="submit" class="btn btn-danger btn-sm"
															onclick="memberpenalty();">페널티</button>
														<form action="admin_memdelete.do" method="post">
															<input type="hidden" name="myno" value="${dto.myno }">
															<button type="submit" class="btn btn-danger btn-sm"
																onclick="memberdelete();">탈퇴</button>
														</form>
													</div>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<br>
						<nav aria-label="Page navigation example">
							<ul class="pagination pg-blue justify-content-center">
								<li class="page-item">
									<a class="page-link" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
								</a></li>
								<li class="page-item"><a class="page-link">1</a></li>
								<li class="page-item"><a class="page-link">2</a></li>
								<li class="page-item"><a class="page-link">3</a></li>
								<li class="page-item"><a class="page-link"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										<span class="sr-only">Next</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
<br><br>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>