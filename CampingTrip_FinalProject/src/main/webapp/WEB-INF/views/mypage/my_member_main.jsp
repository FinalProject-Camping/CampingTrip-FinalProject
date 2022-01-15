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


<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>





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


<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	// new FullCalendar.Calendar(대상 DOM객체, {속성:속성값, 속성2:속성값2..}) 

	var calendar = new FullCalendar.Calendar(calendarEl, {
		headerToolbar: {
		left: 'prev,next today',
		center: 'title',
		right: 'dayGridMonth,timeGridWeek,timeGridDay'
	},
	initialDate: '2021-04-12', // 초기 로딩 날짜.
	navLinks: true, // can click day/week names to navigate views
	selectable: true,
	selectMirror: true,
	// 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용..
	select: function(arg) {
	console.log(arg);

	var title = prompt('입력할 일정:');
	// title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
	if (title) {
	calendar.addEvent({
	title: title,
	start: arg.start,
	end: arg.end,
	allDay: arg.allDay,
	backgroundColor:"yellow",
	textColor:"blue"
	})
	}
	calendar.unselect()
	},
	eventClick: function(arg) {
	// 있는 일정 클릭시,
	console.log("#등록된 일정 클릭#");
	console.log(arg.event);

	if (confirm('Are you sure you want to delete this event?')){
	arg.event.remove()
	}
	},
	editable: true,
	dayMaxEvents: true, // allow "more" link when too many events
	events:
	//================ ajax데이터 불러올 부분 =====================//
	});
	calendar.render();
	});
</script>


</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				<nav class="navbar navbar-light" id="navbar">
					<ul class="navbar-nav">
						<li class="nav-item">
							<a class="text-decoration-none text-body font-weight-bold"
								 id="mypageText" href="">마이페이지</a></li>
						<li class="nav-item active">
							<a class="nav-link font-weight-bold" id="active" href="memberreserve.do">예약 리스트</a>
							<ul class="submenu">
								<li><a class="nav-link" href="">캠핑일정</a>
								<li><a class="nav-link" href="memberreserve.do">예약완료/취소</a>
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


						<div id='calendar'></div>



					</div>
				</div>
			</div>
			
			
		</div>
	</div>
</html>
</body>