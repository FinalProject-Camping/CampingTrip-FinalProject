<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실 예약</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="/resources/datepicker/css/datepicker.min.css"
	rel="stylesheet" type="text/css" media="all">
<link href='/resources/fullcalendar-5.10.1/lib/main.css'
	rel='stylesheet' />
<script src='/resources/fullcalendar-5.10.1/lib/main.js'></script>
<!-- Air datepicker css -->
<script src="/resources/datepicker/js/datepicker.js"></script>
<!-- Air datepicker js -->
<script src="/resources/datepicker/js/datepicker.ko.js"></script>
<!-- 달력 한글 추가를 위해 커스텀 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<style type="text/css">
.title {
	font-size: 23px;
	font-weight: bold;
	margin: 15px;
}

a {
	color: black;
	text-decoration: none;
	font-weight: bold;
}

#calendar {
	widht: 540px;
	height: 500px;
}

.btn2 {
	display: inline-block;
	background: black;
	text-transform: uppercase;
	font-weight: 500;
	font-style: normal;
	font-size: 15px;
	font-weight: bold;
	letter-spacing: 0.3em;
	color: white;
	padding: 10px 30px 10px;
	background: black;
	text-decoration: none;
	margin: 0.625rem;
	border: none;
	border: 1px solid rgba(223, 190, 106, 0.3);
	border-radius: 5px;
}

.room_row {
	width: 600px;
	margin-top: 5px;
	margin-bottom: 5px;
}
.side{
	width:200px;
	margin-right:20px;
}
.reserv_column {
	margin-top: 5px;
	margin-bottom:5px;
	font-weight: bold;
	background-color:rgb(61 89 255 / 29%);
	color:black;
}

input[type=text] {
	width: 100%;
}

.reserv_value {
	margin-top: 5px;
	margin-bottom:5px;
}

#main {
	width: 100%;
	display: flex;
	justify-content: space-around;
}

#left {
	width: 47%;
}

#right {
	width: 47%;
}

