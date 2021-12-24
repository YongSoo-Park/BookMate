<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>장바구니</title>
	<link rel="stylesheet"
		href="resources/vendors/bootstrap/bootstrap.min.css">
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style>
		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
		    -webkit-appearance: none;
		}
		#basketTable td {
			vertical-align: middle;
			border-bottom: 1px solid lightgray;
		}
		#basketTable {
		text-align: center;
		}
		#basketTable th{
		font-weight: bold;
		font-size: 20px;
		}
		.mainTitleSpan{
		font-size: 35px;
		font-weight: bold;
		margin-left: 50px;
		margin-right: 50px;
		}
	</style>
	<script type="text/javascript">
	
		
		
		$(document).ready(function() {
			priceSum();
		})
		
		
		//현제 조건에 맞는 예상 결제액 계산
		function priceSum() {
			var price = new Array() 
			var quantity = new Array()
			var priceSum = 0;
			var payPrice = 0;
			var deleveryPrice = 0;
			var savePoint = 0;
			$('.price').each(function(i,item) {
				if($("input:checkbox[id=checkBox"+i+"]").is(":checked")==true){
				price.push(item.value)
				}
			})
			$('.quantity').each(function(i,item) {
				if($("input:checkbox[id=checkBox"+i+"]").is(":checked")==true){
				quantity.push(item.value)
				}
			})
			for(var i = 0 ; i <price.length;i++ ){
			
				priceSum = priceSum + (price[i]*quantity[i])
			}
			
			savePoint = priceSum*0.05
			if(priceSum<10000){
				deleveryPrice = 2500;
				$('#deleveryPriceSpan').html(deleveryPrice.toLocaleString('ko-KR')+"원")
				
			}else{
				deleveryPrice = 0;
				$('#deleveryPriceSpan').html(deleveryPrice.toLocaleString('ko-KR')+"원")
			}
			payPrice = priceSum + deleveryPrice;
			$('#sumPriceSpan').html(priceSum.toLocaleString('ko-KR')+"원")
			$('#payPriceSpan').html(payPrice.toLocaleString('ko-KR')+"원")
			$('#savePointSpan').html(parseInt(savePoint).toLocaleString('ko-KR')+"pt")
			
			
			
		}
		
		//아이템 체크, 해제시
		function changeCheckbox() {
			priceSum()
		}
		
		
		//버튼으로 수량 변경시
		function changeQuantity(status,index) {	
			var checkQuantity = parseInt($('#quantity'+index).val())
			var itemsPrice = 0;
			if(status==1){
				checkQuantity+=1
				$('#quantity'+index).val(checkQuantity)
			}else{
				if(checkQuantity>1){
					checkQuantity-=1
					$('#quantity'+index).val(checkQuantity)
				}else{
					return false;
				}
			}
			itemsPrice = parseInt($('#price'+index).val())*checkQuantity
			$('#itemsPriceSpan'+index).html(itemsPrice.toLocaleString('ko-KR'))
			priceSum()
		}
		
		//수량 변경 숫자 직접 입력시
		function changeQuantityInput(quantity,index) {	
			var itemsPrice = 0;
			if(quantity<1){
				quantity=1
				
			}
			$('#quantity'+index).val(quantity)
			itemsPrice = parseInt($('#price'+index).val())*quantity
			$('#itemsPriceSpan'+index).html(itemsPrice.toLocaleString('ko-KR'))
			priceSum()
		}
		
		//결제 페이지로 이동		
		function movePayment() {
			
			$('.price').each(function(i,item) {
				if($("input:checkbox[id=checkBox"+i+"]").is(":checked")==false){
					
					$('#basketInfoTr'+i).remove();
				}
			})
			
			$('#movePaymentForm').submit();
		
			
		}
		
		//장바구니 아이템 삭제
		function deleteBasket(index,basketNo) {
			if(confirm("이 항목을 장바구니에서 삭제하시겠습니까?")){
				/* $('#basketInfoTr'+index).remove(); */
				$("input:checkbox[id=checkBox"+index+"]").prop("checked",false)
				$('#basketInfoTr'+index).css('display','none');
				
				$.ajax({
					
					url : "deleteBasket.sc",
					type: "post",
					async:false,
					data : {
						basketNo : basketNo
					},
					success : function(str) {
						if(str=="pass"){
							console.log("장바구니 삭제 성공.")
							priceSum();
						}else{
							alert("장바구니 삭제에 실패했습니다.")
						}
					},
					error : function(e) {
						alert("ajax 통신중 오류 발생")
					}
						
					
				})
		
				
			}
		}
		
		//표지 이미지나 제목을 클릭하여 도서 상세 페이지 이동
		function moveBookDetail(bookISBN) {
			$('#moveBookDetailInput').val(bookISBN)
			$('#moveBookDetailForm').submit()
		}
	</script>
</head>

