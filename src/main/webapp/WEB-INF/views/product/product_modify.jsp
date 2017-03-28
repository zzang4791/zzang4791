<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel = "stylesheet" href="/resources/main/css/main/main.css">
<script>
$(function(){
    CKEDITOR.replace( 'product_content', {//해당 이름으로 된 textarea에 에디터를 적용
        width:'100%',
        height:'400px',
        filebrowserImageUploadUrl: '/resources/upload/' //여기 경로로 파일을 전달하여 업로드 시킨다.
    });
     
    CKEDITOR.on('dialogDefinition', function( ev ){
        var dialogName = ev.data.name;
        var dialogDefinition = ev.data.definition;
        switch (dialogName) {
            case 'image': //Image Properties dialog
                //dialogDefinition.removeContents('info');
                dialogDefinition.removeContents('Link');
                dialogDefinition.removeContents('advanced');
                break;
        }
    });
});

//글쓰기 저장 버튼
$(document).ready(function() {
	var formObj = $("form[role='form']");
	$("#modifyConfirm").on("click", function() {
		/* alert($("#board_title").val()); */
		alert('저장되었습니다.')
		formObj.submit();
	});
	$("#cancel").on("click", function() {
		self.location = "/main";
	});
});

function fileSubmit() {
	
    var formData = new FormData($("#fileForm")[0]);
    $.ajax({
        type : 'post',
        url : 'fileUpload',
        data : formData,
        dataType: 'json',
        processData : false,
        contentType : false,
        success : function(data) {
        	//alert(data.KEY);
        	alert('파일 수정에 성공하였습니다.');
        	$("#product_picture").val(data.KEY);
        },
        error : function(error) {
            alert("파일 업로드에 실패하였습니다.");
            console.log(error);
            console.log(error.status);
        }
    });
}

</script>
</head>


<body id="myPage" data-spy="scroll" data-target=".navbar"data-offset="60">
<br><br>

<div class="container">
<form method = "post" role="form">
	<input type ="hidden" name = 'product_no' value = "${productVO.product_no}">
	
	<div class="form-group">
      <label for="sel1">분류</label>
    <c:if test = "${productVO.product_category == 'hsm_bb' }">
      <select class="form-control" id="sel" onChange="javascript:selectEvent(this)" name = "product_category">
        <option value='hsm_bb' selected="selected">불박기계</option>
        <option value='hsm_gb'>금박기계</option>
        <option value='hsm_gt'>기타</option>
      </select>
    </c:if>
     <c:if test = "${productVO.product_category == 'hsm_gb' }">
      <select class="form-control" id="sel" onChange="javascript:selectEvent(this)" name = "product_category">
        <option value='hsm_bb'>불박기계</option>
        <option value='hsm_gb' selected="selected">금박기계</option>
        <option value='hsm_gt'>기타</option>
      </select>
    </c:if>
     <c:if test = "${productVO.product_category == 'hsm_gt' }">
      <select class="form-control" id="sel" onChange="javascript:selectEvent(this)" name = "product_category">
        <option value='hsm_bb'>불박기계</option>
        <option value='hsm_gb'>금박기계</option>
        <option value='hsm_gt' selected="selected">기타</option>
      </select>
    </c:if>
    
    
    </div>
    
    
    <div class="form-group">
      <label for="inputdefault">제목</label>
        <input class="form-control" id="product_title" type="text" name = 'product_title' value="${productVO.product_title}" >
    </div>
    <div class="form-group">
      <label for="inputdefault">내용</label>
      	<textarea id = "product_content" name="product_content">${productVO.product_content}</textarea>
    </div>
    <br>
    
    	<input type="hidden" id="product_picture" name="product_picture" value = "${productVO.product_picture}">

</form>

	<label for="inputdefault">그림파일첨부</label>
  	 <form id="fileForm" action="fileUpload" method="post" enctype="multipart/form-data">
        <input type="file" id="fileUp" name="fileUp"/>
        <input type="button" value="전송하기" onClick="fileSubmit();">
     </form>
    
  <div style="text-align: center;">
  <button type="submit" class="btn btn-primary" id="modifyConfirm">수정</button>
  <button type="button" class="btn btn-warning" id="cancel">취소</button>
  </div>
</div>
</body>
</html>