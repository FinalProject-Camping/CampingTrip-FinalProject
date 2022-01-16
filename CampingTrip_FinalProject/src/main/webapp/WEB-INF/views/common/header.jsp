<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="//font.elice.io/EliceDigitalBaeum.css" rel="stylesheet">
<script src="http://kit.fontawesome.com/2d323a629b.js"></script>
<script type="text/javascript">
/* header */
window.onload = function(){
	const toggleBtn = document.querySelector('.navbar_toggleBtn');
	const menu = document.querySelector('.navbar_menu');
	const login = document.querySelector('.navbar_login');

	toggleBtn.addEventListener('click', () => {
		menu.classList.toggle('active');
		icons.classList.toggle('active');
	});
}

	function ajaxEnabledUpdate(){
	console.log("fff");
	//회원정보 변경하기		
				$.ajax({
				type:"post",
				url:"ajaxEnabledUpdate.do",
				contentType:"application/json",
				dataType:"json",
				success:function(msg){
					if(msg.check==true){
						alert("회원탈퇴가 완료되었습니다.");
						location.href="";
					}else{
						alert("회원탈퇴에 실패했습니다.");
					}
				},
				error:function(){
					alert("통신 실패");
				}
			});	
		
}	
	

</script>

<style type="text/css">
/* header */

html, body{
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

header .body {
	font-family: "Elice Digital Baeum",sans-serif;
}

header a {
	text-decoration: none;
	color: white;
}

header .navbar {
	font-family: "Elice Digital Baeum",sans-serif;
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #d49466;
	padding-top: 0.5rem;
    padding-bottom: 0.5rem;
}

header .navbar_logo {
	font-size: 20px;
	color: white;
	white-space: nowrap;
}

header .navbar_logo a {
	margin-left: 20px;
	color: #198754;
	font-weight: bold;
}

header .navbar_logo .fa-campground {
	color: #F22C2C;
	margin-right: 10px;
}

header .navbar_menu {
	display: flex;
	list-style: none;
	padding-left: 0;
	font-size: 20px;
	white-space: nowrap;
	
	margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

header .navbar_menu li {
	padding: 8px 12px;
}

header .navbar_menu li:hover {
	background-color: #68AB4D;
	color: white;
	border-radius: 10px;
}

header .navbar_login {
	list-style: none;
	color: white;
	display: flex;
	padding-left: 0;
	margin-right: 20px;
	white-space: nowrap;
	margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 10px;
    padding-inline-start: 40px;
}

header .navbar_login li {
	padding: 8px 12px;
}

header .navbar_toggleBtn {
	display: none;
	position: absolute;
	right: 32px;
	font-size: 20px;
	color: black;
}

@media screen and (max-width: 768px) {
	header .navbar {
		flex-direction: column;
		align-items: flex-start;
		padding: 8px 24px;
	}
	header .navbar_menu {
		display: none;
		flex-direction: column;
		align-items: center;
		width: 100%;
	}
	header .navbar_menu li {
		width: 100%;
		text-align: center;
	}
	header .navbar_login {
		display: none;
		justify-content: center;
		width: 100%;
	}
	header .navbar_toggleBtn {
		display: block;
	}
	header .navbar_menu.active, .navbar_icons.active {
		display: flex;
	}
}
</style>

</head>
<body>
	<header>
        <nav class="navbar">
            <div class="navbar_logo">
                <a href="index.jsp"><i class="fas fa-campground"></i>CampingTrip</a>
            </div>

            <ul class="navbar_menu">
                <li><a href="camplist.do">캠핑예약</a></li>
                <li><a href="joonggo_list.do?keyword=">중고거래</a></li>
                <li><a href="event.do">이벤트</a></li>
                <li><a href="cscenter.do">고객센터</a></li>
            </ul>

<c:set var="loginId" value='<%=session.getAttribute("id")%>' />
<c:set var="loginName" value='<%=session.getAttribute("name")%>' />
<c:set var="loginRole" value='<%=session.getAttribute("role") %>' />
            <ul class="navbar_login">
            
             <!-- loginId가 null이 아님 그리고 loginId가 ""이 아니어야 -->
             <c:choose>
             	<c:when test="${(loginId ne null and loginId ne '' and loginRole eq '관리자')}">
             		<li>${loginRole} ${loginName}(${loginId})님 환영합니다.</li>
	                <li>|</li>
	                <li><a href="admin_camplist.do">마이페이지</a></li>
	                <li>|</li>
	                <li><a href="sessionLogout.do" onclick="">로그아웃</a></li>
             	</c:when>
             	<c:when test="${(loginId ne null and loginId ne '' and loginRole eq '판매자')}">
             		<li>${loginRole} ${loginName}(${loginId})님 환영합니다.</li>
	                <li>|</li>
	                <li><a href="manager_reservlist.do">마이페이지</a></li>
	                <li>|</li>
	                <li><a href="sessionLogout.do" onclick="">로그아웃</a></li>
             	</c:when>
             	<c:when test="${(loginId ne null and loginId ne '' and loginRole eq '사용자')}">
             		<li>${loginRole} ${loginName}(${loginId})님 환영합니다.</li>
	                <li>|</li>
	                <li><a href="member_reservlist.do">마이페이지</a></li>
	                <li>|</li>
	                <li><a href="sessionLogout.do" onclick="">로그아웃</a></li>
             	</c:when>
             	<c:otherwise>
	             	<li><a href="loginform.do">로그인</a></li>
	                <li>|</li>
	                <li><a href="registerform.do">회원가입</a></li>
            	</c:otherwise>
             </c:choose>
            	 
            </ul>

            <a href="#" class="navbar_toggleBtn">
                <i class="fas fa-bars"></i>
            </a>
        </nav>

    </header>
</body>
</html>