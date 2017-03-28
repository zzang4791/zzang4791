<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
response.setHeader("cache-control","no-cache"); 
response.setHeader("expires","0"); 
response.setHeader("pragma","no-cache"); 
%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>제일 금박기계</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://developers.google.com/maps/documentation/javascript/examples/default.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/main/css/main.css">

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBsO06hwvw6idkPQWu5rqU1Wimkpj9bKqM&sensor=false"></script>
<script>
	var mailsend = '${mailMsg}';
	var result = '${msg}';
	if (mailsend == 'mailSuccess') {
		alert("메일이 성공적으로 전송되었습니다.");
	} else if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
	function numkeyCheck(e) {
		var keyValue = event.keyCode;
		if (((keyValue >= 48) && (keyValue <= 57)))
			return true;
		else
			return false;
	}
</script>
<script>
	function initialize() {
		var Y_point = 37.523076; // Y좌표
		var X_point = 126.886604; // X좌표
		var zoomLevel = 16; // 지도 확대 레벨, 숫자가 클수록 확대정도가 큼
		var markerTitle = "제일 금박기계"; // 마커에 마우스 오버했을 때 나타나는 title
		var myLatlng = new google.maps.LatLng(Y_point, X_point);
		var mapOptions = {
			zoom : zoomLevel,
			center : myLatlng,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		}

		var map = new google.maps.Map(document.getElementById('map-view'), mapOptions);
		//div#view-map에 지도 정보를 표시
		var marker = new google.maps.Marker({
			position : myLatlng,
			map : map,
			title : markerTitle
		});
	}
</script>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60" onload="initialize()">
	<div style="height: 300px;">
		<div id="myCarousel" class="carousel slide text-center"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<div
						style="background-image: url('resources/one.jpg'); max-width: 100%; height: 300px;"></div>
				</div>
				<div class="item">
					<div
						style="background-image: url('resources/two.jpg'); max-width: 100%; height: 300px;"></div>
				</div>
				<div class="item">
					<div
						style="background-image: url('resources/two.jpg'); max-width: 100%; height: 300px;"></div>
				</div>
			</div>

			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<!-- <br><br>
  <h2 style="text-align: center;">제일 금박기계의 장점</h2>
  <div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
    Indicators
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    Wrapper for slides
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <h4>국내 최고의 디테일<br>가격 성능 대비 뛰어난 완성도</h4>
      </div>
      <div class="item">
        <h4>블라블라블라블라블라<br>블라블라블라블라블라블라블라블라블라</h4>
      </div>
      <div class="item">
        <h4>블라블라블라블라블라블라블라블라블라블라<br><span style="font-style:normal;">블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라</span></h4>
      </div>
    </div>

    Left and right controls
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div> -->

	<!-- Container (Pricing Section) -->
	<!-- <div id="pricing" class="container-fluid">
  <div class="text-center">
    <h2>Pricing</h2>
    <h4>Choose a payment plan that works for you</h4>
  </div>
  <div class="row slideanim">
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>Basic</h1>
        </div>
        <div class="panel-body">
          <p><strong>20</strong> Lorem</p>
          <p><strong>15</strong> Ipsum</p>
          <p><strong>5</strong> Dolor</p>
          <p><strong>2</strong> Sit</p>
          <p><strong>Endless</strong> Amet</p>
        </div>
        <div class="panel-footer">
          <h3>$19</h3>
          <h4>per month</h4>
          <button class="btn btn-lg">Sign Up</button>
        </div>
      </div>      
    </div>     
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>Pro</h1>
        </div>
        <div class="panel-body">
          <p><strong>50</strong> Lorem</p>
          <p><strong>25</strong> Ipsum</p>
          <p><strong>10</strong> Dolor</p>
          <p><strong>5</strong> Sit</p>
          <p><strong>Endless</strong> Amet</p>
        </div>
        <div class="panel-footer">
          <h3>$29</h3>
          <h4>per month</h4>
          <button class="btn btn-lg">Sign Up</button>
        </div>
      </div>      
    </div>       
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>Premium</h1>
        </div>
        <div class="panel-body">
          <p><strong>100</strong> Lorem</p>
          <p><strong>50</strong> Ipsum</p>
          <p><strong>25</strong> Dolor</p>
          <p><strong>10</strong> Sit</p>
          <p><strong>Endless</strong> Amet</p>
        </div>
        <div class="panel-footer">
          <h3>$49</h3>
          <h4>per month</h4>
          <button class="btn btn-lg">Sign Up</button>
        </div>
      </div>      
    </div>    
  </div>
</div> -->

	<!-- Container (Contact Section) -->
	<form method="POST" action="/ssss">
		<div id="contact" class="container-fluid2 bg-grey">
			<h2 class="text-center">제품 문의</h2>
			<div class="row">
				<div class="col-sm-5">
					<p>
						<b>국내 최고의 퀄리티를 자랑하는 금박기계에 대한 문의는</b>
					</p>
					<p>
						<b>아래 연락처로 문의주시면 친절한 답변을 제공해드리겠습니다.</b>
					</p>
					<br>
					<p>
						<span class="glyphicon glyphicon-map-marker"></span> 서울시 영등포구 양평동1가 247 영등포기계상가 2동 111호
					</p>
					<p>
						<span class="glyphicon glyphicon-phone"></span> 010-2052-2512
					</p>
					<p>
						<span class="glyphicon glyphicon-envelope"></span> whdans4791@gmail.com
					</p>
				</div>
				<div class="col-sm-7">
					<div class="row">
						<div class="col-sm-6 form-group">
							<input class="form-control" id="name" name="name" placeholder="성명" type="text" required>
						</div>
						<div class="col-sm-6 form-group">
							<input class="form-control" id="phone" name="phone" placeholder="연락처 (숫자만입력해주세요)" type="text"
								onKeyPress="return numkeyCheck(event)" required>
						</div>
						<div class="col-sm-6 form-group">
							<input class="form-control" id="email" name="email" placeholder="이메일" type="email" required>
						</div>
					</div>
					<textarea class="form-control" id="content" name="content" placeholder="문의사항" rows="5"></textarea>
					<br>
					<div class="row">
						<div class="col-sm-12 form-group">
							<button class="btn btn-default pull-right" type="submit">메일 보내기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="map-view" style="height: 400px; width: 100%;"></div>
	</form>
</body>
</html>
