<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
</style>
<title>아이디 찾기</title>
<script type="text/javascript">
$(document).ready(function() {
	var notfindid = '${msg}';
	if (notfindid) {
		alert(notfindid);
	}
	var formObj = $("form[role='form']");
	$("#findid").on("click", function() {
		var uid = $("#user_name").val();
		var uem = $("#user_email").val();
		if(uid==""){
			alert('이름을 입력해주세요.');
			$("#user_name").focus();
			return;
		}else if(uem ==""){
			alert('이메일을 입력해주세요.');
			$("#user_email").focus();
			return;
		}
		formObj.submit();
	});
});

$(function() {
    $("input").keydown(function (event) {
        if (event.which === 13) {
            $("#findid").trigger("click");
        }
    });
});		
</script>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<br>
<br>
<form method="post" role="form">
<div class="container">
	<div class="container">
		<h2>아이디 찾기</h2>
		<div class="form-group">
			<label for="user_name">이름</label> <input type="text" class="form-control" id="user_name" name="user_name">
		</div>
		<div class="form-group">
			<label for="user_email">이메일</label> <input type="text" class="form-control" id="user_email" name="user_email">
		</div>
	</div>
</div>
</form>
<div style="text-align: center;">
	<button id="findid" class="btn btn-primary btn-md">확인</button>
</div>
</body>
</html>