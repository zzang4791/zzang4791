<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/main/css/main/main.css">
<title>회원가입</title>
<style type="text/css">
</style>
</head>
<script>
  $(document).ready(function() {
     var formObj = $("form[role='form']");
    /*  $("#confirm").on("click", function() {
        formObj.submit();
     }); */
     $("#confirm").on("click", function() {
         var u_name = $("#user_name").val();
         //var han = /^[가-힣]+$/; 
           if (u_name == '' || u_name == null || u_name.length < 2) {
               alert('이름을 입력하세요');
               focus.u_name;
               return false;
            }
         /*    for (var i = 0; i < u_name.length; i++) {
               if (u_name.charAt(i) != " " && han.test(u_name.charAt(i)) == false) {
                  alert("이름은 영어나 특수문자는 입력불가능 합니다.");
                  return false;
               }
            } */
         var u_id = $("#user_id").val();
         var regexp = /[a-zA-Z0-9]/; // 숫자,영문,특수문자
         var regexpNum = /[0-9+]/;
         var regexpEn = /^[a-zA-Z+]/; // 영문만
          if (u_id == '' || u_id == null) {
            alert('ID를 입력하세요');
            focus.u_id;
            return false;
         }
         if (u_id.length < 6 || u_id.length > 12) {
            alert('ID는 6자부터 12자 까지가능합니다.');
            focus.u_id;
            return false;
         }
         for (var i = 0; i < u_id.length; i++) {
            if (u_id.charAt(i) != " " && regexp.test(u_id.charAt(i)) == false) {
               alert("한글이나 특수문자는 입력불가능 합니다.");
               return false;
            }
         }
         var u_pass = $("#user_pass").val();
         if(u_pass == ''||u_pass ==null){
            alert('패스워드를 입력하세요');
            focus.u_pass;
            return false;
         }if (!regexpEn.test(u_pass)) {
            alert("비밀번호 첫글자에는 영문을 포함해야합니다.");
            return false;
         }if (!regexpNum.test(u_pass)) {
               alert("비밀번호 숫자를 포함해야합니다.");
               return false;
          }if (u_pass != $("#user_pass1").val()){
            alert("비밀번호를 확인해주세요.");
            return false;
         }
           var u_email = $("#user_email").val();
           if (u_email == '' || u_email == null) {   
               alert('이메일을 확인해주세요.');
               focus.u_email;
               return false;
            }
               regexp =  /[a-z0-9]{2,}@[a-z0-9-]{2,}.[a-z0-9]{2,}/i;  // 이메일
               for (var i = 0; i < u_email.length; i++) {
                  if (u_email.charAt(i) != " " && regexp.test(u_email) == false) {
                     alert("메일 형식이 맞지 않습니다.");
                     return false;
                  }
               }
         formObj.submit();
      });
     
		$("#cancel").on("click", function() {
		   location.href = '../main';
		});
		
		$("#checkid").click(function(){
		    var u_id = $("#user_id").val();
		    if (u_id == '' || u_id == null) {
	            alert('ID를 입력하세요');
	            focus.u_id;
	            return false;
	         }
		    var param = "user_id="+u_id;
		    $.ajax({
		    	 type: "post",
		         url: "check_id",
		       data : param,
		       success : function(data) {
			    	if (data == "true") {
	                  alert('회원가입이 가능한 아이디입니다.');
	                } else {
	                  alert('중복되는 아이디입니다.');
	                  $("#user_id").val('');
	                }
         	   } 
      		});
   		});
});
//엔터이벤트랑 버튼클릭해주는 jQuery  trigger
$(function() {
     $("input").keydown(function (event) {
         if (event.which === 13) {    //enter
             console.log($(this).val());
             $("#confirm").trigger("click");
         }
     });
});		
</script>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">
	<br>
	<br>
	<form method="post" role="form">

		<div class="container">
			<h2>회원가입</h2>
			<div class="form-group">
				<label for="email">이름</label> <input type="text"
					class="form-control" id="user_name" name="user_name"
					placeholder="이름을 입력해주세요">
			</div>
			<div class="form-group">
				<label for="email">아이디</label>&nbsp;&nbsp;
				<button type="button" class="btn btn-primary btn-md" id="checkid"
					name="checkid">중복확인</button> <input type="text"
					class="form-control" id="user_id" name="user_id"
					placeholder="아이디를 입력해주세요">
			</div>
			<div class="form-group">
				<label for="pwd">비밀번호</label> <input type="password"
					class="form-control" id="user_pass" name="user_pass"
					placeholder="비밀번호를 입력해주세요">
			</div>
			<div class="form-group">
				<label for="user_pwd">비밀번호확인</label> <input type="password"
					class="form-control" id="user_pass1" name="user_pass1"
					placeholder="비밀번호를 입력해주세요">
			</div>
			<div class="form-group">
				<label for="email">이메일</label> <input type="email"
					class="form-control" id="user_email" name="user_email"
					placeholder="메일주소를 입력해주세요">
			</div>

			<br>
		</div>
	</form>
	<div style="text-align: center;">
		<button type="submit" class="btn btn-primary btn-md" id="confirm">확인</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="reset" class="btn btn-primary btn-md" id="cancel">취소</button>
	</div>
</body>
</html>