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
<title>�α���</title>
<script type="text/javascript">
$(document).ready(function() {
   var result = '${msg}';
   var findid = '${user}';
   var loginInter = '${LoginInter}'
   if (result == 'Failed') {
       alert("���̵�� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
   }
   if (loginInter == 'Stops') {
       alert("�α������ּ���.");
   }
   
   if (findid) {
	alert("ȸ������ ���̵�� ${user}�Դϴ�.");
   } 
	
   var formObj = $("form[role='form']");
   $("#login").on("click", function() {
		var uid = $("#user_id").val();
		var upw = $("#user_pass").val();
		if(uid==""){
			alert('���̵� �Է����ּ���.');
			$("#user_id").focus();
			return;
		}else if(upw ==""){
			alert('��й�ȣ�� �Է����ּ���.');
			$("#user_pass").focus();
			return;
		}
      formObj.submit();
   });
   
   $("#join").on("click", function() {
      self.location = "/join";
   });
   $("#findid").on("click", function() {
      self.location = "/findid";
   })
   $("#findpw").on("click", function() {
      self.location = "/findpw";
   })
});

$(function() {
     $("input").keydown(function (event) {
         if (event.which === 13) {
             console.log($(this).val());
             $("#login").trigger("click");
         }
     });
});		
</script>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<br>
<br>
<form method="post" action="loginPost" role="form">
<div class="container">
   <div class="container">
      <h2>�α���</h2>
      <div class="form-group">
         <label for="user_id">���̵�</label> <input type="text" class="form-control" id="user_id" name="user_id">
      </div>
      <div class="form-group">
         <label for="user_pass">��й�ȣ</label> <input type="password" class="form-control" id="user_pass" name="user_pass">
      </div>
   </div>
</div>
</form>
<br>

<div style="text-align: center;">
	<button id="login" class="btn btn-primary btn-md" onclick="onEnter();">�α���</button>
	<button id="join" class="btn btn-primary btn-md">ȸ������</button>
	<button id="findid" class="btn btn-primary btn-md">���̵�ã��</button>
	<button id="findpw" class="btn btn-primary btn-md">��й�ȣã��</button>
</div>

</body>
</html>