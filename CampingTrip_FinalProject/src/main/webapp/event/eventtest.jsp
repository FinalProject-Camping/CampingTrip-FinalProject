<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style type="text/css">

@font-face { font-family: 'GmarketSansMedium'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff'); font-weight: normal; font-style: normal; }
#wrap{  background-color:#ffffff;  position: relative; overflow: hidden;}
#wrap #gameContainer{width:508px; height:671px; text-align: center; position: relative;margin:0px auto;}
#wrap #gameContainer h1{}
#wrap #gameContainer .obj{position: absolute;}
#wrap #gameContainer .board_start{  
    padding: 10px;
    background: #f00;
    text-align: center;
    vertical-align: middle; 
  line-height: 150px; 
  border: 1px solid #000;
    color: #fff;   
    background: #f00;
    text-align: center;
    vertical-align: middle;
    font-weight: bold;
position:absolute; left:165px; top:210px;z-index:9; width:150px; border-radius:100px;}
#wrap #gameContainer .board_start
img{width:100%;}
#wrap #gameContainer .board_bg{width:508px; height:508px; top:40px; left:0px; z-index: 2;}
#wrap #gameContainer .board_bg img{width:100%;}
#wrap #gameContainer .board_on{width:508px; height:508px; top:40px; left:0px; z-index: 3; background-image: url('//img.babathe.com/upload/specialDisplay/htmlImage/2019/test/roulette_circle_bg.png');    background-size: 508px;
}
#wrap #gameContainer .board_on img{position:absolute; width:100px;top:115px; height:100px;}
#wrap #gameContainer .board_on img:nth-child(1){    left: 55px;  transform: rotate( -60deg );  top: 120px;}
#wrap #gameContainer .board_on img:nth-child(2){left: 62px;  transform: rotate( -113deg );  top: 286px;  }
#wrap #gameContainer .board_on img:nth-child(3){  left: 208px;  top: 372px; transform: rotate(-180deg);}  
#wrap #gameContainer .board_on img:nth-child(4){left: 351px; top: 286px;  transform: rotate(-245deg);}
#wrap #gameContainer .board_on img:nth-child(5){ left: 351px;  top: 125px;  transform: rotate(-292deg);   }
#wrap #gameContainer .board_on img:nth-child(6){  left: 205px;  top: 42px;  transform: rotate(5deg); }  

#wrap #gameContainer .obj.board_arrow{width:90px; height:105px; top:0px; left:195px; z-index: 5;}
#wrap #gameContainer .char1{width:259px; height:246px; top:400px; left:90px; z-index: 1;}
#wrap #gameContainer .char2{width:175px; height:198px; top:449px; left:600px; z-index: 1;}
#wrap #gameContainer .char3{width:112px; height:108px; top:540px; left:550px; z-index: 3;}
#wrap #gameContainer .txt1{width:420px; height:30px; bottom:20px; left:260px; z-index: 3;}

