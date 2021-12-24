<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책구메이트 - 중고장터</title>
<link rel="icon" href="resources/img/logo1.png" type="image/png">
</head>
<body style="width: 1200px; margin: auto;">
 	<jsp:include page="../ubook/ubookMenu.jsp"/>
      
  <!--================ 바디 =================-->
  <div class="f" style="width: 1200px;">
    <div>

      <!--================ 좌측 사이드바(도서 카테고리 선택) =================-->
      <div class="col-xl-2" style="text-align: center; position: fixed; z-index: 888; margin-top: 180px;">
        <div class="sidebar-categories">
          <div class="head category" style="width: 175px; cursor: pointer;" onclick="location.href='ubookMain.ub'">중고도서</div>
		  <div class="categorybody" style="cursor: pointer;" onclick="location.href='ubookCategory.ub?ubCategory=1'">소설/시/에세이</div>
		      	<div class="categorybody" style="cursor: pointer;" onclick="location.href='ubookCategory.ub?ubCategory=2'">경제/경영</div>
		      <div class="categorybody" style="cursor: pointer;" onclick="location.href='ubookCategory.ub?ubCategory=3'">과학</div>
		      <div class="categorybody" style="cursor: pointer;" onclick="location.href='ubookCategory.ub?ubCategory=4'">인문</div>
		        <div class="categorybody" style="cursor: pointer;" onclick="location.href='ubookCategory.ub?ubCategory=5'">컴퓨터/IT</div>
		        <div class="categorybody" style="cursor: pointer;" onclick="location.href='ubookCategory.ub?ubCategory=6'">자기계발</div>
		        <div class="categorybody" style="cursor: pointer;" onclick="location.href='ubookCategory.ub?ubCategory=7'">정치/사회</div>
		      <div class="categorybody" style="cursor: pointer;" onclick="location.href='ubookCategory.ub?ubCategory=8'">역사/문화</div>
		       <div class="categorybody" style="cursor: pointer;" onclick="location.href='ubookCategory.ub?ubCategory=9'">취미</div>
		       <div class="categorybody" style="cursor: pointer;" onclick="location.href='ubookCategory.ub?ubCategory=10'">가정/육아</div>
		      
          <!--background-color: #c9ae9c;-->
        </div>
      </div>
      <!--================ End 좌측 사이드바(도서 카테고리 선택) =================-->

