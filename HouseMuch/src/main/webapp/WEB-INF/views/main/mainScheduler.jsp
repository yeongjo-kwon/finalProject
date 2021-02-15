<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!-- FullCalendar 필수 리소스 -->
<link href='${pageContext.request.contextPath}/resources/ynCalendar/lib/main.css' rel='stylesheet' />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.1/main.min.js"></script>
<script src="https://unpkg.com/popper.js/dist/umd/popper.min.js"></script>
<script src="https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js"></script>
<!-- FullCalendar 필수 리소스 끝-->

<!-- moment.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous"></script>
<!-- moment.js/locale.ko -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js" integrity="sha512-3kMAxw/DoCOkS6yQGfQsRY1FWknTEzdiz8DOwWoqf+eGRN45AmjS2Lggql50nCe9Q6m5su5dDZylflBY2YjABQ==" crossorigin="anonymous"></script>

<!-- 이나js -->
<script>
var events=[];		// DB에서 받아온 이벤트 넣을 배열 
var householdCode = '${sessionScope.memVo.householdCode}';	// 달력ajax에 들어갈 data1
var searchMonth = getsearchMonth();	// 달력ajax에 들어갈 data2
var initViewDate = moment.utc().format();	//달력에 보여줄 화면 날짜

$(function(){
var subEvent = $('#subEvent');
subEvent.hide();
	searchMonth = getsearchMonth();
	initViewDate = moment.utc().format();//맨첨로드되면 현재날짜기준으로 달력만들기
	
	console.log("초기로드searchMonth="+searchMonth);
	console.log("초기로드initViewDate="+initViewDate);
	
	createCalendar(initViewDate);
	ajaxEvents(householdCode,searchMonth);
	
	 $('fc-daygrid-event fc-daygrid-block-event fc-h-event fc-event fc-event-start fc-event-end fc-event-today').on('mouseover',function(){
/* 	 $('.fc-h-event .fc-event-title-container').on('click',function(){ */
		$('#subEvent').show();
		console.log('이벤트버튼 클릭');
		 
	 }); 
	 
	 console.log(calendar.eventClick+"####");
	 
	
	//today버튼 클릭하면 오늘날짜기준 달력 보여주기
	$(".fc-today-button").on('click', function(e) {
		console.log("today클릭했음 현재시점 세팅전 searchMonth =======> "+searchMonth);
		searchMonth = getsearchMonth();		// 현재날짜 기준으로 set
		initViewDate = moment.utc().format();//현재날짜 기준으로 set
		
		console.log("오늘시점 기준셋팅 - searchMonth="+searchMonth);
		console.log("오늘시점 기준셋팅 - initViewDate="+initViewDate);
		events=[];//일단초기화해주고
		ajaxEvents(householdCode,searchMonth,initViewDate);
		console.log("오늘시점 - ajaxEvents호출완료");

	});
	  
 
	 
	//next버튼 클릭하면 
	$("button[aria-label='next']").on('click', function(e) {
		  var y = searchMonth.substr(0, 4);
		  var m = searchMonth.substr(5, 2);
		  
			if(m*1>=12){
				m='01';
				y=y*1+1;
			}else{
				if(m*1<9) m='0'+(m*1+1);
				else m=m*1+1;
			}
		searchMonth=y+"-"+m;
		console.log(searchMonth);
		initViewDate=searchMonth+"-01";
		console.log("next클릭했음 =======> "+searchMonth);
		console.log("다음달set - searchMonth="+searchMonth);
		console.log("다음달뷰set - initViewDate="+initViewDate);
		events=[];//일단초기화해주고
		  ajaxEvents(householdCode,searchMonth,initViewDate);
		  console.log("다음달 - ajaxEvents호출완료");
	  });
	
	//이전달 클릭하면 searchMonth-1
	$("button[aria-label='prev']").on('click', function(e) {
	      var y = searchMonth.substr(0, 4);
		  var m = searchMonth.substr(5, 2);
			if(m*1<=1){
				m='12';
				y=y*1-1;
			}else{
				if( m*1<=10 ) m='0'+(m*1-1);
				else m=m*1-1;
			}
			searchMonth=y+"-"+m;
  	  	 console.log("prev클릭했음 =======> "+searchMonth);
			initViewDate=searchMonth+"-01";
			console.log("이전달 - searchMonth="+searchMonth);
			console.log("이전달 - initViewDate="+initViewDate);
			events=[];//일단초기화, 안하면 데이터 누적됨
			ajaxEvents(householdCode,searchMonth,initViewDate);
			console.log("이전달 - ajaxEvents호출완료");
	  });
//이벤트 클릭되는 바 : .fc-h-event .fc-event-title-container
	 //$( '.fc-daygrid-day-frame:has(".fc-h-event")' ).css( 'background-color', 'red' );
		var hasEvent = $('.fc-event-title fc-sticky').text();
		
});//풀캘린더 render, 이 안에 스크립트 작성



