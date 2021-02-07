<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../mainInc/mainTop.jsp" %>
<!-- FullCalendar 필수 리소스 -->
<link href='${pageContext.request.contextPath}/resources/ynCalendar/lib/main.css' rel='stylesheet' />
<%-- <script src='${pageContext.request.contextPath}/resources/ynCalendar/lib/main.js'></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.5.1,npm/fullcalendar@5.5.1/locales-all.min.js,npm/fullcalendar@5.5.1/locales-all.min.js,npm/fullcalendar@5.5.1/main.min.js,npm/fullcalendar-scheduler@5.5.1,npm/fullcalendar-scheduler@5.5.1/main.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.1/main.min.js"></script>
<script src="https://unpkg.com/popper.js/dist/umd/popper.min.js"></script>
<script src="https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js"></script>
<%-- <script src='${pageContext.request.contextPath}/resources/ynCalendar/lib/ko.js'></script> --%>
<!-- FullCalendar 필수 리소스 끝-->

<%-- <link href='${pageContext.request.contextPath}/resources/ynCalendar/fullcalendar/core/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/ynCalendar/fullcalendar/daygrid/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/ynCalendar/fullcalendar/timegrid/main.min.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/ynCalendar/fullcalendar/core/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/ynCalendar/fullcalendar/daygrid/main.js'></script>
<script src="${pageContext.request.contextPath}/resources/ynCalendar/fullcalendar/interaction/main.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ynCalendar/fullcalendar/timegrid/main.min.js"></script>
<script src='${pageContext.request.contextPath}/resources/ynCalendar/fullcalendar/core/locales/ko.js'></script> --%>


<script>
var events=[];// DB에서 받아온 이벤트 넣을 배열 
$(function(){
	//세션값 받아오기 + 현재 월 (검색할 달)
	var householdCode = '${sessionScope.memVo.householdCode}';
	var searchMonth = getsearchMonth();
	
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
			        end: res[i].endDate
				});
			}
			console.log(events);
			createCalendar();//캘린더 호출 얘가 캘린더 불러줌 매우중요
		},
		error:function(xhr,status,error){
			alert("error="+error);
		}
	});
	
	
});//풀캘린더 render, 이 안에 스크립트 작성

function createCalendar(){
	var calendarEl = document.getElementById('calendar');

	  var calendar = new FullCalendar.Calendar(calendarEl, {
		selectable: true,//클릭가능하게
		locale: 'ko',//한국날짜
	    headerToolbar: {
	      left: 'prev,next today',
	      center: 'title',
	      right: 'dayGridMonth,dayGridWeek'
	    },
	    navLinks: false, 	//true하면 "XX일" 클릭했을 때 해당 일 상세화면으로 넘어감 -> 막아둠
	    editable: false,
	    dayMaxEvents: true, // 일정이 여러개면  "+more" 링크 추가됨
	    initialView: 'dayGridMonth',//월별보기로
	    initialDate: getToday(),//현재날짜 구하는 함수로 호출
	    eventClick: function(info) {
	    	console.log(info);
	        var eventObj = info.event;

	        scdDetail(eventObj);//받아온 일정vo한개
	    },
	    events: events
	  });

	  calendar.render();
}
function scdDetail(eventObj){
	$('#scdNo').val(eventObj.id);
	$('#scdContent').html(eventObj.title); //description은 굳이 안씀
	
	//날짜는 포맷을 바꿔서 보내줌
	$('#startDate').html(formatScd(eventObj.start));
	$('#endDate').html(formatScd(eventObj.end,'endDate'));
	
	//noticeNo는 groupId로 넣어줌 (공지글로 이동할 param)
	$('#noticeNo').attr('href','${pageContext.request.contextPath}/living/noti/noticeDetail.do?noticeNo='+eventObj.groupId);
	
}

//일정을 html에 넣어주는 함수
function formatScd(timezoneDate,endDate){
	//FullCalendar가 기본적으로 timezone을 쓰기 때문에 str날짜로 바꿔서 보내줌 
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

//첨 로드되면 오늘날짜 기준으로 보여주기 위해 오늘날짜 구하는 함수 getToday()
function getToday(){
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;    //1월이 0으로 되기때문에 +1을 함.
    var date = now.getDate();
    var today;
    month = month >=10 ? month : "0" + month;
    date  = date  >= 10 ? date : "0" + date;
     // ""을 빼면 year + month (숫자+숫자) 됨.. ex) 2018 + 12 = 2030이 리턴됨.

    today = year+"-"+ month+"-"+date;
    return today; 
}

//검색할 달 (ajax로 보낼 data)만드는 함수
function getsearchMonth(){
	//getToday()는 year+"-"+ month+"-"+date 를 리턴 -> '2021-02-07'
	 var now = new Date();
	 var year = now.getFullYear();
	 var month = now.getMonth() + 1;    //1월이 0으로 되기때문에 +1을 함.
	 
	 var todayMonth;
	 month = month >=10 ? month : "0" + month;
	
	 todayMonth = year+"-"+month;
	 return todayMonth;
}
</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
  	
    max-width:60%;
    margin: 0 auto;
  }
  html, body {
  margin: 0;
  padding: 0;
  font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
  font-size: 14px;
}

#calendar a.fc-event {
  color: #fff; /* bootstrap default styles make it black. undo */
}


</style>

<section id="secFullCalendar">
<div class="clearfix" style="height:100px;background-color:#ffffff;position:sticky;"></div>
	<div id="scdSide" class="row m-0 auto col-12 d-flex align-center" >
	    <div id="external-events" class="card d-inline col-md-4 p-0 ml-5" style="display: none;">
		    <div class="d-inline col-md-3 p-0 ml-5">
		      <h1 class="mb-5">일정내용</h1>
				<a id="noticeNo" >
					<br>
					<!-- 날짜  -->
					<span class="fc-event mt-10" name="startDate" id="startDate">StartDate</span>
					&nbsp;~&nbsp;
					<span class="fc-event mt-10" name="endDate" id="endDate">endDate</span>
					<br>
					<!-- 일정번호, 일정내용  no는 hidden으로 링크에 넘길 것-->
					<input type="text" class="fc-event" value="여기는noticeNo" name="noticeNo">
					<input type="text" id="scdNo" class="fc-event" value="여기는scdNo" name="scdNo">
					<div class="fc-event mt-10" name="scdContent" id="scdContent"></div>
				</a>
		    </div>
	    </div>
	    <div id="calendar" class="d-inline col-md-8 p-0 m-0"></div>
	</div>	    
</section>

    <%@ include file="../../mainInc/mainBottom.jsp" %>