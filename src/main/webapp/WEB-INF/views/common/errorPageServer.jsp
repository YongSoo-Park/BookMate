<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책구메이트 - 에러</title>
<link rel="icon" href="resources/img/logo1.png" type="image/png">
</head>
<body>
	<jsp:include page="menubar.jsp"/>
	
	<br>
	<div align="center" style="margin-top: 230px;">	
		<br><br>
		<h1 style="font-weight:bold">${ msg }</h1>
		<h5 style="color: red;">${ requestScope['javax.servlet.error.message'] }</h2>
		
	</div>
	<br>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>