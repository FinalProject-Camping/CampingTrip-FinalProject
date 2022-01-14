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
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" charset="UTF-8"></script>	

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script type="text/javascript">
	
	$(function(){
		var birthVal = $("#mybirth").attr("birthday");
		var Day = birthVal.split(" ");
		$("#mybirth").val(Day[0]);
	}); 

	function indexForm(){
		location.href="logincontroller.jsp?command=index";
	}

	
	//비밀번호, 비밀번호재확인 비교
	function keyevent() {
		//비밀번호
		var mypw = $("#pw").val();
		var repw = $("#repw").val();
		
		if(mypw != repw){
			$('#pw-validate').css('display','block');
		}else{
			$('#pw-validate').css('display','none');
		}
	}
	
	
//회원가입 ajax 컨트롤러를 실행해주는 함수(/ajaxInsertMember.do)
	function ajaxMemberUpdate(){
		//validation check
		//디비에 조건 수정하기
		
		//비밀번호 체크
		 if($('#pw-validate').css('display') =='block' ||$('#pw-validate').css('display') != 'none' ){
			alert("비밀번호를 확인하세요.");
		}else if($('#pw').val() =="" || $('#pw').val() ==null ){
			alert("비밀번호를 확인하세요.");
		//휴대폰번호 체크
		}else if($('#myphone').val() =="" || $('#myphone').val() ==null ){
			alert("휴대폰번호를 확인하세요.");
		//이메일 체크
		}else if($('#myemail').val() =="" || $('#myemail').val() ==null ){
			alert("이메일을 확인하세요.");
		//주소 체크
		}else if($('#myaddr').val() =="" || $('#myaddr').val() ==null){
			alert("주소를 확인하세요.");
		}else{
				var myno = $('form[name=memberInfoForm]').find('[name=myno]').val();
				var mypw = $('form[name=memberInfoForm]').find('[name=mypw]').val();
				var myphone = $('form[name=memberInfoForm]').find('[name=myphone]').val();
				var myemail = $('form[name=memberInfoForm]').find('[name=myemail]').val();
				var myaddr = $('form[name=memberInfoForm]').find('[name=myaddr]').val();
				const mbrInfo = {
						myno: myno,
						mypw: mypw,
						myphone: myphone,
						myemail: myemail,
						myaddr: myaddr
				}

				
		//회원정보 변경하기		
 				$.ajax({
					type:"post",
					url:"ajaxMemberUpdate.do",
					data:JSON.stringify(mbrInfo),
					contentType:"application/json",
					dataType:"json",
					success:function(msg){
						if(msg.check==true){
							alert("회원정보 변경이 완료되었습니다.");
							//location.href="loginform.do";
							//나중에 마이페이지로 이동하고 임시로 이전페이지로 이동
							window.history.back();
							
						}else{
							alert("회원정보 변경에 실패했습니다. 다시 시도해주세요.");
						}
					},
					error:function(){
						alert("통신 실패");
					}
				});	
			}
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


<body>
	<div class="center" style="width:300px;">
	
		<h3 style="text-align:left;">내 정보</h3>
		<form name='memberInfoForm'  autocomplete="off">
		
		<!-- 회원번호 hidden -->
				<input type="hidden" id="myno" name="myno" value='${memberInfo.myno}'>
			<br>
			
			<p>
 			<div style="height:65px;">
			<div style="text-align:left; font-size: 12pt; width:40%; float:left; ">아이디</div>
				<input type="text" disabled id="myid" onkeyup="idevent(this);" name="myid" title="n"  value='${memberInfo.myid}'
					style="float:left; width:300px; height: 40px; font-size: 10pt; readonly="readonly" >
			</div>
			</p>
			
			<p>
			<div style="text-align:left; font-size: 12pt;">비밀번호</div>
				<input type="password" id="pw" name="mypw" onkeyup="keyevent();" style="width:300px; height: 40px; font-size: 10pt;" required>
			</p>
			<p>
			<div style="text-align:left; font-size: 12pt; width:40%; float:left; ">비밀번호 재확인</div>
			<div id="pw-validate" class="validate-false" style="text-align:right; font-size: 8pt; color:red; display:none;  width:60%; float:left; ">*일치하지 않습니다</div>
				<input type="password" id="repw" onkeyup="keyevent();"  style="width:300px; height: 40px; font-size: 10pt;"	 required>
			</p>
			
			<p>
			<div style="text-align:left; font-size: 12pt;">휴대전화</div>
				<input type="text" id="myphone" name="myphone" class="number"  value='${memberInfo.myphone}'
					style="width:300px; height: 40px; font-size: 10pt;" maxlength="11" required numberOnly >
			</p>
			
			<p>
			<div style="text-align:left; font-size: 12pt;">이름</div>
				<input type="text" disabled id='myname' name="myname"  value='${memberInfo.myname}'
				style="width:300px; height: 40px; font-size: 10pt;" maxlength="8" required readonly="readonly">
			</p>
			
			<p>
			<div style="display:inline-block;">
					<div style="float:left; text-align:left; font-size: 12pt; width:60%;">생년월일</div>
					<div style="float:right; text-align:left; font-size: 12pt; width:35%;">성별</div>
					
					<input type="text" disabled min='1899-01-01' max='2000-13-13' 
					id="mybirth" name="mybirth" class="birth" value='' birthday='${memberInfo.mybirth}'
					style="float:left; width:60%; height: 40px; font-size: 10pt;" required >
					
					<input type="text" disabled id="mysex" name="mysex" value='${memberInfo.mysex}'
					style="float:right; width:35%; height: 40px; font-size: 10pt;" required readonly="readonly">
			</div>
			</p>
			
			<p>
				<div style="text-align:left; font-size: 12pt;">이메일</div>
				<input type="text" id="myemail" name="myemail" value='${memberInfo.myemail}'
				style="width:300px; height: 40px; font-size: 10pt;" required>
			</p>
			<p>
			<div style="text-align:left; font-size: 12pt;">주소</div>
				<input type="text" name="myaddr" id="myaddr" value='${memberInfo.myaddr}'
				style="width:300px; height: 40px; font-size: 10pt;" required>
			</p>
			
<%-- 		<div style="width:40%; height:50px; float:left; margin-top:30px;" align="center" >
					<input type="radio" name="mysex" value="남성" checked='checked' readonly="readonly" value='${mysex}'>남 &nbsp;
					<input type="radio" name="mysex" value="여성" readonly="readonly" value='${mysex}'>여
				</div>
--%>

 			<div class="d-md-flex justify-content-md-end" style= "float:left;">
				<button class="btn text-white" style= "background-color:#d49466; width:100px;" onclick="window.history.back();">취소</button>
			</div>
			
			<p>
		</form>	
			<div class="d-md-flex justify-content-md-end" style="float:right; display:inline-block;">
				<button  class="btn text-white" style="background-color:#198754; width:100px;" onclick="ajaxMemberUpdate();">변경하기</button>
			</div>
			</p>
			<br>
			<br>
			<br>

	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script type="text/javascript">
//생년월일 max값 현재날짜로 설정하는
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	 if(dd<10){
	        dd='0'+dd
	    } 
	    if(mm<10){
	        mm='0'+mm
	    } 
	
	today = yyyy+'-'+mm+'-'+dd;
	document.getElementById("mybirth").setAttribute("max", today);

</script>
</html>