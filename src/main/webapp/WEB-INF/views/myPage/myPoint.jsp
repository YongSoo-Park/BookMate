<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>포인트 조회 </title>
    
 	<link rel="icon" href="img/Fevicon.png" type="image/png">
    <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="resources/vendors/linericon/style.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">
  
    <link rel="stylesheet" href="resources/css/style.css">
  
  
  <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
     <style>

       #insertCoupon{
    
        width: 300px;
        text-align: center;
           
       }

		body{
		 
		width: 1200px;
		
		} 
     </style>
  
</head>
<body style="width: 1200px; margin: auto;">
 <jsp:include page="../common/menubar.jsp" />

<!-- 왼쪽 사이드바  -->
    <section  style="padding-top: 180px;" >
        <div class="container">
          <div class="row">
         <jsp:include page="../myPageSideBar/sideBar.jsp" />

				<!-- 회원의 포인트 조회를 할 수 있는 란  -->
				<div class="col-xl-9 col-lg-8 col-md-7" style="margin-top: 20px; margin-left: 20px">
					<div class="filter-bar d-flex flex-wrap align-items-center">
						<div class="sorting"></div>
						<div class="sorting mr-auto">

							<br>
							<h2>현재 <c:out value="${userPoint.userName}"/>님의 잔여 포인트는</h2>
							<br>
						</div>
 						<h4> <span id ="pointInsert"><c:out value="${userPoint.point}"/></span>point 입니다</h4>
					</div>


					<!-- 쿠폰을 등록하는 곳  -->
					<div class="col-xl-9 col-lg-8 col-md-7">
						<div class="filter-bar d-flex flex-wrap align-items-center">
							<div class="sorting">
								<div class="redeemPoint">
								
									<form id="checkCuForm" action="updateCoupon.me" method="post">
										<div class="col-md-12 form-group">
											<br> <input type="text"  name="couponCode" placeholder="쿠폰번호를 입력해주세요" required style="width: 300px;">
												<input type="hidden" value="${sessionScope.loginUser.userId}">
											<button type="button" onclick="checkCoupon();"  >쿠폰 등록하기</button>
										</div>
									</form> 
								
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
    
  </section>
    
 <jsp:include page="../common/footer.jsp" />

</body>

	 <script type="text/javascript">
	 
	 function checkCoupon(){
		 
		 var couponCode = $("#checkCuForm input[name=couponCode]"); 
		 var userId = '${sessionScope.loginUser.userId}'; 
		 	console.log(couponCode.val());
		 
			if(couponCode.val() == null){
				alert("쿠폰 번호를 입력해주세요 ");
				return false;
			}
		 
		 $.ajax({
			url: "checkCu.me",
			type: "post",
			data : { 
				couponCode : couponCode.val(),
				user_Id : userId
			},
			
			success : function(e){
				if(e == "available"){
					confirm("사용가능한 쿠폰입니다. 사용하시겠습니까? ");
						couponCode.attr("readonly","true"); //인푸에 들어온 코드 체크한 뒤에 
	
					 	checkCoupon2(userId);  
					}
						else if(e == "usedAlready"){
						confirm("이미사용된 쿠폰입니다. ");
								    
				}else {
					alert("해당 쿠폰번호가 없습니다 다시 입력해주세요 ")
				}
				console.log('성공 ')
				
			},
			error:function(){
				alert("..에러다..  ")
			}
		 })
		 
	 };
	 
	
	 
	  function checkCoupon2(){
		console.log("도는지..?")	
		
		 var couponCode = $("#checkCuForm input[name=couponCode]"); 
		 var userId = '${sessionScope.loginUser.userId}'; 
		 
			 $.ajax({
				 url:"updateCoupon.me",
				 type:"post",
				 data : { 
						couponCode : couponCode.val(),
						user_Id : userId
					},
					success : function(e){
						alert( "포인트등록이되었습니다");
				var pointInsert = parseInt($('#pointInsert').text()) + parseInt(e)
						$('#pointInsert').text(pointInsert);
						
						console.log('성공... ')
					},
					error:function(){
						alert(" 에러임.. ")
					}
				
			 });
		 };
 	 
	
	  
	
	 
	</script> 
</html>