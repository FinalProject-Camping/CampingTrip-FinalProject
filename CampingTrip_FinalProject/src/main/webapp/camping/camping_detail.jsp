<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑지 상세페이지</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=52cf2e3096a1ac308c542aa15c92feed"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<style type="text/css">
.main, .detail_content {
	margin-top: 100px;
}

.main {
	border: 1px solid gray;
	border-radius: 1em;
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
	min-height: 350px;
}

.detail_sub {
	margin-top: 25px;
}

.book_btn {
	float: right;
}

.sub_title {
	font-weight: bold;
	font-size: 24px;
	display: flex;
	align-items: center;
}

.sub_content {
	margin-top: 10px;
	padding-left: 32px;
}

.nav-link {
	font-weight: bold;
	color: black;
	font-size: 20px;
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

.review_sub {
	display: inline-block;
	width: 70px;
	font-size: 16px;
	font-weight: bold;
}
.review_element{
	padding-top:10px;
	padding-bottom:10px;
	border:1px solid gray;
	border-radius:1em;
	margin-bottom: 30px;
}
.review_profile>img{

	min-height:100px;
}
.review_title{
	font-size:16px;
	font-weight:bold;
}
.date{
	color:gray;
}


</style>
<script type="text/javascript">
	window.onload = function() {

		//검색기본날짜-현재날짜
		var today = new Date();

		var year = today.getFullYear(); // 년도
		var month = today.getMonth() + 1; // 월
		var date = today.getDate(); // 날짜

		document.getElementById('input_calendar').value = (year + '/' + month
				+ '/' + date);
		
		
		//지도 띄우기
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); 
		
		var coords = new kakao.maps.LatLng(33.450701, 126.570667);
		//마커로 표시
		var marker = new kakao.maps.Marker({
			map : map,
			position : coords
		});
		
		making_barChart();
		making_doughnutChart();
	}
	
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
				data: [10, 5, 45, 30, 10] }] 
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
				data: [40,60] }] 
		}, 
		// Configuration options go here 
		options:{
			legend:{
				reverse:true
			}
		} 
		
		});

	}
