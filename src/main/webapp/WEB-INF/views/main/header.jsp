<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>제일 금박기계</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/main/css/main.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<script>
$(document).ready(function(){
	$("#btnLogout").click(function(){
		$.ajax({
			type : "get",
			url : "/logout",
			/* data : param, */
			success: function(){
				alert('로그아웃 되었습니다.');
				location.href="/main";
			}
		});
	});
});
</script>
<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<!-- <a class="navbar-brand" href="#myPage">제일 금박기계</a> -->
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			
			
			
			<ul class="nav navbar-nav">
				<li class="active"><a href="../main">Home</a></li>
				<!-- <li><a href="../intro">회사 소개</a></li> -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">제품 정보<span class="caret"></span></a>
					<ul class="dropdown-menu" style="background-color: black;">
						<li><a href="../hsm_bb">불박기계</a></li>
						<li><a href="../hsm_gb">금박기계</a></li>
						<li><a href="../hsm_gt">기타</a></li>
					</ul></li>
				<li><a href="../list">게시판</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<!-- <li><a href="#contact">제품문의</a></li> -->
				<c:if test="${empty login.user_id}">
					<!-- <li><a href="#myModal" data-toggle="modal" >회원가입</a></li> -->
					<li><a href="../login">로그인</a></li>
					<li><a href="../join">회원가입</a></li>
				</c:if>
				<c:if test="${!empty login.user_id}">
					<li><a href="../mypage">마이페이지</a></li>
					<li><a href="" id='btnLogout'>로그아웃</a></li>
					<!-- <li>
					<button id="btnLogout">로그아웃</button>
					</li> -->
					<%--   ${user.user_name} 님 로그인중입니다. --%>
				</c:if>
			</ul>
			
		</div>
	</div>
</nav>
<%-- <jsp:include page="../user/joinModal.jsp"></jsp:include> --%>
</html>