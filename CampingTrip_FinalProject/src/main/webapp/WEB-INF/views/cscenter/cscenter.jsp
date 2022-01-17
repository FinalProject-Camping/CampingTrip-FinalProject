<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link href="//font.elice.io/EliceDigitalBaeum.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
//페이지 로드 때 TOP5 질문 이외 모두 숨김 처리
$(document).ready(function(){
	$("ol").children("h5").hide();
	$('#RSVNCANCEL').hide();
	$('#PAYMENT').hide();
	$('#RSVNASK').hide();
	$('#CONTACT').hide();
});

//메뉴 각각 클릭시 질문 목록 표시
$(document).ready(function(){
	  $('#top').click(function(){
	    $('#TOP').show();
	    $('#RSVNCANCEL').hide();
	    $('#PAYMENT').hide();
		$('#RSVNASK').hide();
		$('#CONTACT').hide();
	  });
	});
	
$(document).ready(function(){
	  $('#rsvncancel').click(function(){
	    $('#RSVNCANCEL').show();
	    $('#TOP').hide();
	    $('#PAYMENT').hide();
		$('#RSVNASK').hide();
		$('#CONTACT').hide();
	  });
	});

$(document).ready(function(){
	  $('#payment').click(function(){
	    $('#PAYMENT').show();
	    $('#TOP').hide();
	    $('#RSVNCANCEL').hide();
		$('#RSVNASK').hide();
		$('#CONTACT').hide();
	  });
	});
	
$(document).ready(function(){
	  $('#rsvnask').click(function(){
	    $('#RSVNASK').show();
	    $('#TOP').hide();
	    $('#RSVNCANCEL').hide();
		$('#PAYMENT').hide();
		$('#CONTACT').hide();
	  });
	});	

$(document).ready(function(){
	  $('#contact').click(function(){
	    $('#CONTACT').show();
	    $('#TOP').hide();
	    $('#RSVNCANCEL').hide();
		$('#RSVNASK').hide();
		$('#PAYMENT').hide();
	  });
	});

//메뉴-질문 클릭시 그에 맞는 답변 표시

//TOP5
$(document).ready(function(){
	  $('[name=top1]').click(function(){
		  $('#top2,#top3,#top4,#top5').hide();
		  $('#top1').show();
	  });
	});

$(document).ready(function(){
	  $('[name=top2]').click(function(){
		  $('#top1,#top3,#top4,#top5').hide();
	    $('#top2').show();
	  });
	});
$(document).ready(function(){
	  $('[name=top3]').click(function(){
		$('#top1,#top2,#top4,#top5').hide();
	    $('#top3').show();
	  });
	});
$(document).ready(function(){
	  $('[name=top4]').click(function(){
		$('#top1,#top2,#top3,#top5').hide();
	    $('#top4').show();
	  });
	});
$(document).ready(function(){
	  $('[name=top5]').click(function(){
		$('#top1,#top2,#top3,#top4').hide();
	    $('#top5').show();
	  });
	});
	
//rsvncancel
$(document).ready(function(){
	  $('[name=rsvncancel1]').click(function(){
		  $('#rsvncancel2,#rsvncancel3').hide();
		  $('#rsvncancel1').show();
	  });
	});

$(document).ready(function(){
	  $('[name=rsvncancel2]').click(function(){
		  $('#rsvncancel1,#rsvncancel3').hide();
		  $('#rsvncancel2').show();
	  });
	});
	
$(document).ready(function(){
	  $('[name=rsvncancel3]').click(function(){
		  $('#rsvncancel1,#rsvncancel2').hide();
		  $('#rsvncancel3').show();
	  });
	});	

//payment
$(document).ready(function(){
	  $('[name=payment1]').click(function(){
		  $('#payment2,#payment3').hide();
		  $('#payment1').show();
	  });
	});

$(document).ready(function(){
	  $('[name=payment2]').click(function(){
		  $('#payment1,#payment3').hide();
		  $('#payment2').show();
	  });
	});
	
$(document).ready(function(){
	  $('[name=payment3]').click(function(){
		  $('#payment1,#payment2').hide();
		  $('#payment3').show();
	  });
	});
//rsvnask
$(document).ready(function(){
	  $('[name=rsvnask1]').click(function(){
		  $('#rsvnask2,#rsvnask3').hide();
		  $('#rsvnask1').show();
	  });
	});

$(document).ready(function(){
	  $('[name=rsvnask2]').click(function(){
		  $('#rsvnask1,#rsvnask3').hide();
		  $('#rsvnask2').show();
	  });
	});
	
$(document).ready(function(){
	  $('[name=rsvnask3]').click(function(){
		  $('#rsvnask1,#rsvnask2').hide();
		  $('#rsvnask3').show();
	  });
	});
//contact
$(document).ready(function(){
	  $('[name=contact1]').click(function(){
		  $('#contact2').hide();
		  $('#contact1').show();
	  });
	});

