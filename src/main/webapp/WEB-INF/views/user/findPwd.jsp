<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width,initial-scale=1">
<title>비밀번호 찾기</title>

<link rel="icon" href="resources/img/logo1.png" type="image/png">
  <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
   <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="resources/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">

  <link rel="stylesheet" href="resources/css/style.css">
</head>

<body >
 <jsp:include page="../common/menubar.jsp"/>

	<section class="login_box_area section-margin">
		<div class="container" style="width: 500px; margin-left: 460px;">
	<h1 style="text-align: center;">비밀번호 찾기</h1><br>

	<div class = "col-md-12 form-group" style="margin:auto;text-align:center;padding-top:50px;">
	<form method="post" action="findPwd.me"> 
	<input type = "text"  class = "col-md-12 form-group" name = "userId" maxlength="20" placeholder="아이디" required="required"> <br><br>
	<input type = "text"  class = "col-md-12 form-group" name = "userName" maxlength="10" placeholder="이름" required="required"> <br><br>
	<input type = "email"  class = "col-md-12 form-group" name = "email"  placeholder ="이메일"  required="required"><br><br>
		<input type = "submit" style="width:75%;"value = "비밀번호 찾기" class = "userbtn">
	</form>
	</div>
	
	
	</div>
	</section>
		   	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>