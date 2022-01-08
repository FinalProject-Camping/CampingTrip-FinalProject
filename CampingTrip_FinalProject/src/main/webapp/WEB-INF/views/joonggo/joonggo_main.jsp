<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	String[] categories = {"캠핑 > 텐트/타프/매트","캠핑 > 테이블/의자/가구","캠핑 > 캠핑카/카라반/트레일러","캠핑 > 기타 캠핑용품","여행 > 가방/캐리어/용품","여행 > 등산용품","여행 > 낚시용품","자전거","스포츠/레저","홈/생활용품","디지털/가전","의류/잡화","귀금속/주얼리/악세사리","상품권/티켓/쿠폰","기타 잡화","먹거리/무료나눔"};
	String[] recommends = {"캠핑 난로","캠핑 의자","아이스박스","백팩","캠핑카","캠핑 랜턴","카라반","텐트","바베큐그릴","카페트","캠핑세탁기","히터","낚시 용품"};	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 거래 메인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc" crossorigin="anonymous"></script>

<style type="text/css">
@font-face {
 font-family: 'NanumBarunGothic';
 font-style: normal;
 font-weight: 400;
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot');
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf') format('truetype');
}

@font-face {
 font-family: 'NanumBarunGothic';
 font-style: normal;
 font-weight: 700;
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot');
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.ttf') format('truetype')
}

@font-face {
 font-family: 'NanumBarunGothic';
 font-style: normal;
 font-weight: 300;
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot');
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.ttf') format('truetype');
}

.nanumbarungothic * {
 font-family: 'NanumBarunGothic', sans-serif;
}
/* @media screen and (min-width: 769px) and (max-width: 1239px) { body, html { font-size: 15px; }  }
@media screen and (min-width: 1240px) and (max-width: 1999px) { body, html { font-size: 17px; } }
@media screen and (min-width: 2000px) { body, html { font-size: 19px; } } */

