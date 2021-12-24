<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style>
		#couponTable, #couponTable td, #couponTable input {
			margin: auto;
			text-align: center;
		}
		
		#couponTable td, #couponTable th {
			height: 50px;
		}
		#adminMenuDiv span{
		font-size: 20px;
		font-weight: bold;
		}
		a:link { 
		color: black; 
		text-decoration: none;
		}
		a:visited { 
		color: black; 
		text-decoration: none;
		}
		a:hover { 
		color: blue; 
		text-decoration: none;
		}
		.leftTitle{
		font-size: 20px;
		font-weight: bold;
		}
	</style>
	<script>
			
			$(function() {
			$('#startDate').val(new Date().toISOString().slice(0, 10));
			var loginUserId = "${sessionScope.loginUser.userId}"
			if(loginUserId!='admin'){
				alert("잘못된 접근입니다.")
				location.href = '${pageContext.servletContext.contextPath }/';
			}
		})
	
			var confrimCoupon = 0;
			
			//쿠폰 등록시 필수 정보 입력 체크후 등록
			function insertCoupon() {
				if (!$('#couponCode').val()) {
					alert("쿠폰 코드는 필수 입력 사항입니다.")
					$('#couponCode').focus();
					return false;
				}
				if (!$('#couponPoint').val()) {
					alert("쿠폰 지급 포인트는 필수 입력 사항입니다.")
					$('#couponPoint').focus();
					return false;
				}
				if (confrimCoupon == 0) {
					alert("쿠폰 코드 중복 확인은 필수 사항입니다")
					$('#couponCode').focus();
					return false;
				}
				if (confirm("입력하신 정보대로 쿠폰을 등록하시겠습니까?")) {
					$.ajax({
						url : "insertCoupon.cp",
						type : "post",
						data : {
							couponCode : $('#couponCode').val(),
							couponPoint : $('#couponPoint').val(),
							couponStartDate : $('#startDate').val(),
							couponEndDate : $('#endDate').val()
							
							
						},
						success : function(str) {
							if(str=="success"){
								alert("쿠폰 등록에 성공하였습니다.")
								$("#insertCouponForm")[0].reset();
								$('#startDate').val(new Date().toISOString().slice(0, 10));
							}
							else
								alert("쿠폰 등록에 실패하였습니다.")
						},
						error : function(e) {
							alert("쿠폰 등록 도중 오류가 발생하였습니다. \n 다시 시도해 주십시오.")
						}
		
					})
				}
		
			}
		
			//쿠폰 코드 변경시 쿠폰 중복확인 다시 체크
			function changeCouponInput() {
		
				confrimCoupon = 0;
				$('#checkCodeSpan').html("쿠폰코드 중복확인을 해주십시오.");
			}
			
			//쿠폰 중복확인 체크
			function checkCouponCode() {
		
				var couponCode = $('#couponCode').val();
		
				$.ajax({
		
					url : "checkCouponCode.cp",
					type : "post",
					data : {
						couponCode : couponCode
					},
					success : function(str) {
						if (str == 'pass') {
							alert("입력하신 코드 " + couponCode + "은 \n사용 가능한 쿠폰코드 입니다.")
							confrimCoupon = 1;
							$('#checkCodeSpan').html("쿠폰코드 중복확인 완료");
						} else {
							alert("입력하신 코드 " + couponCode + "은 '" + str
									+ "'pt의 쿠폰으로 이미 등록되어 있습니다.\n확인해주세요.")
							$('#couponCode').focus();
						}
		
					}
		
				})
		
			}
	</script>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
	<main class="site-main" style="padding-top: 180px">
		<div style="display: flex;width: 1200px;">
			<jsp:include page="../admin/adminLeftMenu.jsp" />

			<div style="width: 1000px;">
				<div
					style="margin: 100px; text-align: center; font-size: 35px; font-weight: bold;">
					쿠폰 등록</div>
				<div style="width: 100%;">
					<form action="insertCoupon.cp" method="post" id="insertCouponForm">
						<table style="width: 600px;" id="couponTable">
							<tr>
								<th>쿠폰 번호</th>
								<th>쿠폰 등록시 지급 Point</th>
							</tr>
							<tr>
								<td><input type="text" name="couponCode" id="couponCode"
									onchange="changeCouponInput()">
									<button type="button" onclick="checkCouponCode()">중복확인</button>
									<br> <span id="checkCodeSpan">쿠폰코드 중복확인을 해주십시오.</span></td>
								<td><input type="number" name="couponPoint"
									id="couponPoint"></td>
							</tr>
							<tr style="height: 100px;"></tr>
							<tr>
								<th>쿠폰 사용 시작일(기본 오늘)</th>
								<th>쿠폰 사용 종료일(기본 무한)</th>
							</tr>
							<tr>
								<td><input type="date" id="startDate"
									name="couponStartDate"></td>
								<td><input type="date" id="endDate" value="2099-12-31"
									name="couponEndDate"></td>
							</tr>
							<tr style="height: 150px;"></tr>
							<tr>
								<td colspan="2"><button type="button"
										class="btn btn-secondary btn-lg" onclick="insertCoupon()">쿠폰
										등록</button></td>
							</tr>
						</table>
					</form>




				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>