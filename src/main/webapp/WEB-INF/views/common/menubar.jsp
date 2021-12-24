<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>책구메이트</title>
<link rel="icon" href="resources/img/logo1.png" type="image/png">

<link rel="stylesheet"
	href="resources/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet"
	href="resources/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet"
	href="resources/vendors/nice-select/nice-select.css">
<link rel="stylesheet"
	href="resources/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="resources/vendors/owl-carousel/owl.carousel.min.css">

<link rel="stylesheet" href="resources/css/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 -->
<style>
.searchingInput {
	width: 400px;
	height: 50px;
	border:1px solid #cccccc;
}

.searchingArea {
	margin-top: 10px;
}

.loginArea {
	margin-top: 10px;
	text-align: right;
	padding-right: 20px;
	color: brown;
}

.nav-item:hover .dropdown-menu {
	display: block;
}

.nav-item:hover .dropdown-menu>li:hover {
	background-color: #e7e1d8;
}

.nav-item:hover .dropdown-menu>li a {
	color: black;
}
</style>
<script type="text/javascript">

	function moveCategory(category) {
		$('#moveCategoryInput').val(category);
		$('#moveCategoryForm').submit()
	}
	
	function login() {
		var userId = $('#userId').val();
		var userPwd = $('#userPwd').val();

		if(!userId||!userPwd){
			alert('ID와 비밀번호를 모두 입력해주세요')
			return false;
		}
		
		$.ajax({
			
			url : "login.us",
			type : "post",
			data : {
				userId : userId,
				userPwd : userPwd
			},
			success : function(str) {
				if(str=='fail'){
					alert('비밀번호가 틀렸습니다\n다시 확인해주세요.')
				}else{
					$('#loginModal').modal('hide');
					location.reload()
				}
				
				
			},
			error : function (e) {
				alert("로그인중 ajax 통신 에러")
			}
			
		})
		
		
	}
</script>
</head>