@media screen and (max-width: 575px) { .mainbody{ font-size: 16px; } #list{font-size:15px !important; padding:5%; padding-top:0%;} .content { height: auto;} .content-img{height:240px; width:100%;} .content-inner{height:auto; width:100%; margin-top: 3%;} .titlegroup{-webkit-line-clamp: 1;} .date{float:right;} #lnb.fixed{ width: 100%;} .heart{float:right;}  .maintitleclass{font-size:18px;}}
@media screen and (min-width: 576px) and (max-width: 767px) { .mainbody{ font-size: 16px; } #list{font-size:15px !important; padding:2%; padding-top:0%;} .content { height: 220px;} .content-img{height:100%; width:50%; float:right;} .content-inner{height:100%; width:49%; margin-top: 0%;} .titlegroup{-webkit-line-clamp: 2;} .heart{left: 0; bottom: 0; position: absolute;} .id{display: none;} #lnb.fixed{ width: 540px;} #suggest{width:448px;} .maintitleclass{font-size:21px;}}
@media screen and (min-width: 768px) and (max-width: 991px) { .mainbody{font-size:16px;} #list{font-size:16px !important; padding-top:0%;} .content { height: 240px;} .content-img{height:100%; width:40%; float:right;} .content-inner{height:100%; width:59%; margin-top: 0%;} .titlegroup{-webkit-line-clamp: 2;} .heart{left: 0; bottom: 0; position: absolute;} .id{display:none;}  #lnb.fixed{ width: 720px;} #suggest{width:628px;} .maintitleclass{font-size:22px;}}
@media screen and (min-width: 992px) and (max-width: 1199px) { .mainbody{ font-size: 16px; } #list{font-size:15px !important;} .element{margin-bottom: 1.5%;} .content { height: auto; margin: 2%; margin-top:0%;} .content-img{height:180px; width:100%;} .content-inner{height:auto; width:100%; margin-top: 3%;} .titlegroup{-webkit-line-clamp: 1;} .date{float:right;} .mainbody {width:960px;} #lnb.fixed{ width: 960px;} .heart{float:right;} #suggest{width:868px;} .maintitleclass{font-size:23px;}}
@media screen and (min-width: 1200px) and (max-width: 1399px) { .mainbody{ font-size: 17px; } #list{font-size:15px !important;} .element{margin-bottom: 2%;} .content { height: auto; margin: 3%; margin-top:0%;} .content-img{height:200px; width:100%;} .content-inner{height:auto; width:100%; margin-top: 3%;} .titlegroup{-webkit-line-clamp: 1;} .date{float:right;} .mainbody {width:1070px;} #lnb.fixed{ width: 1070px;} .heart{float:right;} #suggest{width:978px;} .maintitleclass{font-size:24px;}}
@media screen and (min-width: 1400px) { .mainbody{ font-size: 17px; } #list{font-size:16px !important;} .element{margin-bottom: 2.5%;}  .content { height: auto; margin:3.5%; margin-top:0%;} .content-img{height:205px; width:100%;} .content-inner{height:auto; width:100%; margin-top: 3%;} .titlegroup{-webkit-line-clamp: 1;} .date{float:right;} .mainbody {width:1100px;} #lnb.fixed{ width: 1100px;} .heart{float:right;} #suggest{width:1008px;} .maintitleclass{font-size:25px;} }

input::-webkit-search-decoration,
input::-webkit-search-cancel-button,
input::-webkit-search-results-button,
input::-webkit-search-results-decoration{display:none;}

body{background-color : #f8f9fa;}
.mainbody{padding: 30px; padding-left:45px; padding-right:45px; font-family: NanumBarunGothic; background-color: #fff; border: 1px solid #e9ecef; border-radius: 8px;}
#listdiv{min-height: 1000px;}
#suggest > input{margin-top:15px;} 

#search-bar{
	width: 87%;
	height: 100%;
	border: none;
	outline: none;
	text-indent: 15px;
	border-radius: 30px;
	float:left;
}

#search-btn{
	background-color: white;
	border: none;
	border-radius: 25px;
	vertical-align: middle;
	width:12%;
	height: 99%;
	padding-right: 10px;
	padding-left: 10px;
	font-size: 20pt;
	float: right;
	margin-right: 1%;
}

#searchgroup{
	text-align: center;
	height: 50px;
	width:100%;
	border: solid 1px darkgray;
	padding: 0%;
	border-radius: 25px;
}

.select{
	border: 1px solid darkgray;
	margin-bottom: 20px;
	border-radius: 5px;
	padding-left: 3px;
	padding-right: 3px;
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
.side-btn-three{height:50px; padding-left: 15px; padding-right: 15px;}
.option-btn{background-color: #ff8a3d; border: solid 1px #ff8a3d; border-radius: 25px; padding-right: 10px; padding-left: 10px; margin-right: 10px; margin-bottom: 15px; color:white; height:30px; font-size:13px;}
.white-btn{background-color: white; border: solid 1px darkgray; border-radius: 25px; padding-right: 10px; padding-left: 10px; margin-right: 10px; color:gray; height:30px; font-size:13px;}
.green-btn{background-color: rgb(0, 191, 121); border: solid 1px rgb(0, 191, 121); border-radius: 25px; padding-right: 10px; padding-left: 10px; margin-bottom: 15px; margin-right: 10px; color:white; height:30px; font-size:13px;}

.btn-gray{background-color: #FFFFFF; border: solid 2px gray; color : gray; border-radius: 5px; padding-right:3%; padding-left:3%; padding-top:1.5%; padding-bottom:1.5%; font-weight: bold;}
.btn-gray:hover{transition: all 0.3s; border: solid 2px gray; background-color: gray; color : white;}

.titlegroup{
	margin-top: 3px;
	margin-bottom: 3px;
	overflow: hidden;
	text-overflow: ellipsis;
	word-wrap: break-word;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	/* webkit 엔진을 사용하지 않는 브라우저를 위한 속성. */
	/* height = line-height * line = 1.2em * 3 = 3.6em  */
}
.placediv{
	color:gray;
	font-size:13px;
	margin-top: 3px;
	margin-bottom:3px;
	overflow: hidden;
	text-overflow: ellipsis;
	word-wrap: break-word;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 1;
}

.content{
	border-radius: 8px;
}

.content-inner{
	position: relative;
}

.content-img{
	/* display:flex; */
	border-radius:8px; 
	overflow: hidden;
	position: relative;
	align-items: center;
	justify-content: center;
	/* background-color: #f8f9fa; */
}
.content-img > div{
	background-position:center;
    background-size:cover;
}

#top {
	position: fixed;
	right: 50px;
	bottom: 50px;
	display: none;
	z-index: 999;
}

.rotation{
	animation: rotate_image 2s linear infinite;
}
@keyframes rotate_image{
	100%{
		transform: rotate(360deg);
	}
}

.bold{font-weight: bold;}
.gray{color:gray;}
.red{color: red;}
.pointer{cursor: pointer;}
#geolocation .modal-header{background-color: lightgray;}
#geolocation .modal-footer{border:none;}

#header{
  width: 100%; 
  height:100px; 
  font-size: 11px; 
  line-height: 100px; 
  color:#fff; 
  background:#121212; 
  text-align: center;
}
#lnb {padding-top : 17px; padding-bottom : 17px;}

#lnb.fixed{
  position: fixed;
  top: 0;
  left:50%;
  transform: translate(-50%, 0%);
  margin: 0 auto;
  padding-top : 17px;
  padding-bottom : 17px;
  z-index: 2;
}

#fixed{
  position: fixed;
  top: 50%;
  left:50%;
  transform: translate(-50%, -50%);
  margin: 0 auto;
}

#addrSearch{
	min-width:300px;
	width:auto;
	height:auto;
	position: fixed;
	top: 45%;
	left:50%;
	transform: translate(-50%, -50%);
	padding:30px;
	background-color: white;
	border-radius: 8px;
}

.maintitleclass{
	position:absolute;
    top:50%;
    left:50%;
    transform: translate(-50%, -50%);
	opacity:0;
	transition: opacity 0.1s;
}
.active{
	opacity:1;
    transition: opacity 1s;
}


/* toast */
.toast-success {background-color: #77ca8a !important;}
.toast-error {background-color: #BD362F !important;}
.toast-info {background-color: #2F96B4 !important;}
.toast-warning {background-color: #F89406 !important;}
.toast-top-right {top: 2%;}

</style>

<script>
const keyword = '${keyword}';
let page = 1;
let category = [];
let status = '';
const sessionId = '${sessiondto.userid}'; 
const sessionUsertype = '${sessiondto.usertype}'; 


	document.addEventListener("DOMContentLoaded", ()=>{
		//관리자인 경우에 버튼 X
		if(sessionUsertype == 'admin'){
			document.getElementById('side-btns').style.display = "none";
		}
		
		//검색창 searchVal 세팅
		document.getElementById('search-bar').value = keyword;
		if(keyword === ''){
			document.getElementById('queryKeyword').innerHTML = '전체';
		}else{
			document.getElementById('queryKeyword').innerHTML = 
			'<button type="button" onclick="location.href=`list.do?keyword=`" class="white-btn align-middle"><span class="align-middle fas fa-times"></span><span class="align-middle"> 키워드 : '+ keyword +'</span></button>';;
		}
		
		//초기 상품 로드
		var ele = document.getElementById('list');
		loadProduct(ele, (start, array)=>{effect(start, array) } );
		
	});
	
	function addProduct(){
		//로그인이 없거나 페널티가 있는경우 안되게
		$.ajax({
			url:"insertConfirm.do",
			method: "post",
			success:function(data){ 
				if(data.data === true){
					if(data.penalty >= 5){
						toastr.options.positionClass = "toast-top-right";
						toastr.error("페널티 초과로 인해 게시글작성이 불가능합니다.");
					}else{
						location.href='insertform.do';
					}
				}else{
					alert('로그인이 필요합니다.');
					location.href='loginform.do';
				}
			}
		})
	}
	
	function selectone(seq){
		history.back();
		location.href='selectone.do?seq=' + seq;
	}

	function createContent(imgpath, seq, writer, date, trade, title, price, heart, hit, place){
		
		var maindiv = document.createElement('div');
		maindiv.setAttribute('class', 'element col-lg-4 col-12');
 		maindiv.style.setProperty('opacity', '0');
		var div = document.createElement('div');
		div.setAttribute('class', 'shadow content p-3 mb-4 pointer');
		div.setAttribute('onclick', "selectone("+seq+")");
		
		var imgdiv = document.createElement('div');
		imgdiv.setAttribute('class', 'content-img');
		var imgdiv_inner = document.createElement('div');
		imgdiv_inner.style.setProperty('width','100%');
		imgdiv_inner.style.setProperty('height','100%');
		imgdiv_inner.style.setProperty('background-image','url('+imgpath+')');
		
		var innerdiv = document.createElement('div');
		innerdiv.setAttribute('class', 'content-inner');
		var writer_span = document.createElement('span');
		writer_span.setAttribute('class', 'id');
		writer_span.style.setProperty('color','gray'); 
		writer_span.innerHTML = writer + '&nbsp'.repeat(3);
		var date_span = document.createElement('span');
		date_span.setAttribute('class', 'bold date');
		date_span.style.setProperty('color','gray');
		date_span.innerHTML = getTime(date);
		
		var titlediv = document.createElement('div');
		titlediv.setAttribute('class', 'titlegroup');
		var trade_span = document.createElement('span');
		trade_span.style.setProperty('font-weight','bold');
		
		if(trade == 'Y'){
			trade_span.style.setProperty('color','rgb(0, 191, 121)');
			trade_span.innerHTML = '[판매] ';
		}else if(trade == 'N'){
			trade_span.style.setProperty('color','gray');
			trade_span.innerHTML = '[완료] ';
			imgdiv_inner.style.setProperty('opacity','0.5');
		}else{
			trade_span.style.setProperty('color','#ff8a3d');
			trade_span.innerHTML = '[예약] ';
		}
		var title_span = document.createElement('span');
		title_span.innerHTML = title;
		title_span.style.setProperty('font-weight','bold');
		titlediv.append(trade_span, title_span);
		
		var price_span = document.createElement('span');
		price_span.style.setProperty('font-weight','bold');
		if(trade != 'N'){
			price_span.style.setProperty('color','#ff8a3d');
			price_span.innerHTML = convertPrice(price)+'원';
		}else{
			price_span.style.setProperty('color','gray');
			price_span.innerHTML = convertPrice(price)+'원';
		}
		
		var hearthitspan = document.createElement('span');
		hearthitspan.setAttribute('class', 'heart');
		var heart_span = document.createElement('span');
		heart_span.innerHTML = '<span class="red far fa-heart"></span><span class="align-middle"> ' + heart + '</span>&nbsp'.repeat(4);
		var hit_span = document.createElement('span');
		hit_span.innerHTML = '<span class="far fa-eye"></span><span class="align-middle"> ' + hit + '</span>';
		hearthitspan.append(heart_span, hit_span);
		
		imgdiv.append(imgdiv_inner);
 		if(trade == 'N'){
			imgdiv.innerHTML += '<span style="position: absolute; top:85%; left:0%; height:15%; width:100%; opacity:0.8; text-align:center; background-color:gray; z-index:1; font-weight: bold; color:white;"><span style="position:absolute; top:50%; left:50%; transform: translate(-50%, -50%);">거래 완료</span></span>';
 		} 
 		if(trade == 'T'){
 			imgdiv.innerHTML += '<span style="position: absolute; top:85%; left:0%; height:15%; width:100%; opacity:0.8; text-align:center; background-color:#ff8a3d; z-index:1; font-weight: bold; color:white;"><span style="position:absolute; top:50%; left:50%; transform: translate(-50%, -50%);">예약중</span></span>';
 		} 
 		
 		var placediv = document.createElement('div');
 		placediv.innerHTML = place == ''? '-' : place;
 		placediv.setAttribute('class', 'placediv');
 		
		innerdiv.append(writer_span, date_span, titlediv, placediv, price_span, hearthitspan);
		div.append(imgdiv, innerdiv);
		maindiv.append(div);
		
		return maindiv;
	}
	
	function noContent(){
		var div = document.createElement('div');
		div.style.setProperty('text-align','center');
		div.innerHTML += '<br><br><span class="align-middle far fa-times-circle fa-2x" style="color:gray"></span><br><br>'
		div.innerHTML += '검색 결과가 없습니다.';
		return div;
	}
	
	function getTime(date){
		var today = new Date();
		var timegap = today - date;
		var d = parseInt(timegap/86400000);
		var t = parseInt(timegap/3600000);
		var m = parseInt(timegap/60000);
		
		switch(true){
			case (d > 7):return date.split(' ')[0]; 
			case (d >= 1): return d+'일 전';
			case (t >= 1): return t+'시간 전';
			case (m >= 1): return m+'분 전';
			default: return '방금 전';
		}
	}
	
	function convertPrice(price){
		return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); 
	}
	
	function effect(count, arr){
		if(count === arr.length){
			return;
		}
		var child = arr[count];
		
		$(child).animate({opacity:'1'}, 120, ()=>{
			effect(count + 1, arr);
		});
	}
	
	function loadProduct(ele, func){
		var arr = ${list};
		if(${islast}){
			document.getElementById('morediv').style.display = 'none';
			document.getElementById('listdiv').style.setProperty('border-radius', '8px');
			if(arr.length === 0){
				ele.appendChild(noContent());
				return;
			}
		}
		console.log(arr);
		arr.forEach(data => {
			ele.appendChild(createContent(data.imglist.split(',')[0], data.seq, data.id, data.regdate, data.trade, data.title, data.price, data.heart, data.hit, data.place));
		});
		
		
		func(0, Array.from(ele.children));
	}
	
	function searchProduct(val){
		//redirect
		var trimVal = val.trim();
		if(trimVal === ''){return;}
		location.href='list.do?keyword=' + trimVal;
	}

	function ajax(url, method, senddata, func1, func2, func3){
		func1();
		
		$.ajax({
			url:url,
			method: method,
			data: senddata,
			success:function(datalist){ 
				var list = $.parseJSON(datalist.data)
				var ele = document.getElementById('list');
				
				setTimeout(()=>{
					func2();
					
					list.forEach(data => {
						ele.appendChild(createContent(data.imglist.split(',')[0], data.seq, data.id, data.regdate, data.trade, data.title, data.price, data.heart, data.hit, data.place));
					});
					
					func3();
					
					if(datalist.islast){
						document.getElementById('morediv').style.display = 'none';
						document.getElementById('listdiv').style.setProperty('border-radius', '8px');
						if(list.length === 0){
							var loading = document.getElementById('loading');
						    loading.classList.remove('rotation');
						    loading.style.display = 'none';
							ele.appendChild(noContent());
							return;
						}
					}else{
						document.getElementById('morediv').style.display = 'block';
						document.getElementById('listdiv').style.setProperty('border-bottom-left-radius', '0px');
						document.getElementById('listdiv').style.setProperty('border-bottom-right-radius', '0px');
					}
					
				}, 500);
				
			},
			error: function(){
				toastr.options.positionClass = "toast-top-right";
				toastr.warning("통신 실패");
			}
		});
	}
	
</script>


</head>
<body>
	<div id="gap" style="height:194.5px; display:none;"></div>
	
	<div class="container mainbody shadow" id="lnb" style="margin-bottom: 21px; border-top: none; border-top-left-radius: 0; border-top-right-radius: 0;">
		
		<div class="row" id="maintitle" style="position:relative; padding-top:25px; padding-bottom:25px; height:87.5px;">
			<div class="col" style="text-align: center;">
				<span class="w-100 maintitleclass active"><span class="align-middle fas fa-fire fa-2x" style="color:#d49466;"></span>&nbsp;&nbsp;중고거래를 통해 필요한 캠핑용품을 마련해보세요</span>
				<span class="w-100 maintitleclass"><span class="align-middle far fa-smile-wink fa-2x" style="color:#d49466;"></span>&nbsp;&nbsp;안전한 거래문화 함께 만들어요</span>
				<span class="w-100 maintitleclass"><span class="align-middle fas fa-campground fa-2x" style="color:#d49466;"></span>&nbsp;&nbsp;캠핑예약과 캠핑용품구매 모두 캠핑트립에서!</span>
			</div>		
		</div>
		
		<!-- 검색창 & 버튼 -->
		<div class="row">
			<div class="col-lg-6 col-11">
				<form class="box" action="javascript:searchProduct(document.getElementById('search-bar').value);">
					<div id="searchgroup">
						<span class="align-middle"><input type="search" id="search-bar" name="search" placeholder="검색하실 물품명을 입력하세요." autocomplete="off"></span>
						<button type="submit" id="search-btn"><span class="align-middle fab fa-searchengin"></span></button>
					</div>
				</form>
			</div>
			
			<div class="col-lg-6 col-1" style="text-align: right;" id="side-btns">
				<!-- size lg -->
				<div class="btn-group" id="side-lg" style="display:none;">
					<button type="button" class="side-btn side-btn-three" onclick="showAddrSearch()" data-bs-placement="bottom" title="위치를 기반으로 상품을 탐색합니다"><span class="align-middle fas fa-map-marker-alt"></span><span class="align-middle">&nbsp;위치 조회</span></button> &nbsp;
					<button type="button" class="side-btn side-btn-three" onclick="addProduct();"><span class="align-middle fas fa-plus-circle"></span><span class="align-middle">&nbsp;상품 추가</span></button> &nbsp;
				
					<button type="button" class="side-btn side-btn-three dropdown-toggle" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">카테고리 선택</button>
					<ul class="dropdown-menu dropdown-menu-end" style="background-color: white;" aria-labelledby="dropdownMenuLink">
						<li><button class="dropdown-item" type="button" onclick="setAllCategory()">전체 카테고리</button></li>
						<%
							for(String s : categories){
						%>
							<li><button class="dropdown-item" type="button" onclick="setCategory(this.value)" value="<%=s%>"><%=s %></button></li>
						<%
							}
						%>
					</ul>
				</div>
				<!-- size under lg -->
				<div class="btn-group align-middle h-100" id="side-mobile" style="display:none; text-align: center;">
					<button type="button" class="h-100" id="dropdownMenuLink2" style="border: none; background-color: white;" data-bs-toggle="dropdown" aria-expanded="false"><span class="align-middle fas fa-bars fa-2x" style="color:darkgray"></span></button>
					<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuLink2" style="background-color: white;">
						<li><button class="dropdown-item" type="button" onclick="addProduct();"><span class="align-middle fas fa-plus-circle"></span><span class="align-middle">&nbsp;상품 추가</span></button></li>
						<li><button class="dropdown-item" type="button" onclick="showAddrSearch()" data-bs-placement="bottom"><span class="align-middle fas fa-map-marker-alt"></span><span class="align-middle">&nbsp;&nbsp;위치 조회</span></button></li>
						<li><hr class="dropdown-divider"></li>
						<li><button class="dropdown-item" type="button" onclick="setAllCategory()">전체 카테고리</button></li>
						<%
							for(String s : categories){
						%>
							<li><button class="dropdown-item" type="button" onclick="setCategory(this.value)" value="<%=s%>"><%=s %></button></li>
						<%
							}
						%>
					</ul>
				</div>
				
				<script type="text/javascript">
					
					if(window.innerWidth < 992){
						document.getElementById('side-mobile').style.display = 'block';
					}else{
						document.getElementById('side-lg').style.display = 'block';
					}
					
					$(window).resize(function(){
						if(window.innerWidth < 992){
							document.getElementById('side-mobile').style.display = 'block';
							document.getElementById('side-lg').style.display = 'none';
						}else{
							document.getElementById('side-mobile').style.display = 'none';
							document.getElementById('side-lg').style.display = 'block';
						}
					});
				</script>

			</div>
		</div>
		
		<div class="row">
			<div class="col-xs-12">
				<div id="suggest" style="width:100%; padding-bottom:0 !important; padding:15px; background-color:white; text-align: left; display:none; z-index: 1;" class="col-lg-12">
					<hr style="margin:0;">
					<b>추천 검색어&nbsp;</b>
					<%
						for(String s : recommends){
					%>
						<input type="button" class="side-btn" value="<%=s%>" onclick="searchProduct(this.value)" style="margin-right:0.8%;">
					<%
						}
					%>
				</div>
			</div>
		</div>
		
	</div>
	
	<div class="container mainbody shadow" id="listdiv" style="margin-bottom: 0px; padding-bottom: 0px; border-bottom-left-radius: 0px; border-bottom-right-radius: 0px;">
		<div class="row">
			<h4 class="col-8 bold">
				<span style="color:#d49466">중고거래&nbsp;>&nbsp;</span><span id="queryKeyword"></span>
			</h4>
			<div class="col-4" style="text-align: right;">
				<select id="select" class="select">
					<option value="" selected>게시글 전체</option>
					<option value="Y">판매중</option>
				</select>
			</div>
		</div>
		
		<div class="row">
			<div class="col-12" id="option">
				<div style="height:45px;" id="nothing"></div>
			</div>
		</div>
		
		<script type="text/javascript">
		
			function applyChange(func){
				var ele = document.getElementById('list');
				var loading = document.getElementById('loading');
				ajax("setcategory.do", "post", {"category":category.join(','),
											    "status":status,
											    "keyword":keyword},
											    ()=>{
											    	document.body.style.setProperty('pointer-events','none');
											    	document.body.style.setProperty('opacity', '0.7');
											    	loading.style.display = 'block';
											    	loading.classList.add('rotation');
											    },()=>{
													ele.innerHTML = '';	
											    	page = 1;
											    	func(); //버튼 삭제/추가
											    },()=>{
											    	var loading = document.getElementById('loading');
											    	loading.classList.remove('rotation');
											    	loading.style.display = 'none';
											    	document.body.style.setProperty('pointer-events','');
											    	document.body.style.setProperty('opacity', '');
											    	effect(0, Array.from(ele.children));
											    });
			}
			
			function addbtn(value){
				document.getElementById('nothing').style.display='none';
				document.getElementById('option').innerHTML += 
					'<button type="button" onclick="delCategory(this)" value="'+ value +'" class="option-btn"><span class="align-middle fas fa-times"></span><span class="align-middle"> '+ value +'</span></button>';				
			}
			
			function delbtn(ele){
				if(category.length === 0 && status === ''){document.getElementById('nothing').style.display='block';}
				ele.remove();
			}
			
			function delAllbtns(){
				Array.from(document.getElementsByClassName('option-btn')).forEach(btn =>{
					btn.remove();
				});
				if(status === ''){document.getElementById('nothing').style.display='block';}
			}
		
			function setCategory(value){
				if(category.includes(value)){return;}
				category.push(value);

				applyChange(()=>{addbtn(value)});
			}
			
			function delCategory(ele){
				category.splice(category.indexOf(ele.value),1);
				
				applyChange(()=>delbtn(ele));
			}
			
			function setAllCategory(){
				category = [];
				
				applyChange(()=>{delAllbtns()});	
			}
			
			function delstatusbtn(){
				Array.from(document.getElementsByClassName('green-btn')).forEach(btn =>{
					btn.remove();
				});
				document.getElementById('select').options[0].selected = true;
				if(category.length === 0){document.getElementById('nothing').style.display='block';}
			}
			
			function delstatus(){
				status = '';
				
				applyChange(()=>{delstatusbtn()});
			}
			
			function addstatusbtn(){
				document.getElementById('nothing').style.display='none';
				document.getElementById('option').innerHTML += 
					'<button type="button" onclick="delstatus()" class="green-btn"><span class="align-middle fas fa-times"></span><span class="align-middle"> 판매중</span></button>';
			}
			
			//이벤트	
			document.getElementById('select').addEventListener("change", function(){
				if(this.value === ''){delstatus(); return;}
				status = 'Y';
				
				applyChange(()=>{addstatusbtn()});
			});

		
		</script>
		
		<!-- 물품리스트 -->
		<div class="row" id="list">
			
		</div>

	</div>
	<!-- 버튼 -->
	<div class="container mainbody shadow" id="morediv" style="border-top:none; padding:0px; margin-top:0px; border-top-left-radius: 0px; border-top-right-radius: 0px;">
		<div onclick="moreResult(this);" style="text-align: center; cursor: pointer; padding-top:15px; padding-bottom:15px;">
			<span class="more-text" style="display: block;">더보기</span>
			<span class="align-middle fas fa-circle-notch fa-lg" style="display:none; color:#d49466;"></span>
		</div>
	</div>
	
	<div id="fixed">
		<span id="loading" class="align-middle fas fa-spinner fa-2x" style="display:none; color:black; z-index: 999;"></span>
	</div>
	
	<script type="text/javascript">
	
		function moreResult(ele){
			var list = document.getElementById('list');
				ajax("moreresult.do", "post",
						{"page":page,
						 "keyword":keyword,
						 "category":category.join(','),
						 "status":status},
						 ()=>{
							 document.body.style.setProperty('pointer-events','none');
							 ele.children[0].style.display = 'none';
							 ele.children[1].style.display = 'inline-block';
							 ele.children[1].classList.add('rotation');							 
						 },()=>{
							 page = page + 1;
						 },()=>{
							 ele.children[1].classList.remove('rotation');
							 ele.children[1].style.display = 'none';
							 ele.children[0].style.display = 'block';
							 document.body.style.setProperty('pointer-events','');
							 effect(0 , Array.from(list.children).slice((page-1) * 9));
							 console.log(list.children.length);
						 }
	
				);
			
		}
	</script>
	
	<!-- top -->
	<a id="top" href="#"><span id="topspan" style="color:black; font-size: 30pt;" class="align-middle fas fa-arrow-alt-circle-up"></span></a>
	<script>
    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 500) {
                $('#top').fadeIn();
            } else {
                $('#top').fadeOut();
            }
            $("#suggest").slideUp(200); // 원래 400 
            $("#search-bar").blur();
        });
        $("#top").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 200);
            return false;
        });
        $("#top").hover(function(){
        	$("#topspan").animate({
        		fontSize:"35pt"
        	},200);
        }, function(){
        	$("#topspan").animate({
        		fontSize:"30pt"
        	},200);
        });
    });
    
    $(function() {
    	  var lnb = $("#lnb").offset().top + 87.5;
    	  let flag = false;
    	  let searchflag = false;
    	  
    	  $(window).scroll(function() {
    	   
    	    var window = $(this).scrollTop();
    	    
    	    if(lnb <= window) {
    	      $("#lnb").addClass("fixed");
    	      $("#maintitle").hide();
    	      $("#gap").show();
    	    }else{
    	      $("#lnb").removeClass("fixed");
    	      $("#maintitle").show();
    	      $("#gap").hide();
    	    }
    	  })
    	  
    	  
    	  //추천검색어
    	  $("#search-bar").focus(function(){
          	$("#suggest").slideDown(200); //원래 slidedown
          });
    	  $("#search-bar").focusout(function(){
    		 if(!flag){$("#suggest").slideUp(200);}
    	  });
    	  $("#search-bar").on('mouseenter', function(){
    		  searchflag = true;
    	  })
    	  $("#search-bar").on('mouseleave', function(){
    		  searchflag = false;
    	  })
    	  $("#search-btn").on('mouseenter', function(){
    		  flag = true;
    	  })
    	  $("#search-btn").on('mouseleave', function(){
    		  flag = false;
    	  })
    	  $("#suggest").on('mouseenter', function(){
    		  flag = true;
    	  })
    	  $("#suggest").on('mouseleave', function(){
    		  flag = false;
    	  })
    	  $(document.body).on('mousedown', function(){
    		  if(!searchflag && !flag){$("#suggest").slideUp(200);}
    	  })
    	  
    	  var maintitleOpacity = (idx) => {
    		  $('.maintitleclass').eq(idx).removeClass('active');
    		  idx = idx + 1 == 3? 0 : idx + 1;
    		  $('.maintitleclass').eq(idx).addClass('active');
    		  setTimeout( ()=>{maintitleOpacity(idx)}, 5500);
    	  }
    	  
    	  setTimeout( ()=>{maintitleOpacity(0)}, 6500);
    	});
	</script>
	
	<!-- addrSearch -->
	<div id="addrSearch" style="display:none; opacity: 0; z-index: 999" class="shadow-lg">
		<div class="row">
			<div class="col-10"><b>위치를 기반으로 상품을 검색하세요</b></div>
			<div class="col-2" style="text-align:right;"><span style="cursor: pointer;" onclick="closeAddrSearch()" class="fas fa-times fa-lg"></span></div>
			<br>
			회원님의 위치를 확인하고 있어요.
			직접 위치를 입력하시겠습니까?
			특정 키워드를 입력하시겠습니까?
			해당 키워드에 대한 범위를 선택해주세요.
			
			
			
		
		</div>
		<script type="text/javascript">
			var doc = document.getElementById('addrSearch');
			var showAddrSearch = ()=>{
				doc.style.display = 'block';
				$(doc).animate({opacity:"1"},400);
			}
		
			var closeAddrSearch = ()=>{
				doc.style.setProperty('opacity','0');
				doc.style.display = 'none';
			};
		</script>
	</div>
	
	
	
	
	
<br>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>















