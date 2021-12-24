<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width,initial-scale=1">
<title>아이디 찾기</title>

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
	<h1 style="text-align: center;">아이디 찾기 결과</h1><br>


	<div class = "col-md-12 form-group" style="margin:auto;text-align:center;">
	<div class = "col-md-12 form-group" style="margin:auto;text-align:center;">
	<h5>
		${findId }
	</h5>
	</div>
	</div>
	
	
	</div>
	</section>
		   	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>