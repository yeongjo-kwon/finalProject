/*
입주민 대시보드 바 차트
userDash Bar Chart
*/

//var ctx = document.getElementById("myChart").getContext('2d');
//var ctx = $("#myChart");
//var ctx = document.getElementById("myChart");

var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['1월', '2월', '3월', '4월', '5월', '6월','7월','8월','9월','10월','11월','12월'],
        datasets: [{
            label: '# of Votes', //데이터의 라벨을 입력함
            data: [12, 19, 3, 5, 2, 3], //실제값
            backgroundColor:'rgba(255, 99, 132, 0.2)',
            fill:true, //line의 안쪽 색을 넣을건지
            borderColor: [
                'rgba(255, 99, 132, 1)'
            ],
            borderWidth: 1 //border의 굵기
        }]
    },
    options: {
        scales: {
            yAxes: [{ //y축과 관련한 옵션
                ticks: {
                    beginAtZero: true //0부터 표기할지
                }
            }]
        }
    }
});