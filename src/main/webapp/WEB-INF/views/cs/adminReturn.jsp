<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
    
<!DOCTYPE html>
<html>
<head>
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

<meta charset="UTF-8">
<title>관리자 교환페이지 </title>
</head>
<body>


	<h2>환불 리스트 목록</h2>


	<table class="table" style="text-align: center; width: 1200px;">


		<tr>
			<th>환불 상세주문 번호</th>
			<th>환불 주문 번호</th>
			<th>환불요청 아이디</th>
			<th>포인트</th>
			<th>성함</th>
			<th>책 제목 </th>
			<th>주문 수량</th>
			<th>주문상태</th>
			<th>상태</th>
		</tr>
		
		
	
	 <c:forEach  var="returnItem" items="${returnBookList}" varStatus="status">		
		<c:forEach items="${orderDetailList}" var="paymentDetail">	
			<c:if test="${returnItem.paymentDetailNo eq paymentDetail.paymentDetailNo}">
				<c:set var="pd" value="${paymentDetail}"/>
			</c:if>
		</c:forEach> 
			<tr>		
				<td><c:out value="${returnItem.returnNo}"/></td>
			<td ><span id="pno${status.index}"><c:out value="${returnItem.paymentDetailNo}"/></span></td>
			<td><span id="userno${status.index}"><c:out value="${returnItem.user_Id }"/></span></td>
				<td><span id="point${status.index}"><c:out value="${pd.getPoint }"/></span></td>
				<td><c:out value="${returnItem.returnName}"/></td>
				<td><c:out value="${pd.bookTitle}"/></td>
				<td><c:out value="${pd.quantity}"/>개</td> 
				
			
				<td>
			
			<c:choose> 
			<c:when test="${returnItem.returnStatus == '1'}"> 환불대기중 </c:when>
			<c:when test="${returnItem.returnStatus == '2'}"> 환불완료 </c:when>
			</c:choose>
			
				</td>
				
				
				<td><button type="submit" id="${status.index}" onclick="reButton(this);">승인 </button></td>
				
		</tr>
	</c:forEach>

	</table>

	<form action="updateReturnList.cs" method="post" id="reForm">
	<input type="hidden" name="paymentDetailNo" id="returnThing"/>
		<input type="hidden" name="user_Id" id="returnThing1"/>
		<input type="hidden" name="getPoint" id="returnThing2"/>
	
		
				
	</form>

	<script>
	
 	function reButton(e){
		
		var exId = "${sessionScope.loginUser.userId}"
		var index = $(e).attr('id'); //버튼을 클릭했을때 id 들고와라 
	
		var pno =parseInt($('#pno'+ index ).text()); //span으론 텍스트 뽑아야 온다. 
		var user = $('#userno' + index).text();
		var point =parseInt($('#point' + index).text());
		console.log(index)
		console.log(pno)
		
		console.log(user)
		console.log(point)
		
		$('#returnThing').val(pno);
		$('#returnThing1').val(user);
		$('#returnThing2').val(point);
		$('#reForm').submit();
		
	}
	
	

	
	
	
	</script>

</body>
</html>