<body>
<jsp:include page="../common/menubar.jsp" />
	<main class="site-main" style="padding-top: 180px"><hr>

		<div style="text-align: center; background-color: lightgray;">
			<span class="mainTitleSpan" style="font-size: 40px;color: olive;">장바구니</span><span class="mainTitleSpan"> 〉</span><span class="mainTitleSpan">결제</span><span class="mainTitleSpan"> 〉</span><span class="mainTitleSpan">주문완료</span>
		</div><br><br><br>

		<c:choose>
			<c:when test="${requestScope.cartItemList != null}">
				<form action="selectBook.book" method="post" id="moveBookDetailForm">
					<input type="hidden" id="moveBookDetailInput" value="" name="bookISBN">
				</form>
	
				<div class="container">
					<div class="cart_inner">
						<form action="movePayment.sc" method="post" id="movePaymentForm">
							<table class="table" id="basketTable">
								<thead>
									<tr>
										<th></th>
										<th style="width: 35%;">상품정보</th>
										<th style="width: 15%;">판매가(권당)</th>
										<th style="width: 10%;">수량</th>
										<th style="width: 10%;">합계</th>
										<th style="width: 15%;">예상출고일<br>
										<span style="font-size: 5px">(오후4시 이전 당일출고)</span></th>
										<th style="width: 10%;">선택</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${requestScope.cartItemList}" var="list"
										varStatus="status">
										<tr id="basketInfoTr${status.index}">
											<td>
											<c:choose>
											<c:when test="${list.bookStock>0}"><input type="checkbox" value=""
												id="checkBox${status.index}" checked="checked"
												onchange="changeCheckbox()"></c:when>
												<c:otherwise>품절</c:otherwise>
												</c:choose></td>
											<td>
												<div class="media" >
													<div class="d-flex">
														<img
															src="${pageContext.servletContext.contextPath}/resources/images/book_img/${list.bookMainImg}"
															style="height: 150px;cursor: pointer;" onclick="moveBookDetail('${list.bookISBN}')" >
													</div>
													<div class="media-body" style="text-align: left;">
														<p style="cursor: pointer;" onclick="moveBookDetail('${list.bookISBN}')">${list.bookTitle}</p>
													</div>
												</div>
											</td>
											<td><input type="hidden" id="price${status.index}"
												class="price" value="${list.bookPrice*0.9}"> <span
												style="text-decoration: line-through"><fmt:formatNumber
														value="${list.bookPrice}" />원 </span><br> <span
												style="color: red;"><fmt:formatNumber
														value="${list.bookPrice*0.9}" /></span>원(↓ 10%)<br> <span><fmt:formatNumber
														value="${list.bookPrice*0.05}" />pt 적립</span></td>
											<td>
												<div style="display: flex; align-items: center;">
													<input type="hidden"
														name="basketList[${status.index}].basketNo"
														value="${requestScope.basketList[status.index].basketNo}">
													<input type="hidden" value="${sessionScope.loginUser.userId}"
														name="basketList[${status.index}].user_Id"> <input
														type="hidden" name="basketList[${status.index}].bookISBN"
														value="${requestScope.basketList[status.index].bookISBN}">
														<c:choose>
											<c:when test="${list.bookStock>0}"><input type="number"
														name="basketList[${status.index}].quantity"
														id="quantity${status.index}" class="quantity" maxlength="2"
														value="${requestScope.basketList[status.index].quantity}"
														style="height: 40px; width: 30px;" onchange="changeQuantityInput(this.value,'${status.index}')"></c:when>
												<c:otherwise><input type="text"
														name="basketList[${status.index}].quantity"
														id="quantity${status.index}" class="quantity" maxlength="2"
														value="0" readonly="readonly"
														style="height: 40px; width: 30px;"></c:otherwise>
												</c:choose>
													&nbsp;
													<div>
														<c:if test="${list.bookStock>0}">
														<button type="button"
															style="height: 20px; width: 30px; font-size: 10px;"
															onclick="changeQuantity(1,'${status.index}')">▲</button>
														<br>
														<button type="button"
															style="height: 20px; width: 30px; font-size: 10px;"
															onclick="changeQuantity(0,'${status.index}')">▼</button>
															</c:if>
													</div>
												</div>
											</td>
											<td><span id="itemsPriceSpan${status.index}"><fmt:formatNumber
														value="${list.bookPrice*0.9*requestScope.basketList[status.index].quantity}"/></span>원
											</td>
											<td>${requestScope.shipDate}</td>
											<td><button type="button" class="btn btn-secondary btn-sm"
													onclick="deleteBasket(${status.index},${requestScope.basketList[status.index].basketNo})">
													삭제</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form><br>
						<div style="width: 80%; margin: auto;">
							<table class="table">
								<thead class="thead-light">
									<tr>
										<th style="width: 25%;">총 상품금액</th>
										<th></th>
										<th style="width: 20%;">배송비</th>
										<th></th>
										<th style="width: 25%;">결제 예정금액</th>
										<th style="width: 20%;">총 적립 포인트</th>
		
									</tr>
		
		
								</thead>
								<tr>
									<td><span id="sumPriceSpan" style="font-size: 20px"></span></td>
									<td>+</td>
									<td><span id="deleveryPriceSpan" style="font-size: 20px"></span></td>
									<td>=</td>
									<td><span id="payPriceSpan"
										style="color: red; font-size: 20px; font-weight: bold;"></span></td>
									<td><span id="savePointSpan" style="font-size: 20px"></span></td>
								</tr>
		
							</table>
		
		
						</div>
					</div><br><br>
					
					<div style="display: flex;">
					<button type="button" onclick="movePayment()" class="btn btn-secondary btn-lg" style="margin-left: auto;margin-right: 100px;">결제하기</button></div>
				</div>
			
			</c:when>
		<c:otherwise>
		<div style="margin-top: 300px;font-size: 30px;font-weight: bold; text-align: center;margin-bottom: 300px">장바구니에 등록된 상품이 없습니다.</div>
		</c:otherwise>
		</c:choose>
	</main>
<jsp:include page="../common/footer.jsp" />
</body>

</html>