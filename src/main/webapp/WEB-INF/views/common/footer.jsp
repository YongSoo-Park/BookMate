<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>
<style>
/* div{border:1px solid red;} */
#footer {
	width: 80%;
	height: 200px;
	margin: auto;
	margin-top: 50px;
}

#footer-1 {
	width: 100%;
	height: 20%;
	border-top: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
}

#footer-2 {
	width: 100%;
	height: 80%;
}

#footer-1, #footer-2 {
	padding-left: 50px
}

#footer-1>a {
	text-decoration: none;
	font-weight: 600;
	margin: 10px;
	line-height: 40px;
	color: black;
}

#footer-2>p {
	margin: 0;
	padding: 10px;
	font-size: 13px;
	font-color: black;
}

#p2 {
	text-align: center;
}

.tbfooter {
	margin-right: 100px
}

table {
    margin-left:auto; 
    margin-right:auto;
}

</style>
</head>
<body style="width: 1200px;">
	<!--================ Start footer Area  =================-->
	<footer class="footer" style="width: 1200px;" >
		<hr>
		<table class="tbfooter">
			<tr>
				<td><img alt="" src="resources/img/logo1.png;" width="100px;"height="auto;"></td>
				<td style="width: 400px"></td>
				<td style="width: 200px">📞 전화번호<br> (+82) 123-456-789</td>
				<td style="width: 200px">✉ 이메일<br> info.kh@asdfasd.com</td>
	    	</tr>
		
			<tr>
				<td><p>도서 구매와 중고판매 독서모임까지 ❤️ <br>책구메이트와 함께하세요!<p></td>
				<td style="width: 400px;"></td>
				<td style="width: 200px">🔍 주소<br> 서울특별시 강남구 <br>테헤란로14길 6</td>
				<td style="width: 200px">👑 대표이사 : 관리자<br> 사업자등록번호 : 123-123-5431</td>
			</tr>

		</table>
		<br><br>
		<hr>
		<div style="float: left; , padding: 50%">COPYRIGHT(C) BOOKMATEALL RIGHTS RESERVED.</div>
		<div style="float: right; , padding: 50%">서비스 소개 이용약관 개인정보처림방침</div>
		<div><br><br><br><br><br><br></div>
	</footer>
	<!--================ End footer Area  =================-->
</body>
</html>