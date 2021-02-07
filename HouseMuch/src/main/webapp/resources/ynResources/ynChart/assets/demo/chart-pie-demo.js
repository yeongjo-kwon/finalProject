// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: [" 400Kwh 이상                ", " 300Kwh 이상                ", " 200Kwh 이상                ", " 100Kwh 이상                "],
    datasets: [{
      data: [33, 47, 14, 16],
      backgroundColor: ['#FF401E','#ffce33', '#28a745','#48cbfd'],
    }],
  },
});
