<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
	<!-- Bootstrap CSS CDN -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
	
	<link rel="stylesheet" type="text/css" href="resources/css/webfont.css">
	<script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc" crossorigin="anonymous"></script>
	
	
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" charset="UTF-8"></script>	
	
<%@ include file="/WEB-INF/views/common/header.jsp" %>



<script type="text/javascript">

function ajaxPwCheck(){

	//패스워드 입력 확인
	if($('#mypw').val() == ''){
		alert("비밀번호 확인이 필요합니다");
		$('#mypw').focus();
		return;
	}else if($('#repw').val() == ''){
		alert("비밀번호 재확인이 필요합니다");
		$('#repw').focus();
		return;
	}else{

		//확인, 재확인 패스워드가 동일한지 확인
		if($('#repw').val() != $('#mypw').val()){
			alert("두 비밀번호가 일치하지 않습니다");
			$('#repw').focus();
			return;
		}else{
		//맞는 비밀번호이면 이동
		

			$.ajax({
				type: "post",
				url: "ajaxPwCheck.do",
				data: $('#mypw').val(),
				contentType:"application/json",
				dataType:"json",
				success: function(data){
					if(data.check==true){
						location.href='memberDetail.do';
					}else{
						alert("회원정보와 비밀번호가 일치하지 않습니다");
						return;
					} 
				},
				error: function(){
					alert("서버 에러");
				}
			});
		
			
		}
	}
	
	
}
	
</script>
</head>

<style type="text/css">

.alice{
	font-family: EliceDigitalBaeum_Bold;
}

.center{
	margin: 10em auto;
}
</style>

<body>
	<div class="center" style="width:300px;">
		<h3 style="text-align:left; font-family: EliceDigitalBaeum_Bold;">내 정보 확인을 위한 <br> 본인인증</h3>
		<br>
			<input type="hidden" name="myid" value="${myid}">
			<p>
				<input type="password" name="mypw" id="mypw" style="width:300px; height: 40px;" placeholder='비밀번호 확인'>
			</p>
				<input type="password" name="repw" id="repw" style="width:300px; height: 40px;" placeholder='비밀번호 재확인'>
			<p>
			<div class="d-md-flex justify-content-md-end" style="float:right; display:inline-block;">
				<button class="btn text-white" id="select"  style="background-color:#198754; width:100px;" onclick='ajaxPwCheck()'>조회</button>
			</div>
			</p>
				
			<br>
			<br>
			<br>
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>

</script>
</html>