<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page session="false"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>책구메이트</title>



    <link rel="icon" href="resources/img/logo1.png" type="image/png">
    <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="resources/vendors/nice-select/nice-select.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">

    <link rel="stylesheet" href="resources/css/style.css">
    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
#recentViewDiv {
	position: fixed;
	left: 50%;
	transform: translate(630px, 0);
	margin-top: 5px;
	text-align: center;
}

#recentViewDiv_1 {
	width: 100%;
	height: 6%;
	background-color: #505050;
	color: white;
	line-height: 40px;
}

#recentViewDiv_3 {
	position: absolute;
	bottom: 10px;
	left: 50%;
	transform: translate(-50%);
}

.bestUl {
	display: flex;
	flex-wrap: wrap;
}

.bestImg {
	width: 125px;
	height: 180px;
	margin-bottom: 5px;
	cursor: pointer;
	border: 1px solid #a9a9a9;
}

.bestUl li {
	margin: 40px 8px;
	text-align: center;
	margin-bottom: 0px;
}

.bestTitle {
	width: 190px;
	font-size: 19px;
	font-weight: 900;
}

#bestDiv_2 {
	position: absolute;
	left: 50%;
	transform: translate(-50%);
}

.todayLi {
	border: 1px solid #dadada;
	margin: 26.5px; !important;
	text-align: center !important;
	padding: 27.5px;
}

.todayImg {
	width: 135px;
	height: 205px;
	margin-bottom: 5px;
	cursor: pointer;
	border: 0.5px solid #a9a9a9;
}

.todayArrow_left {
	font-size: 50px;
	color: gray;
	position: absolute;
	top: 160px;
	left: -30px;
}

.todayArrow_right {
	font-size: 50px;
	color: gray;
	position: absolute;
	top: 160px;
	right: -30px;
}

.hotUl {
	display: flex;
	flex-wrap: wrap;
}

.hotImg {
	width: 160px;
	height: 230px;
	margin-bottom: 5px;
	margin-left: 50px;
	cursor: pointer;
	border: 1px solid #a9a9a9;
}

.hotUl li {
	margin: 40px 8px;
	text-align: center;
	margin-bottom: 0px;
}

.hotTitle {
	width: 190px;
	font-size: 19px;
	font-weight: 900;
}

#hotDiv_2 {
	position: absolute;
	left: 50%;
	transform: translate(-50%);
}
.hotArrow_left {
	font-size: 50px;
	color: gray;
	position: absolute;
	top: 180px;
	left:45px;
}

.hotArrow_right {
	font-size: 50px;
	color: gray;
	position: absolute;
	top: 180px;
	right: 45px;
}

</style>

