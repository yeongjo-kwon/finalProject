<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../mainInc/mainTop.jsp" %>
<!-- FullCalendar 필수 리소스 -->
<link href='${pageContext.request.contextPath}/resources/ynCalendar/lib/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/ynCalendar/lib/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/ynCalendar/lib/ko.js'></script>
<script src="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.5.1,npm/fullcalendar@5.5.1/locales-all.min.js,npm/fullcalendar@5.5.1/locales-all.min.js,npm/fullcalendar@5.5.1/main.min.js,npm/fullcalendar-scheduler@5.5.1,npm/fullcalendar-scheduler@5.5.1/main.min.js"></script>
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
//첨 로드되면 오늘날짜 기준으로 보여주기 위해 오늘날짜 구하는 함구 getToday()
function getToday(){
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;    //1월이 0으로 되기때문에 +1을 함.
    var date = now.getDate();

    month = month >=10 ? month : "0" + month;
    date  = date  >= 10 ? date : "0" + date;
     // ""을 빼면 year + month (숫자+숫자) 됨.. ex) 2018 + 12 = 2030이 리턴됨.

    //console.log(""+year + month + date);
    return today = year+"-"+ month+"-"+date; 
}
var today = getToday();
console.log(today);

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
  	locale: 'ko',
    headerToolbar: {
      left: 'prevYear,prev,next,nextYear today',
      center: 'title',
      right: 'dayGridMonth,dayGridWeek,dayGridDay'
    },
    initialDate: getToday(),//현재날짜 구하는 함수로 호출
    navLinks: true, // can click day/week names to navigate views
    editable: true,
    dayMaxEvents: true, // allow "more" link when too many events
    events: [
      {
        title: 'All Day Event',
        start: '2021-02-01'
      },
      {
        title: 'Long Event',
        start: '2021-02-07',
        end: '2021-02-10'
      },
      {
        groupId: 999,
        title: 'Repeating Event',
        start: '2020-02-09T16:00:00'
      },
      {
        groupId: 999,
        title: 'Repeating Event',
        start: '2020-02-16T16:00:00'
      },
      {
        title: 'Conference',
        start: '2020-02-11',
        end: '2020-02-13'
      }
    ]
  });

  calendar.render();

$(function(){
	console.log("써도됨?");
	
	
});

});//풀캘린더 render, 이 안에 스크립트 작성

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>


<section id="secTest">
    <div id="divCalendarTest">
    
    </div>

</section>
<section id="secFullCalendar">
    <div id="calendar"></div>
</section>

    <%@ include file="../../mainInc/mainBottom.jsp" %>