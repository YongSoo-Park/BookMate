<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!-- 그냥 따로 안하고 바로 나의 상세목록 주문으로 할란다..  -->
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지 수정</title>

    <link rel="icon" href="img/Fevicon.png" type="image/png">
    <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="resources/vendors/linericon/style.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">
  
     <!-- 제이쿼리피커  -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
 
    <link rel="stylesheet" href="resources/css/style.css">

    
    <style>
    body{
    width:1200px
    }
        .order_details_table{
           text-align: center;
          /*  padding-left: 100px;
           padding-right: 70px; */
        }
        
    </style>
</head>

<body style="width: 1200px; margin: auto;">
 <jsp:include page="../common/menubar.jsp" />


	<section style="padding-top: 180px;">
		<div class="container">
			<div class="row">
				<jsp:include page="../myPageSideBar/sideBar.jsp" />



			</div>
		</div>
	</section>


	<jsp:include page="../common/footer.jsp" />
		
    
    
</body>
</html>