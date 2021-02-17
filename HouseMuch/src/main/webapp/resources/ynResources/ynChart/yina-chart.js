/**
 * yina-chart.js
 */
//Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';
 
 
 function houseElectChart(elementId,dataList,labels){

// Bar Chart Example
	var houseElectChart = new Chart(elementId, {
	  type: 'bar',
	  data: {
	    labels: labels,
	    datasets: [{
	      label: "사용량(kwh)",
	      backgroundColor: "rgba(255,64,30,0.6)",
	      borderColor: "rgba(255,64,30,0.8)",
	      hoverBackgroundColor: "rgba(255,226,50,1)",//호버하면 노랑
	      borderWidth:1,
	      data: data,
	    }],
	  },
	  options: {
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
		          max: 500,
		          maxTicksLimit: 10
		        },
		        gridLines: {
		          display: true
		        }
		      }],
		    },
		    legend: {
		     display: true,
          	position:'bottom',
	    }
	  }
	});
}



//---------------------------------------------------여기부터 수도 차트


function houseWaterChart(elementId,dataList,labels){

	var houseWaterChart = new Chart(elementId, {
	  type: 'line',
	  data: {
	    labels: labels,
	    datasets: [{
	      label: "사용량(L)",
	      lineTension: 0.3,
	      backgroundColor: "rgba(2,117,216,0.2)",
	      borderColor: "rgba(60,76,189,1)",
	      pointRadius: 5,
	      pointBackgroundColor: "rgba(60,76,189,1)",
	      pointBorderColor: "rgba(60,76,189,1)",
	      pointHoverRadius: 5,
	      pointHoverBackgroundColor: "rgba(255,226,50,1)",//호버하면 노랑
	      pointHitRadius:0,
	      pointBorderWidth:3,
	      data: dataList,
	    }],
	  },
	  options: {
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
	          max: 300,
	          maxTicksLimit: 6
	        },
	        gridLines: {
	          color: "rgba(0, 0, 0, .125)",
	        }
	      }],
	    },
	    legend: {
	    	display: true,
          	position:'bottom',
	    }
	    
	  }
	});
	

}//-------houseWaterChart()

//---------------------------------------------------여기부터 가스 차트
function houseGasChart(elementId,dataList,labels){

	var houseGasChart = new Chart(elementId, {
	  type: 'line',
	  data: {
	    labels: labels,
	    datasets: [{
	      label: "사용열량(MJ)",
	      lineTension: 0,
 		  fill: false,
	      borderColor: "rgba(89,14,208,1)",
	      pointRadius: 5,
	      pointBackgroundColor: "rgba(89,14,208,1)",
	      pointBorderColor: "rgba(89,14,208,1)",
	      pointHitRadius: 50,
	      pointHoverBackgroundColor: "rgba(255,226,50,1)",//호버하면 노랑
	      pointHoverRadius: 5,
	      pointBorderWidth: 3,
	      data: dataList,
	      
	    }],
	  },
	  options: {
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
	          min: 500,
	          max: 5000,
	          maxTicksLimit:8
	        },
	        gridLines: {
	          color: "rgba(0, 0, 0, .125)",
	        }
	      }],
	    },
	    legend: {
	    	display: true,
          	position:'bottom',
          	
	    }
	  }
	});
	

}



