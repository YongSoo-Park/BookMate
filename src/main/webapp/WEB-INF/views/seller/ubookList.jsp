<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책구메이트 - 중고장터</title>
<link rel="icon" href="resources/img/logo1.png" type="image/png">
        <script>
            function deleteUbook(ubookNo){
              console.log(ubookNo);
               if(confirm("등록하신 도서를 삭제하시겠습니까?")){
               	$.ajax({
                    type : "POST",
                    url : "deleteMyUbook.ub",
                    dataType : 'json',
                    data : {ubookNo : ubookNo},
                    success : function(data) {
						if(data > 0){
							alert("성공적으로 삭제되었습니다.");
							//location.reload();
							//self.location.href=self.location;
							var table = document.getElementById('ubookListTb');
							
							$.ajax({
                                type : "POST",
                                url : "ubookList.ub",
                                dataType : 'json',
                                //data : 도서리스트,
                                success : function(data) {
                                	
                                	//기존 tr 지우기
                                	var trlength = $('#ubookListTb tr').length;
                        	    	for(var t=trlength-1; t>0; t--){
                        	    		table.deleteRow(t);
                        	    	}
                                	
                                  	//데이터 뿌리기 
                                	for(var i=0; i < data.length; i++){
                                		$('#ubookListTb').append("<tr>"
                                							+"<td align='center'>" + (i+1) + "</td>" + "<td hidden='hidden' name='ubookNo'>"+data[i].ubookNo+"</td>" +
                    										"<td align='center'><img src='${pageContext.servletContext.contextPath }/resources/images/Ubookimg/" + data[i].ubookImg + "' style='width: 145px; height: auto;'></td>" +
                                							"<td align='center'><a href='ubookDetailTest.ub?ubookNo="+data[i].ubookNo+"&bSellerNo="+data[i].bsellerNo+"'>" + data[i].ubookName + "</a></td>" +
                                							"<td align='center'>" + data[i].ubookWriter + "</td>" +
                                							"<td align='center'>" + data[i].ubookStock + "</td>" +
                                							"<td align='center'>"+
                                							"<button type='button' style='background-color: #5cb85c; color:#ffffff; border:none; width: 100%; margin-bottom:10px; border-radius: 0.3rem;' onclick='updateUbook()'>수정</button>"+
                                							"<button class='btn-danger' type='button' style='border:none;width: 100%; border-radius: 0.3rem;' onclick='deleteUbook("+data[i].ubookNo+")'>삭제</button></td></tr>");
                                 	}

                                },
                                error : function() {
                                	alert("너는 뭔가 잘못하고 있따...!!!!!");
                                }
                            });
						}else{
							console.log(data);	//15개 전부가 나옴
							alert("실패");
						}
						
                    },
                    error : function() {
                    	alert("통신실패");
                    }
                });
               }
                
            }      	
            function updateUbook(){
                $("#myUbookListForm").attr("action", "updateMyUbook.ub");
            }
       </script>
</head>
<body>
	<!-- 등록 도서 조회 -->
	<div class="tabContent3 active" style="margin: auto !important; width: 930px;">
		<section class="content">
			<h2>등록 도서 조회</h2>
			<input hidden="hidden" value="${ s.sellerNo }" name="sellerNo">
			<div class="col-md-offset-2 qnaTable">
				<div class="panel panel-default">
					<div class="panel-body">
<!-- 						<div class="pull-right">
							<div class="btn-group">
								<button type="button" class="btn btn-success btn-filter"
									data-target="pagado">Pagado</button>
								<button type="button" class="btn btn-warning btn-filter"
									data-target="pendiente">Pendiente</button>
								<button type="button" class="btn btn-danger btn-filter"
									data-target="cancelado">Cancelado</button>
								<button type="button" class="btn btn-default btn-filter"
									data-target="all">Todos</button>
							</div> 
						</div>-->
						<div class="table-container">
							<table class="table table-filter" id="ubookListTb">
								<thead>
                                <tr>
                                    <th style="width:60px; text-align: center;">도서 번호</th>
                                    <th style="text-align: center;">도서 표지</th>
                                    <th style="text-align: center;">도서명</th>
                                    <th style="text-align: center;">저자</th>
                                    <th style="width:70px; text-align: center;">도서 재고</th>
                                    <th style="width:120px; text-align: center;">수정/삭제</th>
                                </tr>
                            	</thead>
								<tbody>
								<tr>
									<td colspan="6" style="text-align: center;">도서 조회를 원하신다면 [등록 도서 조회] 탭을 클릭해주세요</td>
								</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br style="clear: both;">
			</div>
		</section>
	</div>
</body>
</html>