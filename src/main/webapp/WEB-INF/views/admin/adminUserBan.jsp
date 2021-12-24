<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
	    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<style>
		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
		    -webkit-appearance: none;
		}
		.users{
		width: 1000px;
		}
		.users th{
		    background-color:  rgba(166, 219, 240, 0.233);
		}
		.users td , .users th{
		text-align: center;
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
	
	<script type="text/javascript">
	
		$(function() {
			var loginUserId = "${sessionScope.loginUser.userId}"
				if(loginUserId!='admin'){
					alert("잘못된 접근입니다.")
					location.href = '${pageContext.servletContext.contextPath }/';
			}
			var check = parseInt("${requestScope.check}");
			if(check==1){
				alert("회원 자격정지가 성공적으로 끝났습니다.")
			}
		})
			
		//회원 자격정지를 클릭했을시
		
		function userBan(){
			if(confirm("주의! 회원 자격을 변동하는 중입니다!")){
				if(confirm("정말 "+$('#user_IdSpan').text()+" 회원의 회원자격을 정지 하시겠습니까?")){
					$('#user_Id').val($('#user_IdSpan').text());
					$('#updateUserBanForm').submit();
				}
			}
		}
		
		//자격 정지 할 회원 선택
		function searchUserBan() {
			var searchKind = $('input[name=checkSearchKind]:checked').val();
			var searchKeyword = $('#keywordInput').val();
			$.ajax({
				
				url  : "selectBanUser",
				type : "post",
				data : {
					searchKind : searchKind,
					searchKeyword : searchKeyword
				},
				success : function(data) {
					if(data["str"]=="pass"){
						var user = data["user"];
						$('#user_IdSpan').text(user.user_Id);
						$('#user_NameSpan').text(user.user_Name);
						$('#emailSpan').text(user.email);
						$('#enrollSpan').text(new Date(user.enroll).toISOString().substring(0,10));
						if(user.status=='Y'){
							$('#statusSpan').text('Y');
							$('#seller_NicknSpan').text(user.seller_Nickn);					
						}else{
							$('#statusSpan').text('N');
							$('#seller_NicknSpan').text('-');	
						}
					}else{
						if(searchKind==1){
							alert("검색하신 ID - '"+searchKeyword+"'은 잘못된 ID 입니다." )
						}else{
							alert("검색하신 판매닉네임 - '"+searchKeyword+"'은 잘못된 닉네임 입니다." )
						}
						
					}
					
				},
				error : function(e) {
					alert("유저 불러오기중 ajax 통신 오류")
				}
				
			})
		}
	</script>
</head>

<body>
	<jsp:include page="../common/menubar.jsp" />
	<main class="site-main" style="padding-top: 180px">
		<div style="display: flex;width: 1200px; ">
			<jsp:include page="../admin/adminLeftMenu.jsp" />
			<div style="margin-left: auto;margin-right: auto; width: 900px;">
				<br><br><br>
				
				<form action="updateUserBan.ad" method="post" id="updateUserBanForm">
					<input type="hidden" name="user_Id" id="user_Id">
				</form>
				<span style="font-size: 30px; font-weight: bold;">회원 자격 변동</span>
				<hr>
				<div style="display: flex;">
					<div style="margin-left: auto;"><input type="radio" name="checkSearchKind" value="1" checked="checked"> ID로 검색  <input type="radio" name="checkSearchKind" value="2"> 판매 닉네임으로 검색
						<input type="text" id="keywordInput"><button type="button" onclick="searchUserBan()"  class="btn-secondary btn-sm" >검색</button>
					</div>
				</div>
				
				<table class="table table-hover users">
		            <thead>
			            <tr>           
			                 <th style="width: 100px">ID</th>
			                <th style="width: 100px">이름</th>
			                <th style="width: 250px">E-mail</th>
			                <th style="width: 120px">가입일</th>
			                <th style="width: 110px">판매자여부</th>
			                <th style="width: 120px">판매 닉네임</th>
			                <th>자격정지</th>
		                </tr>
		            </thead>
		            <tbody>
		                <tr>
		                    <td><span id="user_IdSpan"></span></td>
		                    <td><span id="user_NameSpan"></span></td>
		                    <td><span id="emailSpan"></span></td>
		                    <td><span id="enrollSpan"></span></td>
		                    <td><span id="statusSpan"></span></td>
		                    <td><span id="seller_NicknSpan"></span></td>
		                    <td>
		                    	<button type="button" class="btn btn-secondary btn-sm" onclick="userBan()">자격정지</button>
		                    </td>
		                </tr>
		              
		            </tbody>
		        </table>
	        </div>
        </div>
	</main>
<jsp:include page="../common/footer.jsp" />
</body>
</html>