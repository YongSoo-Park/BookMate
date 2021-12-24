<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>검색</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



	<style>
		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
			-webkit-appearance: none;
		}

		#searchTable {
			width: 1200px;

		}

		#searchTable td {
			vertical-align: middle;
			align-items: center;
		}

		#pageNumber {
			text-align: center;
			margin-top: 10px;
		}

		#pageNumber span {
			cursor: pointer;
		}

		.centerTd {
			text-align: center;
		}

		#searchTable th {
			background-color: rgba(166, 219, 240, 0.233);
		}

		.sizeUpBtn {
			font-size: 20px;
		}

		.changeKindSpan {
			font-size: 20px;
			margin: 20px;
			cursor: pointer;
		}

		.moveDetailEle {
			cursor: pointer;
		}
	</style>
	<script type="text/javascript">
		//페이지 이동 숫자 직접입력시 입력 제한을 위한 마지막 페이지 숫자
		var lastPage = parseInt("${requestScope.searchPaging.lastPage}")
		
		//페이지 숫자를 클릭했을때 클릭 숫자를 가져와서 페이지 이동
		function movePage(searchNowPage) {
			$('#searchNowPageInput').val(searchNowPage);
			$('#pageMoveForm').submit();
		}

		
		//페이지 이동 숫자를 직접 입력시 잘못된 입력을 방지후 페이지 이동
		function movingPageNum() {
			var movingPageNum = parseInt($('#movingPageNum').val())
			if (movingPageNum >= 1 && movingPageNum <= lastPage) {
				movePage(movingPageNum);
			} else {
				alert('이동 페이지는 1과 ' + lastPage + '페이지 사이로 입력해 주세요')
			}
		}

		//검색 정렬조건 변경시
		function changeKind(searchKind) {
			$('#searchKindInput').val(searchKind);
			movePage(1);
		}
		
		//도서 상세보기 누를시
		function moveDetail(bookISBN) {
			$('#moveDetailInput').val(bookISBN)
			$('#moveDetailForm').submit();
		}
	</script>
</head>

