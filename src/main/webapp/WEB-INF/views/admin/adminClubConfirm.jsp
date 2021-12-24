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
		.club{
		width: 1000px;
		}
		.club th{
		    background-color:  rgba(166, 219, 240, 0.233);
		}
		.club td , .club th{
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
		
		var lastPage = parseInt("${requestScope.noticePaging.lastPage}")
		$(function() {
			var loginUserId = "${sessionScope.loginUser.userId}"
			if(loginUserId!='admin'){
				alert("잘못된 접근입니다.")
				location.href = '${pageContext.servletContext.contextPath }/';
			}
		})
		
		//페이지 번호 클릭 이동시
		function movePage(nowPage) {
			$('#nowPage').val(nowPage);
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
		
		//모임 이름 키워드를 입력후 검색 버튼을 클릭시
		function changeSearch() {
			
			$('#searchKeyword').val($('#keywordInput').val());
			movePage(1);
		}
		
		//모임 승인이나 반려 버튼을 클릭시
		function clubConfirm(clubNo,status) {
			
			if(status==1){
				
				if(!confirm("선택하신 독서모임을 정말 승인 하시겠습니까?")){
					return false
				}
			}else{
				if(!confirm("선택하신 독서모임을 정말 반려 하시겠습니까?")){
					return false
				}
			}
			
			$('#clubNo').val(clubNo)
			$('#confirmStatus').val(status)
			$('#updateClubConfirmForm').submit()
		}
	
	</script>
</head>

<body>
<jsp:include page="../common/menubar.jsp" />
	<main class="site-main" style="padding-top: 180px">
		<div style="display: flex;width: 1200px; ">
			<jsp:include page="../admin/adminLeftMenu.jsp" />							
			<form action="selectClubConfirmList.cl" method="post" id="pageMoveForm">
				<input type="hidden" id="searchKeyword" name="searchKeyword" value="${requestScope.keyword}">
				<input type="hidden" id="nowPage" name="nowPage" value="${requestScope.nowPage}">
			</form>
			<form action="updateClubConfirm.cl" method="post" id="updateClubConfirmForm">
				<input type="hidden" id="clubNo" name="clubNo">
				<input type="hidden" id="confirmStatus" name="confirmStatus">
			</form>
			<div style="margin-left: auto;margin-right: auto; width: 900px;">
				<br><br><br>				
				
				<span style="font-size: 30px; font-weight: bold;">독서모임승인</span>
				<hr>
				<div style="display: flex;">
					<div style="margin-left: auto;">모임 이름으로 검색 : 
						<input type="text" id="keywordInput"><button type="button" onclick="changeSearch()"  class="btn-secondary btn-sm" >검색</button>
					</div>
				</div>
				
					
				 <table class="table table-hover club">
		            <thead>
			            <tr>          
			            	<th style="width: 180px">모임 대표 이미지</th> 
			                <th style="width: ">모임 명</th>
			                <th style="width: 150px ">호스트 명</th>
			                <th style="width: 120px">온/오프라인</th>
			                <th style="width: 70">정원</th>
			                <th style="width: 120px">모집 일정</th>
			                <th style="width: 100px">승인여부</th>
		                </tr>
		            </thead>
		            <tbody>
		            	<c:forEach items="${requestScope.selectClubConfirmList}" var="list" varStatus="status">
			                <tr id="">
			                    <td>
			                   	 <img src="${pageContext.servletContext.contextPath }/resources/upload_files/club_img/${list.titleChangeName}" style="width: 150px;height: auto;">
			                    </td>
			                    <td style="text-align: left; padding-left: 10px"><span style="font-weight: bold; cursor: pointer;"><a href="detail.cl?clubNo=${list.clubNo}" target='_blank'>${list.clubTitle}</a></span></td>
			                    <td>${list.hostName}</td>
			                    <td>${list.onoffLine}</td>
			                    <td>${list.clubCapacity}</td>
			                    <td>${list.clubStartDate}<br>~<br>${list.clubEndDate}</td>
			                    <td>
				                    <button type="button" onclick="clubConfirm(${list.clubNo},1)" class="btn-secondary btn-sm">승인</button><br><br>
				                    <button type="button" onclick="clubConfirm(${list.clubNo},0)" class="btn-secondary btn-sm">반려</button>
			                    </td>
			                   
			                </tr>
		                </c:forEach> 	
		            </tbody>
		            <tfoot>
		           
		                <tr>
		
					        <td colspan="6" style="text-align: center;" id="pageNumber">
					        	<div style="margin : 10px">
							        <c:if test="${requestScope.clubPaging.prePage==1}">
								        <span class="sizeUpBtn"  onclick="movePage(1)"><<</span>&nbsp;&nbsp;
								        <span class="sizeUpBtn"  onclick="movePage(${requestScope.clubPaging.startPage-10})"><</span>
								    </c:if>&nbsp;&nbsp;
									<c:forEach begin="${requestScope.clubPaging.startPage}" end="${requestScope.clubPaging.endPage}" varStatus="status">
										<c:choose>
											<c:when test="${status.current==requestScope.clubPaging.nowPage}">
											&nbsp;${status.current}&nbsp;
												</c:when>
											<c:otherwise>
												&nbsp;<span style="cursor: pointer; color: blue;" onclick="movePage(${status.current})">${status.current}</span>&nbsp;										
											</c:otherwise>
										</c:choose>
									</c:forEach>
									&nbsp;&nbsp;<c:if test="${requestScope.clubPaging.nextPage==1}"><span class="sizeUpBtn" onclick="movePage(${requestScope.clubPaging.startPage+10})">></span>
										&nbsp;&nbsp;<span class="sizeUpBtn"  onclick="movePage(${requestScope.clubPaging.lastPage})">>></span>
									</c:if><br>
								</div>
								<div>
									<input type="number" id="movingPageNum" style="width: 30px"> 페이지로 
									<button type="button" onclick="movingPageNum()" class="btn-secondary btn-sm" style="width: 50px">이동</button> / 총 ${requestScope.clubPaging.lastPage} 페이지
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