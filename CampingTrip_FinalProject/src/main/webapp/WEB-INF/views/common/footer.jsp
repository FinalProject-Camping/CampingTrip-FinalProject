<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="http://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>

<style type="text/css">
/* footer */

#footer {
	border-top: 1px solid #dbdbdb;
	background: #d49466;
}

.footer {
	text-align: center;
	padding: 50px 70px;
}

.footer a {
	color: black;
}

.footer a span {
	color: black;
	font-size: 20px;
	font-weight: bold;
}

.footer i {
	color: #F22C2C;
	margin-right: 10px;
}

.footer li {
	position: relative;
	display: inline;
	padding: 0 17px 0 20px;
	white-space: nowrap;
}

.footer ul {
	margin-top: 40px;
}

.footer li:before {
	content: '';
	width: 2px;
	height: 12px;
	background-color: #dbdbdb;
	position: absolute;
	left: 0;
	top: 5px;
}

.footer li:first-child:before {
	width: 0;
}

.footer address {
	padding-top: 15px;
}
</style>
</head>
<body>
	<!-- footer -->
	<footer id="footer">
		<div class="footer_container">
			<div class="row">
				<div class="footer">
					<a href=""><span><i class="fas fa-campground"></i>CampingTrip</span></a>
					<ul>
						<li>주소 : 서울특별시 캠핑구 캠핑동</li>
						<li>상호 : CampingTrip</li>
						<li>전화번호 : 1544-9970</li>
						<li><a href="#"><strong>고객센터</strong></a></li>
					</ul>
					<address>Copyright &copy; CampingTrip All Rights
						Reserved.</address>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>