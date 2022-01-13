<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약정보 확인</title>
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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style type="text/css">
	.column {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 5px;
}

.grade {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 5px;
	display: flex;
    align-items: center;
    justify-content:center;
}
.grade_value{
	padding-bottom:15px;
}
.title {
	font-size: 25px;
	font-weight: bold;
}

input[type='text'] {
	width: 100%;
}

textarea {
	width: 100%;
	resize: none;
	height: 300px;
}
  .btn2 {
	display: inline-block;
	background: black;
	text-transform: uppercase;
	font-weight: 500;
	font-style: normal;
	font-size: 15px;
	font-weight: bold;
	letter-spacing: 0.3em;
	color: white;
	padding: 10px 30px 10px;
	background: black;
	text-decoration: none;
	margin: 0.625rem;
	border: none;
	border: 1px solid rgba(223, 190, 106, 0.3);
	border-radius: 5px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row mt-3">
			<div class="title">예약정보확인</div>
		</div>
		<div class="row mt-1 d-flex">
			<div class="col-3 grade">캠핑지</div>
			<div class="col-9 grade_value">
				${campName}
			</div>
		</div>
		<div class="row mt-1 d-flex">
			<div class="col-3 grade">객실이름</div>
			<div class="col-9 grade_value">
				${roomDto.room_name }
			</div>
		</div>
		<div class="row mt-1 d-flex">
			<div class="col-3 grade">결제금액</div>
			<div class="col-9 grade_value">
				${roomDto.room_price }
			</div>
		</div>
		<div class="row mt-1 d-flex">
			<div class="col-3 grade">예약자</div>
			<div class="col-9 grade_value">
				${resrvDto.user_name}
			</div>
		</div>
		<div class="row mt-1 d-flex">
			<div class="col-3 grade">예약자연락처</div>
			<div class="col-9 grade_value">
				${resrvDto.user_contact}
			</div>
		</div>
		<div class="row mt-1 d-flex">
			<div class="col-3 grade">숙박인원</div>
			<div class="col-9 grade_value">
				${resrvDto.guest_number}명
			</div>
		</div>
		<div class="row mt-1 d-flex">
			<div class="col-3 grade">예약상태</div>
			<div class="col-9 grade_value">
			<c:choose>
					<c:when test="${resrvDto.status eq 'Y'}">
					결제대기
					</c:when>
					<c:otherwise>
					결제완료/예약완료
					</c:otherwise>
			</c:choose>
			</div>
		</div>
		<div class="mt-3 reserv_row d-flex">
			<div>
					<div class="grade">체크인</div>
					<div class="grade_value">
								${resrvDto.checkin_tostr()}
					</div>
			</div>
			<div>
					<div class="grade">체크아웃</div>
					<div class="grade_value">
						
						${resrvDto.checkout_tostr()}
					</div>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col-md-12 d-flex justify-content-center">
				<button type="button" class="btn2" onclick="requestPay()">결제</button>
				<button class="btn2" onclick="window.close()">취소</button>
			</div>
		</div>
		<script>
	function requestPay() {
		IMP.init('imp30981920');
	    // IMP.request_pay(param, callback) 결제창 호출
	    IMP.request_pay({ // param
	        pg: "html5_inicis",
	        pay_method: "card",
	        merchant_uid: "${resrvDto.reservno}",
	        name: "${roomDto.room_name}",
	        amount: 100,
	        buyer_email: "gildong@gmail.com",
	        buyer_name: "홍길동",
	        buyer_tel: "010-4242-4242",
	        buyer_addr: "서울특별시 강남구 신사동",
	        buyer_postcode: "01181"
	    }, function (rsp) { // callback
	        if (rsp.success) {
	        	 // jQuery로 HTTP 요청
	            jQuery.ajax({
	                url: "{서버의 결제 정보를 받는 endpoint}", // 예: https://www.myservice.com/payments/complete
	                method: "POST",
	                headers: { "Content-Type": "application/json" },
	                data: {
	                    imp_uid: rsp.imp_uid,
	                    merchant_uid: rsp.merchant_uid
	                }
	            }).done(function (data) {
	              // 가맹점 서버 결제 API 성공시 로직
	            })
	            
	            alert("결제가 완료되었습니다.");
	          } else {
	            alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
	          }
	    });
	  }
	 </script>
	</div>
</body>
</html>