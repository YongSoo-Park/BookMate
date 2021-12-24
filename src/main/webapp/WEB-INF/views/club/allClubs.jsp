<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        /* carousel 부트스트랩 슬라이드쇼 요소 -> 화살표(next) 색, 크기 바꾸기 */
        
        .nextIcon{
            width: 40px;
            height: 40px;
            background-size: cover;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23384aeb' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath d='M2.75 0l-1.5 1.5L3.75 4l-2.5 2.5L2.75 8l4-4-4-4z'/%3e%3c/svg%3e");
        }
        /* carousel 부트스트랩 슬라이드쇼 요소 -> 화살표(prev) 색, 크기 바꾸기 */
        
        .prevIcon {
            width: 40px;
            height: 40px;
            background-size: cover;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23384aeb' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath d='M5.25 0l-4 4 4 4 1.5-1.5L4.25 4l2.5-2.5L5.25 0z'/%3e%3c/svg%3e");
        }
        
        .reviewTable {
            display: table;
            width: 100%;
            padding: 15px;
        }
        
        .reviewTable .tableThumb {
            display: table-cell;
            width: 22%;
            padding-right: 15px;
        }
        
        .reviewTable .tableTitle {
            display: table-cell;
            width: 78%;
            vertical-align: top;
        }
        .pointer{
        	cursor: pointer;
        }
        
        .fontBold{
        	font-weight:900;
        }
        .fontBold:hover{
        	color: #EE7942;
        }
        .closeClub{
	        background-color: black;
	        color: white;
	        width: 50%;
	        text-align: center;
	        margin: 0 auto;
	        margin-bottom: 10px;
        }
        .closeClubImgDiv{
        	cursor: pointer; 
        	background-size: cover;
        	background-position: center;
        	height: 65%;
        }
        
        [id^=c_clubTotal]{
        	width: 24%;
		    margin: 5.5px;
		    border: 1px solid #dadada;
		    min-height: 400px;
        }
        
        .titleImg{
            background-size: cover;
		    background-position: center;
		    height: 230px;
        }
        
        .clubTitle{
        	font-weight: 700;
        }
        
        .noClub{
        	padding: 80px;
		    justify-content: center;
		    font-size: 20px;
		    font-weight: 700;
        }
        
        .paging{
	         justify-content: center; 
	         margin-top: 35px;
        }
        
        [id^=closeClubTotal]{
        	width: 19%; 
        	margin: 5.5px; 
        	min-height: 350px; 
        	text-align: center;
        	border: 1px solid #dadada;
        }
    </style>
</head>