.popup {display: none; position: fixed; left: 50%; z-index: 99999; text-align: center; background:#fff; font-size:20px; color:#000;}
#fade {display: none;background: #000;position: fixed;left: 0;top: 0;width: 100%;height: 100%;opacity: .60;z-index: 9999;}
#popup_gift{width:475px; height:505px; top:120px;}
#popup_gift .lottery_present {text-align:center;}
#popup_gift .lottery_present img{ display:block; margin: 50px auto 30px;}

#popup_fail{width:475px; height:505px; top:120px;}
.popup  .close{ display:inline-block; width:150px; hegiht:50px; line-height:50px; color:#fff; background:#333; margin: 30px 0 0;} 
.detail{
position:absolute;
top:105px;
left:900px;
line-height:85px;
font-size:13px;
}

.coupon{
border: 1px solid black;
width:250px;
height:100px;
position:absolute;
}

.download{
border: 1px solid orange;
width:250px;
height:25px;
position:absolute;
text-align:center;
font-weight:bold;
color:orange;
}

</style>
<script>
$(document).ready(function() {
	  var gift;
	       var  present =[ 1,2,3 , 4,5,6 ]

	  iniGame = function(num){
	    gift = num;
	    TweenLite.killTweensOf($(".board_on"));
	    TweenLite.to($(".board_on"), 0, {css:{rotation:rotationPos[gift]}});
	    TweenLite.from($(".board_on"),5, {css:{rotation:-3000}, onComplete:endGame, ease:Sine.easeOut});
	               console.log("gift 숫자 : "+ (gift +1) +"rotationPos" + rotationPos );
	  }

	  var rotationPos = new Array(60,120,180,240,300,360);

	  TweenLite.to($(".board_on"), 360, {css:{rotation:-4000}, ease: Linear.easeNone});
	  function endGame(){
	              var  copImg= "http://img.babathe.com/upload/specialDisplay/htmlImage/2019/test/coupon"+( gift +1) + ".png";
	                console.log("이미지 : " + copImg );

	                     $("#popup_gift .lottery_present" ).text(function( ) {   return "축하드립니다."+present [gift ] + " 룰렛숫장"+ ( gift +1)   + " 당첨 되셨습니다.";    });
	                          $( '<img  src="' + copImg+ '" />' ).prependTo("#popup_gift .lottery_present");
	  setTimeout(function() {openPopup("popup_gift"); }, 1000);
	}

	  $(".popup .btn").on("click",function(){
	    location.reload();
	  });
	  function openPopup(id) {
	    closePopup();
	    $('.popup').slideUp(0);
	    var popupid = id
	    $('body').append('<div id="fade"></div>');
	    $('#fade').css({
	    'filter' : 'alpha(opacity=60)'
	    }).fadeIn(300);
	    var popuptopmargin = ($('#' + popupid).height()) / 2;
	    var popupleftmargin = ($('#' + popupid).width()) / 2;
	    $('#' + popupid).css({
	      'margin-left' : -popupleftmargin
	    });
	    $('#' + popupid).slideDown(500);
	  }
	  function closePopup() {
	    $('#fade').fadeOut(300, function() {
	      // $(".player").html('');
	    });
	    $('.popup').slideUp(400);
	    return false
	  }
	  $(".close").click(closePopup);

	});



	$(function() {
	  var clicked  =0;
	  for(i=1; i<7; i++){
	    var  pictures = "http://img.babathe.com/upload/specialDisplay/htmlImage/2019/test/coupon"+ i  + ".png";
	    $(".board_on").append('<img  src="' + pictures + '" />');
	  }

	  $(".join").on("mousedown",function(){
	    if( clicked <= 0){    iniGame(Math.floor(Math.random() *6));    }
	    else  if( clicked >=1 ){    event.preventDefault(); alert( "이벤트 참여 하셨습니다."); }
	    clicked ++
	  });
	})
</script>
</head>
<body style="margin-left:300px;">
<h2>이달의 이벤트</h2>
<br>

<!-- 페이지 상단 -->
<div style="border: 1px solid #f1f1f1; width:800px; height:70px; line-height:25px; background-color:#f1f1f1;">
<br>
		<div style="font-size:25px; font-weight:bold; float:left;  margin-left:100px;">
			MY COUPON
		</div>
	<!-- 000에 ID, 총 포인트 값 가져오기 -->	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	000 님의 총 포인트는 000점 입니다. 
	<div class="detail"><a href="eventdetail.jsp">📜&nbsp;상세내역 보러가기>></a></div>
</div>
<br>

<!-- 룰렛 기능구현(임시로 영역 구분)-->

<!-- <canvas id="canvas" style="width: 800px; height:500px; border: 1px solid black;">룰렛 기능 넣기</canvas> -->
<div id="wrap">
<div id="gameContainer">  
        <div class="board_start join">시작버튼</div>
        <div class="board_on obj"></div>
        
      
</div>
<div id="popup_gift" class="popup">
  <div class="lottery_present"></div>
        <a href="javascript:;" class="close">닫기 </a>
</div>
</div>

<!-- 쿠폰존 -->
<br><br>
<h3>불멍하조 전용혜택</h3>
<hr style="width:800px; float:left;">

<br><br>
<div class="coupon" style="left:400px;">
로고 나오면 로고랑 같이 넣기(이미지or text)
</div>
<div class="coupon" style="left:750px;">
로고 나오면 로고랑 같이 넣기(이미지or text)
</div>


<div class="download" style="left:400px; top:930px;">
쿠폰받기⬇
</div>
<div class="download" style="left:750px; top:930px;">
쿠폰받기⬇
</div>

<br><br><br><br><br><br><br><br>
<h3>제휴회원 전용혜택</h3>
<hr style="width:800px; float:left;">

<br><br>
<div class="coupon" style="left:400px;">
로고 나오면 로고랑 같이 넣기(이미지or text)
</div>
<div class="coupon" style="left:750px;">
로고 나오면 로고랑 같이 넣기(이미지or text)
</div>

<div class="download" style="left:400px; top:1205px;">
쿠폰받기⬇
</div>
<div class="download" style="left:750px; top:1205px;">
쿠폰받기⬇
</div>

<br><br><br><br><br><br><br><br><br>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>