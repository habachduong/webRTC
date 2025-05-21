initChart1();
function initChart1(){
    var dom = document.getElementById('line-chart-1');
    var myChart = echarts.init(dom, null, {
    renderer: 'canvas',
    useDirtyRect: false
    });
    var app = {};

    var option;

    option = {
        xAxis: {
          type: 'category',
          axisTick: {
            show: false
          },
          axisLabel: { interval: 0, rotate: 30 },
          data: ['4/1/2022', '4/2/2022', '4/3/2022', '4/4/2022', '4/5/2022', '4/6/2022', '4/7/2022', '4/8/2022', '4/9/2022', '4/10/2022', '4/11/2022', '4/12/2022']
        },
        yAxis: {             
          type: 'value',
          name: 'Điểm',
        },
        grid: {
            'left': 40
        },
        series: [
          {
            data: [100, 400, 224, 610, 200, 205, 805, 400, 700, 195, 780, 590],
            type: 'line',
            showSymbol: false,
            color: '#165DFF'
          }
        ]
    };

    if (option && typeof option === 'object') {
    myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
}