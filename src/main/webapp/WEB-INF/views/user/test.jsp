<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
   $(document).ready(function() {
      var formObj = $("form[role='form']");
      console.log(formObj);
      $("#confirm").on("click", function() {
         var u_email = $("#user_email").val();
         if (u_email == '' || u_email == null) {
            alert('이메일을 확인해주세요.');
            focus.u_email;
            return false;
         }
         regexp = /[a-z0-9]{2,}@[a-z0-9-]{2,}.[a-z0-9]{2,}/i; // 이메일
         var regexpNum = /[0-9+]/;
         var regexpEn = /^[a-zA-Z+]/; // 영문만
         for (var i = 0; i < u_email.length; i++) {
            if (u_email.charAt(i) != " " && regexp.test(u_email) == false) {
               alert("메일 형식이 맞지 않습니다.");
               return false;
            }
         }
         var u_pass = $("#user_pass").val();
         var u_pass1 = $("#user_pass1").val();
         if (u_pass == "" || u_pass == null) {
            alert('패스워드를 입력하세요');
            focus.u_pass;
            return false;
         }
         if (!regexpEn.test(u_pass)) {
            alert("비밀번호 첫글자에는 영문을 포함해야합니다.");
            return false;
         }
         if (!regexpNum.test(u_pass)) {
            alert("비밀번호 숫자를 포함해야합니다.");
            return false;
         }
         if (u_pass != u_pass1) {
            alert("비밀번호를 확인해주세요.");
            return false;
         }else {
         formObj.submit();
         }
      });
   });
</script>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
   data-offset="60">
   <form role="form" method="post">
      <div class="container-fluid bg-grey">
         <div class="container">
            <div class="form-group">
               <label for="inputdefault">아이디</label> <input class="form-control"
                  id="user_id" type="text" name='user_id' value="${login.user_id}"
                  readonly="readonly">
            </div>
            <div class="form-group">
               <label for="inputdefault">이름</label> <input class="form-control"
                  id="user_name" type="text" name='user_name'
                  value="${login.user_name}" readonly="readonly">
            </div>
            <div class="form-group">
               <label for="inputdefault">패스워드</label> <input class="form-control"
                  id="user_pass" type="password" name='user_pass'>
            </div>
            <div class="form-group">
               <label for="inputdefault">패스워드확인</label> <input
                  class="form-control" id="user_pass1" type="password"
                  name='user_pass1'>
            </div>
            <div class="form-group">
               <label for="inputdefault">이메일</label> <input class="form-control"
                  id="user_email" type="text" name='user_email'
                  value="${login.user_email}">
            </div>
   </form>
   <button type="submit" id="confirm">확인</button>

</body>
</html>