//실제로 #calendar에 달력 렌더링하는 함수(new Calendar만듦,ajaxEvents()에서 호출)
function createCalendar(initViewDate){
	var calendarEl = document.getElementById('calendar');

	 var calendar = new FullCalendar.Calendar(calendarEl, {
		eventBackgroundColor:"rgba(255,151,81,0.5)",
		eventTextColor: '#333333',
		fixedWeekCount:false,	//true면 6주가 디폴트
		locale: 'ko',			//한국날짜
		headerToolbar: {
	      left: 'prev,next',
	      center: 'title',
	      right: 'today'
	    },
	    navLinks: false, 						//true하면 "XX일" 클릭했을 때 해당 일 상세화면으로 넘어감 -> 막아둠
	    editable: false,
	    dayMaxEvents: true, 					// 일정이 여러개면  "+more" 링크 추가됨
	    initialView: 'dayGridMonth',			//월별보기로
		selectable: true,		//클릭가능하게
	    initialDate: initViewDate,		       // UTC타임 기준으로 현재날짜 구하는 moment.js 호출
	   
	    eventClick: function(info) {
	    	$('#subEvent').show;
	    	console.log(info);
	        var eventObj = info.event;
	        scdDetail(eventObj);				// [func] 받아온 일정vo한개 날짜가공까지해서 각각데이터 html에 넣어주는 함수

	        console.log(info);
	        
	    },
	    events: events,		//여기 events는 $ajax가 넣어줌
	    textColor: '#333333',
		eventColor: 'rgba(255,151,81,0.5)',
		backgroundColor:'#f6f6f6',
	 	eventMouseEnter: function (info) {
	        info.event.setProp('backgroundColor', 'rgba(231,175,251,0.8)');
		}, 
	    eventMouseLeave: function (info) {
	        info.event.setProp('backgroundColor', 'rgba(255,151,81,0.5)');
	    }
	    ,windowResize:  function (view) {
	    	if ($(window).width() <  514) {
	    		$('#calendar').fullCalendar('changeView', 'listWeek');
	    	} else {
	    		$('#calendar').fullCalendar('changeView', 'dayGridMonth');
	    	}
	    }
	  });

	  calendar.render();//캘린더 렌더링
	 //--------------------------------------------------------이 위는 건들지말것
}//createCalendar

function customEventColor(){
	var notice ="공지";
	var info ="안내";
	var duration ="기간";  
	
	if(title.indexof(notice) !== -1){
	    textColor: '#FFFFFF'
	    eventColor: 'rgba(255,151,81,0.5)';
    }else{
	    textColor : '#000000'
	    eventColor: 'rgba(255,151,81,0.5)';
    } 
	    
	
}


//ajax로 일정목록 jason가져오는 함수
function ajaxEvents(householdCode,searchMonth,initViewDate){

	$.ajax({
		url:"<c:url value='/living/noti/aptSchedulerList.do'/>",
		data:{
			householdCode:householdCode,
			searchMonth:searchMonth
		},
		dataType:"json",
		type:"post",
		success:function(res){
			for(var i=0;i<res.length;i++){
				events.push({
			        groupId: res[i].noticeNo,
					id : res[i].scdNo,
					title: res[i].scdContent,
			        start: res[i].startDate,
			        end: res[i].endDate,
			        //----------------여기부터는 display
			       // textColor: '#666666',   
			        //display:'background'
				});
			}
			console.log(events);
			createCalendar(initViewDate);//캘린더 호출 얘가 캘린더 불러줌 매우중요
		},
		error:function(xhr,status,error){
			alert("ajaxEvents에러:"+error);
		}
	});
}

