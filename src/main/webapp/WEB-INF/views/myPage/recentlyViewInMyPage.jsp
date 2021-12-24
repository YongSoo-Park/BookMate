<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%-- <c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
 --%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

<body>

 <jsp:include page="../common/menubar.jsp" />

<!-- 왼쪽 사이드바  -->
	<section style="padding-top: 180px;">
		<div class="container">
			<div class="row">
				<jsp:include page="../myPageSideBar/sideBar.jsp" />


				<div
					style="text-align: center; width: 900px; height: auto; margin-left: 40px">
					<div class="order_details_table">
						<h1>나의 최신 본 목록 리스트</h1>
						<table class="table" style="text-align: center;">
							<thead style="text-align: center;">
							<p> 이미지를 클릭하시면 상세보기 페이지로 이동합니다 </p>
							

				
						<%-- 	<c:forEach var="i" begin="0" end="${fn:length(isbnList)-1}" step="4">
								<c:forEach test="" var="isbn" items="${isbnList}" varStatus="status">
									<c:forEach items="${viewList}" var="book">
										<c:if test="${book.bookISBN eq isbn }"></c:if>
								 		<c:set var="bb" value="${book}" /> 
									
									<tr>
										<c:if test="${empty isbnList}">
											<td colspan="4"><h2>최근 본 상품이 존재하지 않습니다.</h2></td>
										</c:if>
										
											<td><img
												src="${pageContext.servletContext.contextPath }/resources/images/book_img/${bb.bookMainImg}"
												style="width: 40px; height: auto;"
												onclick="moveDetail('${bb.bookISBN}')" alt="">
											<td>
											<td><c:out value="${bb.bookTitle }" /></td>
											<td><c:out value="${bb.bookWriter }" /></td>
									</tr>
									
								
									<!-- 중복으로 나오니 원인을 찾을 것....  -->
										</c:forEach>
									</c:forEach>
								</c:forEach> --%>
			<c:set var="length" value="0" />	<!--서연씨 코드 공부하기 왜 중간에 빵꾸나는지 찾을것   -->
				<c:forEach var="i" begin="0" end="${fn:length(isbnList)}" step="4">
									<tr>
										<c:forEach begin="${i}" end="${i+3}" items="${isbnList}" var="isbn">
											<td><c:forEach var="book" items="${viewList}">
													
													<c:if test="${book.bookISBN eq isbn }"> <!-- 만약 같으면 이미지를 띄워줘라   -->
														<img
															src="${pageContext.servletContext.contextPath }/resources/images/book_img/${book.bookMainImg}"
															class="media-photo"
															style="width: 90px; height: 140px; cursor: pointer; padding-top: 20px;"
															onclick="moveDetail('${book.bookISBN}')" alt="">
													</c:if>

												</c:forEach>
											</td>
										</c:forEach>
									</tr>
							</c:forEach>
						</table>

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