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
	function campdelete() {
		alert("캠핑지 삭제를 완료했습니다.");
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

.search {
	padding-left : 155px;
	margin-bottom : 20px;
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
								id="mypageText" href="admin_camplist.do">마이페이지</a>
						</li>
						<li class="nav-item active">
							<a class="nav-link font-weight-bold" id="active" href="admin_camplist.do">캠핑지 등록 리스트</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="admin_list.do">회원 관리</a></li>
						<li class="nav-item"><a class="nav-link" href="admin_reportlist.do">신고 내역</a></li>
						<li class="nav-item"><a class="nav-link" href="registerform.do">관리자 계정 추가</a></li>
						<li class="nav-item"><a class="nav-link" href="memberDetailCheck.do">개인정보</a></li>
						<li class="nav-item"><a class="nav-link" href="memberPwCheck.do">회원탈퇴</a></li>

					</ul>
				</nav>
			</div>


			<div class="col-md-10" id="contentDiv">
				<div class="row justify-content-center">
					<div class="col-md-12 order-md-1">
						<br>
						<h2 class="mb-3" style="font-weight: bold; margin:auto; width:20%;">캠핑지 등록 리스트</h2>
						<br>
						<div class="search">
						<form name="form1" method="post" action="admin_camplist.do">
							<select name="searchOption" style="font-family: 'EliceDigitalBaeum_Regular';height:36px;">
								<!-- 검색조건을 검색처리 후 결과화면에 보여주기 위해 c:out 출력 태그 사용, 삼항연산자 -->
								<option value="name" <c:out value="${map.searchOption == 'name'?'selected':'' }"/>>이름</option>
								<option value="all" <c:out value="${map.searchOption == 'all'?'selected':'' }"/>>주소</option>
							</select>
							<input name="keyword" value="${map.keyword }" style="height:37px;">
							<input type="submit" value="조회" class="btn btn-light-green btn-sm btn-block" style="font-family: 'EliceDigitalBaeum_Bold'; font-size:15px;">
						</form>
						
						<!-- 레코드의 갯수를 출력 -->
						<div style="font-family: 'EliceDigitalBaeum_Regular';">${map.count }개의 캠핑지가 검색되었습니다.</div>
						</div>
						
						<table>
							<colgroup>
								<col width="170">
								<col width="1200">
								<col width="1200">
								<col width="1000">
							</colgroup>
							<thead>
								<tr>
									<th>NO</th>
									<th>캠핑지</th>
									<th>주소</th>
									<th>관리</th>
								</tr>
							</thead>
							<tbody>
										<c:forEach var="row" items="${map.list }">
											<tr>
												<th>${row.campno }</th>
												<td>${row.name }</td>
												<td>${row.address }&nbsp;${row.address_detail }</td>
												<td>
													<div class="buttonDiv">
														<form action="admin_campdelete.do" method="post">
															<input type="hidden" name="campno" value="${row.campno }">
														<button type="submit" class="btn btn-danger btn-sm" onclick="campdelete();">삭제</button>
														</form>
													</div>
												</td>
											</tr>
										</c:forEach>
							</tbody>
						</table>
						<br>
						







						<%-- <div style="display: block; text-align: center;">
							<c:if test="${paging.startPage != 1 }">
								<a
									href="/boardList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
							</c:if>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
								var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage }">
										<b>${p }</b>
									</c:when>
									<c:when test="${p != paging.nowPage }">
										<a
											href="boardList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.endPage != paging.lastPage}">
								<a
									href="boardList.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
							</c:if>
						</div> --%>





						<!-- <nav aria-label="Page navigation example">
							<ul class="pagination pg-blue justify-content-center">
								<li class="page-item"><a class="page-link"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
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
						</nav> -->
					</div>
				</div>
			</div>
		</div>
	</div>
<br><br>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>