<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CampingTrip_main</title>
<link type="text/css" rel="stylesheet" href="resources/css/index.css">
<script type="text/javascript">
/* 슬라이드 자바스크립트 코드 */
var counter = 1;
setInterval(function () {
    document.getElementById('radio' + counter).checked = true;
    counter++;
    if (counter > 4) {
        counter = 1;
    }
}, 4000);
</script>
</head>
<body>
<!-- slider -->
    <div class=slider_start>
        <div class="slider">
            <div class="slides">
                <!--radio buttons start-->
                <input type="radio" name="radio-btn" id="radio1">
                <input type="radio" name="radio-btn" id="radio2">
                <input type="radio" name="radio-btn" id="radio3">
                <input type="radio" name="radio-btn" id="radio4">
                <!--radio buttons end-->

                <!--slide images start-->
                <div class="slide first">
                    <img src="resources/img/slide01.png" alt="">
                </div>
                <div class="slide">
                    <img src="resources/img/slide02.png" alt="">
                </div>
                <div class="slide">
                    <img src="resources/img/slide03.png" alt="">
                </div>
                <div class="slide">
                    <img src="resources/img/slide04.png" alt="">
                </div>
                <!--slide images end-->

                <!--automatic navigation start-->
                <div class="navigation-auto">
                    <div class="auto-btn1"></div>
                    <div class="auto-btn2"></div>
                    <div class="auto-btn3"></div>
                    <div class="auto-btn4"></div>
                </div>
                <!--automatic navigation end-->

            </div>
            <!--manual navigation start-->
            <div class="navigation-manual">
                <label for="radio1" class="manual-btn"></label>
                <label for="radio2" class="manual-btn"></label>
                <label for="radio3" class="manual-btn"></label>
                <label for="radio4" class="manual-btn"></label>
            </div>
            <!--manual navigation end-->
        </div>
    </div>

    <!-- main (content01 : top 캠핑장, content02 : 중고거래) -->
    <!-- main_content01 start -->
    <div class="main_content01">
        <h1><i class="fab fa-hotjar"></i> HOT ! <div>CampingTrip TOP 캠핑장 !</div>
        </h1>
        <!--image row start-->
        <div class="row">
            <!--image card start-->
            <div class="image">
                <img src="resources/img/camping_main01.png" alt="">
                <div class="details">
                    <h2>포천시 <span>파인트리 글램핑</span></h2>
                    <p></p>
                    <div class="more">
                        <a href="#" class="read-more">평점 <span id="average_score">5.0 점</span></a>
                        <div class="icon-links">
                            <a href="#" class="read-more"><span>예약하기 <i class="fas fa-angle-double-right"></i></span></a>
                        </div>
    
                    </div>
                </div>
            </div>
            <!--image card end-->
            <!--image card start-->
            <div class="image">
                <img src="resources/img/camping_main02.png" alt="">
                <div class="details">
                    <h2>가평군 <span>프로미스 캠핑장</span></h2>
                    <p></p>
                    <div class="more">
                        <a href="#" class="read-more">평점 <span id="average_score">4.9 점</span></a>
                        <div class="icon-links">
                            <a href="#" class="read-more"><span>예약하기 <i class="fas fa-angle-double-right"></i></span></a>
                        </div>
                    </div>
                </div>
            </div>
            <!--image card end-->
            <!--image card start-->
            <div class="image">
                <img src="resources/img/camping_main03.png" alt="">
                <div class="details">
                    <h2>양평군 <span>힐링캠프 글램핑</span></h2>
                    <p></p>
                    <div class="more">
                        <a href="#" class="read-more">평점 <span id="average_score">4.7 점</span></a>
                        <div class="icon-links">
                            <a href="#" class="read-more"><span>예약하기 <i class="fas fa-angle-double-right"></i></span></a>
                        </div>
                    </div>
                </div>
            </div>
            <!--image card end-->
        </div>
        <!--image row end-->
        <!--image row start-->
        <div class="row">
            <!--image card start-->
            <div class="image">
                <img src="resources/img/camping_main04.png" alt="">
                <div class="details">
                    <h2>가평군 <span>아트살롱 글램핑</span></h2>
                    <p></p>
                    <div class="more">
                        <a href="#" class="read-more">평점 <span id="average_score">4.6 점</span></a>
                        <div class="icon-links">
                            <a href="#" class="read-more"><span>예약하기 <i class="fas fa-angle-double-right"></i></span></a>
                        </div>
                    </div>
                </div>
            </div>
            <!--image card end-->
            <!--image card start-->
            <div class="image">
                <img src="resources/img/camping_main05.png" alt="">
                <div class="details">
                    <h2>남양주시 <span>포레스트 카라반</span></h2>
                    <p></p>
                    <div class="more">
                        <a href="#" class="read-more">평점 <span id="average_score">4.7 점</span></a>
                        <div class="icon-links">
                            <a href="#" class="read-more"><span>예약하기 <i class="fas fa-angle-double-right"></i></span></a>
                        </div>
                    </div>
                </div>
            </div>
            <!--image card end-->
            <!--image card start-->
            <div class="image">
                <img src="resources/img/camping_main06.png" alt="">
                <div class="details">
                    <h2>춘천시 <span>아웃오브파크</span></h2>
                    <p></p>
                    <div class="more">
                        <a href="#" class="read-more">평점 <span id="average_score">4.8 점</span></a>
                        <div class="icon-links">
                            <a href="#" class="read-more"><span>예약하기 <i class="fas fa-angle-double-right"></i></span></a>
                        </div>
                    </div>
                </div>
            </div>
            <!--image card end-->
        </div>
        <!--image row end-->
    </div>
    <!--image card layout end-->
    
    <!-- main_content02 start -->
    <div class="main_content02">
        <h1><i class="fas fa-bullhorn"></i> NEW ! <div>새로 등록된 중고물품</div></h1> 
        <div class="container">
            <div class="card">
              <div class="card-image loading"><img src="resources/img/camping_goods04.PNG" alt=""></div>
              <div class="card-info">
                <h3 class="card-title loading"><span>캠핑 장작 및 화로 장작</span></h3>
                <h4 class="card-location"><span>경기도 부천시 원미구 중동</span></h4>
                <p class="card-price"><span>7,000원</span></p>
              </div>
            </div>
            <div class="card">
              <div class="card-image loading"><img src="resources/img/camping_goods05.PNG" alt=""></div>
              <div class="card-info">
                <h3 class="card-title loading"><span>캠핑 장작 및 화로 장작</span></h3>
                <h4 class="card-location"><span>경기도 부천시 원미구 중동</span></h4>
                <p class="card-price"><span>7,000원</span></p>
              </div>
            </div>
            <div class="card">
              <div class="card-image loading"><img src="resources/img/camping_goods06.PNG" alt=""></div>
              <div class="card-info">
                <h3 class="card-title loading"><span>캠핑 장작 및 화로 장작</span></h3>
                <h4 class="card-location"><span>경기도 부천시 원미구 중동</span></h4>
                <p class="card-price"><span>7,000원</span></p>
              </div>
            </div>
            <div class="pagination">
                <i class="fas fa-chevron-left prev-btn"></i>
                <i class="fas fa-chevron-right next-btn"></i>
            </div>
            
          </div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>