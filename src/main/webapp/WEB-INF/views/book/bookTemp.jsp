<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function moveCart() {
		var logginUser = "${sessionScope.loginUser.userId}"
		if (logginUser == "") {
			alert("로그인이 필요한 기능입니다.");
			return false;
		} else {
			$('#moveCartForm').submit()
		}

	}
</script>
</head>
<body style="width: 1000px; margin: 0 auto;">
	<jsp:include page="../common/menubar.jsp" />
	
	<main class="site-main" style="padding-top: 180px">
	<hr>


	<form action="selectBook.book" method="post">
		도서 확인용<br> ISBN : 9788964943786(8964943783)<br>
		<br> <input type="hidden" name="bookISBN"
			value="9788964943786(8964943783)"><br>
		<button type="submit">도서 상세보기</button>

	</form>
	<br>
	<br>
	<br>
	

	<form action="adminMainPage.ad" method="post">
		관리자 페이지 이동<br> <br>
		<br> <br>
		<button type="submit">관리자 페이지 이동</button>

	</form>
	
	
	
	<!-- <br>
	<br>
	<br>
	<form action="tempBook.book" method="post">
		베스트 도서 작업용 도서 판매부수 조절(일주일에 한번)<br>
		<br>

		<button type="submit">도서 판매작업</button>

	</form> -->
	<br>
	<br>
	<br>
	<form action="selectSearchKeyword.se" method="post">
	검색 : <input type="text" name="keyword">
	<input type="submit" value="검색">
	 
	</form>
	<br>
	<br>
	<br>
	<form action="selectCategory.ca" method="post" id="ppop">
	<input type="hidden" name="category" value="0">
	 
	 <select onchange="changeCategory(this.value)">
                	    <option value="0">카테고리 선택</option>
                		<option value="0">소설/시/에세이</option>
                		<option value="1">경제/경영</option>
                		<option value="2">과학</option>
                		<option value="3">인문</option>
                		<option value="4">컴퓨터/IT</option>
                		<option value="5">자기계발</option>
                		<option value="6">정치/사회</option>
                		<option value="7">역사/문화</option>
                		<option value="8">취미</option>
                		<option value="9">가정/육아</option>
                		<option value="10">국내도서 전체</option>
                		<option value="12">eBook 전체</option>
                	</select>
	
		
	
	<input type="submit" value="카테고리 이동">
	 
	</form>
	<script type="text/javascript">
	function changeCategory(category) {
		$('#category').val(category);
		$('#ppop').submit()
	}
	</script>
	
	
</main>
</body>
</html>