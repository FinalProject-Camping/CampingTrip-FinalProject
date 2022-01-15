<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑지 검색</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
.search_category {
	display: inline-block;
	width: 100px;
	font-weight: bold;
	line-height: 38px;
}

.row {
	padding-top: 5px;
}

#search_condition {
	background-color: #f3f3df;
	border-radius: 1em;
	padding: 10px;
}

.category_div {
	display: flex;
	padding-top: 8px;
	padding-bottom: 8px;
}

.btn_element {
	margin-right: 5px;
}

.input-group {
	width: 300px;
}

.apart {
	display: flex;
	width: 90%;
	justify-content: space-between;
}

.camping_price {
	font-weight: bold;
	font-size: 27px;
}

.pagination {
	margin-left: 45%;
}

.camping_info {
	cursor: pointer;
}

.side-btn {
	background-color: white;
	border: solid 1px darkgray;
	border-radius: 25px;
	padding-right: 10px;
	padding-left: 10px;
	height: 40px;
}

.side-btn:hover {
	transition: all 0.3s;
	border: solid 1px #d49466;
	background-color: #d49466;
	color: white;
}

.slider-labels {
	margin-top: 10px;
}

.middle {
	position: relative;
	width: 50%;
	max-width: 500px;
}

.slider {
	position: relative;
	z-index: 1;
	height: 10px;
	margin: 0 15px;
}

.slider>.track {
	position: absolute;
	z-index: 1;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	border-radius: 5px;
	background-color: #c6aee7;
}

.slider>.range {
	position: absolute;
	z-index: 2;
	left: 0%;
	right: 25%;
	top: 0;
	bottom: 0;
	border-radius: 5px;
	background-color: #6200ee;
}

.slider>.thumb {
	position: absolute;
	z-index: 3;
	width: 30px;
	height: 30px;
	background-color: #6200ee;
	border-radius: 50%;
}

.slider>.thumb.left {
	left: 0%;
	transform: translate(-15px, -10px);
}

.slider>.thumb.right {
	right: 25%;
	transform: translate(15px, -10px);
}

input[type="range"] {
	position: absolute; /* opacity로 가린 것을 이벤트도 비활성화하기 위해 */
	pointer-events: none;
	-webkit-appearance: none;
	z-index: 2;
	height: 10px;
	width: 100%;
	opacity: 0;
}

input[type="range"]::-webkit-slider-thumb { /* 겹쳐진 두 thumb를 모두 활성화 */
	pointer-events: all;
	width: 30px;
	height: 30px;
	border-radius: 0;
	border: 0 none;
	background-color: red;
	cursor: pointer; /* appearance를 해야 위의 스타일들을 볼 수 있음 */
	-webkit-appearance: none;
}
#input-right-value{
	float:right;
}
#input-left-value{
	float:left;
}
.span_aligns{
	margin-top:10px;
	font-weight:bold;
}
.empty_result{
	height:160px;
	font-size:16px;
	font-weight:bold;
	border: 1px solid gray;
	border-radius:1em;
	margin:0px;
}
.camping_tags{
	height:48px;
}
.camping_header{
	display:flex;
	justify-content: space-between;
}
.camping_name{
	font-family:'EliceDigitalBaeum_Bold';
	font-size:30px;
}
.camping_view{
	font-size:14px;
	color:gray;
}
.tag_style{
	border: 1px solid gray;
	border-radius:2em;
	padding:3px;
	color:gray;
	margin-right:3px;
}
</style>