<c:if test="${ !empty list }">
      <!--================ 메인 Content =================-->
      <div class="col-xl-9 col-lg-8 col-md-7 maincon" style="position: absolute;
       margin-bottom: 100px;
    z-index: 7777;
    width: 1010px;
    margin-left: 205px;">
        <section class="content" style="margin-top: 190px;float: right;">
			<div class="col-md-offset-2 qnaTable">
				<div class="panel panel-default" style="background-color: #e7e1d8;">
					<div class="panel-body">
						
						<div class="table-container bookListF" style="background-color:  #faf8f2;">
						<c:if test="${ list[0].ubCategory eq 1 }">
							<h1 style="float: left;">소설/시/에세이</h1>
						</c:if>
						<c:if test="${ list[0].ubCategory eq 2 }">
							<h1 style="float: left;">경제/경영</h1>
						</c:if>
						<c:if test="${ list[0].ubCategory eq 3 }">
							<h1 style="float: left;">과학</h1>
						</c:if>
						<c:if test="${ list[0].ubCategory eq 4 }">
							<h1 style="float: left;">인문</h1>
						</c:if>
						<c:if test="${ list[0].ubCategory eq 5 }">
							<h1 style="float: left;">컴퓨터/IT</h1>
						</c:if>
						<c:if test="${ list[0].ubCategory eq 6 }">
							<h1 style="float: left;">자기계발</h1>
						</c:if>
						<c:if test="${ list[0].ubCategory eq 7 }">
							<h1 style="float: left;">정치/사회</h1>
						</c:if>
						<c:if test="${ list[0].ubCategory eq 8 }">
							<h1 style="float: left;">역사/문화</h1>
						</c:if>
						<c:if test="${ list[0].ubCategory eq 9 }">
							<h1 style="float: left;">취미</h1>
						</c:if>
						<c:if test="${ list[0].ubCategory eq 10 }">
							<h1 style="float: left;">가정/육아</h1>
						</c:if>
							<table class="table table-filter" id="ubookListTb" style="background-color: #faf8f2;">
								<colgroup>
									<col width="45px" style="text-align: center;">
									<col width="150px" style="text-align: center;">
									<col width="150px" style="text-align: center;">
									<col width="90px" style="text-align: center;">
									<col width="110px" style="text-align: center;">
									<col width="60px" style="text-align: center;">
									<col width="60px" style="text-align: center;">
									<!-- <col width="130px" style="text-align: center;"> -->
								</colgroup>
								<thead>
									<tr>
										<th class="tbNo1">No</th>
										<th class="tbNo1">표지</th>
										<th class="tbNo1">제목</th>
										<th class="tbNo1">저자</th>
										<th class="tbNo1">가격</th>
										<th class="tbNo1">재고</th>
										<th class="tbNo1">상태</th>
										<!-- <th class="tbNo1">구매</th> -->
									</tr>
								</thead>
								<tbody>
								<c:forEach var="u" items="${ list }" varStatus="status">
									<tr data-status="pagado" onclick="location.href='ubookDetailTest.ub?ubookNo=${ u.ubookNo }&bSellerNo=${u.BSellerNo}'">
											<td>
												<div class="tbNo1">${status.index + 1 }</div>
											</td>
											<td>
												<div class="ubookImg">
													<img src="${pageContext.servletContext.contextPath }/resources/images/Ubookimg/${u.ubookImg }" class="media-photo" style="width: 145px; height: auto;">
												</div>
											</td>
											<td>
												<div class="tbNo1">
													<input name="ubookNo" hidden="hidden" value="${ u.ubookNo }"/>${u.ubookName }
												</div>
											</td>
											<td>
												<div class="tbNo1">${u.ubookWriter }</div>
											</td>
											<td>
												<div class="tbNo1">
													<del>${u.ubookOPrice }원</del>
													<br>
													<div style="color: #fe6000 !important;"><strong>${u.ubookPrice }원</strong></div>
												
												</div>
											</td>
											<td>
												<div class="tbNo1">${u.ubookStock }</div>
											</td>
											<td>
												<div class="tbNo1">
												<c:if test="${u.ubookQual eq 'S' }">
													<div style="background-color: #324278; color: #fff;;">최상</div>
												</c:if>
												<c:if test="${u.ubookQual eq 'A' }">
													<div style="background-color: #28706f; color: #fff;;">상</div>
												</c:if>
												<c:if test="${u.ubookQual eq 'B' }">
													<div style="background-color: #fcd381; color: #fff;;">보통</div>
												</c:if>
												<c:if test="${u.ubookQual eq 'C' }">
													<div style="background-color: #eb9b6a; color: #fff;">하</div>
												</c:if>
												<c:if test="${u.ubookQual eq 'D' }">
													<div style="background-color: #9d1d16; color: #fff">최하</div>
												</c:if>
												
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
            <br>

            <div id="pagingArea">
                <ul class="pagination" style="justify-content: center; font-size: 15px;">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="ubookCategory.ub?ubCategory=${list[0].ubCategory }&currentPage=${ pi.currentPage-1 }" style="color: #764845; background-color: #f7ddcb;">이전</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">이전</a></li>
                		</c:otherwise>
                	</c:choose>
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.endPage }">
                			<li class="page-item"><a class="page-link" href="ubookCategory.ub?ubCategory=${list[0].ubCategory }&currentPage=${ pi.currentPage+1 }" style="color: #764845; background-color: #f7ddcb;">다음</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="ubookCategory.ub?ubCategory=${list[0].ubCategory }&currentPage=${ pi.currentPage+1 }">다음</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
           
            <br clear="both">
						</div>
					</div>
				</div>
			</div>
            <br>
		</section>
      </div>
    </div>
  </div>
 	<div style="padding-top: 1600px;"><jsp:include page="../common/footer.jsp"/></div>
</c:if>
</body>
</html>