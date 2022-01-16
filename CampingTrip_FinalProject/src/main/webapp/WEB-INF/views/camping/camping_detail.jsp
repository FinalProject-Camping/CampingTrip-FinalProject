<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑지 상세페이지</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="/resources/datepicker/css/datepicker.min.css"
	rel="stylesheet" type="text/css" media="all">
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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=52cf2e3096a1ac308c542aa15c92feed&libraries=services"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<style type="text/css">
@font-face {
    font-family: 'EliceDigitalBaeum_Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/EliceDigitalBaeum_Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.main, .detail_content {
	margin-top: 100px;
}

.main {
	border: 1px solid #e9ecef;
	border-radius: 1em;
	max-width:1100px;
}

.camping_intro {
	height: 200px;
	background-color: #bdecb6;
	border-radius: 1em;
}

.input-group {
	width: 300px;
}

.carousel-inner>.carousel-item>img {
	top: 0;
	left: 0;
	min-width: 100%;
	height: 340px;
}

.detail_sub {
	margin-top: 25px;
	margin-bottom:20px;
}

.book_btn {
	float: right;
}

.sub_title {
	font-family: 'EliceDigitalBaeum_Bold';
	font-weight: bold;
	font-size: 24px;
	display: flex;
	align-items: center;
}

.sub_content {
	margin-top: 10px;
	padding-left: 32px;
	min-height:100px;
}

.nav-link {
	font-weight: bold;
	color: black;
	font-size: 20px;
	font-family: 'EliceDigitalBaeum_Bold';
}

.nav-link active {
	color: #226640;
}
/*별점 구현*/
.star-rating {
	width: 128px;
	margin-left: 5px;
}

.star-rating, .star-rating span {
	display: inline-block;
	height: 24px;
	overflow: hidden;
	background: url("/resources/img/stars_empty.png") no-repeat;
}

.star-rating span {
	background: url("/resources/img/stars_filled.png") no-repeat;
	background-position: left bottom;
	line-height: 0;
	vertical-align: top;
}
.review_top{
	margin-bottom:10px;
}
.review_sub {
	display: inline-block;
	width: 70px;
	font-size: 16px;
	font-weight: bold;
}
.review_content{
	height:80px;
}
.review_element {
	padding-top: 10px;
	padding-bottom: 10px;
	border: 1px solid gray;
	border-radius: 1em;
	margin-bottom: 30px;
}

.review_profile>img {
	min-height: 100px;
}

.review_title {
	font-size: 16px;
	font-weight: bold;
}

.date {
	color: gray;
}

.chk_date {
	display: inline-block;
	width: 122px;
	text-align: center;
	font-weight: bold;
}

.room_list a {
	color: black;
	text-decoration: none;
	font-weight: bold;
}

.room_title {
	font-family: 'EliceDigitalBaeum_Bold';
	font-size: 28px;
}

.room_price {
	font-size: 20px;
	font-weight: bold;
	color: rgb(51, 103, 214);
}

