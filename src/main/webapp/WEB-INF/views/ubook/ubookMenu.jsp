<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>책구메이트 - 중고장터</title>
<link rel="icon" href="resources/img/logo1.png" type="image/png">
<link rel="stylesheet"
	href="resources/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet"
	href="resources/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet"
	href="resources/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="resources/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/used.css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style type="text/css">
.fixed {
	margin-left: 170px !important;
}

.header-area {
	box-shadow: none !important;
}

.searchingInput {
	width: 400px;
	height: 50px;
	border-radius: 10px;
}

.searchingArea {
	margin-top: 10px;
}

.loginArea {
	font-size: 16px;
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
.nav-item{
height: 40px;
font-size: 15px;
}
</style>
<script type="text/javascript">
	function moveCategory(category) {
		$('#moveCategoryInput').val(category);
		$('#moveCategoryForm').submit()
	}
</script>
</head>

<body style="margin: auto; width: 1200px">
	<!--================ Start Header Menu Area =================-->
	<header class="mainHeader"
		style="height: 180px; text-align: center; z-index: 9999; background-color: #f9f1e2; width: 100vw; left: 0%; position: fixed; box-shadow: none; top: 0;">

		<div style="margin: auto; width: 1200px">
			<div class="loginArea">
				<!--로그인 회원정보-->
				<c:if test="${ empty sessionScope.loginUser }">

					<!-- <a href="http://localhost:8090/spring/">책구메이트 홈</a>  -->
					<a href="register.me">회원가입</a> |
                                <a data-toggle="modal"
						data-target="#loginModal">로그인</a> | 
									<a href="findId.us">아이디찾기</a> |
									<a href="findPwd.us">비밀번호찾기</a> |
									<a href="noticeList.no?isUser=1">공지사항</a>

				</c:if>

				<!-- 로그인 후  -->
				<c:if test="${ !empty sessionScope.loginUser }">
					<label style="color: brown;">${ sessionScope.loginUser.userName }님</label>
					<c:if test="${ !empty s.sellerId && s.status eq 'Y' }">
                                |
                                <a href="sellerPage.se">판매자페이지</a>
                                |
                                </c:if>
					<a href="selectMyOrderList.me">마이페이지</a> |
                                <a href="logout.us">로그아웃</a> |
					<a href="ubookCart.ub">장바구니</a>
                                |
									<a href="noticeList.no?isUser=1">공지사항</a>
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
					<!--검색-->
					<form id="search" action="ubookSearch.ub" style="width: 455px;">
						<div class="row no-gutters align-items-center">
							<!--검색 input-->
							<div class="col">
								<input
									class="form-control form-control-lg form-control-borderless"
									style="font-size: 18px;" name="keyword" type="search"
									placeholder="도서명 혹은 저자를 입력하세요">
							</div>
							<!--검색버튼-->
							<div class="col-auto">
								<button class="btn btn-lg searchbtn" type="button"
									style="font-size: 18px; background-color: #5cb85c; color: #ffffff;" onclick="searchChk()">검색</button>
							</div>
							<script>
								function searchChk() {
									var keyword = $("input[name='keyword']")
											.val();
									if (keyword == "") {
										alert("검색할 도서 제목이나 작가명을 입력해주세요.");
										keyword.focus();
										return false;
									} else if (keyword == " ") {
										alert("공백은 입력할 수 없습니다.");
										keyword.val('');
										keyword.focus();
										return false;
									}
									$("#search").submit();
								}
							</script>
						</div>
					</form>
				</div>
			</div>

			<!--카테고리  -->
			<nav style="width: 1175px; text-align: center; margin-left: 11px;">
				<ul class="navbar" id="tree" style="margin-top: 9px;">
					<li class="nav-item"><a class="nav-link"
						style="color: #503535; font-weight: 700; font-size: 18px; cursor: pointer;"
						class="nav-link dropdown-toggle" data-toggle="dropdown">국내도서</a>
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
					<li class="nav-item submenu dropdown"
						value="12"
						onclick="moveCategory(this.value)"><a href="#" class="nav-link"
						role="button"
						style="color: #503535; font-weight: 700; font-size: 18px; text-decoration: none;">eBook</a></li>

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
									<button type="submit" class="btn btn-primary">로그인</button>
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