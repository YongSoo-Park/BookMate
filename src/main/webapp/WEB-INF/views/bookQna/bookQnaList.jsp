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
		.qna{
		width: 1000px;
		}
		.qna th{
		    background-color:  rgba(166, 219, 240, 0.233);
		}
		.qna td , .qna th{
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
		
		var lastPage = parseInt("${requestScope.A_QnaPaging.lastPage}")
		$(function() {
			var loginUserId = "${sessionScope.loginUser.userId}"
			if(loginUserId!='admin'){
				alert("잘못된 접근입니다.")
				location.href = '${pageContext.servletContext.contextPath }/';
			}
		})
		
		//페이지 번호 클릭 이동시
		function movePage(qnaNowPage) {
			$('#nowPage').val(qnaNowPage);
			$('#pageMoveForm').submit();
		}
		
		//페이지 번호 직접 입력 이동시
		function movingPageNum() {
			var movingPageNum = parseInt($('#movingPageNum').val())
			if(movingPageNum >= 1 & movingPageNum <= lastPage){
				movePage(movingPageNum);
			}else{
				alert('이동 페이지는 1과 '+lastPage+'페이지 사이로 입력해 주세요')
			}
			
		}
		
		//검색 옵션 선택후 키워드 입력시
		function changeSearch() {
			
			var searchKind = $('input[name=checkSearchKind]:checked').val()
			$('#searchKeyword').val($('#keywordInput').val());
			$('#searchKind').val(searchKind);
			movePage(1);
		}
		
		//1:1문의 제목 클릭시
		function qnaDetail(qnaNo) {
			$('#qnaNoInput').val(qnaNo)
			$('#moveQnaDetailForm').submit();
		}
		
		//아직 답변이 없는 문의글 확인
		function checkIsAnwer() {
			if($('#checkIsAnwer').prop('checked')){
				$('#isAnswer').val(1)
				$('#searchKeyword').val("")
				movePage(1);
			}else{
				$('#isAnswer').val(0)
				$('#searchKeyword').val("")
				movePage(1);
			}
		}
	</script>
</head>

<body>
<jsp:include page="../common/menubar.jsp" />
	<main class="site-main" style="padding-top: 180px">
		<div style="display: flex;width: 1200px; ">
		<jsp:include page="../admin/adminLeftMenu.jsp" />
			<div style="margin-left: auto;margin-right: auto; width: 900px;">
				<br><br><br>
				
				<form action="adminQnaList.qa" method="post" id="pageMoveForm">
					<input type="hidden" id="searchKeyword" name="searchKeyword" value="${requestScope.searchKeyword}">
					<input type="hidden" id="searchKind" name="searchKind" value="${requestScope.searchKind}">
					<input type="hidden" id="isAnswer" name="isAnswer" value="${requestScope.isAnswer}">
					<input type="hidden" id="nowPage" name="nowPage" value="${requestScope.nowPage}">
				</form>
				<form action="selectQnaDetail.no" id="moveQnaDetailForm" method="post">
					<input type="hidden" id="qnaNoInput" name="qnaNo" value="">
				</form>
				<span style="font-size: 30px; font-weight: bold;">도서 QnA</span>
				<hr>
				<div style="display: flex;">
					<div style="margin-right: auto;">
						<c:if test="${requestScope.isAnswer==0}">
							<input type="checkbox" name="checkIsAnwer" id="checkIsAnwer"  onchange="checkIsAnwer()">미답변 QnA
						</c:if>
						<c:if test="${requestScope.isAnswer==1}">
							<input type="checkbox" name="checkIsAnwer" id="checkIsAnwer" checked="checked"  onchange="checkIsAnwer()">미답변 QnA
						</c:if>
					</div>
					<div style="margin-left: auto;"><input type="radio" name="checkSearchKind" value="1"> 문의제목으로 검색  <input type="radio" name="checkSearchKind" value="2"> 도서제목으로 검색
						<input type="text" id="keywordInput"><button type="button" onclick="changeSearch()"  class="btn-secondary btn-sm" >검색</button>
					</div>
				</div>
				
				 <table class="table table-hover qna">
		            <thead>
			            <tr>           
			                <th style="width: 100px ">문의종류</th>
			                <th style="width: 220px">도서제목</th>
			                <th style="width: ">문의제목</th>
			                <th style="width: 100px">글쓴이</th>
			                <th style="width: 110px">등록일</th>
			                <th style="width: 60px">답변</th>
		                </tr>
		            </thead>
		            <tbody>
		            	<c:set var="array">상품, 배송, 교환, 반품/환불, 기타</c:set>
		            	<c:forEach items="${requestScope.B_QnaList}" var="list" varStatus="status">
			                <tr>
			                    <td>
				                    <c:forEach items="${array}" var="item" varStatus="arrayStatus">
				                 	   <c:if test="${arrayStatus.index==list.qnaCategory}">${item}</c:if>
				                    </c:forEach>
			                    </td>
			                    <td><a href="selectBook.book?bookISBN=${list.bookISBN}">${list.bookTitle}</a></td>
			                    <td style="text-align: left; padding-left: 10px"><span style="font-weight: bold; cursor: pointer;" onclick="qnaDetail(${list.qnaNo})">${list.qnaTitle}</span></td>
			                    <td>${list.user_Id}</td>
			                    <td><fmt:formatDate value="${list.qnaDate}" pattern="yyyy-MM-dd"/></td>
			                    <td>
			                    <c:if test="${list.qnaAnswer==0}">
									N
								</c:if>
								<c:if test="${list.qnaAnswer==1}">
									Y
								</c:if>
			                    </td>
			                </tr>
		                </c:forEach> 	
		            </tbody>
		            <tfoot>
		           
		                <tr>
		
				        <td colspan="6" style="text-align: center;" id="pageNumber">
				        <div style="margin : 10px">
					        <c:if test="${requestScope.A_QnaPaging.prePage==1}">
					        <span class="sizeUpBtn"  onclick="movePage(1)"><<</span>&nbsp;&nbsp;
					        <span class="sizeUpBtn"  onclick="movePage(${requestScope.A_QnaPaging.startPage-10})"><</span></c:if>&nbsp;&nbsp;
							<c:forEach begin="${requestScope.A_QnaPaging.startPage}" end="${requestScope.A_QnaPaging.endPage}" varStatus="status">
							<c:choose>
							<c:when test="${status.current==requestScope.A_QnaPaging.nowPage}">
							&nbsp;${status.current}&nbsp;
							</c:when>
							<c:otherwise>
							&nbsp;<span style="cursor: pointer; color: blue;" onclick="movePage(${status.current})">${status.current}</span>&nbsp;
						
							</c:otherwise>
							</c:choose>
							</c:forEach>
							&nbsp;&nbsp;<c:if test="${requestScope.A_QnaPaging.nextPage==1}"><span class="sizeUpBtn" onclick="movePage(${requestScope.A_QnaPaging.startPage+10})">></span>
							&nbsp;&nbsp;<span class="sizeUpBtn"  onclick="movePage(${requestScope.A_QnaPaging.lastPage})">>></span>
							</c:if><br></div>
							<div>
							<input type="number" id="movingPageNum" style="width: 30px"> 페이지로 
							<button type="button" onclick="movingPageNum()" class="btn-secondary btn-sm" style="width: 50px">이동</button> / 총 ${requestScope.A_QnaPaging.lastPage} 페이지
							</div>
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