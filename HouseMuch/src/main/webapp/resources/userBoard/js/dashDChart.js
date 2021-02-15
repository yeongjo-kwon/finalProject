/*
입주민 대시보드 도넛 차트
userDash Doughnut Chart
*/

//var ctx = document.getElementById("myChart").getContext('2d');
//var ctx = $("#myChart");
//var ctx = document.getElementById("myChart");

var ctx = document.getElementById("myDoughnutChart").getContext('2d');
var myDoughnutChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
    	labels: [
    		'일반'
        	,'경비비'
        	,'청소비'
        	,'소독비'
        	,'승강기유지비'
        	,'수선유지비'
        	,'설비유지비'
        	,'장기수선충당금'
        	,'개별'
        	,'전기료'
  		],
  		datasets:[{
  			data:[
  				10,20,30,40,50,60,70,80,90,10
  			],
  			backgroundColor:[
  				'rgba(255, 99, 132, 0.2)'
  				,'rgba(54, 162, 235, 1)'
               	,'rgba(255, 206, 86, 1)'
                ,'rgba(75, 192, 192, 1)'
                ,'rgba(153, 102, 255, 1)'
                ,'rgba(255, 159, 64, 1)'
                ,'rgba(255, 128, 128, 1)'
                ,'rgba(227, 227, 0, 1)'
                ,'rgba(200, 191, 231, 1)'
                ,'rgba(192, 192, 192, 1)'
  			]
  		}]
    },
    options: {
        responsive:true,
        legend:{
        	position:'bottom'
        }
    }
});