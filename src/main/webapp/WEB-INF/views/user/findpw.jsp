<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
</style>
<title>��й�ȣ ã��</title>
<script type="text/javascript">
$(document).ready(function() {
	var notfindpw = "${msg}";
	if (notfindpw) {
		alert(notfindpw);
	}
	
	var formObj = $("form[role='form']");
	$("#findpw").on("click", function() {
		var uid = $("#user_id").val();
		var uem = $("#user_email").val();
		if(uid==""){
			alert('���̵� �Է����ּ���.');
			$("#user_id").focus();
			return;
		}else if(uem ==""){
			alert('�̸����� �Է����ּ���.');
			$("#user_email").focus();
			return;
		}
		formObj.submit();
	});
});

$(function() {
     $("input").keydown(function (event) {
         if (event.which === 13) {    
             $("#findpw").trigger("click");
         }
     });
});	
</script>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<br>
<br>
<form method="post" role="form" name = "myForm">
<div class="container">
	<h2>��й�ȣ ã��</h2>
	<div class="form-group">
		<label for="user_id">���̵�</label> <input type="text" class="form-control" id="user_id" name="user_id">
	</div>
	<div class="form-group">
		<label for="user_email">�̸���</label> <input type="text" class="form-control" id="user_email" name="user_email">
	</div>
</div>
</form>
<div style="text-align: center;">
	<button id="findpw" class="btn btn-primary btn-md">Ȯ��</button>
</div>
</body>
</html>