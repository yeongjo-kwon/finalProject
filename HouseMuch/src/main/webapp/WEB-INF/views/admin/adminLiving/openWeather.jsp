<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Weather</title>
    <meta charset="utf-8">
    <script src="http://code.jquery.com/jquery-1.7.min.js" ></script>
</head>
<script>
	/*
		[getJSON 문법 : 실시간으로 원하는 데이터만 뽑아오기]
		$.getJSON('파일경로',function(data){
			//data로 할 일 
		});
	
	1. 예보 API호출 예시 (json)
http://api.openweathermap.org/data/2.5/forecast?id=1835848&appid=18e287dc7b7469395ed7eb9fe17c8cb8
	
	2. 현재 날씨 보는 API (https://openweathermap.org/current에서 Example)
http://api.openweathermap.org/data/2.5/forecast?id=1835848&appid=18e287dc7b7469395ed7eb9fe17c8cb8
		
	3. 근데 이거는 kelvion온도가 default값이라서 파라미터를 섭씨온도로 바꿔주도록 [ &units=metric ]추가해줌
http://api.openweathermap.org/data/2.5/weather?id=1835848&appid=18e287dc7b7469395ed7eb9fe17c8cb8&units=metric
	
	
	*/
	$.getJSON(
'http://api.openweathermap.org/data/2.5/weather?id=1835848&appid=18e287dc7b7469395ed7eb9fe17c8cb8&units=metric'
		,function(data){
			//data로 할 일 
			//alert(data.city.name); // 해당 주소에서 data를 가져와서 그중에 city안의 name 띄우기
			//alert(data.list[0].main.temp_min); // 해당 주소에서 data를 가져와서 그중에 city안의 name 띄우기
/*
			1. 예보데이터 list안에 엄청 많이 들어있음
			var $minTemp = data.list[0].main.temp_min;
			var $maxTemp = data.list[0].main.temp_max;
			var $cTemp = data.list[0].main.temp;
			var $cDate = data.list[0].dt_txt;
			var $weatherIcon = data.list[0].weather[0].icon;
 */

 			//2. 현재 데이터 list없이 바로 main
			var $minTemp = data.main.temp_min;
			var $maxTemp = data.main.temp_max;
			var $cTemp = data.main.temp;
			var $cDate = data.dt;	//1611249309 --->이걸 시간으로 바꾸는작업 추가로 필요 (dt_txt가 없음) 유닉스운영체제에서 쓰는 시간이래
			var $weatherIcon = data.weather[0].icon;
			
			//alert(Date.now()); //현재시간 출력해봄 -> 1611249309나옴
			//alert($.now()); //현재시간 출력해봄 -> 1611249309나옴
	//		alert(new Date($.now())); //현재시간 출력해봄 -> Fri Jan 22 2021 02:38:43 GMT+0900 (대한민국 표준시) 나옴
			
			//현재 시간만 간단히 출력하기
			var $now = new Date($.now());
			//alert('현재 시간 '+$now.getHours()+':'+$now.getMinutes());
			
			var curYY = $now.getFullYear();
			var curMonth = $now.getMonth()+1;	//월은 0이 1월이니까  +1 해야 정확한 Month
			var curDD = $now.getDate();
			
			var curHH = $now.getHours();
			var curMM = $now.getMinutes();
			
			
			// A.appendTo(B)  B 뒤에 A를 추가 : B A
			// A.append(B)    A 뒤에 B를 추가 : A B
			// X.prependTo(Y) Y 앞에 X를 추가 : X Y 
			// X.prepend(Y)   X 앞에 Y를 추가 : Y X
			$('.clowtemp').append($minTemp);
			$('.ctemp').append($cTemp);
			$('.chightemp').append($maxTemp);

			var $cDate = curYY+'/'+curMonth+'/'+curDD+' '+curHH+':'+curMM+"<br>";
			$('#weather').prepend($cDate);
			
			$('.cicon').append('<img src="http://openweathermap.org/img/wn/'+$weatherIcon+'.png">');
			/*
			<img alt="" src="http://openweathermap.org/img/wn/여기다아이콘변수.png">
			*/
	});
</script>
	<h5 id="weather">  현재 날씨</h5>
	<div style="float: left;">
	<div class="ctemp">현재 온도: </div>
	<div class="clowtemp">최저 온도: </div>
	<div class="chightemp">최고 온도: </div>
	</div>
	<div class="cicon" style="float: left;" ></div>
<!-- HTML -->
</body>
</html>