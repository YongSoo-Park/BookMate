<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>[책장메이트] - 판매자 페이지</title>
<link rel="icon" href="resources/img/logo1.png" type="image/png">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>

<body style="width: 1200px; margin: auto;">

                    <!--================ 좌측 사이드바(도서 카테고리 선택) =================-->
 					<jsp:include page="../ubook/ubookCategory.jsp"/>
                    <!--================ End 좌측 사이드바(도서 카테고리 선택) =================-->
	<div class="container bootstrap snippet">
		<div style="width: 1350px;">
			<!--판매자 페이지-->
			<c:if test="${empty s.sellerNo }">
			판매자 가입하셈
			</c:if>
			
			<div class="col-sm-9" style="margin-left: 145px; padding-top: 170px;">
				<div class="newsInner">
					<!--탭 시작-->
					<div id="tabs">
						<ul class="tab">
							<li class="active"><span style="height: 70px; padding-top: 22px;">판매자 정보관리</span></li>
							<li><span style="height: 70px; padding-top: 22px;">도서관리</span></li>
							<li><span style="height: 70px; padding-top: 22px;">판매관리</span></li>
							<!-- <li><span style="height: 70px; padding-top: 22px;">도서문의</span></li> -->
						</ul>
						<!-- 판매자 정보관리 -->
						<div class="tabContent active">
							<div class="tabContentInner" style="margin-top: -30px;">
								<div id="sellerInfo">
									<form class="form" action="sellerUpdate.se" method="post"
										id="registrationForm">
										<div class="form-group sellerForm" style="margin: auto;">
											<div class="col-xs-6">
												<label>
													<h4>아이디</h4>
												</label> <input type="text" class="form-control" name="sellerId" style="font-size: 15px;"
													id="sellerId" value="${ s.sellerId }" readonly>
											</div>
											<div class="col-xs-6">
												<label>
													<h4>닉네임</h4>
												</label> <input type="text" class="form-control" name="sellerNickN" style="font-size: 15px;"
													id="sellerNickN" value="${ s.sellerNickN }" readonly>
											</div>
											<div class="col-xs-6">
												<br> <label>
													<h4>이메일</h4>
												</label> <input type="email" class="form-control" name="sellerEmail" style="font-size: 15px;"
													id="selleremail" value="${ s.sellerEmail }">
											</div>
											<div class="col-xs-6">
												<br> <label>
													<h4>핸드폰 번호</h4>
												</label> <input type="text" class="form-control" name="sellerPhone" style="font-size: 15px;"
													id="sellerphone" placeholder="010-0000-0000"
													value="${ s.sellerPhone }">
											</div>
											<div class="col-xs-6">
												<br> <label class="inputlabel">배송비</label> <br> <label
													class="container leftradio2">&nbsp;&nbsp; 기본 :
													2600원 <input class="deleveryChk" type="checkbox" style="display: none;"
													checked="checked" name="sellerDelP1" value="2600"
													onclick="return false"> <span class="checkmark"></span>
												</label> <label class="container rightradio">&nbsp;&nbsp;
													도서산간지역 : 4000원 <input class="deleveryChk" type="checkbox" style="display: none;"
													checked="checked" name="sellerDelP2" value="4000"
													onclick="return false"> <span class="checkmark"></span>
												</label>

											</div>
											<div class="col-xs-6">
												<br> <label class="inputlabel">배송방법</label> <br>
												<c:if test="${ s.sellerDel == 'conveni' }">
													<label class="container leftradio">&nbsp;&nbsp; 편의점
														택배 <input type="radio" checked="checked" name="sellerDel"
														value="conveni"> <span class="checkmark"></span>
													</label>
													<label class="container rightradio">&nbsp;&nbsp; 직접
														택배 업체 지정 <input type="radio" name="sellerDel" value="self">
														<span class="checkmark"></span>
													</label>
												</c:if>

												<c:if test="${ s.sellerDel == 'self' }">
													<label class="container leftradio">&nbsp;&nbsp; 편의점
														택배 <input type="radio" name="sellerDel" value="conveni">
														<span class="checkmark"></span>
													</label>
													<label class="container rightradio">&nbsp;&nbsp; 직접
														택배 업체 지정 <input type="radio" checked="checked"
														name="sellerDel" value="self"> <span
														class="checkmark"></span>
													</label>
												</c:if>
											</div>
											<div class="col-xs-12" style="margin-top: 120px;">
												<br> <label class="inputlabel">출고지</label>
												<c:forTokens var="addr" items="${ s.sellerAddress }"
													delims="/" varStatus="status">
													<c:if
														test="${ status.index eq 0 && addr >= '0' && addr <= '99999' }">
														<c:set var="post" value="${ addr }" />
													</c:if>
													<c:if
														test="${ status.index eq 0 && !(addr >= '0' && addr <= '99999') }">
														<c:set var="address1" value="${ addr }" />
													</c:if>
													<c:if test="${ status.index eq 1 }">
														<c:set var="address1" value="${ addr }" />
													</c:if>
													<c:if test="${ status.index eq 2 }">
														<c:set var="address2" value="${ addr }" />
													</c:if>
												</c:forTokens>


												<div class="col-md-12 form-group" style="width: 100%; margin-top: 50px;">
													<input class="form-control" type="text" style="font-size: 15px; width: 77%; float: left; margin-bottom: 30px;"
														id="sample4_postcode" name="post" placeholder="우편번호"
														value="${ post }" readonly>
													<button type="button" class="postBtn" style="border-radius: 5px; width: 22%; float: right; height: 50px;"
														onclick="sample4_execDaumPostcode()">우편번호 검색</button>
												</div>
												<div class="col-md-12 form-group" style="width: 30%; margin-top: 2px;">

												</div>
												<div class="col-md-12 form-group">
													<input class="form-control" type="text" style="font-size: 15px;"
														id="sample4_roadAddress" name="address1"
														placeholder="도로명주소" value="${ address1 }" size="30"
														readonly>
												</div>
												<div class="col-md-12 form-group">
													<input class="form-control" type="hidden"
														id="sample4_jibunAddress" placeholder="지번주소" size="30"
														disabled>
												</div>
												<div class="col-md-12 form-group">
													<input class="form-control" id="guide"
														style="color: #999; display: none">
												</div>
												<div class="col-md-12 form-group">
													<input class="form-control" type="text"
														id="sample4_detailAddress" name="address2" style="font-size: 15px;"
														placeholder="상세주소" value="${ address2 }" size="30">
												</div>
												<div class="col-md-12 form-group">
													<input class="form-control" type="hidden"
														id="sample4_extraAddress" placeholder="참고항목" size="30">
												</div>
												<div class="col-md-12 form-group">
													<input class="form-control" type="hidden"
														id="sample4_engAddress" placeholder="영문주소" size="30">
												</div>

											</div>

											<div class="col-xs-12">
												<br>
												<center>
													<button class="btn btn-lg btn-success" type="submit" style="font-size: 15px;">
														<i class="glyphicon glyphicon-ok-sign"></i>저장
													</button>
													<button class="btn btn-lg" type="button" style="font-size: 15px; background-color: #6a816b; color: #ffff;"
														data-toggle="modal" id="dormancyBtn"
														data-target="#dormancy">
														<i class="glyphicon glyphicon-remove"></i> 판매자 탈퇴 신청
													</button>
												</center>
												<br style="clear: both;">
											</div>
										</div>
									</form>
								</div>
							</div>
							<!-- 판매자 Modal -->
							<div class="modal fade" id="dormancy" tabindex="-1" role="dialog"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document"
									style="margin-left: 16%;">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel" style="font-size: 15px;">판매자 탈퇴</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">×</span>
											</button>
										</div>

										<form class="form" method="post" action="deleteSeller.se" id="deleteSellerForm">
											<div class="modal-body">
												<label>
													<h4>비밀번호 입력</h4>
												</label>
												<input type="text" hidden="hidden" class="form-control" name="userPwd" id="userPwd">
												<input type="password" id="userPwd2" class="form-control"name="userPwd2" placeholder="로그인 시 입력한 비밀번호를 입력해주세요" style="font-size: 15px;">
												<input type="text" id="sellerId" name="sellerId" value="${ s.sellerId }" hidden="hidden">
												

												<h6 style="font-size: 12px;">
													※ 판매자 탈퇴 진행 시 판매자 정보 복구가 불가능합니다.
												</h6>

											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary" style="font-size: 15px;"
													data-dismiss="modal">취소</button>
													
												<button type="button" class="btn btn-primary" style="font-size: 15px;"
													onclick="PwdChk()">판매자 탈퇴</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- 도서관리 -->
						<div class="tabContent">
							<ul class="tab1">
								<li><span>등록 도서 조회</span></li>
								<li><span>도서 등록</span></li>
							</ul>
							<div class="tabContentInner">
								<br>
								<div class="tabContentInner">
									<div>
										<!-- 등록도서 조회 -->
										<jsp:include page="ubookList.jsp"></jsp:include>
										<!-- 도서 등록 -->
										<jsp:include page="ubookEnrollForm.jsp"></jsp:include>
										<!-- <jsp:include page="ubookEnroll.ub"></jsp:include> -->
									</div>
								</div>
							</div>
						</div>
						<!-- 판매관리 -->
						<div class="tabContent">
							<ul class="tab2">
								<li><span>주문현황</span></li>
								<li><span>판매내역</span></li>
							</ul>
							<div class="tabContentInner">
								<br>
								<div class="tabContentInner">
									<div class="miniTab">

										<!-- 주문현황 -->
										<jsp:include page="ubookOrder.jsp"></jsp:include>
										<!-- 판매내역 -->
										<jsp:include page="ubookSalesHistory.jsp"></jsp:include>
									</div>
								</div>
							</div>
						</div>
						<!-- 도서문의
						<div class="tabContent">
							<%-- <jsp:include page="ubookQue.jsp"></jsp:include> --%>
							<!-- 도서문의
							<section class="content">
								<h2>도서 문의 내역</h2>
								<div class="col-md-offset-2 qnaTable">
									<div class="panel panel-default">
										<div class="panel-body">
											<div class="table-container">
												<table class="table table-filter" id="ubookListTb2">
													<thead>
					                                <tr>
					                                    <th style="width:60px; text-align: center;">도서 번호</th>
					                                    <th style="text-align: center;">도서 표지</th>
					                                    <th style="text-align: center;">도서명</th>
					                                    <th style="text-align: center;">저자</th>
					                                </tr>
					                            	</thead>
													<tbody>
													<tr>
														<td colspan="6" style="text-align: center;">문의가 등록된 도서가 없습니다.</td>
													</tr>
													<tr>
														<td colspan="6" style="text-align: center;"><input name="sellerNo" value="${s.sellerNo }"></td>
													</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</section>
						</div> -->
					</div>
					<!--tabs end-->
				</div>
			</div>
			<!--탭 이동-->
			<script>
				// tab menu
				$(".tab li").click(function() {
					var num = $(".tab li").index(this);
					$(".tabContent").removeClass('active');
					$(".tabContent").eq(num).addClass('active');
					$(".tab li").removeClass('active');
					$(this).addClass('active')
				});
				$(".tab1 li")
						.click(
								function() {
									var num = $(".tab1 li").index(this);
									$(".tabContent3").removeClass('active');
									if (num == 0) {
										//alert("등록 도서 조회");
										$(".tabContent3").eq(num).addClass(
												'active');

										var table = document
												.getElementById('ubookListTb');
										$
												.ajax({
													type : "POST",
													url : "ubookList.ub",
													dataType : 'json',
													//data : 도서리스트,
													success : function(data) {
														console.log(data);

														//안내 tr 지우기
														var trlength = $('#ubookListTb tr').length;
														for (var t = trlength - 1; t > 0; t--) {
															table.deleteRow(t);
														}
														if(data.length < 1){
															$('#ubookListTb')
															.append(
															"<tr> <td colspan='6' style='text-align: center;'>아직 등록된 도서가 없습니다.</td></tr>");
														
														}
														//데이터 뿌리기 
														for (var i = 0; i < data.length; i++) {
															console.log("야ㅑㅑㅑㅑ호오오오오" + data[i].bSellerNo);
															console.log(data[i].ubookName);
															$('#ubookListTb')
																	.append(
																			"<tr>"
																					+"<td align='center'>"
																					+ (i + 1)
																					+ "</td>"
																					+ "<td hidden='hidden' name='ubookNo'>"
																					+ data[i].ubookNo
																					+ "</td>"
																					+ "<td align='center'><img src='${pageContext.servletContext.contextPath }/resources/images/Ubookimg/" + data[i].ubookImg + "' style='width: 145px; height: auto;'></td>"
																					+ "<td align='center'><a href='ubookDetailTest.ub?ubookNo="
																					+ data[i].ubookNo
																					+"&bSellerNo="
																					+ data[i].bsellerNo
																					+ "'>"
																					+ data[i].ubookName
																					+ "</a></td>"
																					+ "<td align='center'>"
																					+ data[i].ubookWriter
																					+ "</td>"
																					+ "<td align='center'>"
																					+ data[i].ubookStock
																					+ "</td>"
																					+ "<td align='center'>"
																					+ "<button type='button' style='background-color: #5cb85c; color:#ffffff; border:none; width: 100%; margin-bottom:10px; border-radius: 0.3rem;' onclick='showModal("
																					+ data[i].ubookNo
																					+ ")'>수정</button>"
																					+ "<button class='btn-danger' type='button' style='border:none;width: 100%; border-radius: 0.3rem;' onclick='deleteUbook("
																					+ data[i].ubookNo
																					+ ")'>삭제</button></td></tr>");
														}

													},
													error : function() {
														alert("너는 뭔가 잘못하고 있어ㅓㅓㅓㅓㅓ...");
													}
												});
									} else {
										//alert("도서 등록");
										$(".tabContent3").eq(num).addClass(
												'active');
									}
									$(".tab1 li").removeClass('active');
									$(this).addClass('active')
								});
				
				$(".tab2 li")
				.click(
						function() {
							var num = $(".tab2 li").index(this);
							$(".tabContent2").removeClass('active');
							if (num == 0) {
								$(".tabContent2").eq(num).addClass(
										'active');

								var table = document
										.getElementById('orderBookList');
								$
										.ajax({
											type : "POST",
											url : "selectOrderUbookList.se",
											dataType : 'json',
											success : function(data) {
												console.log(data);

												//안내 tr 지우기
												var trlength = $('#orderBookList tr').length;
												for (var t = trlength - 1; t > 0; t--) {
													table.deleteRow(t);
												}
												if(data.length < 1){
													$('#orderBookList')
													.append(
													"<tr> <td colspan='6' style='text-align: center;'>아직 주문된 도서가 없습니다.</td></tr>");
												
												}
												//데이터 뿌리기 
												for (var i = 0; i < data.length; i++) {
													console.log("야ㅑㅑㅑㅑ호오오오오" + data[i].paymentNoUb);
													console.log(data[i].ubookNameUb);
													$('#orderBookList')
															.append(
																	"<tr>"
																			+"<td align='center'>"
																			+ (i + 1)
																			+ "</td>"
																			+ "<td hidden='hidden' name='paymentNoUb'>"
																			+ data[i].paymentNoUb
																			+ "</td>"
																			+ "<td align='center'><img src='${pageContext.servletContext.contextPath }/resources/images/Ubookimg/" + data[i].ubookImgUb + "' style='width: 145px; height: auto;'></td>"
																			+ "<td align='center'><a href='ubookDetailTest.ub?ubookNo="
																			+ data[i].ubookNoUb
																			+"&bSellerNo="
																			+ data[i].bsellerNo
																			+ "'>"
																			+ data[i].ubookNameUb
																			+ "</a></td>"
																			+ "<td align='center'>"
																			+ data[i].quantityUb
																			+"권<br><br>"
																			+ data[i].ubookOPriceUb
																			+ "원</td>"
																			+ "<td align='center'>"
																			+ data[i].deliveryStatusUb
																			+ "</td>"
																			+ "<td align='center'>"
																			+ "<button type='button' style='background-color: #5cb85c; color:#ffffff; border:none; width: 100%; margin-bottom:10px; border-radius: 0.3rem;' onclick='showModal2("
																			+ data[i].ubookNoUb
																			+","
																			+data[i].paymentNoUb
																			+ ")'>수정</button></td></tr>");
												}

											},
											error : function() {
												alert("주문현황 조회에서 뭔가 안되고있음");
											}
										});
							} else {
								$(".tabContent2").removeClass('active');
								if (num == 1) {
								//alert("판매내역 확인");
								$(".tabContent2").eq(1).addClass(
										'active');
								
								var table = document
								.getElementById('soldBookList');
						$
								.ajax({
									type : "POST",
									url : "selectSoldUbookList.se",
									dataType : 'json',
									success : function(data) {
										console.log(data);

										//안내 tr 지우기
										var trlength = $('#soldBookList tr').length;
										for (var t = trlength - 1; t > 0; t--) {
											table.deleteRow(t);
										}
										if(data.length < 1){
											$('#soldBookList')
											.append(
											"<tr> <td colspan='5' style='text-align: center;'>아직 판매 완료된 도서가 없습니다.</td></tr>");
										
										}
										//데이터 뿌리기 
										for (var i = 0; i < data.length; i++) {
											console.log("야ㅑㅑㅑㅑ호오오오오" + data[i].paymentNoUb);
											console.log(data[i].ubookNameUb);
											$('#soldBookList')
													.append(
															"<tr>"
																	+"<td align='center'>"
																	+ (i + 1)
																	+ "</td>"
																	+ "<td hidden='hidden' name='paymentNoUb'>"
																	+ data[i].paymentNoUb
																	+ "</td>"
																	+ "<td align='center'><img src='${pageContext.servletContext.contextPath }/resources/images/Ubookimg/" + data[i].ubookImgUb + "' style='width: 145px; height: auto;'></td>"
																	+ "<td align='center'><a href='ubookDetailTest.ub?ubookNo="
																	+ data[i].ubookNoUb
																	+"&bSellerNo="
																	+ data[i].bsellerNo
																	+ "'>"
																	+ data[i].ubookNameUb
																	+ "</a></td>"
																	+ "<td align='center'>"
																	+ data[i].quantityUb
																	+"권<br><br>"
																	+ data[i].ubookOPriceUb
																	+ "원</td>"
																	+ "<td align='center'>"
																	+ data[i].deliveryStatusUb
																	+ "</td>"
																	+"</tr>");
										}

									},
									error : function() {
										alert("판매내역 조회에서 뭔가 안되고있음");
									}
								});
								}
							}
							$(".tab2 li").removeClass('active');
							$(this).addClass('active')
						});
				/*$(".tab2 li").click(function() {
					var num = $(".tab2 li").index(this);
					$(".tabContent2").removeClass('active');
					$(".tabContent2").eq(num).addClass('active');
					$(".tab2 li").removeClass('active');
					$(this).addClass('active')
				});*/
			</script>
			
			<!-- 주문 정보 수정 클릭시 띄워지는 모달 -->
			<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document"
					style="max-width: none; width: 1000px; margin-top: 100px;">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel" style="font-size: 15px;">주문 정보 수정</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>

							<div class="modal-body">
								<table class="table table-bordered success">
									<thead>
										<tr style="background-color: #d1e7d1;">
											<th hidden ="hidden" style="width:70px; text-align: center;">중고도서주문번호</th>
											<th style="width:70px; text-align: center;">주문자 ID</th>
											<th style="width:70px; text-align: center;">수취인</th>
											<th style="width:360px; text-align: center;">배송지</th>
											<th style="width:140px; text-align: center;">구매자 전화번호</th>
											<!-- <th style="width:170px; text-align: center;">배송 시 요청사항</th>
											<th style="width:120px; text-align: center;">결제일</th> -->
										</tr>
									</thead>
									<tbody>
										<tr>
											<td hidden="hidden">
												<input name="paymentNoUb">
											</td>
											<td>
												<input name="userIdUb" style="width:100%; border :none;" readonly="readonly">
											</td>
											<td>
												<input name="shippingNameUb" style="width:100%; border :none;" readonly="readonly">
											</td>
											<td>
												<input name="shippingAddressUb" style="width:100%; border :none;" readonly="readonly">
											</td>
											<td>
												<input name="shippingPhoneUb" style="width:100%; border :none;" readonly="readonly">
											</td>
											<!-- <td>
												<input name="deliveryRequestUb">
											</td>
											<td>
												<input name="payDateUb" style="width:100%; border :none;" readonly="readonly">
											</td> -->
										</tr>
									</tbody>
								</table>
								
								<form class="form showOrderBookInfo" enctype='multipart/form-data'
									method="post" action="updateOrderInfo.se">
										<table class="table table-bordered success">
											<thead>
												
											<tr style="background-color: #d1e7d1;">
													<th hidden="hidden" style="width:70px; text-align: center;">주문상세번호</th>
													<th hidden="hidden" style="width:70px; text-align: center;">주문번호</th>
													<th hidden="hidden" style="width:150px; text-align: center;">도서</th>
													<th style="width:250px; text-align: center;">도서명</th>
													<th style="width:150px; text-align: center;">주문수량<br>&금액</th>
													<th hidden="hidden" style="width:100px; text-align: center;">배송상태<br>변경일</th>
													<th style="width:300px; text-align: center;">배송상태<br>기준표</th>
													<th style="width:200px; text-align: center;">배송상태<br>변경</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td hidden="hidden">
														<input name="paymentDetailNoUb">
													</td>
													<td hidden="hidden">
														<input name="paymentNoUb">
													</td>
													<td hidden="hidden">
														<input name="ubookNoUb">
													</td>
													<td>
														<input name="ubookNameUb" style="width:100%; border :none;" readonly="readonly">
													</td>
													<td>
														<input name="quantityUb" style="width:15%; border :none;" readonly="readonly">권<br>
														<input name="ubookPriceUb" style="width:60%; border :none;" readonly="readonly">원
													</td>
													<td hidden="hidden">
														<input name="deliveryDateUb" style="width:100%; border :none;" readonly="readonly">
													</td>
													<td>
														<strong>주문확인</strong> : 주문 확인 단계<br>
														<strong>배송준비</strong> : 주문을 확인하고 도서 발송 준비 단계<br>
														<strong>발송완료</strong> : 도서 발송한 상태
													</td>
													<td>
														<p>※ 변경할 배송상태를 입력해주세요</p>
														<input name="deliveryStatusUb" style="width:100%; border :none; background-color: #d5d3d3;"  required="required">
													</td>
												</tr>
											</tbody>
										</table>
										<div class="modal-footer" style="justify-content: center;">
											<button type="button" class="btn btn-secondary" style="width: 70px; height: 50px; font-size: 15px;"
												data-dismiss="modal">취소</button>
											<button type="submit" class="btn btn-primary" style="width: 160px; height: 50px; font-size: 15px;" onclick="deliveryUpdateChk()">배송상태 변경하기</button>
										</div>
								</form>
								
							</div>
						
					</div>
				</div>
			</div>
			
			
			<!-- 도서 수정 모달 -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document"
					style="max-width: none; width: 1000px; margin-top: 205px;">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">도서 수정</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>

						<form class="form updateUbook1" enctype='multipart/form-data'
							method="post" action="">
							<div class="modal-body">
								<input type="text" name="ubookNo" hidden="hidden">
								<table class="table table-bordered success">
									<colgroup>
										<col width="100px" />
										<col width="400px" />
									</colgroup>
									<thead>
										<tr hidden="hidden">
											<th class="info">판매자 번호</th>
											<td><input class="usedBookInfo" name="bSellerNo"
												value="${ s.sellerNo }" readonly="readonly"></td>
										</tr>
										<tr>
											<th class="info">도서명</th>
											<td><input class="usedBookInfo" name="ubookName"
												required="required" placeholder="도서명을 입력해주세요"
												data-name="도서명"></td>
										</tr>
										<tr>
											<th class="info">저자(지은이)</th>
											<td><input class="usedBookInfo" name="ubookWriter"
												required="required" placeholder="저자를 입력해주세요"
												data-name="도서 지은이"></td>
										</tr>
										<tr>
											<th class="info">ISBN-13</th>
											<td><input class="usedBookInfo" name="ubookIsbn"
												required="required" maxlength="13" type="number"
												placeholder="도서의 ISBN을 입력해주세요(- 없이)" data-name="도서 ISBN"></td>
										</tr>
										<tr>
											<th class="info">카테고리</th>
											<td><select id="ubCategory" name="ubCategory"
												data-name="도서 카테고리">
													<option value="">== 카테고리 선택 ==</option>
													<option value="1">소설/시/에세이</option>
													<option value="2">경제/경영</option>
													<option value="3">과학</option>
													<option value="4">인문</option>
													<option value="5">컴퓨터/IT</option>
													<option value="6">자기계발</option>
													<option value="7">정치/사회</option>
													<option value="8">역사/문화</option>
													<option value="9">취미</option>
													<option value="10">가정/육아</option>
											</select></td>
										</tr>

										<tr>
											<th class="info">역자</th>
											<td><input class="usedBookInfo" name="ubookTrans"
												required="required" placeholder="역자를 입력해주세요" value="없음"
												data-name="도서 역자"></td>
										</tr>
										<tr>
											<th class="info">출판사</th>
											<td><input class="usedBookInfo" name="ubookPub"
												required="required" placeholder="출판사를 입력해주세요"
												data-name="도서 출판사"></td>
										</tr>
										<tr>
											<th class="info">출판일</th>
											<td><input class="usedBookInfo" name="ubookPubDate"
												required="required" type="date" placeholder="출판일을 입력해주세요"
												data-name="도서 출판일"></td>
										</tr>
										<tr>
											<th valign="top" class="info">정가</th>
											<td><input class="usedBookInfo" name="ubookOPrice"
												required="required" type="number" placeholder="정가를 입력해주세요"
												data-name="도서 정가"></td>
										</tr>
										<tr>
											<th class="info">판매가</th>
											<td><input class="usedBookInfo" name="ubookPrice"
												required="required" type="number" placeholder="판매가를 입력해주세요"
												data-name="도서 판매가"></td>
										</tr>
										<tr>
											<th class="info">재고수량</th>
											<td><input class="usedBookInfo" name="ubookStock"
												required="required" type="number" min="1"
												placeholder="재고수량을 입력해주세요" data-name="재고 수량"></td>
										</tr>

										<tr>
											<th class="info">도서 품질<br> 기준표
											</th>
											<td>S : 최상. 낙서/얼룩/접힙/찢김/변색/제본불량 해당 없음<br> A : 상.
												낙서/얼룩/접힙/찢김/변색/제본불량 일부 있음<br> B : 보통.
												낙서/얼룩/접힙/찢김/변색/제본불량 2가지 이상 있음<br> C : 하.
												낙서/얼룩/접힙/찢김/변색/제본불량 3가지 이상 있음<br> D : 최하.
												낙서/얼룩/접힙/찢김/변색/제본불량 다수 있음<br>

											</td>
										</tr>
										<tr>
											<th class="info">도서 품질</th>
											<td><select id="ubookQual" name="ubookQual">
													<option value="">== 도서 품질 선택 ==</option>
													<option value="S">S</option>
													<option value="A">A</option>
													<option value="B">B</option>
													<option value="C">C</option>
													<option value="D">D</option>
											</select></td>
										</tr>

										<tr>
											<th class="info">도서 상세</th>
											<td><textarea name="ubookDetail" id="ubookDetail"
													cols="54" required="required" rows="10" maxlength="3600"
													style="width: 100%;"
													placeholder="도서의 줄거리, 도서 품질 상세 정보 등을 입력해주세요"
													data-name="도서 상세"></textarea>
										<div id="test_cnt_2">(0 / 3600)</div></td>
										</tr>
										<tr>
											<th class="info">도서 목차</th>
											<td><textarea name="ubookContent" id="ubookContent"
													cols="54" required="required" rows="10" maxlength="3600"
													style="width: 100%;"
													placeholder="도서의 목차를 입력해주세요" data-name="도서 목차"></textarea>
													<div id="test_cnt1_2">(0 / 3600)</div>
											</td>
										</tr>
										<tr>
											<th class="info">도서 이미지</th>
											<td><input name="UbookImgFile" type="file" id="ubookImg2"
												onchange="imgCheck(this,'ubookImg2')"
												class="text-center center-block file-upload"
												data-name="도서 이미지"></td>
										</tr>
										<tr>
											<th class="info">도서 이미지 미리보기</th>
											<td><img alt="" src="" id="preubookImg2"></td>
										</tr>
									</thead>
								</table>
							</div>
							<div class="modal-footer" style="justify-content: center;">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary"
									onclick="updateUbook();">수정</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!--/col-9-->
	</div>
	<!--/row-->

	<!-- 다음 우편번호 api  -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<!-- 우편번호, 도서 수정 FUNCTION -->
	<script>
