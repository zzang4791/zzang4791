<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%-- <script src="${pageContext.request.contextPath}/resource/ckeditor/ckeditor.js"></script>	 --%>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel = "stylesheet" href="/resources/main/css/main/main.css">
  <link rel = "stylesheet" href="/resources/main/css/main/hsmStyle.css">
<title>금박기계</title>
<style>
  .jumbotron {
      background-color: #f4511e;
      color: #fff;
      padding: 100px 25px;
  }
  .container-fluid {
      padding: 60px 50px;
  }
  .bg-grey {
      background-color: #f6f6f6;
  }
  .logo-small {
      color: #f4511e;
      font-size: 50px;
  }
  .logo {
      color: #f4511e;
      font-size: 200px;
  }
  .thumbnail {
	  padding-top:30px;
  }
  
  .thumbnail img {
      width: 50%;
      height: 50%;
      border-radius: 10px;
      box-shadow: 4px 4px 4px grey;
  }
  @media screen and (max-width: 200px) {
    .col-sm-4 {
    
      text-align: center;
      margin: 5px 0;
    }
  }
</style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<br>
<div class="container text-center bg-black">

  <div class="row text-center">
  <c:forEach items="${hsm_gb}" var = "productVO">
    <div class="col-sm-4" style="margin-top: 15px;">
    
    <a href ='product_read?product_no=${productVO.product_no}' >
      <div class="thumbnail"style="width:350px; height: 300px; text-align: center; background-color: #f6f6f6; border-radius:10px;">
        	<img src="resources/upload/${productVO.product_picture}" style="width: 300px; height: 300px;">
        	<%-- <p><strong>${productVO.product_title}</strong></p> --%>
      </div>
    </a> 
    </div>
    </c:forEach>
  </div>

</div>
</body>
</html>



