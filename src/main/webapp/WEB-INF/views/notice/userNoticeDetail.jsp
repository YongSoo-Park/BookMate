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
</head>
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
</style>

<body>
	<jsp:include page="../common/menubar.jsp" />
	<main class="site-main" style="padding-top: 180px">
	
		<div style="margin-left: auto;margin-right: auto; width: 1000px;">
		<br><br><br>
		<span style="font-size: 30px; font-weight: bold;">공지사항</span>
		<hr>
			<table class="detail">
	            <tbody>
		            <tr>
		                <th>글제목</th>
		                <td colspan="3">${requestScope.notice.noticeTitle}</td>
		            </tr>
		            <tr>
		                <th>구분</th>
		                <td><c:if test="${requestScope.notice.noticeCategory==0}">일반공지</c:if> <c:if test="${requestScope.notice.noticeCategory==1}">이벤트</c:if></td>
		                <th>작성자</th>
		                <td>관리자</td>
		            </tr>
		            <tr>
		                <th>등록일</th>
		                <td><fmt:formatDate value="${requestScope.notice.noticeDate}" pattern="yyyy-MM-dd"/> </td>
		                <th>조회수</th>
		                <td>${requestScope.notice.noticeViews}</td>
		            </tr>
		            <tr>
		                <td colspan="4">
		                <div style="text-align: center;">
		                	<c:if test="${requestScope.notice.noticeImgStatus==1}">
		                		<c:if test="${requestScope.notice.noticeCategory==0}">
		                			<img alt="" src="${pageContext.servletContext.contextPath }/resources/images/notice/${requestScope.notice.noticeImgName}">
		                		</c:if>
		                 		<c:if test="${requestScope.notice.noticeCategory==1}">
		                 			<img alt="" src="${pageContext.servletContext.contextPath }/resources/images/event/${requestScope.notice.noticeImgName}">
		                 		</c:if>
		                	</c:if>
		                </div>
		                <div>${requestScope.notice.noticeContent}</div>
		            </td>
		            </tr>
	       		</tbody>
		        <tfoot>
		            <tr>
		                <td colspan="4" style="padding-left: 20px; padding-right: 20px;">
		                
		                    <div style="display: flex;">
		
		                        <div style="margin-left: auto;"><button type="button" onclick="location.href='noticeList.no?isUser=1'"  class="btn-secondary btn-sm" >목록으로</button></div>
		                    
		                </div>
		                </td>
		
		            </tr>
		        </tfoot>
	        </table>
		
		</div>
	</main>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>