$(document).ready(function(){
	  $('[name=contact2]').click(function(){
		  $('#contact1').hide();
		  $('#contact2').show();
	  });
	});
</script>

<style type="text/css">
.cscenter_content {
	font-family: "Elice Digital Baeum",sans-serif;
	margin: 30px;
}

.cscenter_content h1 {
	color: #d49466;
	text-align: center;
	font-size: 40px;
	margin-top: 100px;
}

.cscenter_content h1 div {
	font-size: 20px;
	color: #000;
	margin-top: 10px;
}

.cscenter_faq {
	padding: 50px;
}

.cscenter_faq h2{
	font-family: "Elice Digital Baeum",sans-serif;
}

.cscenter_faq ul {
	list-style-type: none;
	float: left;
	margin-right: 100px;
	padding: 0;
	width: 200px;
	height: 270px;
	background-color: #f1f1f1;
	font-weight: bold;
}

.cscenter_faq li a {
	display: block;
	color: #000;
	padding: 8px 16px;
	text-decoration: none;
}

.cscenter_faq li a:hover {
	background-color: #555;
	color: white;
}

.cscenter_faq div {
	float: left;
	margin-top: 20px;
	background-color: #f1f1f1;
	width: 60%;
}

.cscenter_faq li {
	cursor: pointer;
	font-weight: lighter;
}

.cscenter_faq ol {
	list-style: none;
}

.cscenter_faq h5 {
	margin-top: 5px;
	margin-left: 30px;
	line-height: 25px;
	color: gray;
	font-weight: lighter;
}

.cscenter_guide {
	padding: 50px;
}

.cscenter_guide h2{
	font-family: "Elice Digital Baeum",sans-serif;
}

.cscenter_partnership {
	padding: 50px;
}

.cscenter_partnership h2{
	font-family: "Elice Digital Baeum",sans-serif;
}
</style>
</head>

