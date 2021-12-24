<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정하기 </title>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보 수정하기  </title>
    
 	<link rel="icon" href="img/Fevicon.png" type="image/png">
    <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="resources/vendors/linericon/style.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">
  
    <link rel="stylesheet" href="resources/css/style.css">
    
    <!-- 제이쿼리 추가...-->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>


       <style>
    	
    	.innerOuter{
    	
    		padding-left: 200px;
    	
    	}
    	
    	
    	.modal-container {
  background: rgba(0,0,0,.5);
  display: none;
  /* this is how we cover the entire page */
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
}

.modal-container.show-modal {
  display: block;
}

.modal {
  background: white;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0,0,0,.3);
  position: absolute;
  overflow: hidden;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  max-width: 100%;
  width: 400px;

  animation-name: modalopen;
  animation-duration: var(--modal-duration);
    
    </style>
    
 
</head>
<body style="width: 1200px; margin: auto;">
 <jsp:include page="../common/menubar.jsp" />

<!-- 왼쪽 사이드바  -->
    <section  style="padding-top: 180px;" >
        <div class="container">
          <div class="row">
         <jsp:include page="../myPageSideBar/sideBar.jsp" />
					

				<!-- 회원정보 수정할수 있는 곳  -->
	<div class="col-xl-9 col-lg-8 col-md-7">
		<div class="filter-bar d-flex flex-wrap align-items-center">
			<div class="sorting"></div>
				<div class="sorting mr-auto">

					
					
					
					
     <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>내 정보 수정하기 </h2>
            <br>

            <form action="update.me" method="post" id="modi">
                <div class="form-group">
                    <label>* ID :</label>
                    <input type="text" class="form-control" name="userId" value="${ loginUser.userId }" readonly><br>
                    
                    <label>* PW :</label> <!--  onclick ="goUpPwd()" -->
                    <input type="password" class="form-control" name="userPwd" value="" placeholder="비밀번호변경하기" readonly="readonly"><br>
                   	<div><a data-toggle="modal" data-target="#updatePwd" style="color: red;">비밀번호 변경을 원하시면 '이곳'을 클릭해주세요 </a></div>
                    <br>
                    
                    <label for="userName">* Name :</label>
                    <input type="text" class="form-control" id="userName" name="userName" value="${ loginUser.userName }" readonly><br>
                    
                    <label for="email"> &nbsp; Email :</label>
                    <input type="email" class="form-control" id="email" name="email" value="${ loginUser.email }"><br>
                    
                    <label for="phone"> &nbsp; Phone :</label>
                    <input type="tel" class="form-control" id="phone" name="phone" value="${ loginUser.phone }"><br>
                    
                    <label for="address"> &nbsp; Address :</label><br>
                    
              	
				<c:forTokens var="addr" items="${ loginUser.address }" delims="/" varStatus="status">
					<c:if test="${ status.index eq 0 && addr >= '0' && addr <= '99999' }">
						<c:set var="post" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 0 && !(addr >= '0' && addr <= '99999') }">
						<c:set var="address1" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 1 }">
						<c:set var="address1" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 2 }">
						<c:set var="address2" value="${ addr }"/>
					</c:if>
				</c:forTokens>
				
				
				<div class="col-md-12 form-group">
				<input class="form-control" type="text" id="sample4_postcode" name="post" placeholder="우편번호"  value="${ post }"readonly>
				</div>
				<div class="col-md-12 form-group">
				<input class="button button-tracking" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
				</div>
				<div class="col-md-12 form-group">
				<input class="form-control" type="text" id="sample4_roadAddress" name="address1"placeholder="도로명주소" value="${ address1 }" size="30" readonly>
				</div>
				<div class="col-md-12 form-group">
				<input class="form-control" type="hidden" id="sample4_jibunAddress" placeholder="지번주소" size="30" disabled>
				</div>
				<div class="col-md-12 form-group">
				<input class="form-control" id="guide" style="color:#999;display:none">
				</div>
				<div class="col-md-12 form-group">
				<input class="form-control" type="text" id="sample4_detailAddress" name="address2" placeholder="상세주소" value="${ address2 }"  size="30">
				</div>
				<div class="col-md-12 form-group">
				<input class="form-control" type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="30">
				</div>
				<div class="col-md-12 form-group">
				<input class="form-control" type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="30">
				</div>

          	        <label > &nbsp; Gender : </label> &nbsp;&nbsp;
                    <input type="radio" name="gender" id="Male" value="M">
                    <label for="Male">남자</label> &nbsp;&nbsp;
                    <input type="radio" name="gender" id="Female" value="F">
                    <label for="Female">여자</label><br>
   
                    
                  
               	<script>
                    	$(function(){
                    		if("${loginUser.gender}" == "M"){
                    			$("#Male").attr("checked", true);
                    		}else if("${loginUser.gender}" == "F"){
                    			$("#Female").attr("checked", true);
                    		}
                    	});
                    	
                    	console.log("loginUser");
                    </script> 
                    
                    
                    
                </div>
                <br>
                
                <div class="btns" align="center">
                    <button type="submit" class="btn btn-primary" onclick="modify();">수정하기</button>
                    <button type="button" onclick="ask()" class="btn btn-danger">탈퇴하기</button>
                </div>
            </form>
            <br><br>
            
                         
         <div class="modal fade" id="updatePwd" style="margin-top: 30%; margin-left: 50%; width: 300px; height: 300px">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">
						
							<div class="modal-header">
								<h4 class="modal-title">비밀번호 변경 창 </h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<form action="updatePwd.me" method="post">
								
								<div class="modal-body">
									<label for="userId" class="mr-sm-2"></label> <input
										type="hidden" class="form-control mb-2 mr-sm-2"
										placeholder="아이디를 입력해주세요" id="userId" name="userId" value="${loginUser.userId }"> <br>
									<label for="userPwd" class="mr-sm-2">변경하실 비밀번호를 입력해주세요 </label> <input
										type="password" class="form-control mb-2 mr-sm-2"
										placeholder="변경하실 비밀번호를 입력해주세요" id="userPwd" name="userPwd" required="required">
								</div>

							
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary" onclick="cha();">비밀번호변경</button>
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div> 
                    

        </div>
    </div>
    
		     <form action="delete.me" method="post" id="postForm">
    	<input type="hidden" name="userId" value="${ loginUser.userId }">
		    </form>

					
					</div>
				</div>
			</div>
		</div>
	</div>
    
  </section>
  
  
  
  
  <jsp:include page="../common/footer.jsp" />
  
  
  
  <script>
  
			function cha() {
				alert("비밀번호가 변경 되었습니다.");
			}

			function ask() {

				if (confirm("정말 탈퇴하시겠습니까??") == true) {
					$('#postForm').submit();
				} else {

					return;

				}

			}

			function modify() {
				alert("정보가 변경 되었습니다.");

			}
		</script>

<!-- 다음 우편번호 api  -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById("sample4_roadAddress").value = roadAddr;
							document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

							document.getElementById("sample4_engAddress").value = data.addressEnglish;

							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							if (roadAddr !== '') {
								document.getElementById("sample4_extraAddress").value = extraRoadAddr;
							} else {
								document.getElementById("sample4_extraAddress").value = '';
							}

							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open();
		}
	</script>


</body>
</html>
