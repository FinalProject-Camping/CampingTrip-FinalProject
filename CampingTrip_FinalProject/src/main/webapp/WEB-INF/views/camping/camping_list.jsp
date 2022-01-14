<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑지 검색</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
	<script type="text/javascript"	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
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
	padding:10px;
}

.category_div {
	display: flex;
	padding-top: 8px;
	padding-bottom: 8px;
}

.btn_element {
	margin-right: 5px;
}
.input-group{
	width:300px;
}
.apart{
	display:flex;
	width:90%;
	justify-content: space-between;
}
.camping_price{
	font-weight:bold;
	font-size:27px;
}
.pagination{
	margin-left:45%;	
}
.camping_info{
	cursor:pointer;
}
.side-btn{
	background-color: white;
	border: solid 1px darkgray;
	border-radius: 25px;
	padding-right: 10px;
	padding-left: 10px;
	height: 40px;
}
.side-btn:hover{
	transition: all 0.3s;
	border: solid 1px #d49466;
	background-color: #d49466;
	color : white;
}
</style>

<script type="text/javascript">
	window.addEventListener('load',function() {
		
		//검색기본날짜-현재날짜
		var today = new Date();   
		
		var year = today.getFullYear(); // 년도
		var month = today.getMonth() + 1;  // 월
		var date = today.getDate();  // 날짜
		
		document.getElementById('input_calendar').value=(year + '/' + month + '/' + date);
		
		
		
		tablePagenation();
	})

	function tablePagenation(){
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
		var rowsPerPage = 10,
			rows = $('#search_camping_list .camping_element'),
			rowsCount = rows.length
			pageCount = Math.ceil(rowsCount/rowsPerPage),
			numbers = $('#numbers');
		
		/* 페이지네이션 li를 생성 반복문*/
		numbers.append('<li class="page-item"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>');
		for(var i = 0 ; i < pageCount;i++){
			numbers.append('<li class="page-item"><a class="page-link" href="">'+(i+1)+'</a></li>');
		}
		numbers.append('<li class="page-item"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&raquo;</span></a></li>');
		//#numbers li:first-child a
		numbers.find('li:nth-child(2) a').addClass('active');
		numbers.find('li:nth-child(2)').addClass('active');
		
		//페이지네이션 함수 displayRows
		function displayRows(idx){
			
			var start = (idx)*rowsPerPage;
				end = start + rowsPerPage;
				
			rows.hide();
			numbers.removeClass('active');
			//해당하는 부분만 보여줌
			//numbers.find('li:nth-child('+idx+')').addClass('active');
			rows.slice(start,end).show();
		}
		
		displayRows(0);
		//페이지네이션 클릭시 보여주기
		/*
			클릭한 그 a 태그의 active,
			그 요소의 숫자를 dislplayRows의 매개변수로 지정
		*/
		numbers.find('li').click(function(e){
			//a태그의 이벤트를 막음
			e.preventDefault();
			
			numbers.find('li a').removeClass('active');
			$(this).find('a').addClass('active');
			var index = $(this).index();
			displayRows(index-1);
		});
	}
	function moveToCampwrite(){
		
			//로그인이 없거나 페널티가 있는경우 안되게
			$.ajax({
				url:"loginChk.do",
				method: "post",
				success:function(data){ 
					if(data.data === true){
						
						location.href='insertform_camp.do';

					}else{
						if(confirm("로그인이 필요한 작업입니다. 로그인 하시겠습니까?")){
						location.href='loginform.do';
						}else{
							
						}
					}
				}
			})
		
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<br><br><br>
	<div class="container"><div id="search_condition">
		<form action="" method="">
			<div class="category_div">
				<span class="search_category">캠핑구분</span>
				<div class="btn_element">
					<input class="btn-check" type="checkbox" id="camping_category1"
						value="option1"> <label class="btn btn-outline-success"
						for="camping_category1">오토캠핑</label>
				</div>
				<div class="btn_element">
					<input class="btn-check" type="checkbox" id="camping_category2"
						value="option2"> <label class="btn btn-outline-success"
						for="camping_category2">글램핑</label>
				</div>
				<div class="btn_element">
					<input class="btn-check" type="checkbox" id="camping_category3"
						value="option3"> <label class="btn btn-outline-success"
						for="camping_category3">카라반</label>
				</div>
				<div class="btn_element">
					<input class="btn-check" type="checkbox" id="camping_category4"
						value="option4"> <label class="btn btn-outline-success"
						for="camping_category4">펜션</label>
				</div>
			</div>

			<div class="category_div">
				<span class="search_category">지역</span>
				<div class="col-auto">
					<select class="form-select col-sm-8"
						aria-label="Default select example">
						<option selected>캠핑지역 선택</option>
						<option value="1">서울특별시</option>
						<option value="2">경기도</option>
						<option value="3">강원도</option>
					</select>
				</div>
			</div>

			<div class="category_div">
				<span class="search_category">정렬</span>
				<div class="btn_element">
					<input class="btn-check" name="sort" type="radio"
						id="sort_category1" value="option1"> <label
						class="btn btn-outline-success" for="sort_category1">가격순</label>
				</div>
				<div class="btn_element">
					<input class="btn-check" name="sort" type="radio"
						id="sort_category2" value="option2"> <label
						class="btn btn-outline-success" for="sort_category2">리뷰순</label>
				</div>
				<div class="btn_element">
					<input class="btn-check" name="sort" type="radio"
						id="sort_category3" value="option3"> <label
						class="btn btn-outline-success" for="sort_category3">조회순</label>
				</div>
			</div>


			<div class="category_div">
				<span class="search_category">가격</span>
				<div class="btn_element">
					<input class="btn-check" type="checkbox" id="price_category1"
						value="option1"> <label class="btn btn-outline-success"
						for="price_category1"> ~ ₩100,000</label>
				</div>
				<div class="btn_element">
					<input class="btn-check" type="checkbox" id="price_category2"
						value="option2"> <label class="btn btn-outline-success"
						for="price_category2">₩100,000 ~ ₩200,000</label>
				</div>
				<div class="btn_element">
					<input class="btn-check" type="checkbox" id="price_category3"
						value="option3"> <label class="btn btn-outline-success"
						for="price_category3">₩200,000 ~ ₩300,000</label>
				</div>
				<div class="btn_element">
					<input class="btn-check" type="checkbox" id="price_category4"
						value="option4"> <label class="btn btn-outline-success"
						for="price_category4">₩300,000 ~ </label>
				</div>
			</div>

			<div class="category_div">
				<span class="search_category">일정선택</span>
				<div class="apart">
				<div class="input-group">
					<input type="text" class="form-control" name="date" id="input_calendar">
					<button class="btn btn-success" id="calendar_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar3" viewBox="0 0 16 16">
  						<path d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z"></path>
  						<path d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"></path>
					</svg></button>
				</div>
				<div class="input-group">
					<input type="text" class="form-control" name="keyword" id="search_keyword">
					<button class="btn btn-success" id="calendar_btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  					<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
					</svg></button>
				</div>
				</div>
			</div>
		</form>
	</div>
	<div class="row mt-3 mb-3">
		<div class="col-md-12 d-flex justify-content-end">
			<button type="button" class="side-btn" onclick="moveToCampwrite()">캠핑지 등록</button>
		</div>
	</div>
	<div id="search_camping_list" class="container">
		<c:forEach var="campDto" items="${camplist}">
		<div class="camping_element row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        	<div class="camping_pic col-auto d-none d-lg-block">
          		<img class="bd-placeholder-img" width="350" height="250" src="${campDto.thumbnail }">
			</div>
        	<div class="camping_info col p-4 d-flex flex-column position-static" onclick="location.href='campdetail.do?campno=${campDto.campno}'">
          		<h3 class="camping_name mb-0">${campDto.name}</h3>
          		<div class="camping_addr mb-1 text-muted">${campDto.address}</div>
          		<br><br>
          		<span class="camping_price">￦${campDto.lowestprice_tostr()}</span>
        	</div>
      	</div>
      	</c:forEach>
      	
      	<div id="pagination_div">
			<ul class="pagination" id="numbers"></ul>
		</div>
	</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>