//일정vo한개 html에 넣어주는 함수
function scdDetail(eventObj){
	
	$('#scdNo').val(eventObj.id);
	$('#scdContent').html(eventObj.title); //description은 굳이 안씀
	
	//날짜는 포맷을 바꿔서 보내줌
	$('#startDate').html(formatScd(eventObj.start));
	$('#endDate').html(formatScd(eventObj.end,'endDate'));
	
	//noticeNo는 groupId로 넣어줌 (공지글로 이동할 param)
	$('#noticeNo').attr('href','${pageContext.request.contextPath}/living/noti/noticeDetail.do?noticeNo='+eventObj.groupId);
	$('#subEvent').show();
	$('#subspan').html('&nbsp;&nbsp;~&nbsp;');
	
}


//FullCalendar가 기본적으로 timezone을 쓰기 때문에 str날짜로 바꿔서 html로 보내줌 
function formatScd(timezoneDate,endDate){
    var year = timezoneDate.getFullYear();
    var month = timezoneDate.getMonth() + 1;    //1월이 0으로 되기때문에 +1을 함.
    
    var date ;
    if(endDate){
     date = timezoneDate.getDate()-1;//캘린더에 날짜 하루전날까지만 나와서 xml에서 +1해서 -1
    }else{
     date = timezoneDate.getDate();//시작날짜는 그냥 그대로
    } 

    month = month >=10 ? month : "0" + month;
    date  = date  >= 10 ? date : "0" + date;
    
    formatedDate = year+"-"+ month+"-"+date;
    return formatedDate; 
}

//검색할 달 (ajax로 보낼 인자 searchMonth)만드는 함수
function getsearchMonth(){
	var now = new Date();
	var year = now.getFullYear();
	 var month = now.getMonth() + 1;    //1월이 0으로 되기때문에 +1을 함.
	 var searchMonth;
	 month = month >=10 ? month : "0" + month;
	
	 searchMonth = year+"-"+month;
	 return searchMonth;
}
</script>
<!-- 이나js 끝  -->
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Roboto, 'Noto Sans', Arial, Helvetica Neue, Helvetica,
		sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 100%;
	margin: 0 auto;
}

html, body {
	margin: 0;
	padding: 0;
	font-family: Roboto, 'Noto Sans', "Lucida Grande", Helvetica, Arial,
		Verdana, sans-serif;
	font-size: 14px;
}
/* #subEvent:hover {
	font-size: 1.5em;
	font-weight: bold;
	color:red;
} */

.apt-bg-primary {
	background-color: #5c9f24;
}

.apt-bg-secondary {
	background-color: #f6f6f6;
}

.apt-bg-light {
	background-color: #F2FBDD;
}

.apt-bg-dark {
	background-color: #22550E;
}

.apt-text-primary {
	color: #5c9f24;
}

.apt-text-secandary {
	color: #666666;
}

.apt-text-third {
	color: #F2FBDD;
}

.apt-text-dark {
	color: #22550E;
}

.btn {
	background-color: #5c9f24;
	border-color: #5c9f24;
}

.btn:hover {
	background-color: #326717;
	border-color: #326717;
}

.btn-light:hover {
	background-color: #F2FBDD;
	border-color: #E2F7BC;
	color: #22550E;
}

.btn-light {
	background-color: #ffffff;
	border-color: #5c9f24;
}

.a:hover {
	background-color: #5c9f24;
	border-color: #5c9f24;
	color: #ffffff;
	font-size: 1.5em;
	font-weight: bold;
	color:red;
}
</style>


 <!-- Page Content -->
<div class="container p-0">

	<!-- 달력section -->
<section id="secFullCalendar" class="p-0">
<div class="clearfix" style=background-color:#ffffff;"></div>
	<div id="aptScdwrapper">
	<hr>
	<div class="container p-0" >
	   <div class="row"><!-- class="card d-inline col-md-4 p-0 ml-5"  -->
	    </div>
	    <div id="calendar" class="col-12 p-0 m-0" style="min-width:100%;"></div><!-- class="col-12 p-0 m-0" -->
	    
	</div><!--컨테이너  -->	    
	</div>	    
</section><!-- 달력section -->
</div><!--  컨테이너 -->
