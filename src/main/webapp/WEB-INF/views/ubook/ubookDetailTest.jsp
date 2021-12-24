<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책구메이트 - 중고장터</title>
<link rel="icon" href="resources/img/logo1.png" type="image/png">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
.detail_menu{
	margin-top: 100px !important;
}
</style>
</head>
<body style="width: 1200px; margin: auto;">

			<jsp:include page="../ubook/ubookCategory.jsp" />
	<div >
		<div class="row" style="width: 1325px;">
			<!-- s:html -->
			<!--================ 메인 Content =================-->
			<div class="col-xl-9 col-lg-8 col-md-7 maincon" style="margin-left: 220px; width: 1080px; margin-top: 93px;">
				<div
					style="background-color: #faf8f2; overflow: hidden; height: auto; margin: 100px 0px 20px 0px;">
					<!-- detail_product  -->
					<div class="detail_product"
						style="float: left; margin: 13px 0 0; width: 870px; padding: 0; display: block;">
						<div class="detail_content type_2"
							style="width: 108%; padding: 0; background: none; border: 2px solid #5b8a5b; margin-left: 10px;">
							<div class="inner" style="padding: 43px 0 0 0;">
								<!-- product_image -->
								<div class="product_image"
									style="position: relative; float: left; width: 245px; padding: 0 36px 0 43px; padding: 0 0px 0 43px; margin-bottom: 140px;">
									<div class="photo" style="width: 200px; margin: 0; padding: 0;">
										<div
											style="padding: 5px 7px 7px 6px; line-height: 0; font-size: 0; margin: 0;">
											<img
												src="${pageContext.servletContext.contextPath }/resources/images/Ubookimg/${ubook.ubookImg}"
												class="photo" style="width: 300px; height: auto;" />

										</div>
									</div>

									<div class="summary_info"
										style="width: 250px; margin: 0px 0px 0px 0px; padding: 10px 0 0 60px; color: #000; font-size: 15px; text-align: center;">
										ISBN-13 : ${ ubook.ubookIsbn }</div>

								</div>
								<!--// product_image -->

								<!-- product_detail_info -->
								<div class="product_detail_info"
									style="width: 450px; float: right; padding: 0 40px 11px 0; margin: 0 40px 0 0px; margin-right: none; margin-right: none !important;">
									<div class="subject" style="padding: 0px 20px 10px 30px;">
										<span class="title"
											style="font-size: 19px; font-weight: bold;"><c:out
												value="${ ubook.ubookName }" /></span> <span class="info"
											style="font-weight: normal; font-size: 11px; color: #5A6AA1; vertical-align: middle;">
											[중고] </span>
									</div>
									<div class="issue"
										style="padding: 0 70px 14px 30px; font-size: 15px; color: #8e8e8e;">
										저자 ${ ubook.ubookWriter } | 출판사 ${ ubook.ubookPub }</div>

									<dl class="basic"
										style="margin: 5px 0 0 0; padding: 0 0 10px 30px; width: 361px; display: block; margin-block-start: 1em; margin-block-end: 1em; margin-inline-start: 0px; margin-inline-end: 0px; font-size: 15px;">
										<dt class="fixed_price"
											style="float: left; margin: 5px 0 0 0; padding: 0 0 0 7px; width: 70px; font-weight: bold;">정가</dt>
										<dd class="fixed_price"
											style="float: left; margin: 5px 0 0 0; width: 253px;">
											<del
												style="margin: 0; padding: 0; text-decoration: line-through;">${ ubook.ubookOPrice }원</del>
										</dd>
										<dt class="sales_price"
											style="float: left; margin: 5px 0 0 0; padding: 0 0 0 7px; width: 70px; font-weight: bold;">판매가</dt>
										<dd class="sales_price"
											style="float: left; margin: 5px 0 0 0; width: 255px;">
											<strong class="price" style="color: #fe6000;">${ ubook.ubookPrice }원</strong>
											<span style="color: #5E6B9F;">[<strong>${ ubook.ubookOPrice - ubook.ubookPrice }</strong>원
												할인]
											</span>
										</dd>
									</dl>

									<dl class="delivery_gift"
										style="padding: 10px 0 0px 30px; width: 340px; margin: 0; padding: 0;">
										<dt class="delivery-price"
											style="float: left; padding: 2px 0 0 36px; width: 95px; margin-top: 5px; font-size: 15px;">배송비</dt>
										<dd class="delivery-price"
											style="float: left; padding: 5px 0 10px; width: 232px; font-size: 15px; line-height: 1.3em; margin-left: 7px;">
											<strong>2,600</strong>원 <br> <span class="delivery">
												도서산간지역 추가배송비 : 4,000원 </span>
										</dd>
									</dl>
									<dl class="delivery_gift"
										style="padding: 10px 0 0px 30px; width: 340px;">
										<dt class="delivery-price"
											style="float: left; padding: 2px 0 0 6px; width: 73px; margin-top: 5px; font-size: 15px;">배송일정</dt>
										<dd class="delivery-price"
											style="float: left; padding: 9px 0 10px; width: 235px; font-size: 15px; line-height: 1.3em;">
											<span class="delivery" style="color: #8e8e8e;"> 지금
												주문하면 <span class="delivery-day"> 3일 이내 </span> 출고 예정 <br>
												토/일, 공휴일을 제외한 영업일 기준으로 배송이 진행됩니다. 단순변심으로 인한 구매취소 및 환불에 대한
												배송비는 구매자 부담입니다. <br>
											</span>
										</dd>
									</dl>

									<div class="release"
										style="padding: 180px 0 0 36px; width: 350px; font-size: 15px; line-height: 1.3em; color: #000000;">
										<span class="release" style="color: #212529;"><strong>출판연도</strong>
											&nbsp; <fmt:formatDate value="${ubook.ubookPubDate}"
												pattern="yyyy년 MM월 dd일" /> </span> <br> <br> 
											<span class="release" style="color: #212529;"><strong>판매자</strong>
											&nbsp; <strong style="color: #09992f">${ubook.sellerNickN}</strong></span>
											<br><br>
											<span class="release" style="color: #212529;"><strong>배송방법</strong>
											
											&nbsp; <strong style="color: #09992f">
											<c:if test="${ ubook.sellerDel == 'conveni' }">
													<c:out value="편의점 택배">편의점 택배</c:out>
												</c:if>
												<c:if test="${ ubook.sellerDel == 'self' }">
													<c:out value="판매자가 직접 택배사 선택">판매자가 택배사 선택</c:out>
												</c:if>
												</strong>
										</span>

									</div>

									<div class="state_lowest_new"
										style="padding: 10px 0 10px 0; margin: 0 0 0 30px; width: 350px;">
										<dl class="product_state"
											style="width: 350px; color: #212529;">
											<dt
												style="float: left; padding: 2px 0 0 6px; width: 83px; font-size: 15px;">제품상태</dt>
											<dd
												style="float: left; padding: 4px 0 8px; width: 246px; font-size: 15px; line-height: 1.3em;">
												<c:if test="${ ubook.ubookQual == 'S' }">
													<c:out value="최상">최상</c:out>
												</c:if>
												<c:if test="${ ubook.ubookQual == 'A' }">
													<c:out value="상급">상급</c:out>
												</c:if>
												<c:if test="${ ubook.ubookQual == 'B' }">
													<c:out value="보통">보통</c:out>
												</c:if>
												<c:if test="${ ubook.ubookQual == 'C' }">
													<c:out value="하급">하급</c:out>
												</c:if>
												<c:if test="${ ubook.ubookQual == 'D' }">
													<c:out value="최하">최하</c:out>
												</c:if>
											</dd>
										</dl>


										<script type="text/javascript">
											function goCart() {
												var cartUserId = "${sessionScope.loginUser.userId}"
										        var cartCount = parseInt($('#order-quantity').val())
												if (cartUserId == null||cartUserId == "") {
													alert("로그인이 필요합니다.");
													return false;
												}
												$.ajax({
										        	
									        		url : "insertCart.ub",
									        		data : {
									        			cartUserId : cartUserId,
									        			cartUbNo : "${requestScope.ubook.ubookNo}",
									        			cartCount : cartCount
									        		},
									        		
									        		type : "post" ,
									        		success : function(str) {
									        			if(str == 'already'){
									        				alert('이미 장바구니에 있는 상품입니다.')
									        			}else{
															if(confirm("상품을 장바구니에 담았습니다. 장바구니로 이동하시겠습니까?")){
																$('#moveCartForm').submit();
															}
															return false;
									        			}
													}
									        		
									        		
									        	})
										
											}
										</script>
									</div>
									<!-- end state-lowest-new -->

									<div class="order_quantity"
										style="margin: 10px 0 0 30px; padding: 10px 0 10px 0; width: 350px; border-top: 1px solid #dcddd7; font-size: 15px;">
										<div style="clear: both; margin-bottom: 60px;">
											<label for="order-quantity"
												style="display: inline-block; padding: 2px 0 0 6px; font-weight: bold;">주문가능수량</label>
											<input type="number" id="order-quantity" value="${ ubook.ubookStock }" max="${ ubook.ubookStock }" min="${ ubook.ubookStock }"
												onkeydown="onlyNum(event, this)" title="주문수량입력"
												style="margin: 0 0 0 10px; padding: 2px 2px 0 0; width: 50px; height: 25px; text-align: center; border: 1px solid #ddd;">
										</div>
										
										<c:if test="${ ubook.ubookStock ne 0 && ubook.sellerId eq loginUser.userId}">
										<span
											style="width: 124px; font-size: 12px !important; margin-right: 10px; background-image: none; background-color: #dcd3cc !important; border: 1px solid #dcd3cc; color: black; !important; padding: 7px 12px 1px; box-shadow: none; height: 33px; text-align: center;">내가 등록한 도서</span>
										</c:if>
										<c:if test="${ ubook.ubookStock ne 0 && ubook.sellerId ne loginUser.userId}">
										<a onclick="goCart()" class="btn_large btn_blue"
											style="width: 124px; font-size: 12px !important; margin-right: 10px; background-image: none; background-color: #5cb85c !important; border: 1px solid #5cb85c; color: #fff !important; padding: 7px 12px 1px; box-shadow: none; height: 33px; text-align: center;">장바구니에
											담기</a> <!-- <a href="#" class="btn_large btn_blue2"
											style="width: 124px; font-size: 12px !important; margin-right: 10px; background-image: none; background-color: #5b8a5b !important; border: 1px solid #5b8a5b; color: #fff !important; padding: 7px 12px 1px; box-shadow: none; height: 33px; text-align: center;">바로
											구매하기</a> -->
										</c:if>
										<c:if test="${ ubook.ubookStock eq 0 && ubook.sellerId ne loginUser.userId}">
										<a class="btn_large btn_blue"
											style="width: 225px; font-size: 12px !important; margin-right: 10px; background-image: none; background-color: #bb937e !important; border: 1px solid #bb937e; color: #fff !important; padding: 7px 12px 1px; box-shadow: none; height: 33px; text-align: center;">이미 판매된 상품입니다</a>
										</c:if>
												<form action="selectBook.book" method="post" id="detailBookForm">
														<input type="hidden" name="cartUbNo" id="ubookNo" value="${ ubook.ubookNo }">
													</form>
													
													<form action="ubookCart.ub" method="post" id="moveCartForm">
													
													<input type="hidden" value="${sessionScope.loginUser.userId}" name="cartUserId">
											
												</form>
									</div>
								</div>
								<div class="product_detail_bottom">
									<div class="button_buy" style="padding: 0 0 0 0; clear: both;">

									</div>
									<div class="detail_information"
										style="margin: 0; padding: 20px 43px 25px; font-size: 15px; letter-spacing: -1px; line-height: 1.4em; border: 1px solid #EDEDED; background: #fafafa;">
										<p style="padding: 10px 0 0 5px;">
											책장메이트에 등록된 판매상품과 제품의 상태는 개별 판매자들이 등록, 판매하는 것으로<br>중개시스템만을
											제공하는 책구메이트는 해당 상품과 내용에 대해 일체 책임을 지지 않습니다.<br> 상단 제품상태와
											하단 상품 상세를 꼭 확인하신 후 구입해주시기 바랍니다.
										</p>
										<p style="padding: 10px 0 0 5px;">책구메이트 결제 시스템을 이용하지 않은
											직거래로 인한 피해 발생 시 책구메이트는 일체 책임을 지지 않습니다.</p>

										<p style="padding: 10px 0 0 5px;">
											책장메이트에 등록된 판매 상품과 제품의 상태는 개별 오픈마켓 판매자들이 등록, 판매하는 것으로 <br>중개
											시스템만을 제공하는 인터넷 책구메이트에서는 해당 상품과 내용에 대해 일체 책임을 지지 않습니다.
										</p>
									</div>
								</div>
							</div>
						</div>

						<!-- 판매자 다른 상품 -->
						<div class="seller_another_product"
							style="position: relative; margin: 10px 0 10px 10px; border: 1px solid #5b8a5b; width: 940px;">
							<h2
								style="color: #333; font-size: 13px; letter-spacing: -0.05em; padding: 8px 15px; background-color: #d1e7d1;">
								중고책 추천 (판매자 <span>다른</span> 상품)
							</h2>
							
							<ul style="padding: 15px; height: 290px;">
							
							<c:forEach items="${ sellerBookList }" var="sellerB" varStatus="status">
								<li
									style="float: left; width: 20%; text-align: center;">
									<p class="photo">
										<a href="ubookDetailTest.ub?ubookNo=${ sellerB.ubookNo }&bSellerNo=${sellerB.BSellerNo}" style="color: #4d4d4d; text-decoration: none;">
											<img
											src="${pageContext.servletContext.contextPath }/resources/images/Ubookimg/${sellerB.ubookImg}"
											onerror="this.src='http://image.kyobobook.co.kr/new_ink/used/web/images/common/noimage_150_215.gif'"
											style="width: 100px; height: auto; border: 1px solid #ccc; transition: all .3s;">
										</a>
									</p>
									<div class="info" style="margin: 10px 5px 0; padding: 0; font-size: 15px;">
										${sellerB.ubookName }
										<p class="price" style="padding: 5px 0 5px 0; color: #fe6000;">${sellerB.ubookPrice }원</p>
										<p class="quality">
											<c:if test="${ sellerB.ubookQual == 'S' }">
																							<span class="grade_s"
																								style="font-size: 18px; line-height: 20px; display: inline-block; padding: 0px 2px 0px; background-color: #324278; border: 1px solid #22222270; color: #fff;">
																								<c:out value="최상">최상</c:out>
																							</span>
																						</c:if>
																						<c:if test="${ sellerB.ubookQual == 'A' }">
																							<span class="grade_s"
																								style="font-size: 18px; line-height: 20px; display: inline-block; padding: 0px 2px 0px; background-color: #28706f; border: 1px solid #22222270; color: #fff;">
																								<c:out value="상급">상급</c:out>
																							</span>
																						</c:if>
																						<c:if test="${ sellerB.ubookQual == 'B' }">
																							<span class="grade_s"
																								style="font-size: 18px; line-height: 20px; display: inline-block; padding: 0px 2px 0px; background-color: #fcd381; border: 1px solid #22222270; color: #563a3d;">
																								<c:out value="보통">보통</c:out>
																							</span>
																						</c:if>
																						<c:if test="${ sellerB.ubookQual == 'C' }">
																							<span class="grade_s"
																								style="font-size: 18px; line-height: 20px; display: inline-block; padding: 0px 2px 0px; background-color: #eb9b6a; border: 1px solid #22222270; color: #563a3d;">
																								<c:out value="하급">하급</c:out>
																							</span>
																						</c:if>
																						<c:if test="${ sellerB.ubookQual == 'D' }">
																							<span class="grade_s"
																								style="font-size: 18px; line-height: 20px; display: inline-block; padding: 0px 2px 0px; background-color: #9d1d16; border: 1px solid #22222270; color: #fff;">
																								<c:out value="최하">최하</c:out>
																							</span>
																						</c:if>
										</p>
									</div>
								</li>
							</c:forEach>
								
							</ul>
						</div>
						<!--// 판매자 다른 상품 -->

						<div class="detail_menu_content"
							style="margin: 25px 0 0 10px; width: 870px; line-height: 1.3em; font-size: 15px;">

							<!-- 탭메뉴 -->


							<div id="used_info_content" class="detail_menu"
								style="width: 108%; height: 60px; letter-spacing: -0.03em; margin: 0 0 10px 0;">
								<ul class="main"
									style="width: 100%; padding: 1px 0 0 0; height: 30px; border-bottom: 2px solid #5b8a5b;">
									<li class="on"
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0;"><a
										href="#used_info_content"
										style="color: #3378b3; height: 29px; border: 2px solid #3378b3; border-bottom: none; margin: 0 0 -2px 0; background: #d1e7d1; height: 20 px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #dadada; border-bottom: none; background: #d1e7d1; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">판매자
											상품 정보</a>
										<ul class="sub m01"
											style="position: absolute; top: 42px; left: 0px; width: 400px;">
											<li class="first" style="float: left; padding: 0 7px;"><a
												href="#seller_product_info"
												style="line-height: 12px; color: #666;">판매자 상품 소개</a></li>
											<li style="float: left; padding: 0 7px;"><a
												href="#seller_delivery"
												style="line-height: 12px; color: #666;">배송정책</a></li>
										</ul></li>
									<li
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
										href="#info_content"
										style="height: 26px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #DADADA; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">도서
											정보 </a></li>
									<li
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
										href="#member_refund"
										style="height: 26px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #DADADA; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">교환/반품
											안내 </a></li>
									<li hidden="hidden"
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
										href="#seller_postscript_content"
										style="height: 26px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #dadada; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">판매자
											전체 후기 <span
											style="font-size: 11px; font-weight: normal; text-decoration: none;">[119건]</span>
									</a></li>
									<li
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
										href="#question"
										style="height: 26px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #DADADA; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">상품 문의