<body style="width:1200px; margin:auto">
    
    <jsp:include page="../common/menubar.jsp" />
    <main class="site-main" style="margin-top: 200px;">
    	<jsp:include page="../club/clubMenubar.jsp"/>
    	
    	<!-- 카테고리별 헤더 만들기 -->
        <ul class="navbar" style="width: 100%; margin-top: 20px;">
            <li class="nav-item">
                <h5 id="cate1" onclick="clickCategory(1, this)" class="clickCategory fontBold" style="color: orange;"><a style="cursor:pointer">인문/과학/심리</a></h5>
            </li>
            <li class="nav-item">
                <h5 id="cate2" onclick="clickCategory(2, this)" class="clickCategory fontBold"><a style="cursor:pointer">문학/에세이</a></h5>
            </li>
            <li class="nav-item">
                <h5 id="cate3" onclick="clickCategory(3, this)"  class="clickCategory fontBold"><a style="cursor:pointer">예술/음악</a></h5>
            </li>
            <li class="nav-item">
                <h5 id="cate4" onclick="clickCategory(4, this)"  class="clickCategory fontBold"><a style="cursor:pointer">경영/경제/마케팅</a></h5>
            </li>
            <li class="nav-item">
                <h5 id="cate5" onclick="clickCategory(5, this)"  class="clickCategory fontBold"><a style="cursor:pointer">글쓰기</a></h5>
            </li>
            <li class="nav-item">
                <h5 id="cate6" onclick="clickCategory(6, this)"  class="clickCategory fontBold"><a style="cursor:pointer">강연</a></h5>
            </li>
        </ul>


        <!-- ================ 1.모집중================= -->
        <section class="section-margin calc-60px" style="margin-top:50px;">
            <div class="container">
                <div class="section-intro" style="text-align:center;  padding:30px;">  <!-- pb-60px -->
                    <h2>모집<span class="section-intro__style">중</span></h2>
                </div>
	            <div class="row noClub" id="categoryList1_1" style="display:none;">
	                                해당 카테고리에 독서모임은 없습니다.
	            </div>
       
	            <div class="row" id="categoryList1_2"  style="display:none;">
	            	<c:forEach begin="0" end="7" varStatus="s">
	            		<div id="c_clubTotal${s.index}" class="pointer" <c:if test="${s.index >= fn:length(cateList_first) }"><c:out value="style=display:none;"/></c:if>>
		                	<input id="c_clubNo${s.index}" type="hidden" value="${cateList_first[s.index].clubNo}">
		                    <div class="">
		                         <div id="c_clubImg${s.index}" class="titleImg" style="background-image: url('${pageContext.servletContext.contextPath }/resources/upload_files/club_img/${cateList_first[s.index].titleChangeName}')"></div>
		                    </div>
		                    <div style="margin-top:15px; text-align: center;">
		                    	<ul class="card-blog__info">
			                    	<li><span id="c_category${s.index}">${cateList_first[s.index].category}</span> &nbsp; [<span style="margin-right:0px;" id="c_onoffLine${s.index}">${cateList_first[s.index].onoffLine}</span>] </li>
			                        <li><i class="ti-comments-smiley"></i> <span id="c_likes${s.index}">${cateList_first[s.index].heartCount }</span> Likes</li>
			                    </ul>
			                    <h4 id="c_title${s.index}" class="clubTitle card-blog__title">${cateList_first[s.index].clubTitle}</h4>
			                    <p>
			                    	<c:forEach items="${cateList_first[s.index].clubTimes}" var="at" varStatus="s_at">
			                           <c:choose>
			                               <c:when test="${s_at.index eq 0}">
			                                 	<c:set var="firstStart" value="${at.clubDate}"/>
			                               </c:when>
			                               <c:otherwise>
			                                 	<c:if test="${firstStart > at.clubDate }">
			                                 		<c:set var="firstStart" value="${at.clubDate}"/>
			                                 	</c:if>
			                               </c:otherwise>
			                           </c:choose>
			                       </c:forEach>	
			                                                   시작 : <span id="c_startDate${s.index}">${firstStart}</span> &nbsp; | <span id="c_manyTimes${s.index}">${fn:length(cateList_first[s.index].clubTimes)}</span>번
			                   </p>
			               </div>
		                </div> 
	                </c:forEach>
	            </div>
            
	            <div>	
	            	<ul id="pagingArea1" class="pagination paging" style="display: none;">  	
				    	<c:choose>
				    		<c:when test="${ pi_first.currentPage ne 1 }">
				                <li id="bb" class="page-item" onclick="movePage(this)"><div class="page-link pagelink1">이전</div></li>
				            </c:when>
				            <c:otherwise>
				                <li id="bb" class="page-item disabled" onclick="movePage(this)" ><div class="page-link">이전</div></li>
				            </c:otherwise>
				        </c:choose> 
				              
				        <c:forEach begin="1" end="${ pi_first.pageLimit}" var="p">
				             <li id="cc${p}" class="page-item" onclick="movePage(this)" style="display:none" value="0"><div id="ccc${p}" class="page-link"></div></li>
				        </c:forEach>
				             
				        <c:forEach begin="${ pi_first.startPage }" end="${ pi_first.endPage }" var="p">
				        	 <c:choose>
					         	 <c:when test="${ pi_first.currentPage ne p }">
				                    <li class="page-item" onclick="movePage(this)" value="${p}"><div class="page-link cc1" >${ p }</div></li>
					             </c:when>
					             <c:otherwise>
					                <li class="page-item disabled"><a class="page-link cc1" href="">${ p }</a></li>
					             </c:otherwise>
					         </c:choose>
				        </c:forEach>
				                    
				        <c:choose>
				        	<c:when test="${ pi_first.currentPage ne pi_first.maxPage }">
				                <li id="dd" class="page-item" onclick="movePage(this)"><div class="page-link pagelink1">다음</div></li>
				            </c:when>
				            <c:otherwise>
				                <li id="dd" class="page-item disabled" onclick="movePage(this)"><div class="page-link">다음</div></li>
				            </c:otherwise>
				        </c:choose>    
				    </ul>
				 </div>
			</div>
		</section>				
	
    <!-- ================ 2. 모집완료  ================= -->
	<section class="section-margin calc-60px">
     	<div class="container">
     		<div class="section-intro" style="text-align:center; padding:30px;"> 
                <h2>모집<span class="section-intro__style">완료</span></h2>
            </div>
            
            <div class="row noClub" id="categoryList2_1" style="display:none;">
                                     해당 카테고리에 독서모임은 없습니다.
            </div>
            	     
            <div class="row" id="categoryList2_2" style="display:none;">   
                <c:forEach begin="0" end="7" varStatus="s">
                     <div id="c_clubTotal2${s.index}" class="pointer" <c:if test="${s.index >= fn:length(cateList_second)}"><c:out value="style=display:none;"/></c:if> >
	                      <input id="c_clubNo2${s.index}" type="hidden" value="${cateList_second[s.index].clubNo}"> 
	                      <div id="c_clubImg2${s.index}" class="titleImg" style="background-image: url('${pageContext.servletContext.contextPath }/resources/upload_files/club_img/${cateList_second[s.index].titleChangeName}')"></div>
	                      <div style="margin-top:15px; text-align: center;">
	                          <ul class="card-blog__info">
	                              <li><span id="c_category2${s.index}">${cateList_second[s.index].category}</span> &nbsp; [<span style="margin-right:0px;" id="c_onoffLine2${s.index}">${cateList_second[s.index].onoffLine}</span>] </li>
	                              <li><i class="ti-comments-smiley"></i> ${cateList_second[s.index].heartCount } Likes</li>
	                          </ul>
	                          <div class="closeClub"><span>마감되었습니다</span></div>
	                          <h4 id="c_title2${s.index}" class="clubTitle card-blog__title">${cateList_second[s.index].clubTitle}</h4>
	                          <p>
	                          	  <c:forEach items="${cateList_second[s.index].clubTimes}" var="at" varStatus="s_at">
	                                 <c:choose>
	                                 	<c:when test="${s_at.index eq 0}">
	                                 		<c:set var="firstStart" value="${at.clubDate}"/>
	                                 	</c:when>
	                                 	<c:otherwise>
	                                 		<c:if test="${firstStart > at.clubDate }">
	                                 			<c:set var="firstStart" value="${at.clubDate}"/>
	                                 		</c:if>
	                                 	</c:otherwise>
	                                 </c:choose>
	                             </c:forEach>	
	                                                                시작 : <span id="c_startDate2${s.index}">${firstStart}</span> &nbsp; | <span id="c_manyTimes2${s.index}">${fn:length(cateList_second[s.index].clubTimes)}</span>번
	                          </p>
	                      </div>
	                  </div> 
                 </c:forEach>
            </div>
               
            <div>
			    <ul id="pagingArea2" class="pagination paging" style="display: none;">  

			         <c:choose>
			             <c:when test="${ pi_second.currentPage ne 1 }">
			                <li id="bb2" class="page-item" onclick="movePage(this)"><div class="page-link pagelink1">이전</div></li>
			             </c:when>
			             <c:otherwise>
			             	<li id="bb2" class="page-item disabled" onclick="movePage(this)"><div class="page-link">이전</div></li>
			             </c:otherwise>
			         </c:choose> 
			         <c:forEach begin="1" end="${ pi_second.pageLimit}" var="p">
			             <li id="cc2${p}" class="page-item" style="display:none" onclick="movePage(this)"><div id="ccc2${p}" class="page-link"></div></li>
			         </c:forEach>
			         
			         <c:forEach begin="${ pi_second.startPage }" end="${ pi_second.endPage }" var="p">
			             <c:choose>
				             <c:when test="${ pi_second.currentPage ne p }">
			                    <li class="page-item" value="${p}" onclick="movePage(this)"><div  class="page-link cc12" >${ p }</div></li>
				             </c:when>
				             <c:otherwise>
				                <li class="page-item disabled"><a  class="page-link cc12" href="">${ p }</a></li>
				             </c:otherwise>
				         </c:choose>
			         </c:forEach>
			                    
			         <c:choose>
			            <c:when test="${ pi_second.currentPage ne pi_second.maxPage }">
			               <li id="dd2" class="page-item" onclick="movePage(this)"><div class="page-link pagelink1">다음</div></li>
			            </c:when>
			            <c:otherwise>
			               <li id="dd2" class="page-item disabled" onclick="movePage(this)"><div class="page-link">다음</div></li>
			            </c:otherwise>
			         </c:choose>       
			    </ul>
			</div>      
		</div>
	</section>                

    <!-- ================ 3. 마감임박 독서모임 ================= -->
    <section class="section-margin calc-60px">
              <div class="container">
                 <div class="section-intro pb-60px" style="text-align:center;">  <!-- pb-60px -->
                     <h2>모집<span class="section-intro__style">종료</span></h2>
                 </div>
                 		
                 		
                 <div class="row noClub" id="categoryList3_1" style="display:none;">
			                       해당 카테고리에 독서모임은 없습니다.
			     </div>
			            
			     <div id="categoryList3_2" style="display:none;">   
                 	    <div style="display: flex; width:100%;">
							<c:forEach begin="0" end="4" varStatus="status">  <!-- onclick='goDetail(${cateList_third[status.index].clubNo})' -->
								<div id="closeClubTotal${status.index}" onclick='goDetail(${status.index})' <c:if test="${status.index >= fn:length(cateList_third)}"><c:out value="style=display:none;"/></c:if> >
									<input id="closeClubNo${status.index}" type="hidden" value="${cateList_third[status.index].clubNo}">
									<div class="closeClubImgDiv" style="background-image: url('${pageContext.servletContext.contextPath }/resources/upload_files/club_img/${cateList_third[status.index].clubAttachments[0].changeName}')" id="close_ClubImg${status.index}"></div>
									<ul class="card-blog__info" style="margin-top: 10px;">
		                                <li><span id="close_category${status.index}">${cateList_third[status.index].category}</span> &nbsp;</li>
		                                <li><i class="ti-comments-smiley"></i> <span id="close_likes${status.index}">${cateList_third[status.index].heartCount}</span> Likes</li>
		                            </ul>
		                            <div class="closeClub" style="width:70%; margin:auto;"><span>모집종료되었습니다</span></div>
		                            <h4 id="close_title${status.index}" class="clubTitle card-blog__title">${cateList_third[status.index].clubTitle}</h4>
								</div>
							</c:forEach>
						</div>
                   </div>
              </div>
         </section>      
    </main>

	<script>
        var category = "인문/과학/심리";
        var origin = 0;
        var nowPage1 = 1;
        var nowPage2 = 1;
        var listIndex = 0;  //모집종료 용
        
        function goDetail(index){
        	var clubNo = $('#closeClubNo'+index).val();
        	location.href="detail.cl?clubNo=" + clubNo;
        }
                    
        $(document).ready(function() {
        	$(".pointer").click(function(){
                console.log($(this).children(":first").val());
                location.href="detail.cl?clubNo=" + $(this).children(":first").val();
            });
        	
			//처음에 리스트가 0일 때 페이징바 안나오도록 div 3개(없습니다/있을때 for/페이징바) 모두 none처리 후
			//div 없습니다 flex로 풀기
			var cateList1_length = '<c:out value="${fn:length(cateList_first)}"/>'
            var cateList2_length = '<c:out value="${fn:length(cateList_second)}"/>'
            var cateList3_length = '<c:out value="${fn:length(cateList_third)}"/>'

            if(cateList1_length == 0){
                $('#categoryList1_1').css('display','flex');
            }else{
                $('#categoryList1_2').css('display','flex');
                $('#pagingArea1').css('display','flex');
            }
            
            if(cateList2_length == 0){
                $('#categoryList2_1').css('display','flex');
            }else{
                $('#categoryList2_2').css('display','flex');
                $('#pagingArea2').css('display','flex');
            }
            
            if(cateList3_length == 0){
                $('#categoryList3_1').css('display','flex');
            }else{
                $('#categoryList3_2').css('display','flex');
            }
		})

		//페이징 처리
        function movePage(e){
        	
        	//disabled된 이전, 다음으로 등 페이징바 눌렀을 때 ajax통신하지 않도록 막기
	        if($(e).hasClass('disabled')){
	            return;
	        } 
        	
        	var currentPage;
	        var clubStatus = '';

           	var parentId = $(e).parent().attr('id');          
	        if(parentId == 'pagingArea1'){
	            clubStatus='모집중';
	        }else{
	            clubStatus='모집완료';
	        }
	        
	        //다음, 이전 눌렀을 때 처리해줘야 함
	        if($(e).val() == ''){  //1.이전, 다음으로 클릭
	        	if(clubStatus == '모집중'){
	        		if($(e).attr('id').substring(0,2) == 'bb'){
	                	console.log("이전으로 클릭");
	                	currentPage = nowPage1 -1;
		                nowPage1 = currentPage;  //현재 페이지 저장해두기
	                }else{
	                	console.log("다음으로 클릭");
	                	currentPage = nowPage1 +1;
		                nowPage1 = currentPage;  //현재 페이지 저장해두기
	                }
	           }else{
	                if($(e).attr('id').substring(0,2) == 'bb'){
	                	console.log("이전으로 클릭");
	                	currentPage = nowPage2 -1;
		                nowPage2 = currentPage;  //현재 페이지 저장해두기
	                }else{
	                	console.log("다음으로 클릭");
	                	currentPage = nowPage2 +1;
		                nowPage2 = currentPage;  //현재 페이지 저장해두기
	                }
	          }      	   
	        }else{  //2.숫자 페이지 누르기
	        	currentPage = $(e).val();
	                	   
	            if(clubStatus == '모집중'){
	                nowPage1 = currentPage;  //현재 페이지 저장해두기
	            }else{
	                nowPage2 = currentPage;  //현재 페이지 저장해두기
	            }    	   
	        } 
	        
	        $.ajax({
	        	url:"allCateListPart.cl",
	            data:{
	            	category : category,
	                clubStatus : clubStatus,
	                currentPage : currentPage
	            },
	            type : "post",
	            success:function(map){        
		            if(clubStatus == '모집중'){
		                list1(map);
		            }else{
		                list2(map);
		            }           
	            },error:function(){
	                 console.log("ajax 통신실패")
	            }
	       })
        }
		
		function clickCategory(num, e){

			nowPage1 = 1;  //카테고리 클릭시 페이징처리 새로 할 수 있게 1로 저장하기
			nowPage2 = 1;
        	category = $(e).text();
        	
        	$.ajax({
				url:"allCateList.cl",
				data:{category:category},
				type : "post",
				success:function(map){
					console.log("ajax 통신성공")
								
					//1. 리스트 붙이기
					list1(map);
					list2(map);
					list3(map);
					
					//2. 클릭한 카테고리 색 바꾸기
					for(var i=1; i<=6; i++){
						if(i == num){
							$('#cate'+i).css('color','orange');
						}else{
							$('#cate'+i).css('color','black');
						}
					}
				},error:function(){
					console.log("ajax 통신실패")
				}
			})
        }
  
	   function list1(map){  //1.모집중 목록 붙이기
		    var cateList1 = map.cateList1;
                    	
            var listView1 = document.getElementById("categoryList1_1"); //없습니다.
			var listView = document.getElementById("categoryList1_2");  //리스트 뿌리기
			var pagingArea = document.getElementById("pagingArea1");
						
			if(cateList1.length == 0){  //1.리스트 빈 경우
				listView.style.display = 'none';
				listView1.style.display = 'flex';
				pagingArea.style.display = 'none';
			}else{	
				//2. 리스트 값 있는 경우
				$.each(cateList1,function(i){
								
					/* $('#c_clubImg'+i).attr("src","${pageContext.servletContext.contextPath }/resources/upload_files/club_img/"+cateList1[i].clubAttachments[0].changeName); */
					
					$('#c_clubImg'+i).css("background-image","url(${pageContext.servletContext.contextPath }/resources/upload_files/club_img/"+cateList1[i].titleChangeName+")"); 
					$('#c_clubNo'+i).val(cateList1[i].clubNo);	
					$('#c_category'+i).text(cateList1[i].category);	
					$('#c_onoffLine'+i).text(cateList1[i].onoffLine);
					$('#c_title'+i).text(cateList1[i].clubTitle);
					$('#c_likes'+i).text(cateList1[i].heartCount);
								
					var dateCount = 0;
					var startD;
								
					for(var ct of cateList1[i].clubTimes){
									
						if(dateCount == 0){
							startD = ct.clubDate
						}else{
							if(startD > ct.clubDate){
								startD = ct.clubDate
							}
						}
						dateCount +=1;
					} 
								
					$('#c_startDate'+i).text(startD);
					$('#c_manyTimes'+i).text(cateList1[i].clubTimes.length);
					$('#c_clubTotal'+i).css('display','block');  //none풀어주기
								
				})
		
				listView1.style.display = 'none';
				listView.style.display = 'flex';
				pagingArea.style.display = 'flex';
					
				//8개보다 적으면 display를 none으로 해서 안보이게 해야함
				for(var i=cateList1.length; i<8; i++){
					$('#c_clubTotal'+i).css('display','none');
				}							
			}
						
			//2.페이징바 처리하기
			//list내용 없으면 페이징바 안보이게 하기
			if(cateList1.length == 0){
				$('#pagingArea1').css("display", "none");
			}else{
				$('#pagingArea1').css("display", "flex");
			}
						
			//0) 맨 처음에 뜨는 페이징바-1,2,3... 안보이게 처리
			$(".cc1").css("display", "none");
			
			//1)이전으로
			var pi1 = map.pi1;
			if(pi1.currentPage != 1){
				$('#bb').removeClass("disabled");
			}else{
				$('#bb').addClass("disabled");
			}
						
			//2)1,2,3...
			//2-1) 페이지갯수만큼 보이게 하기
			var p_index = 1;
			for(var p=pi1.startPage; p<=pi1.endPage; p++){
				$("#cc" + p_index).removeClass("disabled");  //현재페이지 아닌곳은 다 갈 수 있어야 하므로
				$("#cc" + p_index).css("display", "block");
			    $("#cc" + p_index).val(p);
			    $("#ccc" + p_index).text(p);
			                
			    if(pi1.currentPage == p){
			         $("#cc" + p).addClass("disabled");
			    }
			    p_index += 1;
	        }
			
			//2-2) 페이지갯수 초과 -> 안보이게 하기
			for(var dp=p_index; dp<=pi1.pageLimit; dp++){
				$("#cc" + dp).css("display", "none");
			}

			//3)다음으로
			if(pi1.currentPage != pi1.maxPage){
				$('#dd').removeClass("disabled");
			}else{
				$('#dd').addClass("disabled");
			}
       }
	                
	   function list2(map){
       		var cateList2 = map.cateList2;
                    	
            var listView1 = document.getElementById("categoryList2_1");
			var listView = document.getElementById("categoryList2_2");
			var pagingArea = document.getElementById("pagingArea2");
						
			console.log("list길이2 : " + cateList2.length)
						
			if(cateList2.length == 0){  //1.리스트 빈 경우
				listView.style.display = 'none';
				listView1.style.display = 'flex';
				pagingArea.style.display = 'none';
			}else{				  
				//2. 리스트 값 있는 경우
				$.each(cateList2,function(i){
					$('#c_clubImg2'+i).css("background-image","url(${pageContext.servletContext.contextPath }/resources/upload_files/club_img/"+cateList2[i].titleChangeName+")"); 
					$('#c_clubNo2'+i).val(cateList2[i].clubNo);	
					$('#c_category2'+i).text(cateList2[i].category);	
					$('#c_onoffLine2'+i).text(cateList2[i].onoffLine);
					$('#c_title2'+i).text(cateList2[i].clubTitle);
					$('#c_likes2'+i).text(cateList2[i].heartCount);
								
					var dateCount = 0;
					var startD;
								
					for(var ct of cateList2[i].clubTimes){
									
						if(dateCount == 0){
							startD = ct.clubDate
						}else{
							if(startD > ct.clubDate){
								startD = ct.clubDate
							}
						}
						dateCount +=1;
					}
								
					$('#c_startDate2'+i).text(startD);
					$('#c_manyTimes2'+i).text(cateList2[i].clubTimes.length);
					$('#c_clubTotal2'+i).css('display','block');  //none풀어주기			
				})
		
				listView1.style.display = 'none';
				listView.style.display = 'flex';
				pagingArea.style.display = 'flex';
							
				//다시 지워줘야 함
				for(var i=cateList2.length; i<8; i++){
					$('#c_clubTotal2'+i).css('display','none');
				}
			}
						
			//list내용 없으면 페이징바 안보이게 하기
			if(cateList2.length == 0){
				$('#pagingArea2').css("display", "none");
			}else{
				$('#pagingArea2').css("display", "flex");
			}
			//2.페이징바 처리하기
			//0) 맨 처음에 뜨는 페이징바-1,2,3... 안보이게 처리
			$(".cc12").css("display", "none");
			
			//1)이전으로
			var pi2 = map.pi2;
			if(pi2.currentPage != 1){
				$('#bb2').removeClass("disabled");
			}else{
				$('#bb2').addClass("disabled");
			}
						
			//2)1,2,3...
			//2-1) 페이지갯수만큼 보이게 하기
			var p_index = 1;

			for(var p=pi2.startPage; p<=pi2.endPage; p++){
				$("#cc2" + p_index).removeClass("disabled");  //현재페이지 아닌곳은 다 갈 수 있어야 하므로
				$("#cc2" + p_index).css("display", "block");
			    $("#cc2" + p_index).val(p);
			    $("#ccc2" + p_index).text(p);
			                
			    if(pi2.currentPage == p){
			        $("#cc2" + p).addClass("disabled");
			    }
			    p_index += 1;
			}
						
			//2-2) 페이지갯수 초과 -> 안보이게 하기 : 이전카테고리에서 3페이지였고 이번카테고리가 2페이지까지면 3페이지는 안나와야하기때문
			for(var dp=p_index; dp<=pi2.pageLimit; dp++){
				$("#cc2" + dp).css("display", "none");
			}
						
			//3)다음으로
			if(pi2.currentPage != pi2.maxPage){
				$('#dd2').removeClass("disabled");
			}else{
				$('#dd2').addClass("disabled");
			}							
       }
	                 
	   function list3(map){
	   		var cateList1 = map.cateList3;
	                    	
	        var listView1 = document.getElementById("categoryList3_1");
			var listView = document.getElementById("categoryList3_2");
			var length3 = cateList1.length
			
			if(length3 == 0){  //1.리스트 빈 경우
				listView.style.display = 'none';
				listView1.style.display = 'flex';
			}else{				 
				//2. 리스트 값 있는 경우
				$.each(cateList1,function(i){
     				$('#close_ClubImg'+i).css("background-image","url(${pageContext.servletContext.contextPath }/resources/upload_files/club_img/"+cateList1[i].clubAttachments[0].changeName+")"); 
     				$('#close_category'+i).text(cateList1[i].category);
     				$('#close_likes'+i).text(cateList1[i].heartCount);	
     				$('#close_title'+i).text(cateList1[i].clubTitle);
     				$('#closeClubNo'+i).val(cateList1[i].clubNo);
     			})
			
				listView1.style.display = 'none';
				listView.style.display = 'flex';
					
				for(var i=0; i<length3; i++){
					$('#closeClubTotal'+i).css('display','block')
				} 
				for(var i=length3; i<5; i++){
					$('#closeClubTotal'+i).css('display','none')
				} 
			}
	    }
	               

	                 
    </script>
    
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