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
    <title>독서모임 - 신청인원 확인</title>
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
			/*display: flex; */
            align-items: center;
            width: 100%;
        }
        
        .left {
            flex: 0 0 auto;
            margin: 16px 28px;
        }

        .applys {
            zoom: 1.5;
            margin: auto;
        }
        
        .detail_title1 {
            font-size: 26px;
            font-weight: 900;
            color: #FFAE42;
        }
        
        .detail_title2 {
            font-size: 19px;
            font-weight: bold;
        }
        /*div 반으로 나누기*/
        
        .left_1 {
            width: 20%;
            float: left;
            box-sizing: border-box;
            margin-left: 5%;
    		margin-top: 3%;
        }
        
       	.right_1 {
            width: 70%;
            margin: auto 0;
            box-sizing: border-box;
        }
        
        .titleDiv{
	        width: 100%;
		    height: 100%;
	    }
	    
	    .titleBackImg{
	    	background-size: cover;
		    width: 100%;
		    height: 100%;
		    background-position: center center;
	    }
	    
	    .m_contents{
	    	margin: 40px 0px 100px;
	    }
	    
	    .timeTotal2{
			overflow: auto;
		    height: 248px;
		    background-color: white;
		    margin: 0 auto;
		}
	    
    </style>
</head>

<body style="width:1200px; margin:auto">
    
    <jsp:include page="../common/menubar.jsp" />
    
    <script>
    	function checkUserApply(){
    		var applyNoList = [];
    		/* var idNoList = []; */
    		
    		if($("input:checkBox[class='applyChkBox']:checked").length == 0){
                alert("회원을 선택되지 않았습니다. 회원을 선택해 주세요");
            }else{
            	$("input:checkbox[class='applyChkBox']:checked").each(function(){
    				var applyNo = $(this).val();
    				var idNo = $(this).attr('id').slice(-1)
    				applyNoList.push(applyNo);
    				/* idNoList.push(idNo); */
    			});
            }

    		$.ajax({
    			url: "checkUserApply.cl",
    			data:{
    				applyNoList : applyNoList
    			},
    			type : "post",
				success:function(result){
					$("input:checkbox[class='applyChkBox']:checked").each(function(){
						$(this).attr('disabled','disabled');
					});
					
					alert("참여여부가 확정되었습니다.")
				},error:function(){
				}
    			
    		})  
    	}
    </script>
    
    
    <!--================ 독서모임 디테일 =================-->
    <div class="product_image_area" style="margin-top: 100px;">
    	<jsp:include page="../club/clubMenubar.jsp"/>
        
        <div class="container" style="padding-top: 30px; padding-bottom: 30px;">
            <div class="row s_product_inner">
                <div class="col-lg-5">
                    <div class="titleDiv">
                        <c:forEach var="ca" items="${club.clubAttachments}">
                        	<c:if test="${ca.fileType eq 2}">
                        		<div class="titleBackImg" style="background-image: url('${pageContext.servletContext.contextPath }/resources/upload_files/club_img/${ca.changeName}')"></div>
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
						
						<%-- <div style="overflow:auto; width:80%; height:258px; margin:40px 0px 30px; border:3px solid #FFAE42">
							<c:forEach var="ct" items="${club.clubTimes}" varStatus="status">
								<div class="times">
	                            <div class="left">
	                                <p class="time">
	                                    <span>
	                                    	<fmt:parseDate var="clubD" value="${ct.clubDate}" pattern="yyyy-MM-dd" /> <!-- string -> Date로 -->	
											<fmt:parseDate value="${ct.clubDate}" var="dateK" pattern="yyyy-MM-dd"/>
											<fmt:formatDate value="${dateK}" pattern="yyyy년 MM월 dd일"/>
	                                    	(<fmt:formatDate value="${clubD}" pattern="E"/>)
	                                    	</span>
	                                    <span>|</span>
	                                    <span>${ct.startTime} ~ ${ct.endTime}</span>
	                                </p>
	                                <p class="apply" style="display:flex">
	                                    <span style="margin-left: auto;">현재 신청 현황 : 신청 <span id="applyCount${status.index}">${ct.apply_count}</span> / 정원 <span id="clubCapacity${status.index}">${club.clubCapacity}</span></span>
	                                </p>
	                            </div>
	                        </div>
							</c:forEach>
						</div>	 --%>
						
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
		                                    <span>${ct.startTime} ~ ${ct.endTime}</span>
		                                </p>
		                                <p class="apply" style="display:flex">
		                                    <span style="margin-left: auto;">신청 <span id="applyCount${status.index}">${ct.apply_count}</span> / 정원 <span id="clubCapacity${status.index}">${club.clubCapacity}</span></span>
		                                </p>
		                            </div>
		                        </div>
								</c:forEach>
							</div>	
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--================End Single Product Area =================-->

	<section class="club_detail" style="margin-top:30px;">
		<div class="container">
			<ul class="nav nav-tabs">
				<c:forEach items="${club.clubTimes}" var="ct" varStatus="status">
					<c:if test="${status.index eq 0 }"><c:set var="clubDates" value="${ct.clubDate}"></c:set></c:if>
					<c:if test="${status.index > 0 }"><c:set var="clubDates" value="${clubDates}  &  ${ct.clubDate}"/></c:if>
					<c:if test="${club.times eq '한 번 만나요' }">
						<c:choose>
							<c:when test="${status.index eq 0}">
								<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#clubApplys${status.index}">${ct.clubDate}</a></li>
							</c:when>
							<c:otherwise>
								<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#clubApplys${status.index}">${ct.clubDate}</a></li>
							</c:otherwise>
						</c:choose>	
					</c:if>
				</c:forEach>
				<c:if test="${club.times eq '여러 번 만나요' }">
					<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#clubApplys0">${clubDates}</a></li>
				</c:if>				
			</ul>
			
			<div class="tab-content">
				<div style="margin-top: 50px">
					참여완료한 회원을 체크한 후 확인 버튼을 눌러주세요! 참여여부는 수정할 수 없으니 차분히 해주세요😊 <br><br>
					<input onclick="checkUserApply()" type="button" value="확인">
				</div>
				<c:forEach items="${club.clubTimes}" var="ct" varStatus="status">
					<div class="tab-pane fade <c:if test="${status.index eq 0 }"><c:out value=" show active "/></c:if> m_contents" id="clubApplys${status.index}" style="margin-top:10px;">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>회원 Id</th>
									<th>신청일자</th>
									<th>참여 여부</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${applyList}" var="list" varStatus="status">
									<c:if test="${list.timeNo eq ct.timeNo}">
										<tr>
											<td>${list.userId}</td>
											<td>${list.applyDate}</td>
											<td>
	                                    		<c:if test="${club.times eq '한 번 만나요' }">
	                                    			<c:set var="cDate" value="${ct.clubDate}"/>
	                                    		</c:if>
	                                    		<c:if test="${club.times eq '여러 번 만나요' }">
	                                    			<c:set var="length" value="${fn:length(club.clubTimes)-1}"/>
	                                    			<c:set var="cDate" value="${club.clubTimes[length].clubDate}"/>
	                                    		</c:if>
	                                    		
	                                    		<c:set var="now" value="<%=new java.util.Date()%>"/>
	                                    		<fmt:formatDate var="clubDate" value="${c.clubStartDate}" pattern="yyyy-MM-dd"/>
	                                    		<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
	                                    		<c:if test="${cDate < today}">
	                                    			<c:if test="${list.applyParti eq 'N' }">
	                                    				<input id="applyChkBox${status.index}" class="applyChkBox" type="checkbox" value="${list.applyNo}">
	                                    			</c:if>
	                                    			<c:if test="${list.applyParti eq 'Y' }">
	                                    				<span>참여 완료</span>
	                                    			</c:if>
	                                    			
	                                    		</c:if>
												<c:if test="${cDate >= today}">
													<span>아직 모임이 끝나지 않았습니다!</span>
												</c:if>
											</td>										
										</tr>	
									</c:if>					
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:forEach>
			</div>	
        </div>
    </section>

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