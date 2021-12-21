<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 마이페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

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

/* @media screen and (max-width: 767px) { #mainbody { font-size: 11pt; }}
@media screen and (min-width: 768px) and (max-width: 991px) { #mainbody { font-size: 12pt; }}
@media screen and (min-width: 992px) and (max-width: 1199px) { #mainbody { font-size: 13pt; }}
@media screen and (min-width: 1200px) and (max-width: 1399px) { #mainbody { font-size: 13pt; }}
@media screen and (min-width: 1400px) { #mainbody { font-size: 14pt; } .title{font-size: 18pt;}}

#mainbody{font-family: NanumBarunGothic; } */

/* body is the flex-container */
body {
	display: flex;
	min-height: 100vh;
	overflow-x: hidden;
}
[id="sidebar"] {
	width: 20rem;
}
[id="wrapper"] {
	flex: 1;
}

/* small screens */
@media (max-width: 767px) {
	[id="sidebar"] {
		position: absolute;
		z-index: -1;
	}
	[id="wrapper"] {
		-webkit-transform: translateX(0) translateZ(0);
		transform: translateX(0) translateZ(0);
		-webkit-transition: -webkit-transform .2s;
		transition: transform .2s;
		will-change: transform;
	}
	[id="wrapper"]:not(.is-closed) {
		-webkit-transform: translateX(20rem);
		transform: translateX(20rem);
	}

	/* Button deco */
	[id="wrapper"] > button {
		display: block;
		z-index: 1;
		height: 3.5rem; width: 3.5rem;
		background-color: transparent;
		background-image: -webkit-gradient(linear, left top, right top, from(#333), to(#333)), -webkit-gradient(linear, left top, right top, from(#333), to(#333)), -webkit-gradient(linear, left top, right top, from(#333), to(#333));
		background-image: -webkit-linear-gradient(left, #333, #333), -webkit-linear-gradient(left, #333, #333), -webkit-linear-gradient(left, #333, #333);
		background-image: linear-gradient(to right, #333, #333),
			linear-gradient(to right, #333, #333),
			linear-gradient(to right, #333, #333);
		background-position: center top, center, center bottom;
		background-repeat: no-repeat;
		-webkit-background-size: 3.5rem .9rem;
		        background-size: 3.5rem .9rem;
		padding: 0;
		outline: 0;
		border: 0;
		cursor: pointer;
		-webkit-tap-highlight-color:rgba(0,0,0,0);
	}
}

/* Navigation deco */
[id="navigation"] a {
	display: block;
	padding: 10px;
	margin-bottom: 2px;
	text-decoration: none;
	background: rgba(255,255,255, 0.1);
}

/* Global deco */
* {
	box-sizing: border-box;
}
html {
	font-size: 62.5%;
}
body {
	margin: 0;
	padding: 0;
	background: #eee;
	color: #fff;
	font-size: 1.6em;
	font-family: "Century Gothic", helvetica, arial, sans-serif;
}
a {
	color: #fff;
}
a:hover{
	color: white;
}
[id="sidebar"] {
	background: rgb(161, 126, 85);
	color: #ddd;
}
[id="sidebar"] h2 {
	text-align: center;
}
[id="wrapper"] {
  min-height: 100vh;
	padding: 2rem;
	background-color: white;
	color: #333;
}

</style>

<script type="text/javascript">

	document.addEventListener("DOMContentLoaded", ()=>{
		
		
		
		
		
	});
	
	
	
	
	// config
    var maxBreakpoint = 767; // maximum breakpoint
    var targetID = 'wrapper'; // target ID (must be present in DOM)
    var triggerID = 'toggle-nav'; // trigger/button ID (will be created into targetID)

    // targeting navigation
    var n = document.getElementById(targetID);

    // nav initially closed is JS enabled
    n.classList.add('is-closed');

    // global navigation function
    function navi() {
      // create a switch button, and toggle class
      if (window.matchMedia("(max-width:" + maxBreakpoint + "px)").matches && document.getElementById(triggerID) == undefined) {
        n.insertAdjacentHTML('afterBegin', '<button id=' + triggerID + ' title="open/close navigation"></button>');
        t = document.getElementById(triggerID);
        t.onclick = function() {
          n.classList.toggle('is-closed');
        }
      }
      // when big screen, delete switch button, and toggle navigation class
      var minBreakpoint = maxBreakpoint + 1;
      if (window.matchMedia("(min-width: " + minBreakpoint + "px)").matches && document.getElementById(triggerID)) {
        document.getElementById(triggerID).outerHTML = "";
      }
    }
    navi();

    // when resize or orientation change, reload function
    window.addEventListener('resize', navi);
	
	
	
	
	
</script>


</head>
<body>
<br><br>
<!-- 	<br><br>
	<div class="container" id="mainbody">
		<div class="row">
			<div class="col">
				<nav class="nav flex-column" style="width: 100%;">
					<a class="nav-link active" aria-current="page" href="#">Active</a>
					<a class="nav-link" href="#">Link</a> <a class="nav-link" href="#">Link</a>
					<a class="nav-link disabled">Disabled</a>
				</nav>
			</div>
			<div class="">
			
			</div>

		</div>
	</div> -->
	<div class="container">
	<div class="row">
	<aside id="sidebar">
    <nav role="navigation" id="navigation">
      <a href="#">내 중고게시글</a>
      <a href="#">좋아요 리스트</a>
      <a href="#">대화 내역</a>
      <a href="#">거래예약 현황</a>
    </nav>
  </aside>

  <div id="wrapper">
    <header id="header">
      <h1></h1>
    </header>

    <div id="main">
    </div>

    <footer id="footer">
      <p></p>
    </footer>
  </div>
  <!-- /wrapper -->
  </div>
	</div>
</body>
</html>


























