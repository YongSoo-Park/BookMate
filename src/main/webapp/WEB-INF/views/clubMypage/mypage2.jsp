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

<body style="width:1200px; margin:auto;  padding-top: 140px;">

     <jsp:include page="../common/menubar.jsp" />
    
    <script>
		    	
	    //선택한 독서모임 multiple 삭제하기
	    function deleteClub(){
	        var deleteC = confirm("찜목록에서 삭제하시겠습니까? 삭제시 찜도 자동으로 취소됩니다.");
	        if(deleteC){
	            if($("input:checkBox[name=clubNo]:checked").length == 0){
	                alert("삭제할 독서모임을 선택해주세요!!");
	            }else{
	            	console.log("여기 타니?")
	                $("#mypageForm2").attr("action", "deleteClub2.cl").submit();
	            }
	        }
	    }
	    
	    function goDetail(clubNo){
	    	location.href="detail.cl?clubNo=" + clubNo;            	
        }
    </script>

    
    <!-- ================ category section start ================= -->
    <section class="section-margin--small mb-5" style="margin-top: 50px;">
        <jsp:include page="../club/clubMenubar.jsp"/>
        
        <div class="container">
            <div class="row" style="padding-top: 30px; justify-content: center;">
                <h3 id="test" style="font-size: 30px; ">  찜한 독서모임</h3>
            </div>
            <div class="row">  
                <div class="col-xl-12 col-lg-12 col-md-12">
                    
                    <c:if test="${fn:length(cwList) <= 0}">
						<div style="padding: 200px; font-size: 22px; font-weight: 600; text-align: center;">찜목록이 비었습니다.</div>
					</c:if>
                    
                    <c:if test="${fn:length(cwList) > 0}">
                    <section>
						<form id="mypageForm2" action="" method="post">
                        <div style="float: right;">
                            <button class="button button-login" style="margin-bottom: 20px;" onclick="deleteClub()">삭제하기</button>
                        </div>
   
                        <table id="wishList" class="table table-hover" style="text-align: center;">
                            <thead>
                                <tr style="background-color: #d1e7d1; font-size: 16px;">
                                    <th style="width:5%;">선택</th>
                                    <th style="width:10%;">카테고리</th>
                                    <th style="width:29%;">독서모임명</th>
                                    <th style="width:10%;">호스트명</th>
                                    <th style="width:10%;">온/오프라인</th>
                                    <th style="width:17%;">날짜</th>
                                    <!-- <th>신청인원/정원</th> -->
                                    <th style="width:7%;">마감까지</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${cwList}" var="cw" varStatus="status">
                            		
                            		<c:forEach items="${list}" var="club"> 
	                                	<c:if test="${club.clubNo eq cw.clubNo}">
	                                		<c:set var="c" value="${club}"/>
	                                	</c:if>
	                                </c:forEach>
                            	
	                                <tr>
	                                    <td><input name="clubNo" type="checkBox" value="${c.clubNo}"></td>
	                                    <td>${c.category}</td>
	                                    
	                                    <td>
	                                    <div onclick="goDetail(${c.clubNo})"  style="cursor:pointer;">
	                                    	<c:forEach items="${c.clubAttachments}" var="ca">
	                                    		<c:if test="${ca.fileType eq 2}">
	                                    			<div class="titleImg" style="background-image: url('${pageContext.servletContext.contextPath }/resources/upload_files/club_img/${ca.changeName}')"> </div>
	                                    		</c:if>
	                                    	</c:forEach>
	                                    	<div style="font-size: 16px; font-weight: 600; padding-top: 8px;"><c:out value="${c.clubTitle}"/></div>
	                                    </div>
	                                    </td>
	                                    
	                                    <td><c:out value="${c.hostName}"/></td>
	                                    <td><c:out value="${c.onoffLine}"/></td>
	                                    
	                                    <td>
		                                    <c:forEach items="${c.clubTimes}" var="ct">
		                                    	<c:if test="${ !empty ct.clubDate}">
		                                    		<c:if test="${fn:length(ct.startTime) > 3}">
			                                    		${fn:substring(ct.clubDate,0,11)} | ${ct.startTime} ~ ${ct.endTime}<br>
			                                    	</c:if>
			                                    	<c:if test="${fn:length(ct.startTime) <= 2}">
			                                    		${fn:substring(ct.clubDate,0,11)} | ${ct.startTime}:00 ~ ${ct.endTime}:00<br>
			                                    	</c:if>
		                                    	</c:if>
			                                </c:forEach>
		                                </td>
		                                
		                                <jsp:useBean id="today" class="java.util.Date" />
		                                <fmt:formatDate var="today2" value="${today}" pattern="yyyy-MM-dd"/>
		                                <fmt:parseDate var="now"  value="${today2}" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="now1"></fmt:parseNumber>

										<fmt:parseDate var="endDate" value="${c.clubEndDate}"  pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${endDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate1"></fmt:parseNumber>

									    <td>
									    	<c:if test="${(endDate1- now1) >=0}">
									    		${endDate1- now1}일
									    	</c:if>
									    	<c:if test="${(endDate1- now1) < 0}">
									    		현재 모집 중이 아닙니다😥									    	</c:if>
									    </td>
		                                
	                                </tr>
                                </c:forEach>  
                            </tbody>
                        </table>

                        <!-- 종류별 독서모임 보기 & 페이징바 -->

                        <!-- <div class="all" style="width: 100%;">
                            <div class="all  bottom1" style="width: 70%;">
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
                            </div>
                        </div> -->

						</form>
						
						<c:if test="${fn:length(cwList) != 0}">
							<div id="pagingArea">						
				                <ul class="pagination" style="justify-content: center; margin-top: 50px;">
				                	<c:choose>
				                		<c:when test="${ pi.currentPage ne 1 }">
				                			<li class="page-item"><a class="page-link" href="mypage2.cl?currentPage=${ pi.currentPage-1 }">이전</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item disabled"><a class="page-link" href="">이전</a></li>
				                		</c:otherwise>
				                	</c:choose>
				                	
				                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
				                    	<c:choose>
					                		<c:when test="${ pi.currentPage ne p }">
				                    			<li class="page-item"><a class="page-link" href="mypage2.cl?currentPage=${ p }">${ p }</a></li>
					                		</c:when>
					                		<c:otherwise>
					                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
					                		</c:otherwise>
					                	</c:choose>
				                    </c:forEach>
				                    
				                    <c:choose>
				                		<c:when test="${ pi.currentPage ne pi.maxPage }">
				                			<li class="page-item"><a class="page-link" href="mypage2.cl?currentPage=${ pi.currentPage+1 }">다음</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item disabled"><a class="page-link" href="mypage2.cl?currentPage=${ pi.currentPage+1 }">다음</a></li>
				                		</c:otherwise>
				                	</c:choose>
				                </ul>
				            </div>
						</c:if>
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