<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel = "stylesheet" href="/resources/main/css/main.css">
<title>게시판 글쓰기</title>
<script type="text/javascript" src="../resources/ckeditor/ckeditor.js"></script>
<script>
$(function(){
    CKEDITOR.replace( 'board_content', {//해당 이름으로 된 textarea에 에디터를 적용
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
		/* alert($("#board_title").val()); */
		var board_title = $("#board_title").val();
		var board_content = $("#board_content").val();
		if(board_title == ""){
			alert('제목을 입력해주세요.');
			$("#board_title").focus();
			return;
		}
		alert('저장되었습니다.')
		formObj.submit();
	});
	$("#cancel").on("click", function() {
		self.location = "/main";
	});
});

</script>
</head>
<body>
<br>

<div class="container">
  <div class="alert alert-info">
		<strong>글쓰기</strong>
	</div>
  <!-- <p>The form below shows input elements with different heights using .input-lg and .input-sm:</p> -->
  <form method = "post" role="form">
  <div class="form-group">
      <label for="sel1">분류</label>
      <!-- <select class="form-control" id="sel1v" onChange="javascript:selectEvent(this)" name = "board_category"> -->
      <select class="form-control" id="sel1v" onChange="javascript:selectEvent(this)" name = "board_category">
        <option value='hsm00'>전체</option>
        <option value='hsm11'>금박기계</option>
        <option value='hsm22'>불박기계</option>
        <option value='hsm33'>기타</option>
      </select>
      <!-- <input class="form-control" type="text" id="board_category" name="board_category"> -->
    </div>
    
    <div class="form-group">
      <label for="inputdefault">제목</label>
      <input class="form-control" type="text" id="board_title" name="board_title">
    </div>
    
    <div class="form-group">
      <label for="inputdefault">이름</label>
        <input class="form-control" id="board_id" type="hidden" name = 'board_id' value="${login.user_id}" >
        <input class="form-control" id="board_name" type="text" name = 'board_name' value="${login.user_name}" readonly="readonly">
    </div>
    
    <div class="form-group">
      <label for="inputdefault">내용</label>
       <textarea id = "board_content" name="board_content"></textarea>
    </div>
    
   <br>
   
  </form>
  <div style="text-align: center;">
  <button type="submit" class="btn btn-primary" id="confirm">저장</button>
  <button type="button" class="btn btn-danger" id="cancel">취소</button>
  </div>
</div>
</body>
</html>