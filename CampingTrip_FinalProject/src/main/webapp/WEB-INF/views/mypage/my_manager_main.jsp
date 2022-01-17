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


<%@ include file="/WEB-INF/views/common/header.jsp"%>


<script type="text/javascript">
	function reserve() {
		alert("예약이 확정되었습니다.");
	}

	function reserveCancel() {
		alert("예약이 취소되었습니다.");
	}
</script>




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
	text-decotation : none;
	color : black;
}

.buttonDiv {
	display: flex;
}

tr > th {
	font-family: 'EliceDigitalBaeum_Regular';
	font-size : 16px;
}
tr > td {
	font-size : 16px;
}

</style>
</head>
<body>
	<br>
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				<nav class="navbar navbar-light" id="navbar">
					<ul class="navbar-nav">
						<li class="nav-item"><a
							class="text-decoration-none text-body font-weight-bold"
							id="mypageText" href="manager_reservlist.do">마이페이지</a></li>
						<li class="nav-item active"><a
							class="nav-link font-weight-bold" id="active"
							href="manager_reservlist.do">예약 현황</a>
							<ul class="submenu">
								<li><a class="nav-link" href="manager_reservfinishlist.do">예약
										완료</a>
								<li><a class="nav-link" href="manager_reservcancellist.do">예약
										취소</a>
							</ul></li>
						<li class="nav-item"><a class="nav-link"
							href="manager_camplist.do">캠핑장 정보수정</a></li>
							
						<li class="nav-item"><a class="nav-link" href="memberDetailCheck.do">개인정보</a></li>
						<li class="nav-item"><a class="nav-link" href="memberPwCheck.do">회원탈퇴</a></li>
						
						
						
					</ul>
				</nav>
			</div>

			<div class="col-md-10" id="contentDiv">
				<div class="row justify-content-center">
					<div class="col-md-13 order-md-1">
						<br>
						<h2 class="mb-3" style="font-weight: bold; margin:auto; width:30%;">${loginId }님 캠핑지 예약 현황</h2>
						<br>
						<c:choose>
							<c:when test="${map.count == 0 }">
								<td colspan="7" align="center">-------------------- 예약대기중인 캠핑지가 없습니다 --------------------</td>
							</c:when>

							<c:otherwise>
								<table>
									<colgroup>
										<col width="400">
										<col width="1000">
										<col width="1000">
										<col width="1000">
										<col width="1000">
										<col width="1100">
										<col width="400">
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
												onclick="window.open('manager_reservdetail.do?reservno=${row.reservno }', '예약상세보기','width=700, height=650 top=50, left=400'); return false">
												<button class="btn" style="background-color:#198754; color:white; font-weight:bold;">상세보기</button></a></td>
												<td>
													<div class="buttonDiv">
														<form action="manager_reservupdate.do" method="post">
															<input type="hidden" name="reservno" value="${row.reservno }">
															<button type="submit" class="btn btn-primary btn-sm" style="font-size:14px; width:120px; height:45px;"
																onclick="reserve();">예약확정</button>
														</form>
														&nbsp;
														<form action="manager_reservcancel.do" method="post">
															<input type="hidden" name="reservno" value="${row.reservno }">
															<button type="submit" class="btn btn-danger btn-sm" style="font-size:14px; width:120px; height:45px;"
																onclick="reserveCancel();">예약취소</button>
														</form>
													</div>
												</td>
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
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>