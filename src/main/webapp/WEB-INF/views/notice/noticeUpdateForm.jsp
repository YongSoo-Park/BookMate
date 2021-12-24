<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
	<style type="text/css">
		.writer{
		    border: 1px solid;
		    width: 800px;
		}
		.writer td,.writer th{
		border: 1px solid black;
		height: 50px;
		}
		.writer th{
		width: 15%;
		background-color: rgb(238, 176, 156);
		text-align: center;
		}
		.writer td{
		width: 35%;
		padding: 10px;
		}
		.writer input, .writer textarea{     
		    outline: none;
		    border: 1px;
		    resize: none;
		}
		a:link { 
		color: black; 
		text-decoration: none;
		}
		a:visited { 
		color: black; 
		text-decoration: none;
		}
		a:hover { 
		color: blue; 
		text-decoration: none;
		}
		.leftTitle{
		font-size: 20px;
		font-weight: bold;
		}
	</style>
	<script>
		
		$(function () {
			var loginUserId = "${sessionScope.loginUser.userId}"
				if(loginUserId!='admin'){
					alert("잘못된 접근입니다.")
					location.href = '${pageContext.servletContext.contextPath }/';
				}
			var noticeCategory = "${requestScope.notice.noticeCategory}";
			$('input[name=noticeCategory][value="'+noticeCategory+'"]').prop('checked','ture')
			
			
		})
		
		//업데이트 필수 정보 입력 체크
		    function updateNoticeCheck() {
		    	if(!$('input[name=noticeCategory]:checked').val()){
		            alert('공지사항 구분을 선택하셔야 합니다.')
		            $('input[name=noticeCategory]:checked').focus
		            return false
		        }
		        if(!$('#noticeTitle').val()){
		            alert('공지사항 제목을 입력하셔야 합니다.')
		            $('#noticeTitle').focus()
		            return false
		        }
		        if(!$('#noticeContent').val()){
		            alert('공지사항 내용을 입력하셔야 합니다.')
		            $('#noticeContent').focus()
		            return false
		        }
		        if(confirm("입력하신 내용으로 글을 수정 하시겠습니까?")){
		            $('#updateNoticeForm').submit();
		        }
		    }
		//이미지 등록시 확장자 체크 및 미리보기 설정
		function imgCheck(img) {
			
			if(img.files&&img.files[0]){
				var name= img.files[0].name
				var ext = name.substring(name.length-3,name.length)
				if(!(ext.toUpperCase()=='PNG'||ext.toUpperCase()=='JPG')){
					alert("이미지파일을 확인해주세요. png와 jpg만 가능합니다.")
					$('#noticeImg').val("")
		
		
					return;
				}
				const imgFile = new FileReader();
				imgFile.readAsDataURL(img.files[0])
				imgFile.onload = function(e) {
					$('#preViewImg').attr('src',e.target.result)
							
				}		   
			}
		}
		
			//공지사항 상세보기로 돌아가기
		    function returnNoticeDetail() {
		    	$('#returnForm').submit();
			}
		    
		    //등록중인 이미지 삭제
		    function deleteNoticeImg() {
				if(confirm("수정중인 공지사항의 이미지를 삭제합니다")){
					$('#deleteImg').val(1)
					$('#noticeImg').val("");
					$('#noticeImg').css("display","none");
					$('#preViewImg').attr('src','');
				}
			}
	</script>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
	<main class="site-main" style="padding-top: 180px">
		<div style="display: flex;width: 1200px;">
			<jsp:include page="../admin/adminLeftMenu.jsp" />
			<div style="margin-left: auto;margin-right: auto; width: 900px;">
				<br><br><br>	
				<span style="font-size: 30px; font-weight: bold;">공지사항 수정</span>
				<hr>
			 <form action="updateNotice.no" id="updateNoticeForm" method="post"  style="display: inline;" enctype="multipart/form-data">
				<input type="hidden" name="deleteImg" id="deleteImg" value="0">
				<input type="hidden" name="noticeImgName" value="${requestScope.notice.noticeImgName}">
				<input type="hidden" name="noticeImgStatus" value="${requestScope.notice.noticeImgStatus}">
			    <table class="writer">
			    	<tbody>
			            <tr>
			                <th>글제목</th>
			                <td colspan="3">
			                	<input type="text" style="width: 600px;height: 30px;" name="noticeTitle" id="noticeTitle" value="${requestScope.notice.noticeTitle}">
			                </td>
			            </tr>
			            <tr>
			                <th>구분</th>
			                <td><input name="noticeCategory" type="radio" value="0"> 일반공지   <input type="radio" name="noticeCategory" value="1"> 이벤트   </td>
			                <th>작성자</th>
			                <td>관리자<input type="hidden" name="noticeWriter" value="관리자"></td>
			            </tr>
			            <tr id="imgTr">
			            
				            <th>이미지 등록</th>
				            <td colspan="2" style="border-right: none">
				            	<span style="font-size: 13px">이미지 등록(png와 jpg만 등록가능)<br>이벤트 이미지 적정사이즈는 1200px X 400px 입니다) : </span><br>
				            </td>
				            
				            <td style="border-left: none">
				            	<input type="file" name="noticeImg" id="noticeImg" onchange="imgCheck(this)"><br>
				            	<c:if test="${requestScope.notice.noticeImgStatus==1}">
				            		<span style="font-size: 13px">등록 이미지 삭제 : </span> <button class="btn-secondary btn-sm" type="button" onclick="deleteNoticeImg()">이미지 삭제</button>
				            	</c:if>
				            </td>
			            </tr>
			            <tr>
			            
			                <td colspan="4">
				              	  이미지 미리보기 :<br>
				                 <div style="text-align: center;">
			                 	
			                 	<c:if test="${requestScope.notice.noticeImgStatus==0}">
			                 		<img alt="" src="" id="preViewImg">
			                 	</c:if>
			                	<c:if test="${requestScope.notice.noticeImgStatus==1}">
			                		<c:if test="${requestScope.notice.noticeCategory==0}">
			                			<img alt="" src="${pageContext.servletContext.contextPath }/resources/images/notice/${requestScope.notice.noticeImgName}" id="preViewImg">
			                		</c:if>
			                 		<c:if test="${requestScope.notice.noticeCategory==1}">
			                 			<img alt="" src="${pageContext.servletContext.contextPath }/resources/images/event/${requestScope.notice.noticeImgName}" id="preViewImg">
			                 		</c:if>
			                	</c:if>
			                	
				               	</div>
								<br><hr>
			                
			                	<textarea name="noticeContent" id="noticeContent" cols="30" rows="10" style="width: 800px; height: 800px;" >${requestScope.notice.noticeContent}</textarea>
			            		</td>
				            </tr>
				        </tbody>
				        <tfoot>
				            <tr>
				                <td colspan="4" style="padding-left: 20px; padding-right: 20px;">
				                    <div style="display: flex;"><input type="hidden" name="noticeNo" value="${requestScope.notice.noticeNo}">
				                        <div style="margin-left: auto;"><button type="button" onclick="updateNoticeCheck()" class="btn-secondary btn-sm" >공지 수정</button>
				   						 
				                        
				                        <button type="button" onclick="returnNoticeDetail()" class="btn-secondary btn-sm" >돌아가기</button></div>
				                    
				                </div>
				                </td>
				
				            </tr>
				        </tfoot>
			        </table>
		        </form>
		        <form action="selectNoticeDetail.no" method="post" style="display: inline;" id="returnForm">
		        	<input type="hidden" name="noticeNo" value="${requestScope.notice.noticeNo}">
		        </form>
	        </div>
        </div>
	</main>
<jsp:include page="../common/footer.jsp" />
</body>
</html>