<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	//UserDto userdto = (UserDto)session.getAttribute("login");
	String sessionid = null;
	String usertype = null;
	String penalty = null;
	/*if(userdto != null){
		userid = userdto.getUserid();
		userType = userdto.getUsertype();
		penalty = userdto.getPenalty();
	}*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 거래 메인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
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

@media screen and (max-width: 575px) { .mainbody{ font-size: 16px; } #list{font-size:15px !important; padding:5%; padding-top:0%;} .content { height: 380px; border: 5px solid #FFFFFF;} .content-img{height:72%; width:100%;} .content-inner{height:27%; width:100%; margin-top: 3%;} .titlegroup{-webkit-line-clamp: 1;} .carousel-img{height: 110px;} .side-btn-three{font-size:19pt;} .date{float:right;}}
@media screen and (min-width: 576px) and (max-width: 767px) { .mainbody{ font-size: 16px; } #list{font-size:13px !important; padding:2%; padding-top:0%;} .content { height: 220px;} .content-img{height:100%; width:50%; float:right;} .content-inner{height:100%; width:49%; margin-top: 0%;} .titlegroup{-webkit-line-clamp: 2;} .heart{left: 0; bottom: 0; position: absolute;} .carousel-img{height: 140px;} .id{display: none;} .side-btn-three{font-size:19pt;}}
@media screen and (min-width: 768px) and (max-width: 991px) { .mainbody{font-size:16px;} #list{font-size:13px !important; padding:2%; padding-top:0%;} .content { height: 170px;} .content-img{height:100%; width:50%; float:right;} .content-inner{height:100%; width:49%; margin-top: 0%;} .titlegroup{-webkit-line-clamp: 2;} .heart{left: 0; bottom: 0; position: absolute;} .carousel-img{height: 140px;} .id{display:none;} .side-btn-three{font-size:19pt;} }
@media screen and (min-width: 992px) and (max-width: 1199px) { .mainbody{ font-size: 17px; } #list{font-size:15px !important;} .content { height: 330px;} .content-img{height:70%; width:100%;} .content-inner{height:29%; width:100%; margin-top: 3%;} .titlegroup{-webkit-line-clamp: 1;} .carousel-img{height: 170px;} .side-btn-three{font-size:20pt;} .date{float:right;} #mainbody > .row{margin-left:2%; margin-right:2%;}}
@media screen and (min-width: 1200px) and (max-width: 1399px) { .mainbody{ font-size: 17px; } #list{font-size:15px !important;} .element{margin-bottom: 1%;} .content { height: 360px; margin: 2%; margin-top:0%;} .content-img{height:72%; width:100%;} .content-inner{height:27%; width:100%; margin-top: 3%;} .titlegroup{-webkit-line-clamp: 1;} .carousel-img{height: 200px;} .side-btn-three{font-size:20pt;} .date{float:right;} #mainbody > .row{margin-left:4%; margin-right:4%;}}
@media screen and (min-width: 1400px) { .mainbody{ font-size: 18px; } #list{font-size:16px !important;} .element{margin-bottom: 2%;}  .content { height: 410px; margin:4%; margin-top:0%;} .content-img{height:72%; width:100%;} .content-inner{height:27%; width:100%; margin-top: 3%;} .titlegroup{-webkit-line-clamp: 1;} .carousel-img{height: 210px;} .side-btn-three{font-size:21pt;} .date{float:right;} #mainbody > .row{margin-left:5%; margin-right:5%;}}
@media screen and (max-width: 991px) {.side-btn{margin-top: 15px;} }
@media screen and (min-width: 991px) {#suggest > input{margin-top:15px;} }

input::-webkit-search-decoration,
input::-webkit-search-cancel-button,
input::-webkit-search-results-button,
input::-webkit-search-results-decoration{display:none;}

body{background-color: #f8f9fa;}
.mainbody{padding: 30px; padding-left:45px; padding-right:45px; font-family: NanumBarunGothic; background-color: #fff; border: 1px solid #e9ecef; border-radius: 8px; margin-bottom: 21px}
#list{min-height: 400px;}

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
	border: 2px solid darkgray;
	margin-bottom: 20px;
	border-radius: 5px;
	padding-left: 2px;
	padding-right: 2px;
}

.side-btn{
	background-color: white;
	border: solid 1px darkgray;
	border-radius: 10px;
	padding-right: 10px;
	padding-left: 10px;
	height: 40px;
}

.side-btn:hover{
	transition: all 0.3s;
	border: solid 1px rgb(173, 88, 66);
	background-color: rgb(173, 88, 66);
	color : white;
}

.btn-gray{background-color: #FFFFFF; border: solid 2px gray; color : gray; border-radius: 5px; padding-right:3%; padding-left:3%; padding-top:1.5%; padding-bottom:1.5%; font-weight: bold;}
.btn-gray:hover{transition: all 0.3s; border: solid 2px gray; background-color: gray; color : white;}

.titlegroup{
	overflow: hidden;
	text-overflow: ellipsis;
	word-wrap: break-word;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	/* webkit 엔진을 사용하지 않는 브라우저를 위한 속성. */
	/* height = line-height * line = 1.2em * 3 = 3.6em  */
}

