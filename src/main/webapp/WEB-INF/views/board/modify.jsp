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

//글쓰기 저장 버튼
$(document).ready(function() {
	var formObj = $("form[role='form']");
	
	$("#modifyConfirm").on("click", function() {
		var board_title = $("#board_title").val();
		if(board_title == ""){
			alert('제목을 입력해주세요.');
			$("#board_title").focus();
			return;
		}
		alert('저장되었습니다.')
		formObj.submit();
	});
	$("#cancel").on("click", function() {
		self.location = "/list";
	});
});

</script>
</head>


<body id="myPage" data-spy="scroll" data-target=".navbar"data-offset="60">
<br><br>

<div class="container">
<form method = "post" role="form">
	<input type ="hidden" name = 'board_no' value = "${boardVO.board_no}">
    <div class="form-group">
      <label for="inputdefault">제목</label>
        <input class="form-control" id="board_title" type="text" name = 'board_title' value="${boardVO.board_title}" >
    </div>
    <div class="form-group">
      <label for="inputdefault">카테고리</label>
        <%-- <input class="form-control" id="board_category" type="text" name = 'board_category' value="${boardVO.board_category}" > --%>
    	<select class="form-control" id="sel1v" name = "board_category">
    	 <c:if test="${boardVO.board_category=='hsm00'}">
	        <option value='hsm00' selected="selected">전체</option>
	        <option value='hsm11'>금박기계</option>
	        <option value='hsm22'>불박기계</option>
	        <option value='hsm33'>기타</option>
	     </c:if>
	      <c:if test="${boardVO.board_category=='hsm11'}">
	        <option value='hsm00'>전체</option>
	        <option value='hsm11' selected="selected">금박기계</option>
	        <option value='hsm22'>불박기계</option>
	        <option value='hsm33'>기타</option>
	     </c:if>
	     <c:if test="${boardVO.board_category=='hsm22'}">
	        <option value='hsm00'>전체</option>
	        <option value='hsm11'>금박기계</option>
	        <option value='hsm22' selected="selected">불박기계</option>
	        <option value='hsm33'>기타</option>
	     </c:if>
	     <c:if test="${boardVO.board_category=='hsm33'}">
	        <option value='hsm00'>전체</option>
	        <option value='hsm11'>금박기계</option>
	        <option value='hsm22'>불박기계</option>
	        <option value='hsm33' selected="selected">기타</option>
	     </c:if>  
      </select>
    </div>
    <div class="form-group">
      <label for="inputdefault">이름</label>
        <input class="form-control" id="board_name" type="text" name = 'board_name' value="${boardVO.board_name}" disabled>
    </div>
    <div class="form-group">
      <label for="inputdefault">내용</label>
      	<textarea id = "board_content" name="board_content">${boardVO.board_content}</textarea>
    </div>
</form>
  
</div>
    <br>
  <div style="text-align: center;">
  <button type="submit" class="btn btn-primary" id="modifyConfirm">수정</button>
  <button type="button" class="btn btn-warning" id="cancel">취소</button>
  </div>
</body>
</html>