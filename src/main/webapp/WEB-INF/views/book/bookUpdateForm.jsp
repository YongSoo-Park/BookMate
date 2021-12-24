<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width,initial-scale=1" charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style type="text/css">
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
	<script type="text/javascript">
		
		$(function() {	
			var loginUserId = "${sessionScope.loginUser.userId}"
				if(loginUserId!='admin'){
					alert("잘못된 접근입니다.")
					location.href = '${pageContext.servletContext.contextPath }/';
				}
			$('input[name=bookCategory][value=${requestScope.book.bookCategory}]').prop('checked',true);
			$('input[name=bookSubCategory][value=${requestScope.book.bookSubCategory}]').prop('checked',true);
		})
		
		//파일 등록시 png와 jpg 이미지 파일만 등록 가능하게
		function imgCheck(img,inputId) {
			
			if(img.files&&img.files[0]){
				var name= img.files[0].name
				var ext = name.substring(name.length-3,name.length)
				if(!(ext.toUpperCase()=='PNG'||ext.toUpperCase()=='JPG')){
					alert("이미지파일을 확인해주세요. png와 jpg만 가능합니다.")
					$('#'+inputId).val("")
		
		
					return;
				}
				const imgFile = new FileReader();
				imgFile.readAsDataURL(img.files[0])
				imgFile.onload = function(e) {
					const previewMainImage = document.getElementById("pre"+inputId);
					previewMainImage.src = e.target.result
					if(inputId=='bookMainImg'){
						$('#pre'+inputId).css({"width":"200px","height":"300px"})
					}			
				}		   
			}
		}
		
		//도서 등록전 모든 정보 입력하였는지 체크
		function submitCheck(){
			
			var check = true;
			$('#bookEnroll').find('input[type!=file]').each(function(){
			    if(!$(this).val()) {
			        alert($(this).data("name") +" 항목을 작성하지 않으셨습니다.")
			        $(this).focus();
			        check = false;
			        return false;
			    }
			 });
			if(!check){
				return;
			}
			if(!$('#bookCategory:checked').val()){
		    	alert($('#bookCategory').data("name") +" 항목을 작성하지 않으셨습니다.")
		    	$('#bookCategory').focus();
		    	return;
		    }
			if(!$('#bookSubCategory:checked').val()){
		    	alert($('#bookSubCategory').data("name") +" 항목을 작성하지 않으셨습니다.")
		    	$('#bookSubCategory').focus();
		    	return;
		    }
			if(!$('#bookContents').val()){
				alert($('#bookContents').data("name") +" 항목을 작성하지 않으셨습니다.")
		    	$('#bookContents').focus();
		    	return;
			}
			if(!$('#bookIntro').val()){
				alert($('#bookIntro').data("name") +" 항목을 작성하지 않으셨습니다.")
		    	$('#bookIntro').focus();
		    	return;
			}
			
			
			if(confirm("도서 부제목과 역자를 다시 한번 확인해주세요. 도서를 수정 하시겠습니까?")){
				
				$('#bookUpdateForm').submit();
			}
			
		}
		
		//텍스트 에어리어 글자수 제한
		function checkText(obj) {
			var checkText = $('#'+obj).val();
			var tempText = "";
			var limitByte = 3600;
			var checkByte = 0;
			
			for(var i = 0 ; i < checkText.length ; i++){
				var charOne = checkText.charAt(i);
				if(escape(charOne).length > 4){
					checkByte += 3;
					console.log(checkByte)
				}else{
					checkByte += 1;
					console.log(checkByte)
				}
				if(checkByte < limitByte){
				tempText += charOne;
				}else{
					alert("한글 1200자(공백포함), 영어 3600자(공백포함) 으로 입력 해주세요");
					$('#'+obj).val(tempText);
					return false;
				}
			}
		}
		
		function goBack() {
			history.back()
		}
	
	</script>

