<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
                <li><a href="">캠핑예약</a></li>
                <li><a href="list.do?keyword=">중고거래</a></li>
                <li><a href="">동행하기</a></li>
                <li><a href="">이벤트</a></li>
                <li><a href="">고객센터</a></li>
            </ul>

            <ul class="navbar_login">
                <li><a href="loginform.do">로그인</a></li>
                <li>|</li>
                <li><a href="registerform.do">회원가입</a></li>
            </ul>

            <a href="#" class="navbar_toggleBtn">
                <i class="fas fa-bars"></i>
            </a>
        </nav>

    </header>
</body>
</html>