</a></li>
								</ul>
							</div>
							<!--// 탭메뉴 -->

							<!-- 중고 도서 정보 -->
							<div class="used_info_content"
								style="padding: 20px 20px 20px 20px; margin: 0 0 20px 0; border: 1px solid #e3e3e3; background: #fafafa; width: 108%;">
								<div id="seller_product_info" class="seller_product_info">
									<h2
										style="font-size: 16px; padding: 0px 0px 0px 8px; margin: 0 0 10px 0px; color: #333; text-align: left;">판매자
										상품 소개</h2>
									<div style="margin-left: 20px;">※ 해당 상품은 중고 상품으로서 제품 상태를 반드시 확인하신 후 구입하여주시기 바랍니다.</div>
								</div>

								<div id="seller_delivery" class="seller_delivery"
									style="margin: 15px 0 0 0; padding: 15px 0 0 0;">
									<h2
										style="font-size: 16px; padding: 0px 0px 0px 8px; margin: 0 0 10px 0; color: #333; text-align: left;">판매자
										배송 정책</h2>
									<ul style="padding: 0px 0 25px 0px; margin-left: 20px;">
										<li style="padding: 0 0 0 6px;">판매자의 일정에 따라 배송이 진행됩니다.</li>
									</ul>
								</div>
							</div>
							<!--// 중고 도서 정보 -->
							<!-- 탭메뉴 -->
							<div id="used_info_content" class="detail_menu"
								style="width: 108%; height: 60px; letter-spacing: -0.03em; margin: 0 0 10px 0;">
								<ul class="main"
									style="width: 100%; padding: 1px 0 0 0; height: 30px; border-bottom: 2px solid #5b8a5b;">
									<li
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0;"><a
										href="#used_info_content"
										style="color: #3378b3; height: 26px; border: 2px solid #3378b3; border-bottom: none; margin: 0 0 -2px 0; background: #fff; height: 20 px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #dadada; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">판매자
											상품 정보</a></li>
									<li class="on"
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
										href="#info_content"
										style="height: 29px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #DADADA; border-bottom: none; background: #d1e7d1; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">도서
											정보 </a>

										<ul class="sub m01"
											style="position: absolute; top: 42px; left: 0px; width: 400px;">
											<li class="first" style="float: left; padding: 0 7px;"><a
												href="#book_info_detail"
												style="line-height: 12px; color: #666;">도서 줄거리 및 내용</a></li>
											<li style="float: left; padding: 0 7px;"><a
												href="#book_info_content"
												style="line-height: 12px; color: #666;">도서 목차</a></li>
										</ul></li>
									<li
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
										href="#member_refund"
										style="height: 26px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #DADADA; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">교환/반품
											안내 </a></li>
									<li hidden="hidden"
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
										href="#seller_postscript_content"
										style="height: 26px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #dadada; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">판매자
											전체 후기 <span
											style="font-size: 11px; font-weight: normal; text-decoration: none;">[119건]</span>
									</a></li>
									<li
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
										href="#question"
										style="height: 26px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #DADADA; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">상품 문의