</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<main class="site-main" style="padding-top: 180px">
		<div style="display: flex;width: 1200px; ">
		<jsp:include page="../admin/adminLeftMenu.jsp" />
			<div style="margin-left: auto;margin-right: auto; ">  <br><br><br>
				<span style="font-size: 30px; font-weight: bold;">도서 정보 수정</span><br>
				<hr><br><br><br>
				<form action="bookUpdate.book" id="bookUpdateForm" class="bookEnroll" method="post" enctype="multipart/form-data">
					<input type="hidden" name="exBookISBN" value="${requestScope.book.bookISBN}">
					도서 ISBN : <input type="text" name="bookISBN" data-name = "도서 ISBN" id="bookISBN" readonly="readonly" value="${requestScope.book.bookISBN}"> <br>
					<br><br>
					도서 메인이미지(png와 jpg만 가능) : <input type="file" name="bookMainImgFile" id="bookMainImg" onchange="imgCheck(this,'bookMainImg')" data-name = "도서 메인이미지"><br>
					메인이미지 미리보기 :<br>
					<img src="${pageContext.servletContext.contextPath }/resources/images/book_img/${requestScope.book.bookMainImg}" id="prebookMainImg" ><br><br>
					도서 제목 : <input type="text" name="bookTitle" data-name = "도서 제목" value="${requestScope.book.bookTitle}"><br><br>
					도서 부제목 : <input type="text" name="bookSubTitle" value="${requestScope.book.bookSubTitle}"><br><br>
					도서 저자 : <input type="text" name="bookWriter" data-name = "도서 저자" value="${requestScope.book.bookWriter}"><br><br>
					도서 역자 : <input type="text" name="bookTranslator" value="${requestScope.book.bookTranslator}"><br><br>
					도서 메인 카테고리 : <input type="radio" id="bookCategory"  name="bookCategory" value="0" data-name = "도서 메인 카테고리"> 국내도서 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="radio" name="bookCategory" id="bookCategory" value="2"> ebook <br><br>
					도서 서브 카테고리 : <br>
					<c:set var="array">소설/시/에세이, 경제/경영, 과학, 인문, 컴퓨터/IT, 자기계발, 정치/사회, 역사/문화, 취미, 가정/육아 </c:set>
					<c:forEach items="${array}" var="list" varStatus="status">
						<input type="radio" name="bookSubCategory" value="${status.index}" data-name = "도서 서브 카테고리" id="bookSubCategory"> <c:out value="${list}"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${status.index==4}"><br></c:if>
					</c:forEach><br><br>
					도서 출판사 : <input type="text" name="bookPublisher" data-name = "도서 출판사" value="${requestScope.book.bookPublisher}"><br><br>
					도서 출간일 : <input type="date" name="publicheDate" id="publicheDate" data-name = "도서 출간일"  value="<fmt:formatDate value='${requestScope.book.bookPublisheDate}' pattern='yyyy-MM-dd'/>"><br><br>
					도서 정가 : <input type="number" name="bookPrice" data-name = "도서 정가" value="${requestScope.book.bookPrice}"><br><br>
					도서 목차 : <br>
					<textarea rows="30" cols="100" name="bookContents" id="bookContents" placeholder="한글 1200자(공백포함), 영어 3600자(공백포함) 내로 작성해 주세요" onkeyup="checkText('bookContents')" data-name = "도서 목차">
					${requestScope.book.bookContents}
					</textarea><br><br>
					도서 소개 : <br>
					<textarea rows="30" cols="100" name="bookIntro" id="bookIntro"  placeholder="한글 1200자(공백포함), 영어 3600자(공백포함) 내로 작성해 주세요" onkeyup="checkText('bookIntro')" data-name = "도서 소개">
					${requestScope.book.bookIntro}
					</textarea><br><br>
					도서 상세소개이미지(png와 jpg만 가능) : <input type="file" name="bookDetailImgFile" onchange="imgCheck(this,'bookDetailImg')" id="bookDetailImg" data-name = "도서 상세 이미지"><br><br>
					도서 수량 : <input type="number" name="bookStock" data-name = "도서 입고수" value="${requestScope.book.bookStock}"><br><br>
					<div style="display: flex;">
						<button type="button" onclick="submitCheck()" style="margin-right: auto;" class="btn btn-secondary btn-sm"> 도서 수정</button>
						<button type="button" onclick="goBack()" style="margin-left: auto;" class="btn btn-secondary btn-sm"> 돌아가기</button>
					</div>
					<br><br><hr><br>				
					상세소개 이미지 미리보기<br>
					<img src="${pageContext.servletContext.contextPath }/resources/images/book_img/${requestScope.book.bookDetailImg}" id="prebookDetailImg">
								
				</form>
				<br><br><br><br><br><br><br><br>
			</div>
		</div>
	</main>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>