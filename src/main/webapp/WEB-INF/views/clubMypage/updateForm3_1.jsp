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
    <title>독서모임/개설수정step1</title>
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

    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->

    <style>
        .applicate_guide {
            margin-bottom: 30px;
            font-size: 17px;
            color: black;
            font-weight: 900;
        }
        
        .check_button {
            font-size: 14px !important;
		    background-color: #503535 !important;
		    border: 0 !important;
		    border-radius: 5% !important;
		    color: white;
		    padding: 5px 25px;
        }
        
        .history_total {
            display: flex;
        }
        
        .history_total li.w {
            width: 46%;
            position: relative;
            /* flex: 5; */
        }
        
        .history_total li.s {
            width: 22%;
            padding-right: 10px;
            /* flex: 2; */
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
            left: 25px;
        }
        
        .club_contents{
	        font-size: 18px;
        }
        
        
        .answer_contents{
	        border-color: lightgray !important;
		    font-size: 17px !important;
		    color: black !important;
        }
        
        .example{
	        background-color: #ecf4f1;
		    padding: 20px 40px;
		    margin: 10px 0px 30px;
        }
    </style>
</head>

<body style="width:1200px; margin:auto; margin-top: 200px;">
    <jsp:include page="../common/menubar.jsp" />
	<jsp:include page="../club/clubMenubar.jsp"/>
    <!--================ 호스트 정보 입력창 =================-->
    <section class="checkout_area section-margin--small">
        <div class="container">
            <div class="billing_details">
                <div class="row">
                    <div class="col-lg-12" style="margin-bottom: 40px;">
                        <h3 style="font-size: 30px; padding: 10px 0px 20px; border-bottom: 2px solid gray;">독서모임 개설 신청서  
                        	<span style="float:right; font-size: 15px; font-weight: 550;"><img alt="1" style="width: 20px;" src="resources/img/club/one_blue.png"> 기본정보&nbsp;&nbsp;···&nbsp;&nbsp;<img alt="2" style="width: 20px;" src="resources/img/club/two_b.png"> 모임테마&nbsp;&nbsp;···&nbsp;&nbsp;<img alt="3" style="width: 20px;" src="resources/img/club/three_b.png"> 책/일정</span> 
                        </h3>
                    </div>
                    <div class="col-lg-12">

                        <form id="hostEnrollForm" class="row contact_form" action="updateClub1.cl" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="clubNo" value="${club.clubNo}">
                            <div class="col-md-3 applicate_guide club_contents">
                                호스트명*
                            </div>
                            <div class="col-md-5 form-group p_star">
                                <input readonly type="text" class="form-control answer_contents must" id="hostName" name="hostName" value="${club.hostName}" required>
                            </div>
                            <div class="col-md-4 form-group p_star">
                               <!--  <button type="button" class="check_button" onclick="checkHostName()">중복 확인</button> -->
                            </div>

                            <div class="col-md-3 applicate_guide club_contents">
                                프로필 사진*
                            </div>
                            <div class="col-md-9 form-group p_star">
                                <input type="file"  id="hostPhoto" name="hostPhoto" class="must" onchange="imgCheck(this,'hostPhoto')">
                            </div>


							<div class="col-md-3 applicate_guide club_contents">
                                <label for="hostPhoto">프로필 사진 미리보기</label>
                            </div>
                            
                            <div class="col-md-9 form-group p_star">
                            
                            	<!-- 0.호스트 사진 저장되었는지 확인하는 용도의 변수 -->
                            	<c:set var="s" value="0"/>
                            	
                            	<!-- 1.호스트 사진 저장된 경우 -->
                                <c:forEach items="${club.clubAttachments}" var="at">
                                	<c:if test="${at.fileType eq 1}">
                                		현재 업로드된 파일 : ${at.originalName}
	                                	<input type="hidden" name="old_changeName" id="old_changeName" value="${ at.changeName }">
	                                	
		                            	<br>
	                            		<img alt="" src="${pageContext.servletContext.contextPath }/resources/upload_files/club_img/${at.changeName}" id="prehostPhoto" style="width:260px; height:300px;" >
                                	
                                		<c:set var="s" value="${s+1}"/>
                                	</c:if>
                                </c:forEach>
                                
                                <!-- 2.호스트 사진 저장안되어있을 경우 -->
                                <c:if test="${s == 0}">
                                	<img alt="" src="" id="prehostPhoto">
                                </c:if>
                                                               
                            </div>


                            <div class="col-md-3 applicate_guide club_contents">
                                호스트 이력
                            </div>
                            <div class="col-md-9 form-group" id="history">
                            	<span style="font-size: 18px; font-weight: 550; margin-bottom: 15px;">호스트님의 특별한 경험을 공유해주세요!</span>
                            	<div class="example">
                            		<ul style="list-style : disc">
										<li> [ 책과 관련된 경험 ] 2019-01-01 2021-01-01 독립출판 동아리 진행</li>
                            			<li> [ 일/직무 관련 경험 ] 2019-01-01 2021-01-01 오이마켓 Product Manager</li>
                            			<li> [ 독특한 라이프스타일 경험 ] 2019-01-01 2021-01-01 비거니즘 웹진 에디터</li>
                            		</ul>
                            	</div>
                            	
                            	
                            	<!-- 3개 동시에 돌면서 값 넣어주기 위해서 string -> 배열로 만들었다. -->
                            	<c:set var="hstartD" value="${fn:split(club.hstartDate,',')}" />
                            	<c:set var="hendD" value="${fn:split(club.hendDate,',')}" />
                            	<c:set var="hwhatT" value="${fn:split(club.hwhatTodo,'|')}" />

                            	<c:set var="hlength" value="${fn:length(hendD)}"/>
                            	
                            	<c:if test="${test ne 0}">
                            		<c:forEach begin="0" end="${hlength-1}" varStatus="s">
                            			<div>
		                                    <ul class="history_total">
		                                        <!-- 그냥 <div>로 하면 추가했을 때 이전꺼랑 정렬이 안 맞아서 ul,li로 고쳐줬다. -->
		                                        <li class="s">
		                                            <input type="date" class="form-control dates answer_contents" name="hstartDate" value="${hstartD[s.index]}">
		                                        </li>
		                                        <li class="s">
		                                            <input type="date" class="form-control dates  answer_contents" name="hendDate" value="${hendD[s.index]}">
		                                        </li>
		                                        <li class="w">
		                                            <input type="text" class="form-control answer_contents" name="phwhatTodo" value="${hwhatT[s.index]}">
		                                        </li>
		                                        <li class="d">
		                                            <img src="resources/img/delete.png " class="history" onclick="delHistory(this)">
		                                        </li>
		                                    </ul>
		                                </div>
                            		</c:forEach>
                            	</c:if>
                            </div>
                            <div class="col-md-3 form-group p_star "></div>
                            <div class="col-md-9 form-group p_star ">

                                <!-- form 안에 있는 버튼은 submit 기능을 하기 때문에 type="button" 붙인다.-->
                                <button type="button" class="check_button" id="addHis" onclick="addHistory()">추가하기</button>
                            </div>

   

                            <div class="col-md-3 applicate_guide club_contents">
                                호스트 Comment*
                            </div>
                            <div class="col-md-9 form-group">
                                <textarea class="form-control answer_contents must" name="hostComment" id="message " rows="1 " maxlength="1000" placeholder="독서모임에 참여할 멤버들에게 comment를 남겨주세요! " style="margin-top: 0px; resize: none;">${club.hostComment}</textarea>
                            </div>

                            <div class="col-md-12 " style="text-align: center; margin-top: 40px;">
                            	<button class="check_button" onclick="saveStep1()">저장하기</button> 
                                <button class="check_button" onclick="goStep2()">저장 후 다음 단계로!</button> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <script>
		//호스트 이력 갯수 정하기 위해서 전역변수 cnt, maxField 선언
        var cnt = '${fn:length(hendD)}';
        var maxField = 10;
        var add = '<div><ul class="history_total"><li class="s"><input type="date" class="form-control my-input history answer_contents" name="hstartDate"></li><li class="s"><input type="date" class="form-control my-input history answer_contents" name="hendDate"></li><li class="w"><input type="text " class="form-control my-input1 history answer_contents" name="phwhatTodo" maxlength="41"></li><li class="d"><img src="resources/img/delete.png " class="history my-input2 " onclick="delHistory(this)"></li></ul> </div>'
		var chkDuplicate = true;  //중복확인 체크
		
		//이전에 저장한 사진이 있는 경우 -> class에 must있으면 넘어가지지 않음
		$(function(){
    		if(document.getElementById("old_changeName")){
    			var old = document.getElementById("old_changeName").value;
        		
        		if(old != ""){
        			$("#hostPhoto").attr('class','notMust');
        		}
    		}
    	});
		
        
        $("#hostName").keyup(function(e){
	        var content = $(this).val();
	         	
	        if(content.length>11){
	        	alert("최대 10자까지 입력 가능합니다.");
	        	$(this).val(content.substring(0,10));
	        }
	    })

	    $("input[name=phwhatTodo]").keyup(function(e){
	        var content = $(this).val();
	         	
	        if(content.length>41){
	        	alert("최대 40자까지 입력 가능합니다.");
	        	$(this).val(content.substring(0,40));
	        }
	    })
        	
        //호스트명 중복 확인
        function checkHostName() {
        	var hostName = $("#hostEnrollForm input[name=hostName]");

            if (hostName.val() == "") {
            	alert("이름을 입력해주세요!");
                return false;
            }

            $.ajax({
            	url: "hostCheck.cl",
                type: "get",
                data: {
                	hostName: hostName.val()
                },
                success: function(result) {
                	if (result == "duplicate") {
                    	if(confirm("기존에 저장된 이름입니다. 사용하시겠습니까?")){
                    		hostName.attr("readonly", "true");
                            chkDuplicate = true;
                    	};
                    } else {
                        if (confirm("사용가능한 이름입니다. 사용하시겠습니까?")) {
                           hostName.attr("readonly", "true");
                           chkDuplicate = true;
                        } else {
                           hostName.focus();
                        }
                    }
                },
                error: function() {
                   console.log("서버통신실패");
                }
            })
        }
        
        //호스트 이력 추가하기 버튼
        function addHistory() {
        	cnt++;

            if (cnt <= maxField) {
                $("#history").append(add)
                console.log(cnt + "개")
            } else {
            	alert("호스트 이력은 최대 10개까지 입력가능합니다.")
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

                                
        //저장후 2단계로 넘어가기
        function goStep2(){
        	var is_empty = false;
        	
        	if(!chkDuplicate){
        		alert("호스트명 중복 확인을 해주세요");
        		$('#hostEnrollForm').attr('action','javascript://')
        		return;
        	}

            //children -> 바로 아래 요소만
            //find -> 자식 및 하위태그모두
            $('#hostEnrollForm').find('.must').each(function(){
            	if(!$(this).val()){
                    is_empty = true;
                }
            })
                                	
            //javascript에서는 빈값 그리고 null값을 NOT 연산자로 처리한다.
            if(is_empty){
               alert("모든 필수 입력창을 입력해주세요");
               //submit 막기
               $('#hostEnrollForm').attr('action','javascript://')
               //$('#hostEnrollForm').attr("onsubmit", "event.preventDefault();")
            }else{
               $('#hostEnrollForm').attr('action','updateClubNext1.cl').submit();
            }
         }
        
                                
         //$('#hostEnrollForm').attr('action','javascript://') 막은 후 작동안함,,
         function saveStep1(){
         	if($('#hostEnrollForm').find('input[name="hostName"]').val()){ 
         		if(confirm("임시저장하시겠습니까?")){
         			$('#hostEnrollForm').attr('action','updateClub1.cl').submit();
         		}else{
         			$('#hostEnrollForm').attr('action','javascript://');
         		}
            }else{
                alert("호스트명은 입력해주세요~");
            }
         }
         
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
         			if(inputId=='hostPhoto'){
         				$('#pre'+inputId).css({"width":"200px","height":"300px"})
         			}			
         		}		   
         	}
         }
	</script>
    <!--================End 호스트정보 입력창 =================-->

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