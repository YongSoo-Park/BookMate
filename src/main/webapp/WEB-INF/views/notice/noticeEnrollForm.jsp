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
		$(function() {
			var loginUserId = "${sessionScope.loginUser.userId}"
			if(loginUserId!='admin'){
				alert("잘못된 접근입니다.")
				location.href = '${pageContext.servletContext.contextPath }/';
			}
		})
		
		//공지사항 등록시 필수 정보 작성 여부
	    function insertNoticeCheck() {
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
	        if(confirm("입력하신 내용으로 글을 등록 하시겠습니까?")){
	            $('#insertNoticeForm').submit();
	        }
	    }
	    
		//이미지 등록시 파일 확장자 체크와 이미지 미리보기 보여주기
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
	</script>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
	<main class="site-main" style="padding-top: 180px">
		<div style="display: flex;width: 1200px;">
			<jsp:include page="../admin/adminLeftMenu.jsp" />
			<div style="margin-left: auto;margin-right: auto; width: 900px;">
				<br><br><br>
			<span style="font-size: 30px; font-weight: bold;">공지사항 등록</span>
			<hr>
				<form action="insertNotice.no" id="insertNoticeForm" method="post" enctype="multipart/form-data">
					<table class="writer">
				    	<tbody>
				            <tr>
				                <th>글제목</th>
				                <td colspan="3"><input type="text" style="width: 600px;height: 30px;" name="noticeTitle" id="noticeTitle"></td>
				            </tr>
				            <tr>
				                <th>구분</th>
				                <td><input name="noticeCategory" type="radio" value="0"> 일반공지   <input type="radio" name="noticeCategory" value="1"> 이벤트   </td>
				                <th>작성자</th>
				                <td>관리자<input type="hidden" name="noticeWriter" value="관리자"></td>
				            </tr>
				            <tr>				            
					            <th>이미지 업로드</th>
					            <td colspan="2" style="border-right: none">
					            	<span style="font-size: 13px">이미지 등록(png와 jpg만 등록가능)<br>이벤트 이미지 적정사이즈는 1200px X 400px 입니다) : </span><br>
					            </td>					            
					            <td style="border-left: none">
					            <input type="file" name="noticeImg" id="noticeImg" onchange="imgCheck(this)">
					            </td>
				            </tr>				            
				            <tr>
				                <td colspan="4">					                
									이미지 미리보기 :<br>
									<div style="display: flex; "><img alt="" src="" id="preViewImg" style="margin-left: auto;margin-right: auto;"></div><br><hr>
					                <textarea name="noticeContent" id="noticeContent" cols="30" rows="10" style="width: 800px; height: 500px;" ></textarea>
				            	</td>
				            </tr>
				        </tbody>
				        <tfoot>
				            <tr>
				                <td colspan="4" style="padding-left: 20px; padding-right: 20px;">
				                    <div style="display: flex;">
				                        <div style="margin-left: auto;"><button type="button" onclick="insertNoticeCheck()"  class="btn-secondary btn-sm" >글등록</button></div>				                    
				                	</div>
				                </td>				
				            </tr>
				        </tfoot>
			        </table>
			    </form>
	        </div>
        </div>
	</main>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>