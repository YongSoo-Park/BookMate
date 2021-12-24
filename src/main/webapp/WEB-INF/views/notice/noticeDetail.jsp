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
		
		//공지사항 삭제 버튼 클릭시
		function deleteNotice(noticeNo) {
			if(confirm("정말로 공지사항을 삭제 하시겠습니까?")){
			location.href='deleteNotice.no?noticeNo='+noticeNo
			}
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
			                    <c:if test="${sessionScope.loginUser.userId=='admin'}">
			                    <form action="updateNoticeForm.no" method="post"><input type="hidden" name="noticeNo" value="${requestScope.notice.noticeNo}">
			                        <div style="margin-right: auto;"><button type="submit"  class="btn-secondary btn-sm" >수정</button></form><button type="button" onclick="deleteNotice(${requestScope.notice.noticeNo})"  class="btn-secondary btn-sm" >삭제</button></div></c:if>
			                        <div style="margin-left: auto;"><button type="button" onclick="location.href='noticeList.no'"  class="btn-secondary btn-sm" >목록으로</button></div>
			                    
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