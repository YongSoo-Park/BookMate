<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 배송 대기중 업데이트 리스트 </title>
</head>


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
    
<body> 

	<h1>[관리자] 배송 대기중 리스트 </h1>

	<table class="table" style="text-align: center; width: 1200px;">
	
		<tr>
			<th>상세주문 번호</th>
			<th>성함</th>
			<th>책 제목 </th>
			<th>주문 수량</th>
			<th>주문상태</th>
			<th>상태</th>
		</tr>
		
		<c:forEach items="${pList}" var="item" varStatus="status"> 
		<tr>
			 <td><span id="dno${status.index }"><c:out value="${item.paymentDetailNo }"/></span></td>
			 <td><c:out value="${item.shippingName }"/></td>
			 <td><c:out value="${item.bookTitle }"/></td>
			 <td><c:out value="${item.quantity }"/>개</td>
			
			
			
				<td>
				<c:choose>
				<c:when test="${item.deliveryStatus =='2' }">배송대기중</c:when>
				<c:when test="${item.deliveryStatus =='3' }">배송완료</c:when>
				</c:choose>	
				
				</td> 
		
			
			
			<td>
			
			<button type="submit" id="${status.index}" onclick="deliButton(this);">승인</button>
			
			</td>
		</tr>
	 </c:forEach> 
	</table>
		<form action="updateDeliveryList.cs" method="post" id="deliForm"> 
		<input type="hidden" name="paymentDetailNo" id="deliThing"></form>

	<script type="text/javascript">

	function deliButton(e){
		
		var index =$(e).attr('id');
		var dno =$('#dno' + index).text()
		
		console.log(index)
		console.log(dno)
		$('#deliThing').val(dno);
		$('#deliForm').submit();
		
	}
	
	</script>
</body>
</html>