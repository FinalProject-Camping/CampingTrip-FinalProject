<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event</title>
<link href="//font.elice.io/EliceDigitalBaeum.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.0/TweenMax.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    var gift;
    var present = [1, 2, 3, 4, 5, 6]

    iniGame = function (num) {
        gift = num;
        TweenLite.killTweensOf($(".board_on"));
        TweenLite.to($(".board_on"), 0, { css: { rotation: rotationPos[gift] } });
        TweenLite.from($(".board_on"), 5, { css: { rotation: -3000 }, onComplete: endGame, ease: Sine.easeOut });
        console.log("gift 숫자 : " + (gift + 1) + "rotationPos" + rotationPos);
    }

    var rotationPos = new Array(60, 120, 180, 240, 300, 360);

    TweenLite.to($(".board_on"), 360, { css: { rotation: -4000 }, ease: Linear.easeNone });
    function endGame() {
        var copImg = "<%=request.getContextPath()%>/resources/img/coupon" + (gift + 1) + ".png";
        console.log("이미지 : " + copImg);

		var pointTemp = present[gift]
        var pointArray = new Array(100, 500, 1000, 2000, 3000, 5000);
		
        $("#popup_gift .lottery_present").text(function () { return "축하드립니다." + pointArray[gift] + "점 당첨 되셨습니다."});
        $('<img  src="' + copImg + '" />').prependTo("#popup_gift .lottery_present");
        setTimeout(function () { openPopup("popup_gift"); }, 1000);
        
        
        /* console.log("pointId = " + ${loginId}); */
		
        
        
        var value = pointArray[gift];
        
		/* console.log("point = " + pointArray[gift]) */
        
        $.ajax({
    		url:"event_insert_point.do",
			method:"post",
			dataType: "json",
			data: {
				point : value,
			},
			success:function(){
				console.log("success")
			}
		});
    }
            //TEST
        	/*     	POINTID VARCHAR2(50) NOT NULL,			-- 유저 아이디
        	    	POINTDETAIL VARCHAR2(1000) NOT NULL,	-- 포인트 내역
        	    	POINTGETDATE DATE NOT NULL,				-- 포인트 획득일
        	    	GETPOINT NUMBER NOT NULL,				-- 획득 포인트
        	    	USEPOINT NUMBER NOT NULL,				-- 사용 포인트
			 */
        	    	
        	    	/*
        	    	1.pointId -> 가져올 수 있음
        	    	2.pointDetail -> ROULLETTE
        	    	3.pointGetDate -> 획득했을 때 해당 날짜
        	    	4.getPoint -> 얻은 포이트 
        	    	5.usePoint -> 0
        	    	6.totalPoint -> 0
        	    	7.pointImg -> copImg
        	    	
        	    	이런 필드들을 가지고 eventDto를 만들어서 do 에 넣어주면 됨
        	    	*/
        	        
				/*         
				$("#popup_gift .lottery_present").text(function () {         	
        	         	$.ajax({
        					type:"post",
        					url:"event_insert_point.do",
        					data: eventDto				JSON.stringify(mbrInfo),
        					contentType:"application/json",
        					dataType:"json",
        					success:function(msg){
        						//alert(JSON.stringify(msg));
        						if(msg.check==true){
        							alert("회원가입에 성공하였습니다.");
        							location.href="loginform.do";
        						}else{
        							alert("회원가입에 실패하였습니다. 다시 시도해주세요.");
        							location.href="registerform.do";
        						}
        					},
        					error:function(){
        						alert("통신 실패");
        					}
        				});
        		}
				*/

    $(".popup .btn").on("click", function () {
        location.reload();
    });
    function openPopup(id) {
        closePopup();
        $('.popup').slideUp(0);
        var popupid = id
        $('body').append('<div id="fade"></div>');
        $('#fade').css({
            'filter': 'alpha(opacity=60)'
        }).fadeIn(300);
        var popuptopmargin = ($('#' + popupid).height()) / 2;
        var popupleftmargin = ($('#' + popupid).width()) / 2;
        $('#' + popupid).css({
            'margin-left': -popupleftmargin
        });
        $('#' + popupid).slideDown(500);
    }
    function closePopup() {
        $('#fade').fadeOut(300, function () {
            // $(".player").html('');
        });
        $('.popup').slideUp(400);
        return false
    }
    $(".close").click(closePopup);

});



