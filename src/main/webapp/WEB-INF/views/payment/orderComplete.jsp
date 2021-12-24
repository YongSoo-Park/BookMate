<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
</head>
<style>
.tableWrap{
    padding-left: 20px;
    padding-right: 20px;
}
.pay th{
    width: 40%;
}
.pay th,.pay td{
    padding-left: 20px;
    padding-right: 20px;
}
.title{
    font-size: 25px; 
    font-weight: bold; 
    padding-left: 20px;
}
.pay2 th{
    width: 15%;
}
.mainTitleSpan{
font-size: 35px;
font-weight: bold;
margin-left: 50px;
margin-right: 50px;
}

</style>
<body>
<jsp:include page="../common/menubar.jsp" />
		<main class="site-main" style="padding-top: 180px;display: flex;">
		
        <br><br><br>
		<hr>
		
		<div id="bodyWrap" style="margin-left: auto; margin-right: auto;"><br>
		<div style="text-align: center; background-color: lightgray;">
<span class="mainTitleSpan">장바구니</span><span class="mainTitleSpan"> 〉</span><span class="mainTitleSpan" >결제</span><span class="mainTitleSpan"> 〉</span><span class="mainTitleSpan" style="font-size: 40px;color: olive;">주문완료</span>
</div><br><br>
<br><br><br>
		
        <div style="width: 1000px; text-align: center;">
        <img src="${pageContext.servletContext.contextPath }/resources/img/orderComplete.png" width="250px" height="250px"><br>
        
            <span style="font-weight: bold; font-size: 35px;">감사합니다.<br>
            주문이 완료되었습니다.</span>
        
        
        </div>
   
        <br><br><br><br><br>
    <div style="width: 1000px;" class="tableWrap">
    <span class="title">주문 도서 내역</span><br><br>
    <table class="table pay pay2">
        <tbody>
        <c:forEach items="${requestScope.paymentDetailList}" var="list">
        <tr>
            <th>도서명</th>
            <td style="width: 450px;">${list.bookTitle}</td>
            <th>주문수량</th>
            <td>${list.quantity}권</td>
        </tr>
        
        <tr>
            <td colspan="4"><hr></td>
        </tr>
        </c:forEach>
    </tbody>
    </table>
</div>
    <div style="display: flex; width: 1000px;">
        <div style="width: 50%;" class="tableWrap">
            <span  class="title">배송지 정보</span><br><br>
    <table class="table pay"> 
        <tbody>

            <tr>
                <th>받는분</th>
            <td>${requestScope.payment.shippingName}</td>

            </tr>
            <tr>
                <th>배송 주소</th>
            <td>${requestScope.payment.shippingAddress}<br>${requestScope.payment.shippingAddressDetail}</td>

            </tr>
        <tr>
            <th>전화번호</th>
        <td>${requestScope.payment.shippingPhone}</td>

        </tr>

        </tbody>

    </table></div> <div style="width: 50%;" class="tableWrap">
    <span  class="title">결제 정보</span><br><br>
    <table class="table pay"> 
        <tbody>
            <tr>
                <th>도서총액</th>
            <td><fmt:formatNumber value="${requestScope.payment.totalCost}"/>원 </td>
    
            </tr>
            <tr>
                <th>배송비</th>
            <td><fmt:formatNumber value="${requestScope.payment.deliveryCost}"/>원</td>
    
            </tr>
            <tr>
                <th>사용포인트</th>
            <td><fmt:formatNumber value="${requestScope.payment.usePoint}"/>pt</td>
    
            </tr>
            <tr>
                <th>결제 총액</th>
            <td><span style="font-weight: bold; color: red;"><fmt:formatNumber value="${requestScope.payment.totalPayCost}"/>원</span></td>
    
            </tr>
        </tbody>
    </table></div></div>
    <br><br><br>
    </div>
</main>
<jsp:include page="../common/footer.jsp" />
</body>
</html>