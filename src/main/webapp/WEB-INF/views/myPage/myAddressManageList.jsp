<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>포인트 등록 및 조회 </title>
    
 	<link rel="icon" href="img/Fevicon.png" type="image/png">
    <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="resources/vendors/linericon/style.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">
  
    <link rel="stylesheet" href="resources/css/style.css">
  
  
  <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
     <style>

       #insertCoupon{
    
        width: 300px;
        text-align: center;
           
       }

		body{
		 
		width: 1200px;
		
		} 
     </style>
  
</head>
<body style="width: 1200px; margin: auto;">
 <jsp:include page="../common/menubar.jsp" />

<!-- 왼쪽 사이드바  -->
    <section  style="padding-top: 180px;" >
        <div class="container">
          <div class="row">
         <jsp:include page="../myPageSideBar/sideBar.jsp" />

				

					<div class="col-xl-9 col-lg-8 col-md-7">
						<div class="filter-bar d-flex flex-wrap align-items-center" style="margin-top: 10px ">
							<h2 style="text-align: center">나의 주소록 리스트</h2>
							<table class="table" style="text-align: center;">
								<thead style="text-align: center;">
									<tr>
										<th scope="col">나의 주소목록 </th>
										<th scope="col"></th>
										<th scope="col"></th>
										<th scope="col"></th>
										<th scope="col"></th>

									</tr>

									<c:if test="${empty myAdressBookList}">
										<td colspan="5"><h2>주소록 목록이 없습니다.</h2></td>
									</c:if>

									<c:forEach var="item" items="${myAdressBookList }" varStatus="status">
										<tr>
										<td><c:out value="${item.mainAddress }" /></td>
											

								
										</tr>
									</c:forEach>
							</table>

						</div>
					</div>
				</div>
			</div>
		
   
  </section>
    
 <jsp:include page="../common/footer.jsp" />

</body>

	 <script type="text/javascript">
	 
	</script> 
</html>