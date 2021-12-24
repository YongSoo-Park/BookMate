<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>독서모임/개설신청step1</title>
    <link rel="icon" href="img/Fevicon.png" type="image/png">

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
        .applicate_guide {
            margin-bottom: 30px;
            font-size: 17px;
            color: black;
            font-weight: 900;
        }
        
        .my-input {
            display: inline-block;
            width: 20%;
            margin-right: 15px;
        }
        
        .history_total {
            display: flex;
        }
        
        .history_total li.s {
            width: 30%;
            padding-right: 20px;
            /* flex: 2; */
        }
        
        .history_total li.w {
            width: 20%;
            padding-right: 20px;
            position: relative;
            /* flex: 5; */
        }
        
        .history_total li.d {
            width: 10%;
            text-align: center;
            position: relative;
            /* flex: 1; */
        }
        
        .history_total li img {
            width: 40%;
            position: absolute;
            top: 4px;
            left: 5px;
        }
    </style>
</head>

<body style="width:1200px; margin:auto">
    <jsp:include page="../club/clubMenubar.jsp"/>

    <!--================ step3 독서모임 정보 입력창 =================-->
    <section class="checkout_area section-margin--small">
        <div class="container">
            <div class="billing_details">
                <div class="row">
                    <div class="col-lg-12" style="margin-bottom: 50px;">
                        <h3 style="font-size: 30px; ">독서모임 개설 신청서</h3>
                    </div>
                    <div class="col-lg-12">

                        <form id="club3Form" class="row contact_form" action="updateClub3.cl" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="clubNo" value="${club.clubNo}"/>
                            <div class="col-md-3 applicate_guide">
                                온라인/오프라인*
                            </div>
                            <div class="col-md-9 form-group p_star">
                                <label style="margin-right: 110px;">
                                    <input class="must" type="radio" name="onoffLine" value="온라인"  <c:if test="${club.onoffLine eq '온라인'}">checked</c:if>  >온라인
                                </label>
                                <label>
                                    <input class="must" type="radio" name="onoffLine" value="오프라인" <c:if test="${club.onoffLine eq '오프라인'}">checked</c:if>  >오프라인
                                </label>
                            </div>

                            <div class="col-md-3 applicate_guide">
                                모임 횟수*
                            </div>
                            <div class="col-md-9 form-group p_star">
                                <label style="margin-right: 80px;">
                                    <input type="radio" class="must" name="times" value="한 번 만나요" <c:if test="${club.times eq '한 번 만나요'}">checked</c:if> >한 번 만나요
                                </label>
                                <label>
                                    <input type="radio" class="must" name="times" value="여러 번 만나요" <c:if test="${club.times eq '여러 번 만나요'}">checked</c:if> >여러 번 만나요
                                </label>
                            </div>

                            <div class="col-md-3 applicate_guide ">
                                모임 날짜*
                            </div>
                            <div class="col-md-9 form-group" id="dates">
                            <c:set var="leng" value="${fn:length(club.clubTimes)}"/>
                            	<c:choose>
	                            		<c:when test="${leng eq 0}">
	                            			<ul class="history_total">
		                                    <li class="s">
		                                        <input type="date" class="form-control must always" id="date" name="newClubDate" value="${ct.clubDate}" required>
		                                    </li>
		                                    <li class="w">
		                                        <input type="text" class="form-control must always" id="startTime" name="startTime" value="${ct.startTime}" required>
		                                    </li>
		                                    <li class="w">
		                                        <input type="text" class="form-control must always" id="endTime" name="endTime" value="${ct.endTime}" required>
		                                    </li>
		                                    <li class="d">
		                                        <img src="resources/img/delete.png" onclick="delHistory(this)">
		                                    </li>
		                                </ul>
	                            		</c:when>
                            			<c:otherwise>
                            				<c:forEach items="${club.clubTimes}" var="ct">
				                                <ul class="history_total">
				                                    <li class="s">
				                                        <input type="date" class="form-control must" id="date" name="newClubDate" value="${ct.clubDate}">
				                                    </li>
				                                    <li class="w">
				                                        <input type="text" class="form-control must" id="startTime" name="startTime" value="${ct.startTime}">
				                                    </li>
				                                    <li class="w">
				                                        <input type="text" class="form-control must" id="endTime" name="endTime" value="${ct.endTime}">
				                                    </li>
				                                    <li class="d">
				                                        <img src="resources/img/delete.png" onclick="delHistory(this)">
				                                    </li>
				                                </ul>
			                                </c:forEach>
                            			</c:otherwise>
                            	</c:choose>

                            	
                            </div>
                            <div class="col-md-3 form-group p_star "></div>
                            <div class="col-md-9 form-group p_star ">
                                <button type="button" class="button button-login check_button" onclick="addHistory()">추가하기</button>
                            </div>

                            <script>
                                //호스트 이력 갯수 정하기 위해서 전역변수 cnt, maxField 선언
                                var cnt = 1;
                                var maxField = 15;
                                var add = '<ul class="history_total"><li class="s"><input type="date" class="form-control must always" id="date" name="newClubDate"></li><li class="w"><input type="text " class="form-control must always" id="startTime" name="startTime"></li><li class="w"><input type="text " class="form-control must always" id="endTime" name="endTime"></li><li class="d"><img src="img/delete.png " onclick="delHistory(this)"></li></ul>'

                                //호스트 이력 추가하기 버튼
                                function addHistory() {
                                    cnt++;

                                    if (cnt <= maxField) {
                                        $("#dates").append(add)
                                        console.log(cnt + "개")

                                    } else {
                                        alert("호스트 이력은 최대 15개까지 입력가능합니다.")
                                    }
                                }

                                //호스트 이력 삭제하기 버튼 
                                //$(this).parent().remove() 는 안된다.
                                function delHistory(obj) {
                                    if (cnt > 1) {
                                        cnt--;
                                        $(obj).parent().parent().remove();
                                    } else {
                                        //전체 input 창 값 비게해주기
                                    }
                                }
                            </script>

                            <div class="col-md-3 applicate_guide ">
                                모임 기간*
                            </div>
                            <div class="col-md-9 form-group ">
                                <label class="my-input">모집 시작</label>
                                <label class="my-input">모집 종료</label> <br>
                                <input type="date" class="form-control my-input must always" id="startDate" name="clubStartDate" value="${club.clubStartDate}" required>
                                <input type="date" class="form-control my-input must always" id="endDate " name="clubEndDate" value="${club.clubEndDate}" required>
                            </div>



                            <div class="col-md-3 applicate_guide">
                                모임 책 제목*
                            </div>
                            <div class="col-md-6 form-group p_star">
                                <input type="text" class="form-control must" name="bkName" value="${club.bkName}">
                            </div>
                            <div class="col-md-3 form-group p_star"> </div>

                            <div class="col-md-3 applicate_guide">
                                모임 책 저자*
                            </div>
                            <div class="col-md-6 form-group p_star">
                                <input type="text" class="form-control must" name="bkWriter" value="${club.bkWriter}">
                            </div>
                            <div class="col-md-3 form-group p_star"> </div>

                            <div class="col-md-3 applicate_guide">
                                모임 책 출판사*
                            </div>
                            <div class="col-md-6 form-group p_star">
                                <input type="text" class="form-control must" name="bkPublisher" value="${club.bkPublisher}">
                            </div>
                            <div class="col-md-3 form-group p_star"> </div>

                            <div class="col-md-3 applicate_guide">
                                모임 책 사진*
                            </div>
                            <div class="col-md-9 form-group p_star">
                                <input type="file" class="must" name="bookPhoto">
                            </div>
                            
                            <div class="col-md-3 applicate_guide">
                                <label for="hostPhoto">책 사진 미리보기</label>
                            </div>
                            
                            <div class="col-md-9 form-group p_star">
                            
                            	<!-- 0.호스트 사진 저장되었는지 확인하는 용도의 변수 -->
                            	<c:set var="s" value="0"/>
                            	
                            	<!-- 1.호스트 사진 저장된 경우 -->
                                <c:forEach items="${club.clubAttachments}" var="at">
                                	<c:if test="${at.fileType eq 3}">
                                		현재 업로드된 파일 : ${at.originalName}
	                                	<input type="hidden" name="old_changeName" id="old_changeName" value="${ at.changeName }">
	                                	
		                            	<br>
	                            		<img alt="" src="${pageContext.servletContext.contextPath }/resources/upload_files/club_img/${at.changeName}" id="prebookPhoto" style="width:260px; height:300px;" >
                                	
                                		<c:set var="s" value="${s+1}"/>
                                	</c:if>
                                </c:forEach>
                                
                                <!-- 2.책 사진 저장안되어있을 경우 -->
                                <c:if test="${s == 0}">
                                	<img alt="" src="" id="prebookPhoto">
                                </c:if>
                                                               
                            </div>

                            <div class="col-md-12 " style="text-align: center; ">
                                <button class="button button-login">이전 단계로</button>
                                <button class="button button-login" onclick="saveStep3()">저장하기</button> 
                                <button class="button button-login" onclick="goStepFinal()">개설신청하기</button>
                            </div>
                            
							<script>
                            	//2. 저장하기
	                            function saveStep3(){
									var is_empty = false;
	                            	
	                            	$('#club3Form').find('.always').each(function(){
	                            		if(!$(this).val()){
	                            			console.log($(this))
	                            			is_empty = true;
	                            		}
	                            	})

	                            	//javascript에서는 빈값 그리고 null값을 NOT 연산자로 처리한다.
	                            	if(is_empty){
	                            		alert("모든 필수 입력창을 입력해주세요");
	                            		$('#club3Form').attr('action','javascript://')  //submit 막기
	                            	}else{
	                            		$('#club3Form').submit();
	                            	}
	                            }
	                            
	                            //저장후 3단계로 넘어가기
	                            function goStepFinal(){
	                            	var is_empty = false;
	                            	
	                            	$('#club3Form').find('.must').each(function(){
	                            		if(!$(this).val()){
	                            			console.log($(this))
	                            			is_empty = true;
	                            		}
	                            	})

	                            	//javascript에서는 빈값 그리고 null값을 NOT 연산자로 처리한다.
	                            	if(is_empty){
	                            		alert("모든 필수 입력창을 입력해주세요");
	                            		$('#club3Form').attr('action','javascript://')  //submit 막기
	                            	}else{
	                            		$('#club3Form').attr('action','updateClubNext3.cl').submit();
	                            	}
	                            }
	                            
	                            $(function(){
	                            	if(document.getElementById("old_changeName")){
	                            		var old = document.getElementById("old_changeName").value;
		                        		
		                        		if(old != ""){
		                        			$("#bookPhoto").attr('class','notMust');
		                        		}
	                            	}
	                        		
	                        	});

	                            //이미지 체크, 미리보기
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
                                			if(inputId=='bookPhoto'){
                                				$('#pre'+inputId).css({"width":"200px","height":"300px"})
                                			}			
                                		}		   
                                	}
                                }

                            </script>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End step3 독서모임 정보 입력창 =================-->



    <!--================ Start footer Area  =================-->
    <footer>
        <div class="footer-area footer-only ">
            <div class="container ">
                <div class="row section_gap ">
                    <div class="col-lg-3 col-md-6 col-sm-6 ">
                        <div class="single-footer-widget tp_widgets ">
                            <h4 class="footer_title large_title ">Our Mission</h4>
                            <p>
                                So seed seed green that winged cattle in. Gathering thing made fly you're no divided deep moved us lan Gathering thing us land years living.
                            </p>
                            <p>
                                So seed seed green that winged cattle in. Gathering thing made fly you're no divided deep moved
                            </p>
                        </div>
                    </div>
                    <div class="offset-lg-1 col-lg-2 col-md-6 col-sm-6 ">
                        <div class="single-footer-widget tp_widgets ">
                            <h4 class="footer_title ">Quick Links</h4>
                            <ul class="list ">
                                <li><a href="# ">Home</a></li>
                                <li><a href="# ">Shop</a></li>
                                <li><a href="# ">Blog</a></li>
                                <li><a href="# ">Product</a></li>
                                <li><a href="# ">Brand</a></li>
                                <li><a href="# ">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 col-sm-6 ">
                        <div class="single-footer-widget instafeed ">
                            <h4 class="footer_title ">Gallery</h4>
                            <ul class="list instafeed d-flex flex-wrap ">
                                <li><img src="img/gallery/r1.jpg " alt=" "></li>
                                <li><img src="img/gallery/r2.jpg " alt=" "></li>
                                <li><img src="img/gallery/r3.jpg " alt=" "></li>
                                <li><img src="img/gallery/r5.jpg " alt=" "></li>
                                <li><img src="img/gallery/r7.jpg " alt=" "></li>
                                <li><img src="img/gallery/r8.jpg " alt=" "></li>
                            </ul>
                        </div>
                    </div>
                    <div class="offset-lg-1 col-lg-3 col-md-6 col-sm-6 ">
                        <div class="single-footer-widget tp_widgets ">
                            <h4 class="footer_title ">Contact Us</h4>
                            <div class="ml-40 ">
                                <p class="sm-head ">
                                    <span class="fa fa-location-arrow "></span> Head Office
                                </p>
                                <p>123, Main Street, Your City</p>

                                <p class="sm-head ">
                                    <span class="fa fa-phone "></span> Phone Number
                                </p>
                                <p>
                                    +123 456 7890 <br> +123 456 7890
                                </p>

                                <p class="sm-head ">
                                    <span class="fa fa-envelope "></span> Email
                                </p>
                                <p>
                                    free@infoexample.com <br> www.infoexample.com
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer-bottom ">
            <div class="container ">
                <div class="row d-flex ">
                    <p class="col-lg-12 footer-text text-center ">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;
                        <script>
                            document.write(new Date().getFullYear());
                        </script> All rights reserved | This template is made with <i class="fa fa-heart " aria-hidden="true "></i> by <a href="https://colorlib.com " target="_blank ">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                </div>
            </div>
        </div>
    </footer>
    <!--================ End footer Area  =================-->



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