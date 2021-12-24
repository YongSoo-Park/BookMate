<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>책구메이트 - 중고장터</title>

<link rel="icon" href="resources/img/logo1.png" type="image/png">

<script type="text/javascript">

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
</script>

<style type="text/css">
.hotUl {
	display: flex;
	margin-left: 100px;
}

.hotImg {
	width: 130px;
	height: 200px;
	margin-bottom: 5px;
	cursor: pointer;
}

.hotUl li {
	margin: 40px 0px;
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
	color: #b7a4a3 !important;
	position: absolute;
	top: 200px;
	left: 45px;
}

.hotArrow_right {
	font-size: 50px;
	color: #b7a4a3 !important;
	position: absolute;
	top: 200px;
	right: 45px;
}

.card-product {
	background-color: #e7e1d8 !important;
}

.carousel-indicators li{
	background-color: #764845 !important;
}
</style>
</head>

<body style="width: 1200px; margin: auto;">

	<!--================ 바디 =================-->
	<div class="f" style="width: 1200px;">
		<div class="row">
			<jsp:include page="../ubook/ubookCategory.jsp" />

			<!--================ 메인 Content =================-->
			<div class="maincon"
				style="margin-left: 205px; width: 1010px !important;">
				<div class="container" style="padding-top: 187px;">
					<div class="row">
						<div class="col-xs-12 mainslide">
							<nav
								style="width: 1010px; margin-left: 0px; margin-top: -8px; height: 70px; background-color: #563a3d; color: #fff; text-align: center;">
								<div id="nav-tab" role="tablist" style="padding-top: 20px;">
									중고장터에 등록된 도서</div>
							</nav>
							<div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
								<div class="tab-pane fade show active" id="nav-home"
									role="tabpanel" aria-labelledby="nav-home-tab">
									<!--================ 도서 슬라이드 =================-->
									<div class="container" style="padding-top: 20px; width: 980px;">
										<div class="row">
											<div class="col-md-12"
												style="background-color: #faf8f2; border-radius: 15px;">
												<c:if test="${fn:length(randomBookList) > 8}">
													<div id="myCarousel" class="carousel slide"
														data-ride="carousel"
														style="padding: 0 0 0 0px !important;">
														<!-- 하단 슬라이드 페이지 표시 -->
														<ol class="carousel-indicators">
															<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
															<li data-target="#myCarousel" data-slide-to="1"></li>
															<li data-target="#myCarousel" data-slide-to="2"></li>
														</ol>
														<!-- 슬라이드 content -->
														<div class="carousel-inner">
															<c:forEach var="i" begin="0"
																end="${fn:length(randomBookList)-1}" step="8">
																<c:choose>
																	<c:when test="${i eq 0}">
																		<c:set var="activeD" value="carousel-item active" />
																	</c:when>
																	<c:otherwise>
																		<c:set var="activeD" value="carousel-item" />
																	</c:otherwise>
																</c:choose>
																<div class="${activeD}">
																	<div class="row">
																		<c:forEach items="${randomBookList}" var="list"
																			begin="${i}" end="${i+7}">
																			<div class="col-sm-3">
																				<div class="card text-center card-product"
																					style="width: 210px; height: 400px; background-color: #fbf5f5;"
																					onclick="location.href='ubookDetailTest.ub?ubookNo=${ list.ubookNo }&bSellerNo=${ list.BSellerNo}'">
																					<div class="img-box">
																						<img
																							src="${pageContext.servletContext.contextPath }/resources/images/Ubookimg/${list.ubookImg }"
																							class="media-photo"
																							style="width: 145px; height: 215px; cursor: pointer; padding-top: 20px;"
																							alt="">
																					</div>
																					<div class="thumb-content">
																						<h3 style="text-overflow: ellipsis;">
																							<strong>${list.ubookName }</strong>
																						</h3>
																						<p class="item-price"
																							style="font-size: 15px; font-weight: bold;">
																							<strike>${list.ubookOPrice }원</strike> <span>${list.ubookPrice }원</span>
																						</p>
																						<c:if test="${ list.ubookQual == 'S' }">
																							<span class="grade_s"
																								style="font-size: 18px; line-height: 20px; display: inline-block; padding: 0px 2px 0px; background-color: #324278; border: 1px solid #22222270; color: #fff;">
																								<c:out value="최상">최상</c:out>
																							</span>
																						</c:if>
																						<c:if test="${ list.ubookQual == 'A' }">
																							<span class="grade_s"
																								style="font-size: 18px; line-height: 20px; display: inline-block; padding: 0px 2px 0px; background-color: #28706f; border: 1px solid #22222270; color: #fff;">
																								<c:out value="상급">상급</c:out>
																							</span>
																						</c:if>
																						<c:if test="${ list.ubookQual == 'B' }">
																							<span class="grade_s"
																								style="font-size: 18px; line-height: 20px; display: inline-block; padding: 0px 2px 0px; background-color: #fcd381; border: 1px solid #22222270; color: #563a3d;">
																								<c:out value="보통">보통</c:out>
																							</span>
																						</c:if>
																						<c:if test="${ list.ubookQual == 'C' }">
																							<span class="grade_s"
																								style="font-size: 18px; line-height: 20px; display: inline-block; padding: 0px 2px 0px; background-color: #eb9b6a; border: 1px solid #22222270; color: #563a3d;">
																								<c:out value="하급">하급</c:out>
																							</span>
																						</c:if>
																						<c:if test="${ list.ubookQual == 'D' }">
																							<span class="grade_s"
																								style="font-size: 18px; line-height: 20px; display: inline-block; padding: 0px 2px 0px; background-color: #9d1d16; border: 1px solid #22222270; color: #fff;">
																								<c:out value="최하">최하</c:out>
																							</span>
																						</c:if>
																					</div>
																				</div>
																			</div>
																		</c:forEach>
																	</div>
																</div>
															</c:forEach>
														</div>
													</div>
												</c:if>
											</div>
										</div>
									</div>
									<!--================ End 도서 슬라이드 =================-->
								</div>
							</div>
						</div>
					</div>
				</div>
				<main class="site-main" style="padding-bottom: 10px;">

					<br>
					<!-- ================ 최저가 도서 ================= -->
							<nav
								style="width: 1010px; margin-left: 0px; margin-top: -8px; height: 70px; background-color: #563a3d; color: #fff; text-align: center;">
								<div id="nav-tab" role="tablist" style="padding-top: 20px; font-size: 20px;">
									중고장터의 최저가 도서</div>
							</nav>
					<section class="section-margin calc-60px"
						style="margin: 20px 0 !important;">
						<div class="container">

							<c:if test="${fn:length(rowPriceBookList) != 0}">

								<div id="hotDiv_1"
									style="background-color: #faf8f2; padding: 20px; border-radius: 15px;">
									<c:set var="length" value="0" />
									<c:forEach var="i" begin="0"
										end="${fn:length(rowPriceBookList)-1}" step="4">
										<ul class="hotUl" id="hotDetail${i}"
											<c:if test="${i != 0}"> style="display:none" </c:if>>
											<c:forEach begin="${i}" end="${i+3}"
												items="${rowPriceBookList}" var="row">
												<li onclick="location.href='ubookDetailTest.ub?ubookNo=${ row.ubookNo }&bSellerNo=${ row.BSellerNo}'"><img class="hotImg"
													src="${pageContext.servletContext.contextPath }/resources/images/Ubookimg/${row.ubookImg }"
													class="media-photo" onclick="moveDetail('${row.ubookNo}')"
													alt="">
													<div style="text-align: center; width: 180px;">
														<div>${row.ubookName}</div>
														<div style="color: #999;"><strike>${row.ubookOPrice }원</strike></div>
														<div style="color: #4f4fb5; font-weight: bold;">${row.ubookPrice}원</div>
														<c:if test="${ row.ubookQual == 'S' }">
															<span class="grade_s"
																style="font-size: 18px; line-height: 20px; display: inline-block; padding: 0px 2px 0px; background-color: #324278; border: 1px solid #22222270; color: #fff;">
																<c:out value="최상">최상</c:out>
															</span>
														</c:if>
														<c:if test="${ row.ubookQual == 'A' }">
															<span class="grade_s"
																style="font-size: 18px; line-height: 20px; display: inline-block; padding: 0px 2px 0px; background-color: #28706f; border: 1px solid #22222270; color: #fff;">
																<c:out value="상급">상급</c:out>
															</span>
														</c:if>
														<c:if test="${ row.ubookQual == 'B' }">
															<span class="grade_s"
																style="font-size: 18px; line-height: 20px; display: inline-block; padding: 0px 2px 0px; background-color: #fcd381; border: 1px solid #22222270; color: #563a3d;">
																<c:out value="보통">보통</c:out>
															</span>
														</c:if>
														<c:if test="${ row.ubookQual == 'C' }">
															<span class="grade_s"
																style="font-size: 18px; line-height: 20px; display: inline-block; padding: 0px 2px 0px; background-color: #eb9b6a; border: 1px solid #22222270; color: #563a3d;">
																<c:out value="하급">하급</c:out>
															</span>
														</c:if>
														<c:if test="${ row.ubookQual == 'D' }">
															<span class="grade_s"
																style="font-size: 18px; line-height: 20px; display: inline-block; padding: 0px 2px 0px; background-color: #9d1d16; border: 1px solid #22222270; color: #fff;">
																<c:out value="최하">최하</c:out>
															</span>
														</c:if>
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
					</section>
					<!-- ================ 최저가 end ================= -->
					<br>
					<section class="">
						<div class="container">
							<div class="subscribe text-center"
								style="background-color: #faf8f2; margin-bottom: 20px; border-radius: 15px; box-shadow: none !important; height: 320px;">
								<div class="row sellerbtn">

									<!-- ================ 로그인 안했을 때 -> alert로 로그인 진행하게끔 ================= -->
									<c:if
										test="${ empty sessionScope.loginUser && empty s.sellerId }">
										<section class="goseller" style="width: 100% !important;">
											<div class="container">

												<button class="gobtn text-center" type="button"
													onclick="loginChk();"
													style="margin-left: 15px; background-image: url(resources/img/002.png); width: 760px !important; color: #ffffff; height: 150px; border: none;">
													<h3 class="subscribe__title" style="color: #fff;">
														아직 판매자가<br>아니라면?
													</h3>
													<h4 style="color: #fff;">로그인을 하신 후에 판매자 가입해주세요</h4>
												</button>
												<script type="text/javascript">
													function loginChk() {
														alert("책구메이트 로그인 혹은 회원가입을 우선 진행해주세요!");
													}
												</script>
											</div>
										</section>
									</c:if>
									<!-- ================ 판매자 가입 안했을 때 =================-->
									<c:if
										test="${ !empty sessionScope.loginUser && empty s.sellerId }">
										<section class="goseller">
											<div class="container">
												<button class="gobtn text-center" type="button"
													onclick="location.href='sellerInsertForm.se'"
													style="width: 180px; background-image: url(resources/img/001.png);width: 380px;">
													<h3 class="subscribe__title" style="color: #fff;">
														아직 판매자가<br>아니라면?
													</h3>
													<h4 style="color: #fff;">판매자 가입하기</h4>
												</button>
											</div>
										</section>
										<section class="goseller">
											<div class="container">
												<button class="gobtn text-center"
													onclick="location.href='sellerInsertForm.se'"
													style="background-image: url(resources/img/001.png);width: 380px;">
													<h3 class="subscribe__title" style="color: #fff;">
														안읽는 책을<br>팔고싶다면?
													</h3>
													<h4 style="color: #fff;">도서 등록하기</h4>
												</button>
											</div>
										</section>
									</c:if>
									<!-- ================ 로그인도하고 판매자 가입도 된 상태일 때 ================= -->
									<c:if test="${ !empty s.sellerId && s.status eq 'Y' }">
										<section class="goseller">
											<div class="container">
												<button class="gobtn text-center" type="button"
													onclick="location.href='sellerPage.se'"
													style="background-image: url(resources/img/001.png);width: 380px; ">
													<h3 class="subscribe__title" style="color: #fff;">${ s.sellerNickN }님
														<br>환영합니다
													</h3>
													<h4 style="color: #fff;">판매자 페이지로 이동</h4>
												</button>
											</div>
										</section>
										<section class="goseller">
											<div class="container">
												<button class="gobtn text-center"
													onclick="location.href='sellerPage.se'"
													style="background-image: url(resources/img/001.png);width: 380px;">
													<h3 class="subscribe__title" style="color: #fff;">
														안읽는 책을<br>팔고싶다면?
													</h3>
													<h4 style="color: #fff;">도서 등록하기</h4>
												</button>
											</div>
										</section>
									</c:if>
									<!-- ================ 판매자 휴면한 상태일 때 ================= -->
									<c:if test="${ s.status eq 'N' }">
										<section class="goseller">
											<div class="container">
												<button class="gobtn2 text-center" type="button"
													onclick="location.href='#'"
													style="margin-left: 15px; background-image: url(resources/img/002.png); width: 760px !important; color: #ffffff; height: 150px; border: none;">
													<h3 class="subscribe__title">
														현재 판매자 계정이<br>휴면 상태입니다.
													</h3>
													<h4>문의로 휴면 해제를 요청해주세요.</h4>
												</button>
											</div>
										</section>
									</c:if>
								</div>
							</div>
						</div>
					</section>
					<!-- ================ End 도서검색 ================= -->

				</main>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>

</html>