</a></li>
								</ul>
							</div>
							<!--// 탭메뉴 -->

							<!-- 도서 정보 -->
							<div class="info_content" id="info_content">
								<div id="info_content02"
									style="margin: 25px 0 0 0; width: 717px; line-height: 1.3em;">
									<div class="book_info_content dot_line" id="book_info_detail"
										style="margin: 0 0 20px 0; padding-bottom: 20px; width: 131%;">
										<table summary="도서 줄거리 및 내용"
											style="width: 100%; border-collapse: collapse; border-spacing: 0; table-layout: fixed; border-top: 1px solid #e2e2e2; width: 100%; border-bottom: 1px solid #e2e2e2; border-right: 1px solid #e2e2e2; text-align: center; font-size: 11px;">
											<caption
												style="height: 0; font-size: 0; line-height: 0; visibility: hidden;">
												도서 줄거리 및 내용</caption>
											<thead
												style="display: table-header-group; vertical-align: middle; border-color: inherit;">
												<tr
													style="display: table-row; vertical-align: inherit; border-color: inherit;">
													<th scope="col"
														style="background-color: #edefed; padding: 6px 0 5px 0; border-bottom: 1px solid #e2e2e2; border-left: 1px solid #e2e2e2; color: #666; font-size: 15px; letter-spacing: -0.03em;">도서
														줄거리 및 내용</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
										<p class="txt" style="margin: 15px 0 0 0; padding: 0; font-size: 15px;">${ ubook.ubookDetail }</p>
									</div>
								</div>
								<div id="info_content04">
									<div class="book_info_content dot_line" id="book_info_content"
										style="margin: 0 0 20px 0; padding-bottom: 20px; width: 108%;">
										<table summary="도서 목차"
											style="width: 100%; border-collapse: collapse; border-spacing: 0; table-layout: fixed; border-top: 1px solid #e2e2e2; width: 100%; border-bottom: 1px solid #e2e2e2; border-right: 1px solid #e2e2e2; text-align: center; font-size: 11px;">
											<caption
												style="height: 0; font-size: 0; line-height: 0; visibility: hidden;">
												도서 목차</caption>
											<thead
												style="display: table-header-group; vertical-align: middle; border-color: inherit;">
												<tr
													style="display: table-row; vertical-align: inherit; border-color: inherit;">
													<th scope="col"
														style="background-color: #edefed; padding: 6px 0 5px 0; border-bottom: 1px solid #e2e2e2; border-left: 1px solid #e2e2e2; color: #666; font-size: 15px; letter-spacing: -0.03em;">도서
														목차</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
										<p class="txt" style="margin: 15px 0 0 0; padding: 0;">${ ubook.ubookContent }</p>
									</div>
								</div>
							</div>
							<!-- 도서 정보 -->

							<!-- 탭메뉴 -->
							<div id="used_info_content" class="detail_menu"
								style="width: 108%; height: 60px; letter-spacing: -0.03em; margin: 0 0 10px 0;">
								<ul class="main"
									style="width: 100%; padding: 1px 0 0 0; height: 30px; border-bottom: 2px solid #5b8a5b;">
									<li
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0;"><a
										href="#used_info_content"
										style="color: #3378b3; height: 26px; border: 2px solid #3378b3; border-bottom: none; margin: 0 0 -2px 0; background: #fff; height: 20 px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #dadada; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">판매자
											상품 정보</a></li>
									<li
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
										href="#info_content"
										style="height: 26px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #DADADA; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">도서
											정보 </a></li>
									<li class="on"
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
										href="#member_refund"
										style="height: 29px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #DADADA; border-bottom: none; background: #d1e7d1; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">교환/반품
											안내 </a>

										<ul class="sub m01"
											style="position: absolute; top: 42px; left: 0px; width: 400px;">
											<li style="float: left; padding: 0 7px;"><a
												href="#member_refund"
												style="line-height: 12px; color: #666;">도서 교환/반품</a></li>
										</ul></li>
									<li hidden="hidden"
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
										href="#seller_postscript_content"
										style="height: 26px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #dadada; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">판매자
											전체 후기 <span
											style="font-size: 11px; font-weight: normal; text-decoration: none;">[119건]</span>
									</a></li>
									<li
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
										href="#question"
										style="height: 26px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #DADADA; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">상품 문의