<script type="text/javascript">
	window.addEventListener(
					'load',
					function() {

						//시,군 데이터 넣기
						var area0 = [ "시/도 선택", "서울특별시", "인천광역시", "대전광역시",
								"광주광역시", "대구광역시", "울산광역시", "부산광역시", "경기도",
								"강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도",
								"경상남도", "제주도" ];
						var area1 = [ "강남구", "강동구", "강북구", "강서구", "관악구", "광진구",
								"구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구",
								"마포구", "서대문구", "서초구", "성동구", "성북구", "송파구",
								"양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" ];
						var area2 = [ "계양구", "남구", "남동구", "동구", "부평구", "서구",
								"연수구", "중구", "강화군", "옹진군" ];
						var area3 = [ "대덕구", "동구", "서구", "유성구", "중구" ];
						var area4 = [ "광산구", "남구", "동구", "북구", "서구" ];
						var area5 = [ "남구", "달서구", "동구", "북구", "서구", "수성구",
								"중구", "달성군" ];
						var area6 = [ "남구", "동구", "북구", "중구", "울주군" ];
						var area7 = [ "강서구", "금정구", "남구", "동구", "동래구", "부산진구",
								"북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구",
								"중구", "해운대구", "기장군" ];
						var area8 = [ "고양시", "과천시", "광명시", "광주시", "구리시", "군포시",
								"김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시",
								"시흥시", "안산시", "안성시", "안양시", "양주시", "오산시",
								"용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시",
								"포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군" ];
						var area9 = [ "강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시",
								"태백시", "고성군", "양구군", "양양군", "영월군", "인제군",
								"정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군" ];
						var area10 = [ "제천시", "청주시", "충주시", "괴산군", "단양군",
								"보은군", "영동군", "옥천군", "음성군", "증평군", "진천군", "청원군" ];
						var area11 = [ "계룡시", "공주시", "논산시", "보령시", "서산시",
								"아산시", "천안시", "금산군", "당진군", "부여군", "서천군",
								"연기군", "예산군", "청양군", "태안군", "홍성군" ];
						var area12 = [ "군산시", "김제시", "남원시", "익산시", "전주시",
								"정읍시", "고창군", "무주군", "부안군", "순창군", "완주군",
								"임실군", "장수군", "진안군" ];
						var area13 = [ "광양시", "나주시", "목포시", "순천시", "여수시",
								"강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군",
								"보성군", "신안군", "영광군", "영암군", "완도군", "장성군",
								"장흥군", "진도군", "함평군", "해남군", "화순군" ];
						var area14 = [ "경산시", "경주시", "구미시", "김천시", "문경시",
								"상주시", "안동시", "영주시", "영천시", "포항시", "고령군",
								"군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군",
								"울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군" ];
						var area15 = [ "거제시", "김해시", "마산시", "밀양시", "사천시",
								"양산시", "진주시", "진해시", "창원시", "통영시", "거창군",
								"고성군", "남해군", "산청군", "의령군", "창녕군", "하동군",
								"함안군", "함양군", "합천군" ];
						var area16 = [ "서귀포시", "제주시", "남제주군", "북제주군" ];

						//시 선택박스 초기화
						$("select[name^=sido]")
								.each(
										function() {
											$selsido = $(this);
											$
													.each(
															eval(area0),
															function() {
																$selsido
																		.append("<option value='"+this+"'>"
																				+ this
																				+ "</option>");
															});
											$selsido
													.next()
													.append(
															"<option value=''>구/군 선택</option>");
										});

						//시 선택시 구,군 설정
						$("select[name^=sido]")
								.change(
										function() {
											var area = "area"
													+ $("option", $(this))
															.index(
																	$(
																			"option:selected",
																			$(this))); // 선택지역의 구군 Array
											var $gugun = $(this).next(); // 선택영역 군구 객체
											$("option", $gugun).remove(); // 구군 초기화

											if (area == "area0")
												$gugun
														.append("<option value=''>구/군 선택</option>");
											else {
												$
														.each(
																eval(area),
																function() {
																	$gugun
																			.append("<option value='"+this+"'>"
																					+ this
																					+ "</option>");
																});
											}
										});

						tablePagenation();
						
						Number.prototype.format = function(){
						    if(this==0) return 0;
						 
						    var reg = /(^[+-]?\d+)(\d{3})/;
						    var n = (this + '');
						 
						    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
						 
						    return n;
						};	
										
						const inputLeft = document.getElementById("input-left"); 
						const inputRight = document.getElementById("input-right"); 
						const thumbLeft = document.querySelector(".slider > .thumb.left"); 
						const thumbRight = document.querySelector(".slider > .thumb.right"); 
						const range = document.querySelector(".slider > .range"); 
						
						
						var searchInfo ;
						<c:choose>
							<c:when test="${empty searchInfo}">
							</c:when>
							<c:otherwise>
								<c:if test="${!empty searchInfo.camp_type}">
								const str="${searchInfo.camp_type}";
								const arr= str.split(",");
								for(var i = 0 ; i<arr.length;i++){
									$('input:checkbox[name="camp_type"]').each(function() {
									     if(this.value == arr[i]){ //값 비교
									            this.checked = true; //checked 처리
									      }
									 });	
								}
								
								</c:if>
								
								<c:if test="${!empty searchInfo.sort}">
								$('input:radio[name="sort"]').each(function() {
								     if(this.value == "${searchInfo.sort}"){ //값 비교
								            this.checked = true; //checked 처리
								      }
								 });
								</c:if>
								<c:if test="${!empty searchInfo.low_price}">
									$("input[name=low_price]").val("${searchInfo.low_price}");
									$("#input-left-value").text('￦'+Math.min(parseInt(inputLeft.value), parseInt(inputRight.value) - 1).format());
									thumbLeft.style.left=((inputLeft.value/1000000)*100)+"%";
									range.style.left=((inputLeft.value/1000000)*100)+"%";
								</c:if>
								<c:if test="${!empty searchInfo.high_price}">
									$("input[name=high_price]").val("${searchInfo.high_price}");
									$("#input-right-value").text('￦'+Math.min(parseInt(inputRight.value), parseInt(inputRight.value) - 1).format());
									thumbRight.style.right=(100-(inputRight.value/1000000)*100)+"%";
									range.style.right=(100-(inputRight.value/1000000)*100)+"%";
								</c:if>
								<c:if test="${!empty searchInfo.keyword}">
									$("input[name=keyword]").val("${searchInfo.keyword}");
								</c:if>
							</c:otherwise>
						</c:choose>
					})

	function tablePagenation() {
		/*
		변수 생성
		- rowsPerPage페이지당 보여줄 개수 20
		- rows 가로행 tr 
		- rowsCount 개수 100
		- pageCount 페이지네이션 개수 = 100/20
		- pagenumbers
		콘솔에서 pageCount 찍어보고
		 */
		$("#numbers").empty();
		var rowsPerPage = 10, rows = $('#search_camping_list .camping_element'), rowsCount = rows.length
		pageCount = Math.ceil(rowsCount / rowsPerPage), numbers = $('#numbers');

		/* 페이지네이션 li를 생성 반복문*/
		numbers
				.append('<li class="page-item"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>');
		for (var i = 0; i < pageCount; i++) {
			numbers
					.append('<li class="page-item"><a class="page-link" href="">'
							+ (i + 1) + '</a></li>');
		}
		numbers
				.append('<li class="page-item"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&raquo;</span></a></li>');
		//#numbers li:first-child a
		numbers.find('li:nth-child(2) a').addClass('active');
		numbers.find('li:nth-child(2)').addClass('active');

		//페이지네이션 함수 displayRows
		function displayRows(idx) {

			var start = (idx) * rowsPerPage;
			end = start + rowsPerPage;

			rows.hide();
			numbers.removeClass('active');
			//해당하는 부분만 보여줌
			//numbers.find('li:nth-child('+idx+')').addClass('active');
			rows.slice(start, end).show();
		}

		displayRows(0);
		//페이지네이션 클릭시 보여주기
		/*
			클릭한 그 a 태그의 active,
			그 요소의 숫자를 dislplayRows의 매개변수로 지정
		 */
		numbers.find('li').click(function(e) {
			//a태그의 이벤트를 막음
			e.preventDefault();

			numbers.find('li a').removeClass('active');
			$(this).find('a').addClass('active');
			var index = $(this).index();
			displayRows(index - 1);
		});
	}
	function moveToCampwrite() {

		//로그인이 없거나 페널티가 있는경우 안되게
		$.ajax({
			url : "loginChk.do",
			method : "post",
			success : function(data) {
				if (data.data === true) {

					location.href = 'insertform_camp.do';

				} else {
					if (confirm("로그인이 필요한 작업입니다. 로그인 하시겠습니까?")) {
						location.href = 'loginform.do';
					} else {

					}
				}
			}
		})

	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<br>
	<br>
	<br>
	<div class="container">
		<div id="search_condition">
			<form action="searchCamp.do" method="post">
				<div class="category_div">
					<span class="search_category">캠핑구분</span>
					<div class="btn_element">
						<input class="btn-check" name="camp_type" type="checkbox"
							id="camping_category1" value="autocamping"> <label
							class="btn btn-outline-success" for="camping_category1">오토캠핑</label>
					</div>
					<div class="btn_element">
						<input class="btn-check" name="camp_type" type="checkbox"
							id="camping_category2" value="glamping"> <label
							class="btn btn-outline-success" for="camping_category2">글램핑</label>
					</div>
					<div class="btn_element">
						<input class="btn-check" name="camp_type" type="checkbox"
							id="camping_category3" value="caravan"> <label
							class="btn btn-outline-success" for="camping_category3">카라반</label>
					</div>
					<div class="btn_element">
						<input class="btn-check" name="camp_type" type="checkbox"
							id="camping_category4" value="pension"> <label
							class="btn btn-outline-success" for="camping_category4">펜션</label>
					</div>
				</div>

				<div class="category_div row">
					<span class="search_category">지역</span>
					<div class="col-auto d-flex">
						<select name="sido1" id="sido1" class="form-select col-sm-4"></select><select
							name="address" id="address" class="form-select col-sm-4"></select>
					</div>
				</div>

				<div class="category_div">
					<span class="search_category">정렬</span>
					<div class="btn_element">
						<input class="btn-check" name="sort" type="radio"
							id="sort_category1" value="lowest_price"> <label
							class="btn btn-outline-success" for="sort_category1">가격순</label>
					</div>
					<div class="btn_element">
						<input class="btn-check" name="sort" type="radio"
							id="sort_category2" value="total_grade"> <label
							class="btn btn-outline-success" for="sort_category2">리뷰순</label>
					</div>
					<div class="btn_element">
						<input class="btn-check" name="sort" type="radio"
							id="sort_category3" value="view_count"> <label
							class="btn btn-outline-success" for="sort_category3">조회순</label>
					</div>
				</div>


				<div class="category_div">
					<span class="search_category">가격</span>
					<div class="middle">
						<div class="multi-range-slider">
							<!-- 진짜 슬라이더 -->
							<input type="range" name="low_price" id="input-left" min="0"
								max="1000000" value="0" /> <input type="range" name="high_price"
								id="input-right" min="0" max="1000000" value="750000" />
							<!-- 커스텀 슬라이더 -->
							<div class="slider">
								<div class="track"></div>
								<div class="range"></div>
								<div class="thumb left"></div>
								<div class="thumb right"></div>
							</div>
						</div>
						<span class="span_aligns" id="input-left-value">￦0</span> <span class="span_aligns" id="input-right-value">￦750,000</span>
					</div>

	<script>
	Number.prototype.format = function(){
	    if(this==0) return 0;
	 
	    var reg = /(^[+-]?\d+)(\d{3})/;
	    var n = (this + '');
	 
	    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
	 
	    return n;
	};	
					
	const inputLeft = document.getElementById("input-left"); 
	const inputRight = document.getElementById("input-right"); 
	const thumbLeft = document.querySelector(".slider > .thumb.left"); 
	const thumbRight = document.querySelector(".slider > .thumb.right"); 
	const range = document.querySelector(".slider > .range"); 
	const setLeftValue = () => { 
		const _this = inputLeft;
		const [min, max] = [parseInt(_this.min), parseInt(_this.max)]; 
		// 교차되지 않게, 1을 빼준 건 완전히 겹치기보다는 어느 정도 간격을 남겨두기 위해. 
		_this.value = Math.min(parseInt(_this.value), parseInt(inputRight.value) - 1); 
		$("#input-left-value").text('￦'+Math.min(parseInt(_this.value), parseInt(inputRight.value) - 1).format());
		// input, thumb 같이 움직이도록 
		const percent = ((_this.value - min) / (max - min)) * 100; 
		thumbLeft.style.left = percent + "%"; 
		range.style.left = percent + "%"; 
	}; 
	const setRightValue = () => { 
		const _this = inputRight; 
		const [min, max] = [parseInt(_this.min), parseInt(_this.max)]; 
		// 교차되지 않게, 1을 더해준 건 완전히 겹치기보다는 어느 정도 간격을 남겨두기 위해. 
		_this.value = Math.max(parseInt(_this.value), parseInt(inputLeft.value) + 1);
		$("#input-right-value").text('￦'+Math.min(parseInt(_this.value), parseInt(inputRight.value) - 1).format());
		// input, thumb 같이 움직이도록 
		const percent = ((_this.value - min) / (max - min)) * 100; 
		thumbRight.style.right = 100 - percent + "%";
		range.style.right = 100 - percent + "%"; 
	}; 
	
	inputLeft.addEventListener("input", setLeftValue); 
	inputRight.addEventListener("input", setRightValue);

	</script>
				</div>


				<div class="category_div">
					<span class="search_category">키워드</span>
					
						
						<div class="input-group">
							<input type="text" class="form-control" name="keyword"
								id="search_keyword">
							<button type="submit" class="btn btn-success" id="calendar_btn">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  					<path
										d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
					</svg>
							</button>
						</div>
					
				</div>
			</form>
		</div>
		<div class="row mt-3 mb-3">
			<div class="col-md-12 d-flex justify-content-end">
				<button type="button" class="side-btn" onclick="moveToCampwrite()">캠핑지
					등록</button>
			</div>
		</div>
		<div id="search_camping_list" class="container">
			<c:choose>
			<c:when test="${empty camplist }">
				<div class='empty_result col-12 d-flex align-items-center justify-content-center'>
						검색한 조건에 해당하는 캠핑지가 존재하지 않습니다.
				</div>
			</c:when>
			<c:otherwise>
			<c:forEach var="campDto" items="${camplist}">
				<div
					class="camping_element row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					<div class="camping_pic col-auto d-none d-lg-block">
						<img class="bd-placeholder-img" width="350" height="250"
							src="${campDto.thumbnail }">
					</div>
					<div
						class="camping_info col p-4 d-flex flex-column position-static"
						onclick="location.href='campdetail.do?campno=${campDto.campno}'">
						<div class="camping_header">
						<div class="camping_name mb-0">${campDto.name}</div>
						<div class="camping_view">조회수 ${campDto.view_count}</div>
						</div>						
						<div class="camping_addr mb-1 text-muted">${campDto.address}</div>
						<div class="camping_tags" id="camp${campDto.campno}">
						<c:if test="${!empty campDto.tags }">
							<script>
								var tags = "${campDto.tags}";
								var tagarr= tags.split(",");
								for(var i = 1 ; i <tagarr.length;i++){
									$("#camp${campDto.campno}").append("<span class='tag_style'>"+tagarr[i]+"</span>");
								}
							</script>
						</c:if>
						</div> 
						
						<span class="camping_price">￦${campDto.lowestprice_tostr()}</span>
					</div>
				</div>
			</c:forEach>
			</c:otherwise>
			</c:choose>
			<div id="pagination_div">
				<ul class="pagination" id="numbers"></ul>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>