<body style="margin: auto; width: 1200px">
	<!--================ Start Header Menu Area =================-->
	<header class="mainHeader"
		style="height:180px; text-align: center; z-index: 9999; background-color: #f9f1e2; width: 100vw; left: 0%; position: fixed; box-shadow: none; top: 0;">

		<div style="margin: auto; width: 1200px">
			<div class="loginArea">
				<c:if test="${ empty sessionScope.loginUser }">
					<a href="register.me">회원가입</a> | 
	            				<a data-toggle="modal" data-target="#loginModal">로그인</a>  | 
									<a href="findId.us">아이디찾기</a> |
									<a href="findPwd.us">비밀번호찾기</a> |
									<a href="noticeList.no?isUser=1">공지사항</a>
				</c:if>

				<!-- 로그인 후  -->
				<c:if
					test="${ !empty sessionScope.loginUser && sessionScope.loginUser.userId ne 'admin'}">
					<label>${ sessionScope.loginUser.userName }님 환영합니다</label> &nbsp;&nbsp;|
					                <a href="selectMyOrderList.me">마이페이지</a> |
									<a href="logout.us">로그아웃</a> |
									<a href="shoppingCart.sc?user_Id=${ sessionScope.loginUser.userId }">장바구니</a> |
									<a href="noticeList.no?isUser=1">공지사항</a>
				</c:if>

				<!--관리자 로그인후 -->
				<c:if test="${sessionScope.loginUser.userId eq 'admin'  }">
					<label>${ sessionScope.loginUser.userName }님 환영합니다</label> &nbsp;&nbsp;|
					                <a href="adminMainPage.ad">관리자페이지</a> |
				<a href="logout.us">로그아웃</a>
				</c:if>
			</div>

			<div style="display: flex;">
				<div>

					<a class="imgHome"
						href="${pageContext.servletContext.contextPath }/"
						style="margin-right: 10px"><img src="resources/img/logo.png"
						alt="" style="width: 300px;"></a>
				</div>
				<div class="searchingArea">

					<form action="selectSearchKeyword.se" method="post">
					<div class="row no-gutters align-items-center">
							<!--검색 input-->
							<div class="col">
						<input class="searchingInput" type="text" placeholder="검색어를 입력하세요"
							name="keyword">
							</div>
							<!--검색버튼-->
							<div class="col-auto">
						<button class="btn" type="submit"
							style="background-color:#5cb85c; height: 50px; color: #ffffff; cursor: pointer;">검색</button>
							</div>
							</div>
					</form>
				</div>
			</div>

			<!--카테고리  -->
			<nav style="width: 1200px; text-align: center;">
				<ul class="navbar" id="tree">
					<li class="nav-item"><a class="nav-link"
						style="color: #503535; font-weight: 700; font-size: 18px; cursor: pointer;"
						class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">국내도서</a>

						<form action="selectCategory.ca" method="post"
							id="moveCategoryForm">
							<input type="hidden" id="moveCategoryInput" name="category"
								value="0">
						</form>
						<ul class="dropdown-menu" style="margin-top: -10px; cursor: pointer;">
							<li class="nav-item" value="10"
								onclick="moveCategory(this.value)"><a class="nav-link">국내도서
									전체</a></li>
							<li class="nav-item" value="0" onclick="moveCategory(this.value)"><a
								class="nav-link">소설/시 에세이 </a></li>
							<li class="nav-item" value="1" onclick="moveCategory(this.value)"><a
								class="nav-link">경제/경영</a></li>
							<li class="nav-item" value="2" onclick="moveCategory(this.value)"><a
								class="nav-link">과학</a></li>
							<li class="nav-item" value="3" onclick="moveCategory(this.value)"><a
								class="nav-link">인문</a></li>
							<li class="nav-item" value="4" onclick="moveCategory(this.value)"><a
								class="nav-link">컴퓨터</a></li>
							<li class="nav-item" value="5" onclick="moveCategory(this.value)"><a
								class="nav-link">자기계발</a></li>
							<li class="nav-item" value="6" onclick="moveCategory(this.value)"><a
								class="nav-link">정치/사회</a></li>
							<li class="nav-item" value="7" onclick="moveCategory(this.value)"><a
								class="nav-link">역사/문화</a></li>
							<li class="nav-item" value="8" onclick="moveCategory(this.value)"><a
								class="nav-link">취미</a></li>
							<li class="nav-item" value="9" onclick="moveCategory(this.value)"><a
								class="nav-link">가정/육아</a></li>
						</ul></li>
						
					<li class="nav-item submenu dropdown" value="12"
						onclick="moveCategory(this.value)"><a
						style="color: #503535; font-weight: 700; font-size: 18px; text-decoration: none; cursor: pointer;">eBook</a></li>

					<li class="nav-item"><a class="nav-link" href="ubookMain.ub"
						style="color: #503535; font-weight: 700; font-size: 18px;">중고장터</a></li>
					<li class="nav-item"><a class="nav-link" href="clubMain.cl"
						style="color: #503535; font-weight: 700; font-size: 18px;">독서모임</a></li>


				</ul>
			</nav>
			<div>



				<!-- 로그인 모달  -->
				<div class="modal fade" id="loginModal">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">
							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">Login</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<form action="login.us" method="post">
								<!-- Modal Body -->
								<div class="modal-body">
									<label for="userId" class="mr-sm-2">ID :</label> <input
										type="text" class="form-control mb-2 mr-sm-2"
										placeholder="아이디를 입력해주세요" id="userId" name="userId"> <br>
									<label for="userPwd" class="mr-sm-2">Password:</label> <input
										type="password" class="form-control mb-2 mr-sm-2"
										placeholder="비밀번호를 입력해주세요" id="userPwd" name="userPwd">
								</div>

								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" onclick="login()">로그인</button>
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</header>
</body>
</html>