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
	    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<style>
		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
		    -webkit-appearance: none;
		}
		.stock{
		width: 1000px;
		}
		.stock th{
		    background-color:  rgba(166, 219, 240, 0.233);
		}
		.stock td , .stock th{
		text-align: center;
		}
		a:link { 
		color: black; 
		text-decoration: none;
		}
		a:visited { 
		color: black; 
		text-decoration: none;
		}
		a:hover { 
		color: blue; 
		text-decoration: none;
		}
		.leftTitle{
		font-size: 20px;
		font-weight: bold;
		}
	</style> 
	
	<script type="text/javascript">
	
		var lastPage = parseInt("${requestScope.bookStockPaging.lastPage}")
		$(function() {
			var loginUserId = "${sessionScope.loginUser.userId}"
			if(loginUserId!='admin'){
				alert("잘못된 접근입니다.")
				location.href = '${pageContext.servletContext.contextPath }/';
			}
		})
		
		//페이지 번호 클릭하여 이동시
		function movePage(nowPage) {
			$('#nowPage').val(nowPage);
			$('#pageMoveForm').submit();
		}
		
		//페이지 직접 입력하여 이동시
		function movingPageNum() {
			var movingPageNum = parseInt($('#movingPageNum').val())
			if(movingPageNum >= 1 & movingPageNum <= lastPage){
				movePage(movingPageNum);
			}else{
				alert('이동 페이지는 1과 '+lastPage+'페이지 사이로 입력해 주세요')
			}
			
		}
		
		//ISBN 검색시 빈칸 검색 방지
		function changeSearch() {
			if(!$('#keywordInput').val()){
				alert("검색 ISBN을 입력하셔야 합니다.");
				return false;
			}
			enterStockPlus($('#keywordInput').val())
			
		}
		
		//ISBN 으로 도서 검색시	
		function enterStockPlus(bookISBN) {
			var imgPath = "${pageContext.servletContext.contextPath }/resources/images/book_img/"
			$.ajax({
				
				url  : "selectISBNStock",
				type : "post",
				data : {
					bookISBN : bookISBN
				},
				success : function(data) {
					if(data["str"]=="pass"){
						var book = data["book"];
						$('#bookISBN').val(book.bookISBN);
						$('#bookMainImg').attr('src',imgPath+book.bookMainImg);
						$('#bookTitleSpan').text(book.bookTitle);
						$('#bookWriterSpan').text(book.bookWriter);
						$('#bookPublisherSpan').text(book.bookPublisher);
						$('#bookPublisheDateSpan').text(new Date(book.bookPublisheDate).toISOString().substring(0,10));
						$('#bookStockSpan').text(book.bookStock);
					}else{
						alert("검색하신 ISBN - '"+bookISBN+"'은 잘못된 ISBN 입니다." )
					}
					
				},
				error : function(e) {
					alert("도서 불러오기중 ajax 통신 오류")
				}
				
			})
		}
		
		//도서 재고 업데이트
		function plusStock() {
			if(!$('#plusStockInput').val()){
				alert("등록 수량을 입력하셔야합니다.");
				return false;
			}
			
			$.ajax({
			
				url : "updateBookPlusStock",
				type : "post",
				data : {
					bookISBN : $('#bookISBN').val(),
					plusStock : $('#plusStockInput').val()
				},
				success : function(str) {
					alert($('#bookTitleSpan').text()+" 도서의 재고를 "+$('#plusStockInput').val()+"권 등록하였습니다.");
					$('#bookStockSpan').text(parseInt($('#bookStockSpan').text())+parseInt($('#plusStockInput').val()));
				},
				error : function(e) {
					alert("재고 수량 등록중 ajax 통신 오류")
				}
				
				
			})
			
		}
		
	</script>
</head>

