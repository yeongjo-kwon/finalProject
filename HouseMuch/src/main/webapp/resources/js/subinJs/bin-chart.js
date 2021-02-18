/**
 * bin-chart.js
 */
//Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';
 
function carChart(context,dataList,labels){

	var carCharts = new Chart(context, {
	  type: 'line',
	  data: {
	    labels: labels,
	    datasets: [{
	      label: "차량 수",
	      lineTension: 0.3,
	      backgroundColor: "rgba(231,247,240,0.2)",
	      borderColor: "rgba(115,228,177,1)",
	      pointRadius: 5,
	      pointBackgroundColor: "rgba(43,207,133,1)",
	      pointBorderColor: "rgba(43,207,133,1)",
	      pointHoverRadius: 5,
	      pointHoverBackgroundColor: "rgba(46,217,197,1)",
	      pointHitRadius:0,
	      pointBorderWidth:3,
	      data: dataList,
	    }],
	  },
	  options: {
	  	responsive: true,
        maintainAspectRatio: false,
        responsiveAnimationDuration: 500,
	    scales: {
	      xAxes: [{
	        time: {
	          unit: 'month'
	        },
	        gridLines: {
	          display: false
	        },
	        ticks: {
	          maxTicksLimit: 12
	        }
	      }],
	      yAxes: [{
	        ticks: {
	          min: 0,
	          max: 100,
	          maxTicksLimit: 6
	        },
	        gridLines: {
	          color: "rgba(0, 0, 0, .125)",
	        }
	      }],
	    },
	    legend: {
	    	display: false,
          	position:'bottom',
	    }
	    
	  }
	});
}



