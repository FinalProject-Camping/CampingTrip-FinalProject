<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CampingTrip_main</title>
<link type="text/css" rel="stylesheet" href="resources/css/index.css">
<link href="//font.elice.io/EliceDigitalBaeum.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" charset="UTF-8"></script>
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
<style type="text/css">
.main_content01 h1{
	font-family: "Elice Digital Baeum",sans-serif;
}

.main_content02 h1{
	font-family: "Elice Digital Baeum",sans-serif;
}
</style>
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
        <h1><i class="fab fa-hotjar"></i> HOT ! <div>CampingTrip TOP 캠핑장 !</div></h1>
        
    </div>
    <!--image card layout end-->
    
    <!-- main_content02 start -->
    <div class="main_content02">
        <h1><i class="fas fa-bullhorn"></i> NEW ! <div>새로 등록된 중고물품</div></h1>
        <div class="container">
            <div class="card-content">

            </div>
                <div class="pagination">
                    <li class="page-item previous-page disable"><a class="page-link">이전</a></li>
                    <li class="page-item current-page active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item dots"><a class="page-link" href="#">...</a></li>
                    <li class="page-item current-page"><a class="page-link" href="#">5</a></li>
                    <li class="page-item current-page"><a class="page-link" href="#">6</a></li>
                    <li class="page-item dots"><a class="page-link" href="#">...</a></li>
                    <li class="page-item current-page"><a class="page-link" href="#">10</a></li>
                    <li class="page-item next-page"><a class="page-link">다음</a></li>
                </div>
        </div>
    </div>
    
	
    <script type="text/javascript">
	    document.addEventListener("DOMContentLoaded", ()=>{
			$.ajax({
				url:"selectlist_main.do",
				async:false,
				method: "post",
				success:function(datalist){ 
					var list = $.parseJSON(datalist.data);	
					var doc = document.querySelector('.card-content');			
					list.forEach( data => {
									
						var html = 
			                '<div class="card" style="cursor:pointer;" onclick="location.href=`joonggo_selectone.do?seq='+ data.seq +'`">'+
			                '<div class="card-image loading"><img src="'+ data.imglist.split(',')[0] +'" alt=""></div>'+
			                '<div class="card-info">'+
			                '<h3 class="card-title loading"><span>'+ data.title +'</span></h3>'+
			                '<h4 class="card-location"><span>'+ data.place +'</span></h4>'+
			                '<p class="card-price"><span>'+data.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+' 원</span></p>'+
			                '</div></div>';
						doc.innerHTML += html;
					});
				}
			});
			$.ajax({
				url:"selectcamp_main.do",
				async:false,
				method: "post",
				success:function(result){ 
					var comments="<div class='row'>";
					var cnt = 0;
					$(result).each(function(){
						if(cnt == 3){
							comments+="</div><div class='row'>";
							
						}
						comments+="<div class='image'>";
						comments+="<img src='"+this.thumbnail+"'>";
						comments+="<div class='details'>";
						comments+="<h2><span>"+this.name+"</span></h2>";
						comments+="<p></p><div class='more'>";
						comments+='<a href="campdetail.do?campno='+this.campno+'" class="read-more">평점 <span id="average_score">'+this.total_grade+' 점</span></a>';
						comments+='<div class="icon-links">';
						comments+='<a href="campdetail.do?campno='+this.campno+'" class="read-more"><span>예약하기 <i class="fas fa-angle-double-right"></i></span></a>';
						comments+='</div></div></div></div>';
						if(cnt == 5){
							comments+="</div>";
						}
						cnt++;
					});
					
					$(".main_content01").append(comments);
				}
			});  
		})

    
        function getPageList(totalPages, page, maxLength){
          function range(start, end){
            return Array.from(Array(end - start + 1), (_, i) => i + start);
          }
        
          var sideWidth = maxLength < 9 ? 1 : 2;
          var leftWidth = (maxLength - sideWidth * 2 - 3) >> 1;
          var rightWidth = (maxLength - sideWidth * 2 - 3) >> 1;
        
          if(totalPages <= maxLength){
            return range(1, totalPages);
          }
        
          if(page <= maxLength - sideWidth - 1 - rightWidth){
            return range(1, maxLength - sideWidth - 1).concat(0, range(totalPages - sideWidth + 1, totalPages));
          }
        
          if(page >= totalPages - sideWidth - 1 - rightWidth){
            return range(1, sideWidth).concat(0, range(totalPages- sideWidth - 1 - rightWidth - leftWidth, totalPages));
          }
        
          return range(1, sideWidth).concat(0, range(page - leftWidth, page + rightWidth), 0, range(totalPages - sideWidth + 1, totalPages));
        }
        
        $(function(){
          var numberOfItems = $(".card-content .card").length;
          var limitPerPage = 3; //How many card items visible per a page
          var totalPages = Math.ceil(numberOfItems / limitPerPage);
          var paginationSize = 7; //How many page elements visible in the pagination
          var currentPage;
        
          function showPage(whichPage){
            if(whichPage < 1 || whichPage > totalPages) return false;
        
            currentPage = whichPage;
        
            $(".card-content .card").hide().slice((currentPage - 1) * limitPerPage, currentPage * limitPerPage).show();
        
            $(".pagination li").slice(1, -1).remove();
        
            getPageList(totalPages, currentPage, paginationSize).forEach(item => {
              $("<li>").addClass("page-item").addClass(item ? "current-page" : "dots")
              .toggleClass("active", item === currentPage).append($("<a>").addClass("page-link")
              .attr({href: "javascript:void(0)"}).text(item || "...")).insertBefore(".next-page");
            });
        
            $(".previous-page").toggleClass("disable", currentPage === 1);
            $(".next-page").toggleClass("disable", currentPage === totalPages);
            return true;
          }
        
          $(".pagination").append(
            $("<li>").addClass("page-item").addClass("previous-page").append($("<a>").addClass("page-link").attr({href: "javascript:void(0)"}).text("이전")),
            $("<li>").addClass("page-item").addClass("next-page").append($("<a>").addClass("page-link").attr({href: "javascript:void(0)"}).text("다음"))
          );
        
          $(".card-content").show();
          showPage(1);
        
          $(document).on("click", ".pagination li.current-page:not(.active)", function(){
            return showPage(+$(this).text());
          });
        
          $(".next-page").on("click", function(){
            return showPage(currentPage + 1);
          });
        
          $(".previous-page").on("click", function(){
            return showPage(currentPage - 1);
          });
        });
        </script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>