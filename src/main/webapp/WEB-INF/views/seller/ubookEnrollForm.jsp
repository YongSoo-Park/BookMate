<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책구메이트 - 중고장터</title>
<link rel="icon" href="resources/img/logo1.png" type="image/png">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<script type="text/javascript">
$(document).ready(function() {
    $('#ubookDetail').on('keyup', function() {
        $('#test_cnt').html("("+$(this).val().length+" / 3600)");
 
        if($(this).val().length > 3600) {
        	alert("최대 3600자까지 입력 가능합니다.");
            $(this).val($(this).val().substring(0, 3600));
            $('#test_cnt').html("(3600 / 3600)");
        }
    });
});


$(document).ready(function() {
    $('#ubookContent').on('keyup', function() {
        $('#test_cnt1').html("("+$(this).val().length+" / 3600)");
 
        if($(this).val().length > 3600) {
        	alert("최대 3600자까지 입력 가능합니다.");
            $(this).val($(this).val().substring(0, 3600));
            $('#test_cnt1').html("(3600 / 3600)");
        }
    });
});

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
			const previewUbookImage = document.getElementById("pre"+inputId);
			previewUbookImage.src = e.target.result
			if(inputId=='ubookImg'){
				$('#pre'+inputId).css({"width":"200px","height":"300px"})
			}			
		}		   
	}
}


function resetForm() {
	if($('.selected').data != '' ){
		$('.selected').remove();
		$('.focus').addClass('selected');
		$('.option').data();
	}
	document.getElementById('ubCategory').value="";
	document.getElementById('ubookQual').value="";
	
	document.getElementById('ubookEnroll').reset();
}

