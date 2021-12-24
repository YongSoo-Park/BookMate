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
       .mainTitle{
       		padding:0px 0px 30px;
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
            height: 200px;
        }
        
        .reviewTable .tableTitle {
            display: table-cell;
            width: 78%;
            vertical-align: top;
        }
        .pointer{
        	cursor: pointer;
        }
        .titleBackImg{
        	width: 100%;
        	height: 100%;
		    background-size: cover;
		    background-position: center center;
        }
        
        .cardImg{
        	height: 275px;
        	background-color: #EED8AE;
        }

		.popTotal_2{
		     display: flex; 
		     flex-wrap: wrap;
		}
		.popOne{
		 	width: 327px;
		    height: 450px;
		    margin: 8px;
		    border: 1px solid #dadada;
		    padding: 10px;
		    cursor: pointer;
		}

	    .clickCategory{
	    	cursor: pointer;
	    	font-weight: 700;
	    }
	    
	    [id^=endTotal_2]{
	    	justify-content: center;
	    }
	    
	    #endArrow_left {
			font-size: 50px;
			color: gray;
			position: absolute;
			top: 220px;
			left: 0px;
		}
		
		#endArrow_right {
			font-size: 50px;
			color: gray;
			position: absolute;
			top: 220px;
			right: 0px;
		}
		
		.contents{
		    margin-top: 15px;
    		text-align: center;
		}
		
		.ctitle{
			font-weight: 550;
		}
		
		.reviewImg{
		 	height:100%;
		 	background-size: cover;
		 	background-position: center;
		 	width : 100%;
		 	background-color: beige;
		} 
		
		#bestDiv_2 {
			position: absolute;
			left: 50%;
			transform: translate(-50%);
		}
		
    </style>
</head>

