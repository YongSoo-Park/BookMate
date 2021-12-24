<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록 상세보기</title>

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
    
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
</head>


			
<body style="width: 1200px; margin: auto;">
 <jsp:include page="../common/menubar.jsp" />

  <section  style="padding-top: 180px;" >
        <div class="container">
          <div class="row">
         <jsp:include page="../myPageSideBar/sideBar.jsp" />

     

              <!-- 주문리스트 테이블  -->
              <div style="text-align: center; width: 900px; height: auto; margin-left: 40px">
						<div class="order_details_table">
							<h2>주문 목록 리스트</h2>
							
							<span style="color: red;">중고 상품은 교환이나 환불이 불가합니다.</span> 
						<br>구매하실 때 유의해주시길 바랍니다.  
							<div class="table-responsive">
								<table class="table" style="text-align: center;">
									<thead style="text-align: center;">
										<tr>
											<th scope="col">상세주문번호</th>
											<th scope="col">도서 제목</th>
											<th scope="col">주문 수량</th>
											<th scope="col">도서 가격</th>
											<th scope="col">주문상태</th>
											<th scope="col">상태</th>
										</tr>
									</thead>

									<tbody style="text-align: center;">



										<c:forEach var="item" items="${ubMyOrderListDetail}" varStatus="status">

											<tr>
												<td><p>
														<c:out value="${item.paymentDetailNoUb}" />
													</p></td>

												<td style="text-align: left"><img
													src="${pageContext.servletContext.contextPath }/resources/images/Ubookimg/${item.ubookImgUb}"
													style="width: 40px; height: auto;" /> <c:out
														value="${item.ubookNameUb}" /></td>

												<td><c:out value="${item.quantityUb}" />개</td>
												<td><del><c:out value="${item.ubookPriceUb}"/></del>원 <div><c:out value="${item.ubookOPriceUb}"/>원</div></td>
												<td>
												<c:choose>
													<c:when test="${item.deliveryStatusUb =='주문확인' }">주문확인중</c:when>
													<c:when test="${item.deliveryStatusUb =='배송준비' }">배송준비</c:when>
													
													<c:when test="${item.deliveryStatusUb=='수취확인'  }">수취확인</c:when>
												</c:choose>
												</td>
												<td>
												
												  <c:choose>
													<c:when test="${item.deliveryStatusUb =='발송완료'}">
													
													 <div><input type="button" onclick="confirmOrder('${item.paymentDetailNoUb}','${item.paymentNoUb}')" value="수취확인" /></div>
																				
													</c:when>
													
													<c:when test="${item.deliveryStatusUb =='발송완료'}">
															<input type="button" onclick="confirmOrder('${item.paymentDetailNoUb}','${item.paymentNoUb}')" value="수취확인" disabled />
													</c:when>
												</c:choose>
												
												</td>
											</tr>
											
										</c:forEach>

									</tbody>
								</table>

							</div>

		

						</div>
					</div>
				</div>

			</div>
		

	</section>
 
 <script type="text/javascript">
 
 //paymentNoUb, int paymentDetailNoUb,

 function confirmOrder(paymentDetailNoUb,paymentNoUb){
		 
		 
		 console.log(paymentDetailNoUb)
		 console.log(paymentNoUb)
		 
	 var answer = confirm("구매확정하시겠습니까? 확정시 교환환불이 불가합니다.")

	if(answer==true){
		
		var formObj1=document.createElement("form");
		var confirmOrder = document.createElement("input"); 
	 	var confirmOrder2 = document.createElement("input"); 
		
		confirmOrder.name = "paymentDetailNoUb";
		confirmOrder.value = paymentDetailNoUb;
 
		confirmOrder2.name = "paymentNoUb";
		confirmOrder2.value = paymentNoUb;

	    console.log( formObj1 );
	    
	    
		formObj1.appendChild(confirmOrder);
	    formObj1.appendChild(confirmOrder2);
	    document.body.appendChild(formObj1); 
	    formObj1.method="post";
	    formObj1.action="confirmOrder.ub";
	    formObj1.submit();
	    
	}
 } 

</script>
 

	<jsp:include page="../common/footer.jsp" />

</body>
</html>