</head>
<body>
	<jsp:include page="common/menubar.jsp" />

	<script>
		var todayPg = 1;  //todatList페이징처리용
	
		$(function(){
			var userId = '${sessionScope.loginUser.userId}'
			if(userId == ''){
				$('#recentViewDiv').css('display','none');
			}else{
				$('#recentViewDiv').css('display','block');
			}
		})
		
		function goReview(pg, length){
			for(var i=1; i<=length; i++){
				var index = (i-1)*4;
				if(i == pg){
					$('#recentDetail'+index).css('display','block');
				}else{
					$('#recentDetail'+index).css('display','none');
				}
			}
		}
		
		function goBest(pg, length){
			for(var i=1; i<=length; i++){
				var index = (i-1)*10;
				if(i == pg){
					$('#bestDetail'+index).css('display','flex');
					$("#click"+i).attr("class","far fa-circle");
				}else{
					$('#bestDetail'+index).css('display','none');
					$("#click"+i).attr("class","fas fa-circle");
				}
			}
		}
		var hotPg = 1;
		
		function goHot(type, length){ 
			//이전으로
	         if(i == 1){
	            if(hotPg == 1){
	            	hotPg = length;
	            }else{
	            	hotPg--;
	            }
	         }else{//앞으로
	            if(hotPg == length){
	               console.log("ddddd")
	               hotPg = 1;
	            }else{
	            	hotPg++;
	            }
	         }

	         for(var i=1; i<=length; i++){
	            var index = (i-1)*4;
	            if(i == hotPg){
	               $('#hotDetail'+index).css('display','flex');
	            }else{
	               $('#hotDetail'+index).css('display','none');
	            }
	         }
	      }		
		
		function goToday(type, length){
			console.log(type)
			console.log(length)
			console.log("전 : " + todayPg)
			if(type == 1){ //이전으로
				if(todayPg == 1){
					todayPg = length;
				}else{
					todayPg--;
				}
			}else{//앞으로
				if(todayPg == length){
					console.log("ddddd")
					todayPg = 1;
				}else{
					todayPg++;
				}
			}
			console.log("후 : " + todayPg);

			for(var i=1; i<=length; i++){
				var index = (i-1)*4;
				if(i == todayPg){
					$('#todayDetail'+index).css('display','flex');
				}else{
					$('#todayDetail'+index).css('display','none');
				}
			}
		}
		
		function moveDetail(bookISBN){
			$('#moveDetailInput').val(bookISBN)
			$('#moveDetailForm').submit();
		}
		
		function moveToday(type){
			if(type == 1){  //국내도서
				$("#todayDiv_1").css('display','block');
				$("#todayDiv_2").css('display','none');
			}else{
				$("#todayDiv_2").css('display','block');
				$("#todayDiv_1").css('display','none');
			}
		}
	</script>

	<form action="selectBook.book" method="post" id="moveDetailForm">
		<input type="hidden" id="moveDetailInput" name="bookISBN">
	</form>

	<main class="site-main" style="padding-top: 180px">

		<div id="recentViewDiv"
			style="width: 150px; height: 650px; background-color: #F5F5F5; z-index: 777;">
			<div id="recentViewDiv_1">
				최근 본 상품 (<span style="color: red">${fn:length(viewList)}</span>)
			</div>

			<c:if test="${fn:length(viewList) != 0}">

				<div id="recentViewDiv_2">
					<c:set var="length" value="0" />
					<c:forEach var="i" begin="0" end="${fn:length(isbnList)-1}"
						step="4">
						<ul id="recentDetail${i}"
							<c:if test="${i != 0}"> style="display:none" </c:if>>
							<c:forEach begin="${i}" end="${i+3}" items="${isbnList}"
								var="isbn">
								<li><c:forEach var="book" items="${viewList}">
										<c:if test="${book.bookISBN eq isbn }">
											<img
												src="${pageContext.servletContext.contextPath }/resources/images/book_img/${book.bookMainImg}"
												class="media-photo"
												style="width: 90px; height: 140px; cursor: pointer; padding-top: 20px;"
												onclick="moveDetail('${book.bookISBN}')" alt="">
										</c:if>
									</c:forEach></li>
							</c:forEach>
						</ul>
						<c:set var="length" value="${length+1}" />
					</c:forEach>
				</div>
				<div id="recentViewDiv_3" style="cursor: pointer">
					<c:forEach var="pg" begin="1" end="${length}">
						<a onclick="goReview(${pg}, ${length})">${pg}</a>
					</c:forEach>
				</div>
			</c:if>
		</div>
		

		<!--================ 이벤트 슬라이드 start =================-->
		<section class="hero-banner2">
			<div class="container2">
			<c:if test="${fn:length(eventImg) > 1}">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- 하단 슬라이드 페이지 표시-->
					<ol class="carousel-indicators">
						<c:forEach var="pg" begin="0" end="${fn:length(eventImg)-1}">
						<li data-target="#myCarousel" data-slide-to="${pg }" class="active"></li>
						</c:forEach>
					</ol> 
					<!-- 슬라이드 content -->
					<div class="carousel-inner">
						<c:forEach var="i" begin="0" end="${fn:length(eventImg)-1}"
							step="1">
							<c:choose>
								<c:when test="${i eq 0}">
									<c:set var="activeD" value="carousel-item active" />
								</c:when>
								<c:otherwise>
									<c:set var="activeD" value="carousel-item" />
								</c:otherwise>
							</c:choose>

								<div class="${activeD}">
							<c:forEach items="${eventImg}" var="list" begin="${i}" end="${ i }">
										<div class="img-box" onclick="location.href='noticeList.no?isUser=1'">
											<img
												src="${pageContext.servletContext.contextPath }/resources/images/event/${list.noticeImgName }"
												class="media-photo" style="width: 1200px; height: 400px;">
										</div>
							</c:forEach>
								</div>
						</c:forEach>
					</div>
				</div>
				</c:if>
			</div>
		</section>
		<!--================ Hero banner start =================-->

	<!-- 	<a class="button button-hero" href="bookTemp.book">Browse Now</a> -->

		<!-- ================ trending product section start ================= -->
		<section class="section-margin calc-60px">
			<div class="container">
				<div class="section-intro">
					<p>최신 리뷰가 등록된 따끈따끈한 오늘의 책!</p>
					<div style="display: flex">
						<h2>
							<span class="section-intro__style">오늘의</span> 책
						</h2>
						<div
							style="font-weight: 700; margin: 13px; font-size: 20px; cursor: pointer;"
							onclick="moveToday(1)">국내도서</div>
						<div
							style="font-weight: 700; margin: 13px; font-size: 20px; cursor: pointer"
							onclick="moveToday(2)">eBook</div>
					</div>
				</div>


				<div style="background-color: #d9e7db; position: relative;">
					<c:if test="${fn:length(todayList_K) == 0}">
						<div id="todayDiv_1">목록이 없습니다.</div>
					</c:if>
					<c:if test="${fn:length(todayList_K) != 0}">
						<div id="todayDiv_1" style="background-color: white;">
							<c:set var="length" value="0" />
							<c:forEach var="i" begin="0" end="${fn:length(todayList_K)-1}"
								step="4">

								<ul class="bestUl" id="todayDetail${i}"
									<c:if test="${i != 0}"> style="display:none" </c:if>>
									<c:forEach begin="${i}" end="${i+3}" items="${todayList_K}"
										var="book">
										<li class="todayLi"><img class="todayImg"
											src="${pageContext.servletContext.contextPath }/resources/images/book_img/${book.bookMainImg}"
											class="media-photo" onclick="moveDetail('${book.bookISBN}')"
											alt="">
											<div class="bestTitle">${book.bookTitle}</div>
											<div>${book.bookWriter}</div></li>
									</c:forEach>
								</ul>
								<c:set var="length" value="${length+1}" />
							</c:forEach>
						</div>
						<i onclick="goToday(1,  ${length})"
							class="fas fa-chevron-left todayArrow_left"></i>
						<i style="font-size: 50px; color: gray;"
							onclick="goToday(2, ${length})"
							class="fas fa-chevron-right todayArrow_right"></i>
					</c:if>

					<c:if test="${fn:length(todayList_E) == 0}">
						<div id="todayDiv_2"
							style="background-color: white; display: none">목록이 없습니다.</div>
					</c:if>
					<c:if test="${fn:length(todayList_E) != 0}">
						<div id="todayDiv_2"
							style="background-color: white; display: none">
							<c:set var="length" value="0" />
							<c:forEach var="i" begin="0" end="${fn:length(todayList_E)-1}"
								step="4">

								<ul class="bestUl" id="todayDetail${i}"
									<c:if test="${i != 0}"> style="display:none" </c:if>>
									<c:forEach begin="${i}" end="${i+3}" items="${todayList_E}"
										var="book">
										<li class="todayLi"><img class="todayImg"
											src="${pageContext.servletContext.contextPath }/resources/images/book_img/${book.bookMainImg}"
											class="media-photo" onclick="moveDetail('${book.bookISBN}')"
											alt="">
											<div class="bestTitle">${book.bookTitle}</div>
											<div>${book.bookWriter}</div></li>
									</c:forEach>
								</ul>
								<c:set var="length" value="${length+1}" />
							</c:forEach>
						</div>
						<i onclick="goToday(1,  ${length})" class="fas fa-chevron-left todayArrow_left"></i>
						<i style="font-size: 50px; color: gray;" onclick="goToday(2, ${length})" class="fas fa-chevron-right todayArrow_right"></i>
					</c:if>
				</div>
			</div>
		</section>
		<!-- ================ trending product section end ================= -->


		<!--================ 이벤트 슬라이드2 start =================-->
		<section class="hero-banner2">
			<div class="container2">
				<div id="myCarousel2" class="carousel slide" data-ride="carousel">
					<!-- 하단 슬라이드 페이지 표시 -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel2" data-slide-to="1"></li>
						<li data-target="#myCarousel2" data-slide-to="2"></li>
					</ol>
					<!-- 슬라이드 content -->
					<div class="carousel-inner">
					<span style="position: absolute; z-index: 9; background-color: rgb(0 0 0 / 13%); width: 40px; text-align: center; top: 376px; left: 1160px;">AD</span>
						<c:forEach var="i" begin="0" end="1" step="2">
							<c:choose>
								<c:when test="${i eq 0}">
									<c:set var="activeD" value="carousel-item active" />
									<c:set var="activeA" value="carousel-item" />
									<c:set var="activeB" value="carousel-item" />
								</c:when>
								<c:otherwise>
									<c:set var="activeD" value="carousel-item" />
									<c:set var="activeA" value="carousel-item active" />
									<c:set var="activeB" value="carousel-item" />
								</c:otherwise>
							</c:choose>
							<div class="${activeD}">
								<img src="resources/img/main/007.png"
									style="width: 1200px; height: 400px;">
							</div>
							<div class="${activeA}">
								<img src="resources/img/main/008.png"
									style="width: 1200px; height: 400px;">
							</div>
							<div class="${activeB}">
								<img src="resources/img/main/006.png"
									style="width: 1200px; height: 400px;">
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</section>
		<!-- ================ offer section end ================= -->

		<!-- ================ Best Selling item  carousel ================= -->
		<section class="section-margin calc-60px">
			<div class="container">
				<div class="section-intro pb-60px">
					<p>책구메이트 회원들이 가장 많이 구매한 책</p>
					<h2>
						베스트 <span class="section-intro__style">셀러</span>
					</h2>
				</div>

				<div
					style="padding: 20px 20px 50px; background-color: #d9e7db; width: 100vw; position: absolute; left: 50%; transform: translateX(-50%); height: 700px; z-index: -1"></div>
				<div style="padding: 20px 20px 50px;">

					<c:if test="${fn:length(bestBkList) != 0}">

						<div id="bestDiv_1"
							style="background-color: white; padding: 20px; height: 650px; width: 1070px; margin: auto;">
							<c:set var="length" value="0" />
							<c:forEach var="i" begin="0" end="${fn:length(bestBkList)-1}"
								step="10">
								<ul class="bestUl" id="bestDetail${i}"
									<c:if test="${i != 0}"> style="display:none" </c:if>>
									<c:forEach begin="${i}" end="${i+9}" items="${bestBkList}"
										var="book">
										<li><img class="bestImg"
											src="${pageContext.servletContext.contextPath }/resources/images/book_img/${book.bookMainImg}"
											class="media-photo" onclick="moveDetail('${book.bookISBN}')"
											alt="">
											<div class="bestTitle">${book.bookTitle}</div>
											<div>${book.bookWriter}</div></li>
									</c:forEach>
								</ul>
								<c:set var="length" value="${length+1}" />
							</c:forEach>
						</div>
						<div id="bestDiv_2" style="cursor: pointer">
							<c:forEach var="pg" begin="1" end="${length}">
								<c:if test="${pg eq 1}">
									<a onclick="goBest(${pg}, ${length})"><i id="click${pg }" class="far fa-circle"></i></a>
								</c:if>
								<c:if test="${pg ne 1}">
									<a onclick="goBest(${pg}, ${length})"><i id="click${pg }" class="fas fa-circle"></i></a>
								</c:if>
							</c:forEach>
						</div>
					</c:if>
				</div>


			</div>
		</section>
		<!-- ================ Best Selling item  carousel end ================= -->

		<!-- ================ 화제의 신간 ================= -->
		<section class="section-margin calc-60px">
			<div class="container">
				<div class="section-intro"
					style="padding-top: 25px; padding-bottom: 25px;">
					<p>화제의 도서를 모아모아</p>
					<h2>
						화제의 <span class="section-intro__style">신간</span>
					</h2>
				</div>

				<div
					style="padding: 20px; background-color: #eee; position: relative;">

					<c:if test="${fn:length(hotBook) != 0}">

						<div id="hotDiv_1" style="background-color: white; padding: 20px;">
							<c:set var="length" value="0" />
							<c:forEach var="i" begin="0" end="${fn:length(hotBook)-1}"
								step="4">
								<ul class="hotUl" id="hotDetail${i}"
									<c:if test="${i != 0}"> style="display:none" </c:if>>
									<c:forEach begin="${i}" end="${i+3}" items="${hotBook}"
										var="book">
										<li><img class="hotImg"
											src="${pageContext.servletContext.contextPath }/resources/images/book_img/${book.bookMainImg}"
											class="media-photo" onclick="moveDetail('${book.bookISBN}')"
											alt="">
											<div style="text-align: center; width: 180px; margin-left: 45px;">
												<h6><strong>${book.bookTitle}</strong></h6>
												<div>${book.bookWriter}</div>
											</div></li>
									</c:forEach>
								</ul>
								<c:set var="length" value="${length+1}" />
							</c:forEach>
						</div>
						<i style="font-size: 50px; color: gray;"
							onclick="goHot(1, ${length})"
							class="fas fa-chevron-left hotArrow_left"></i>
						<i style="font-size: 50px; color: gray;"
							onclick="goHot(2, ${length})"
							class="fas fa-chevron-right hotArrow_right"></i>
					</c:if>
				</div>

			</div>
		</section>
		<!-- ================ 화제의 신간 end ================= -->

	</main>


	<jsp:include page="common/footer.jsp" />

	<form action="/" method="post" id="detailBookForm">
		<input type="hidden" name="bookISBN" id="inputISBN">
	</form>
</body>
</html>