<body style="width:1200px; margin:auto; padding-top: 140px;">
    <jsp:include page="../common/menubar.jsp" />

    <main class="site-main" style="margin-top: 60px;">
		<jsp:include page="../club/clubMenubar.jsp"/>
		
        <!-- ================ 1.인기 독서모임 ================= -->
		<section>  <!-- class="section-margin calc-60px" -->
			<div class="container">
				<div class="section-intro mainTitle">
					<p>책구메이트에서 가장 인기있는 독서모임들</p>
					<h2>
						<span class="section-intro__style">인기</span> 독서모임
					</h2>
				</div>
				
				<div style="padding: 20px 20px 50px; background-color: #d9e7db;">
					<c:if test="${fn:length(popList) > 0}">
					
						<div class="popTotal_1" style="background-color: white; padding: 20px; min-height: 910px;">
							
							<c:set var="length" value="0" />
							<c:forEach var="i" begin="0" end="${fn:length(popList)-1}" step="6">
							
								<div id="popTotal_2${i}" class="popTotal_2" <c:if test="${i != 0}">style="display: none;"</c:if> > 
									<c:forEach var="list" items="${popList}" begin="${i}" end="${i+5}">
									
										<div class="popOne" onclick="goDetail(${list.clubNo})" >
											<input type="hidden" value="${list.clubNo}">
											<div class="image" style="height:280px;">
												<c:forEach items="${list.clubAttachments}" var="ca">
													<div class="titleBackImg" style="background-image: url('${pageContext.servletContext.contextPath }/resources/upload_files/club_img/${ca.changeName}')"></div>
												</c:forEach>
											</div>
											<div class="contents">  
												<ul class="card-blog__info"> 
													<li>${list.category}&nbsp; [ ${list.onoffLine} ]</li>
													<li><i class="ti-comments-smiley"></i> ${list.heartCount} Likes</li>
												</ul>
												<h4 class="ctitle">${list.clubTitle}</h4> 
												<p>
													<c:forEach items="${list.clubTimes}" var="at" varStatus="s_at">
		                                 		
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
			                                   	     시작 : ${firstStart} &nbsp; | <span>${fn:length(list.clubTimes)}</span>번
												</p>
											</div>
										</div>
									</c:forEach>
								</div>
								
								<c:set var="length" value="${length+1}" />
								
							</c:forEach>
						</div>
						
						<div id="bestDiv_2" style="cursor: pointer">
							<c:forEach var="pg" begin="1" end="${length}">
								<c:if test="${pg eq 1}">
									<a onclick="goBest(${pg}, ${length})"><i id="click${pg}" class="far fa-circle"></i></a>
								</c:if>
								<c:if test="${pg ne 1}">
									<a onclick="goBest(${pg}, ${length})"><i id="click${pg}" class="fas fa-circle"></i></a>
								</c:if>
							</c:forEach>
						</div>
						
					</c:if>
				</div>
			</div>
		</section>


		<!-- ================ 2. 분야별 독서모임 확인  ================= -->
		<section class="section-margin calc-60px">
			<div class="container">
				<div class="section-intro mainTitle">
					<p>분야별 독서모임을 확인해보세요</p>
					<h2>
						<span class="section-intro__style">분야별</span> 독서모임
					</h2>
				</div>

				<!-- 카테고리별 헤더 만들기 -->
				<ul class="navbar" style="width: 100%; background-color: #d9e7db;">
					<li class="nav-item">
						<h5 class="clickCategory"><a>인문/과학/심리</a></h5>
					</li>
					<li class="nav-item">
						<h5 class="clickCategory"><a>문학/에세이</a></h5>
					</li>
					<li class="nav-item">
						<h5 class="clickCategory"><a>예술/음악</a></h5>
					</li>
					<li class="nav-item">
						<h5 class="clickCategory"><a>경영/경제/마케팅</a></h5>
					</li>
					<li class="nav-item">
						<h5 class="clickCategory"><a>글쓰기</a></h5>
					</li>
					<li class="nav-item">
						<h5 class="clickCategory"><a>강연</a></h5>
					</li>
				</ul>

				<div class="row" id="categoryList1" style="display: none; padding: 70px;">
					<p style="text-align: center; font-size:20px; font-weight: 550;">해당 카테고리에 진행중인 독서모임이 없습니다.</p>
				</div>

				<div class="row popTotal_2" id="categoryList" style="margin-top:10px;">
					<c:forEach begin="0" end="5" varStatus="s">
						<div id="c_clubTotal${s.index}" class="col-md-6 col-lg-4 mb-4 pointer" style="display: none;">
							<input id="c_clubNo${s.index}" type="hidden" value="22">
							<div class="image" style="height:250px;">
								<div id="c_clubImg${s.index}" class="titleBackImg"></div> 
							</div>
							<div class="contents">
								<ul class="card-blog__info">
									<li><span id="c_category${s.index}">22</span> &nbsp; <span id="c_onoffLine${s.index}">[22]</span></li>
									<li><i class="ti-comments-smiley"></i> <span id="c_heartCount${s.index}"> Likes</span></li>
								</ul>
								<h4 id="c_title${s.index}" class="card-blog__title ctitle">독서모임 제목</h4>
								<p>
		                                                           시작 : <span id="c_startDate${s.index}"></span>&nbsp; | <span id="c_manyTimes${s.index}"></span>번
								</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>

		<!-- ================ 3. 마감임박 독서모임 ================= -->
		<section class="section-margin calc-60px">
			<div class="container">
				<div class="section-intro mainTitle">
					<p>마감이 임박한 독서모임</p>
					<h2>
						<span class="section-intro__style">마감 임박</span> 독서모임
					</h2>
				</div>
				
				<c:if test="${fn:length(endList) > 0}">
					<div class="popTotal_1" style="background-color: white; padding: 20px; height: 550px; position:relative;">
						
						<c:set var="length" value="0" />
						<c:forEach var="i" begin="0" end="${fn:length(endList)-1}" step="3">
							<div id="endTotal_2${i}" class="popTotal_2" <c:if test="${i != 0}">style="display: none;"</c:if> > 
								
								<c:forEach var="list" items="${endList}" begin="${i}" end="${i+2}">	
								<div class="popOne" onclick="goDetail(${list.clubNo})" >
									<div class="image" style="height:280px;">
										<c:forEach items="${list.clubAttachments}" var="ca">
											<div class="titleBackImg" style="background-image: url('${pageContext.servletContext.contextPath }/resources/upload_files/club_img/${ca.changeName}')"></div>
										</c:forEach>
									</div>
									<div class="contents">  
										<ul class="card-blog__info"> 
											<li>${list.category}&nbsp; [ ${list.onoffLine} ]</li>
											<li><i class="ti-comments-smiley"></i> ${list.heartCount} Likes</li>
										</ul>
										<h4 class="ctitle">${list.clubTitle}</h4> 
										<p>
											<c:forEach items="${list.clubTimes}" var="at" varStatus="s_at">
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
		                                   	 시작 : ${firstStart} &nbsp; | <span>${fn:length(list.clubTimes)}</span>번
										</p>
									</div>
								</div>
							  </c:forEach>	
							</div>
							<c:set var="length" value="${length+1}" />
						</c:forEach>
						<i onclick="goEnd(1,  ${length})" id="endArrow_left" class="fas fa-chevron-left"></i>
						<i onclick="goEnd(2, ${length})" id="endArrow_right" class="fas fa-chevron-right"></i>
					</div>
				</c:if>
			</div>
		</section>

		<script>
			var endPg = 1; //마감임박 독서모임 움직이기
			
			var origin = 0;
			
			$(document).ready(function(){ 
				 //menu v2 
				 $(".menu-v2").mouseover(function(){ $(this).children(".submenu").show(200); }); 
				 $(".menu-v2").mouseleave(function(){ $(this).children(".submenu").hide(200); }); 
				 
				 //출처: https://contentstoaster.tistory.com/6 [Contents Toaster]
			});

				
			$(function() {
				$(".pointer").click(function() {
					console.log($(this).children(":first").val());
					location.href = "detail.cl?clubNo="+ $(this).children(":first").val();
				});
			})
			
			function goDetail(clubNo){
				console.log("번호 안들어와? " + clubNo)
				location.href = "detail.cl?clubNo="+ clubNo;
			}

			$(".clickCategory").click(function() {
				var category = $(this).text();

				$.ajax({
					url : "categoryList.cl",
					data : {
						category : category
					},
					type : "get",
					success : function(list) {
						console.log("ajax 통신성공");

						var listView = document.getElementById("categoryList");   //리스트 뿌리는 곳
						var listView1 = document.getElementById("categoryList1"); //없습니다.
						var intro;
						
						if (list.length == 0) { 			//1.리스트 빈 경우
							console.log("리스트 빈 값");
							listView.style.display = 'none';
							listView1.style.display = 'block';
						} else { 							//2. 리스트 값 있는 경우
							$.each(list,function(i) {
						
								$('#c_clubImg'+i).css("background-image","url(${pageContext.servletContext.contextPath }/resources/upload_files/club_img/"+list[i].clubAttachments[0].changeName+")");
								$('#c_clubNo'+ i).val(list[i].clubNo);
								$('#c_category'+ i).text(list[i].category);
								$('#c_onoffLine'+ i).text(list[i].onoffLine);
								$('#c_title'+ i).text(list[i].clubTitle);
								$('#c_heartCount'+ i).text(list[i].heartCount + ' Likes');

								if (list[i].intro.length > 61) {
									intro = (list[i].intro).substring(0,60)+ '...';
								} else {
									intro = list[i].intro;
								}

								var dateCount = 0;
								var startD;
											
								for(var ct of list[i].clubTimes){
												
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
								$('#c_manyTimes'+i).text(list[i].clubTimes.length);
								$('#c_clubTotal'+ i).css('display','block'); //none풀어주기

							})
							listView1.style.display = 'none';
							listView.style.display = 'flex';

							for (var i = list.length; i < 6; i++) {
								$('#c_clubTotal' + i).css('display','none');  //6개 모두 보이면 안되고 길이만큼 보여야 하기때문
							}
						}
					},error : function() {
						console.log("ajax 통신실패")
					}
				})
			})

			//마감임박 독서모임 움직이기
			function goEnd(type, length){
				if(type == 1){ //이전으로
					if(endPg == 1){
						endPg = length;
					}else{
						endPg--;
					}
				}else{//앞으로
					if(endPg == length){
						console.log("ddddd")
						endPg = 1;
					}else{
						endPg++;
					}
				}

				for(var i=1; i<=length; i++){
					var index = (i-1)*3;
					if(i == endPg){
						$('#endTotal_2'+index).css('display','flex');
					}else{
						$('#endTotal_2'+index).css('display','none');
					}
				}
			}
			
			//베스트 독서모임 움직이기
			function goBest(pg, length){
				for(var i=1; i<=length; i++){
					var index = (i-1)*6;
					if(i == pg){
						console.log("pg : " + pg)
						console.log("index : " + index)
						$('#popTotal_2'+index).css('display','flex');
						$("#click"+i).attr("class","far fa-circle");
					}else{
						console.log("pg : " + pg)
						console.log("index : " + index)
						$('#popTotal_2'+index).css('display','none');
						$("#click"+i).attr("class","fas fa-circle");
					}
				}
			}

		</script>

		<!-- ================ Best Selling item  carousel end ================= -->


                <!-- ================ trending product section 삭제 ================= -->
                <section class="calc-60px">
                    <div class="container">
                        <div class="section-intro mainTitle">
                            <p>책구메이트 회원들이 남긴 최신 독서후기를 확인해보세요</p>
                            <h2><span class="section-intro__style">최신</span> 독서모임 후기</h2>
                        </div>

						<c:forEach items="${reviewList}" var="cr">
							<div class="row reviewTable">
	                            <div class="tableThumb">	
	                            	<c:if test="${cr.reviewPhoto ne ''}">
	                            		<div class="card-img reviewImg" style="background-image: url('resources/upload_files/club_img/${cr.reviewPhoto}'); cursor:pointer;" onclick="goDetail(${cr.refClubNo})"></div>
	                            	</c:if>
	                            	<c:if test="${cr.reviewPhoto eq ''}">
	                            		<div class="card-img reviewImg" style="background-image: url('resources/upload_files/club_img/${cr.reviewPhoto}'); cursor:pointer;" onclick="goDetail(${cr.refClubNo})"></div>
	                            	</c:if>
	                            </div>
	                            <div class="tableTitle">
	                                <div>
	                                	<c:forEach begin="0" end="${cr.reviewRate/2 -1}">
	                                		<img src="${pageContext.servletContext.contextPath }/resources/img/rateFull.png" style="width:20px; margin:10px 1px;">
	                                	</c:forEach>
									</div>
	                                <div style="font-size: 17px;">${cr.reviewContent}</div>
	                                <div style="margin-top: 15px;">
	                                    <span>${cr.reviewWriter}</span>&nbsp; | &nbsp;
	                                    <span>${cr.createDate}</span>
	                                </div>
	                            </div>
	                        </div>
						</c:forEach>
                        

                    </div>
                </section>
                <!-- ================ trending product section end ================= -->
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