<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
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
	CKEDITOR.instances.board_content.getData()

    CKEDITOR.replace( 'product_content', {//해당 이름으로 된 textarea에 에디터를 적용
        width:'100%',
        height:'400px',
    });
    
});
function goList(){
	location.href='/main';
}	    
function goModify(){
	location.href='/product_modify?product_no=${productVO.product_no}';
}
function goDelete(){
	location.href='/product_delete?product_no=${productVO.product_no}';
}
</script>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"data-offset="60">
<br><br>

<div class="container">
	
	 <%-- <div class="form-group">
      <label for="inputdefault">분류</label>
      <c:if test="${productVO.product_category=='hsm_bb'}">
        <input class="form-control" id="product_category" type="text" name = 'product_category' value="불박기계" placeholder="Disabled input here..." disabled>
      </c:if>
      <c:if test="${productVO.product_category=='hsm_gb'}">
        <input class="form-control" id="product_category" type="text" name = 'product_category' value="금박기계" placeholder="Disabled input here..." disabled>
      </c:if>
      <c:if test="${productVO.product_category=='hsm_gt'}">
        <input class="form-control" id="product_category" type="text" name = 'product_category' value="기타" placeholder="Disabled input here..." disabled>
      </c:if>
    </div> --%>
    
    <div class="form-group">
    	<label for="inputdefault">제목</label>
        <input class="form-control" id="product_title" type="text" name = 'product_title' value="${productVO.product_title}" placeholder="Disabled input here..." disabled>
    </div>
    
    <div class="form-group">
      <label for="inputdefault">내용</label>
      <div id = "product_content" name="product_content" style="overflow: auto; border-color:red; border-width: 3px;">${productVO.product_content}</div>
    </div>
    
    
</div>

<br><br>

<div style="text-align: center;">
<c:if test= "${login.user_id == 'admin'}">
<button type="button" class="btn btn-primary" onclick="goModify();" >수정</button>
<button type="button" class="btn btn-primary" onclick="goDelete();" >삭제</button>
</c:if>
<button type="button" class="btn btn-info" onclick="goList();">목록</button>

</div>




<%-- 

<input type = 'text' name = 'board_title' value = "${boardVO.board_title}">
<input type = 'text' name = 'board_category' value = "${boardVO.board_category}">
<br>
<div id = "board_content" name="board_content" style="overflow: auto; border-color:red; border-width: 3px;">${boardVO.board_content}</div>
 --%>
</body>
</html>