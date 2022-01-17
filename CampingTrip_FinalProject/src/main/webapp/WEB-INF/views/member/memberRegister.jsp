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
	<!-- daum 주소 API -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
<%@ include file="/WEB-INF/views/common/header.jsp" %>



<script type="text/javascript">

	function indexForm(){
		location.href="logincontroller.jsp?command=index";
	}
	/* 
	function reregistForm(){
		var chk = document.getElementsByName("myid")[0].title;
		var pw = $('#pw').val();
		var repw = $('#repw').val();
		var phone = $('#myphone').val();
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
	 */
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
	
	
	
	
//회원가입 ajax 컨트롤러를 실행해주는 함수(/ajaxInsertMember.do)
	function ajaxJoin(){
	
		var myAddrTxt = $('#sample6_postcode').val() + $('#sample6_address').val() + $('#sample6_detailAddress').val() + $('#sample6_extraAddress').val();
		$('#myaddr').val(myAddrTxt);
		
		
		//validation check
		//디비에 조건 수정하기
		
		//아이디 체크
		if($('#myid').val() =="" || $('#myid').val() ==null ){
			alert("아이디를 확인하세요.");
		}else if($('#myid').attr('title') =="n" ){
			alert("아이디 중복확인이 필요합니다.");
		//비밀번호 체크
		}else if($('#pw-validate').css('display') =='block' ||$('#pw-validate').css('display') != 'none' ){
			alert("비밀번호를 확인하세요.");
		}else if($('#pw').val() =="" || $('#pw').val() ==null ){
			alert("비밀번호를 확인하세요.");
		//휴대폰번호 체크
		}else if($('#myphone').val() =="" || $('#myphone').val() ==null ){
			alert("휴대폰번호를 확인하세요.");
		//이름 체크
		}else if($('#myname').val() =="" || $('#myname').val() ==null ){
			alert("이름을 확인하세요.");
		//생년월일 체크
		}else if($('#mybirth').val() =="" || $('#mybirth').val() ==null ){
			alert("생년월일을 확인하세요.");
		//이메일 체크
		}else if($('#myemail').val() =="" || $('#myemail').val() ==null ){
			alert("이메일을 확인하세요.");
		//주소 체크
		}else if($('#myaddr').val() =="" || $('#myaddr').val() ==null){
			alert("주소를 확인하세요.");
		}else{
				var myid = $('form[name=memberInfoForm]').find('[name=myid]').val();
				var mypw = $('form[name=memberInfoForm]').find('[name=mypw]').val();
				var myphone = $('form[name=memberInfoForm]').find('[name=myphone]').val();
				var myname = $('form[name=memberInfoForm]').find('[name=myname]').val();
				var mybirth = $('form[name=memberInfoForm]').find('[name=mybirth]').val();
				var mysex = $('form[name=memberInfoForm]').find('input[name=mysex]:checked').val();
				var myemail = $('form[name=memberInfoForm]').find('[name=myemail]').val();
				var myaddr = $('form[name=memberInfoForm]').find('[name=myaddr]').val();
				var myrole = $('form[name=memberInfoForm]').find('input[name=myrole]:checked').val();
				const mbrInfo = {
						myid: myid,
						mypw: mypw,
						myphone: myphone,
						myname: myname,
						mybirth: mybirth,
						mysex: mysex,
						myemail: myemail,
						myaddr: myaddr,
						myrole: myrole
				}

				
				$.ajax({
					type:"post",
					url:"ajaxMemberInsert.do",
					data:JSON.stringify(mbrInfo),
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
	}

	
//전화번호에 숫자만 입력되도록
$(document).on("keyup", "input[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );})
	

	
</script>
</head>

<style type="text/css">

.alice{
	font-family: EliceDigitalBaeum_Bold;
}

.center{
	margin: 3em auto;
}
</style>

<body>
	<div class="center" style="width:300px;">
	
			<c:choose>
				<c:when test="${adminRole eq '관리자'}">
					<h3 style="text-align:left;" class="alice">관리자 계정 추가</h3>
				</c:when>
				<c:otherwise>
					<h3 style="text-align:left;" class="alice">회원가입</h3>
				</c:otherwise>
			</c:choose>
			
		<form name='memberInfoForm'  autocomplete="off">
			<br>
		
			<p>
			<div style="height:65px;">
				<div style="text-align:left; font-size: 12pt; width:40%; float:left;" >아이디</div>
				<div id="id-validate" class="validate-false" style="text-align:right; font-size: 8pt; color:red; display:none; width:60%; float:left; ">*이미 존재하는 ID 입니다</div>
					<input type="text" id="myid" onkeyup="idevent(this);" name="myid" title="n" style="float:left; width:210px; height: 40px; font-size: 10pt;">
					<input type="button" id="idchkbtn" value="중복확인" onclick="idChk();" style="float:right; width:80px; height: 40px; font-size: 10pt; " required disabled="true">
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
				<input type="text" id="myphone" name="myphone" class="number"  style="width:300px; height: 40px; font-size: 10pt;" maxlength="11" required numberOnly >
			</p>
<!--
			<div class="d-md-flex justify-content-md-end">
			  <button class="btn text-white" style="background-color: #198754; width:100px;" type="button" onclick="reregistForm();">다음</button>
			</div>
-->
			<p>
			<div style="text-align:left; font-size: 12pt;">이름</div>
				<input type="text" placeholder="이름을 입력하세요." id='myname' name="myname"  style="width:300px; height: 40px; font-size: 10pt;" required>
			</p>
			
			<p>
			<div>
				<div style="width:60%; height:50px; float:left;">
					<div style="float:left; text-align:left; font-size: 12pt; width:100%; display:inline-block;">생년월일</div>
					<input type="date"  min='1899-01-01' max='2000-13-13' id="mybirth"  name="mybirth"  class="birth" 
					style="float:left; width:100%; height: 40px; font-size: 10pt;" maxlength="8" required numberOnly>
				</div>
				<div style="float:right; text-align:left; font-size: 12pt; width:35%;">성별</div>
				<div style="width:35%; height:50px; float:left; margin-top:10px;" align="center" >
					<input type="radio" name="mysex" value="남성" checked='checked'>남 &nbsp;&nbsp;
					<input type="radio" name="mysex" value="여성">여
				</div>
			</div>
			</p>
			
			<p>
			<div style="text-align:left; font-size: 12pt;">이메일</div>
				<input type="text" placeholder="example@naver.com" id="myemail" name="myemail"  style="width:300px; height: 40px; font-size: 10pt;" required>
			</p>
			
			<p>
 			<div style="text-align:left; font-size: 12pt; width:100%; float:left;">주소</div>
				<input type="text" id="myaddr" name="myaddr" 
					style="width:300px; height: 40px; font-size: 10pt; display:none;" readOnly disabled>
				
				<input type="text" id="sample6_postcode" name="post" placeholder="우편번호" value="${ post }"
					style="width:190px; height: 40px; float:left; font-size: 10pt;" readOnly>
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" 
					style="float:right; width:100px; height: 40px; font-size: 10pt;">
				<input type="text" id="sample6_address" name="address1" placeholder="주소" value="${ address1 }"
					style="width:300px; height: 40px; float:left; font-size: 10pt;" readOnly>
				<input type="text" id="sample6_detailAddress" name="address2" placeholder="상세주소" value="${ address2 }"
					style="width:150px; height: 40px; float:left; font-size: 10pt;">
				<input type="text" id="sample6_extraAddress" name="address3" placeholder="참고항목" value="${ address3 }"
					style="width:150px; height: 40px; float:left; font-size: 10pt;" readOnly>
 			</p>
 
			<c:choose>
				<c:when test="${adminRole eq '관리자'}">
					<p>
					<div style="text-align:left; font-size: 12pt;">회원구분</div>
					<div style="width:100%; height:50px; float:left; margin-top:10px;" align="center" >
						<input type="radio" name="myrole" value="관리자" checked='checked'>관리자
					</div>
					</p>
				</c:when>
				<c:otherwise>
					<p>
					<div style="text-align:left; font-size: 12pt;">회원구분</div>
					<div style="width:100%; height:50px; float:left; margin-top:10px;" align="center" >
						<input type="radio" name="myrole" value="사용자" checked='checked'>사용자 &nbsp; &nbsp;
						<input type="radio" name="myrole" value="판매자">판매자
					</div>
					</p>
				</c:otherwise>
			</c:choose>
		</form>
			<br>
			
			<p>
			<div class="d-md-flex justify-content-md-end" style="float:right; display:inline-block;">
				<button  class="btn text-white" style="background-color:#198754; width:100px;" onclick="ajaxJoin();">가입하기</button>
			</div>
			</p>
			
			<br>
			<br>
			<br>

	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>

<!-- 카카오 API -->
<script>
    /*------------------------------ daum 주소 API ------------------------------*/
         function sample6_execDaumPostcode() {
                new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수
    
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
    
                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample6_extraAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }
    
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
</script>


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