//도서 수정 중 도서 상세 글자제한
	$(document).ready(function() {
		 
		$("textarea[name='ubookDetail']").eq(1).on('keyup', function() {
	        $('#test_cnt_2').html("("+$(this).val().length+" / 3600)");
	 
	        if($(this).val().length > 3600) {
	        	alert("최대 3600자까지 입력 가능합니다.");
	            $(this).val($(this).val().substring(0, 3600));
	            $('#test_cnt_2').html("(3600 / 3600)");
	        }
	    });
	});

//도서 수정 중 목차 글자제한
	$(document).ready(function() {
		$("textarea[name='ubookContent']").eq(1).on('keyup', function() {
	        $('#test_cnt1_2').html("("+$(this).val().length+" / 3600)");
	 
	        if($(this).val().length > 3600) {
	        	alert("최대 3600자까지 입력 가능합니다.");
	            $(this).val($(this).val().substring(0, 3600));
	            $('#test_cnt1_2').html("(3600 / 3600)");
	        }
	    });
	});
	
	function deliveryUpdateChk(){
		var deliveryStatus = $("input[name=deliveryStatusUb]");
		if(deliveryStatus.val() == "" || deliveryStatus.val() == null){
			alert("배송상태를 입력해주세요.");
			deliveryStatus.focus();
			return false;
		}
		if(deliveryStatus.val() != "주문확인" && deliveryStatus.val() != "배송준비" && deliveryStatus.val() != "발송완료"){
			// && deliveryStatus.val() != "수취확인"
			alert("배송상태를 올바르게 입력해주세요.");
			deliveryStatus.val("");
			deliveryStatus.focus();
			return false;
		}
		
		alert("배송 상태가 정상적으로 수정되었습니다.");
	}
	
	//등록한 도서 정보 수정
		function updateUbook() {
			var form = $(".updateUbook1")[0];
			var formData = new FormData(form);
			formData.append("ubookImg",
					$("input[name=UbookImgFile]")[0].files[0]);
			//var form = $('.updateUbook').serialize();
			//form += ("&UbookImgFile=" + $("input[name=UbookImgFile]").val());
			
			
			if (confirm("해당 도서를 수정하시겠습니까?")) {				
				$
						.ajax({
							type : "POST",
							enctype : 'multipart/form-data',
							url : "ubookUpdate.ub",
							processData : false,
							contentType : false,
							dataType : 'json',
							data : formData,
							success : function(data) {
								console.log(data);
								if (data > 0) {
									alert("성공적으로 수정되었습니다.");
									$('#exampleModal').modal("hide");
									var table = document.getElementById('ubookListTb');
									
									$.ajax({
		                                type : "POST",
		                                url : "ubookList.ub",
		                                dataType : 'json',
		                                //data : 도서리스트,
		                                success : function(data) {
		                                	
		                                	//기존 tr 지우기
											var trlength = $('#ubookListTb tr').length;
											for (var t = trlength - 1; t > 0; t--) {
												table.deleteRow(t);
											}

											//데이터 뿌리기 
											for (var i = 0; i < data.length; i++) {
												$('#ubookListTb')
														.append(
																"<tr><td align='center'>"
																		+ (i + 1)
																		+ "</td>"
																		+ "<td hidden='hidden' name='ubookNo'>"
																		+ data[i].ubookNo
																		+ "</td>"
																		+ "<td align='center'><img src='${pageContext.servletContext.contextPath }/resources/images/Ubookimg/" + data[i].ubookImg + "' style='width: 145px; height: auto;'></td>"
																		+ "<td align='center'><a href='ubookDetailTest.ub?ubookNo="
																		+ data[i].ubookNo
																		+"&bSellerNo="
																		+ data[i].bsellerNo
																		+ "'>"
																		+ data[i].ubookName
																		+ "</a></td>"
																		+ "<td align='center'>"
																		+ data[i].ubookWriter
																		+ "</td>"
																		+ "<td align='center'>"
																		+ data[i].ubookStock
																		+ "</td>"
																		+ "<td align='center'>"
																		+ "<button type='button' style='background-color: #5cb85c; color:#ffffff; border:none; width: 100%; margin-bottom:10px; border-radius: 0.3rem;' onclick='showModal("
																		+ data[i].ubookNo
																		+ ")'>수정</button>"
																		+ "<button class='btn-danger' type='button' style='border:none;width: 100%; border-radius: 0.3rem;' onclick='deleteUbook("
																		+ data[i].ubookNo
																		+ ")'>삭제</button></td></tr>");
											}

		                                },
		                                error : function() {
		                                	alert("너는 뭔가 잘못하고 있따...?");
		                                }
		                            });
									
								}
							},
							error : function() {
								alert("모든 사항에 선택 및 입력을 했는지 확인해주세요.");
							}
						});
			}
		}

	//판매자 정보 수정 중 도로명 주소
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById("sample4_roadAddress").value = roadAddr;
							document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

							document.getElementById("sample4_engAddress").value = data.addressEnglish;

							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							if (roadAddr !== '') {
								document.getElementById("sample4_extraAddress").value = extraRoadAddr;
							} else {
								document.getElementById("sample4_extraAddress").value = '';
							}

							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open();
		}
	</script>



	<jsp:include page="../common/footer.jsp" />
</body>
<script type="text/javascript" src="resources/js/seller_page.js"></script>
<script type="text/javascript" src="resources/js/seller.js"></script>
</html>