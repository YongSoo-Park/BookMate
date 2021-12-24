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
            width: 30%;
            text-align: right;
        }
        
        .titleImg{
        	width: 120px;
    		height: 100px;
    		background-size: cover;
    		background-position: center;
    		margin: 0 auto;
        }
    </style>
</head>

<body style="width:1200px; margin:auto; padding-top: 140px;">

    <jsp:include page="../common/menubar.jsp" />
    
    <script>
	    
	    function deleteApply(){
	    	var deleteC = confirm("신청목록에서 삭제하시겠습니까? \n(신청취소 및 참여 여부와는 관련없이 목록에서만 삭제됩니다.)");
	        if(deleteC){
	            if($("input:checkBox[name=timeNo]:checked").length == 0){
	                alert("삭제할 신청내역을 선택해주세요!!");
	            }else{
	            	console.log("ddd")
	                $("#mypageForm1").attr("action", "deleteClub1.cl").submit();
	            }
	        }
	    }
	    
	    function goDetail(clubNo){
	    	location.href="detail.cl?clubNo=" + clubNo;            	
        }
	    
	    function cancleClub(e){
	    	var userId = "${sessionScope.loginUser.userId}";
	    	var btnId = $(e).attr('id');
	    	var index = btnId.slice(-1);
	    	var timeNo = $('#timeNo'+index).val();
	    	var times = $('#times'+index).text();
	    	
	    	console.log("btnId : " + btnId);
	    	console.log("timeNO : " + timeNo);
	    	console.log("times : " + times);

	    	$.ajax({
	        	
        		url : "updateCancel.cl",
        		data : {
        			userId : userId,
        			timeNo : timeNo,
        			times : times
        		},
        		
        		type : "post" ,
        		success : function(str) {
					//취소완료로 바꾸기
					//$(this) 로는 안된다...
					alert("취소되었습니다.");
					$(e).attr('value','취소완료');
					$(e).attr('disabled', true);

        			
				},error:function(){
					console.log("ajax 통신실패");
					alert("오류");
				}
        	}) 
	    }
    </script>

    
    <!-- ================ category section start ================= -->
    <section class="section-margin--small mb-5" style="margin-top: 50px;">
    	<jsp:include page="../club/clubMenubar.jsp"/>
    	
        <div class="container">
            <div class="row" style="padding-top: 30px; justify-content: center;">
                <h3 id="test" style="font-size: 30px;">독서모임 신청내역</h3>
            </div>

            <div class="row">  
                <div class="col-xl-12 col-lg-12 col-md-12">
                
                	<c:if test="${fn:length(capList) <= 0}">
						<div style="padding: 200px; font-size: 22px; font-weight: 600; text-align: center;">신청한 독서모임이 없습니다.</div>
					</c:if>
                
                    <c:if test="${fn:length(capList) > 0}">
                    <section>
						<form id="mypageForm1" action="" method="post">
                        <div style="float: right;">
                            <button type="button" class="button button-login" style="margin-bottom: 20px;" onclick="deleteApply()">삭제하기</button>
                        </div>

                        <table id="applyList" class="table table-hover" style="text-align: center;">
                            <thead>
                                <tr style="background-color: #d1e7d1; font-size: 16px;">
                                    <th style="width:5%;">선택</th>
                                    <th style="width:10%;">카테고리</th>
                                    <th style="width:29%;">독서모임명</th>
                                    <th style="width:10%;">온/오프라인</th>
                                    <th style="width:12%;">만남 횟수</th>
                                    <th style="width:17%;">날짜</th>
                                    <!-- <th>신청인원/정원</th> -->
                                    <th style="width:9%;">취소</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${capList}" var="ap" varStatus="status">
	                                
	                                <c:forEach items="${list}" var="club"> 
	                                	<c:if test="${club.clubNo eq ap.clubNo}">
	                                		<c:set var="c" value="${club}"/>
	                                	</c:if>
	                                </c:forEach>
	
	                                <tr>
	                                    <td><input name="timeNo" type="checkBox" id="timeNo${status.index}" value="${ap.timeNo}"></td>
	                                    <td><c:out value="${c.category}"/></td>
	                                    
	                                    <td>
	                                    <div style="cursor:pointer;" onclick="goDetail(${c.clubNo});">
	                                    	<c:forEach items="${c.clubAttachments}" var="ca">
	                                    		<c:if test="${ca.fileType eq 2}">
	                                    			<div class="titleImg" style="background-image: url('${pageContext.servletContext.contextPath }/resources/upload_files/club_img/${ca.changeName}')"> </div>
	                                    		</c:if>
	                                    	</c:forEach>
	                                    	<div style="font-size: 16px; font-weight: 600; padding-top: 8px;"><c:out value="${c.clubTitle}"/></div>
	                                    </div>
	                                    </td>

	                                    <td><c:out value="${c.onoffLine}"/></td>
	                                    <td><span id="times${status.index}"><c:out value="${c.times}"/></span></td>
	                                    
	                                    <td>
		                                    <c:forEach items="${c.clubTimes}" var="ct" varStatus="i">
		                                    	<c:if test="${c.times eq '한 번 만나요'}">
		                                    		<c:if test="${ct.timeNo eq ap.timeNo}">
		                                    			<c:if test="${fn:length(ct.startTime) > 3}">
			                                    			${fn:substring(ct.clubDate,0,11)} | ${ct.startTime} ~ ${ct.endTime}<br>
			                                    		</c:if>
			                                    		<c:if test="${fn:length(ct.startTime) <= 2}">
			                                    			${fn:substring(ct.clubDate,0,11)} | ${ct.startTime}:00 ~ ${ct.endTime}:00<br>
			                                    		</c:if>
		                                    			<c:set var="cd" value="${ct.clubDate}"></c:set>
		                                    			<c:set var="cd2" value="${ct.clubDate}"></c:set>
		                                    		</c:if>
		                                    	</c:if>
		                                    	<c:if test="${c.times eq '여러 번 만나요'}">
		                                    		<c:if test="${fn:length(ct.startTime) > 3}">
			                                    			${fn:substring(ct.clubDate,0,11)} | ${ct.startTime} ~ ${ct.endTime}<br>
			                                    		</c:if>
			                                    		<c:if test="${fn:length(ct.startTime) <= 2}">
			                                    			${fn:substring(ct.clubDate,0,11)} | ${ct.startTime}:00 ~ ${ct.endTime}:00<br>
			                                    		</c:if>
		                                    		<c:if test="${i.first}">
		                                    			<c:set var="cd" value="${ct.clubDate}"></c:set>
		                                    		</c:if>
		                                    		<c:if test="${i.last}">
		                                    			<c:set var="cd2" value="${ct.clubDate}"></c:set>
		                                    		</c:if>
		                                    	</c:if>
		                                    	
		                                    	<fmt:parseDate var="clubDate" value="${cd}"  pattern="yyyy-MM-dd"/>
												<fmt:parseNumber value="${clubDate.time / (1000*60*60*24)}" integerOnly="true" var="clubDate1"></fmt:parseNumber>
												
												<fmt:parseDate var="clubDate2" value="${cd2}"  pattern="yyyy-MM-dd"/>
												<fmt:parseNumber value="${clubDate2.time / (1000*60*60*24)}" integerOnly="true" var="clubDate22"></fmt:parseNumber>
			                                </c:forEach>
		                                </td>
		                                
		                                <jsp:useBean id="today" class="java.util.Date" />
		                                <fmt:formatDate var="today2" value="${today}" pattern="yyyy-MM-dd"/>
		                                <fmt:parseDate var="now"  value="${today2}" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="now1"></fmt:parseNumber>

									    <td>
									    	<c:if test="${ap.applyParti eq 'N'}">
									    		<c:choose>
									    			<c:when test="${ap.applyCancle eq 'Y'}">
									    				<button disabled>취소완료</button>
										    		</c:when>
										    		<c:otherwise>
										    			<c:choose>
										    				<c:when test="${clubDate22 < now1 }">
										    					불참 (참여하신 경우 문의를 남겨주세요)
										    				</c:when>
												    		<c:otherwise>
												    			<c:if test="${clubDate1- now1 >= 3}">  <!-- 모임일자 3일 이전은 취소 못함 -->
												    				<input type="button" id="cancleBtn${status.index}" value="취소하기" onclick="cancleClub(this);">
												    			</c:if>
												    			<c:if test="${clubDate1- now1 < 3}">
												    				<button disabled>취소 불가</button>
												    				<label>모임일자 3일 이전에는 취소가 불가능합니다.</label>
												    			</c:if>
												    		</c:otherwise>
										    			</c:choose>
										    		</c:otherwise>
									    		</c:choose>
									    	</c:if>
									    	<c:if test="${ap.applyParti eq 'Y'}">
									    		<c:choose>
									    			<c:when test="${ap.reviewStatus eq 'Y'}">
									    				참여완료 <br>
									    				[리뷰 작성]
									    			</c:when>
									    			<c:otherwise>
									    				참여완료 <br>
									    				[리뷰 미작성]
									    			</c:otherwise>
									    		</c:choose>
									    	</c:if>
									    </td>
	                                </tr>  
                                </c:forEach>  
                            </tbody>
                        </table>
						</form>
						
						
						
						<div id="pagingArea">						
			                <ul class="pagination" style="justify-content: center; margin-top: 50px;">
			                	<c:choose>
			                		<c:when test="${ pi.currentPage ne 1 }">
			                			<li class="page-item"><a class="page-link" href="mypage1.cl?currentPage=${ pi.currentPage-1 }">이전</a></li>
			                		</c:when>
			                		<c:otherwise>
			                			<li class="page-item disabled"><a class="page-link" href="">이전</a></li>
			                		</c:otherwise>
			                	</c:choose>
			                	
			                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
			                    	<c:choose>
				                		<c:when test="${ pi.currentPage ne p }">
			                    			<li class="page-item"><a class="page-link" href="mypage1.cl?currentPage=${ p }">${ p }</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
				                		</c:otherwise>
				                	</c:choose>
			                    </c:forEach>
			                    
			                    <c:choose>
			                		<c:when test="${ pi.currentPage ne pi.maxPage }">
			                			<li class="page-item"><a class="page-link" href="mypage1.cl?currentPage=${ pi.currentPage+1 }">다음</a></li>
			                		</c:when>
			                		<c:otherwise>
			                			<li class="page-item disabled"><a class="page-link" href="mypage1.cl?currentPage=${ pi.currentPage+1 }">다음</a></li>
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
    <!-- ================ category section end ================= -->

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