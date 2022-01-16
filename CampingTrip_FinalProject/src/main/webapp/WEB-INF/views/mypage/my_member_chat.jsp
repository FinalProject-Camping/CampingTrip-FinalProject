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
	padding: 10px;
	font-weight: bold;
	color: #fff;
	background: #e7708d;
	margin: 20px 10px;
}

table.tableChat tbody th {
	padding: 10px;
}

table.tableChat td {
	padding: 10px;
}

table.tableChat .even {
	background: #fdf3f5;
}

.chatDiv {
	display: flex;
	text-align: left;
}

.pcontent {
	font-size: 18px;
	font-weight: bold;
	width: 300px;
}

/* 채팅 말풍선 */
.balloon {
	position: relative;
	width: 200px;
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
.btn_{
	background-color: white;
	border-radius: 8px;
	border: 1px solid gray;
	margin-bottom: 3px;
}

</style>
</head>
<body>
<br><br>
	<div class="container">
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
							<a class="nav-link font-weight-bold" id="active" href="mychatlist.do">채팅</a>
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
								<col width="200"><col width="100"><col width="100"><col width="500"><col width="800">
							</colgroup>
							<thead>
								<tr>
									<th>생성일</th>
									<th>판매자</th>
									<th colspan="2">제목</th>
									<th>채팅보기</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty list }">
										<tr>
											<td colspan="5" align="center">-------------------- 채팅 내역이 없습니다.--------------------</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${list }" var="dto">
											<tr>
												<th><fmt:formatDate pattern="yyyy/MM/dd" value="${dto.createdate }"/></th>
												<td>${dto.writer }</td>
												<td><img src="${dto.imglist}" width="100" height="100"></td>
												<td style="float:left">
													<div class="chatDiv">
														<p class="pcontent"><a style="color:black !important;" href="joonggo_selectone.do?seq=${dto.joonggoseq }">${dto.title }</a></p>
													</div>
													<div class="balloon">
															<c:set var="userid" value="${dto.userid }"></c:set>
															<c:set var="sessionid" value="${sessionid }"></c:set>
														<c:choose>
															<c:when test="${userid eq sessionid}">
																<b>구매 문의</b>
															</c:when>
															<c:otherwise>
																<b>판매 문의</b>														
															</c:otherwise>
														</c:choose>
													</div>
												</td>
												<td>
													<button class="btn_ shadow" onclick="chat(this)" seq="${dto.joonggoseq }" userid="${dto.userid }" writer="${dto.writer }" roomseq="${dto.roomseq }">채팅확인</button>
													<button class="btn_ shadow" onclick="del(this)" roomseq="${dto.roomseq }" >나가기</button>
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
			
			<script type="text/javascript">
			
				function popup(url, name, width, height){
				    var _width = width;
				    var _height = height;
				 
				    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
				    var _left = Math.ceil(( window.screen.width - _width )/2);
				    var _top = Math.ceil(( window.screen.height - _height )/2); 
				 
				    window.open(url, name, 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top +',status=no, toolbar=no, scrollbars=no, resizable=no');
				}
				
				function chat(ele){
					var seq = ele.getAttribute('seq');
					var writer = ele.getAttribute('writer');
					var roomseq = ele.getAttribute('roomseq');
					$.ajax({
						url:"confirmsession.do",
						method: "post",
						success:function(data){ 
							if(data.data === true){
								popup("joonggo_myroom.do?joonggoseq="+seq+"&writer="+writer+"&userid=${sessionid}&roomseq="+roomseq, "채팅하기",450,620);
							}else{
								alert('로그인이 필요합니다.');
								location.href='loginform.do';
							}
						}
					})
				}
				
				function del(ele){
					$.ajax({
						url:"confirmsession.do",
						method: "post",
						success:function(data){ 
							if(data.data === true){
								var roomseq = ele.getAttribute('roomseq');
								
								sendDeletemessage(roomseq, '${sessionid}', ele);
								
							}else{
								alert('로그인이 필요합니다.');
								location.href='loginform.do';
							}
						}
					})
				}
				
				function sendDeletemessage(roomseq, sessionid, ele){
					$.ajax({
						url:"joonggo_sendDeletemessage.do",
						data:{"roomseq":roomseq,
							  "sender":sessionid,
							  "content":sessionid},
						method: "post",
						success:function(data){ 
							if(data.data === true){
								$(ele).closest('tr').remove();
							}else{
								location.href='error.do';
							}
						}
					})
				}
			
			</script>
			
			
		</div>
	</div>
<br><br>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>


























