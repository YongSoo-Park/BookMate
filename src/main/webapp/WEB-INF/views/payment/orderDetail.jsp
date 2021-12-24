<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
	<style>
		#paymentInnerWrap_1 {
			width: 750px;
		}
		
		#paymentInnerWrap_2 {
			width: 450px;
		}
		
		.paymentInnerWrap_1 {
			width: 650px;
			margin: auto;
		}
		
		#userAccountDiv, #paymentInfo, #paymentInfoWrap, #usePoint {
			padding-left: 40px;
			padding-right: 40px;
		}
		
		#deliveryRequest {
			width: 60%;
			display: none;
			resize: none;
		}
		
		#paymentInfo {
			border: 1px solid gray;
		}
		
		#paymentInfo .innerInfo {
			display: flex;
		}
		
		.rightValue {
			margin-left: auto;
		}
		
		.paymentButton {
			width: 200px;
			height: 50px;
			font-size: 20px;
			font-family: "맑은 고딕";
			margin-top: 10px;
		}
		
		#usePointWrap .tdd {
			width: 45%;
			text-align: center;
		}
		
		.paymentMethod {
			border: 1px solid gray;
			display: flex;
			padding-left: 10px;
			padding-right: 10px;
		}
		
		.nomalMethod {
			width: 33.3%;
			border: gray 1px solid;
			text-align: center;
			height: 40px;
			align-items: center;
		}
		
		.nomalMethod p {
			margin: 10px;
		}
		
		.nomalMethodDiv, #paymentMethodDiv_2 {
			display: none;
		}
		
		#paymentInnerWrap_2 {
			position: fixed;
			left: 50%;
			transform: translate(150px, 0)
		}
		#pwdInputDiv button{
		    zoom: 2;
		    margin: 2px;
		}
		.cursorP{
		cursor: pointer;
		}
		.orderTitleSpan{
		font-size: 25px;
		font-weight: bold;
		}
		.mainTitleSpan{
		font-size: 35px;
		font-weight: bold;
		margin-left: 50px;
		margin-right: 50px;
		}
	</style>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		var mainPayment = "${requestScope.PMDetail.paymentMethodDetailNo}" // 현 로그인 유저의 저장된 기본 결제수단
		var methodStatus = (mainPayment > 0 ? 4 : 0); // 결제 수단 종류
		var savedMethodIndex = 0; // 선택된 저장 결제수단 인덱스
		var savedMethodLength = "${requestScope.savedMethodLength}"; // 선택된 저장 결제수단 개수
		
		
		// 다음 api
		function daumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수
	
					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}
	
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('postcode').value = data.zonecode;
					document.getElementById("address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("detailAddress").focus();
				}
			}).open();
		}
	
		// 휴대폰 번호 관련
		function phoneNumber(type, num) {
			var input = $("#phoneNum_" + num).val();
	
			//focus out인 경우 
			//input type을 text로 바꾸고 '-'추가
			if (type == 'blur') {
				$("#phoneNum_" + num).prop('type', 'text');
				var phone = checkPhoneNumber(input);
			}
	
			//focus인 경우
			//input type을 number로 바꾸고 '-' 제거
			if (type == 'focus') {
				var phone = input.replace(/-/gi, '');
				$("#phoneNum_" + num).prop('type', 'number');
			}
	
			$("#phoneNum_" + num).val(phone);
		}
	
		//전화번호 문자(-)
		function checkPhoneNumber(temp) {
			var number = temp.replace(/[^0-9]/g, "");
			var phone = "";
	
			if (number.length < 9) {
				return number;
			} else if (number.length < 10) {
				phone += number.substr(0, 2);
				phone += "-";
				phone += number.substr(2, 3);
				phone += "-";
				phone += number.substr(5);
			} else if (number.length < 11) {
				phone += number.substr(0, 3);
				phone += "-";
				phone += number.substr(3, 3);
				phone += "-";
				phone += number.substr(6);
			} else {
				phone += number.substr(0, 3);
				phone += "-";
				phone += number.substr(3, 4);
				phone += "-";
				phone += number.substr(7);
			}
	
			return phone;
		}
	

		//주소록에서 주소 불러오기 클릭시   
	 	function inputAddress(index) {
	
			   
			   $('#shippingNameInput').val($('#abookName'+index).text());
			   $('#postcode').val($('#abookPostcode'+index).text());
			   $('#address').val($('#abookAddress'+index).text());
			   $('#detailAddress').val($('#abookAddressDetail'+index).text());
			   $('#phoneNum_1').val($('#abookPhone'+index).text());
			   $('#addressModal').modal("hide");
			   $('#closeAddressModal').click();
	      
		}
		
		//배송요청 사항 보이기 숨기기
		function requestDelivery() {
	
			if ($('#deliveryRequest').css("display") == 'none') {
	
				$('#deliveryRequest').css("display", "inline")
			} else {
				$('#deliveryRequest').css("display", "none")
			}
		}
	
		
		 //보유 포인트 입력시 정보 변화
		  function checkUsePoint() {
			  var itemsPrise = parseInt('${requestScope.order.totalCost}');
			  var deliveryCost = parseInt('${requestScope.order.deliveryCost}');
			  var keepPoint = parseInt($('#hiddenPoint').val());
			  var usePoint = $('#usePointInput').val();
			  if(usePoint > keepPoint){
				  $('#usePointInput').val(keepPoint);
				  usePoint = keepPoint;
			  }
			  $('#pointInfoSpan').text(keepPoint-usePoint)
			  
			  $('#userPointP').html(usePoint)
			  if($('#userPointP').html()=='' ){
				  $('#userPointP').html(0) 
			  }
			  $('#totalPrice').html((itemsPrise-usePoint+deliveryCost).toLocaleString('ko-KR')+" 원")
			  
			  $('#usePointInput_2').val(usePoint)
			  $('#totalPayCost').val(itemsPrise-usePoint+deliveryCost)
		}
		  
		  // 보유 포인트 모두 사용시
		  function allUsePoint() {
			  $('#usePointInput').val($('#hiddenPoint').val())
			  checkUsePoint()
		}
		
		
		
		
		//일반결제수단 저장된 결제수단 선택시 ui
		function checkPaymentMethodDiv(num) {
			if (num == 1) {
				var arrNum = [ '1', '2' ];
				methodStatus = 4;
			} else {
				var arrNum = [ '2', '1' ];
	
				$('#paymentMethodForm')[0].reset();
			}
			if ($('#paymentMethodDiv_' + arrNum[0]).css("display") == 'block') {
				$('#paymentMethodP_' + arrNum[0]).html("열기 ▽");
				$('#paymentMethodDiv_' + arrNum[0]).css("display", "none");
			} else {
				$('#paymentMethodP_' + arrNum[0]).html("닫기 △");
				$('#paymentMethodDiv_' + arrNum[0]).css("display", "block");
				$('#paymentMethodP_' + arrNum[1]).html("열기 ▽");
				$('#paymentMethodDiv_' + arrNum[1]).css("display", "none");
			}
	
		}
		
		//일반 결제수단 종류 선택시 그에 맞는 폼 보여주기
		function checkNomalMethodDiv(num) {
			$('#nomalMethodDiv_' + num).css('display', 'block');
			$('.nomalMethodDiv').not('#nomalMethodDiv_' + num).css('display',
					'none');
	
			$('#nomalMethod_' + num).css('border-bottom', 'none');
			$('.nomalMethod').not('#nomalMethod_' + num).css('border-bottom',
					'solid 1px gray');
			methodStatus = parseInt(num);
			$('#paymentMethod').val(methodStatus)
		}
		
		//결제수단 입력시 모든 정보가 입력되었는지 체크
		function paymentInfoCheck() {
			if(methodStatus==1){
				if(!$('#cardCVC').val()||!$('#cardNo').val()||!$('input[name=cardCompany]:checked').val()){
					alert("모든 결제 정보를 입력하셔야 합니다.")
					return false;
				}
			}
			else if(methodStatus==2){
				if(!$('#userReg_1_1').val()||!$('#userReg_1_2').val()||!$('#bankAccount').val()||!$('#bankPwd').val()||!$('input[name=bankName]:checked').val()){
					alert("모든 결제 정보를 입력하셔야 합니다.")
					return false;
				}else{
					$('#userReg').val($('#userReg_1_1').val()+"-"+$('#userReg_1_2').val())
				}
			}else if(methodStatus==3){
				if(!$('#userReg_2_1').val()||!$('#userReg_2_2').val()||!$('#phoneNum_2').val()){
					alert("모든 결제 정보를 입력하셔야 합니다.")
					return false;
				}else{
					$('#userReg').val($('#userReg_2_1').val()+"-"+$('#userReg_2_2').val())
				}
			}
			
			return true;
		}
		
		
		//결제수단 저장시 정보 체크
		function insertMethodCheck(num) {
			
			if(!paymentInfoCheck()){
				return false
			}
	
			$('#inputPwdModal').modal('show');
				
		}
		
		 // 결제수단 비밀번호 저장시 체크
		  function inputPwd() {
		        var pwd1 = $('#password_1').val();
		        var pwd2 = $('#password_2').val();
		        if(pwd1 != pwd2){
		            alert("비밀번호가 서로 다릅니다.\n새로입력 해 주십시오.")
		            $('#password_1').focus();
		            return false;
		        }
		        if(pwd1.length<6){
		            alert("비밀번호는 최소 6자리 이상의\n숫자로 입력해 주십시오")
		            $('#password_1').focus();
		            return false;
		        }
		        
		        $('#methodPwd').val(pwd1);
		    	if(confirm("입력하신 결제정보를 등록 하시겠습니까?")){
					
	
			        $('#closeModal1').click();
					confirmInsertPMethod();
					
				}
		    }
		
		//결제수단 저장 ajax
		function confirmInsertPMethod() {
			$.ajax({
				url : "insertPaymentMethod.sc",
				method : "post",
				data : {
					paymentMethod : methodStatus,
					cardCompany : $('input[name=cardCompany]:checked').val(),
					cardNo : $('#cardNo').val(),
					cardCVC : $('#cardCVC').val(),
					phoneNo : $('#phoneNum_2').val(),
					userReg : $('#userReg').val(),
					bankName : $('input[name=bankName]:checked').val(),
					bankPwd : $('#bankPwd').val(),
					bankAccount : $('#bankAccount').val(),
					user_Id : $('#user_Id').val(),
					methodPwd : $('#methodPwd').val()
				},
				success : function(number) {
					
					alert("결제 정보가 등록되었습니다.")
					$('#selectPayMethod').val(number);
					if(methodStatus==1){
						$('#methodNameSpan').html($('input[name=cardCompany]:checked').val()+'카드');
						$('#methodNumSpan').html($('#cardNo').val().substring(0,4));
					}else if(methodStatus==2){
						$('#methodNameSpan').html($('input[name=bankName]:checked').val()+'은행');
						$('#methodNumSpan').html($('#bankAccount').val().substring(0,6));
					}else{
						$('#methodNameSpan').html('휴대폰 결제')
						$('#methodNumSpan').html('뒷번호 : '+$('#phoneNum_2').val().substring($('#phoneNum_2').val().length-4,$('#phoneNum_2').val().length))
					}
					if(mainPayment==""){
											
						mainPayment = parseInt(number);
						savedMethodLength = 1;
					}else{
						savedMethodIndex = savedMethodLength;
						savedMethodLength = parseInt(savedMethodLength)+1;
					}
					console.log(savedMethodLength)
					checkPaymentMethodDiv(1);
				}
				
			})
		}
		
		//저장된 결제수단 교체
		function saveMethodIndexMove(num) {
			var selectMethodIndex = parseInt(savedMethodIndex) + parseInt(num);
			
			if(savedMethodLength < 2 || savedMethodLength == ""){
				return false;
			}
			
			if(selectMethodIndex < 0 ){
				selectMethodIndex = savedMethodLength - 1;
	
			}else if(selectMethodIndex == savedMethodLength){
				selectMethodIndex = 0;
			}
			
			$.ajax({
			
				url : "selectPaymentMethod",
				type : "post",
				data : {
					selectMethodIndex : selectMethodIndex,
					user_Id : $('#user_Id').val(),
					mainPayment : mainPayment
				},
				success : function(data) {
					
					if(data.methodStatus==1){
						$('#methodNameSpan').html(data.cardCompany+'카드')
						$('#methodNumSpan').html(data.cardNo.substring(0,4));
						$('#paymentMethod').val(1)
					}else if(data.methodStatus==2){
						$('#methodNameSpan').html(data.bankName+'은행')
						$('#methodNumSpan').html(data.bankAccount.substring(0,6));
						$('#paymentMethod').val(2)
					}else{
						$('#methodNameSpan').html('휴대폰 결제')
						$('#methodNumSpan').html('뒷번호 : '+data.phoneNo.substring(data.phoneNo.length-4,data.phoneNo.length));
						$('#paymentMethod').val(3)
					}
					
	
					$('#selectPayMethod').val(data.paymentMethodDetailNo);
					savedMethodIndex = selectMethodIndex
				},
				error : function(e) {
					alert("결제수단 교체 ajax 통신 실패")
				}
				
				
				
			})
			
			
	
			
		}
		
	/* 	function selectMethod(num) {
			$.ajax({
			
				url : "selectPaymentMethod",
				type : "post",
				data : {
					selectMethodIndex : num,
					mainPayment : mainPayment,
					user_Id : $('#user_Id').val()
				},
				success : function(map) {
					console.log(map['pop'].bankAccount)
					console.log(map['11'])
				}
				
			})
			
		} */
		  
		  
		  
		  
		 
		  
		  
		  
		 
	
		  //비밀번호 키패드 입력 숫자
		    function pwdInputButton(num) {
		        var selectNum = $('input[name=selectPassword]:checked').val();
		        var pwd = $('#password_'+selectNum).val()
		        pwd = pwd + (num.value+"");
		        console.log(pwd);
		        $('#password_'+selectNum).val(pwd)
		    }
	
		  //비밀번호 키패드 숫자 삭제
		    function pwdInputDelButton() {
		        var selectNum = $('input[name=selectPassword]:checked').val();
		        var pwd = $('#password_'+selectNum).val()
		        pwd = pwd.substring(0,pwd.length-1);
		        console.log(pwd);
		        $('#password_'+selectNum).val(pwd)
		    }
		  //비밀번호 키패드 입력시 input 창클릭시 라디오 버튼 체크 
		    function clickPwdInput(num) {
		        console.log(num)
		        $('#selectPassword_'+num).prop("checked",true)
		        $('.selectPassword').not($('#selectPassword_'+num)).prop("checked",false)
		    }
		  
		
		    //결제 버튼 클릭시
		   function moveInsertPayment() {
		    	if(!checkStock()){
		    		 return false
		    	}
			   
			   if(!$('#orderCheck').prop("checked")){
				   alert("주문 내역 확인 동의를 체크해 주십시오")
				   return false
				   
			   }
			   
			   if(methodStatus==1||methodStatus==2){
				   if(!paymentInfoCheck()){
						return false
					}
				   if(confirm("입력하신 정보로 결제를 진행 하시겠습니까?")){
	
						$('#insertPaymentForm').submit();
					   
				   }
			   }else if(methodStatus==3){
				   if(!paymentInfoCheck()){
						return false
					}
	
				   $('#payPhonePwd').modal('show');
			   }else if(methodStatus==4&&savedMethodLength>0){
				   $('#payPwdModal').modal('show');
			   }else{
				  
				   alert("결제 정보를 입력하셔야 합니다.")
			   }
				   
			   
		}
		    
		   // 저장된 결제수단 사용 비밀번호 입력시
		    function payInputPwd() {
		    	if(parseInt(methodStatus)==4){
		    		$('#paymentMethod').val(mainPayment)
		    	}
		    	$.ajax({
		    		
		    		url : "checkPayPwd",
		    		type : "post",
		    		data : {
	
			    		paymentMethodDetailNo : $('#selectPayMethod').val(),
			    		methodPwd : $('#password_3').val()
		    			
		    		},
					success : function(str) {
						if(str=='pass'){
	
							$('#closeModal2').click();
							$('#insertPaymentForm').submit();
						}else{
							alert("입력하신 비밀번호가 일치하지 않습니다\n다시 확인해 주십시오")
							$('#selectPassword_3').focus()
							return false;
						}
						
					},
					error : function(e) {
	
						
						alert("결제 비밀번호 입력 ajax 통신 오류")
					}
		    		
		    	})
		    	
		    	
			}
		   
		   //일반결제 중 휴대폰 번호 결제시 확인 문자 번호 입력
		   function inputPhonePwd() {
			if($('#inputPhonePwd').val()=='1111'){
				$('#closeModal3').click();
				$('#insertPaymentForm').submit();
			}else{
				alert("휴대폰 결제 번호를 다시 확인해 주십시오\n테스트 설정비밀번호 1111")
				return false;
			}
		}
		   
		  
		   
		   //결제 전 도서 재고를 다시 한번 체크
		   function checkStock() {
			   var formData = $("#checkStockForm").serialize();
			   var check = false;
			  
		        $.ajax({
		            url : "checkStockForm.pm", 
		            type : 'POST', 
		            cache: false,
		            data : formData, 
		            async:false, 
		            success : function(str) {
		                if(str != "pass"){
		                	alert("주문하시려는 도서의 재고가 부족합니다\n확인하시고 다시 결제해 주십시오")
		                	check = false;
		                	
		                }else{
		                	check = true;
		                }
		            }, 
		    
		            error : function(e) {
		                alert ("재고 체크중 ajax통신 오류");
		            }
		        }); 
		        return check;
		}
		   
		   //장바구니 되돌아 가기를 클릭시
		   function moveShoppingCart() {
			if(confirm("정말 장바구니로 되돌아 가시겠습니까?")){
				$('#moveShoppingCartFomr').submit();
			}
		}
	</script>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
	<main class="site-main" style="padding-top: 180px">
		<br><hr><br>
		<div style="text-align: center; background-color: lightgray;">
			<span class="mainTitleSpan" >장바구니</span><span class="mainTitleSpan"> 〉</span><span class="mainTitleSpan" style="font-size: 40px;color: olive;">결제</span><span class="mainTitleSpan"> 〉</span><span class="mainTitleSpan">주문완료</span>
		</div><br><br><br>
		<div id="paymentWrap" style="display: flex;">
			<div id="paymentInnerWrap_1">
				<div id="userAccountWrap" class="paymentInnerWrap_1">
					<span class="orderTitleSpan">배송지 정보 </span>
					<br><br><hr><br>
					<form action="insertPayment" method="post" id="insertPaymentForm">
						<input type="hidden" id="user_Id" name="user_Id" value="${sessionScope.loginUser.userId}">
						<input type="hidden" id="usePointInput_2" name="usePoint" value="0" >
						<input type="hidden" name="totalGetPoint" value="${requestScope.order.totalGetPoint}">
						<input type="hidden" id="totalPayCost" name="totalPayCost" value="${requestScope.order.totalCost+requestScope.order.deliveryCost}">
						<input type="hidden" name="deliveryCost" value="${requestScope.order.deliveryCost}">
						<input type="hidden" id="paymentMethod" name="paymentMethod" value="">				
						<input type="hidden" name="totalCost" value="${requestScope.order.totalCost}">
						<c:forEach items="${requestScope.orderList}" var="list"	varStatus="status">
							<input type="hidden" name="paymentDetailList[${status.index}].bookISBN" value="${list.bookISBN}">
							<input type="hidden" name="paymentDetailList[${status.index}].bookMainImg" value="${list.bookMainImg}">
							<input type="hidden" name="paymentDetailList[${status.index}].bookTitle" value="${list.bookTitle}">
							<input type="hidden" name="paymentDetailList[${status.index}].quantity" value="${list.quantity}">
							<input type="hidden" name="paymentDetailList[${status.index}].bookPrice" value="${list.bookPrice}">
							<input type="hidden" name="paymentDetailList[${status.index}].salePrice" value="${list.salePrice}">
							<input type="hidden" name="paymentDetailList[${status.index}].getPoint" value="${list.getPoint}">
							<input type="hidden" name="basketList[${status.index}].basketNo" value="${requestScope.deleteBasketList[status.index].basketNo}">
							<input type="hidden" name="basketList[${status.index}].quantity" value="${requestScope.deleteBasketList[status.index].quantity}">
							<input type="hidden" name="basketList[${status.index}].bookISBN" value="${requestScope.deleteBasketList[status.index].bookISBN}">							
						</c:forEach>
						<div id="userAccountDiv">
							<input type="text" placeholder="이름"
								value="${requestScope.order.shippingName}" name="shippingName" id="shippingNameInput"> 
							<input type="button" onclick="daumPostcode()" value="새 주소 입력"> 
							<button type="button" data-toggle="modal" data-target="#addressModal">주소록 불러오기</button> 
							<br><br> 
							<input type="text" id="postcode" placeholder="우편번호"
								value="${requestScope.order.shippingPostCode}" name="shippingPostCode"><br>
							<input type="text" id="address" placeholder="주소"
								value="${requestScope.order.shippingAddress}" name="shippingAddress"><br> 
							<input
								type="text" id="detailAddress" placeholder="상세주소"
								value="${requestScope.order.shippingAddressDetail}" name="shippingAddressDetail"><br><br> 
							<input type="text" placeholder="전화번호(- 를 제외 숫자만)"
								onfocus="phoneNumber('focus','1')"
								onblur="phoneNumber('blur','1')" id="phoneNum_1"
								value="${requestScope.order.shippingPhone}" name="shippingPhone"><br><br>
							<div style="text-align: right;">
								<span style="cursor: pointer; font-weight: bold;" onclick="requestDelivery()">배송요청사항☜</span><br><br>
								<textarea name="deliveryRequest" id="deliveryRequest" cols="30"
									rows="5" placeholder="100자 이하로 입력해주세요" maxlength="100">배달 수고하십니다.</textarea>
							</div>
	
						</div>
					</form>
					<form action="checkStock" method="post" id="checkStockForm">
						<c:forEach items="${requestScope.deleteBasketList}" var="list"	varStatus="status">
							<input type="hidden" name="basketList[${status.index}].quantity" value="${list.quantity}">
							<input type="hidden" name="basketList[${status.index}].bookISBN" value="${list.bookISBN}">
						</c:forEach>
					</form>		
					<hr>
				</div>
				<br><br><br>
				<div id="buyingBookWrap" class="paymentInnerWrap_1">
					<span class="orderTitleSpan">주문상품</span><br>
					<br><hr><br>
					<c:forEach items="${requestScope.orderList}" var="list"	varStatus="status">
						<div id="buyingBook" style="display: flex;">
							<div class="media" style="width: 50%; display: flex;">
								<div class="d-flex">
									<img
										src="${pageContext.servletContext.contextPath }/resources/images/book_img/${list.bookMainImg}"
										style="height: 150px">
								</div>
								<div class="media-body">
									<p>${list.bookTitle}</p>
								</div>
							</div>

							<div style="display: flex; align-items: center; width: 50%; text-align: center;">
								<div style="width: 50%;">
									<span style="text-decoration: line-through">
										<fmt:formatNumber value="${list.bookPrice}" />원 
									</span><br> 
									<span><fmt:formatNumber value="${list.salePrice}" /></span>원(↓ 10%)<br> 
									<span><fmt:formatNumber value="${list.getPoint}" />pt 적립</span><br><br> 
									<span>${list.quantity}권</span>
								</div>
								<div style="width: 50%;">
									<fmt:formatNumber value="${list.salePrice*list.quantity}" /> 원
								</div>
							</div>
						</div>
						<br><br>
					</c:forEach>
					<hr>
				</div>
				<br><br><br>
				<div id="usePointWrap" class="paymentInnerWrap_1">
					<span class="orderTitleSpan">포인트사용</span><br>
					<br><hr><br>
					<div id="usePoint">
						<input type="hidden" id="hiddenPoint" value="${sessionScope.loginUser.point}">
						<table>
							<tr>								
								<td class="tdd">보유포인트 : <span id="pointInfoSpan">${sessionScope.loginUser.point}</span>pt</td>
								<td class="tdd">사용 : <input type="number"
									style="width: 100px;" id="usePointInput" onkeyup="checkUsePoint()" min="0"> pt
								</td>
								<td><input type="button" value="모두사용" onclick="allUsePoint()"></td>
							</tr>
						</table>
					</div>
					<br><hr>
				</div>
				<br><br><br>
				<div id="paymentMethodWrap" class="paymentInnerWrap_1">
					<span class="orderTitleSpan">결제정보</span><br>
					<br><hr><br>
					<div class="paymentMethod">
						<p>저장된 결제수단으로 결제</p>
						<p class="rightValue cursorP" id="paymentMethodP_1"
							onclick="checkPaymentMethodDiv(1)" >닫기 △</p>
					</div><br>
					<div id="paymentMethodDiv_1">
						<input type="hidden" id="selectPayMethod" name="selectPayMethod" value="${requestScope.PMDetail.paymentMethodDetailNo}">
						<div  style="display: flex; align-items: center;">
							<div style="margin: auto;">
								<img src="${pageContext.servletContext.contextPath }/resources/img/btn_prev.gif"
								height="50px" style="margin-right: 15px; cursor: pointer;"
								onclick="saveMethodIndexMove(-1)">
							</div>
							<div style="margin: auto;">
								<img src="${pageContext.servletContext.contextPath }/resources/img/wallet.png" style="height: 200px"><br>
								<c:choose>
									<c:when test="${requestScope.PMDetail.methodStatus==1}">
										<span id="methodNameSpan">${requestScope.PMDetail.cardCompany}카드</span><br>
										<span id="methodNumSpan">${fn:substring(requestScope.PMDetail.cardNo,0,4) }</span>
									</c:when>
									<c:when test="${requestScope.PMDetail.methodStatus==2}">
										<span id="methodNameSpan">${requestScope.PMDetail.bankName}은행</span><br>
										<span id="methodNumSpan">${fn:substring(requestScope.PMDetail.bankAccount,0,6) }</span>
									</c:when>
									<c:when test="${requestScope.PMDetail.methodStatus==3}">
										<span id="methodNameSpan">휴대폰 결제</span><br>
										<span id="methodNumSpan">뒷번호 : ${fn:substring(requestScope.PMDetail.phoneNo,fn:length(requestScope.PMDetail.phoneNo)-4,fn:length(requestScope.PMDetail.phoneNo)) }</span>
									</c:when>
									<c:otherwise>
										<span id="methodNameSpan">저장된 결제 수단이 없습니다</span><br>
										<span id="methodNumSpan"></span>
									</c:otherwise>
								</c:choose>
							</div>
							<div style="margin: auto;">
								<img src="${pageContext.servletContext.contextPath }/resources/img/btn_next.gif"
								height="50px" style="margin-left: 15px; cursor: pointer;"
								onclick="saveMethodIndexMove(1)">
							</div>
						</div>
					
					</div>
					<br>
					<form action="" id="paymentMethodForm">
						<div class="paymentMethod">
							<p>일반 결제 - 결제 수단 저장</p>
							<p class="rightValue cursorP" id="paymentMethodP_2"
								onclick="checkPaymentMethodDiv(2)" >열기 ▽</p>
						</div>
						<br>
						<div id="paymentMethodDiv_2">
							<div style="display: flex;">
								<div id="nomalMethod_1" class="nomalMethod cursorP"
									onclick="checkNomalMethodDiv('1')">
									<p>신용카드 결제</p>
								</div>
								<div id="nomalMethod_2" class="nomalMethod cursorP"
									onclick="checkNomalMethodDiv('2')">
									<p>실시간 계좌이체</p>
								</div>
								<div id="nomalMethod_3" class="nomalMethod cursorP"
									onclick="checkNomalMethodDiv('3')">
									<p>휴대폰 결제</p>
								</div>
								<input type="hidden" name="methodPwd" id="methodPwd">
								<input type="hidden" name="userReg" id="userReg"> 
							</div>
							<div id="nomalMethodDiv_1" class="nomalMethodDiv">
								<br> 카드 회사<br><br> 
								<input type="radio" name="cardCompany" value="신한">신한카드
								<input type="radio" name="cardCompany" value="KB국민">KB국민카드
								<input type="radio" name="cardCompany" value="BC">BC카드 <input
									type="radio" name="cardCompany" value="현대">현대카드 <input
									type="radio" name="cardCompany" value="롯데">롯데카드<br>
								<input type="radio" name="cardCompany" value="하나">하나카드 <input
									type="radio" name="cardCompany" value="삼성">삼성카드 <input
									type="radio" name="cardCompany" value="우리">우리카드 <input
									type="radio" name="cardCompany" value="씨티">씨티카드 <input
									type="radio" name="cardCompany" value="NH">NH카드 <br><br> 
								카드 번호 : <input type="number" id="cardNo" name="cardNo"
									placeholder="- 를 제외한 숫자만 입력"> <br><br> 
								카드 CVC : <input type="number" id="cardCVC" name="cardCVC"
									placeholder="CVC 를 입력해주세요" style="-webkit-text-security: disc;">
								<br><br>
								<button type="button" onclick="insertMethodCheck(1)">결제수단 정보 저장</button>
								<hr>
							</div>
							<div id="nomalMethodDiv_2" class="nomalMethodDiv">
								<br> 결제 은행<br><br> 
								<input type="radio" name="bankName" value="신한">신한은행
								<input type="radio" name="bankName" value="KB국민">KB국민은행
								<input type="radio" name="bankName" value="기업">기업은행
								<input type="radio" name="bankName" value="우체국">우체국 
								<input type="radio" name="bankName" value="하나">하나은행<br> 
								<input type="radio" name="bankName" value="우리">우리은행
								<input type="radio" name="bankName" value="씨티">씨티은행 
								<input type="radio" name="bankName" value="NH">NH은행 <br><br> 
								은행 계좌번호 : <input type="number" name="bankAccount"
									placeholder="- 를 제외한 숫자만 입력" id="bankAccount"> <br><br> 
								은행 비밀번호 : <input type="number" name="bankPwd"
									placeholder="CVC 를 입력해주세요" style="-webkit-text-security: disc;" id="bankPwd"><br><br> 
								예금주 주민등록번호 : <br>  <input type="number" id="userReg_1_1"
									placeholder="주민번호 앞자리"> - <input type="number" id="userReg_1_2"
									placeholder="주민번호 뒷자리" style="-webkit-text-security: disc;">
								<br><br>
								<button type="button" onclick="insertMethodCheck(2)">결제수단 정보 저장</button>
								<hr>
							</div>
							<div id="nomalMethodDiv_3" class="nomalMethodDiv">
								<br> 결제 할 휴대폰 번호<br> <input type="text"
									placeholder="전화번호(- 를 제외 숫자만)"
									onfocus="phoneNumber('focus','2')"
									onblur="phoneNumber('blur','2')" id="phoneNum_2" name="phoneNo">
								<br>
								<br> 결제 주민등록번호 : <br> <input type="number" id="userReg_2_1"
									placeholder="주민번호 앞자리"> - <input type="number" id="userReg_2_2"
									placeholder="주민번호 뒷자리" style="-webkit-text-security: disc;">
								<br>
								<br>
								<button type="button" onclick="insertMethodCheck(3)">결제수단 정보 저장</button>
								<hr>
							</div>
						</div>
					</form>


				</div>


			</div>

			<div id="paymentInnerWrap_2">
				<div id="paymentInfoWrap">
					<div id="paymentInfo">
						<div
							style="text-align: center; font-weight: bold; font-size: 20px;">
							<br> <fmt:formatDate value="${requestScope.orderList[0].deliveryDate}" pattern="yyyy년 MM월 dd일"/> 출고 예정 
						</div>
						<br>
						<div>상품별 출고일정이 다른경우 가장 늦은 상품 기준으로 함께 출고됩니다.</div>
						<br>
						<hr>
						<div class="innerInfo">
							<p>상품금액</p>
							<p class="rightValue">
								<fmt:formatNumber value="${requestScope.order.totalCost}" />
								원
							</p>
						</div>
						<div class="innerInfo">
							<p>배송비</p>
							<p class="rightValue" id="userDeliveryCost">${requestScope.order.deliveryCost}</p>원
						</div>
						<div class="innerInfo">
							<p>사용포인트</p>
							<p class="rightValue" id="userPointP">0</p>pt
						</div>
						<hr>
						<div class="innerInfo">
							<p>최종 결제 금액</p>
							<p class="rightValue"
								style="font-size: 25px; color: red; font-weight: bold" id="totalPrice">
								<fmt:formatNumber value="${requestScope.order.totalCost+requestScope.order.deliveryCost}" />
								원
							</p>
						</div>
						<hr>
						<div class="innerInfo">
							<p>적립예정 포인트</p>
							<p class="rightValue">
								<fmt:formatNumber value="${requestScope.order.totalGetPoint}" />
								pt
							</p>
						</div>
						<hr>
						<div class="innerInfo" style="align-items: center;">
							<input type="checkbox" style="zoom: 1.5;" id="orderCheck">
							<p style="margin: 5px">주문내역확인 동의(필수)</p>
						</div>
						<hr>
						<div style="text-align: center;">
							<button class="paymentButton" onclick="moveInsertPayment()">결제하기</button>
							<br>
							<button class="paymentButton" onclick="moveShoppingCart()">장바구니로 가기</button>
						</div>
						<form action="shoppingCart.sc" method="post" id="moveShoppingCartFomr">
							<input type="hidden" name="user_Id" value="${sessionScope.loginUser.userId}">
						</form>
						<br>
						<br>
					</div>
				</div>
			</div>
		</div>
		<br><br><br><br><br><br><br>




		<!-- 모달창 div 들 -->

		 <div class="modal fade" id="inputPwdModal"style="z-index: 10000">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">결제 비밀번호 등록</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button> 
                </div>
    
                    <div class="modal-body" >
                        <input type="radio" name="selectPassword" value="1"  id="selectPassword_1" class="selectPassword">
                        <label for="userId" class="mr-sm-2">비밀번호 :</label>
                        <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter password" id="password_1" readonly onfocus="clickPwdInput(1)"> <br>
                        <input type="radio" name="selectPassword" value="2" id="selectPassword_2" class="selectPassword">
                        <label for="userPwd" class="mr-sm-2">비밀번호 확인:</label>
                        <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter password" id="password_2" readonly onfocus="clickPwdInput(2)"><br>
                        <div id="pwdInputDiv" style="text-align: center;">
                            <button type="button" value="1" onclick="pwdInputButton(this)">1</button><button type="button" value="2" onclick="pwdInputButton(this)">2</button><button type="button" value="3" onclick="pwdInputButton(this)">3</button><br>
                            <button type="button" value="4" onclick="pwdInputButton(this)">4</button><button type="button" value="5" onclick="pwdInputButton(this)">5</button><button type="button" value="6" onclick="pwdInputButton(this)">6</button><br>
                            <button type="button" value="7" onclick="pwdInputButton(this)">7</button><button type="button" value="8" onclick="pwdInputButton(this)">8</button><button type="button" value="9" onclick="pwdInputButton(this)">9</button><br>
                            <button type="button" value="0" onclick="pwdInputButton(this)">0</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="pwdInputDelButton()">←</button>
                        </div>
                    </div>
                    
                    <div class="modal-footer" >
                        <button type="button" class="btn btn-primary mr-auto" onclick="inputPwd()">비밀번호 등록</button>
                        <button type="button" class="btn btn-danger" id="closeModal1" data-dismiss="modal">취소</button>
                    </div>
                
                </div>
            </div>
        </div>
        
		<div class="modal fade" id="payPwdModal"style="z-index: 10000">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">결제 비밀번호 입력</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button> 
                </div>
    
                    <!-- Modal Body -->
                    <div class="modal-body" >
                        
                        
                        <label for="payPassword" style="font-size: 30px; font-weight: bold;">비밀번호 입력:</label>
                        <input type="radio" name="selectPassword" value="3" checked style="visibility: hidden;" id="selectPassword_3" class="selectPassword"><br>
                        <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter password" id="password_3" readonly onfocus="clickPwdInput(3)"> <br>
                        <div id="pwdInputDiv" style="text-align: center;">
                            <button type="button" value="1" onclick="pwdInputButton(this)">1</button><button type="button" value="2" onclick="pwdInputButton(this)">2</button><button type="button" value="3" onclick="pwdInputButton(this)">3</button><br>
                            <button type="button" value="4" onclick="pwdInputButton(this)">4</button><button type="button" value="5" onclick="pwdInputButton(this)">5</button><button type="button" value="6" onclick="pwdInputButton(this)">6</button><br>
                            <button type="button" value="7" onclick="pwdInputButton(this)">7</button><button type="button" value="8" onclick="pwdInputButton(this)">8</button><button type="button" value="9" onclick="pwdInputButton(this)">9</button><br>
                            <button type="button" value="0" onclick="pwdInputButton(this)">0</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="pwdInputDelButton()">←</button>
                        </div>
                    </div>
                    

                    <!-- Modal footer -->
                    <div class="modal-footer" >
                        <button type="button" class="btn btn-primary mr-auto" onclick="payInputPwd()">비밀번호 입력</button>
                        <button type="button" class="btn btn-danger" id="closeModal2" data-dismiss="modal">취소</button>
                    </div>
                
                </div>
            </div>
        </div>
        
        <div class="modal fade" id="payPhonePwd" style="z-index: 10000">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">결제 비밀번호 입력</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button> 
                </div>
    
                    <!-- Modal Body -->
                    <div class="modal-body" >
                        
                        
                        <label for="inputPhonePwd" >휴대폰 결제 번호입력:</label>
                        <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter password" id="inputPhonePwd" name="inputPhonePwd"> <br>
                       
                    </div>
                    

                    <!-- Modal footer -->
                    <div class="modal-footer" >
                        <button type="button" class="btn btn-primary mr-auto" onclick="inputPhonePwd()">비밀번호 입력</button>
                        <button type="button" class="btn btn-danger" id="closeModal3" data-dismiss="modal">취소</button>
                    </div>
                
                </div>
            </div>
        </div>
        
	    
	    <div class="modal fade" id="addressModal" style="z-index: 10000">
	        <div class="modal-dialog modal-lg">
	            <div class="modal-content">
	            <!-- Modal Header -->
	            <div class="modal-header">
	                <h4 class="modal-title">저장 주소 불러오기</h4>
	                <button type="button" class="close" data-dismiss="modal">&times;</button> 
	            </div>
	
	                <!-- Modal Body -->
	                <div class="modal-body" >
	                	
	                    <table class="abookTable">
	                        <tbody>
	                        	<c:forEach var="list" items="${requestScope.abook}" varStatus="status">
		                        	<tr>
		                        	<th colspan="3" style="font-size: 25px;font-weight: bold; height: 80px;">
		                        	<c:choose>
			                        	<c:when test="${status.index==0}">대표 주소</c:when>
			                        	<c:when test="${status.index==1}">이전 결제 주소</c:when>
			                        	<c:otherwise>저장된 주소 ${status.index-1}</c:otherwise>
		                        	</c:choose>
		                        	</th>
		                        	</tr>
		                            <tr>
		                            
			                            <td style="font-weight: bold; width: 25%;">
			                         		  이름 : <br><br> 우편번호 : <br> 주소 : <br> 상세주소 : <br><br> 전화번호 : <br>
			                            
			                            </td>
		                                
		                                <td>
		                                	<c:if test="${!empty list}">
				                                <span id="abookName${status.index}">${list[0]}</span><br><br>
				                                <span id="abookPostcode${status.index}">${list[1]}</span><br>
				                                <span id="abookAddress${status.index}">${list[2]}</span><br>
				                                <span id="abookAddressDetail${status.index}">${list[3]}</span><br><br>
				                                <span id="abookPhone${status.index}">${list[4]}</span><br>
			                                </c:if>
			                                <c:if test="${empty list}">
			                                		저장된 주소 없음
			                                </c:if>
		                                </td>                                
		                                <td style="width: 20%;text-align: center;">
			                               	<c:if test="${!empty list}">
			                              	  <button type="button" class="btn btn-secondary btn-sm" onclick="inputAddress(${status.index})">주소 불러오기</button>
			                                </c:if>
		                                </td>
		                            </tr>
		                            <tr>
		                            	<td colspan="3"><hr></td>
		                            </tr>
	                            </c:forEach>   
	                        </tbody>
	                    </table>
	                </div>
	                <!-- Modal footer -->
	                <div class="modal-footer" >	                
	                    <button type="button" class="btn btn-danger" id="closeAddressModal" data-dismiss="modal">닫기</button>
	                </div>	            
	            </div>
	        </div>
	    </div>
	    
	</main>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>