</script>
</head>
<body>
	<div class="main container">
		<div class="camping_info row mt-3">
			<div class="col-md-6">
				<div id="carouselExampleIndicators" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="/resources/img/camping01.jpg"
								class="d-block w-100 rounded" alt="...">
						</div>
						<div class="carousel-item">
							<img src="/resources/img/camping02.jpg"
								class="d-block w-100 rounded" alt="...">
						</div>
						<div class="carousel-item">
							<img src="/resources/img/camping03.jpg"
								class="d-block w-100 rounded" alt="...">
						</div>
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
			<div class="camping_brief_info col-md-6">
				<h1 class="camping_name mb-0">캠핑명</h1>
				<div class="camping_addr mb-1 text-muted">서울특별시 캠핑구 캠핑동 12-12</div>
				<div class="camping_intro mb-0">킴팽지 소개</div>
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
							<div class="col-md-6">
								<div class="input-group">
									<input type="text" class="form-control" name="date"
										id="input_calendar">
									<button class="btn btn-success" id="calendar_btn">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-calendar3"
											viewBox="0 0 16 16">
  						<path
												d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z"></path>
  						<path
												d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"></path>
					</svg>
									</button>
								</div>
							</div>
							<div class="col-md-6">

								<button class="btn btn-success" style="float: right;"
									id="chatting_btn">채팅하기</button>
							</div>
						</div>
						<div class="room_list row">
							<div class="row mt-5">

								<div class="room_info col-md-6 mt-3">
									<div class="card mb-3" style="max-width: 540px;">
										<div class="row g-0">
											<div class="col-md-4">
												<img src="/resources/img/camping01.jpg"
													class="d-block w-100 h-100 rounded-start" alt="...">
											</div>
											<div class="col-md-8">
												<div class="card-body">
													<h3 class="room_title card-title">객실명</h3>
													<h4 class="room_price">200,000</h4>
													<h4 class="room_guest">2~5</h4>
													<button type="button" class="btn btn-warning book_btn mb-1">예약하기</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="room_info col-md-6 mt-3">
									<div class="card mb-3" style="max-width: 540px;">
										<div class="row g-0">
											<div class="col-md-4">
												<img src="/resources/img/camping01.jpg"
													class="d-block w-100 h-100 rounded-start" alt="...">
											</div>
											<div class="col-md-8">
												<div class="card-body">
													<h3 class="room_title card-title">객실명</h3>
													<h4 class="room_price">200,000</h4>
													<h4 class="room_guest">2~5</h4>
													<button type="button" class="btn btn-warning book_btn mb-1">예약하기</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row mt-5">

								<div class="room_info col-md-6 mt-3">
									<div class="card mb-3" style="max-width: 540px;">
										<div class="row g-0">
											<div class="col-md-4">
												<img src="/resources/img/camping01.jpg"
													class="d-block w-100 h-100 rounded-start" alt="...">
											</div>
											<div class="col-md-8">
												<div class="card-body">
													<h3 class="room_title card-title">객실명</h3>
													<h4 class="room_price">200,000</h4>
													<h4 class="room_guest">2~5</h4>
													<button type="button" class="btn btn-warning book_btn mb-1">예약하기</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="room_info col-md-6 mt-3">
									<div class="card mb-3" style="max-width: 540px;">
										<div class="row g-0">
											<div class="col-md-4">
												<img src="/resources/img/camping01.jpg"
													class="d-block w-100 h-100 rounded-start" alt="...">
											</div>
											<div class="col-md-8">
												<div class="card-body">
													<h3 class="room_title card-title">객실명</h3>
													<h4 class="room_price">200,000</h4>
													<h4 class="room_guest">2~5</h4>
													<button type="button" class="btn btn-warning book_btn mb-1">예약하기</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row mt-5">

								<div class="room_info col-md-6 mt-3">
									<div class="card mb-3" style="max-width: 540px;">
										<div class="row g-0">
											<div class="col-md-4">
												<img src="/resources/img/camping01.jpg"
													class="d-block w-100 h-100 rounded-start" alt="...">
											</div>
											<div class="col-md-8">
												<div class="card-body">
													<h3 class="room_title card-title">객실명</h3>
													<h4 class="room_price">200,000</h4>
													<h4 class="room_guest">2~5</h4>
													<button type="button" class="btn btn-warning book_btn mb-1">예약하기</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="room_info col-md-6 mt-3">
									<div class="card mb-3" style="max-width: 540px;">
										<div class="row g-0">
											<div class="col-md-4">
												<img src="/resources/img/camping01.jpg"
													class="d-block w-100 h-100 rounded-start" alt="...">
											</div>
											<div class="col-md-8">
												<div class="card-body">
													<h3 class="room_title card-title">객실명</h3>
													<h4 class="room_price">200,000</h4>
													<h4 class="room_guest">2~5</h4>
													<button type="button" class="btn btn-warning book_btn mb-1">예약하기</button>
												</div>
											</div>
										</div>
									</div>
								</div>
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
								<div class="sub_content">- 반드시 목줄과 밥그릇, 물그릇을 챙겨주세요. - 글램핑
									및 카라반 이용고객일 경우 배변패드나 기저귀 필히 챙겨주세요! - 반려동물은 학교건물이나 수영장에 출입이
									불가합니다. - 반려동물용 켄넬 또는 집을 가져오셔서 사용하셔야합니다. - 글램핑 및 카라반이 반려동물로 인해
									오염되거나 훼손될시 비용이 청구됩니다. - 무엇보다 다른캠퍼님들에게 피해가 없도록 주의 부탁드립니다.</div>
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
								<div class="sub_content">- 반드시 목줄과 밥그릇, 물그릇을 챙겨주세요. - 글램핑
									및 카라반 이용고객일 경우 배변패드나 기저귀 필히 챙겨주세요! - 반려동물은 학교건물이나 수영장에 출입이
									불가합니다. - 반려동물용 켄넬 또는 집을 가져오셔서 사용하셔야합니다. - 글램핑 및 카라반이 반려동물로 인해
									오염되거나 훼손될시 비용이 청구됩니다. - 무엇보다 다른캠퍼님들에게 피해가 없도록 주의 부탁드립니다.</div>
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
								<div class="sub_content">- 반드시 목줄과 밥그릇, 물그릇을 챙겨주세요. - 글램핑
									및 카라반 이용고객일 경우 배변패드나 기저귀 필히 챙겨주세요! - 반려동물은 학교건물이나 수영장에 출입이
									불가합니다. - 반려동물용 켄넬 또는 집을 가져오셔서 사용하셔야합니다. - 글램핑 및 카라반이 반려동물로 인해
									오염되거나 훼손될시 비용이 청구됩니다. - 무엇보다 다른캠퍼님들에게 피해가 없도록 주의 부탁드립니다.</div>

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
								<div class="sub_content">- 반드시 목줄과 밥그릇, 물그릇을 챙겨주세요. - 글램핑
									및 카라반 이용고객일 경우 배변패드나 기저귀 필히 챙겨주세요! - 반려동물은 학교건물이나 수영장에 출입이
									불가합니다. - 반려동물용 켄넬 또는 집을 가져오셔서 사용하셔야합니다. - 글램핑 및 카라반이 반려동물로 인해
									오염되거나 훼손될시 비용이 청구됩니다. - 무엇보다 다른캠퍼님들에게 피해가 없도록 주의 부탁드립니다.</div>
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
								<div class="col-12 sub_title mb-5">총 리뷰 수 : review_total</div>
								<div class="col-md-6">
									<h5>총 평점</h5>
									<span class='star-rating'><span style='width: 78%'></span></span>(3.9점)</span><br>
								</div>
								<div class="col-md-6">
									<span class="review_sub">서비스</span><span class='star-rating'><span
										style='width: 55%'></span></span>( 점)<br> <span
										class="review_sub">청결도</span><span class='star-rating'><span
										style='width: 80%'></span></span>( 점)<br> <span
										class="review_sub">가성비</span><span class='star-rating'><span
										style='width: 95%'></span></span>( 점)<br> <span
										class="review_sub">위치</span><span class='star-rating'><span
										style='width: 75%'></span></span>( 점)<br>
								</div>
								<div class="col-12 sub_title mt-3 mb-5">이용고객 정보</div>
								<div class="col-md-6"><canvas id="barChart"></canvas></div>
								<div class="col-md-6"><canvas id="doughnutChart"></canvas></div>
							</div>
							<div class="review_list">
								<div class="row sub_title mt-3">이용후기</div>
								<div class="d-flex justify-content-end mb-2">
								<button class="btn btn-success" style="width:100px; float: right;"
									id="chatting_btn">리뷰작성</button>
								</div>
								<div class="review_element row">
									<div class="review_profile col-2">
										<img class="rounded-circle img-fluid" src="/resources/img/profile.png">
									</div>
									<div class="review_content_part col-10">
										<div class="review_top d-flex justify-content-between">
											<span class="review_title">리뷰제목</span>
											<span><span class='star-rating'><span	style='width: 75%'></span></span>(점)</span>
										</div>
										<div class="review_content">
											이용객들 후기보고 선택한 곳이였는데 역시 친절하신 사장님덕에 편히 쉬다왔습니다. 공용으로 운영하는 화장실과 개수대는 처음이라 좀 걱정스러웠는데 너무 깔끔하게 운영하셔서 좋은 이미지 안고 돌아왔습니다
										</div>
										<div class="review_date d-flex justify-content-end">
											<span class="date">2021-12-15</span>
										</div>
									</div>
								</div>
								<div class="review_element row">
									<div class="review_profile col-2">
										<img class="rounded-circle img-fluid" src="/resources/img/profile.png">
									</div>
									<div class="review_content_part col-10">
										<div class="review_top d-flex justify-content-between">
											<span class="review_title">리뷰제목</span>
											<span><span class='star-rating'><span	style='width: 75%'></span></span>(점)</span>
										</div>
										<div class="review_content">
											이용객들 후기보고 선택한 곳이였는데 역시 친절하신 사장님덕에 편히 쉬다왔습니다. 공용으로 운영하는 화장실과 개수대는 처음이라 좀 걱정스러웠는데 너무 깔끔하게 운영하셔서 좋은 이미지 안고 돌아왔습니다
										</div>
										<div class="review_date d-flex justify-content-end">
											<span class="date">2021-12-15</span>
										</div>
									</div>
								</div>
								<div class="review_element row">
									<div class="review_profile col-2">
										<img class="rounded-circle img-fluid" src="/resources/img/profile.png">
									</div>
									<div class="review_content_part col-10">
										<div class="review_top d-flex justify-content-between">
											<span class="review_title">리뷰제목</span>
											<span><span class='star-rating'><span	style='width: 75%'></span></span>(점)</span>
										</div>
										<div class="review_content">
											이용객들 후기보고 선택한 곳이였는데 역시 친절하신 사장님덕에 편히 쉬다왔습니다. 공용으로 운영하는 화장실과 개수대는 처음이라 좀 걱정스러웠는데 너무 깔끔하게 운영하셔서 좋은 이미지 안고 돌아왔습니다
										</div>
										<div class="review_date d-flex justify-content-end">
											<span class="date">2021-12-15</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>