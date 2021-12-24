<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

   <link rel="icon" href="img/Fevicon.png" type="image/png">
    <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="resources/vendors/linericon/style.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">
  
     <!-- 제이쿼리피커  -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
 
    <link rel="stylesheet" href="resources/css/style.css">
    
    <style>

	.filter-list a {
		text-decoration: none;
		display: block;
		color: #000;
		padding: 8px 15px 8px 15px;
		font-weight: bold;
	}
    
  	.filter-list a:hover {
		background-color: darkgray;
		color: #fff;
	}
    </style>
<body>

    <div  style="width: 200px; height:auto">
              <div class="sidebar-categories" >
                <div class="head" style="background-color: darkgray;"> 마이페이지</div>
                <ul class="main-categories">
                  <li class="">
                    <form action="#">
                      <ul>
                        <li class="filter-list"><a href="myPage.me">내 정보 수정하기 </a> </li>
                   
                     </ul>
                    </form>
                  </li>
                </ul>
              </div>
              <div class="sidebar-filter">
                <div class="top-filter-head"style="background-color: darkgray;">일반상품 주문관리</div>
                <div class="common-filter">
                  <div class="head">일반상품</div>
                  <form action="#">
                    <ul >
                        <li class="filter-list"><a href="selectMyOrderList.me">나의 주문 조회</a> </li>
                        <li class="filter-list"><a href="cancelList.me"> 취소 리스트 조회</a> </li>
                        <li class="filter-list"> <a href="refundAndExchangeList.me"> 교환/반품 리스트 조회</a> </li>
                    </ul>
                  </form>
                </div>
             </div>


             <div class="sidebar-filter">
                <div class="top-filter-head"style="background-color: darkgray;">중고상품 주문관리</div>
                <div class="common-filter">
                  <div class="head">중고상품</div>
                  <form action="#">
                    <ul>
                        <li class="filter-list"><a href="selectMyOrderList.ub">주문 리스트 조회</a>   </li>
                   
                    </ul>
                  </form>
                </div>
             </div>

             <div class="sidebar-filter">
                <div class="top-filter-head"style="background-color: darkgray;">나의 목록들</div>
                <div class="common-filter">
                  <form action="myPageOrderList.me" method="post"> </form>
                    <ul>
                        <li class="filter-list"> <a href="myReview.me" >나의 리뷰조회 </a> </li>
                        <li class="filter-list"> <a href="recentlyView.me">나의 최근 본 목록</a> </li>
                        <li class="filter-list"> <a href="myPoint.me">나의 포인트 조회</a></li>
<!--                         <li class="filter-list"> <a href="myAddressMange.me">나의 주소록 관리</a></li>
 -->                        <li class="filter-list"> <a href="wishList.me">나의 찜목록 관리</a></li>
                    
                    </ul>
                 
                </div>
             </div>


            </div>


</body>
</html>