</a></li>
								</ul>
							</div>
							<!--// 탭메뉴 -->
							<!-- 교환/반품안내 -->
							<div class="member_refund" id="member_refund">
								<p class="info" style="margin: 0 0 5px 0; width: 108%;">
									※ 상품 설명에 반품/교환 관련한 안내가 있는 경우 그 내용을 우선으로 합니다.<br> (업체 사정에
									따라 달라질 수 있습니다.)
								</p>
								<table summary="교환/반품안내"
									style="border-collapse: collapse; border-spacing: 0; table-layout: fixed; border-top: 1px solid #5b8a5b; border-right: 1px solid #d1e7d1; border-bottom: 1px solid #e1e1e1; width: 108%; text-align: left; font-size: 15px; margin-bottom: 20px;">

									<colgroup>
										<col width="130px">
										<col width="*">
									</colgroup>
									<tbody
										style="display: table-row-group; vertical-align: middle; border-color: inherit;">
										<tr
											style="display: table-row; vertical-align: inherit; border-color: inherit;">
											<th scope="row"
												style="text-align: center; vertical-align: middle; padding: 8px 0 7px 0; border-bottom: 1px solid #5b8a5b; border-left: 1px solid #e1e1e1; background: #d1e7d1; color: #62655c; letter-spacing: -0.03em; font-weight: normal;"><span>반품/교환
													안내</span></th>
											<td
												style="padding: 8px 10px 2px 10px; border-bottom: 1px solid #5b8a5b; border-left: 1px solid #e1e1e1; letter-spacing: -0.03em; line-height: 16px;">
												<p style="margin: 0 0 5px 0;">
													<strong>[중고도서 반품 및 교환 안내]</strong>
												</p>
												<p>
													※ 중고도서의 경우 중고 상품 특성상 반품 및 교환이 불가능합니다.<br> 구매 시 주의하여
													구매하시기 바랍니다.
												</p>
											</td>
										</tr>
										<tr
											style="display: table-row; vertical-align: inherit; border-color: inherit;">
											<th scope="row"
												style="text-align: center; vertical-align: middle; padding: 8px 0 7px 0; border-bottom: 1px solid #5b8a5b; border-left: 1px solid #e1e1e1; background: #d1e7d1; color: #62655c; letter-spacing: -0.03em; font-weight: normal;"><span>소비자
													피해보상</span></th>
											<td
												style="padding: 8px 10px 2px 10px; border-bottom: 1px solid #5b8a5b; border-left: 1px solid #e1e1e1; letter-spacing: -0.03em; line-height: 16px;">
												<p style="margin: 0 0 5px 0;">- 상품의 불량에 의한 교환, A/S, 환불,
													품질보증 및 피해보상 등에 관한 사항은 소비자분쟁해결 기준 (공정거래위원회 고시)에 준하여 처리됨</p>
												<p style="margin: 0 0 5px 0;">- 대금 환불 및 환불지연에 따른 배상금 지급
													조건, 절차 등은 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 처리함</p>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!--// 교환/반품안내 -->

							<!-- 탭메뉴
							<div id="used_info_content" class="detail_menu"
								style="width: 100%; height: 60px; letter-spacing: -0.03em; margin: 0 0 10px 0;">
								<ul class="main"
									style="width: 100%; padding: 1px 0 0 0; height: 30px; border-bottom: 2px solid #5b8a5b;">
									<li
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0;"><a
										href="#used_info_content"
										style="color: #3378b3; height: 26px; border: 2px solid #3378b3; border-bottom: none; margin: 0 0 -2px 0; background: #fff; height: 20 px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #dadada; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">판매자
											상품 정보</a></li>
									<li
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
										href="#info_content"
										style="height: 26px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #DADADA; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">도서
											정보 </a></li>
									<li
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
										href="#member_refund"
										style="height: 26px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #DADADA; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">교환/반품
											안내 </a></li>
									<li  hidden="hidden"
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
										href="#seller_postscript_content"
										style="height: 29px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #dadada; border-bottom: none; background: #d1e7d1; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">판매자
											전체 후기 <span
											style="font-size: 11px; font-weight: normal; text-decoration: none;">[119건]</span>
									</a>

										<ul class="sub m01"
											style="position: absolute; top: 42px; left: 0px; width: 400px;">
											<li class="first" style="float: left; padding: 0 7px;"><a
												href="#seller_postscript_content"
												style="line-height: 12px; color: #666;">판매자 후기</a></li>
										</ul></li>
									<li
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
										href="#question"
										style="height: 26px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #DADADA; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">상품 문의
