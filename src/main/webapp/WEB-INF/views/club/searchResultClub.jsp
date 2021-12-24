<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>책구메이트-독서모임</title>
    <link rel="icon" href="resources/img/logo1.png" type="image/png">
    <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="resources/vendors/nice-select/nice-select.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">

    <link rel="stylesheet" href="resources/css/style.css">
    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <style>
       .searchBox {
            padding: 30px;
        }
        
        .searchBox ul {
            margin-bottom: 30px;
            width: 100%;
            display: flex;
        }
        
        .searchBox li:first-child {
            width: 15%;
        }
        
        .searchBox li {
            width: 80%;
        }
        
        .type_wrap {
            display: flex;
        }
        
        .clubTotal{
        	float: left;
    		width: 31.2%;
    		margin : 1.05%;
    		border: 1px solid #dadada;
    		height: 400px;
        }
        
        .titleBackImg{
        	height:250px;
        	background-position: center;
    		background-size: cover;
        }
        
        .titleContent{
        	padding-top: 10px;
        	text-align: center;
        }
        
        #pagingArea{
		 	text-align: center;
		 	position: absolute;
		 	bottom: 0px;
    		margin-top: 30px;
    		left: 50%;
    		transform: translate(-50%, -50%);
		}
        
        .searchTitle{
	        font-size: 19px;
	    	font-weight: 600;
        }
        
        /*체크박스, 레이블 높이 맞추기*/
        input[class="checkbox-search"] {
		  position: relative;
		  top: 4px;
		  zoom: 1.4;
		}
		label[class="label-search"] {
		  /* position: relative;
		  top: -16px; */
		  font-size: 18px;
		  margin: 0px 15px 0px 4px;
		}
		input[class="checkbox-date"]{
		  	top: -4px;
		  	position: relative;
		  	margin: 0px 10px;
    		zoom: 1.1;
		}
		
		#keyword{
			width: 350px;
		    height: 40px;
		    border: 1px solid lightgray;
		    border-radius: 5px;
		    margin: 0px 10px;
		}
		
		#categoryList1{
		    padding: 130px;
		    justify-content: center;
		    font-size: 25px;
		    font-weight: 600;
		}
    </style>
</head>

