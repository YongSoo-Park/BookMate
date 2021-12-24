<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>독서모임/개설신청step2</title>
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
        .applicate_guide {
            margin-bottom: 30px;
            font-size: 17px;
            color: black;
            font-weight: 900;
        }
        
        .my-input {
            display: inline-block;
            width: 20%;
            margin-right: 20px;
        }
        
        .my-input1 {
            display: inline-block;
            width: 54%;
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
		    margin: 0px 0px 20px;
        }
        
        .check_button {
            font-size: 14px !important;
		    background-color: #503535 !important;
		    border: 0 !important;
		    border-radius: 5% !important;
		    color: white;
		    padding: 5px 25px;
        }
    </style>
</head>

<body style="width:1200px; margin:auto; margin-top: 200px;">

	<jsp:include page="../common/menubar.jsp" />
	<jsp:include page="../club/clubMenubar.jsp"/>
   
    <!--================ step2 독서모임 정보 입력창 =================-->
    <section class="checkout_area section-margin--small">
        <div class="container">
            <div class="billing_details">
                <div class="row">
                    <div class="col-lg-12" style="margin-bottom: 40px;">
                        <h3 style="font-size: 30px; padding: 10px 0px 20px; border-bottom: 2px solid gray;">독서모임 개설 신청서  
                        	<span style="float:right; font-size: 15px; font-weight: 550;"><img alt="1" style="width: 20px;" src="resources/img/club/one_b.png"> 기본정보&nbsp;&nbsp;···&nbsp;&nbsp;<img alt="2" style="width: 20px;" src="resources/img/club/two_blue.png"> 모임테마&nbsp;&nbsp;···&nbsp;&nbsp;<img alt="3" style="width: 20px;" src="resources/img/club/three_b.png"> 책/일정</span> 
                        </h3>
                    </div>
                    <div class="col-lg-12">
	
                        <form id="club2Form" class="row contact_form" action="saveStep2.cl" method="post" enctype="multipart/form-data">
                            <div class="col-md-3 applicate_guide club_contents">
                                독서모임 테마*
                            </div>
                            <div class="col-md-9 form-group p_star">
                                <select class=" answer_contents theme_select" name="category">
                                    <option value="인문/과학/심리">인문/과학/심리</option>
                                    <option value="문학/에세이">문학/에세이</option>
                                    <option value="예술/음악">예술/음악</option>
                                    <option value="경영/경제/마케팅">경영/경제/마케팅</option>
                                    <option value="글쓰기">글쓰기</option>
                                    <option value="강연">강연</option>
                                </select>
                            </div>

                            <div class="col-md-3 applicate_guide club_contents">
                                독서모임 제목*
                            </div>
                            <div class="col-md-9 form-group p_star">
                            	<div class="example">
                            		<span style="font-weight: 550; font-size: 17px; margin-bottom: 10px;">멤버 마음을 사로잡는 모임 이름 짓기 꿀팁!</span>
                            		<ul style="list-style : disc">
										<li>여러 독서 모임 중에서 내 모임이 눈에 띄게 하려면?! 네이밍에 신경 써야 합니다.😉</li>
                            			<li>멤버들은 ‘내가 독서 모임에 참여해서 무엇을 얻을 수 있는가?’를 가장 많이 생각합니다. 모임에서 멤버들에게 줄 수 있는 가치가 무엇인지 생각해 보시고 이름을 지어주세요~</li>
                            			<li>독서 모임명은 20글자를 넘지 않게 지어주세요!</li>
                            		</ul>
                            	</div>
                            	
                            	<div class="example">
                            		<span style="font-weight: 550; font-size: 17px; margin-bottom: 10px;">예시</span>
                            		<ul style="list-style : disc">
										<li>‘미라클을 넘은 파라클 모닝! 새벽 4시 독서 모임’</li>
                            			<li>‘끝장토론 시리즈1 ‘자유주의는 진정한 답인가?’</li>
                            			<li>‘궁금하다 그 놈의 MBTI. 함께 MBTI 궁예해요’</li>
                            			<li>‘유발 하라리 인류 3부작 도장 깨기’</li>
                            			<li>‘책과 함께 비거니즘! 조금씩 바꾸는 비건인의 삶’</li>
                            			<li>‘Do it! 파이썬’ 책 한달 안에 뽀개기</li>
                            			<li>‘회계사와 함께하는 왕초보 주식 독서 모임’</li>
                            		</ul>
                            	</div>
            
                                <input type="text" class="form-control answer_contents must" id="clubTitle" name="clubTitle" required>
                            </div>

                            <div class="col-md-3 applicate_guide club_contents">
                                모임 소개*
                            </div>
                            <div class="col-md-9 form-group">
                            	<div class="example">
                            		<span style="font-weight: 550; font-size: 17px; margin-bottom: 10px;">모임 소개는 어떻게?🧐</span>
                            		<ul style="list-style : disc">
										<li>독서모임 페이지에서 가장 먼저 보이는 부분인만큼 개설할 모임에 대해 가장 잘 설명한 문장을 써주세요!</li>
                            			<li>모임이 추구하는 목표를 구체적으로 적어주면 좋아요</li>
                            		</ul>
                            	</div>
                                <textarea maxlength="1000" class="form-control answer_contents must" name="intro" rows="1" placeholder="독서모임에 대한 소개를 남겨주세요!" style="margin-top: 0px; resize: none; height: 180px;"></textarea>
                            </div>

                            <div class="col-md-3 applicate_guide club_contents">
                                커버 사진*
                            </div>
                            <div class="col-md-9 form-group p_star">
                                <input type="file" name="coverPhoto" class="must" style="margin-bottom: 5px;"> <br>
                            </div>

                            <div class="col-md-3 applicate_guide club_contents">
                                우리 모임에서 할 활동들*
                            </div>
                            <div class="col-md-9 form-group">
                                <textarea maxlength="1000" class="form-control answer_contents must" name="activity" rows="1" placeholder="독서모임에서 하게 될 활동들에 대해 얘기해주세요. 자세히 나와있을수록 참여율이 더 높아져요!" style="margin-top: 0px; resize: none; height: 180px;"></textarea>
                            </div>

                            <div class="col-md-3 applicate_guide club_contents">
                                이런 멤버들을 만나고 싶어요*
                            </div>
                            <div class="col-md-9 form-group">
                            	<span style="font-size: 16px; font-weight: 550;">우리독서 모임에 잘 어울리는 멤버들은 누구일까요? 어떤 멤버에게 우리 모임을 추천하나요?</span>
                                <textarea maxlength="1000" class="form-control answer_contents must" name="want" rows="1" placeholder="함께 독서모임을 하고 싶은 분들에 대해 적어주세요" style="margin-top: 20px; resize: none; height: 180px;"></textarea>
                            </div>

                            <div class="col-md-3 applicate_guide club_contents">
                                이런 멤버는 만나고 싶지 않아요*
                            </div>
                            <div class="col-md-9 form-group">
                                <textarea maxlength="1000" class="form-control answer_contents must" name="notwant" rows="1" placeholder="함께 독서모임을 하고 싶지 않은 분들에 대해 적어주세요" style="margin-top: 0px; resize: none; height: 180px;"></textarea>
                            </div>

                            <div class="col-md-3 applicate_guide club_contents">
                                독서모임 정원*
                            </div>
                            <div class="col-md-9 form-group p_star">
                                <input type="text" class="form-control answer_contents must" id="capacity" name="capacity" style="width: 200px;" placeholder="3명 ~ 15명까지 가능합니다">
                            </div>

                            <div class="col-md-12 " style="text-align: center; ">
                                <button class="check_button" onclick="saveStep2()">저장하기</button> 
                                <button class="check_button" onclick="goStep3()">저장 후 다음 단계로!</button> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <script>
   		/* onchange="selectCapacity(this)"
    	function selectCapacity(e){
    		console.log(d)	
    	} 
    	--> 포커스가 바뀌기 전까지 바뀐 거로 보지 않아서 capacity에 쓸 수 없다!
    	*/
    	
    	//정규식으로 숫자만 입력하게 하기
   		$(document).on("keyup", "input[name='capacity']", function() {
   			$(this).val( $(this).val().replace(/[^0-9]/gi,"") );
   		})
    	
    	$("#capacity").keyup(function(e){
	        var num = $(this).val();
	         	
	        if(num < 3 || num > 15){
	        	alert("3이상 15이하 숫자만 입력 가능합니다.");
	        	$(this).val('');
	        }
	    })
    	
    	//2. 저장하기
	    function saveStep2(){
	    	if($('#club2Form').find('input[name="clubTitle"]').val()){
	    		
	    		if(confirm("임시저장하시겠습니까? ")){
	    			$('#club2Form').attr('action','saveStep2.cl').submit();  //저장하기부터 누르면 막혀서 이렇게 해줘야 한다.
	    		}else{
	    			$('#club2Form').attr('action','javascript://');
	    		}
	        }else{
	        	alert("독서모임 제목은 입력해주세요~")
	        }
	    }
	                            
	    //저장후 3단계로 넘어가기
	    function goStep3(){
	    	var is_empty = false;
	
	        //console.log($('select[name="category"]').val());
	        $('#club2Form').find('.must').each(function(){
	        	if(!$(this).val()){  //값이 없는 경우 false -> 아래 if문 돌면서 is_empty를 true로 바꿈
	            	console.log($(this))
	                is_empty = true;
	            }
	        })

	        //javascript에서는 빈값 그리고 null값을 NOT 연산자로 처리한다.
	        if(is_empty){
	        	alert("모든 필수 입력창을 입력해주세요");
	            $('#club2Form').attr('action','javascript://')  //submit 막기
	        }else{
	            $('#club2Form').attr('action','insertClub2.cl').submit();
	        }
	    }
	    
	    $("#clubTitle").keyup(function(e){
	        var content = $(this).val();
	         	
	        if(content.length>31){
	        	alert("최대 30자까지 입력 가능합니다.");
	        	$(this).val(content.substring(0,30));
	        }
	    })
	</script>
    <!--================End step2 독서모임 정보 입력창 =================-->

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