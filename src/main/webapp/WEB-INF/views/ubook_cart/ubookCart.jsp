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
<title>책구메이트 - 중고장터</title>
<link rel="icon" href="resources/img/logo1.png" type="image/png">
<link rel="stylesheet"
	href="resources/vendors/bootstrap/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#basketTable td {
	vertical-align: middle;
	border-bottom: 1px solid lightgray;
}
</style>
<script type="text/javascript">


$(document).ready(function() {
	priceSum();
})


function priceSum() {
	var price = new Array() 
	var cartCount = new Array()
	var priceSum = 0;
	var payPrice = 0;
	var deleveryPrice = 0;
	
	
	$('.price').each(function(i,item) {
		if($("input:checkbox[id=checkBox"+i+"]").is(":checked")==true){
			
		price.push(item.value)
		}
	})
	$('.cartCount').each(function(i,item) {
		if($("input:checkbox[id=checkBox"+i+"]").is(":checked")==true){
		
			cartCount.push(item.value)
		}
	})
	
	for(var i = 0 ; i <price.length;i++ ){
	
		priceSum = priceSum + (price[i]*cartCount[i])
		deleveryPrice = deleveryPrice+(2600*cartCount[i]);
	}
	
	$('#deleveryPriceSpan').html(deleveryPrice.toLocaleString('ko-KR')+"원")
	
	payPrice = priceSum + deleveryPrice;
	$('#sumPriceSpan').html(priceSum.toLocaleString('ko-KR')+"원")
	$('#payPriceSpan').html(payPrice.toLocaleString('ko-KR')+"원")
	
	
	
}

function changeCheckbox() {
	priceSum()
}


function changeQuantity(status,index) {	
	var checkQuantity = parseInt($('#cartCount'+index).val())
	var itemsPrice = 0;
	if(status==1){
		checkQuantity+=1
		$('#cartCount'+index).val(checkQuantity)
	}else{
		if(checkQuantity>1){
			checkQuantity-=1
			$('#cartCount'+index).val(checkQuantity)
		}else{
			return false;
		}
	}
	itemsPrice = parseInt($('#price'+index).val())*checkQuantity
	$('#itemsPriceSpan'+index).html(itemsPrice.toLocaleString('ko-KR'))
	priceSum()
}

function movePayment() {
	
	$('.price').each(function(i,item) {
		if($("input:checkbox[id=checkBox"+i+"]").is(":checked")==false){
			
			$('#basketInfoTr'+i).remove();
		}
	})
	
	$('#moveUbookPaymentForm').submit(); 

	
}
function deleteCart(index,cartNo) {
	if(confirm("이 항목을 장바구니에서 삭제하시겠습니까?")){
		$('#basketInfoTr'+index).remove();
		$.ajax({
			
			url : "deleteCart.ub",
			type: "post",
			data : {
				cartNo : cartNo
			},
			success : function(str) {
				if(str=="pass"){
					console.log("장바구니 삭제 성공.")
				}else{
					alert("장바구니 삭제에 실패했습니다.")
				}
			},
			error : function(e) {
				alert("ajax 통신중 오류 발생")
			}
				
			
		})

		priceSum();
	}

}
</script>
</head>

