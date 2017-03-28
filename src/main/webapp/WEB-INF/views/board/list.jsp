<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <link rel = "stylesheet" href="/resources/main/css/main/main.css">
<title>게시판 리스트</title>
<style type="text/css">  
	/* 모바일 화면에서만 적용되는 반응형 css */
	@media only screen
	and (min-device-width : 320px)
	and (max-device-width : 480px){ .table { font-size:5pt;} } 
</style>
<script>
function goWrite(){
	location.href='write';
}
var result = '${deleteOK}';

if (result == 'deleteSuccess') {
	alert("삭제가 완료되었습니다.");
}


//페이지 이동
function fn_movePage(val){
    jQuery("input[name=pageNo]").val(val);
    jQuery("form[name=frm]").attr("method", "post");
    jQuery("form[name=frm]").attr("action","").submit();
}
//검색 버튼
function fn_search(){
   /*  if( $("#searchS").val() == "" ){
        return;
    }else{ */
        $("input[name=searchFiled]").val($("#searchS").val());
  /*   } */
    var searchValue = $("#searchI").val();
    $("input[name=searchValue]").val(searchValue);

    $("input[name=pageNo]").val("1");
    $("form[name=frm]").attr("method", "post");
    $("form[name=frm]").attr("action","").submit();
}
function captureReturnKey(e) { 
    if(e.keyCode==13 && e.srcElement.type != 'textarea') 
    return false; 
} 
</script>


</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"data-offset="60">
	<br>
	<form name="frm" onkeydown="return captureReturnKey(event)" >
	<input type="hidden" name="pageNo" /><!-- //페이지 번호 -->
    <input type="hidden" name="searchFiled" value="${pageVO.searchFiled }" /><!-- //검색조건 -->
    <input type="hidden" name="searchValue" value="${pageVO.searchValue }" /><!-- //검색어 -->
    
	<div class="container">
	<div class="alert alert-info">
		<strong>기계 관련 Q&A</strong>
		<div style="text-align: right;">
		<button type="button" class="btn btn-success" onclick="goWrite();">글쓰기</button>
		</div>
	</div>
  <table class="table">
    <thead>
      <tr>
        <th style="width: 15%; text-align: center;">분류</th>
        <th style="width: 45%; text-align: left;">제목</th>
        <th style="width: 15%; text-align: center;">이름</th>
        <th style="width: 25%; text-align: center;">날짜</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${resultList}" var = "resultList">
      <c:if test="${resultList.board_category=='hsm00'}"><tr class="active"></c:if>
      <c:if test="${resultList.board_category=='hsm11'}"><tr class="success"></c:if>
      <c:if test="${resultList.board_category=='hsm22'}"><tr class="info"></c:if>
      <c:if test="${resultList.board_category=='hsm33'}"><tr class="warning"></c:if>
        <td style="text-align: center;">
        <c:if test="${resultList.board_category=='hsm00'}">전체</c:if>
        <c:if test="${resultList.board_category=='hsm11'}">금박</c:if>
        <c:if test="${resultList.board_category=='hsm22'}">불박</c:if>
        <c:if test="${resultList.board_category=='hsm33'}">기타</c:if>
        </td>
        <td style="text-align: left;"><a href="read?board_no=${resultList.board_no}">${resultList.board_title}</a></td>
        <td style="text-align: center;">${resultList.board_name}</td>
        <td style="text-align: center;"><fmt:formatDate value="${resultList.board_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
      </c:forEach>	
    </tbody>
  </table>
    <div id="page" class="pageClass" style="text-align: center;">
    <c:if test="${pageVO.pageNo != 0}">
        <c:if test="${pageVO.pageNo > pageVO.pageBlock}">
            <a href="javascript:fn_movePage(${pageVO.firstPageNo})" style="text-decoration: none;">[첫 페이지]</a>
       </c:if>
       <c:if test="${pageVO.pageNo != 1}">
           <a href="javascript:fn_movePage(${pageVO.prevPageNo})" style="text-decoration: none;">[이전]</a>
        </c:if>
        <span>
            <c:forEach var="i" begin="${pageVO.startPageNo}" end="${pageVO.endPageNo}" step="1">
                <c:choose>
                    <c:when test="${i eq pageVO.pageNo}">
                        <a href="javascript:fn_movePage(${i})" style="text-decoration: none;">
                            <font style="font-weight: bold; font-size:30px;">${i}</font>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="javascript:fn_movePage(${i})" style="text-decoration: none; font-size:20px;">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </span>
        <c:if test="${pageVO.pageNo != pageVO.finalPageNo }">
            <a href="javascript:fn_movePage(${pageVO.nextPageNo})" style="text-decoration: none;">[다음]</a>
        </c:if>
        <c:if test="${pageVO.endPageNo < pageVO.finalPageNo }">
            <a href="javascript:fn_movePage(${pageVO.finalPageNo})" style="text-decoration: none;">[마지막 페이지]</a>
        </c:if>
    </c:if>
    </div>
    <div id="search" class="searchClass">
        <select id="searchS" style="height:32px; width:70px;"class="searchClass2">
            <!-- <option value="">전체</option> -->
            <option value="board_title">제목</option>
            <option value="board_name">이름</option>
        </select>
        <input type="text" id="searchI"/>
        <input type="button" class="btn btn-default" value="SEARCH" onclick="fn_search();" style="margin-bottom: 3px;"/>
    </div>
</div>
</form>
</body>
</html>