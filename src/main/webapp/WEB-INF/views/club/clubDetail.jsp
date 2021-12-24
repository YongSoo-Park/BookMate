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
    <title>독서모임 - 상세페이지</title>
    <link rel="icon" href="resources/img/logo1.png" type="image/png">
    <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="resources/vendors/linericon/style.css">
    <link rel="stylesheet" href="resources/vendors/nice-select/nice-select.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">

    <link rel="stylesheet" href="resources/css/style.css">

    <style>
        .total p {
            padding-top: 0px !important;
            border-top: 0px !important;
            border-bottom: 0px !important;
            margin-top: 0px !important;
            padding-bottom: 0px !important;
        }
        
        .times {
            border: 1px solid #bebebe;
            display: flex;
            align-items: center;
            width: 100%;
        }
        
        .left {
            flex: 0 0 auto;
            margin: 16px 40px;
        }
        
        .right {
            flex: 1 1 auto;
            display: flex;
        }
        
        .applys {
            zoom: 1.5;
            margin: auto;
        }
        
        .detail_title1 {
            font-size: 32px;
            font-weight: 900;
            color: #FFAE42;
            margin-top: 70px;
    		margin-bottom: 20px;
        }
        
        .detail_title2 {
            font-size: 22px;
            font-weight: bold;
            margin: 40px 0px 20px;
        }
        
        .left_1 {
            width: 20%;
            float: left;
            box-sizing: border-box;
            margin-left: 5%;
    		margin-top: 2%;
        }
        
        .right_1 {
            width: 70%;
            margin: auto 0;
            box-sizing: border-box;
        }
        
        .titleDiv{
	        width: 100%;
		    height: 100%;
		   /*  background-color: #D5C4A2; */
	    }
	    
	    .titleBackImg{
	    	background-size: cover;
		    width: 100%;
		    height: 100%;
		    background-position: center center;
	    }
	    
	    .heartImg{
	    	position: absolute;
		    bottom: 4%;
		    right: 8%;
		    width: 10.5%;
		    cursor: pointer;
	    }
	    .m_contents{
	    	margin: 40px 0px 100px;
	    }
	    
		.reviewPhotos{
			width: 120px;
		    height: 120px;
		    background-size: cover;
		    background-position: center;
		}
		
		.reviewTable{
			display: table;
			width: 100%;
			border-bottom: 1px solid #dee2e6;
		}
						
		.reviewTableCell1{
			display: table-cell; 
			width: 75%;
			padding: 5px 15px 15px;
		}
		.reviewTableCell2{
			display: table-cell; 
			width: 25%;
			padding-left: 4%
		}
		
		.timeTotal2{
			overflow: auto;
		    height: 248px;
		    background-color: white;
		    margin: 0 auto;
		}
		
		#applyClub{
			background-color: #503535 !important;
		    border: 0px !important;
		    border-radius: 5px !important;
		    padding: 12px 30px !important;
		    width: 100%;
		    color:white;
		}
		
		.navbarMenu{
		    width: 33.3%;
		    text-align: center;
		    font-size: 18px;
		    font-weight: 550;
		}
		
		.tab-content p{
			font-size: 18px;
		}
		
		#hostP{
			background-size: cover;
		    background-position: center;
		    height: 250px;
		    width: 250px;
		    border-radius: 50%;
		}
		
		.detail_host_2{
		    padding: 30px 40px 0px;
		    border: 1px solid #dadada;
		    margin-left: 25px;
		}
		
		.reviewQnaBtn{
		    background-color: #503535;
		    color: white;
		    border: 0px;
		    border-radius: 5px;
		    padding: 5px 15px;
		    margin-bottom: 15px;
		}
    </style>
</head>