<body style="width: 1200px; margin: 0 auto;">
 	<jsp:include page="../ubook/ubookMenu.jsp"/>
	<hr>
	<main style="margin-top:215px;">

		<c:choose>
		<c:when test="${requestScope.cartItemList != null}">
		

		<div class="container">
			<div class="cart_inner">
				<form action="moveUbookPayment.ub" method="post" id="moveUbookPaymentForm">
					<table class="table" id="basketTable">
						<thead>
							<tr>
								<th></th>
								<th style="width: 35%;">상품정보</th>
								<th style="width: 15%;">판매가</th>
								<th style="width: 10%;">수량</th>
								<th style="width: 10%;">합계</th>
								<th style="width: 15%;">예상출고일정<br>
								<span style="font-size: 5px">(판매자 발송 일정에 따라 변동)</span></th>
								<th style="width: 12%;">선택</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.cartItemList}" var="list"
								varStatus="status">
								<tr id="basketInfoTr${status.index}">
									<td><input type="checkbox" value=""
										id="checkBox${status.index}" checked="checked"
										onchange="changeCheckbox()"></td>
									<td>
										<div class="media">
											<div class="d-flex">
												<img
													src="${pageContext.servletContext.contextPath }/resources/images/Ubookimg/${list.ubookImg}"
													style="height: 150px">
											</div>
											<div class="media-body">
												<%-- <input name="sellerNo" value="${list.BSellerNo}"/> --%>
												<p>${list.ubookName}</p>
												<%-- <p>${list.BSellerNo}</p> --%>
											</div>
										</div>
									</td>
									<td><input type="hidden" id="price${status.index}" class="price" value="${list.ubookPrice}"> <span
										style="text-decoration: line-through">
										<fmt:formatNumber value="${list.ubookOPrice}" />원 </span><br> 
										<span style="color: red;">
										<fmt:formatNumber value="${list.ubookPrice}" /></span>원
										</td>
									<td>
										<div style="display: flex; align-items: center;">
											<input type="hidden"
												name="cartList[${status.index}].cartNo"
												value="${requestScope.cartList[status.index].cartNo}">
											<input type="hidden" value="${sessionScope.loginUser.userId}"
												name="cartList[${status.index}].cartUserId"> <input
												type="hidden" name="cartList[${status.index}].cartUbNo"
												value="${requestScope.cartList[status.index].cartUbNo}">
											<input type="text" readonly="readonly"
												name="cartList[${status.index}].cartCount"
												id="cartCount${status.index}" class="cartCount" maxlength="2"
												value="${requestScope.cartList[status.index].cartCount}"
												style="height: 40px; width: 30px;">&nbsp;
											<%-- <div>
												<button type="button"
													style="height: 20px; width: 30px; font-size: 10px;"
													onclick="changeQuantity(1,'${status.index}')">▲</button>
												<br>
												<button type="button"
													style="height: 20px; width: 30px; font-size: 10px;"
													onclick="changeQuantity(0,'${status.index}')">▼</button>
											</div> --%>
										</div>
									</td>
									<td><span id="itemsPriceSpan${status.index}"><fmt:formatNumber
												value="${list.ubookPrice*requestScope.cartList[status.index].cartCount}" /></span>원
									</td>
									<td>${requestScope.shipDate}</td>
									<td><button type="button" style="background-color: #dcd3cc; width: 100%; border: none; border-radius: 5px;"
											onclick="deleteCart(${status.index},${requestScope.cartList[status.index].cartNo})">장바구니
											삭제</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
				<div style="width: 80%; margin: auto;">
					<table class="table">
						<thead class="thead-light">
							<tr>
								<th style="width: 25%;">총 상품금액</th>
								<th></th>
								<th style="width: 20%;">배송비</th>
								<th></th>
								<th style="width: 25%;">결제 예정금액</th>

							</tr>


						</thead>
						<tr>
							<td><span id="sumPriceSpan" style="font-size: 20px"></span></td>
							<td>+</td>
							<td><span id="deleveryPriceSpan" style="font-size: 20px"></span></td>
							<td>=</td>
							<td><span id="payPriceSpan"
								style="color: red; font-size: 20px; font-weight: bold;"></span></td>
						</tr>

					</table>


				</div>
			</div>
		</div>
		<center><button type="button" onclick="movePayment()" style="background-color: #5cb85c; width: 460px; border: none; border-radius: 5px; margin-bottom: 50px; height: 50px; color: #fff; font-size: 17px;">결제하기</button></center>
		</c:when>
		<c:otherwise>
		<div style="margin-top: 360px;font-size: 30px;font-weight: bold; text-align: center; margin-bottom: 200px;">장바구니에 등록된 상품이 없습니다.</div>
		</c:otherwise>
		</c:choose>
	</main>

	<jsp:include page="../common/footer.jsp" />
</body>

</html>