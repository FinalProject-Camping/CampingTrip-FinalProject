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
/* 
$(document).ready(function(e){
	$('#logout').click(function(){
		
		//패스워드 입력 확인
		if($('#mypw').val() == ''){
			alert("비밀번호 확인이 필요합니다");
			$('#mypw').focus();
			return;
		}else if($('#repw').val() == ''){
			alert("비밀번호 재확인이 필요합니다");
			$('#repw').focus();
			return;
		}
		
		//확인, 재확인 패스워드가 동일한지 확인
		if($('#repw').val() != $('#mypw').val()){
			alert("두 비밀번호가 일치하지 않습니다");
			$('#repw').focus();
			return;
		}
		
		//맞는 비밀번호인지 확인
		$.ajax({
			url: "ajaxEnabledUpdate.do",
			type: "POST",
			data: $('#delFrm').serializeArray(),
			success: function(data){
				console.log(data);
				if(data.check==true){
					//탈퇴
					alert('휴면계정으로 전환되었습니다.');
					//data에 form을 보냇기때문에 form에서 지정한 action으로 이동하게 됨.
					//location.href="/controller";
				}else{
					alert("회원정보와 비밀번호가 일치하지 않습니다");
					return;
				} 
			},
			error: function(){
				alert("서버 에러");
			}
		});
	});
});
	 */
	 

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
	 						//패스워드 맞게 입력했으면 회원탈퇴처리 ajax 호출
	 						$.ajax({
	 							type: "post",
	 							url: "ajaxEnabledUpdate.do",
	 			 				contentType:"application/json",
	 			 				dataType:"json",
	 							success: function(data){
	 								console.log(data);
	 								if(data.check==true){
	 									//탈퇴
	 									alert('휴면계정으로 전환되었습니다.');
	 			 						location.href='/controller';
	 								}else{
	 									alert("회원탈퇴처리가 실패했습니다. 관리자에게 문의하세요.");
	 									return;
	 								} 
	 							},
	 							error: function(){
	 								alert("서버 에러");
	 							}
	 						});
	 						
	 					//비밀번호가 틀렸을 경우 회원탈퇴처리하지않음						
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
		<h3 style="text-align:left; font-family: EliceDigitalBaeum_Bold;">회원 탈퇴를 위한 <br> 본인인증</h3>
		<br>
			<input type="hidden" name="myid" value="${myid}">
			<p>
				<input type="password" name="mypw" id="mypw" style="width:300px; height: 40px;" placeholder='비밀번호 확인'>
			</p>
				<input type="password" name="repw" id="repw" style="width:300px; height: 40px;" placeholder='비밀번호 재확인'>
			<p>
			<div class="d-md-flex justify-content-md-end" style="float:right; display:inline-block;">
				<button class="btn text-white" id="logout"  style="background-color:#198754; width:100px;" onclick='ajaxPwCheck()'>탈퇴하기</button>
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