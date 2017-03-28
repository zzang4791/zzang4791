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
<title>로그인</title>
<script type="text/javascript">
$(document).ready(function() {
   var result = '${msg}';
   var findid = '${user}';
   var loginInter = '${LoginInter}'
   if (result == 'Failed') {
       alert("아이디와 비밀번호가 일치하지 않습니다.");
   }
   if (loginInter == 'Stops') {
       alert("로그인해주세요.");
   }
   
   if (findid) {
	alert("회원님의 아이디는 ${user}입니다.");
   } 
	
   var formObj = $("form[role='form']");
   $("#login").on("click", function() {
		var uid = $("#user_id").val();
		var upw = $("#user_pass").val();
		if(uid==""){
			alert('아이디를 입력해주세요.');
			$("#user_id").focus();
			return;
		}else if(upw ==""){
			alert('비밀번호를 입력해주세요.');
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
      <h2>로그인</h2>
      <div class="form-group">
         <label for="user_id">아이디</label> <input type="text" class="form-control" id="user_id" name="user_id">
      </div>
      <div class="form-group">
         <label for="user_pass">비밀번호</label> <input type="password" class="form-control" id="user_pass" name="user_pass">
      </div>
   </div>
</div>
</form>
<br>

<div style="text-align: center;">
	<button id="login" class="btn btn-primary btn-md" onclick="onEnter();">로그인</button>
	<button id="join" class="btn btn-primary btn-md">회원가입</button>
	<button id="findid" class="btn btn-primary btn-md">아이디찾기</button>
	<button id="findpw" class="btn btn-primary btn-md">비밀번호찾기</button>
</div>

</body>
</html>