<body>
	<div class="cscenter_content">
		<h1>
			<i class="fas fa-headphones"></i> CampingTrip 고객센터
			<div>무엇이든 물어보세요 :D</div>
		</h1>
	</div>

	<div class="cscenter_faq">
		<h2 style="clear: both;">자주 묻는 질문</h2>
		<ul>
			<li id="top"><a href="#TOP">TOP5</a></li>
			<br>
			<li id="rsvncancel"><a href="#RSVNCANCEL">예약 취소</a></li>
			<br>
			<li id="payment"><a href="#PAYMENT">결제영수증</a></li>
			<br>
			<li id="rsvnask"><a href="#RSVNASK">예약문의</a></li>
			<br>
			<li id="contact"><a href="#CONTACT">고객센터 이용문의</a></li>
		</ul>

		<div id="TOP">
			<ol>
				<li name="top1">🔸 1. 예약을 취소하고 싶어요.</li>
				<br>
				<h5 id="top1">
					예약자 본인이 직접 예약확인/취소 가능합니다.<br> 예약/결제 당시 안내된 취소/환불 규정에 따라 처리되며,
					취소 수수료가 발생 시 취소 수수료를 차감한 금액으로 환불 처리 됩니다.
				</h5>

				<li name="top2">🔸 2.천재지변으로 인한 예약취소는 어떻게 하나요?</li>
				<br>
				<h5 id="top2">
					일반적인 우천에 의한 예약 취소 및 변경 불가합니다.<br> 태풍 등 기상 특보 시, 입실 당일 현장 날씨 및
					캠핑장/펜션의 정책에 따라 연기 또는 취소 결정됩니다.<br> 입실 당일 오전에 캠핑장/펜션에 연락하셔서 안내
					받으시기 바랍니다.
				</h5>

				<li name="top3">🔸 3.입실일을 변경하고 싶어요</li>
				<br>
				<h5 id="top3">예약 이용일 변경 불가합니다. (취소수수료 확인 후) 기존 예약건 취소 및 재예약하셔야
					합니다.</h5>

				<li name="top4">🔸 4.객실타입을 변경하고 싶어요</li>
				<br>
				<h5 id="top4">고객센터(070-0000-0000)로 문의하시기 바랍니다.</h5>

				<li name="top5">🔸 5.취소수수료 계산 기준은 어떻게 되나요?</li>
				<br>
				<h5 id="top5">
					취소수수료는 숙소별로 상이합니다.<br> 취소수수료는 예약시점과는 무관하게 '입실일로부터 남은 날짜' 기준으로
					부과됩니다.<br> 결제금액에서 취소수수료를 차감한 금액으로 환불 처리됩니다.<br> 환불 예정금액은
					조회 시점 및 실제 환불 진행 시점에 따라 달라질 수 있으므로, <br> 예약/결제 진행 당시 안내된 취소/환불
					규정을 꼭 숙지해 주시길 바랍니다.
				</h5>
			</ol>
		</div>

		<div id=RSVNCANCEL>
			<ol>
				<li name="rsvncancel1">🔸 1.예약완료후 취소를 바로했는데 수수료가 나왔어요</li>
				<br>
				<h5 id="rsvncancel1">
					취소 수수료는 예약 시점과는 무관합니다.<br> '입실일/이용일로부터 남은 날짜' 기준으로 기준으로 (예약 후
					바로 취소해도) 수수료 부과되니,<br> (이용일 10일 이내 예약 건은 특히) 신중한 예약 바랍니다.<br>
				</h5>

				<li name="rsvncancel2">🔸 2.입실 날짜를 변경하고 싶어요</li>
				<br>
				<h5 id="rsvncancel2">
					예약 이용일 변경 불가합니다.<br> (취소수수료 확인 후) 기존 예약건 취소 및 재예약하셔야 합니다.
				</h5>

				<li name="rsvncancel3">🔸 3.예약취소했는데 언제 환불 되나요?</li>
				<br>
				<h5 id="rsvncancel3">
					취소 신청 후 간편결제 사업자 또는 은행/신용카드사에 따라 환불 절차에 일정 시간이 소요됩니다.<br> 영업일
					기준(토/일/공휴일 제외)으로 실시간 계좌이체 2~3일, 신용카드 3~5일 소요됩니다.
				</h5>

			</ol>
		</div>

		<div id="PAYMENT">
			<ol>
				<li name="payment1">🔸 1.현금영수증 발급받고 싶어요</li>
				<br>
				<h5 id="payment1">
					[간편계좌이체 - 페이플] 결제 단계에서 고객님께서 발급신청을 하신 경우, 고객님께서 입력하신 정보로 자동으로
					발행됩니다.<br> (영수증은 발급신청 혹은 주문신청 시 입력하신 이메일로 발송되었습니다.)<br>
					예약 시 현금영수증을 신청하지 않은 경우, 법령에 의거 CampingTrip에서 자진 발행을 진행하고 있습니다.
				</h5>

				<li name="payment2">🔸 2.결제 영수증 발급받고 싶어요.</li>
				<br>
				<h5 id="payment2">결제 영수증은 개별 카드사의 결제 내역 또는 결제 대행사 페이지에서 고객님께서
					직접 발급 가능합니다.</h5>

				<li name="payment3">🔸 3.계좌 등록 후 은행에서 문자가 왔어요</li>
				<br>
				<h5 id="payment3">
					간편결제수단에 계좌 등록 시 은행에서 자동이체 서비스가 등록되었다는 문자가 발송될 수 있습니다.<br> 매달
					일정 금액이 자동이체 되는 것이 아니고,<br> 고객님께서 예약 결제하신 1회성 결제 내역이니 안심하고 이용해
					주시길 바랍니다.
				</h5>
			</ol>
		</div>

		<div id="RSVNASK">
			<ol>
				<li name="rsvnask1">🔸 1.예약 확인은 어떻게 하나요?</li>
				<br>
				<h5 id="rsvnask1">상단 "예약확인/취소" 혹은 "MYPAGE"에서 가능합니다.</h5>

				<li name="rsvnask2">🔸 2.미성년자도 약이 가능한가요?</li>
				<br>
				<h5 id="rsvnask2">미성년자는 예약이 불가하며, 보호자 없이 숙박 시설 이용 불가합니다.</h5>

				<li name="rsvnask3">🔸 3.연박 예약도 가능한가요?</li>
				<br>
				<h5 id="rsvnask3">연박 예약 시 체크인(입실일)-체크아웃(퇴실일) 날짜 지정 후 예약하시면 됩니다.
				</h5>
			</ol>
		</div>

		<div id="CONTACT">
			<ol>
				<li name="contact1">🔸 1.고객센터 연결 지연 시 어떻게 하나요?</li>
				<br>
				<h5 id="contact1">
					일부 시간대에는 통화량이 많아 상담사 연결이 지연 될 수 있습니다.<br> 순차적으로 상담 드리니 양해
					부탁드립니다.
				</h5>
				<li name="contact2">🔸 2.내 업체를 CampingTrip에 입점하고 싶어요.</li>
				<br>
				<h5 id="contact2">CampingTrip 마케팅팀 E. eoffhddl@gmail.com T.070-0000-0000로 문의해 주시면 친절하게 안내드리겠습니다.
					감사합니다.</h5>
			</ol>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<div class="cscenter_guide">
		<h2 style="clear: both;">고객센터 안내</h2>
		운영시간 : <br><br> &nbsp;&nbsp;평일 - 오전 9시 ~ 오후 5시 30분 <br> <br>
		&nbsp;&nbsp;주말,공휴일 - 휴무 <br> <br> 점심시간 : 오후 1시 ~2시 <br> <br> 메일문의 : eoffhddl@gmail.com
	</div>

	<div class="cscenter_partnership">
		<h2 style="clear: both;">제휴 문의</h2>
		입점문의 / 상품관리 문의 등 제휴 고객센터 <br> <br> 입점문의 eoffhddl@gmail.com <br>
		<br> 상품관리 등 제휴사 문의 capingtrip_partner@gmail.com
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>