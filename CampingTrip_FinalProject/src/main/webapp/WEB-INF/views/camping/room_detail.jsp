<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8' />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href='/resources/fullcalendar-5.10.1/lib/main.css'
	rel='stylesheet' />
<script src='/resources/fullcalendar-5.10.1/lib/main.js'></script>
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
@font-face {
    font-family: 'EliceDigitalBaeum_Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/EliceDigitalBaeum_Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.column {
	font-family: 'EliceDigitalBaeum_Bold';
	font-size: 23px;
	font-weight: bold;
	background-color:#d49466;
	color:white;
	margin-bottom:10px;
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

.thumbnail {
	height: 160px;
	width: 250px;
}

#title {
	font-size: 25px;
	font-weight: bold;
}

#price {
	font-size: 20px;
	font-weight: bold;
	color: rgb(51, 103, 214);
}

#people {
	font-size: 16px;
	font-weight: bold;
}

.column_content {
	min-height: 200px;
	background-color: rgb(212 148 102 / 16%);
	
	padding: 8px;
	border-radius: 1em;
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
.slide_images{
	width:540px;
	height:300px;
}
.column_img{
	padding:0px;
}
.thumbnail{
	border-radius:8px;
}
</style>
<script>
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
      
      
      function moveToResrv(roomno){
    	  var options = 'top=10, left=10, width=1000, height=645, status=no, menubar=no, toolbar=no, resizable=no';
    	  window.open('reservationform.do?roomno='+roomno,'resrv',options);
    	  
    	  window.close();
      }
      function moveToReservation(roomno) {
  		//로그인이 없거나 페널티가 있는경우 안되게
  		$.ajax({
  			url : "loginChk.do",
  			method : "post",
  			success : function(data) {
  				if (data.data === true) {
  					window.resizeTo(1000,645);
  					location.href="reservationform.do?roomno="+roomno;
  				} else {
  					if (confirm("로그인이 필요한 작업입니다. 로그인 하시겠습니까?")) {
						
  						opener.parent.moveToLogin();
  						window.close();
  					} else {

  					}
  				}
  			}
  		})
  	}
    </script>

</head>
<body>
	<div class='container'>
		<div class="row d-flex mt-5">
			<div class="col-12 column">객실정보</div>
			<div class="col-6 thumbnail_img">
				<img src="${roomDto.thumbnail }" class="thumbnail">
			</div>
			<div class="col-6">
				<div id="title">${roomDto.room_name}</div>
				<div id="price">${roomDto.room_price}원</div>
				<div id="people">정원 : ${roomDto.guest_number}명</div>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col-12 column">상세설명</div>
			<div class="col-12 column_content">${roomDto.room_content}</div>
		</div>

		<c:if test="${not empty imgList}">
			<div class="row mt-5">
				<div class="col-12 column">객실 이미지</div>
				<div class="col-12 column_img">
					<div id="carouselExampleIndicators" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-indicators">
							<c:forEach items="${imgList}" var="idto" varStatus="status">
								<c:choose>
									<c:when test="${status.index eq 0 }">
										<button type="button"
											data-bs-target="#carouselExampleIndicators"
											data-bs-slide-to="${status.index}" class="active"
											aria-current="true" aria-label="${status.count }"></button>
									</c:when>
									<c:otherwise>
										<button type="button"
											data-bs-target="#carouselExampleIndicators"
											data-bs-slide-to="${status.index}"
											aria-label="${status.count }"></button>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
						<div class="carousel-inner">
							<c:forEach items="${imgList}" var="idto" varStatus="status">
								<c:choose>
									<c:when test="${status.index eq 0 }">
										<div class="carousel-item active">
											<img src="/upload/${idto.save_file_name}"
												class="d-block w-100 rounded slide_images" alt="...">
										</div>
									</c:when>
									<c:otherwise>
						<<div class="carousel-item">
											<img src="/upload/${idto.save_file_name}"
												class="d-block w-100 rounded slide_images" alt="...">
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>
			</div>
		</c:if>
		<div class="row mt-5">
			<div class="col-md-12 column">예약현황</div>
			<div id='calendar'></div>
		</div>
		<div class="row mt-5">
			<div class="col-md-12 d-flex justify-content-center">
				<button type="button" class="btn2"
					onclick="moveToReservation('${roomDto.roomno}')">예약</button>
				<button type="button" class="btn2" onclick="window.close()">취소</button>
			</div>
		</div>
	</div>
</body>
</html>