</a></li>
								</ul>
							</div>
							<!--// 탭메뉴 -->

							<!-- 판매자 후기 -->
							<div class="seller_postscript_content" hidden="hidden"
								id="seller_postscript_content"
								style="margin: 0 0 20px 0; padding: 0;">
								<table summary="구매후기 목록을 번호, 구매후기, ID, 등록일로 보실수 있습니다."
									style="border-collapse: collapse; border-spacing: 0; table-layout: fixed; border-top: 1px solid #899bdb; width: 100%; border-bottom: 1px solid #bebebe; text-align: center;">
									<caption
										style="height: 0; font-size: 0; line-height: 0; visibility: hidden;">구매후기
										목록</caption>
									<colgroup>
										<col width="40px">
										<col width="*">
										<col width="100px">
										<col width="90px">
									</colgroup>
									<thead
										style="display: table-header-group; vertical-align: middle; border-color: inherit;">
										<tr
											style="display: table-row; vertical-align: inherit; border-color: inherit;">
											<th scope="col"
												style="padding: 8px 0 7px 0; border-bottom: 1px solid #5b8a5b; border-top: 1px solid #5b8a5b; background: #d1e7d1; color: #666; font-size: 11px; letter-spacing: -0.03em;">NO</th>
											<th scope="col"
												style="padding: 8px 0 7px 0; border-bottom: 1px solid #5b8a5b; border-top: 1px solid #5b8a5b; background: #d1e7d1; color: #666; font-size: 11px; letter-spacing: -0.03em;">구매후기</th>
											<th scope="col"
												style="padding: 8px 0 7px 0; border-bottom: 1px solid #5b8a5b; border-top: 1px solid #5b8a5b; background: #d1e7d1; color: #666; font-size: 11px; letter-spacing: -0.03em;">ID</th>
											<th scope="col"
												style="padding: 8px 0 7px 0; border-bottom: 1px solid #5b8a5b; border-top: 1px solid #5b8a5b; background: #d1e7d1; color: #666; font-size: 11px; letter-spacing: -0.03em;">등록일</th>
										</tr>
									</thead>
									<tbody
										style="display: table-row-group; vertical-align: middle; border-color: inherit;">
										<tr
											style="display: table-row; vertical-align: inherit; border-color: inherit;">
											<td
												style="padding: 8px 0 7px 0; border-bottom: 1px solid #e1e1e1; text-align: center; letter-spacing: -0.03em;">119</td>
											<td class="subject"
												style="padding: 8px 0 7px 0; border-bottom: 1px solid #e1e1e1; text-align: center; letter-spacing: -0.03em;">받았습니다
												받았습니다</td>
											<td
												style="padding: 8px 0 7px 0; border-bottom: 1px solid #e1e1e1; text-align: center; letter-spacing: -0.03em;">ssk7***</td>
											<td
												style="padding: 8px 0 7px 0; border-bottom: 1px solid #e1e1e1; text-align: center; letter-spacing: -0.03em;">2021.11.05</td>


										</tr>
										<tr
											style="display: table-row; vertical-align: inherit; border-color: inherit;">
											<td
												style="padding: 8px 0 7px 0; border-bottom: 1px solid #e1e1e1; text-align: center; letter-spacing: -0.03em;">118</td>
											<td class="subject"
												style="padding: 8px 0 7px 0; border-bottom: 1px solid #e1e1e1; text-align: center; letter-spacing: -0.03em;">…..!!!!!!!</td>
											<td
												style="padding: 8px 0 7px 0; border-bottom: 1px solid #e1e1e1; text-align: center; letter-spacing: -0.03em;">fl***</td>
											<td
												style="padding: 8px 0 7px 0; border-bottom: 1px solid #e1e1e1; text-align: center; letter-spacing: -0.03em;">2021.11.05</td>


										</tr>
										<tr
											style="display: table-row; vertical-align: inherit; border-color: inherit;">
											<td
												style="padding: 8px 0 7px 0; border-bottom: 1px solid #e1e1e1; text-align: center; letter-spacing: -0.03em;">117</td>
											<td class="subject"
												style="padding: 8px 0 7px 0; border-bottom: 1px solid #e1e1e1; text-align: center; letter-spacing: -0.03em;">배송이
												일주일 밖에(?) 안 걸렸지만 책의 상태가 좋아서 별점 5개로 결정 합니다`^^</td>
											<td
												style="padding: 8px 0 7px 0; border-bottom: 1px solid #e1e1e1; text-align: center; letter-spacing: -0.03em;">nurin***</td>
											<td
												style="padding: 8px 0 7px 0; border-bottom: 1px solid #e1e1e1; text-align: center; letter-spacing: -0.03em;">2021.11.01</td>


										</tr>

									</tbody>
								</table>
							</div>
							<!--// 판매자 후기 -->

							
							<!-- 탭메뉴 -->
							<div id="used_info_content" class="detail_menu"
								style="width: 108%; height: 60px; letter-spacing: -0.03em; margin: 0 0 10px 0;">
								<ul class="main"
									style="width: 100%; padding: 1px 0 0 0; height: 30px; border-bottom: 2px solid #5b8a5b;">
									<li
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0;"><a
										href="#used_info_content"
										style="color: #3378b3; height: 26px; border: 2px solid #3378b3; border-bottom: none; margin: 0 0 -2px 0; background: #fff; height: 20 px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #dadada; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">판매자
											상품 정보</a></li>
									<li
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
										href="#info_content"
										style="height: 26px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #DADADA; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">도서
											정보 </a></li>
									<li
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
										href="#member_refund"
										style="height: 26px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #DADADA; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">교환/반품
											안내 </a></li>
									<li  hidden="hidden"
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
										href="#seller_postscript_content"
										style="height: 26px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #DADADA; border-bottom: none; background: #f5f5f5; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">판매자
											전체 후기 <span
											style="font-size: 11px; font-weight: normal; text-decoration: none;">[119건]</span>
									</a></li>
									<li class="on"
										style="position: relative; float: left; text-align: center; margin: 0 1px 0 0; padding: 1px 0 0 0;"><a
										href="#question"
										style="height: 29px; min-width: 75px; padding: 8px 10px 0 10px; display: block; border: 1px solid #dadada; border-bottom: none; background: #d1e7d1; font-size: 12px; line-height: 16px; font-weight: bold; color: #666;">상품 문의</a>
										

										<ul class="sub m01"
											style="position: absolute; top: 42px; left: 0px; width: 400px;">
											<li class="first" style="float: left; padding: 0 7px;"><a
												href="#question"
												style="line-height: 12px; color: #666;">상품 문의(<span id="qnaCount">0</span>)</a></li>
										</ul>
										</li>
								</ul>
							</div>
							<!--// 탭메뉴 -->

							<!-- 상품문의 -->
							<div class="seller_postscript_content"
								id="question"
								style="margin: 0 0 20px 0; padding: 0;">
								
					            <table id="qnaArea" class="table" style="text-align:center; width: 108%;">
					                <thead>
					                    <tr>
					                    	<c:if test="${ !empty loginUser }">
						                        <td colspan="2" style="width:75%">
						                            <textarea class="form-control" id="qnaContent" rows="2" style="resize:none; width:100%" placeholder="문의를 입력해주세요"></textarea>
						                        </td>
						                        <td colspan='2' style="vertical-align: middle"><button class="btn btn-secondary" id="addQna" style='background-color:#5b8a5b; color:#fff; border:none; border-radius:3px; width:80px; height:35px;'>등록하기</button></td>
						                        
												<tr id='show' style='display:none'>
												<th colspan='2' style='width:75%'>
													<textarea class='form-control' id='qnaContent2' rows='2' style='resize:none; width:100%' placeholder="답변을 입력해주세요"></textarea>
												</th>
													<td style='vertical-align: middle'>
														<button class='btn btn-secondary' id='addAnswer'>등록하기</button>
													</td>
						                        <th></th>
												</tr>
					                        </c:if>
					                        <c:if test="${ empty loginUser }">
						                        <th>
						                        <td colspan="2" style="width:75%">
						                            <textarea class="form-control" readonly rows="2" style="resize:none; width:100%">로그인한 사용자만 사용가능한 서비스입니다. 로그인 후 이용해주세요.</textarea>
						                         </td>
						                        <th colspan='2' style="vertical-align: middle"><button class="btn btn-secondary" style='background-color:#5b8a5b; color:#fff; border:none; border-radius:3px; width:80px; height:35px;' disabled>등록하기</button></th>
					                        </c:if>
					                    </tr>
					                </thead>
					                <tbody>
					                
					                </tbody>
					            </table>
							</div>
							<!--// 상품문의 -->
							
							 <script>
							 	$(function(){
							 		selectQnaList();	//문의 리스트 조회
									
							 		//상담 문의에서 등록하기 버튼 눌렀을 때
									$("#addQna").click(function(){
							    		var ubookNo = ${ubook.ubookNo};
							
										if($("#qnaContent").val().trim().length != 0){
											
											$.ajax({
												url:"qnaInsert.ub",
												type:"post",
												data:{qnaContent:$("#qnaContent").val(),
													  ubno:ubookNo,
													  qnaWriter:"${loginUser.userId}"},
												success:function(result){
													if(result > 0){
														$("#qnaContent").val("");
														selectQnaList();
														
													}else{
														alert("문의등록실패");
													}
												},error:function(){
													console.log("문의 작성 ajax 통신 실패");
												}
											});
											
										}else{
											alert("문의등록하셈");
										}
										
									});
								});
							 	function deleteQna(qnaNo){
							 		//var paramData = {qnaNo: qnaNo};
              						console.log(qnaNo);
	              		            if(confirm("등록하신 도서를 삭제하시겠습니까?")){
										$.ajax({
	
											url: "deleteQna.ub",
											data : {qnaNo: qnaNo},
											type : 'POST', 
											dataType : 'json',
											success: function(data){
												if(data > 0){
													alert("성공적으로 삭제되었습니다.");
												selectQnaList();
												}else{
													console.log(data);
													alert("왤까요");
												}
											},
											error: function(){
						                    	alert("통신실패");
	
											}
	
										});
									}
							 	}
							 	//문의 리스트 보기
								function selectQnaList(){
						    		var ubookNo = ${ubook.ubookNo};
									$.ajax({
										url:"qnalist.ub",
										data:{ubookNo:ubookNo},
										type:"get",
										success:function(list){
											$("#qnaCount").text(list.length);
											
											var value="<tr>";	
											$.each(list, function(i, obj){
												//현재로그인한 회원이랑 문의 작성자랑 같으면 배경색 바꾸기
												if("${loginUser.userId}" == obj.qnaWriter){
													value += "<tr style='background:#EAFAF1'>";
												}else if("${ubook.sellerId}" == obj.qnaWriter){
													value += "<tr style='background:#dcd3cc'>";
												}else{
													value += "<tr>";
												}
												
												//현재로그인한 회원이랑 해당 도서의 판매자랑 같으면 답글 등록 가능하도록 버튼 보여주기
												var a = obj.qnaGroupNo;
												value += "<th id='widthQna'><input hidden='hidden' name='qnaWriter' value='"+obj.qnaWriter+"'/>" + obj.qnaWriter + "</th>" + 
												 			"<td  hidden='hidden'><input hidden='hidden' name='qnaGroupNo' id='qnaGroupNo' value='"+obj.qnaGroupNo+"'/>" + obj.qnaGroupNo + "</td>" + 
												 			"<td hidden='hidden'>" + obj.qnaGroupNoOrder + "</td>" + 
															 "<td id='widthQna'><input hidden='hidden' name='qnaContent' value='"+obj.qnaContent+"'/>" + obj.qnaContent + "</td>" + 
															 "<td id='widthQna'><input hidden='hidden' name='qnaNo' id='qnaNo' value='"+obj.qnaNo+"'/><input hidden='hidden' name='createDate' value='"+obj.createDate+"'/>" + obj.createDate +"</td>" +
															 "<c:if test='${ loginUser.userId eq ubook.sellerId }'><td><button onclick='reply()' style='background-color:#5b8a5b; color:#fff; border:none; border-radius:3px; width:80px; height:35px;'>답글달기</button></td></c:if>";
															 

												if("${loginUser.userId}" == obj.qnaWriter ){
													value += "<td><button onclick='deleteQna("+obj.qnaNo+")' style='background-color:red; color:#fff; border:none; border-radius:3px; width:80px; height:35px;'>삭제하기</button></td></tr>";
												}else{
													value += "</tr>";
												}
													
											});
											$("#qnaArea tbody").html(value);
										},error:function(){
											console.log("문의 리스트조회용 ajax 통신 실패");
										}
									});
								}
							 	
								 /*
															 "<c:if test='${ !empty loginUser.userId }'><td id='delMyQna'><button onclick='deleteMyQna()' style='background-color:red; color:#fff; border:none; border-radius:3px; width:80px; height:35px;'>삭제하기</button></td></c:if>"+
								 function deleteMyQna() {
										if("${ loginUser.userId}" == "${list.qnaWriter}"){
											alert("삭제 가능합니다,");
										}else{
											alert("${ loginUser.userId}");
											alert("${list.qnaWriter}");
											alert("자신의 댓글만 삭제 가능합니다.");
											}
									}*/
							     
							   //문의 답변 쓰기
							      function reply() {
									//alert("답변 준비 완료!");
									//버튼 눌렀을 때 input 보이게
							    	document.getElementById("show").style.display="";
									$("#addAnswer").click(function(){
							    		var ubookNo = ${ubook.ubookNo};
								    	  console.log(ubookNo);
							
										if($("#qnaContent2").val().trim().length != 0){
											
											$.ajax({
												url:"qnaInsertAnswer.ub",
												type:"post",
												data:{qnaContent:$("#qnaContent2").val(),
													qnaGroupNo:$("#qnaGroupNo").val(),
													  ubno:ubookNo,
													  qnaWriter:"${loginUser.userId}"},
												success:function(result){
													if(result > 0){
														$("#qnaContent2").val("");
														selectQnaList();
														
													}else{
														alert("답변등록실패");
													}
												},error:function(){
													console.log("답변 작성 ajax 통신 실패");
												}
											});
											
										}else{
											alert("답변등록하셈");
										}
										
									});	
										
								}

							    </script>
							
						</div>
						<!--// detail_menu_content  -->

					</div>
					<!--// detail_product -->

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>