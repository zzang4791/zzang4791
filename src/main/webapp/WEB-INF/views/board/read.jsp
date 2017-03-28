<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 읽기</title>
<script type="text/javascript" src="../resources/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel = "stylesheet" href="/resources/main/css/main.css">
<style type="text/css">  
	/* 모바일 화면에서만 적용되는 반응형 css */
	@media only screen
	and (min-device-width : 320px)
	and (max-device-width : 480px){ .abc1 { font-size:5pt; width: 10px;} .abc2{font-size:5pt;} .abc3{font-size:3pt;}} 
</style>
<script>
$(function(){
	CKEDITOR.instances.board_content.getData()
    CKEDITOR.replace( 'board_content', {//해당 이름으로 된 textarea에 에디터를 적용
        width:'100%',
        height:'400px',
    });
    
});
function goList(){
	location.href='/list';
}	    
function goModify(){
	location.href='/modify?board_no=${boardVO.board_no}';
}
function goDelete(){
	location.href='/delete?board_no=${boardVO.board_no}';
}



$(document).ready(function(){
    //listReply(); // **댓글 목록 불러오기
    listReply2(); // ** json 리턴방식
    
    // ** 댓글 쓰기 버튼 클릭 이벤트 (ajax로 처리)
    $("#btnReply").click(function(){
        var replytext=escape(encodeURIComponent($("#replytext").val()));	
        //var replytext1 = escape(encodeURIComponent(replytext)); 
        var replyer =  escape(encodeURIComponent("${login.user_id}"));
        //var replyer1 = escape(encodeURIComponent(replyer)); 
        var bno="${boardVO.board_no}";
        
        var param="replytext="+replytext+"&bno="+bno+"&replyer="+replyer;
        $.ajax({                
            type: "post",
            url: "reply_insert",
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            //data: encodeURI(param),
            data: param,
            success: function(){
                alert("댓글이 등록되었습니다.");
                listReply2();
            }
        });
    });
    
  /*   $("#btnReplyDelete").click(function(){
    	alert('zzz');
    	
    });
     */
    
});
function btnReplyDelete1(rnov){
		var users = "${login.user_id}";
		var replyers = $('#replyer').val()
		//alert("유저 : " + users);
		//alert("리플라이어 : " + replyers);
		if(users == replyers){
		if (confirm("정말 댓글을 삭제하시겠습니까??") == true){ 
			var rno = rnov;
			var param = "rno="+rno;
			$.ajax({
				type:"post",
				url :"reply_delete",
				data:param,
				success:function(){
					alert('삭제되었습니다.');
					listReply2();
				}
			});
		}else{
			alert('취소되었습니다.');
		}
		}else{
			alert('자신의 댓글만 삭제가능합니다.')
		}
}
function btnReplyDelete2(ooo){
	$('#replyer').val(ooo);
}
// Controller방식
// **댓글 목록1
function listReply(){
    $.ajax({
        type: "get",
        url: "${path}/board/reply_list?bno=${boardVO.board_no}",
        success: function(result){
        // responseText가 result에 저장됨.
            $("#listReply").html(result);
        }
    });
}
// RestController방식 (Json)
// **댓글 목록2 (json)
function listReply2(){
    $.ajax({
        type: "get",
        //contentType: "application/json", ==> 생략가능(RestController이기때문에 가능)
        url: "reply_listJson?bno=${boardVO.board_no}",
        /* contentType: "application/x-www-form-urlencoded; charset=EUC-KR", */
        success: function(result){
            //console.log('리스트리플라이2 결과값 : : : : - > ' + result);
            var output = "<hr><table>";
            for(var i in result){
            	//var ok = result[i].replyer;
                output += "<tr>";
                output += "<td>"+result[i].userName;
                /* output += "("+result[i].regdate+") &nbsp; <img src='resources/deleteOK.jpg' onClick='btnReplyDelete("+result[i].rno+")' width='20' height='15'><br>"; */ 
                output += "("+result[i].regdate+") &nbsp; <img src='resources/deleteOK.jpg' onclick='javascript:btnReplyDelete2(\"" + result[i].replyer + "\"); btnReplyDelete1("+result[i].rno+"); ' width='20' height='15'><br>";
                output += result[i].replytext+ "</td>"; 
                output += "<tr>";
            }
            
            output += "</table>";
            var abc = decodeURIComponent(output);
            $("#listReply").html(abc);
        }
    });
}
// **날짜 변환 함수 작성
	function changeDate(date){
    date = new Date(parseInt(date));
    year = date.getFullYear();
    month = date.getMonth();
    day = date.getDate();
    hour = date.getHours();
    minute = date.getMinutes();
    second = date.getSeconds();
    strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
    return strDate;
} 

	$(function() {
	     $("input").keydown(function (event) {
	         if (event.which === 13) {    //enter
	             console.log($(this).val());
	             $("#btnReply").trigger("click");
	         }
	     });
	});
</script>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"data-offset="60">
<br>

<div class="container">
	
	<input type = "hidden" id = "replyer">
    
    <div class="form-group">
    	<label for="inputdefault">제목</label>
        <input class="form-control" id="board_title" type="text" name = 'board_title' value="${boardVO.board_title}" placeholder="Disabled input here..." disabled>
    </div>
    <div class="form-group">
      <label for="inputdefault">카테고리</label>
      <c:if test="${boardVO.board_category=='hsm00'}">
        <input class="form-control" id="board_category" type="text" name = 'board_category' value="전체" placeholder="Disabled input here..." disabled>
      </c:if>
      <c:if test="${boardVO.board_category=='hsm11'}">
        <input class="form-control" id="board_category" type="text" name = 'board_category' value="금박기계" placeholder="Disabled input here..." disabled>
      </c:if>
      <c:if test="${boardVO.board_category=='hsm22'}">
        <input class="form-control" id="board_category" type="text" name = 'board_category' value="불박기계" placeholder="Disabled input here..." disabled>
      </c:if>
      <c:if test="${boardVO.board_category=='hsm33'}">
        <input class="form-control" id="board_category" type="text" name = 'board_category' value="기타" placeholder="Disabled input here..." disabled>
      </c:if>
    </div>
    <div class="form-group">
      <label for="inputdefault">이름</label>
        <input class="form-control" id="board_name" type="text" name = 'board_name' value="${boardVO.board_name}" placeholder="Disabled input here..." disabled>
    </div>
    <div class="form-group">
      <label for="inputdefault">내용</label>
      <div id = "board_content" name="board_content" style="overflow: auto; background-color:#efefef; border-radius:10px; height:500px;"> &nbsp;${boardVO.board_content}</div>
    </div>
    
       <!-- <textarea id="replytext" placeholder="댓글을 작성해주세요" rows="3" cols="140"></textarea> -->
       <input  id="replytext" type="text" placeholder="댓글을 작성해주세요" style="width: 80%;" class="abc1">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-default" id="btnReply" class="abc2">저장</button>
    
     <!-- **댓글 목록 출력할 위치 -->
     <div class="panel-body" id="listReply" class="abc3"></div>
    
</div>

    
<br><br>
<div style="text-align: center;">
<c:if test= "${boardVO.board_id == login.user_id}">
<button type="button" class="btn btn-warning" onclick="goModify();" >수정</button>
<button type="button" class="btn btn-danger" onclick="goDelete();" >삭제</button>
</c:if>
<button type="button" class="btn btn-info" onclick="goList();">목록</button>
</div>

</body>
</html>