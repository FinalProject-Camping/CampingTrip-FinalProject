<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@page import="java.util.List"%>
<%@page import="com.camping.controller.model.camp.dto.ReservationDto"%>

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


<!-- fullcalendar css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

<!-- fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>



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
				<nav class="navbar navbar-light" id="navbar">
					<ul class="navbar-nav">
						<li class="nav-item">
							<a class="text-decoration-none text-body font-weight-bold"
								 id="mypageText" href="member_calendar.do">마이페이지</a></li>
						<li class="nav-item active">
							<a class="nav-link font-weight-bold" id="active" href="member_calendar.do">예약 리스트</a>
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
						<li class="nav-item">
							<a class="nav-link" href="chatlist.do">채팅</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="member_reportlist.do">신고</a>
						</li>
					</ul>
				</nav>
			</div>




			<div class="col-md-10" id="contentDiv">
				<div class="row justify-content-center">
					<div class="col-md-12 order-md-1">


						<div id='calendar'></div>
						
						
						
						<script>
						document.addEventListener('DOMContentLoaded', function() {
							var calendarEl = document.getElementById('calendar');
							var calendar = new FullCalendar.Calendar(calendarEl, {
								initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
								headerToolbar : { // 헤더에 표시할 툴 바
									start : 'prev next today',
									center : 'title',
									end : 'dayGridMonth,dayGridWeek,dayGridDay'
								},
								titleFormat : function(date) {
									return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
								},
								//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
								selectable : true, // 달력 일자 드래그 설정가능
								droppable : true,
								editable : true,
								nowIndicator: true, // 현재 시간 마크
								locale: 'ko' // 한국어 설정
							});
							calendar.render();
						});
						
						
						<%-- document.addEventListener('DOMContentLoaded', function() {
							var calendarEl = document.getElementById('calendar');
							var calendar = new FullCalendar.Calendar(calendarEl, {
								initialView : 'dayGridMonth',
								locale : 'ko', // 한국어 설정
								headerToolbar : {
						        	start : "",
						            center : "prev title next",
						            end : 'dayGridMonth,dayGridWeek,dayGridDay'
						            },
							selectable : true,
							droppable : true,
							editable : true,
							events : [ 
						    	    <%List<ReservationDto> calendarList = (List<ReservationDto>) request.getAttribute("calendarList");%>
						            <%if (calendarList != null) {%>
						            <%for (ReservationDto dto : calendarList) {%>
						            {
						            	title : '<%=dto.getReservno()%>',
						                start : '<%=dto.getCheck_in()%>',
						                end : '<%=dto.getCheck_out()%>',
						                color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
						             },
							<%}
						}%>
										]
										
									});
									calendar.render();
								}); --%>
						</script>





					</div>
				</div>
			</div>
			
			
		</div>
	</div>
</html>
</body>