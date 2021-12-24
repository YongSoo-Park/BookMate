<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교환/반품 페이지 </title>
<link rel="icon" href="img/Fevicon.png" type="image/png">
    <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="resources/vendors/linericon/style.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">
  
     <!-- 제이쿼리피커  -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <link rel="stylesheet" href="resources/css/style.css">
    
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  
</head>

<style>

th{

background-color: yellow;


}

</style>
<body>

	<h1>교환 신청 페이지 </h1>
 	<form action="insertExchange.me" method="post">

	  	<table border="1px;" style="text-align: center;">
	  	
	  		<tr>
	  	 	  <th>상세상품번호</th>
	  		  <th>상품정보</th>
	  		  <th>교환수량</th>
	  		  <th>받으실 분 </th>
	  		  <th>휴대폰 번호 </th>
	  		  <th>주소</th>
	  		
	  		</tr>  
	  
	  		<tr>
	  			<td><c:out value="${exchangeDetail.paymentDetailNo}"/></td>
	  			<td style="text-align: left"><img src="${pageContext.servletContext.contextPath }/resources/images/book_img/${exchangeDetail.bookMainImg}" style="width: 40px; height: auto;"/>
                 <c:out value="${exchangeDetail.bookTitle}"/></td>
	  			<td><c:out value="${exchangeDetail.quantity}"/>개</td>
	  			<td><c:out value="${payNo.shippingName}"></c:out></td>
	  			<td><c:out value="${payNo.shippingPhone}"></c:out></td>
 	  			<td>
	  			<c:out value="${payNo.shippingAddress}"/>
 	  			
	  			</td>
	  		
	  		</tr>
	  		  	 
	  	</table>
	  				<input type="hidden" value="${payNo.user_Id}" name="user_Id">
	  				<input type="hidden" value="${exchangeDetail.paymentDetailNo }" name="paymentDetailNo">
	  				<input type="hidden" value="${payNo.shippingName }" name="exchangeName">
	  				<input type="hidden" value="${payNo.shippingPhone }"name ="exchangePhone">
	  				<input type="hidden" value="${payNo.shippingAddress}"name ="exchangeAddress">
 	  				<%-- <input type="hidden" value="${payNo.shippingPostCode }"name="exchangeShippingPostCode">
 	  				<input type="hidden" value="${payNo.shippingAddressDetail }"name="exchangeShippingAddressDetail">
  			 --%>
	  	<br>
	  <button type="submit" onclick="exchangeSubmit()"> 교환 신청 </button>
	  <input type="hidden" value="${exchangeDetail.paymentNo }" name="paymentNo"> 
	  </form>
	  
	  <script>
	  		function exchangeSubmit(){
	  		
	  			alert("교환신청이 완료 되었습니다.");
	  			
	  		}
	  
	  </script>
	  
</body>
</html>