.room_people {
	font-size: 16px;
	font-weight: bold;
}
.room_list{
	padding:10px;
}
.empty_result{
	height:160px;
	font-size:16px;
	font-weight:bold;
	border: 1px solid gray;
	border-radius:1em;
	margin:0px;
}
.card-body button{
	font-weight:bold;
}
.camping_name{
	font-family: 'EliceDigitalBaeum_Bold';
}
.review_grade{
	display:inline-block;
	width:180px;
}
</style>
<script type="text/javascript">
	window.addEventListener('load',function() {

		//검색기본날짜-현재날짜
		var today = new Date();

		var year = today.getFullYear(); // 년도
		var month = today.getMonth() + 1; // 월
		var date = today.getDate(); // 날짜

		document.getElementById('check-in').value = (year + '/' + month
				+ '/' + date);
		
		//datepicker 적용
		$("#check-in").datepicker({
			language:'ko'
		});
		$("#check-out").datepicker({
			language:'ko'
		});
		
		//두 달력 기간에 벗어나지 않도록 설정
		datePickerSet($("#check-in"), $("#check-out"), true);
		
		//지도 띄우기
		var centerAddr = "${campDto.address}";		
		
		// 주소-좌표 변환 객체를 생성	
		var geocoder = new kakao.maps.services.Geocoder();
		
		//주소 검색하여 주소를 좌표로 변환
		geocoder.addressSearch(centerAddr,function(result, status) {
			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				
				var container = document.getElementById('map'); //지도를 표시할 div
				var options = {
					center : new kakao.maps.LatLng(result[0].y, result[0].x), //지도의 중심 좌표
					level : 4
				//지도 확대 레벨
				};
				//지도 생성
				map = new kakao.maps.Map(container, options);
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				//마커로 표시
				var marker = new kakao.maps.Marker({
					map : map,
					position : coords
				});
				
				// 인포윈도우로 장소에 대한 설명을 표시
				var infowindow = new kakao.maps.InfoWindow(
					{
						content : '<div style="width:150px;text-align:center;">'
								+ "${campDto.name}"
								+ '</div>',
						position : coords
					});
				infowindow.open(map, marker);
				
				function panTo() {
				    // 이동할 위도 경도 위치를 생성합니다 
				    var moveLatLon = coords;
				    
				    // 지도 중심을 부드럽게 이동시킵니다
				    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
				    map.panTo(moveLatLon);            
				}   
			}
			
		});
		
		making_barChart();
		making_doughnutChart();
		
		
	})
	
	function making_barChart(){
		var ctx = document.getElementById('barChart').getContext('2d'); var chart = new Chart(ctx, { 
			// The type of chart we want to create 
			type: 'bar', 
			// The data for our dataset 
			data: { 
				labels: ['10대', '20대', '30대', '40대', '50대이상'], 
				datasets: [{ //label: 'My First dataset', 
				backgroundColor: '#2980B9', 
				borderColor: '#2980B9', 
				data: [${writerInfo.ten}, ${writerInfo.twenty}, ${writerInfo.thirty}, ${writerInfo.fourty}, ${writerInfo.fifty}] }] 
		}, 
		// Configuration options go here 
		options:{
			legend: {
				display: false
			},

			scales:{
				yAxes:[{
					ticks:{
						beginAtZero: true
					}
				}],
				xAxes:[{
					ticks:{
						fontColor: 'black',
						fontWeight: 'boldness',
						fontSize: 18
					}
				}]
			}
		} });
	}
	
	function making_doughnutChart(){
		var ctx = document.getElementById('doughnutChart').getContext('2d'); var chart = new Chart(ctx, { 
			// The type of chart we want to create 
			type: 'doughnut', 
			// The data for our dataset 
			data: { 
				labels: ['남성', '여성'], 
				datasets: [{ //label: 'My First dataset', 
				backgroundColor: [
					'#51A9FE',
					'#FF6D6E'
				],
				borderWidth:0,
				data: [(${writerInfo.man}/${writerInfo.total})*100,(${writerInfo.woman}/${writerInfo.total})*100] }] 
		}, 
		// Configuration options go here 
		options:{
			legend:{
				reverse:true
			}
		} 
		
		});

	}
	function open_roomDetail(roomno){
		
		var options = 'top=10, left=10, width=580, height=700, status=no, menubar=no, toolbar=no, resizable=no';
		window.open("roomdetail.do?roomno="+roomno, "roomdetail", options);
		
	}
	
	function datePickerSet(sDate, eDate, flag) {

	    //시작 ~ 종료 2개 짜리 달력 datepicker	
	    if (!isValidStr(sDate) && !isValidStr(eDate) && sDate.length > 0 && eDate.length > 0) {
	        var sDay = sDate.val();
	        var eDay = eDate.val();

	        if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { //처음 입력 날짜 설정, update...			
	            var sdp = sDate.datepicker().data("datepicker");
	            sdp.selectDate(new Date(sDay.replace(/-/g, "/")));  //익스에서는 그냥 new Date하면 -을 인식못함 replace필요

	            var edp = eDate.datepicker().data("datepicker");
	            edp.selectDate(new Date(eDay.replace(/-/g, "/")));  //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
	        }

	        //시작일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
	        if (!isValidStr(eDay)) {
	            sDate.datepicker({
	                maxDate: new Date(eDay.replace(/-/g, "/"))
	            });
	        }
	        sDate.datepicker({
	            language: 'ko',
	            autoClose: true,
	            onSelect: function () {
	                datePickerSet(sDate, eDate);
	            }
	        });

	        //종료일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
	        if (!isValidStr(sDay)) {
	            eDate.datepicker({
	                minDate: new Date(sDay.replace(/-/g, "/"))
	            });
	        }
	        eDate.datepicker({
	            language: 'ko',
	            autoClose: true,
	            onSelect: function () {
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
	            language: 'ko',
	            autoClose: true
	        });
	    }


	    function isValidStr(str) {
	        if (str == null || str == undefined || str == "")
	            return true;
	        else
	            return false;
	    }
	}
	
	function openWindowPop(url, name) {
		var options = 'top=10, left=10, width=1000, height=570, status=no, menubar=no, toolbar=no, resizable=no';
		window.open(url, name, options);
	}
	function openReviewWrite(campno){
		var options = 'top=10, left=10, width=600, height=645, status=no, menubar=no, toolbar=no, resizable=no';
		window.open('reviewwrite.do?campno='+campno, 'reviewwrite', options);
	}
	function priceLocale(price){
		return price.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	}
	function refreshPage(){
		window.location.reload();
	}
	function searchRoom(){
		
		var check_in = $("#check-in").val();
		var check_out = $("#check-out").val();
		
		var searchVal = {
				"campno":${campDto.campno},
				"check_in":check_in,
				"check_out":check_out
		}
		
		if(check_in == null || check_in =="" || check_out==null || check_out==""){
			alert("체크인, 체크아웃 날짜를 확인해주세요");
		}else{
			Number.prototype.format = function(){
			    if(this==0) return 0;
			 
			    var reg = /(^[+-]?\d+)(\d{3})/;
			    var n = (this + '');
			 
			    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
			 
			    return n;
			};
			 
			// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
			String.prototype.format = function(){
			    var num = parseFloat(this);
			    if( isNaN(num) ) return "0";
			 
			    return num.format();
			};
			$.ajax({
				type:"post",
				url:"searchRoom.do",
				data:JSON.stringify(searchVal),
				contentType:"application/json",
				success:function(result){
					var comments = "";
					
					if(result.length<1){
						comments+="<div class='empty_result col-12 d-flex align-items-center justify-content-center'>";
						comments+="검색한 날짜에 이용가능한 객실이 없습니다.";
						comments+="</div>";
					}else{
						$(result).each(function(){
							var rPrice = (this.room_price).format();
							comments +='<div class="room_info col-md-6 mt-3">';
							comments +='<div class="card mb-3" style="max-width: 540px;">';							
							comments +='<div class="row g-0">';
							comments +='	<div class="col-md-4">';
							comments +='		<img src="'+this.thumbnail+'"';
							comments +='			class="d-block w-100 h-100 rounded-start" alt="...">';
							comments +='	</div>';
							comments +='	<div class="col-md-8">';
							comments +='		<div class="card-body">';
							comments +='			<div class="room_title card-title"><a href="#" onclick="open_roomDetail('+this.roomno+')">'+this.room_name+'</a></div>';
							comments +='			<div class="room_price">￦'+rPrice+'</div>';
							comments +='			<div class="room_people">수용인원:'+this.guest_number+'</div>';
							comments +='			<button type="button" class="btn btn-warning book_btn mb-1"';
							comments +='			onclick="openWindowPop(\'reservationform.do?roomno='+this.roomno+'\', \'reservform\')">예약하기</button>';
							comments +='			</div></div></div></div></div>';
						});
					}
					$(".room_list").empty();
					$(".room_list").append(comments);
				},
				error:function(){
					alert("통신실패");
				}
			});
		}
	}
	function moveToReservation(roomno) {
		//로그인이 없거나 페널티가 있는경우 안되게
		$.ajax({
			url : "loginChk.do",
			method : "post",
			success : function(data) {
				if (data.data === true) {
					openWindowPop('reservationform.do?roomno='+roomno, 'reservform');
				} else {
					if (confirm("로그인이 필요한 작업입니다. 로그인 하시겠습니까?")) {
						location.href = 'loginform.do';
					} else {

					}
				}
			}
		})
	}
	function moveToLogin(){
		location.href = 'loginform.do';
	}
	function moveToReviewForm(campno) {
		//로그인이 없거나 페널티가 있는경우 안되게
		$.ajax({
			url : "loginChk.do",
			method : "post",
			success : function(data) {
				if (data.data === true) {
					openReviewWrite(campno);
				} else {
					if (confirm("로그인이 필요한 작업입니다. 로그인 하시겠습니까?")) {
						location.href = 'loginform.do';
					} else {

					}
				}
			}
		})
	}
	function refreshReviewlist(){
		var campno = {"campno" : ${campDto.campno}};
		$.ajax({
			
			url:"reviewlistajax.do",
			type:"post",
			data:JSON.stringify(campno),
			contentType:"application/json",
			success:function(result){
				var comments="";
				alert("성공");
				$(result).each(function(){
					console.log(typeof(this.create_date));
					comments +='<div class="review_element row">';
					comments +='<div class="review_profile col-2">';
					comments +='<img class="rounded-circle img-fluid" src="/resources/img/'+this.thumbnail+'"></div>';
					comments +='<div class="review_content_part col-10">';
					comments +='<div class="review_top d-flex justify-content-between">';
					comments +='<span class="review_title">'+this.title+'</span> <span class="review_grade"><span class="star-rating"><span style="width:'+ (this.total)*20+'%"></span></span>('+this.total+'점)</span>';
					comments +='</div>';
					comments +='<div class="review_content">'+this.content+'</div>';
					comments +='<div class="review_date d-flex justify-content-end align-items-end">';
					comments +='<span class="date">'+this.create_date+'</span></div></div></div>';
				});
				
				$("#review_ajaxList").empty();
				$("#review_ajaxList").append(comments);
			},
			error:function(){
				alert("통신실패");
			}
		});
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="main container shadow mb-5">
		<div class="camping_info row mt-3">
			<div class="col-md-6">
				<div id="carouselExampleIndicators" class="carousel slide"
					data-bs-ride="carousel">
					<c:choose>
						<c:when test="${empty imagelist}">
							<div class="carousel-indicators">
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></button>
							</div>
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="${campDto.thumbnail}" class="d-block w-100 rounded"
										alt="...">
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="carousel-indicators">
								<c:forEach items="${imagelist}" var="idto" varStatus="status">
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
								<c:forEach items="${imagelist}" var="idto" varStatus="status">
									<c:choose>
										<c:when test="${status.index eq 0 }">
											<div class="carousel-item active">
												<img src="/upload/${idto.save_file_name}"
													class="d-block w-100 rounded" alt="...">
											</div>
										</c:when>
										<c:otherwise>
											<div class="carousel-item">
												<img src="/upload/${idto.save_file_name}"
													class="d-block w-100 rounded" alt="...">
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</c:otherwise>
					</c:choose>

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
			<div class="camping_brief_info col-md-6">
				<h1 class="camping_name mb-0">${campDto.name }</h1>
				<div class="camping_addr mb-1 text-muted">${campDto.address}
					${campDto.address_detail}</div>
				<div class="camping_intro mb-0 shadow"></div>
			</div>
		</div>
		<div class="detail_content row">
			<div class="col-md-12">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="room_info-tab"
							data-bs-toggle="tab" data-bs-target="#room_info" type="button"
							role="tab" aria-controls="room_info" aria-selected="true">객실목록/예약</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="datail-tab" data-bs-toggle="tab"
							data-bs-target="#detail" type="button" role="tab"
							aria-controls="detail" aria-selected="false">상세정보</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="review-tab" data-bs-toggle="tab"
							data-bs-target="#review" type="button" role="tab"
							aria-controls="review" aria-selected="false">방문후기</button>
					</li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<!-- 객실정보/예약 -->
					<div class="tab-pane fade show active" id="room_info"
						role="tabpanel" aria-labelledby="room-tab">
						<div class="row mt-5">
							<div class="col-md-12">
								<span class="chk_date">체크인</span><span class="chk_date">체크아웃</span>
							</div>
							<div class="col-md-6">
								<div class="input-group">
									<input type="text" class="form-control" name="check-in"
										id="check-in"> <input type="text" class="form-control"
										name="check-out" id="check-out">
									<button type="button" class="btn btn-success" id="calendar_btn"
										onclick="searchRoom()">검색</button>
								</div>
							</div>
							<div class="col-md-6">

								<button class="btn btn-success" style="float: right;"
									id="chatting_btn" onclick="resizeWindow()">채팅하기</button>
							</div>
						</div>
						<div class="room_list row">
							<div class="row mt-5">
								<c:forEach items="${roomlist}" var="rdto">
									<div class="room_info col-md-6 mt-3">
										<div class="card mb-3" style="max-width: 540px;">
											<div class="row g-0">
												<div class="col-md-4">
													<img src="${rdto.thumbnail}"
														class="d-block w-100 h-100 rounded-start" alt="...">
												</div>
												<div class="col-md-8">
													<div class="card-body">
														<a href="#" onclick="open_roomDetail('${rdto.roomno}')"><div
																class="room_title card-title">${rdto.room_name}</div></a>
														<div class="room_price">￦${rdto.price_tostr()}</div>
														<div class="room_people">수용인원:${rdto.guest_number}명</div>
														<button type="button"
															class="btn btn-warning book_btn mb-1"
															onclick="moveToReservation('${rdto.roomno}')">예약하기</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>

							</div>

						</div>
					</div>

					<!--  상세정보-->
					<div class="tab-pane fade" id="detail" role="tabpanel"
						aria-labelledby="detail-tab">
						<div class="container detail_info">
							<div class="detail_sub">
								<div class="sub_title">
									<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28"
										fill="currentColor" class="bi bi-house-fill"
										viewBox="0 0 16 16">
  <path fill-rule="evenodd"
											d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
  <path fill-rule="evenodd"
											d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
</svg>
									&nbsp;캠핑장 소개
								</div>
								<div class="sub_content">${campDto.intro }</div>
							</div>
							<div class="detail_sub">
								<div class="sub_title">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										fill="currentColor" class="bi bi-bookmark-fill"
										viewBox="0 0 16 16">
  <path
											d="M2 2v13.5a.5.5 0 0 0 .74.439L8 13.069l5.26 2.87A.5.5 0 0 0 14 15.5V2a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2z" />
</svg>
									&nbsp;이용가능 서비스
								</div>
								<div class="sub_content">${campDto.service}</div>
							</div>
							<div class="detail_sub">
								<div class="sub_title">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										fill="currentColor" class="bi bi-megaphone-fill"
										viewBox="0 0 16 16">
  <path
											d="M13 2.5a1.5 1.5 0 0 1 3 0v11a1.5 1.5 0 0 1-3 0v-11zm-1 .724c-2.067.95-4.539 1.481-7 1.656v6.237a25.222 25.222 0 0 1 1.088.085c2.053.204 4.038.668 5.912 1.56V3.224zm-8 7.841V4.934c-.68.027-1.399.043-2.008.053A2.02 2.02 0 0 0 0 7v2c0 1.106.896 1.996 1.994 2.009a68.14 68.14 0 0 1 .496.008 64 64 0 0 1 1.51.048zm1.39 1.081c.285.021.569.047.85.078l.253 1.69a1 1 0 0 1-.983 1.187h-.548a1 1 0 0 1-.916-.599l-1.314-2.48a65.81 65.81 0 0 1 1.692.064c.327.017.65.037.966.06z" />
</svg>
									&nbsp;캠핑지 이용수칙
								</div>
								<div class="sub_content">${campDto.rule}</div>

							</div>
							<div class="detail_sub">
								<div class="sub_title">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										fill="currentColor" class="bi bi-telephone-fill"
										viewBox="0 0 16 16">
  <path fill-rule="evenodd"
											d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
</svg>
									&nbsp;연락처
								</div>
								<div class="sub_content">
									${campDto.phone }
								</div>
							</div>
							<div class="detail_sub">
								<div class="sub_title">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										fill="currentColor" class="bi bi-geo-alt-fill"
										viewBox="0 0 16 16">
  <path
											d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z" />
</svg>
									&nbsp;위치
								</div>
								<div class="sub_content">
									 <div id="map" style="width: 100%; height: 400px;"></div>
								</div>
							</div>
						</div>
					</div>


					<!-- 리뷰 -->
					<div class="tab-pane fade" id="review" role="tabpanel"
						aria-labelledby="review-tab">
						<div class="review_main container mt-5">
							<div class="review_statistics row">
								<div class="col-12 sub_title mb-5">총 리뷰 수 :
									${writerInfo.totalcnt}</div>
								<div class="col-md-6">
									<h5>총 평점</h5>
									<span class='star-rating'><span
										style='width:${writerInfo.total*20}%'></span></span>(${writerInfo.total}점)<br>
								</div>
								<div class="col-md-6">
									<span class="review_sub">서비스</span><span class='star-rating'><span
										style='width: ${writerInfo.service*20}%'></span></span>( ${writerInfo.service}점)<br> <span
										class="review_sub">청결도</span><span class='star-rating'><span
										style='width: ${writerInfo.cleanliness*20}%'></span></span>( ${writerInfo.cleanliness}점)<br>
									<span class="review_sub">가성비</span><span class='star-rating'><span
										style='width: ${writerInfo.cost*20}%'></span></span>( ${writerInfo.cost}점)<br> <span
										class="review_sub">위치</span><span class='star-rating'><span
										style='width: ${writerInfo.location*20}%'></span></span>( ${writerInfo.location}점)<br>
								</div>
								<div class="col-12 sub_title mt-3 mb-5">이용고객 정보</div>
								<div class="col-md-6">
									<canvas id="barChart"></canvas>
								</div>
								<div class="col-md-6">
									<canvas id="doughnutChart"></canvas>
								</div>
							</div>
							<div class="review_list">
								<div class="row sub_title mt-3">이용후기</div>
								<div class="d-flex justify-content-end mb-2">
									<button type="button" class="btn btn-success"
										onclick="moveToReviewForm(${campDto.campno})"
										style="width: 100px; float: right;" id="chatting_btn">리뷰작성</button>
								</div>
								<div id="review_ajaxList">
								<c:choose>
									<c:when test="${empty reviewlist }">
										<div class='empty_result mb-3 col-12 d-flex align-items-center justify-content-center'>
											등록된 리뷰가 아직 존재하지 않습니다.
										</div>
									</c:when>
									<c:otherwise>
										<c:forEach items="${reviewlist}" var="review">
											<div class="review_element row">
												<div class="review_profile col-2">
													<img class="rounded-circle img-fluid"
														src="/resources/img/${review.thumbnail }">
												</div>
												<div class="review_content_part col-10">
													<div class="review_top d-flex justify-content-between">
														<span class="review_title">${review.title }</span> <span><span
															class='star-rating'><span style='width: ${review.total*20}%'></span></span>(${review.total}점)</span>
													</div>
													<div class="review_content">${review.content} </div>
													<div class="review_date d-flex justify-content-end align-items-end">
														<span class="date">${review.date_tostr()}</span>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>