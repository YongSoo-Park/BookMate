<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>포인트 조회</title>

<link rel="icon" href="img/Fevicon.png" type="image/png">
<link rel="stylesheet"
	href="resources/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet"
	href="resources/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="resources/vendors/linericon/style.css">
<link rel="stylesheet"
	href="resources/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="resources/vendors/owl-carousel/owl.carousel.min.css">

<link rel="stylesheet" href="resources/css/style.css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
body {
	width: 1200px;
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

				<!-- 회원의 포인트 조회를 할 수 있는 란  -->
				<div class="" style="width: 800px; margin-left: 20px ">
					<div class="" >
						<div class="" style="text-align: center;" ></div>
						<div class="">
			<h1 style="text-align: center;">나의 찜목록 리스트</h1>
			<br>
			<table class="table" style="text-align: center;">
				<thead style="text-align: center;">
					<tr>
						<th scope="col">바로가기 링크</th>
						<th scope="col"></th>
						<th scope="col">도서 제목</th>
						<th scope="col">작가</th>
						

					</tr>

				<c:if test="${empty wList}">
					<td colspan="5"><h2>찜하신 상품이 없습니다.</h2></td>
				</c:if>

					<c:forEach var="item" items="${wList }" varStatus="status">
						<tr>
				<td><input type="button" value ="내가찜한책 바로가기" onclick="moveDetail('${item.bookISBN }')"/></td>
					
				<td><img 
					src="${pageContext.servletContext.contextPath }/resources/images/book_img/${item.bookMainImg}"
					style="width: 50px; height: auto;"></td>
				<td><c:out value="${item.bookTitle }" /></td>

				<td><c:out value="${item.bookWriter}" /> </td>
				
				
				</tr>
					</c:forEach>
			</table>
		</div>
	</div>
</div>
</div>
</div>
  </section>
  	<form action="selectBook.book" method="post" id="moveDetailForm">
			<input type="hidden" id="moveDetailInput" name="bookISBN">
		</form>

	<jsp:include page="../common/footer.jsp" />

</body>
<script type="text/javascript">

	function moveDetail(bookISBN) {
		$('#moveDetailInput').val(bookISBN)
		$('#moveDetailForm').submit();
	}
</script>

</html>