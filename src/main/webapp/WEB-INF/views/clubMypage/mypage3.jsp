<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>독서모임 - 마이페이지</title>
    <link rel="icon" href="resources/img/logo1.png" type="image/png">
    <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="resources/vendors/linericon/style.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/vendors/nice-select/nice-select.css">
    <link rel="stylesheet" href="resources/vendors/nouislider/nouislider.min.css">

    <link rel="stylesheet" href="resources/css/style.css">

    <style>
        .menus {
            color: black;
        }
        
        .box1 {
            width: 100%;
            float: left;
            /* display: inherit; */
        }
        
        .box2 {
            float: right;
        }
        
        .all {
            display: flex;
            margin-bottom: 50px;
        }
        
        .bottom1 {
            width: 70%;
        }
        
        .bottom2 {
            width: 100%;
            text-align: right;
        }
        
        .clubTitle{
        	cursor:pointer;
        }
    </style>
</head>

<body style="width:1200px; margin:auto;  padding-top: 140px;">

     <jsp:include page="../common/menubar.jsp" />
    
    <script>
    	
        //선택한 독서모임 multiple 삭제하기
        function deleteClub(){
           	var deleteC = confirm("독서모임을 삭제하시겠습니까?");
            if(deleteC){
                if($("input:checkBox[name=clubNo]:checked").length == 0){
                    alert("삭제할 독서모임을 선택해주세요!!");
                }else{
                    $("#mypageForm3").attr("action", "deleteClub3.cl");
                }
            }
        }
        
      //새로운 독서모임 개설하기 - 기존 리스트 없을때 & 있을때
        function newClub(){
        	var insertC = confirm("독서모임을 개설하시겠습니까?");
        	if(insertC){
            	location.href="insertForm1.cl";
        	}
        }
                        	
        //독서모임 수정하기
        function updateClub(){
            if($("input:checkBox[name=clubNo]:checked").length == 0){
                alert("수정할 독서모임을 선택해주세요!!");
            }else if($("input:checkBox[name=clubNo]:checked").length > 1){
                alert("수정할 독서모임은 한 개만 선택해 주세요")
            }else{
            	var index = $("input:checkBox[name=clubNo]:checked").attr('id').slice(-1);
            	var condition = $("#condition"+index).val();
            	if(condition <= 3){
            		$("#mypageForm3").attr("action", "updateForm3_1.cl").submit();
            	}else{
            		alert("독서모임이 모집중이거나 모집이 끝난 후에는 수정할 수 없습니다.");	
            	}
            }
        } 
            
        function goDetail(clubNo, condition){
            if(condition >= 4){
            	location.href="detail.cl?clubNo=" + clubNo;
            }else{
            	alert("개설 신청을 마무리해주세요.")
            }
        }
            
        function checkApply(clubNo){ 
        	console.log(clubNo)
        	$('#clNo1').val(clubNo);
        	$('#selectApplyForm').submit();
        }
   </script>
    
    <!-- ================ category section start ================= -->
    <section class="section-margin--small mb-5" style="margin-top: 50px;">
        <jsp:include page="../club/clubMenubar.jsp"/>
        
        <div class="container">
            <div class="row" style="padding-top: 30px; justify-content: center;">
                <h3 style="font-size: 30px; ">  내 독서모임 관리</h3>
            </div>

			<div class="row">  
                <div class="col-xl-12 col-lg-12 col-md-12">
                
				<c:if test="${fn:length(list) <= 0}">
					<div class="bottom2" style="margin-top: 15px;">
                        <button class="button button-login" onclick="newClub()">독서모임 개설</button>
                    </div>
                    
					<div style="padding: 200px; font-size: 22px; font-weight: 600; text-align: center;">개설한 독서모임이 없습니다.</div>
				</c:if>
			
				<c:if test="${fn:length(list) > 0}">
				<section>
					 	<form id="mypageForm3" action="" method="post"> 
	                        <div style="float: right;">
	                            <button class="button button-login" style="margin-bottom: 20px;" onclick="updateClub()">수정하기</button>
	                            <button class="button button-login" style="margin-bottom: 20px;" onclick="deleteClub()">삭제하기</button>
	                        </div>
	
	                        <table id="applyList" class="table table-hover" style="text-align: center;">
	                            <thead>
	                                <tr style="background-color: #d1e7d1; font-size: 16px;">
	                                    <th style="width:5%;">선택</th>
	                                    <th style="width:10%;">카테고리</th>
	                                    <th style="width:10%;">호스트명</th>
	                                    <th style="width:25%;">독서모임명</th>
	                                    <th style="width:10%;">온/오프라인</th>
	                                    <th style="width:17%;">날짜</th>
	                                    <!-- <th>신청인원/정원</th> -->
	                                    <th style="width:10%;">상태</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                            	<c:forEach items="${list}" var="c" varStatus="status">
		                                <tr>
		                                    <td><input id="clubNo${status.index}" name="clubNo" type="checkBox" value="${c.clubNo}"></td>
		                                    <td><c:out value="${c.category}"/></td>
		                                    <td><c:out value="${c.hostName}"/></td>
		                                    <td><span class="clubTitle" onclick="goDetail(${c.clubNo}, ${c.condition});">${c.clubTitle}</span>
		                                    	<p>(모집기간 : <c:out value="${c.clubStartDate}"/> ~ <c:out value="${c.clubEndDate}"/>)</p>
		                                    </td>
		                                    <td>
		                                    	<c:out value="${c.onoffLine}"/>
		                                    	<input type="hidden" id="condition${status.index}" value="${c.condition}">
		                                    </td>   
		                                    <td>
		                                    	<input name="clNo1" type="hidden" value="${c.clubNo}">
			                                    <c:forEach items="${c.clubTimes}" var="ct">
			                                    	<c:if test="${ !empty ct.clubDate}">
			                                    		${fn:substring(ct.clubDate,0,11)} | ${ct.startTime} ~ ${ct.endTime}<br>
			                                    	</c:if>
			                                    	<c:if test="${ empty ct.clubDate}">
			                                    		${ct.clubDate} | ${ct.startTime} ~ ${ct.endTime}<br>
			                                    	</c:if>
				                                </c:forEach>
			                                </td>
		                                    <c:choose>
		                                    	<c:when test="${c.condition eq 1}">
		                                    		<td>임시저장</td>
		                                    	</c:when>
		                                    	<c:when test="${c.condition eq 2}">
		                                    		<td>검수 중</td>
		                                    	</c:when>
		                                    	<c:when test="${c.condition eq 3}">
		                                    		<td>반려</td>
		                                    	</c:when>
		                                    	<c:when test="${c.condition eq 4}"> <!-- 날짜 따라서 "검수완료"/ "모집중" 으로 나눠야 함 -->
		                                    		
		                                    		<c:set var="now" value="<%=new java.util.Date()%>"/>
		                                    		
		                                    		<fmt:formatDate var="clubDate" value="${c.clubStartDate}" pattern="yyyy-MM-dd"/>
		                                    		<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
	
		                                    		<c:if test="${today>=clubDate}">  <!-- 현재날짜(11.05) >= 모집시작일(11.01)-->
		                                    			<td>모집 중 <input type="button" onclick="checkApply('${c.clubNo}')" value="신청인원 확인"> </td>
		                                    		</c:if>
		                                    		<c:if test="${today<clubDate}">   <!-- 현재날짜(11.05) >= 모집시작일(11.22) : 모집중인 상태는 아니다-->
		                                    			<td>검수완료</td>
		                                    		</c:if>
		                                    	</c:when>
		                                    	<c:when test="${c.condition eq 5}">
		                                    		<td>마감 <input type="button" onclick="checkApply('${c.clubNo}')" value="신청인원 확인"> </td>
		                                    	</c:when>
		                                    	<c:when test="${c.condition eq 6}">
		                                    		<td>모임종료 <input type="button" onclick="checkApply('${c.clubNo}')" value="신청인원 확인"> </td>
		                                    	</c:when>
		                                    </c:choose>
		                                </tr>
	                                </c:forEach>
	                            </tbody>
	                        </table>
						</form>
						
						<!-- 종류별 독서모임 보기 & 페이징바 -->

                        <div class="all" style="width: 100%;">
                            <!-- <div class="all  bottom1" style="width: 70%;">
                                <div class="sorting">
                                    <select>
                                         <option value="1">독서모임명</option>
                                         <option value="1">상태</option>
                                    </select>
                                </div>
                                <div>
                                    <div class="input-group filter-bar-search">
                                        <input type="text" placeholder="Search">
                                        <div class="input-group-append">
                                            <button type="button"><i class="ti-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div> -->
                            <div class="bottom2">
                                <button class="button button-login" onclick="newClub()">독서모임 개설</button>
                            </div>
                        </div>
	
							<div id="pagingArea">						
				                <ul class="pagination" style="justify-content: center; margin-top: 50px;">
				                	<c:choose>
				                		<c:when test="${ pi.currentPage ne 1 }">
				                			<li class="page-item"><a class="page-link" href="mypage3.cl?currentPage=${ pi.currentPage-1 }">이전</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item disabled"><a class="page-link" href="">이전</a></li>
				                		</c:otherwise>
				                	</c:choose>
				                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
				                    	<c:choose>
					                		<c:when test="${ pi.currentPage ne p }">
				                    			<li class="page-item"><a class="page-link" href="mypage3.cl?currentPage=${ p }">${ p }</a></li>
					                		</c:when>
					                		<c:otherwise>
					                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
					                		</c:otherwise>
					                	</c:choose>
				                    </c:forEach>  
				                    <c:choose>
				                		<c:when test="${ pi.currentPage ne pi.maxPage }">
				                			<li class="page-item"><a class="page-link" href="mypage3.cl?currentPage=${ pi.currentPage+1 }">다음</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item disabled"><a class="page-link" href="mypage3.cl?currentPage=${ pi.currentPage+1 }">다음</a></li>
				                		</c:otherwise>
				                	</c:choose>
				                </ul>
				            </div>
	                    </section>
					</c:if>
					 
                </div>
            </div>
        </div>
    </section>
    
    <form action="selectApply.cl" method="post" id="selectApplyForm">
		<input type="hidden" name="clNo1" id="clNo1">
	</form>

	<jsp:include page="../common/footer.jsp" />

    <script src="resources/vendors/jquery/jquery-3.2.1.min.js"></script>
    <script src="resources/vendors/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="resources/vendors/skrollr.min.js"></script>
    <script src="resources/vendors/owl-carousel/owl.carousel.min.js"></script>
    <script src="resources/vendors/nice-select/jquery.nice-select.min.js"></script>
    <script src="resources/vendors/nouislider/nouislider.min.js"></script>
    <script src="resources/vendors/jquery.ajaxchimp.min.js"></script>
    <script src="resources/vendors/mail-script.js"></script>
    <script src="resources/js/main.js"></script>
</body>

</html>