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
<script type="text/javascript">

	function indexForm(){
		location.href="logincontroller.jsp?command=index";
	}
	
	function reregistForm(){
		var chk = document.getElementsByName("myid")[0].title;
		var pw = $('#pw').val();
		var repw = $('#repw').val();
		var phone = $('#phone').val();
		if(chk=="n"){
			alert("아이디 중복확인이 필요합니다.");
			document.getElementsByName("myid")[0].focus();
		}else if(pw.trim()=="" || pw==null || repw.trim()=="" || repw==null || phone.trim()=="" || phone==null){
			alert("필수정보를 모두 입력하세요.");
		}else if(phone.length < 11){
			alert("휴대폰 번호를 확인하세요.");
		}else if($('#id-validate').css('display') == 'block'  || $('#pw-validate').css('display') == 'block'){
			alert("올바른 입력 정보가 아닙니다.")
		}else{
			location.href="logincontroller.jsp?command=reregistform";			
		}
		
	}
	
	function idChk(){
		var inputId = $('#myid').val();
		if(inputId.trim()==" " || inputId==null ){
			alert("아이디를 입력해주세요");
		}else{
			//console.log(inputId);
			//console.log(JSON.stringify(inputId),);
			//var target = "logincontroller.jsp?command=idchk&id="+doc.value.trim();
			//open(target,"","width=200,height=200");
			$.ajax({
				type:"post",
				url:"ajaxIdChk.do",
				data: inputId,//JSON.stringify(inputId),
				contentType:"application/json",
				dataType:"json",
				success:function(msg){
					
					if(msg.check==true){
						alert("사용가능한 아이디입니다.");
						$('#myid').attr('title','y');
						$('#id-validate').css('display','none');
						//location.href="list.do";
					}else{
						alert("사용하실 수 없는 아이디입니다.");
						$('#myid').attr('title','n');
						$('#id-validate').css('display','block');
						//$("#loginChk").show();
						//$("#loginChk").html("ID 혹은 PW가 잘못되었습니다.");
					}
				},
				error:function(){
					alert("통신 실패");
				}
			});
			
			
		}
	}
	
	
	
	//ajax ee
	
	function idChkConfirm(){
		var chk = document.getElementsByName("myid")[0].title;
		if(chk=="n"){
			alert("아이디 중복확인이 필요합니다.");
			document.getElementsByName("myid")[0].focus();
		}
	}
	
	//비밀번호 재확인 조건
	function keyevent(obj) {
		//비밀번호
		var mypw = $("#pw").val();
		//재확인비밀번호
		var repw = obj.value;
			console.log(mypw);
			console.log(repw);
		if(mypw != repw){
			$('#pw-validate').css('display','block');
		}else{
			$('#pw-validate').css('display','none');
		}
	}
	
	//중복확인 버튼 활성화 조건: 아이디란이 비어있거나 공백을 입력하면 활성화 되지 않는다
	function idevent(obj){
		var myid = $("#myid").val();
		
		if(myid != null && myid != ""){
			$('#idchkbtn').removeAttr('disabled');
		}else{
			$('#idchkbtn').attr('disabled','disabled');
		}

		//아이디 수정 시 다시 중복확인
		$('#myid').attr('title','n');
	}
	
	//전화번호에 숫자만 입력되도록
	$(document).on("keyup", "input[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );})
	
</script>



</head>
<style type="text/css">
.center{
	margin: 4em auto;
}
</style>


<%@ include file="/WEB-INF/views/common/header.jsp" %>
<body>
	<div class="center" style="width:300px;">
	
		<h3 style="text-align:left;">회원가입</h3>
		<form action="logincontroller.jsp" method="post">
			<input type="hidden" name="command" value="insertuser">
		<br>
		
		<div style="text-align:left; font-size: 12pt;">아이디</div>
		<div id="id-validate" class="validate-false" style="text-align:right; font-size: 8pt; color:red; display:none;">*이미 존재하는 ID 입니다</div>
			<input type="text" id="myid" onkeyup="idevent(this);" name="myid" title="n" style="float:left; width:210px; height: 40px; font-size: 10pt;">
			<input type="button" id="idchkbtn" value="중복확인" onclick="idChk();" style="float:right; width:80px; height: 40px; font-size: 10pt;" required disabled="true">
		
		<div style="text-align:left; font-size: 12pt;">비밀번호</div>
			<input type="password" id="pw" name="mypw" onfocus="idChkConfirm();" style="width:300px; height: 40px; font-size: 10pt;" required>
		</p>
		<p>
		<div style="text-align:left; font-size: 12pt;">비밀번호 재확인</div>
		<div id="pw-validate" class="validate-false" style="text-align:right; font-size: 8pt; color:red; display:none;">*일치하지 않습니다</div>
			<input type="password" id="repw" onkeyup="keyevent(this);" onfocus="idChkConfirm();" style="width:300px; height: 40px; font-size: 10pt;" required>
		</p>
		
		<div style="text-align:left; font-size: 12pt;">휴대전화</div>
			<input type="text" id="phone" class="number" onfocus="idChkConfirm();" style="width:300px; height: 40px; font-size: 10pt;" maxlength="11" required numberOnly>
			<br><br><br>
		
		<div class="d-md-flex justify-content-md-end">
		  <button class="btn text-white" style="background-color: #008000; width:100px;" type="button" onclick="reregistForm();">다음</button>
		</div>
		</form>	

	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>