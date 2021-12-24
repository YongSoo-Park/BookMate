<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 리뷰 리스트 </title>
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

<style>
#pagingArea {
	width: fit-content;
	margin: auto;
}
</style>

<body style="width: 1200px; margin: auto;">

 <jsp:include page="../common/menubar.jsp" />

<!-- 왼쪽 사이드바  -->
	<section style="padding-top: 180px;">
		<div class="container">
			<div class="row">
				<jsp:include page="../myPageSideBar/sideBar.jsp" />


				<div
					style="text-align: center; width: 900px; height: auto; margin-left: 40px">
					<div class="order_details_table">
						<h1>마이 리뷰 리스트 보기</h1>
						<table class="table" style="text-align: center;">
							<thead style="text-align: center;">
								<tr>
									<th scope="col">내가 쓴 리뷰 가기</th>
								 	<th scope="col">제목</th>
								 	<th scope="col">내용</th>
									<th scope="col">작성일</th>
									

								</tr>

								<c:if test="${empty myBrList}">
									<td colspan="5"><h2>작성한 리뷰가 없습니다.</h2></td>
								</c:if>

								<c:forEach var="item" items="${myBrList}" varStatus="status">
									<tr>											
										<td><input type="button" value ="내가 쓴 리뷰 가기" onclick="moveDetail('${item.bookISBN }')"/></td>
										
										<td><c:out value="${item.reviewTitle }"/></td>
										<td><c:out value="${item.reviewContent }"/></td>
										<td><fmt:formatDate value="${item.reviewDate}"
												pattern="yyyy-MM-dd" /></td>
									</tr>
								</c:forEach>
						</table>
						<br>
						
						<div id="pagingArea">
							<ul class="pagination" style="text-align: center;">
								<c:choose>
									<c:when test="${ pi.currentPage ne 1 }">
										<li class="page-item"><a class="page-link"
											href="myReview.me?currentPage=${ pi.currentPage-1 }">이전</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled"><a class="page-link"
											href="">이전</a></li>
									</c:otherwise>
								</c:choose>

								<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }"
									var="p">
									<c:choose>
										<c:when test="${ pi.currentPage ne p }">
											<li class="page-item"><a class="page-link"
												href="myReview.me?currentPage=${ p }">${ p }</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item disabled"><a class="page-link"
												href="">${ p }</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>


								<c:choose>
									<c:when test="${ pi.currentPage ne pi.maxPage }">
										<li class="page-item"><a class="page-link"
											href="myReview.me?currentPage=${ pi.currentPage+1 }">다음</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled"><a class="page-link"
											href="myReview.me?currentPage=${ pi.currentPage+1 }">다음</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
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