<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
 <!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>중고상품 주문내역 보기</title>

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
   
        
        .order_details_table{
           text-align: center;
            padding-left: 10%;
           padding-right: 12%; 
        }
        
    </style>
</head>
<body style="width: 1200px; margin: auto;">
 <jsp:include page="../common/menubar.jsp" />

<!-- 왼쪽 사이드바  -->
    <section  style="padding-top: 180px;" >
        <div class="container">
          <div class="row">
         <jsp:include page="../myPageSideBar/sideBar.jsp" />

     

              <!-- 주문리스트 테이블  -->
              <div style="text-align: center; width: 900px; height: auto; margin-left: 40px">
                <div class="order_details_table">
                    <h1>주문 목록 리스트 </h1>
                       배송전엔 사용자가 취소가 가능합니다. 
                    <div class="table-responsive" style="text-align: center">
                      <table class="table" style="text-align: center;">
                        <thead style="text-align: center;">
                          <tr>
                            <th scope="col">주문번호</th>
                            <th scope="col">주문일 </th>
                            <th scope="col">주문내역 상세보기</th>
                            <th scope="col">총 결제금액</th>
                            <th scope="col">받으실 분 </th>
                            
                          </tr>
                        </thead>
              
				    <!--받는사람 이름이랑 날짜로 조회하기 만들기 -->	    
                        <tbody style="text-align: center;">
                      
					<c:if test="${empty ubMyOrderList}">
                           <td colspan="5"><h2>주문하신 상품이 없습니다. </h2></td>
                    </c:if>
                          
                          
                          
                   <c:forEach var="item" items="${ubMyOrderList}" varStatus="status">
                       
                      <tr>       
                       	<td>
                    	<input type="hidden"  id="paymentNo${status.index}" value="${item.paymentNoUb}"/>
                        	<p><c:out value="${item.paymentNoUb}"/></p></td>     
                        	<td><fmt:formatDate value="${item.payDateUb}" pattern ="yyyy-MM-dd"/></td> 
                  	   		<td class="orderListDetail"><p style="cursor:pointer" onclick="OrderListDetailGo('${status.index}')">주문내역 상세보기</p></td> 
                  	     	<td><c:out value="${item.totalCostUb}"/>원</td>                <!--  '' 스트링으로 가져온다 -->
                  	     	<td><c:out value="${item.shippingNameUb}"/>님</td>
                       </tr>
                            
                   </c:forEach>
                         
                        </tbody>
                      </table>
                    </div>
                </div>
                <!--  히든으로 숨겨져있는애 -->
					<form id="detailForm" action="selectMyOrderListDetail.ub" method="post">
					<input type="hidden" id="detailForm1" name="paymentNoUb" ></form> 
                      
                         
             </div> 
    
   		</div>
   		
            </div>
          
       
      </section>


		<script type="text/javascript">
	
         
         //히든 인풋으로 들고오는 애 
		function OrderListDetailGo(num){
			
			var pay = $('#paymentNo'+num).val();
			 $('#detailForm1').val(pay);
			 $("#detailForm").submit();
		}
		
 		//주문 취소 버튼 
		function orderCancle() {
			if (confirm("정말 취소하시겠습니까? ") == true) { //확인
				document.form.submit();
			} else { //취소
				return;
			}
		}
		</script>

    
	   <jsp:include page="../common/footer.jsp" />
		
</body>
</html> 