function submitCheck(){
	var check = true;
	$('#ubookEnroll').find('input[type!=button]').each(function(){
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
	var ubCategory = $("select[name='ubCategory']").val();
	var ubookQual = $("select[name='ubookQual']").val();
	var ubookPrice = $("input[name='ubookPrice']").val();
	var ubookOPrice = $("input[name='ubookOPrice']").val();

	if(ubCategory == ''){
		confirm('도서 카테고리를 선택해주세요');
		return false;
	}
	if(ubookPrice > ubookOPrice){
		alert('판매가는 정가보다 높을 수 없습니다. 다시 입력해주세요.');
		ubookPrice.focus('');
		return false;
	}

	if(ubookQual == ''){
		alert('도서 품질을 선택해주세요');
		console.log("품질 없음");
		return false;
	}

	if(!$('#ubookDetail').val()){
		alert($('#ubookDetail').data("name") +" 항목을 작성하지 않으셨습니다.")
    	$('#ubookDetail').focus();
    	return;
	}
	if(!$('#ubookContent').val()){
		alert($('#ubookContent').data("name") +" 항목을 작성하지 않으셨습니다.")
    	$('#ubookContent').focus();
    	return;
	}
	
	if(confirm("도서를 등록 하시겠습니까?")){
		$('#ubookEnroll').submit();
	}
}

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
</script>
<style type="text/css">
.info{
 background-color: #d1e7d1 !important;
}
</style>
</head>
<body>
	<!-- 도서 등록 -->
	<div class="tabContent3" style="margin: auto !important; width: 930px;">
		<div class="container2" id="sell_book">
			<div class="row2">
				<h2>도서 등록</h2>
				<form action="ubookEnroll.ub" method="post" id="ubookEnroll" enctype="multipart/form-data" >
					<table class="table table-bordered success">
						<colgroup>
							<col width="100px" />
							<col width="400px" />
						</colgroup>
						<thead>
							<tr hidden="hidden">
								<th class="info">판매자 번호</th>
								<td><input class="usedBookInfo" name="bSellerNo"
									value="${ s.sellerNo }" readonly="readonly"></td>
							</tr>
							<tr>
								<th class="info">도서명</th>
								<td><input class="usedBookInfo" name="ubookName" required="required"
									placeholder="도서명을 입력해주세요" data-name = "도서명"></td>
							</tr>
							<tr>
								<th class="info">저자(지은이)</th>
								<td><input class="usedBookInfo" name="ubookWriter" required="required"
									placeholder="저자를 입력해주세요" data-name = "도서 지은이"></td>
							</tr>
							<tr>
								<th class="info">ISBN-13</th>
								<td><input class="usedBookInfo" name="ubookIsbn" required="required"
									maxlength="13" type="number"
									placeholder="도서의 ISBN을 입력해주세요(- 없이)" data-name = "도서 ISBN"></td>
							</tr>
							<tr>
								<th class="info">카테고리</th>
								<td><select id="ubCategory" name="ubCategory" required="required"
								style="font-size: 15px;"
									class="form-control" data-name = "도서 카테고리">
										<option value="" selected>== 카테고리 선택 ==</option>
										<option value="1">소설/시/에세이</option>
										<option value="2">경제/경영</option>
										<option value="3">과학</option>
										<option value="4">인문</option>
										<option value="5">컴퓨터/IT</option>
										<option value="6">자기계발</option>
										<option value="7">정치/사회</option>
										<option value="8">역사/문화</option>
										<option value="9">취미</option>
										<option value="10">가정/육아</option>
								</select></td>
							</tr>

							<tr>
								<th class="info">역자</th>
								<td><input class="usedBookInfo" name="ubookTrans" required="required"
									placeholder="역자를 입력해주세요" value="없음" data-name = "도서 역자"></td>
							</tr>
							<tr>
								<th class="info">출판사</th>
								<td><input class="usedBookInfo" name="ubookPub" required="required"
									placeholder="출판사를 입력해주세요" data-name = "도서 출판사"></td>
							</tr>
							<tr>
								<th class="info">출판일</th>
								<td><input class="usedBookInfo" name="ubookPubDate" required="required"
									type="date"
									placeholder="출판일을 입력해주세요" data-name = "도서 출판일"></td>
							</tr>
							<tr>
								<th valign="top" class="info">정가</th>
								<td><input class="usedBookInfo" name="ubookOPrice" required="required"
									 type="number"
									placeholder="정가를 입력해주세요" data-name = "도서 정가"></td>
							</tr>
							<tr>
								<th class="info">판매가</th>
								<td><input class="usedBookInfo" name="ubookPrice" required="required"
									 type="number"
									placeholder="판매가를 입력해주세요" data-name = "도서 판매가"></td>
							</tr>
							<tr>
								<th class="info">재고수량</th>
								<td><input class="usedBookInfo" name="ubookStock" required="required"
									 type="number" min="1"
									placeholder="재고수량을 입력해주세요" data-name = "재고 수량"></td>
							</tr>

							<tr>
								<th class="info">도서 품질<br> 기준표</th>
								<td>
									S : 최상. 낙서/얼룩/접힙/찢김/변색/제본불량 해당 없음<br> 
									A : 상. 낙서/얼룩/접힙/찢김/변색/제본불량 일부 있음<br>
									B : 보통. 낙서/얼룩/접힙/찢김/변색/제본불량 2가지 이상 있음<br>
									C : 하. 낙서/얼룩/접힙/찢김/변색/제본불량 3가지 이상 있음<br>
									D : 최하. 낙서/얼룩/접힙/찢김/변색/제본불량 다수 있음<br>
								
								</td>
							</tr>
							<tr>
								<th class="info">도서 품질</th>
								<td><select id="bookQual" name="ubookQual" required="required"
								style="font-size: 15px;"
									class="form-control" data-name = "도서 품질">
										<option value="" selected>== 도서 품질 선택 ==</option>
										<option value="S">S</option>
										<option value="A">A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<option value="D">D</option>
								</select></td>
							</tr>

							<tr>
								<th class="info">도서 상세</th>
								<td><textarea name="ubookDetail" id="ubookDetail" cols="54" required="required" maxlength="3600"
								style="width: 100%;"
										rows="10" placeholder="도서의 줄거리, 도서 품질 상세 정보 등을 입력해주세요" data-name = "도서 상세"></textarea>
										<div id="test_cnt">(0 / 3600)</div>
								</td>
							</tr>
							<tr>
								<th class="info">도서 목차</th>
								<td><textarea name="ubookContent" id="ubookContent" cols="54" required="required" maxlength="3600"
								style="width: 100%;"
										rows="10" placeholder="도서의 목차를 입력해주세요" data-name = "도서 목차"></textarea>
										<div id="test_cnt1">(0 / 3600)</div>
								</td>
							</tr>
							<tr>
								<th class="info">도서 이미지</th>
								<td><input name="UbookImgFile" type="file" id="ubookImg"
									onchange="imgCheck(this,'ubookImg')"
									class="text-center center-block file-upload" data-name = "도서 이미지"></td>
							</tr>
							<tr>
									<th class="info">도서 이미지<br>미리보기</th>
								<td>
									<img alt="" src="" id="preubookImg" >
								</td>
							</tr>
						</thead>
					</table>
					<center>
						<input type="submit" id="approve_btn" class="btn"
								style="font-size: 15px; background-color: #28a745; color: #fff;"
							name="approve_btn" onclick="submitCheck()" value="등록하기"> 
							
							<input type="button"
								style="font-size: 15px; background-color: #6a816b; color: #fff;"
							id="approve_btn" class="btn" name="approve_btn"
							 onclick="resetForm()"
							value="취소하기">
					</center>
				</form>
				<br>
				<br>
			</div>
		</div>
	</div>
</body>
</html>