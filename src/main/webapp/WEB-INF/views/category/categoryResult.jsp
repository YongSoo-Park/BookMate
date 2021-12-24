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
	<title>카테고리</title>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
	
	
	
	<style>
		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
		    -webkit-appearance: none;
		}
		#categoryTable{
		    width: 1200px;
		    
		}
		#categoryTable td{
		    vertical-align: middle;
		    align-items: center;
		    text-align: center;
		}
		#pageNumber{
		text-align: center;
		margin-top: 10px;
		}
		#pageNumber span{
		cursor: pointer;
		}
		.centerTd{
		    text-align: center;
		}
		#categoryTable th{
		    background-color: rgba(166, 219, 240, 0.233);
		}
		.sizeUpBtn{
		font-size: 20px;
		} 
		.changeKindSpan{
		font-size: 20px;
		margin: 20px;
		cursor: pointer;
		}
		.moveDetailEle{
		cursor: pointer;
		}
	</style>
	
	<script type="text/javascript">
	
		//페이지 이동 숫자 직접입력시 입력 제한을 위한 마지막 페이지 숫자
		var lastPage = parseInt("${requestScope.categoryPaging.lastPage}")
		
		//페이지 숫자를 클릭했을때 클릭 숫자를 가져와서 페이지 이동
		function movePage(categoryNowPage) {
			$('#categoryNowPageInput').val(categoryNowPage);
			$('#pageMoveForm').submit();
		}
		
		//페이지 이동 숫자를 직접 입력시 잘못된 입력을 방지후 페이지 이동
		function movingPageNum() {
			var movingPageNum = parseInt($('#movingPageNum').val())
			if(movingPageNum >= 1 & movingPageNum <= lastPage){
				movePage(movingPageNum);
			}else{
				alert('이동 페이지는 1과 '+lastPage+'페이지 사이로 입력해 주세요')
			}
			
		}
		
		
		function changeKind(categoryKind) {
			$('#categoryKindInput').val(categoryKind);
			movePage(1);
		}
		
		//카테고리 변경시
		function changeCategory(category) {
			$('#categoryInput').val(category);
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
	
	<main class="site-main" style="padding-top: 180px">

	<form action="selectCategory.ca" method="post" id="pageMoveForm">
		<input type="hidden" id="categoryNowPageInput" name="categoryNowPage" value="${requestScope.categoryNowPage}">
		<input type="hidden" id="categoryKindInput" name="categoryKind" value="${requestScope.categoryKind}">
		<input type="hidden" id="categoryInput" name="category" value="${requestScope.category}">
	</form>
	<form action="selectBook.book" method="post" id="moveDetailForm">
		<input type="hidden" id="moveDetailInput" name="bookISBN">
	</form>
	
	
	<c:set var="array">소설/시/에세이, 경제/경영, 과학, 인문, 컴퓨터/IT, 자기계발, 정치/사회, 역사/문화, 취미, 가정/육아,국내도서 전체,temp,eBook 전체</c:set>
	  <table id="categoryTable" class="table" >
        <thead>
            <tr>
                 <th colspan="5" style="height: 100px; vertical-align: middle; font-size: 35px; ">
                	  <c:forEach items="${array}" var="categoryName" varStatus="status">
                	  	<c:if test="${requestScope.category==status.index}">${categoryName}</c:if>
                	  </c:forEach><span style="font-size: 20px">카테고리</span>
                </th>
            </tr>
            <tr>
            	<td colspan="3" style="text-align: left; padding-left: 50px;padding-bottom: 70px;padding-top: 30px">
                     <select onchange="changeCategory(this.value)">
                	    <option value="0">카테고리 선택</option>
                		<option value="0">소설/시/에세이</option>
                		<option value="1">경제/경영</option>
                		<option value="2">과학</option>
                		<option value="3">인문</option>
                		<option value="4">컴퓨터/IT</option>
                		<option value="5">자기계발</option>
                		<option value="6">정치/사회</option>
                		<option value="7">역사/문화</option>
                		<option value="8">취미</option>
                		<option value="9">가정/육아</option>
                		<option value="10">국내도서 전체</option>
                		<option value="12">eBook 전체</option>
                	</select>
                </td>
          
                <td colspan="2" style="text-align: right; padding-right: 50px;padding-top: 70px;padding-bottom: 30px">
               
                	<select onchange="changeKind(this.value)">
                	    <option value="1">원하시는 정렬방법을 선택하세요</option>
                		<option value="1">신간도서</option>
                		<option value="2">판매량</option>
                		<option value="3">도서명</option>
                		<option value="4">높은평점</option>
                		<option value="5">높은가격</option>
                		<option value="6">낮은가격</option>
                	</select>
                </td>
            </tr>
        </thead>
        <tbody>
            <tr>
            	<c:forEach items="${requestScope.categoryList}" var="list" varStatus="status">
                <td>
                    <div class="categoryItemDiv">
                        <img src="${pageContext.servletContext.contextPath }/resources/images/book_img/${list.bookMainImg}" alt="" style="width: 180px; height: 255px; cursor: pointer;" onclick="moveDetail('${list.bookISBN}')"><br>
                        <span id="bookTitleSpan" style="font-size: 20px; font-weight: bold; color: dodgerblue; cursor: pointer;" onclick="moveDetail('${list.bookISBN}')">${list.bookTitle}</span><br><br>
                        <span style="font-size: 14px;" id="bookWriterSpan">${list.bookWriter} 지음</span>  | <span id="bookPublisherSpan" style="font-size: 14px;">${list.bookPublisher}</span><br>
                        <span id="bookSalePriceSpan"  style="color: red; font-weight: bold;"><fmt:formatNumber value="${list.bookPrice*0.9}"/>원</span> [10%↓] | <span id="bookPriceSpan" style="font-size: 14px;"><fmt:formatNumber value="${list.bookPrice*0.02}"/> Pt적립</span>
                    </div> 

                </td>
                <c:if test="${status.count%5==0}">
                </tr>
                <tr>
                </c:if>
                </c:forEach>  
               
            </tr>
           
            
        </tbody>
        <tfoot>
        	<tr>
		        <td colspan="5" id="pageNumber">
			        <div style="margin : 10px">
				        <c:if test="${requestScope.categoryPaging.prePage==1}">
					        <span class="sizeUpBtn"  onclick="movePage(1)"><<</span>&nbsp;&nbsp;
					        <span class="sizeUpBtn"  onclick="movePage(${requestScope.categoryPaging.startPage-10})"><</span></c:if>&nbsp;&nbsp;
						<c:forEach begin="${requestScope.categoryPaging.startPage}" end="${requestScope.categoryPaging.endPage}" varStatus="status">
							<c:choose>
								<c:when test="${status.current==requestScope.categoryPaging.nowPage}">
									&nbsp;${status.current}&nbsp;
								</c:when>
								<c:otherwise>
									&nbsp;<span style="cursor: pointer; color: blue;" onclick="movePage(${status.current})">${status.current}</span>&nbsp;
							
								</c:otherwise>
							</c:choose>
						</c:forEach>
						&nbsp;&nbsp;<c:if test="${requestScope.categoryPaging.nextPage==1}"><span class="sizeUpBtn" onclick="movePage(${requestScope.categoryPaging.startPage+10})">></span>
							&nbsp;&nbsp;<span class="sizeUpBtn"  onclick="movePage(${requestScope.categoryPaging.lastPage})">>></span>
						</c:if>
						<br>
					</div>
					<div>
						<input type="number" id="movingPageNum" style="width: 30px"> 페이지로 
						<button type="button" onclick="movingPageNum()" class="btn-secondary btn-sm" style="width: 50px">이동</button> / 총 ${requestScope.categoryPaging.lastPage} 페이지
					</div>
		        </td>
       		 </tr>
        </tfoot>
    </table>	
        	
	</main>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>