<body>
	<jsp:include page="../common/menubar.jsp" />
	<main class="site-main" style="padding-top: 180px;display: flex; margin-top: 50px;margin-bottom: 50px">
		<form action="selectSearchKeyword.se" method="post" id="pageMoveForm">
			<input type="hidden" id="searchNowPageInput" name="searchNowPage"
				value="${requestScope.searchNowPage}">
			<input type="hidden" id="searchKindInput" name="searchKind" value="${requestScope.searchKind}">
			<input type="hidden" id="keywordInput" name="keyword" value="${requestScope.keyword}">
		</form>
		<form action="selectBook.book" method="post" id="moveDetailForm">
			<input type="hidden" id="moveDetailInput" name="bookISBN">
		</form>
		<table id="searchTable" class="table table-hover">
			<thead>
				<tr>
					<th colspan="4" style="height: 50px;">
						<span onclick="changeKind(1)" class="changeKindSpan">신간도서</span> |
						<span onclick="changeKind(2)" class="changeKindSpan">판매량</span> |
						<span onclick="changeKind(3)" class="changeKindSpan">도서명</span> |
						<span onclick="changeKind(4)" class="changeKindSpan">높은평점</span> |
						<span onclick="changeKind(5)" class="changeKindSpan">높은가격</span> |
						<span onclick="changeKind(6)" class="changeKindSpan">낮은가격</span>
					</th>
				</tr>
				<tr>
					<td colspan="4">

					</td>
				</tr>
			</thead>
			<tbody>

				<c:set var="array">소설/시/에세이, 경제/경영, 과학, 인문, 컴퓨터/IT, 자기계발, 정치/사회, 역사/문화, 취미, 가정/육아 </c:set>
				<c:forEach items="${requestScope.searchList}" var="list" varStatus="status">
					<tr>
						<td style="width: 10%" class="centerTd">
							<img src="${pageContext.servletContext.contextPath }/resources/images/book_img/${list.bookMainImg}"
								style="width: 80px; height: auto;" onclick="moveDetail('${list.bookISBN}')"
								class="moveDetailEle"><br>
							<span style="font-size: 13px">${list.bookISBN}</span>
						</td>
						<td style="width: 60%; padding-left: 10px;"><span id="bookSubCategorySpan">
								<c:forEach items="${array}" var="arrList" varStatus="arrStatus">
									<c:if test="${list.bookSubCategory==arrStatus.index}">
										<${arrList}>
									</c:if>
								</c:forEach>
							</span>
							<span id="moveDetailSpan" onclick="moveDetail('${list.bookISBN}')"
								class="moveDetailEle">
								<span id="bookTitleSpan"
									style="font-size: 20px; font-weight: bold; color: dodgerblue;">${list.bookTitle}</span>
								<c:if test="${list.bookSubTitle!=null}"><span id="bookSubTitleSpan"> :
										${list.bookSubTitle}</span></c:if>
							</span>
							<br><br>
							<span style="font-size: 14px;"><span
									id="bookWriterSpan">${list.bookWriter}</span> 지음 | <span
									id="bookPublisherSpan">${list.bookPublisher}</span> |
								<span id="bookPublisheDateSpan">
									<fmt:formatDate value="${list.bookPublisheDate}"
										pattern="yyyy일 MM월 dd일" />
								</span><br></span>
							<span style="font-size: 13px;"><span style="color: darksalmon;">[출고일정]</span>
								지금주문하면
								<fmt:formatDate value="${requestScope.shipDate}" pattern="yyyy일 MM월 dd일" />
								출고
							</span>
						</td>
						<td style="width: 15%" class="centerTd">평점 <span
								style="color: darksalmon; font-weight: bold;">${list.bookRating}</span> /
							10<br><br>
							<span style="font-size: 14px;">리뷰 ${list.bookReviewCount}개</span>
						</td>
						<td style="width: 15%" class="centerTd"><span id="bookPriceSpan"
								style="font-size: 14px; text-decoration: line-through;">
								<fmt:formatNumber value="${list.bookPrice}" />원
							</span><br>
							<span id="bookSalePriceSpan" style="color: red; font-weight: bold;">
								<fmt:formatNumber value="${list.bookPrice*0.9}" />원
							</span> [10%↓]<br>
							<span id="bookPriceSpan" style="font-size: 14px;">
								<fmt:formatNumber value="${list.bookPrice*0.02}" /> Pt 적립
							</span>
						</td>
					</tr>

					<tr>
						<td colspan="4">

						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" id="pageNumber">
						<div style="margin : 10px">
							<c:if test="${requestScope.searchPaging.prePage==1}">
								<span class="sizeUpBtn" onclick="movePage(1)">
									<<</span>&nbsp;&nbsp;
										<span class="sizeUpBtn"
											onclick="movePage(${requestScope.searchPaging.startPage-10})">
											<</span>
							</c:if>&nbsp;&nbsp;
							<c:forEach begin="${requestScope.searchPaging.startPage}"
								end="${requestScope.searchPaging.endPage}" varStatus="status">
								<c:choose>
									<c:when test="${status.current==requestScope.searchPaging.nowPage}">
										&nbsp;${status.current}&nbsp;
									</c:when>
									<c:otherwise>
										&nbsp;<span style="cursor: pointer; color: blue;"
											onclick="movePage(${status.current})">${status.current}</span>&nbsp;

									</c:otherwise>
								</c:choose>
							</c:forEach>
							&nbsp;&nbsp;<c:if test="${requestScope.searchPaging.nextPage==1}"><span
									class="sizeUpBtn"
									onclick="movePage(${requestScope.searchPaging.startPage+10})">></span>
								&nbsp;&nbsp;<span class="sizeUpBtn"
									onclick="movePage(${requestScope.searchPaging.lastPage})">>></span>
							</c:if><br>
						</div>
						<div>
							<input type="number" id="movingPageNum" style="width: 30px"> 페이지로
							<button type="button" onclick="movingPageNum()" class="btn-secondary btn-sm"
								style="width: 50px">이동</button> / 총 ${requestScope.searchPaging.lastPage}
							페이지
						</div>
					</td>
				</tr>
			</tfoot>
		</table>
	</main>
	<br><br><br>
	<jsp:include page="../common/footer.jsp" />
</body>

</html>