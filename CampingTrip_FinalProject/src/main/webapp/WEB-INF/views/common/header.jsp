<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="http://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
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

.body {
	margin: 0;
	font-family: 'Source Sans Pro', sans-serif;
}

a {
	text-decoration: none;
	color: white;
}

.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #d49466;
}

.navbar_logo {
	font-size: 20px;
	color: white;
	white-space: nowrap;
}

.navbar_logo a {
	margin-left: 20px;
	color: #D5FFC4;
	font-weight: bold;
}

.navbar_logo i {
	color: #F22C2C;
	margin-right: 10px;
}

.navbar_menu {
	display: flex;
	list-style: none;
	padding-left: 0;
	font-size: large;
	white-space: nowrap;
}

.navbar_menu li {
	padding: 8px 12px;
}

.navbar_menu li:hover {
	background-color: #68AB4D;
	border-radius: 10px;
}

.navbar_login {
	list-style: none;
	color: white;
	display: flex;
	padding-left: 0;
	margin-right: 20px;
	white-space: nowrap;
}

.navbar_login li {
	padding: 8px 12px;
}

.navbar_toggleBtn {
	display: none;
	position: absolute;
	right: 32px;
	font-size: 20px;
	color: black;
}

@media screen and (max-width: 768px) {
	.navbar {
		flex-direction: column;
		align-items: flex-start;
		padding: 8px 24px;
	}
	.navbar_menu {
		display: none;
		flex-direction: column;
		align-items: center;
		width: 100%;
	}
	.navbar_menu li {
		width: 100%;
		text-align: center;
	}
	.navbar_login {
		display: none;
		justify-content: center;
		width: 100%;
	}
	.navbar_toggleBtn {
		display: block;
	}
	.navbar_menu.active, .navbar_icons.active {
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
                <li><a href="">동행하기</a></li>
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