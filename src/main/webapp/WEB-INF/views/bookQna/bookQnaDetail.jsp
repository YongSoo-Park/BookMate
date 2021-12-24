<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
	<title>Insert title here</title>
	<style>
		.detail{
		    border: 1px solid;
		    width: 1000px;
		}
		.detail td,.detail th{
		border: 1px solid black;
		height: 50px;
		}
		.detail th{
		width: 15%;
		background-color: rgb(238, 176, 156);
		text-align: center;
		}
		.detail td{
		width: 35%;
		padding: 10px;
		}
		.detail input, .detail textarea{     
		    outline: none;
		    border: 1px;
		    resize: none;
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
		$(function() {
			var loginUserId = "${sessionScope.loginUser.userId}"
			if(loginUserId!='admin'){
				alert("잘못된 접근입니다.")
				location.href = '${pageContext.servletContext.contextPath }/';
			}
		})
		//삭제 버튼 클릭시
		function deleteAnswer(qnaNo) {
			if(confirm("정말로 QnA 답변을 삭제 하시겠습니까?")){
			location.href='deleteQnaAnswer.qa?qnaNo='+qnaNo
			}
		}
		//목록가기 클릭시
		function goBack() {
			history.back();
		}
	</script>
</head>


<body>
	<jsp:include page="../common/menubar.jsp" />
	<main class="site-main" style="padding-top: 180px">
		<div style="display: flex;width: 1200px;">
			<jsp:include page="../admin/adminLeftMenu.jsp" />
			<div style="margin-left: auto;margin-right: auto; width: 900px;">
				<br><br><br>
				<span style="font-size: 30px; font-weight: bold;">도서 QnA</span>
				<hr>
				<c:set var="array">상품, 배송, 교환, 반품/환불, 기타</c:set>
				<table class="detail">
			    	<tbody>
			            <tr>
			                <th>글제목</th>
			                <td colspan="3" style="font-weight: bold;">${requestScope.qnaDetail.qnaTitle}</td>
			            </tr>
			             <tr>
			                <th>도서제목</th>
			                <td colspan="3">${requestScope.qnaDetail.bookTitle}</td>
			            </tr>
			            <tr>
			                <th>구분</th>
			                <td>
			                <c:forEach items="${array}" var="item" varStatus="status">
			                <c:if test="${requestScope.qnaDetail.qnaCategory==status.index}">${item}</c:if>
			                </c:forEach>
			                </td>
			                <th>작성자</th>
			                <td>관리자</td>
			            </tr>
			            <tr>
			                <th>등록일</th>
			                <td><fmt:formatDate value="${requestScope.qnaDetail.qnaDate}" pattern="yyyy-MM-dd"/> </td>
			                <th>답변여부</th>
			                <td>${requestScope.qnaDetail.qnaAnswer}</td>
			            </tr>
			            <tr>
			                <td colspan="4">
			              <img src="${pageContext.servletContext.contextPath }/resources/img/qnaq.png" style="width:44px; height: 32px" id="qnaQImg" class="qnaImg"><br>
			              
			                <div>${requestScope.qnaDetail.qnaContent}</div>
			            </td>
			            </tr>
			            <c:if test="${requestScope.qnaDetail.qnaAnswer==1}">
			            <tr>
			            
			                <td colspan="4">
			               <img src="${pageContext.servletContext.contextPath }/resources/img/qnaa.png" style="width:44px; height: 32px" id="qnaAImg" class="qnaImg"><br>
			                <div>${requestScope.qnaAnswerDetail.qnaAnswerContent}</div>
			            </td>
			            </tr>
			            </c:if>
			        </tbody>
			        <tfoot>
			            <tr>
			                <td colspan="4" style="padding-left: 20px; padding-right: 20px;">
			                
			                    <div style="display: flex;">
				                    <c:if test="${requestScope.qnaDetail.qnaAnswer==0}">
				                        
				                        <div style="margin-right: auto;">
				                        	 <form action="intsertQnaAnswerForm.qa" method="post" style="display: inline;">
				                        	 		<input type="hidden" name="qnaNo" value="${requestScope.qnaDetail.qnaNo}">
				                        			<button type="submit"  class="btn-secondary btn-sm" >답변등록</button>
				                        	</form>
				                        </div>
				                    </c:if>
				                    
				                    <c:if test="${requestScope.qnaDetail.qnaAnswer==1}">
				                    	<div style="margin-right: auto;">
				                    		<form action="updateQnaAnswerForm.qa" method="post" style="display: inline;">
				                    			<input type="hidden" name="qnaNo" value="${requestScope.qnaDetail.qnaNo}">
				                       			 <button type="submit"  class="btn-secondary btn-sm" >답변수정</button>
				                       		</form>
				                     		<button type="button" onclick="deleteAnswer(${requestScope.qnaDetail.qnaNo})"  class="btn-secondary btn-sm" >답변삭제</button>
				                     	</div>
				                    </c:if>
			                       
			                       
				                    <c:if test="${empty requestScope.isJob}">
				                       
				                        <div style="margin-left: auto;"><button type="button" onclick="goBack()"  class="btn-secondary btn-sm" >돌아가기</button></div>
				                    </c:if>
				                    <c:if test="${requestScope.isJob==1}">
				                       
				                        <div style="margin-left: auto;"><button type="button" onclick="location.href='adminQnaList.qa'"  class="btn-secondary btn-sm" >목록으로</button></div>
				                    </c:if>
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