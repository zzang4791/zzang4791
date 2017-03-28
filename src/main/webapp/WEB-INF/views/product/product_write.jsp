<%@page import="org.codehaus.jackson.JsonParser"%>
<%@page import="org.apache.commons.fileupload.FileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.jeil.controller.FileUploadController" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>게시판 글쓰기</title>
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

/* function selectEvent(selectObj) {
	alert(sel1v.value + "가 선택 되었습니다.");
} */
//글쓰기 저장 버튼
$(document).ready(function() {
	var formObj = $("form[role='form']");
	 $("#confirm").on("click", function() {
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
        	alert('파일 업로드에 성공하였습니다.');
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
<body>
<br>

<div class="container">
  <div class="alert alert-info">
		<strong>제품 글쓰기</strong>
	</div>
<!-- <p>The form elow shows input elements with different heights using .input-lg and .input-sm:</p> -->
  <form method = "post" role="form" name ="pw1form">
  <div class="form-group">
      <label for="sel1">분류</label>
      <!-- <select class="form-control" id="sel1v" onChange="javascript:selectEvent(this)" name = "board_category"> -->
      <select class="form-control" id="sel" onChange="javascript:selectEvent(this)" name = "product_category">
        <option value='hsm_bb'>불박기계</option>
        <option value='hsm_gb'>금박기계</option>
        <option value='hsm_gt'>기타</option>
        <!-- <option value='hsm33'></option> -->
      </select>
    <!-- <input class="form-control" type="text" id="board_category" name="board_category"> -->
    </div>
    <div class="form-group">
      <label for="inputdefault">제목</label>
      <input class="form-control" type="text" id="product_title" name="product_title">
    </div>
    
   <div class="form-group">
      <label for="inputdefault">이름</label>
        <input class="form-control" id="product_writer" type="text" name = 'product_writer' value="${login.user_name}" readonly="readonly">
    </div>
    
    <div class="form-group">
      <label for="inputdefault">내용</label>
       <textarea id = "product_content" name="product_content"></textarea>
    </div>
   	<br>
		<input type="hidden" id="product_picture" name="product_picture">
    </form>
    
     <label for="inputdefault">리스트 그림 파일</label>
  	 <form id="fileForm" action="fileUpload" method="post" enctype="multipart/form-data">
        <input type="file" id="fileUp" name="fileUp"/>
        <input type="button" value="전송하기" onClick="fileSubmit();">
     </form>
    
  <div style="text-align: center;">
  <button type="button" class="btn btn-warning" id="confirm">저장</button>
  <button type="button" class="btn btn-warning" id="cancel">취소</button>
  </div>
</div>
</body>
</html>