.content{
	border-radius: 8px;
}

.content-inner{
	position: relative;
}

.content-img{
	border-radius:8px; 
	cursor: pointer;
	position: relative; 
}

.thumbnail{ 
	border-radius:8px; 
	width: 100%;
	height: 100%;	
}

#top {
	position: fixed;
	right: 50px;
	bottom: 50px;
	display: none;
	z-index: 999;
}

.bold{font-weight: bold;}
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
#lnb {}

#lnb.fixed{
  position: fixed;
  left: 0;
  top: 0;
  width: 100%;
  padding-top : 10px;
  padding-bottom : 10px;
  height: autox;
  z-index: 1;
}

/* toast */
.toast-success {background-color: #77ca8a !important;}
.toast-error {background-color: #BD362F !important;}
.toast-info {background-color: #2F96B4 !important;}
.toast-warning {background-color: #F89406 !important;}
.toast-top-right {top: 2%;}

</style>

<script>
const loadvalue = "";
const sessionId = ''; <%-- <%= sessiondto==null? "":sessiondto.getUserid() %> --%>
const sessionUsertype = ''; <%-- <%= sessiondto==null? "":sessiondto.getUserType() %> --%>
const sessionPenalty = ''; <%-- <%= sessiondto==null? "":sessiondto.getUserPenalty() %> --%>

let current = 0;
let scroll = 0;
let offsetArr = new Array();

	document.addEventListener("DOMContentLoaded", ()=>{
		//관리자인경우에 버튼이 안보이게
		if(sessionUsertype == 'admin'){
			var btns = document.getElementsByClassName('side-btn');
			Array.from(btns).forEach(btn => {
				btn.style.display = "none";
			});
		}

		//상품 로드
		var ele = document.getElementById('list');
		loadProduct(ele, loadvalue, ()=>{setOffset()});
		
		$(window).scroll(function(){
			var st = $(this).scrollTop();
			if(st < scroll){
				return;
			}
			let temparr = new Array();
			
			var pos = $(window).scrollTop() + (window.innerHeight/1.1); // or $(window).height
				
			$('.element').each(function(index){
				if(pos > offsetArr[index]){
					temparr.push(index);
				}
			})
			if(current === temparr.length){
				return;
			}
			current = temparr.length;
			effect(0, temparr, ele);
			scroll = st;
		})
		
		//이벤트
		document.getElementById('select1').addEventListener("change", function(){
			var val = this.value;
			var val2 = document.getElementById('select2').value;
			var list = ele.childNodes;
			
			function check(func){
				for(var i = 1; i < list.length; i++){
					let type = list[i].firstChild.childNodes[2];
					if((val=='all'? true : type.value==val) && (val2=='status'? true: type.nextSibling.value==val2)){
						list[i].setAttribute('selected', 'selected');
					}else{
						list[i].setAttribute('selected', '');
					}
				};
				func();
			}
			animationClear(ele, ()=>{ check( ()=>{selectEffect(0, ele)} ) });
		});
		
		document.getElementById('select2').addEventListener("change", function(){
			var val = this.value;
			var val2 = document.getElementById('select1').value;
			var list = ele.childNodes;
			
			function check(func){
				for(var i = 1; i < list.length; i++){
					let status = list[i].firstChild.childNodes[3];
					if((val=='status'? true : status.value==val) && (val2=='all'? true : status.previousSibling.value==val2)){
						list[i].setAttribute('selected', 'selected');
					}else{
						list[i].setAttribute('selected', '');
					}
				};
				func();
			}
			animationClear(ele, ()=>{ check( ()=>{selectEffect(0, ele)} ) });
		});
		
		
	});
	
	function myList(){
		//로그인이 없을경우 안되게
		if(sessionId == ''){
			toastr.options.positionClass = "toast-top-right";
			toastr.warning("로그인 해주세요");
			return;
		}
		//location.href='mylist.do?userid=' + sessionId;
	}
	
	function addProduct(){
		//로그인이 없거나 페널티가 있는경우 안되게
		if(sessionId == ''){
			toastr.options.positionClass = "toast-top-right";
			toastr.warning("로그인 해주세요");
			return;
		}
		if(sessionPenalty == 'y'){
			toastr.options.positionClass = "toast-top-right";
			toastr.error("게시글 작성이 불가능한 회원입니다.");
			return;
		}
		//location.href='addproduct.do;
	}

	function createContent(imgpath, seq, type, writer, date, issale, title, price, heart, hit){
		
		var maindiv = document.createElement('div');
		maindiv.setAttribute('class', 'element col-lg-4 col-md-6 col-sm-12 col-xs-12');
 		maindiv.style.setProperty('opacity', '0');
		/* maindiv.style.setProperty('display', 'none');  */
		var div = document.createElement('div');
		div.setAttribute('class', 'shadow content p-3 mb-4');
		
		var imgdiv = document.createElement('div');
		imgdiv.setAttribute('class', 'content-img');
		var img = document.createElement('img');
		img.setAttribute('class','thumbnail');
		img.setAttribute('src',imgpath);
		img.setAttribute('onclick', "location.href='selectone.do?seq=" + seq +"'");
		
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
		var issale_span = document.createElement('span');
		issale_span.style.setProperty('font-weight','bold');
		
		if(issale == 'y'){
			issale_span.style.setProperty('color','rgb(0, 191, 121)');
			issale_span.innerHTML = '[판매중] ';
		}else if(issale == 'n'){
			issale_span.style.setProperty('color','gray');
			issale_span.innerHTML = '[거래완료] ';
			img.style.setProperty('opacity','0.3');
		}else{
			issale_span.style.setProperty('color','#F89406');
			issale_span.innerHTML = '[예약중] ';
			img.style.setProperty('opacity','0.3');
		}
		var title_span = document.createElement('span');
		title_span.innerHTML = title;
		title_span.style.setProperty('font-weight','bold');
		titlediv.append(issale_span, title_span);
		
		var price_span = document.createElement('span');
		price_span.style.setProperty('font-weight','bold');
		price_span.innerHTML = convertPrice(price)+'원 <br>';
		
		var hearthitdiv = document.createElement('div');
		hearthitdiv.setAttribute('class', 'heart');
		var heart_span = document.createElement('span');
		heart_span.innerHTML = '좋아요 ' + heart + '&nbsp'.repeat(3);
		var hit_span = document.createElement('span');
		hit_span.innerHTML = '조회 ' + hit;
		hearthitdiv.append(heart_span, hit_span);
		
		imgdiv.append(img);
 		if(issale == 'n'){
			imgdiv.innerHTML += '<span onclick="location.href=`selectone.do?seq='+seq+'`" style="position: absolute; top:50%; left:50%; transform: translate(-50%,-50%); font-weight: bold; color:gray; font-size:300% !important;"><span class="align-middle far fa-times-circle"></span></span>';
 		} 
 		if(issale == 't'){
			imgdiv.innerHTML += '<span onclick="location.href=`selectone.do?seq='+seq+'`" style="position: absolute; top:50%; left:50%; transform: translate(-50%,-50%); font-weight: bold; color:#F4A460; font-size:300% !important;"><span class="align-middle fas fa-hands-helping"></span></span>';
		} 
		innerdiv.append(writer_span, date_span, titlediv, price_span, hearthitdiv);
		div.append(imgdiv, innerdiv);
		div.innerHTML += '<input type="hidden" name="category1" value="'+ type +'">' + 
						 '<input type="hidden" name="category2" value="'+ issale +'">';
		maindiv.append(div);
		
		return maindiv;
	}
	
	function getTime(date){
		var today = new Date();
		var regdate = new Date(date);
		var timegap = today - regdate;
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
		let temp = '';
		for(let ch of price){temp = ch + temp;}
		
		let result = '';
		for(let ch of temp.match(/.{1,3}/g).join(',')){
			result = ch + result;
		}
		return result; 
	}
	
	function selectEffect(count, ele){
		if(count === ele.length){
			return;
		}
		var child = ele.children[count];
		
 		if(child && child.getAttribute('selected') === 'selected'){
 			child.style.setProperty('display','');
 			$(child).animate({opacity:'1'}, 200, ()=>{
 				selectEffect(count + 1, ele);
 			});
		}else if(child){
 			selectEffect(count + 1, ele);
		}
	}
	
	function effect(count, arr, ele){
		if(count === arr.length){
			return;
		}
		var child = ele.children[arr[count]];
		
		if(child.style.getPropertyValue('opacity') === '1'){
			effect(count + 1, arr, ele);
			return;
		}
		$(child).animate({opacity:'1'}, 150, ()=>{
			effect(count + 1, arr, ele);
		});
	}
	
	function animationClear(ele, func){
		Array.from(ele.children).forEach(child=>{
			$(child).animate().stop();
			child.style.setProperty('opacity' , '0');
			child.style.setProperty('display' , 'none');
		});
		func();
	}
	
	function setOffset(){
		offsetArr = [];
		current = 0;
		scroll = 0;
		var elements = document.getElementsByClassName('element');
		var ele = document.getElementById('list');
		
		Array.from(elements).forEach(ele =>{
			offsetArr.push($(ele).offset().top);
		});
		
		var temparr = [];
		for(var i = 0; i < offsetArr.length; i++){
			if(offsetArr[i] <= window.innerHeight){
				temparr.push(i);
			} 
		}
		effect(0, temparr, ele);
	}
	
	//test용
	function test(imgpath, seq, type, writer, date, issale, title, price, heart, hit){
		var data = {"imgpath" : imgpath,
					"seq" : seq,
					"type" : type,
					"writer" : writer,
					"date" : date,
					"issale" : issale,
					"title" : title,
					"price" : price,
					"heart" : heart,
					"hit" : hit};
		return data;
	} 
	//초기로드 test
	function loadProduct(ele, value, func){
		//main > model > load
		//java 검색어 검사 (index 시작 ~ 끝 / rownum count*18)
	
			//url, data = x
			//ajax(url, loadvalue, ()=>{}, ()=>{setOffset()}); load 18개
			let array = new Array();
			array.push(test('https://img.wizwid.com/PImg/706861/bsc/706861593.jpg', '1', 'camping' ,'캠핑가자', '2021-12-18 12:30:56', 'n', '물건 팔아요', '800000', '2', '22'));
			array.push(test('https://img.wizwid.com/PImg/707356/bsc/707356636.jpg', '2', 'camping' ,'캠핑가자', '2021-12-17 13:30:56', 't', '모마 보덤 미니 숯불 바베큐 캠핑 그릴 모마 보덤 미니 숯불 바베큐 캠핑 그릴', '158000', '0', '20'));
			array.push(test('https://img.wizwid.com/PImg/707235/bsc/707235448.jpg', '3', 'camping' ,'캠핑가자', '2021-12-16 23:30:56', 'y', '튤립 텐트 12.5', '529000', '0', '20'));
			array.push(test('https://img.wizwid.com/PImg/707021/bsc/707021453.jpg', '4', 'etc' ,'캠핑가자', '2021-12-05 22:30:56', 'y', '펠리칸 엘리트 쿨러 95QT White', '985200', '0', '20'));
			array.push(test('https://img.wizwid.com/PImg/706861/bsc/706861593.jpg', '5', 'etc' ,'캠핑가자', '2021-12-08 22:30:56', 't', '물건 팔아요', '800000', '2', '22'));
			array.push(test('https://img.wizwid.com/PImg/707356/bsc/707356636.jpg', '6', 'etc' ,'캠핑가자', '2021-12-04 21:30:56', 'y', '모마 보덤 미니 숯불 바베큐 캠핑 그릴 모마 보덤 미니 숯불 바베큐 캠핑 그릴', '158000', '0', '20'));
			array.push(test('https://img.wizwid.com/PImg/707235/bsc/707235448.jpg', '7', 'camping' ,'캠핑가자', '2021-12-02 20:30:56', 'n', '튤립 텐트 12.5', '529000', '0', '20'));
			array.push(test('https://img.wizwid.com/PImg/707021/bsc/707021453.jpg', '8', 'etc' ,'캠핑가자', '2021-12-01 22:30:56', 'y', '펠리칸 엘리트 쿨러 95QT White', '985200', '0', '20'));
			array.push(test('https://img.wizwid.com/PImg/706861/bsc/706861593.jpg', '1', 'camping' ,'캠핑가자', '2021-12-12 19:48:56', 'n', '물건 팔아요', '800000', '2', '22'));
			array.push(test('https://img.wizwid.com/PImg/707356/bsc/707356636.jpg', '2', 'camping' ,'캠핑가자', '2021-12-11 13:30:56', 't', '모마 보덤 미니 숯불 바베큐 캠핑 그릴 모마 보덤 미니 숯불 바베큐 캠핑 그릴', '158000', '0', '20'));
			array.push(test('https://img.wizwid.com/PImg/707235/bsc/707235448.jpg', '3', 'camping' ,'캠핑가자', '2021-12-10 23:30:56', 'y', '튤립 텐트 12.5', '529000', '0', '20'));
			array.push(test('https://img.wizwid.com/PImg/707021/bsc/707021453.jpg', '4', 'etc' ,'캠핑가자', '2021-12-09 22:30:56', 'y', '펠리칸 엘리트 쿨러 95QT White', '985200', '0', '20'));
			array.push(test('https://img.wizwid.com/PImg/706861/bsc/706861593.jpg', '5', 'etc' ,'캠핑가자', '2021-12-08 22:30:56', 't', '물건 팔아요', '800000', '2', '22'));
			array.push(test('https://img.wizwid.com/PImg/707356/bsc/707356636.jpg', '6', 'etc' ,'캠핑가자', '2021-12-04 21:30:56', 'y', '모마 보덤 미니 숯불 바베큐 캠핑 그릴 모마 보덤 미니 숯불 바베큐 캠핑 그릴', '158000', '0', '20'));
			array.push(test('https://img.wizwid.com/PImg/707235/bsc/707235448.jpg', '7', 'camping' ,'캠핑가자', '2021-12-02 20:30:56', 'n', '튤립 텐트 12.5', '529000', '0', '20'));
			array.push(test('https://img.wizwid.com/PImg/707021/bsc/707021453.jpg', '8', 'etc' ,'캠핑가자', '2021-12-01 22:30:56', 'y', '펠리칸 엘리트 쿨러 95QT White', '985200', '0', '20'));
			console.log(array);
			
			array.forEach(data => {
				ele.appendChild(createContent(data.imgpath, data.seq, data.type, data.writer, data.date, data.issale, data.title, data.price, data.heart, data.hit));
			});
			func();
	}
	function showmore(){
		//ajax url, senddata, 
	}
	
	function searchProduct(val){
		//redirect
		console.log(val);
		var trimVal = val.trim();
		if(trimVal === '' || trimVal === null){
			alert("검색어를 입력해주세요.");
			document.getElementById('search-bar').value = '';
			return;
		}
		//location.href='search.do&search=' + val;
	}

	function ajax(url, senddata, func1, func2){
		$.ajax({
			url:url,
			method: "post",
			data: senddata,
			success:function(datalist){ 
				func1();
				ele = document.getElementById('list');
				datalist.forEach(data => {
					ele.appendChild(createContent(data.imgpath, data.seq, data.type, data.writer, data.date, data.issale, data.title, data.price, data.heart, data.hit));
				});
				func2();
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
	<div id="header">
   		<h1>헤더 </h1>
	</div>
	
	<div class="container mainbody" id="lnb">
		<!-- 슬라이드 		
		<div class="row">
			<div class="col-xs-12">
			
			<div id="carouselExampleDark" class="carousel carousel-dark slide img-thumbnail rounded" data-bs-ride="carousel">
			  <div class="carousel-indicators">
			    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
			  </div>
			  <div class="carousel-inner">
			    <div class="carousel-item active" data-bs-interval="10000">
			      <img src="https://static.wixstatic.com/media/4411e8_d4bd43630aab4d188165eb150a350063~mv2.jpg" class="carousel-img d-block w-100" alt="...">
			      <div class="carousel-caption d-none d-md-block">
			      </div>
			    </div>
			    <div class="carousel-item" data-bs-interval="2000">
			      <img src="https://static.wixstatic.com/media/4411e8_d4bd43630aab4d188165eb150a350063~mv2.jpg" class="carousel-img d-block w-100" alt="...">
			      <div class="carousel-caption d-none d-md-block">
			      </div>
			    </div>
			    <div class="carousel-item">
			      <img src="https://static.wixstatic.com/media/4411e8_d4bd43630aab4d188165eb150a350063~mv2.jpg" class="carousel-img d-block w-100" alt="...">
			      <div class="carousel-caption d-none d-md-block">
			      </div>
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
			
			</div>
		</div>-->
		
		<!-- 검색창 & 버튼 -->
		<div class="row">
			<div class="col-lg-6">
				<form class="box" action="javascript:searchProduct(document.getElementById('search-bar').value);">
					<div id="searchgroup">
						<span class="align-middle"><input type="search" id="search-bar" name="search" placeholder="검색하실 물품명을 입력하세요." autocomplete="off"></span>
						<button type="submit" id="search-btn"><span class="align-middle fab fa-searchengin"></span></button>
					</div>
				</form>
			</div>
			
			<div class="col-lg-6" style="text-align: right;">
				<button type="button" class="side-btn side-btn-three" onclick="" style="height:50px; padding-left: 15px; padding-right: 15px;" data-bs-toggle="modal" data-bs-target="#geolocation" data-bs-placement="bottom" title="위치를 기반으로 상품을 탐색합니다"><span class="align-middle fas fa-compass"></span></button> &nbsp;
				<button type="button" class="side-btn side-btn-three" onclick="myList();" style="height:50px; padding-left: 15px; padding-right: 15px;"><span class="align-middle fas fa-user"></span></button> &nbsp;
				<button type="button" class="side-btn side-btn-three" onclick="addProduct();" style="height:50px; padding-left: 15px; padding-right: 15px;"><span class="align-middle fas fa-plus-circle"></span></button>
			</div>
		</div>
		
		<div class="row">
			<div class="col-xs-12">
				<div id="suggest" style="text-align: left; display:none;" class="col-lg-12">
					<input type="button" class="side-btn" value="전체보기" onclick="searchProduct(this.value)" style="margin-right:0.8%; border: solid 1px rgb(173, 88, 66); background-color: rgb(173, 88, 66); color : white;"><!-- select초기화 -->
					<input type="button" class="side-btn" value="캠핑 난로" onclick="searchProduct(this.value)" style="margin-right:0.8%;">
					<input type="button" class="side-btn" value="캠핑 의자" onclick="searchProduct(this.value)" style="margin-right:0.8%;">
					<input type="button" class="side-btn" value="아이스박스" onclick="searchProduct(this.value)" style="margin-right:0.8%;">
					<input type="button" class="side-btn" value="백팩" onclick="searchProduct(this.value)" style="margin-right:0.8%;">
					<input type="button" class="side-btn" value="캠핑카" onclick="searchProduct(this.value)" style="margin-right:0.8%;">
					<input type="button" class="side-btn" value="캠핑 랜턴" onclick="searchProduct(this.value)" style="margin-right:0.8%;">
					<input type="button" class="side-btn" value="카라반" onclick="searchProduct(this.value)" style="margin-right:0.8%;">
					<input type="button" class="side-btn" value="텐트" onclick="searchProduct(this.value)" style="margin-right:0.8%;">
					<input type="button" class="side-btn" value="바베큐그릴" onclick="searchProduct(this.value)" style="margin-right:0.8%;">
					<input type="button" class="side-btn" value="카페트" onclick="searchProduct(this.value)" style="margin-right:0.8%;">
					<input type="button" class="side-btn" value="캠핑세탁기" onclick="searchProduct(this.value)" style="margin-right:0.8%;">
					<input type="button" class="side-btn" value="히터" onclick="searchProduct(this.value)" style="margin-right:0.8%;">
					<input type="button" class="side-btn" value="낚시 용품" onclick="searchProduct(this.value)" style="margin-right:0.8%;">
				</div>
			</div>
		</div>
		
	</div>
	
	<div class="container mainbody">
		<div class="row"  style="margin-bottom: 1.5%;">
			<h3 class="col bold">
				중고거래 리스트
			</h3>
		
			<div class="col-lg-6 col-md-6 col-12" style="text-align: right;">
				<select id="select1" class="select">
					<option value="all" selected>모든 상품</option>
					<option value="camping">캠핑 관련 용품</option>
					<option value="etc">기타</option>
				</select>
				<select id="select2" class="select">
					<option value="status" selected>거래 상태</option>
					<option value="y">판매중</option>
				</select>
				<select id="select3" class="select">
					<option value="status" selected>최신순</option> <!-- 작동x -->
					<option value="y">정확도순</option>
				</select>
			</div>
		</div>
		<!-- 물품리스트 -->
		<div class="row" id="list">
			
		</div>
	</div>
	
	
	<!-- top -->
	<a id="top" href="#"><span id="topspan" style="color:gray; font-size: 30pt;" class="align-middle fas fa-arrow-alt-circle-up"></span></a>
	<script>
    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 500) {
                $('#top').fadeIn();
            } else {
                $('#top').fadeOut();
            }
            $("#suggest").hide(200); // 원래 400 
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
        
        $("#search-bar").focus(function(){
        	$("#suggest").slideDown(200); //원래 slidedown
        });
    });
    
    $(function() {
    	  var lnb = $("#lnb").offset().top;
    	  let fst = false;
    	  
    	  $(window).scroll(function() {
    	   
    	    var window = $(this).scrollTop();
    	    
    	    if(lnb <= window) {
    	      $("#lnb").addClass("fixed");
    	      $("#lnb").removeClass("container");
    	      //--
    	      if(fst){
    	    	 return;
    	      }
    	      fst = true;
    	      $("#suggest").animate().stop().hide();
    	    }else{
    	      $("#lnb").removeClass("fixed");
    	      $("#lnb").addClass("container");
    	      fst = false;
    	      $("#suggest").animate().stop().hide();
    	    }
    	  })
    	});
	</script>
	
	<!-- Modal -->
	<div class="modal fade" id="geolocation" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title bold" id="exampleModalLabel">위치기반 탐색</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <button type="button" class="btn-gray">위치 조회</button><br>
	        ,,geolocation 들어갈곳
	        
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn-gray" data-bs-dismiss="modal">close</button>
	        <button type="button" class="btn-gray">search</button>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>
</html>