<body>
<jsp:include page="../common/menubar.jsp" />
	<main class="site-main" style="padding-top: 180px">
		<div style="display: flex;width: 1200px; ">
			<jsp:include page="../admin/adminLeftMenu.jsp" />
				
						
			<form action="adminMainBookStock.st" method="post" id="pageMoveForm">
				<input type="hidden" id="nowPage" name="nowPage" value="${requestScope.nowPage}">
			</form>
			
			<div style="margin-left: auto;margin-right: auto; width: 900px;">
				<br><br><br>				
				<span style="font-size: 30px; font-weight: bold;">도서 재고 관리</span><br>
				<a href="#enterStock"><h5>검색 및 입고 ☜</h5></a>
				<hr>				
				<h5 style="font-weight: bold;">재고 위험 도서목록</h5>
				<table class="table table-hover stock">
		            <thead>
			            <tr>          
			            	<th style="width: 180px">도서 이미지</th> 
			                <th style="width: ">도서 명</th>
			                <th style="width: 120px ">작가명</th>
			                <th style="width: 110px">출판사</th>
			                <th style="width: 120px">출간일</th>
			                <th style="width: 70">재고수</th>
			                <th style="width: 100px">재고추가</th>
			            </tr>
		            </thead>
		            <tbody>
		            	<c:forEach items="${requestScope.bookStockList}" var="list" varStatus="status">
			                <tr>
			                    <td>
			                    	<img src="${pageContext.servletContext.contextPath }/resources/images/book_img/${list.bookMainImg}" style="width: 80px;height: auto;">
			                    </td>
			                    <td style="text-align: left; padding-left: 10px"><span style="font-weight: bold; cursor: pointer;"><a href="selectBook.book?bookISBN=${list.bookISBN}" target='_blank'>${list.bookTitle}</a></span></td>
			                    <td>${list.bookWriter}</td>
			                    <td>${list.bookPublisher}</td>
			                    <td><fmt:formatDate value="${list.bookPublisheDate}" pattern="yyyy-MM-dd"/></td>
			                    <td>${list.bookStock}</td>
			                    <td>
			                    	<button type="button" onclick="enterStockPlus('${list.bookISBN}')" class="btn-secondary btn-sm">재고추가</button>
			                    </td>		                   
			                </tr>
		                </c:forEach> 	
		            </tbody>
		            <tfoot>
		                <tr>
					        <td colspan="6" style="text-align: center;" id="pageNumber">
						        <div style="margin : 10px">
							        <c:if test="${requestScope.bookStockPaging.prePage==1}">
								        <span class="sizeUpBtn"  onclick="movePage(1)"><<</span>&nbsp;&nbsp;
								        <span class="sizeUpBtn"  onclick="movePage(${requestScope.bookStockPaging.startPage-10})"><</span>
							        </c:if>&nbsp;&nbsp;
									<c:forEach begin="${requestScope.bookStockPaging.startPage}" end="${requestScope.bookStockPaging.endPage}" varStatus="status">
										<c:choose>
											<c:when test="${status.current==requestScope.bookStockPaging.nowPage}">
												&nbsp;${status.current}&nbsp;
											</c:when>
											<c:otherwise>
												&nbsp;<span style="cursor: pointer; color: blue;" onclick="movePage(${status.current})">${status.current}</span>&nbsp;
											</c:otherwise>
										</c:choose>
									</c:forEach>
									&nbsp;&nbsp;<c:if test="${requestScope.bookStockPaging.nextPage==1}">
										<span class="sizeUpBtn" onclick="movePage(${requestScope.bookStockPaging.startPage+10})">></span>
										&nbsp;&nbsp;<span class="sizeUpBtn"  onclick="movePage(${requestScope.bookStockPaging.lastPage})">>></span>
									</c:if><br>
								</div>
								<div>
									<input type="number" id="movingPageNum" style="width: 30px"> 페이지로 
									<button type="button" onclick="movingPageNum()" class="btn-secondary btn-sm" style="width: 50px">이동</button> / 총 ${requestScope.bookStockPaging.lastPage} 페이지
								</div>
					        </td>
			       		 </tr>
		            </tfoot>
		        </table>
		        
		        <hr><br><br><br>
		       	<h5 style="font-weight: bold;">도서 재고 입고</h5>
		       	<a id="enterStock"></a>
		        <hr>
		        <div style="display: flex;">
			        <div style="margin-left: auto;">
			        	도서  ISBN으로 불러오기  : <input type="text" id="keywordInput"><button type="button" onclick="changeSearch()"  class="btn-secondary btn-sm" >검색</button>
			        </div>
		        </div><br>
		        <table class="table table-hover stock">
			        <thead>
			            <tr>          
			            	<th style="width: 180px">도서 이미지</th> 
			                <th style="width: ">도서 명</th>
			                <th style="width: 120px ">작가명</th>
			                <th style="width: 110px">출판사</th>
			                <th style="width: 120px">출간일</th>
			                <th style="width: 70">재고수</th>
		                </tr>
		            </thead>
		         	<tbody>
		                <tr>
		                    <td style="width: 180px">
		                    	<img src="" style="width: 80px;height: auto;" id="bookMainImg">
		                    <input type="hidden" id="bookISBN">
		                    </td>
		                    <td style="text-align: left; padding-left: 10px"><span style="font-weight: bold; cursor: pointer;" id="bookTitleSpan">${list.bookTitle}</span></td>
		                    <td style="width: 120px "><span id="bookWriterSpan">${list.bookWriter}</span></td>
		                    <td style="width: 110px"><span id="bookPublisherSpan">${list.bookPublisher}</span></td>
		                    <td style="width: 120px"><span id="bookPublisheDateSpan"><fmt:formatDate value="${list.bookPublisheDate}" pattern="yyyy-MM-dd"/></span></td>
		                    <td style="width: 70"><span id="bookStockSpan">${list.bookStock}</span></td>
		                    		              
		                </tr>	
		            </tbody>
		        	<tfoot>
			        	<tr>
				        	<td colspan="6">
				        	입고할 도서 수량 : <input type="number" id="plusStockInput"><button type="button" onclick="plusStock()" class="btn-secondary btn-sm" style="width: 50px">입고</button>
				        	</td>
			        	</tr>
		        	</tfoot>
		        </table>      
       		</div>
        </div>
	</main>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>