$(function () {
    var clicked = 0;
    for (i = 1; i < 7; i++) {
        var pictures = "<%=request.getContextPath()%>/resources/img/coupon" + i + ".png";
        $(".board_on").append('<img  src="' + pictures + '" />');
    }

    $(".join").on("mousedown", function () {
        if (clicked <= 0) { iniGame(Math.floor(Math.random() * 6)); }
        else if (clicked >= 1) { event.preventDefault(); alert("오늘은 이벤트에 이미 참여 하셨습니다."); }
        clicked++
    });
})
</script>
<style type="text/css">
.event_content01 {
	margin: 30px;
}

.event_content01 h1 {
	font-family: "Elice Digital Baeum",sans-serif;
	color: #d49466;
	text-align: center;
	font-size: 40px;
	margin-top: 100px;
}

.event_content01 h1 div {
	font-size: 20px;
	color: #000;
	margin-top: 10px;
}

.coupon_box {
	font-family: "Elice Digital Baeum",sans-serif;
	padding: 30px;
	border: 1px solid #f1f1f1;
	width: 95%;
	height: 70px;
	line-height: 25px;
	text-align: center;
	background-color: #f1f1f1;
}

.coupon_box div{
	font-size: 25px;
	font-weight: bold;
	display: inline-block;
}

.coupon_box .detail_move {
	margin-top: 30px;
	font-size: 20px;
}

.coupon_box .detail_move a {
	color: #d49466;
}

@font-face { font-family: 'GmarketSansMedium'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff'); font-weight: normal; font-style: normal; }
#wrap{  background-color:#ffffff;  position: relative; overflow: hidden;}
#wrap #gameContainer{width:508px; height:671px; text-align: center; position: relative;margin:0px auto;}
/* #wrap #gameContainer h1{} */
#wrap #gameContainer .obj{position: absolute;}
#wrap #gameContainer .board_start{
	font-family: "Elice Digital Baeum",sans-serif;  
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
    font-size: 30px;
position:absolute; left:165px; top:210px;z-index:9; width:150px; border-radius:100px;}
#wrap #gameContainer .board_start
img{width:100%;}
#wrap #gameContainer .board_bg{width:508px; height:508px; top:40px; left:0px; z-index: 2;}
#wrap #gameContainer .board_bg img{width:100%;}
#wrap #gameContainer .board_on{width:508px; height:508px; top:40px; left:0px; z-index: 3; background-image:url('${pageContext.request.contextPath}/resources/img/roulette_circle_bg.png');    background-size: 508px;
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
.popup  .close{ display:inline-block; width:150px; height:50px; line-height:50px; color:#fff; background:#333; margin: 30px 0 0;}
</style>
</head>

<body>
	<!-- 페이지 상단 -->
<c:set var="loginId" value='<%=session.getAttribute("id")%>' />
<c:set var="loginName" value='<%=session.getAttribute("name")%>' />

	<div class="event_content01">
		<h1>
			<i class="fas fa-gifts"></i> EVENT !
			<div>CampingTrip 룰렛 이벤트</div>
		</h1>
		<div class="coupon_box">
			<div>${loginName} 님! <span> 룰렛을 돌려 포인트를 획득하세요 !</span></div><br>
			<div class="detail_move"><a href="eventdetail.do">포인트 내역 보러가기>></a></div>
		</div>
		<br>

		<!-- 룰렛 기능구현 -->
		<div id="wrap">
			<div id="gameContainer">
				<div class="board_bg"></div>
				<div class="board_start join">START</div>
				<div class="board_on obj"></div>

			</div>
			<div id="popup_gift" class="popup">
				<div class="lottery_present"></div>
				<a href="javascript:;" class="close">닫기 </a>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>