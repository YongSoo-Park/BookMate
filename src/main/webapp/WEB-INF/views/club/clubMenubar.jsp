<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>책구메이트</title>
   <link rel="icon" href="resources/img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
   <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="resources/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">

  <link rel="stylesheet" href="resources/css/style.css">
  <style>
       #clubMenubar{
			position: fixed;
			right: 50%;
			transform: translate(-610px, 0);
			margin-top: 5px;
		}
		
		#nav-v2{
			/* width:150px
			;text-align:center; */
		} 
		.menu-v2{ 
			line-height:2; 
			position:relative; 
			
		} 
		.menu-v2 .submenu{
			position:absolute; 
			width:150px; 
			left:120px; 
			background-color:#adc09c; 
			color:white; 
			top:-1px; 
			display:none; 
			z-index:9999; /*이렇게 해도 카드에는 안됨*/
		} 
		.menu-v2 a{
			color:black;
		}
		
		.menu-v2_2:hover{  /*위가 먹히지 않아서 새로 만들었다.*/
			background-color:#adc09c; 
			color:white; 
			text-decoration: none;
		}
		.menu-v2:hover{ 
			background-color:#adc09c; 
			color:white; 
		} 
		.menu-v2 .submenu>li:hover{ 
			background-color:white; 
			color:#adc09c; 
		}  
  </style>
</head>
<body>
	<script>
		$(document).ready(function(){ 
			 //menu v2 
			 $(".menu-v2").mouseover(function(){ $(this).children(".submenu").show(200); }); 
			 $(".menu-v2").mouseleave(function(){ $(this).children(".submenu").hide(200); }); 
			 
			 //출처: https://contentstoaster.tistory.com/6 [Contents Toaster]
		});
		
		function goSearch_menu(){
			$('#searchForm_menu').submit();
		}
		
		function checkUser(){
			var userId = '${sessionScope.loginUser.userId}';
			if(userId == ''){
				alert('로그인 후 이용해주세요');
				return;
			}
		}
	</script>

	<div id="clubMenubar" style="width: 220px; height: 650px;">  <!-- background-color: #f1e5d9; #f1e5d9 #faf1e6   #fcf3e0-->
			<hr style="margin-top: 0px; height: 4px; background-color: #503535;">
			<div style="font-size: 23px; font-weight: 800; margin-top: 35px;">
				함께 읽고 얘기하는 <br>
				독서메이트
			</div>
			<hr style="margin: 35px 0px;">
			<nav>
				<ul id="nav-v2">
					<li class="menu-v2"><a class="menu-v2_2" href="clubMain.cl">독서모임 홈</a></li>
					<li class="menu-v2"><a class="menu-v2_2" href="clubAll.cl">모든 독서모임</a></li>
					<li class="menu-v2"><a class="menu-v2_2" href="searchPage.cl">나에게 맞는 독서모임</a></li>
					<li onclick="checkUser();" class="menu-v2"><a <c:if test="${!empty sessionScope.loginUser}">href="mypage1.cl"</c:if> >마이페이지</a>
						<ul class="submenu">
							<li><a <c:if test="${!empty sessionScope.loginUser}">href="mypage1.cl"</c:if>>신청 목록</a></li>
							<li><a <c:if test="${!empty sessionScope.loginUser}">href="mypage2.cl"</c:if>>찜 목록</a></li>
							<li><a <c:if test="${!empty sessionScope.loginUser}">href="mypage3.cl"</c:if>>내 독서모임</a></li>
						</ul>
					</li>
				</ul>
			</nav>
			<hr style="margin: 35px 0px;">
			<div style="position: relative">
				<form id="searchForm_menu" action="search_menu.cl">
					<input type="search" name="keyword" placeholder="독서모임을 검색해보세요" style="width: 100%; border: 1px solid lightgray; height: 40px;">
				</form> 
				<img alt="" onclick=" goSearch_menu();" src="resources/img/club/magnifier.png" style="width: 22px; position: absolute; right: 5px; top: 10px; cursor: pointer">
			</div>
			<div></div>
		</div>
   
</body>
</html>