#middle {
	width: 1px;
	background-color: black;
}
</style>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
	  
	var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      locale:"ko",
      events:[
    	  <c:forEach items="${resrvList}" var="item">
      		{
      			title:'예약',
      			start:'${item.checkin_tostr()}',
      			end:'${item.checkout_tostr()}'
      		},
    	 </c:forEach>
    	  {
    		  title:'default',
    		  start:'1900-01-01',
    		  end:'1900-01-01'
    	  }
      ]
    });
    calendar.render();
  });
	window.onload = function() {
		window.resizeTo(1000,645);
		document.getElementById('check_in').value = $("#check-in",
				opener.document).val();
		document.getElementById('check_out').value = $("#check-out",
				opener.document).val();
		//datepicker 적용
		$("#check_in").datepicker({
			language : 'ko'
		});
		$("#check_out").datepicker({
			language : 'ko'
		});

		//두 달력 기간에 벗어나지 않도록 설정
		datePickerSet($("#check_in"), $("#check_out"), true);
		
	}
	function datePickerSet(sDate, eDate, flag) {

		//시작 ~ 종료 2개 짜리 달력 datepicker	
		if (!isValidStr(sDate) && !isValidStr(eDate) && sDate.length > 0
				&& eDate.length > 0) {
			var sDay = sDate.val();
			var eDay = eDate.val();

			if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { //처음 입력 날짜 설정, update...			
				var sdp = sDate.datepicker().data("datepicker");
				sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요

				var edp = eDate.datepicker().data("datepicker");
				edp.selectDate(new Date(eDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
			}

			//시작일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
			if (!isValidStr(eDay)) {
				sDate.datepicker({
					maxDate : new Date(eDay.replace(/-/g, "/"))
				});
			}
			sDate.datepicker({
				language : 'ko',
				autoClose : true,
				onSelect : function() {
					datePickerSet(sDate, eDate);
				}
			});

			//종료일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
			if (!isValidStr(sDay)) {
				eDate.datepicker({
					minDate : new Date(sDay.replace(/-/g, "/"))
				});
			}
			eDate.datepicker({
				language : 'ko',
				autoClose : true,
				onSelect : function() {
					datePickerSet(sDate, eDate);
				}
			});

			//한개짜리 달력 datepicker
		} else if (!isValidStr(sDate)) {
			var sDay = sDate.val();
			if (flag && !isValidStr(sDay)) { //처음 입력 날짜 설정, update...			
				var sdp = sDate.datepicker().data("datepicker");
				sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
			}

			sDate.datepicker({
				language : 'ko',
				autoClose : true
			});
		}

		function isValidStr(str) {
			if (str == null || str == undefined || str == "")
				return true;
			else
				return false;
		}
	}
	function sendData(){
		if(!$("input[name=check_in]").val()){
			alert("체크인 날짜를 선택해주세요");
			$("input[name=]").focus();
			
		}else if(!$("input[name=check_out]").val()){
			alert("체크아웃 날짜를 선택해주세요");
			$("input[name=check_out]").focus();
			
		}else if(!$("input[name=user_name]").val()){
			alert("예약자의 성명을 입력해주세요");
			$("input[name=user_name]").focus();
			
		}else if(!$("input[name=user_contact]").val()){
			alert("예약자의 연락가능한 전화번호를 입력해주세요.");
			$("input[name=user_contact]").focus();
			
		}else if(!$("input[name=guest_number]").val()){
			alert("숙박인원을 입력해주세요");
			$("input[name=guest_number]").focus();
		}else if($("input[name=guest_number]").val()>${roomDto.guest_number}){
			alert("숙박인원이 정원을 초과하였습니다");
			$("input[name=guest_number]").focus();
		}else{
		window.resizeTo(600,645);
		document.getElementById('rsvForm').submit();
		}
	}
</script>
</head>
<body>
	<div class="title">객실예약</div>
	<div id="main">
		<div id="left">

			<div class="reserv_column">예약현황</div>
			<div id='calendar'></div>
		</div>
		<div id="middle"></div>
		<div id="right">
			<div class="container">
				<form action="reservationres.do" method="post" id="rsvForm">
					<input type="hidden" name="roomno" value="${roomDto.roomno}">
					<input type="hidden" name="campno" value="${roomDto.campno}">
					<c:set var="loginId" value='<%=session.getAttribute("id")%>' />
					<input type="hidden" name="userid" value="${loginId}">
					<div class="mt-3 reserv_row d-flex">
						<div class="side">
							<div class="reserv_column">체크인</div>
							<div class="reserv_value">
								<input type="text" name="check_in" id="check_in" required
									readonly>
							</div>
						</div>
						<div class="side">
							<div class="reserv_column">체크아웃</div>
							<div class="reserv_value">
								<input type="text" name="check_out" id="check_out" required
									readonly>
							</div>
						</div>
					</div>
					<div class="mt-3 reserv_row">
						<div class="reserv_column">객실명</div>
						<div class="reserv_value">
							<input type="text" name="room_name" id="room_name"
								value="${roomDto.room_name }" readonly>
						</div>
					</div>
					<div class="mt-3 reserv_row">
						<div class="reserv_column">예약자 이름</div>
						<div class="reserv_value">
							<input type="text" name="user_name" id="user_name" required>
						</div>
					</div>
					<div class="mt-3 reserv_row">
						<div class="reserv_column">예약자 연락처</div>
						<div class="reserv_value">
							<input type="text" name="user_contact" id="user_contact" required>
						</div>
					</div>
					<div class="mt-3 reserv_row">
						<div class="reserv_column">숙박인원</div>
						<div class="reserv_value">
							<input type="text" name="guest_number" id="guest_number" required placeholder="최대 숙박인원 ${roomDto.guest_number} ">
						</div>
					</div>

					<div class="row mt-5">
						<div class="col-md-12 d-flex justify-content-center">
							<button type="button" class="btn2" onclick="sendData()">예약</button>
							<button type="button" class="btn2" onclick="window.close()">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>
</body>
</html>