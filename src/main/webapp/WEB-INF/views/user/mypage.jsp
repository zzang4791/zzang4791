<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%   
response.setHeader("Cache-Control","no-store");   
response.setHeader("Pragma","no-cache");   
response.setDateHeader("Expires",0);   
if (request.getProtocol().equals("HTTP/1.1")) 
        response.setHeader("Cache-Control", "no-cache"); 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<script>
	function goWrite() {
		location.href = 'product_write';
	}
	function modify() {
		location.href = '/user/modify';
	}
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		$("#remove").on("click", function() {
			if (confirm("정말 삭제하시겠습니까? 작성한 댓글과 댓글이 함께 삭제됩니다.") == true){ 
				formObj.attr("action", "/user/delete");
				alert('계정이 삭제되었습니다.');
				formObj.submit();
			}else{   //취소
				alert('취소되었습니다.');
				//history.back();
				location.href = 'mypage';
			}
		});
	});
</script>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">

	<div class="container-fluid bg-grey">

		<form role="form" method="post">
			<div class="container">
				<div class="form-group">
					<label for="inputdefault">아이디</label> <input class="form-control"
						id="user_id" type="text" name='user_id' value="${login.user_id}"
						readonly="readonly"> <input type="hidden" name='board_id'
						id='board_id' value="${login.user_id}">
				</div>
				<div class="form-group">
					<label for="inputdefault">이름</label> <input class="form-control"
						id="user_name" type="text" name='user_name'
						value="${login.user_name}" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="inputdefault">이메일</label> <input class="form-control"
						id="user_email" type="text" name='user_email'
						value="${login.user_email}" readonly="readonly">
				</div>
		</form>

		<c:if test="${login.user_id == 'admin'}">
			<button type="button" class="btn btn-primary btn-md"
				onclick="goWrite();">제품 글쓰기</button>
		</c:if>
		<button type="button" class="btn btn-primary btn-md"
			onclick="modify();">수정</button>
		<button type="submit" class="btn btn-primary btn-md" id="remove">회원탈퇴</button>
</body>
</html>