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
		.users{
		width: 1000px;
		}
		.users th{
		    background-color:  rgba(166, 219, 240, 0.233);
		}
		.users td , .users th{
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
	
		var lastPage = parseInt("${requestScope.A_BUserListPaging.lastPage}")
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
		
		//검색 종류 선택후 키워드 입력시
		function changeSearch() {
			
			var searchKind = $('input[name=checkSearchKind]:checked').val()
			$('#searchKeyword').val($('#keywordInput').val());
			$('#searchKind').val(searchKind);
			movePage(1);
		}
		
		//정지회원 정지해제 버튼 클릭시
		function userRestore(user_Id){
			if(confirm("주의! 회원 자격을 변동하는 중입니다!")){
				if(confirm("정말 "+user_Id+" 회원의 자격정지를 해제 하시겠습니까?")){
					$('#user_Id').val(user_Id);
					$('#updateUserRestoreForm').submit();
				}
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
			
				<form action="selectBannedUser.ad" method="post" id="pageMoveForm">
					<input type="hidden" id="searchKeyword" name="searchKeyword" value="${requestScope.searchKeyword}">
					<input type="hidden" id="searchKind" name="searchKind" value="${requestScope.searchKind}">
					<input type="hidden" id="nowPage" name="nowPage" value="${requestScope.nowPage}">
				</form>
				<form action="updateUserRestore.ad" method="post" id="updateUserRestoreForm">
					<input type="hidden" name="user_Id" id="user_Id">
				</form>
				<span style="font-size: 30px; font-weight: bold;">정지 회원 리스트</span>
				<hr>
				<div style="display: flex;">
					<div style="margin-left: auto;"><input type="radio" name="checkSearchKind" value="1" checked="checked"> ID로 검색  <input type="radio" name="checkSearchKind" value="2"> 판매 닉네임으로 검색
						<input type="text" id="keywordInput"><button type="button" onclick="changeSearch()"  class="btn-secondary btn-sm" >검색</button>
					</div>
				</div>
			
				<table class="table table-hover users">
		            <thead>
			            <tr>           
			                 <th style="width: 100px">ID</th>
			                <th style="width: 100px">이름</th>
			                <th style="width: 250px">E-mail</th>
			                <th style="width: 120px">가입일</th>
			                <th style="width: 110px">판매자여부</th>
			                <th style="width: 120px">판매 닉네임</th>
			                <th>정지해제</th>
		                </tr>
		            </thead>
		            <tbody>
		            	<c:forEach items="${requestScope.bannedUserList}" var="list" varStatus="status">
			                <tr>
			                    <td>${list.user_Id}</td>
			                    <td>${list.user_Name}</td>
			                    <td>${list.email}</td>
			                    <td><fmt:formatDate value="${list.enroll}" pattern="yyyy-MM-dd"/></td>
			                    <td>
				                    <c:choose>
					                    <c:when test="${list.status eq 'Y'}">
					                    Y
					                    </c:when>
					                    <c:otherwise>
					                    N
					                    </c:otherwise>
				                    </c:choose>                   
				                </td>
				                <td>
				                    <c:choose>
					                    <c:when test="${list.status eq 'Y'}">
					                    ${list.seller_Nickn}
					                    </c:when>
					                    <c:otherwise>
					                    - 
					                    </c:otherwise>
				                    </c:choose> 
			                    </td>
			                    <td>
			                   	 <button type="button" class="btn btn-secondary btn-sm" onclick="userRestore('${list.user_Id}')">정지해제</button>
			                    </td>
			               </tr>
		               </c:forEach> 	
		               <c:if test="${empty requestScope.bannedUserList}">
		               <tr><td colspan="6" style="padding: 100px;"><span style="font-size: 25px;font-weight: bold;">자격 정지중인 회원이 없습니다.</span></td></tr>
		               </c:if>
		            </tbody>
		            <tfoot>
		           
		                <tr>
		
				        <td colspan="6" style="text-align: center;" id="pageNumber">
					        <div style="margin : 10px">
						        <c:if test="${requestScope.A_BUserListPaging.prePage==1}">
						        <span class="sizeUpBtn"  onclick="movePage(1)"><<</span>&nbsp;&nbsp;
						        <span class="sizeUpBtn"  onclick="movePage(${requestScope.A_BUserListPaging.startPage-10})"><</span></c:if>&nbsp;&nbsp;
								<c:forEach begin="${requestScope.A_BUserListPaging.startPage}" end="${requestScope.A_BUserListPaging.endPage}" varStatus="status">
									<c:choose>
										<c:when test="${status.current==requestScope.A_BUserListPaging.nowPage}">
											&nbsp;${status.current}&nbsp;
										</c:when>
										<c:otherwise>
											&nbsp;<span style="cursor: pointer; color: blue;" onclick="movePage(${status.current})">${status.current}</span>&nbsp;									
										</c:otherwise>
									</c:choose>
								</c:forEach>
								&nbsp;&nbsp;<c:if test="${requestScope.A_BUserListPaging.nextPage==1}"><span class="sizeUpBtn" onclick="movePage(${requestScope.A_BUserListPaging.startPage+10})">></span>
									&nbsp;&nbsp;<span class="sizeUpBtn"  onclick="movePage(${requestScope.A_BUserListPaging.lastPage})">>></span>
								</c:if><br>
							</div>
							<div>
								<input type="number" id="movingPageNum" style="width: 30px"> 페이지로 
								<button type="button" onclick="movingPageNum()" class="btn-secondary btn-sm" style="width: 50px">이동</button> / 총 ${requestScope.A_BUserListPaging.lastPage} 페이지
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