<body style="width:1200px; margin:auto">
    
    <jsp:include page="../common/menubar.jsp" />

    <!--================ 독서모임 디테일 =================-->
    <div class="product_image_area" style="margin-top: 100px;">
    	<jsp:include page="../club/clubMenubar.jsp"/>
        
        <div class="container" style="padding-top: 30px; padding-bottom: 30px;">
            <div class="row s_product_inner">
                <div class="col-lg-5">
                    <div class="titleDiv">
                        <c:forEach var="ca" items="${club.clubAttachments}">
                        	<c:if test="${ca.fileType eq 2}">
                        		<div class="titleBackImg" style="background-image: url('${pageContext.servletContext.contextPath }/resources/upload_files/club_img/${ca.changeName}')">
                        			<c:choose>
                        				<c:when test="${befHeart eq 0}">
                        					<img  id="heartClub" class="heartImg" src="resources/img/club/hearts_empty.png">
                        				</c:when>
                        				<c:otherwise>
                        					<img  id="heartClub" class="heartImg" src="resources/img/club/hearts_full.png">
                        				</c:otherwise>
                        			</c:choose>
                        		</div>
                        	</c:if>         		
                        </c:forEach> 
                    </div>
                </div>
                <div class="col-lg-6 offset-lg-1">
                    <div class="s_product_text total" style="margin-top:0px">
                    	<input type="hidden" id="clubNo" value="${club.clubNo}">
                        <h3 style="font-size: 37px;">${club.clubTitle}</h3>
                        <h2 style="font-size: 17px;">#${club.category} &nbsp; #${club.onoffLine} &nbsp; #${club.times} </h2>
	
						<hr> 
						
						<div class="timeTotal" style="background-color: #d1e7d1; padding: 10px;">
							<div class="timeTotal2">
								<c:forEach var="ct" items="${club.clubTimes}" varStatus="status">
									<div class="times">
		                            <div class="left">
		                                <p class="time" style="font-weight:580;">
		                                    <span>
		                                    	<fmt:parseDate var="clubD" value="${ct.clubDate}" pattern="yyyy-MM-dd" /> <!-- string -> Date로 -->	
												<fmt:parseDate value="${ct.clubDate}" var="dateK" pattern="yyyy-MM-dd"/>
												<fmt:formatDate value="${dateK}" pattern="yyyy년 MM월 dd일"/>
		                                    	(<fmt:formatDate value="${clubD}" pattern="E"/>)
		                                    	</span>
		                                    <span>&nbsp;|&nbsp;</span>
		                                    <span>
		                                    <c:if test="${fn:length(ct.startTime) > 3}">
				                           		${ct.startTime} ~ ${ct.endTime}<br>
				                            </c:if>
				                            <c:if test="${fn:length(ct.startTime) <= 2}">
				                                ${ct.startTime}:00 ~ ${ct.endTime}:00<br>
				                            </c:if>
		                                    </span>
		                                </p>
		                                <p class="apply" style="display:flex">
		                                    <span style="margin-left: auto;">신청 <span id="applyCount${status.index}">${ct.apply_count}</span> / 정원 <span id="clubCapacity${status.index}">${club.clubCapacity}</span></span>
		                                </p>
		                            </div>
		                            <div class="right">
		                            	<c:if test="${club.times eq '한 번 만나요'}">
		                            		<!-- 오늘 날짜 이전은 신청되지 않게 한다. -->
		                            		<fmt:parseDate var="clubDate" value="${ct.clubDate}"  pattern="yyyy-MM-dd"/>
											<fmt:parseNumber value="${clubDate.time / (1000*60*60*24)}" integerOnly="true" var="clubDate1"></fmt:parseNumber>
		                            		
		                            		<jsp:useBean id="today" class="java.util.Date" />
				                            <fmt:formatDate var="today2" value="${today}" pattern="yyyy-MM-dd"/> 
				                            <fmt:parseDate var="now"  value="${today2}" pattern="yyyy-MM-dd"/>
											<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="now1"></fmt:parseNumber>
	
		                            		<c:if test="${ clubDate1 >= now1 }">
		                            			<input type="checkbox" class="applys" id="checkbox${status.index}" name="applys" value="${ct.timeNo}">
		                            		</c:if>	
		                            	</c:if>
		                            	<c:if test="${club.times eq '여러 번 만나요'}">
		                            		<input type="hidden" class="applys" name="applys" value="${ct.timeNo}">
		                            	</c:if>
		                            </div>
		                        </div>
								</c:forEach>
							</div>	
						</div>
						
	                    <div style="text-align: center; margin: 15px 0px 0px;">
	                        <c:choose>
	                        	<c:when test="${club.condition eq 4 }">
	                        		<button id="applyClub" class="">신청하기</button>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<button id="applyClub" class="" disabled>신청불가</button>
	                        	</c:otherwise>
	                        </c:choose>
	                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--================End Single Product Area =================-->

	<section class="club_detail" style="margin-top:40px;">
		<div class="container">
			<ul class="nav nav-tabs">
				<li class="nav-item navbarMenu"><a class="nav-link active" data-toggle="tab" href="#qwe" style="color: black;">상세내용</a></li>
				<li class="nav-item navbarMenu"><a class="nav-link" data-toggle="tab" href="#asd" style="color: black;">모임리뷰</a></li>
				<li class="nav-item navbarMenu"><a class="nav-link" data-toggle="tab" href="#zxc" style="color: black;">문의하기</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade show active m_contents" id="qwe">
					<div class="detail_club">
						<h4 class="detail_title1">모임 소개</h4>
						<p>
							${club.intro}
						</p>
						<h5 class="detail_title2">우리모임에서 할 활동들</h5>
						<p>
							${club.activity}
						</p>
						<h5 class="detail_title2">이런 멤버들을 만나고 싶어요</h5>
						<p>
							${club.want}
						</p>
						<h5 class="detail_title2">이런 분과는 맞지 않아요</h5>
						<p>
							${club.notwant}
						</p>
					</div>

					<div class="detail_onoff">
						<h4 class="detail_title1">참여 안내</h4>
						<p style="font-size: 20px; font-weight: bold; color: #324278;">이 모임은 [<span style="text-decoration: underline; text-underline-position: under;"><c:out value="${club.times}" /></span>]</p>

						<h5 class="detail_title2">모임 일정</h5>
						<ul style="font-size: 18px; margin-bottom: 1rem;">
							<c:forEach var="ct" items="${club.clubTimes}">
								<li><fmt:parseDate var="clubD" value="${ct.clubDate}"
										pattern="yyyy-MM-dd" /> <!-- string -> Date로 --> <fmt:parseDate
										value="${ct.clubDate}" var="dateK" pattern="yyyy-MM-dd" /> <fmt:formatDate
										value="${dateK}" pattern="yyyy년 MM월 dd일" /> (<fmt:formatDate
										value="${clubD}" pattern="E" />) | 
										
										<c:if test="${fn:length(ct.startTime) > 3}">
			                           		${ct.startTime} ~ ${ct.endTime}<br>
			                            </c:if>
			                            <c:if test="${fn:length(ct.startTime) <= 2}">
			                                ${ct.startTime}:00 ~ ${ct.endTime}:00<br>
			                            </c:if>
								</li>
							</c:forEach>
						</ul>
						<h5 class="detail_title2">장소</h5>
						<p><c:out value="${club.onoffLine}" /></p>
						<h5 class="detail_title2">모집 정원</h5>
						<p><c:out value="${club.clubCapacity}" />명</p>
					</div>

					<div class="detail_book">
						<h4 class="detail_title1">함께 읽을 책 소개</h4>
						<div style="width: 100%; height: 250px; background-color:#f8f8f8; display:flex;">
							<div class="left_1">
								<c:forEach var="ca" items="${club.clubAttachments}">
									<c:if test="${ca.fileType eq 3}">
										<div style="background-image: url('resources/upload_files/club_img/${ca.changeName}'); height: 200px; width: 145px; background-size:cover; background-position:center;"></div> 
									</c:if>
								</c:forEach>
							</div>

							<div class="right_1">
								<p style="font-size: 30px; font-weight: 540;"><c:out value="${club.bkName}" /></p>
								<p style="color: gray"><c:out value="${club.bkWriter}" />&nbsp; | &nbsp;<c:out value="${club.bkPublisher}" /> </p>
							</div>
						</div>
					</div>

					<div class="detail_host">
						<h4 class="detail_title1">Host 소개</h4>
						<div class="detail_host_1" style="display:flex; margin-top:30px;">
							<c:forEach var="ca" items="${club.clubAttachments}">
								<c:if test="${ca.fileType eq 1}">
									<div id="hostP" style="background-image: url('resources/upload_files/club_img/${ca.changeName}'); margin: 0% 1.5% 0% 4%;" ></div>
								</c:if>
							</c:forEach>
							<div class="detail_host_2">
								<h5 style="font-size: 28px;font-weight: 600;"><c:out value="${club.hostName}" /></h5>
								<h5 class="detail_title2">이력</h5>
								<P>	
									<c:choose>
										<c:when test="${empty club.hstartDate == true}">
											호스트가 작성한 이력이 없습니다😥							
										</c:when>
										<c:otherwise>
											<c:set var="hstartD" value="${fn:split(club.hstartDate, ',')}"/>
											<c:set var="hendD" value="${fn:split(club.hendDate, ',')}"/>
											<c:set var="hwhatTodo" value="${fn:split(club.hwhatTodo, '|')}"/>

											<c:forEach var="i" begin="0" end="${fn:length(hstartD)-1}" varStatus="status">
												${hstartD[i]} ~ ${hendD[i]} ${hwhatTodo[i]} <br>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</P>
							</div>
						</div>
						
						<h5 class="detail_title2">Comment</h5>
						<p>${club.hostComment}</p>
					</div>

					<div class="detail_notice">
						<h4 class="detail_title1">책구메이트 독서모임 안내</h4>
						<ol style="padding-left: 20px;">
							<li>모임 신청 후 취소는 모임 전 이틀 전까지 가능합니다.</li>
							<li>온라인 독서모임의 경우 모임시간 15분 전 호스트가 줌 주소를 전송할 것입니다.</li>
							<li>독서모임을 통해 모두 즐거운 시간을 보낼 수 있도록 서로 배려 부탁드립니다.</li>
						</ol>
					</div>
				</div>
				<div class="tab-pane fade m_contents" id="asd">
					<div style="border-bottom: 2px solid gray;">
						<button class="reviewQnaBtn" onclick="checkReview(${club.clubNo})">리뷰 남기기</button>
					</div>
					<ul class="reviewArea"></ul>					
				</div>
				
				<div class="tab-pane fade m_contents" id="zxc">
					<div style="border-bottom: 2px solid gray;">
						<button class="reviewQnaBtn" onclick="insertQnaForm(${club.clubNo})">문의 남기기</button>
					</div>
					
					<table id="qnaTable" class="table table-hover">
						<thead style="text-align: center;">
							<tr>
								<th>상태</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody id="qnaTBody">
						</tbody>
					</table>
				</div>
			</div>
        </div>
    </section>
        
    <!-- The Modal (리뷰) -->
	  <div class="modal" id="myModal">
	    <div class="modal-dialog modal-dialog-centered modal-lg">  <!-- modal-dialog-centered : 모달창 화면중앙 -->
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">리뷰 작성</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	      <form id="reviewEnrollForm" action="insertReview.cl" method="post" enctype="multipart/form-data">
	        <div class="modal-body">
	          <div class="content_scroll" style="overflow: auto; max-height:400px;">
	          	<input type="hidden" id="refClubNo_review" name="refClubNo" value="${club.clubNo }">
	          	<input type="hidden" id="reviewRate" name="reviewRate" value="10">

	          	<div style="margin-bottom:20px;">
                    <span style="font-weight: bold;">리뷰 평점</span> - 독서모임에 대해 평점을 선택해 주세요<br>
                    <img src="${pageContext.servletContext.contextPath }/resources/img/rateFull.png" style="width:35px;" alt="" id="scoreImg_1" onclick="reviewScore(1)" > 
                    <img src="${pageContext.servletContext.contextPath }/resources/img/rateFull.png" style="width:35px;" id="scoreImg_2" alt="" onclick="reviewScore(2)" > 
                    <img src="${pageContext.servletContext.contextPath }/resources/img/rateFull.png" style="width:35px;" id="scoreImg_3" alt="" onclick="reviewScore(3)" >
                    <img src="${pageContext.servletContext.contextPath }/resources/img/rateFull.png" style="width:35px;" alt=""  id="scoreImg_4" onclick="reviewScore(4)" > 
                    <img src="${pageContext.servletContext.contextPath }/resources/img/rateFull.png" style="width:35px;" id="scoreImg_5" alt="" onclick="reviewScore(5)" >
                </div>

	          	<textarea id="reviewContent" name="reviewContent" class="form-control" rows="10" style="resize: none;" placeholder="리뷰를 작성해주세요"></textarea>
	          	<input type="file" id="rPhoto" name="rPhoto" class="must" onchange="imgCheck(this,'reviewPhoto')"> <br>
	          	<img alt="" src="" id="prereviewPhoto">
	          </div>
	        </div>
		  </form>
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <a class="btn btn-primary" onclick="insertReview()">리뷰작성!</a>
	        </div>
	      </div>
	    </div>
	  </div>
	  
	  
	 <!-- The Modal (qna) -->
	  <div class="modal" id="qnaModal">
	    <div class="modal-dialog modal-dialog-centered modal-lg">  <!-- modal-dialog-centered : 모달창 화면중앙 -->
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title" style="padding-right: 10px;">문의</h4>
	          <img style="width:25px;" src="${pageContext.servletContext.contextPath }/resources/img/club/lock.png">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	      <form id="qnaEnrollForm" action="insertQna.cl" method="post">
	        <div class="modal-body" style="color:black;">
	          <div class="content_scroll" style="overflow: auto; max-height:400px;">
	          	<input type="hidden" id="refClubNo_qna" name="refClubNo" value="${club.clubNo }">
	          	<input type="hidden" id="userId_qna" name="userId" value="${ loginUser.userId }">
	          	<div style="font-size:22px; margin-bottom: 30px;"><c:out value="${club.clubTitle}"/></div>
				<input type="text" id="qnaTitleInsert" name="qnaTitle" maxlength="30" style="margin-bottom: 15px; width: 100%; border: 0px; border-bottom: 1px solid gray;" placeholder="문의 제목(최대30자)"> 
	          	<textarea maxlength="200" id="qnaContentInsert" name="qnaContent" class="form-control" rows="7" style="resize: none;" placeholder="내용을 입력해주세요(최대 200자)"></textarea>
	          </div>
	        </div>
		  </form>
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <a class="btn btn-primary" onclick="insertQna()">문의작성</a>
	        </div>
	      </div>
	    </div>
	  </div>
	  
	  <!-- The Modal (answer) -->
	  <div class="modal" id="answerModal">
	    <div class="modal-dialog modal-dialog-centered modal-lg">  <!-- modal-dialog-centered : 모달창 화면중앙 -->
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header" style="padding: 15px 15px 0px">
	        	<div>
	        		<h4 id="qnaTitle" class="modal-title">문의 제목입니다.</h4>
	        		<div>
		          		<label id="qnaWriter" style="font-size:18px;"></label> &nbsp;
			          	<label id="qnaDate" style="font-size:15px;"></label> &nbsp;&nbsp;
			          	<label id="qnaDelBtn" onclick="qnaDel(1)" style="font-size:18px; cursor: pointer; text-decoration: underline; text-underline-position:under"></label>
		          	</div>
	        	</div>
	          	
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	      <form id="qnaAnswerForm" action="insertQnaAnswer.cl" method="post">
	        <div class="modal-body" style="color:black;">
	          <div class="content_scroll" style="overflow: auto; max-height:400px;">
	          	<input type="hidden" id="qnaNoForAnswer" name="qnaNo">  <!-- 각 문의를 클릭하여 모달창 열었을 때 해당 문의의 qnaNo -->
	          	<input type="hidden" id="qnaAnswerUser" name="userId">  <!-- 각 문의를 클릭하여 모달창 열었을 때 해당 문의의 Writer작성자 -->
	          	<div id="qnaContent" style="margin: 15px 0px 50px;">안녕하세요 제가 꼭 참여를 하고 싶은데 시간대가 참여하기 힘든 시간대더라구요 혹시 시간대 변경안되려나요? 답변 부탁드립니다!!</div>
	          	<hr> 
	          	<div id="hostAnswer">
	          		<div id="answerContent_bef">
	          			<p id="answerContent" style="margin: 20px 0px 20px;"></p>
	          			<span id="answerDate" style="text-align: right"></span> &nbsp;
	          			<label id="qnaAnswerDelBtn" onclick="qnaDel(2)" style="text-align: right; font-size:18px; cursor: pointer; text-decoration: underline; text-underline-position:under"></label>
	          		</div>
	          		<div id="answerBox" style="position: relative;">
	          			<textarea maxlength="200" id="qnaAnswerContent" name="qnaAnswerContent" class="form-control" rows="5" style="resize: none;" placeholder="답변을 입력해주세요(최대 200자)"></textarea>
	          			<button type="button" onclick="giveQnaAnswer()" style="position: absolute; bottom: 8%; right: 2%;">작성</button>
	          		</div>
	          	</div>
	          </div>
	        </div>
		  </form>
	      </div>
	    </div>
	  </div>
    
    <script>
    	var userId = '<c:out value="${ loginUser.userId }"/>';
    	var c_host = '<c:out value="${club.userId}"/>';
    	
    	$(function(){
    		selectReviewList();  //처음 로딩됐을때 리뷰 화면에 붙이기
    		selectQnaList();  //처음 로딩됐을때 문의 화면에 붙이기
    	}) 
    	
    	//qna 리스트 화면에 붙이기
    	function selectQnaList(){
    		var clubNo = ${club.clubNo};
    		
    		$.ajax({
    			url:"selectQnaList.cl",
    			data:{
    				clubNo : clubNo
    			},
    			type : "get",
    			success:function(list){
    				if(list.length == 0){
    					$('#qnaTable').css('display','none');
    					return;
    				}
    				$('#qnaTable').css('display','table');
    				var result ="";
    				$.each(list, function(i){
    					result += '<tr>';
    					if(list[i].qnaAnswer == 'N'){
    						result += '<td style="text-align: center;">답변 대기중</td>';
    					}else{
    						result += '<td style="text-align: center;">답변완료</td>';
    					}
    					result += '<td style="cursor: pointer;" onclick="openAnswer('+list[i].qnaNo +','+"'"+list[i].userId+"'"+','+"'"+list[i].qnaAnswer+"'"+')">비밀글입니다.</td>'
    					result += '<td style="text-align: center;">'+list[i].userId+'</td><td style="text-align: center;">'+list[i].createDate+'</td></tr>'
    				})
    				
    	            $("#qnaTBody").html(result);
    			},error:function(){
    				console.log("ajax통신오류")
    			}
    		})
    	} 
    	
    	//qna form 띄우기
    	function insertQnaForm(clubNo){
    		if(userId == ''){
				alert("로그인 후 이용 부탁드립니다");
				return;
			}else if(userId == c_host){
				alert("독서모임 개설자는 문의를 남길 수 없습니다.");
				return;
    		}else{
				if(confirm('문의를 작성하시겠습니까?')){
					$('#qnaModal').modal("show");
				}
			}
    	}
    	
    	//qna 작성하기
    	function insertQna(){
    		
    		var form1 = $("#qnaEnrollForm").serialize();
			$.ajax({
				url:"insertQna.cl",
				data: form1,
				type : "post",
				success:function(result){
					console.log("ajax 통신 완료");
					$('#qnaModal').modal("hide");
					alert("문의가 등록되었습니다.");
					//문의 모달창 비워주기
					$('#qnaTitleInsert').val("");
					$('#qnaContentInsert').val("");
					
					selectQnaList();
				}, error:function(result){
					console.log("ajax 통신 실패")
				}
			});
		}
    	
    	//qna 상세 모달창 열기
    	function openAnswer(qnaNo, writer, qnaAnswer){

    		if(userId != writer && userId != c_host){
    			alert("비밀글입니다. 작성자만 읽을 수 있습니다.");
    			return;
    		}else if(userId == c_host || userId == writer){  //1.현재로그인유저=호스트 OR 2.현재로그인유저=WRITER
    			
    			$.ajax({
					url:"selectQna.cl",
					data:{
						qnaNo : qnaNo
					},
					type : "get",
					success:function(qna){						
						$('#qnaTitle').text(qna.qnaTitle);
						$('#qnaWriter').text(qna.userId);
						$('#qnaDate').text(qna.createDate);
						$('#qnaContent').text(qna.qnaContent);
						$('#qnaNoForAnswer').val(qna.qnaNo);  //답변 작성 시 들고가려고
					
						console.log("userId : " + userId)
						console.log("writer : " + writer)
						console.log("c_host : " + c_host)
						
						if(qnaAnswer == 'Y'){
							$('#answerContent_bef').css('display','block');
							$('#answerContent').text(qna.qnaAnswerContent);
							$('#answerDate').text(qna.answerDate);
		    				$('#answerBox').css('display','none');
		    			}else{
		    				console.log("11")
		    				$('#answerContent_bef').css('display','none');
		    				if(userId == c_host){
		    					console.log("22")
		    					$('#answerBox').css('display','block');
		    				}else{
		    					console.log("33")
		    					$('#answerContent_bef').css('display','none');
		    					$('#answerBox').css('display','none');
		    				}	    				
		    			}
						
						if(userId == $('#qnaWriter').text()){
			    			$('#qnaDelBtn').text("삭제");
			    		}else{
			    			$('#qnaAnswerDelBtn').text("삭제");
			    		}
		    			$('#answerModal').modal("show");
					
					},error:function(){
						console.log("ajax 통신 실패")
					}
				})
    		}
    	}
    	
    	//qna answer 작성하기
    	function giveQnaAnswer(){
    		$('#qnaAnswerUser').val(userId); //현재 로그인된 id, 즉 호스트 id
    		var form1 = $("#qnaAnswerForm").serialize();
    		
			$.ajax({
				url:"insertQnaAnswer.cl",
				data: form1,
				type : "post",
				success:function(result){
					console.log("ajax 통신 완료");
					$('#answerModal').modal("hide");
					alert("답변이 등록되었습니다.");
					$('#qnaAnswerContent').val("");  //작성 후 다른 답글을 달기위해 클릭하면 textArea에 이전에 작성한 글이 들어가있어서 이렇게 수정함
					selectQnaList();
					
				}, error:function(result){
					console.log(result)
					console.log("ajax 통신 실패");
				}
			});
		}
    	
    	//문의qna 삭제하기
    	function qnaDel(type){
    		var qnaNo = parseInt($('#qnaNoForAnswer').val());  //모달창 열때 qnaNo 넣어두었음
    		
    		if(type == 1){
    			if(!confirm("문의를 삭제하시겠습니까?")){
    				return;
    			}
    		}else{
    			if(!confirm("문의 답변을 삭제하시겠습니까?")){
    				return;
    			}
    		}
    		$.ajax({
				url:"deleteQna.cl",
				data:{
					qnaNo : qnaNo,
					type : type
				},
				type: "post",
				success:function(result){
					console.log("ajax 통신 완료");
					$('#answerModal').modal("hide");
					
					if(type == 1){
						alert("문의가 삭제되었습니다.");
					}else{
						alert("문의답변이 삭제되었습니다.");
						//답변 삭제 후 (1)답변창 안보이게하기 (2)답변등록창 보이게하기
						$('#answerContent_bef').css('display','none');
						$('#answerBox').css('display','block');	
						$('#qnaAnswerContent').val("");
					}
					selectQnaList(); 
						
				},error:function(){
					console.log("ajax 통신 실패")
				}
			})   		
    	}

    	
    	
    	//리뷰작성
	    function insertReview() {
	        var form = $('#reviewEnrollForm')[0];
	        // FormData 객체 생성
	        var formData = new FormData(form);
	
	        $.ajax({
	            type: "POST",
	            enctype: 'multipart/form-data',
	            url: "insertReview.cl",
	            data: formData,
	            processData: false,
	            contentType: false,
	            cache: false,
	            timeout: 600000,
	            success: function (result) {
	                
	                $('#myModal').modal("hide"); //모달창 닫기
	                alert("감사합니다! 리뷰가 등록되었습니다.");
	                
	                selectReviewList();
	            },
	            error: function (e) {
	                console.log("ERROR : ", e);
	            }
	        });
	    }

    	//리뷰리스트 화면에 붙이기
    	function selectReviewList(){
    		var clubNo = ${club.clubNo};
    		
    		$.ajax({
    			url:"selectReview.cl",
    			data:{
    				clubNo : clubNo
    			},
    			type : "get",
    			success:function(list){
    				
    				var result ="";
    				$.each(list, function(i){
    					result += '<li><div class="reviewTable" onclick="openReview('+i+')"> <div class="reviewTableCell1">'
						result += '<input type="hidden" id="reviewPhotoName'+i+'" value="'+list[i].reviewPhoto+'">'
    					for(var j=1; j<=list[i].reviewRate; j+=2){
    						result += '<img src="${pageContext.servletContext.contextPath }/resources/img/rateFull.png" style="width:20px; margin:10px 1px;">'
    					}   
    					result += '<br>'+list[i].reviewContent  
    					
    					var imgSrc = list[i].reviewPhoto
    					if(list[i].reviewPhoto != null){
    						result += '<div id="reviewPhotos1_'+i+'" class="reviewPhotos" style="background-image: url(\'${pageContext.servletContext.contextPath }/resources/upload_files/club_img/'+list[i].reviewPhoto+'\')"></div>'
    						result += '<img id="reviewPhotos2_'+i+'" style="width:500px; display:none;" src="${pageContext.servletContext.contextPath }/resources/upload_files/club_img/'+list[i].reviewPhoto+'">'
    					}
    					result += '</div><div class="reviewTableCell2">' + list[i].reviewWriter+'<br>'+ list[i].createDate
    					
    					if(userId == list[i].reviewWriter){
    						result += '<div onclick="delReview('+i+')">삭제하기</div>'
    					}
    					result += '</div></div></li>'
    				})
    	            $(".reviewArea").html(result);
    				
    			},error:function(){
    				console.log("ajax통신오류")
    			}
    		})
    	} 
    	
    	//리뷰 클릭시 사진 크게 보여주기 
    	function openReview(i){
    		if($("#reviewPhotos2_"+i).css('display')=='none'){
    			$("#reviewPhotos1_"+i).css('display','none');
        		$("#reviewPhotos2_"+i).css('display','block');
    		}else{
    			$("#reviewPhotos1_"+i).css('display','block');
        		$("#reviewPhotos2_"+i).css('display','none');
    		}
    	}
    	
    	function reviewScore(num) {
            for(var i=1;i<=5;i++){
                $('#scoreImg_'+i).attr('src',"${pageContext.servletContext.contextPath }/resources/img/rateFull.png")
                if(i>num){
                    $('#scoreImg_'+i).attr('src',"${pageContext.servletContext.contextPath }/resources/img/rateEmpty.png")
                }
            }
            $('#reviewRate').val(num*2);
        }

    	//리뷰 삭제
    	function delReview(i){
    	   var clubNo = ${club.clubNo};
    	   console.log(i);
    	   var fileName = $('#reviewPhotoName'+i).val()
    	   
    	   if(confirm("리뷰를 삭제하시겠습니까?")){
    		   $.ajax({
        		   url: "deleteReview.cl",
        		   data:{
        			   clubNo : clubNo,
        			   userId : userId,
        			   fileName : fileName
        		   },
        		   type: "post",
        		   success:function(result){
        			   console.log("ajax 통신완료");
        			   alert("리뷰가 삭제되었습니다.")
        			   selectReviewList();
        		   },error:function(){
        			   console.log("ajax 통신실패");
        		   }
        	   })
    	   }
        }

    	//리뷰작성 전 체크
	    function checkReview(clubNo){
			console.log("clubNo : " + clubNo);
			
			if(userId == ''){
				alert("로그인 후 이용 부탁드립니다");
				return;
			}
			
			if(userId == c_host){
				alert("독서모임 개설자는 리뷰를 남길 수 없습니다.");
				return;
			}
			
			//1.참여한 적 있는지 확인하기
			$.ajax({
				url:"checkReview.cl",
				data:{
					clubNo : clubNo,
					userId : userId
				},
				type : "get",
				success:function(result){
					if(result == 'fail'){
						alert("이 모임에 참여하신 적이 없습니다. 참여하신 후 리뷰 부탁드려요~");
						return;
					}else{
						if(result == '0'){
							if(confirm('참여하신 적이 있는 모임입니다! 리뷰를 쓰시겠습니까?')){
								$('#myModal').modal("show");							
							}
						}else{
							alert("이미 리뷰를 작성하셨습니다.")
						}
					}
				}, error:function(){
					
				}
			})
		};
	    
	    //리뷰작성
	    function insertReview() {
	        var form = $('#reviewEnrollForm')[0];
	        // FormData 객체 생성
	        var formData = new FormData(form);
	
	        $.ajax({
	            type: "POST",
	            enctype: 'multipart/form-data',
	            url: "insertReview.cl",
	            data: formData,
	            processData: false,
	            contentType: false,
	            cache: false,
	            timeout: 600000,
	            success: function (result) {
	                
	                $('#myModal').modal("hide"); //모달창 닫기
	                alert("리뷰가 등록되었습니다. 포인트 1000점 증정되었습니다!");
	                
	                selectReviewList();
	            },
	            error: function (e) {
	                console.log("ERROR : ", e);
	            }
	        });
	    };
	    
	    //이미지 미리보기
		function imgCheck(img,inputId) {
	    	
	    	if(img.files&&img.files[0]){
	    		var name= img.files[0].name
	    		var ext = name.substring(name.length-3,name.length)
	    		if(!(ext.toUpperCase()=='PNG'||ext.toUpperCase()=='JPG')){
	    			alert("이미지파일을 확인해주세요. png와 jpg만 가능합니다.")
	    			$('#'+inputId).val("")

	    			return;
	    		}
	    		const imgFile = new FileReader();
	    		imgFile.readAsDataURL(img.files[0])
	    		imgFile.onload = function(e) {
	    			const previewMainImage = document.getElementById("pre"+inputId);
	    			previewMainImage.src = e.target.result
	    			if(inputId=='reviewPhoto'){
	    				$('#pre'+inputId).css({"width":"200px","height":"200px"})
	    			}			
	    		}		   
	    	}
	    };
    
		//독서모임 찜하기
    	$("#heartClub").click(function() {
    		var clubNo = $("#clubNo").val();
    		var src = $('#heartClub').attr("src");
    		
    		if(userId == ''){
    			alert("독서모임 찜기능은 로그인 후 이용 부탁드립니다")
    			return;
    		}
    		
    		//1.5 로그인 유저 != 독서모임 작성자 유저
    		if(userId == c_host){
    			alert("독서모임 개설자는 찜할 수 없습니다.")
    			return;
    		}
    		
    		if(src == 'resources/img/club/hearts_empty.png'){
    			//1. 로그인 유저 확인

        		$.ajax({
        			url:"heart.cl",
    				data:{
    					clubNo : clubNo,
    					userId : userId
    				},
    				type : "post",
    				success:function(result){
    					console.log("ajax통신성공");
    					
    					if(result == 'fail'){
    						alert("이전에 찜하기 하신 적 있는 독서모임입니다.");
    					}else{
    						alert("찜목록에 추가되었습니다.");
    						$("#heartClub").attr("src","resources/img/club/hearts_full.png");
    					}
    					
    				},error:function(){
    					console.log("ajax통신실패");
    				}
        		})
        		
    		}else{
    			$.ajax({
        			url:"heartCancle.cl",
    				data:{
    					clubNo : clubNo,
    					userId : userId
    				},
    				type : "post",
    				success:function(result){
    					console.log("ajax통신성공");
    					
    					alert("찜목록에서 삭제되었습니다.");
						$("#heartClub").attr("src","resources/img/club/hearts_empty.png");
    					
    				},error:function(){
    					console.log("ajax통신실패");
    				}
        		})
    		}
    		
		});
    
		//독서모임 신청하기
    	$("#applyClub").click(function(){
    		var clubNo = $("#clubNo").val();
    		var chkApply = true;
    		var indexs = [];  //한번만나요: 사용자가 체크한 status.index / 여러번만나요: 모든status.index -> 이거로 신청인원+1 해줌
    		var times = [];   //한번만나요: 사용자가 체크한 timeNo / 여러번만나요: 모든 timeNo
    		var c_times = '<c:out value="${club.times}"/>'; 
  
    		//1. 로그인 유저 확인
    		if(userId == ''){
    			alert("독서모임 신청은 로그인 후 이용 부탁드립니다")
    			return;
    		}
    		
    		//1.5 로그인 유저 != 독서모임 작성자 유저
    		if(userId == c_host){
    			alert("독서모임 개설자는 참여신청할 수 없습니다.")
    			return;
    		}
    		
    		//2.신청인원 < 정원 확인
    		//2-2.여러번 만나요일때 전체 체크
    		if(c_times == '여러 번 만나요'){
    			var apply = $('#applyCount0').text();
        		var capacity = $('#clubCapacity0').text();
        		
        		if(apply >= capacity){
    				chkApply = false;
    			}else{
    				var how = '<c:out value="${fn:length(club.clubTimes)}"/>'
    	            console.log("how : " + how);
    	        		
    	        	for(var i=0; i<how; i++){
    	        		indexs.push(i);
    	        	}
    	        		
    	        	console.log("여러번 만나요 index : " + indexs)
    			} 

    		}else{
    			//2-1.한번만나요 일때 사용자가 체크한 것만 정원 확인
        		$("input:checkBox[class='applys']:checked").each(function(){
        			var index = this.id.slice(-1);  //체크한 체크박스의 id에서 varStatus값만 추출
        			var apply = $('#applyCount'+index).text();
        			var capacity = $('#clubCapacity'+index).text();

        			if(apply >= capacity){
        				chkApply = false;
        				return false;
        			}else{
        				indexs.push(index);
            			console.log("한번만나요 index : " + indexs)
        			}    			
        		})
    		};

    		if(!chkApply){
    			alert("정원을 초과하여 신청이 불가능합니다.");
    			return;
    		};
    		
			//3.참여신청 확인 메세지 yes후 진행
    		if(confirm("해당 독서모임에 참여신청하시겠습니까?")){
    			if(c_times == '여러 번 만나요'){
        			$("input[class='applys']").each(function(){
        				var timeNo = $(this).val();
        				times.push(timeNo);
        			});
        		}else{
        			if($("input:checkBox[class='applys']:checked").length == 0){
                        alert("참여할 독서모임을 선택해주세요");
                    }else{
                    	$("input:checkbox[class='applys']:checked").each(function(){
            				var timeNo = $(this).val();
            				times.push(timeNo);
            			});
                    }
        		}
    			
    			
    			if(times.length != 0){
					console.log(times)
    				$.ajax({
    					url:"apply.cl",
    					data:{
    						times : times,
    						userId : userId,
    						clubNo : clubNo,
    						c_times : c_times
    					},
    					type : "post",
    					success:function(result){
    						console.log(result)
    						if(result != "fail"){  //1.결과 fail아닐때
    							console.log("ajax 통신성공")
        						alert("감사합니다. 참여 신청완료되었습니다.")
        						
        						for(var i in indexs) {
    								var i = indexs[i];
    								var apply = $('#applyCount'+i).text();
    							    
    				    			$('#applyCount'+i).text(parseInt(apply)+1);
    							} 
    							
    						}else{  //2.결과 fail일때 - 이미 신청한 모임인 경우
    							alert("죄송합니다. 이미 신청하신 독서모임입니다.");
    							chkApply = false;
    						}

    					},error:function(){
    						console.log("ajax 통신실패")
    					}
    				
    				})
    			}
    			
    			 
    		}
    		
    	});

    </script>


   <jsp:include page="../common/footer.jsp" />

    <script src="resources/vendors/jquery/jquery-3.2.1.min.js"></script>
    <script src="resources/vendors/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="resources/vendors/skrollr.min.js"></script>
    <script src="resources/vendors/owl-carousel/owl.carousel.min.js"></script>
    <script src="resources/vendors/nice-select/jquery.nice-select.min.js"></script>
    <script src="resources/vendors/jquery.ajaxchimp.min.js"></script>
    <script src="resources/vendors/mail-script.js"></script>
    <script src="resources/js/main.js"></script>
</body>

</html>