<body style="width:1200px; margin:auto">
    
    <jsp:include page="../common/menubar.jsp" />
  
    <script>
    	var currentPage = ${pi.currentPage};
    	
    	function goSearch(){
    		if($('#s4_1').val() == ""){
    			$('#s4_1_name').val('2000-01-01')
    		}else{
    			$('#s4_1_name').val($('#s4_1').val())
    		}
    		
    		if($('#s4_2').val() == ""){
    			$('#s4_2_name').val('2000-01-01')
    		}else{
    			$('#s4_2_name').val($('#s4_2').val())
    		}
    		
    	} 
        		 
        function searchPaging(e){
        	 
        	 goSearch();
        	 
             if($(e).attr('id').slice(-1) == 1){
             	currentPage = currentPage -1;
             }else if($(e).attr('id').slice(-1) == 3){
             	currentPage = currentPage +1;
             }else{
            	$(e).text();
             	currentPage = $(e).text();
             }
             
             $('#searchCPage').val(currentPage);
             $('#searchForm').submit();
         }
        
        function goDetail(clubNo){
    		location.href="detail.cl?clubNo=" + clubNo;
        }
    </script>

    <main class="site-main" style="margin-top: 200px;">
    	<jsp:include page="../club/clubMenubar.jsp"/>
    	
	    <div class="container">
	        <section class="searchSection">
				<div style="padding: 30px 0px">
	                <h3 style="font-size: 30px; font-weight: 700;">나에게 맞는 독서 모임을 선택해 보세요!</h3>
	            </div>
	
	            <div class="searchBox" style="background-color: #FAFAD2; margin-bottom: 20px">
	                <form id="searchForm" action="search.cl">
	                	<input type="hidden" name="currentPage" id="searchCPage">
	                    <ul>
	                       <li class="searchTitle">지역</li>
	                       <li>
	                           <div class="type_wrap">
	                           	   <!-- input마다 forEach를 돌게 하면 비효율적일 것 같아서 이렇게 해주었다. -->
	                           	   <c:forEach items="${sc.onoffLines}" var="onoffLine">
	                           	       <c:if test="${onoffLine eq '온라인'}">
	                           	       	   <c:set var="on" value="true"/>
	                           	       </c:if>
	                           	       <c:if test="${onoffLine eq '오프라인'}">
	                           	       	   <c:set var="off" value="true"/>
	                           	       </c:if>
	                           	   </c:forEach>
	                           	   
	                           	   <input class="checkbox-search" id="s1_1" type="checkbox" name="onoffLines" value="온라인" <c:if test="${on eq 'true'}"><c:out value="checked"/></c:if> >
		                           <div><label class="label-search" for="s1_1">온라인</label></div>
		                           <input class="checkbox-search" id="s1_2" type="checkbox" name="onoffLines" value="오프라인" <c:if test="${off eq 'true'}"><c:out value="checked"/></c:if> >
		                           <div><label class="label-search" for="s1_2">오프라인</label></div>
	                           	   
	                           </div>
	                       </li>
	                     </ul>
	                     <ul>
	                        <li class="searchTitle">독서모임 테마</li>
	                        <li>
	                           <div class="type_wrap">
	                           		<c:forEach items="${sc.categories}" var="categories">
	                           	       <c:if test="${categories eq '인문/과학/심리'}">
	                           	       	   <c:set var="s21" value="true"/>
	                           	       </c:if>
	                           	       <c:if test="${categories eq '문학/에세이'}">
	                           	       	   <c:set var="s22" value="true"/>
	                           	       </c:if>
	                           	       <c:if test="${categories eq '예술/음악'}">
	                           	       	   <c:set var="s23" value="true"/>
	                           	       </c:if>
	                           	       <c:if test="${categories eq '경영/경제/마케팅'}">
	                           	       	   <c:set var="s24" value="true"/>
	                           	       </c:if>
	                           	       <c:if test="${categories eq '글쓰기'}">
	                           	       	   <c:set var="s25" value="true"/>
	                           	       </c:if>
	                           	       <c:if test="${categories eq '강연'}">
	                           	       	   <c:set var="s26" value="true"/>
	                           	       </c:if>
	                           	    </c:forEach>
	                           	    
	                                <input class="checkbox-search" id="s2_1" type="checkbox" name="categories" value="인문/과학/심리"  <c:if test="${s21 eq 'true'}"><c:out value="checked"/></c:if> >
	                                <div><label class="label-search" for="s2_1">인문/과학/심리</label></div>
	                                <input class="checkbox-search" id="s2_2" type="checkbox" name="categories" value="문학/에세이" <c:if test="${s22 eq 'true'}"><c:out value="checked"/></c:if> >
	                                <div><label class="label-search" for="s2_2">문학/에세이</label></div>
	                                <input class="checkbox-search" id="s2_3" type="checkbox" name="categories" value="예술/음악" <c:if test="${s23 eq 'true'}"><c:out value="checked"/></c:if> >
	                                <div><label class="label-search" for="s2_3">예술/음악</label></div>
	                                <input class="checkbox-search" id="s2_4" type="checkbox" name="categories" value="경영/경제/마케팅" <c:if test="${s24 eq 'true'}"><c:out value="checked"/></c:if> >
	                                <div><label class="label-search" for="s2_4">경영/경제/마케팅</label></div>
	                                <input class="checkbox-search" id="s2_5" type="checkbox" name="categories" value="글쓰기" <c:if test="${s25 eq 'true'}"><c:out value="checked"/></c:if> >
	                                <div><label class="label-search" for="s2_5">글쓰기</label></div>
	                                <input class="checkbox-search" id="s2_6" type="checkbox" name="categories" value="강연" <c:if test="${s26 eq 'true'}"><c:out value="checked"/></c:if> >
	                                <div><label class="label-search" for="s2_6">강연</label></div>
	                            </div>
	                        </li>
	                    </ul>
	                    <ul>
	                        <li class="searchTitle">독서모임 횟수</li>
	                        <li>
	                            <div class="type_wrap">
	                            	<c:forEach items="${sc.times}" var="times">
	                           	       <c:if test="${times eq '한 번 만나요'}">
	                           	       	   <c:set var="s31" value="true"/>
	                           	       </c:if>
	                           	       <c:if test="${times eq '여러 번 만나요'}">
	                           	       	   <c:set var="s32" value="true"/>
	                           	       </c:if>
	                           	    </c:forEach>
	                            
	                                <input class="checkbox-search" id="s3_1" type="checkbox" name="times" value="한 번 만나요" <c:if test="${s31 eq 'true'}"><c:out value="checked"/></c:if> >
	                                <div><label for="s3_1" class="label-search">한 번 만나요</label></div>
	                                <input class="checkbox-search" id="s3_2" type="checkbox" name="times" value="여러 번 만나요" <c:if test="${s32 eq 'true'}"><c:out value="checked"/></c:if> >
	                                <div><label for="s3_2" class="label-search">여러 번 만나요</label></div>
	                            </div>
	                        </li>
	                    </ul>
	                    <ul>
	                        <li class="searchTitle">독서모임 날짜</li>
	                        <li>
	                            <div class="type_wrap">
	                                <div><label for="s4_1">시작</label></div>
	                                <c:if test="${empty sc.startDate}">
	                                	<input class="checkbox-date" id="s4_1" type="date" min="2021-01-01"> ~
	                                </c:if>
	                                <c:if test="${!empty sc.startDate}">
	                                	<input class="checkbox-date" id="s4_1" type="date" min="2021-01-01" value="${sc.startDate }"> ~
	                                </c:if>
	                                <input id="s4_1_name" name="startDate" type="hidden">
	                                <div><label for="s4_2">끝</label></div>
	                                <c:if test="${empty sc.endDate}">
	                                	<input class="checkbox-date" id="s4_2" type="date"  min="2021-01-01">
	                                </c:if>
	                                <c:if test="${!empty sc.endDate}">
	                                	<input class="checkbox-date" id="s4_2" type="date"  min="2021-01-01" value="${sc.endDate}">
	                                </c:if>
	                                <input id="s4_2_name" name="endDate" type="hidden">
	                            </div>
	                        </li>
	                    </ul>
	                    <div style="text-align: right;">
	                        <input type="search" id="keyword" name="keyword" placeholder="독서모임 제목과 책제목으로 검색해보세요" <c:if test="${!empty sc.keyword}"><c:out value="value=${sc.keyword}"/></c:if>> 
	                        <button onclick="goSearch()">검색</button>
	                    </div>
	                </form>
	            </div>
	       </section>
	       
	       <section id="clubs" style="overflow:hidden; position: relative;  padding-bottom: 130px;">
	    	   <c:if test="${fn:length(clubList) == 0}">
		   		   <div class="row" id="categoryList1">검색된 독서모임이 없습니다.</div>
			   </c:if>
			   
			   <c:if test="${fn:length(clubList)>0}">
				  <div id="categoryList">
					<c:forEach items="${clubList}" var="club" varStatus="s">
						<div class="clubTotal" onclick="goDetail(${club.clubNo})" style="cursor:pointer;">
							<div class="titleBackImg" style="background-image: url('${pageContext.servletContext.contextPath }/resources/upload_files/club_img/${club.titleChangeName}')"></div>
							<div class="titleContent">
								<ul class="card-blog__info">
									<li>
										<span id="c_category${s.index}"><c:out value="${club.category}"/></span> &nbsp; 
										<span id="c_onoffLine${s.index}">[<c:out value="${club.onoffLine}"/>]</span>
									</li>
									<li>
										<i class="ti-comments-smiley"></i> <c:out value="${club.heartCount}"/> Likes
									</li>
								</ul>
								<h4 id="c_title${s.index}" class="card-blog__title"><c:out value="${club.clubTitle}"/></h4>
								<p>
									<c:forEach items="${club.clubTimes}" var="clubTime" varStatus="status">
										<c:if test="${status.index eq 0}">
											<c:set var="startD" value="${clubTime.clubDate}"/>
										</c:if>
										<c:if test="${status.index ne 0}">
											<c:if test="${startD > clubTime.clubDate}">
												<c:set var="startD" value="${clubTime.clubDate}"/>
											</c:if>
										</c:if>
									</c:forEach>
									시작 : <c:out value="${startD}"></c:out> &nbsp;
									| <c:out value="${fn:length(club.clubTimes)}"></c:out> 번
								</p>
							</div>
						</div>
					</c:forEach>
				</div>

				<div id="pagingArea">
					<div style="display: inline-block;">
						<ul class="pagination">
				        	<c:choose>
				                <c:when test="${ pi.currentPage ne 1 }">
				                	<li class="page-item"><div id="searchPagingBtn1" class="page-link" onclick="searchPaging(this)">이전</div></li>
				                </c:when>
				                <c:otherwise>
				                	<li class="page-item disabled"><a class="page-link" href="">이전</a></li>
				                </c:otherwise>
				           </c:choose>
				                	
				           <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
				                 <c:choose>
					                <c:when test="${ pi.currentPage ne p }">
				                    	<li class="page-item"><div id="searchPagingBtn2" class="page-link" onclick="searchPaging(this)">${ p }</div></li>
					                </c:when>
					                <c:otherwise>
					                	<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
					                </c:otherwise>
					            </c:choose>
				           </c:forEach>
				           <c:choose>
				               <c:when test="${ pi.currentPage ne pi.maxPage }">
				                	<li class="page-item"><div id="searchPagingBtn3" class="page-link" onclick="searchPaging(this)">다음</div></li>
				               </c:when>
				               <c:otherwise>
				                	<li class="page-item disabled"><a class="page-link" href="">다음</a></li>
				               </c:otherwise>
				           </c:choose>
				    	</ul>
					</div>						
			    </div>				
				
			</c:if>
	    </section>
	       
	       
	   </div>
    </main>

	<jsp:include page="../common/footer.jsp" />
    
    <script src="resources/vendors/jquery/jquery-3.2.1.min.js "></script>
    <script src="resources/vendors/bootstrap/bootstrap.bundle.min.js "></script>
    <script src="resources/vendors/skrollr.min.js "></script>
    <script src="resources/vendors/owl-carousel/owl.carousel.min.js "></script>
    <script src="resources/vendors/nice-select/jquery.nice-select.min.js "></script>
    <script src="resources/vendors/jquery.ajaxchimp.min.js "></script>
    <script src="resources/vendors/mail-script.js "></script>
    <script src="resources/js/main.js "></script>
    
</body>

</html>