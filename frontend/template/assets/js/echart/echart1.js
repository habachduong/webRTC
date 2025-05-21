initChart1();
function initChart1(){
    var dom = document.getElementById('echart-1');
    var myChart = echarts.init(dom, null, {
    renderer: 'canvas',
    useDirtyRect: false
    });
    var app = {};

    var option;

    option = {
        xAxis: {
            type: 'category',
            axisTick: { show: false },
            axisLine: { show: false },
            data: ['Click2Call', 'AutoDialer'],
            axisLabel: {
                color: '#86909C',
            }
        },
        textStyle: {
            fontFamily: 'Roboto'
        },
        yAxis: {
            type: 'value',
            splitLine: { show: false },
            axisLabel: { show: false }
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow'
          }
        },
        grid: {
            height: '80%',
            top: 20
        },
        series: [
          {
            data: [
              {
                value: 35,
                itemStyle: {
                  color: '#FD2424',
                  borderRadius: [12, 12, 12, 12]
                },
                label: {
                  show: true,
                  position: 'top',
                  formatter: (params) => {
                    return parseFloat((params.value / 100).toFixed(1)) * 100 + '%'
                  }
                }
              },
              {
                value: 65,
                itemStyle: {
                  color: '#750000',
                  borderRadius: [12, 12, 12, 12]
                },
                label: {
                  show: true,
                  position: 'top',
                  formatter: (params) => {
                    return parseFloat((params.value / 100).toFixed(1)) * 100 + '%'
                  }
                }
              }
            ],
            type: 'bar'
          }
        ]
    };

    if (option && typeof option === 'object') {
        myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
}

initChart2();
function initChart2(){
    var dom = document.getElementById('echart-2');
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
          axisLine: {
            lineStyle: {
              color: '#86909C'
            }
          },
          axisLabel: {
            rotate: 30
          },
          data: ['1/1', '2/1', '3/1', '4/1', '5/1', '6/1', '7/1', '8/1', '9/1', '10/1']
        },
        yAxis: {
          type: 'value',
          splitLine: {
            lineStyle: {
              type: 'dashed',
              color: '#E5E6EB'
            }
          },
          axisLabel: {
            formatter: (params) => {
                if(params >= 1000){
                  return parseFloat((params / 1000).toFixed(1)) + 'k'
                } else {
                  return params
                }
            },
            color: '#86909C'
          }
        },
        tooltip: {
          trigger: 'axis'
        },
        grid: {
            height: '80%',
            top: 20
        },
        textStyle: {
            fontFamily: 'Roboto'
        },
        series: [
          {
            data: [5000, 200010, 122000, 320000, 100000, 105000, 405500, 200000, 350000, 95000],
            type: 'line',
            smooth: true,
            showSymbol: false,
            itemStyle: {
              color: '#FF1616'
            },
            areaStyle: {
              color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                {
                  offset: 0,
                  color: 'rgba(255, 22, 22, 0.20)'
                },
                {
                  offset: 1,
                  color: 'rgba(255, 22, 22, 0.00)'
                }
              ])
            },
          }
        ]
    };

    if (option && typeof option === 'object') {
        myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
}

initChart3();
function initChart3(){
    var dom = document.getElementById('echart-3');
    var myChart = echarts.init(dom, null, {
    renderer: 'canvas',
    useDirtyRect: false
    });
    var app = {};

    var option;

    // option = {
    //     tooltip: {
    //       trigger: 'item'
    //     },
    //     textStyle: {
    //         fontFamily: 'Roboto'
    //     },
    //     legend: {
    //       right: 0,
    //       width: '40%',
    //       itemWidth: 20,
    //       itemHeight: 20,
    //       borderRadius: 6,
    //       itemGap: 24,
    //       textStyle: {
    //         color: '#935E5E',
    //         fontSize: 14
    //       },
    //       formatter: (name) => {
    //           var series = myChart.getOption().series[0];
    //           var value = series.data.filter(row => row.name === name)[0].value;
    //           return value + '%\n' + name;
    //       }
    //     },
    //     series: [
    //       {
    //         avoidLabelOverlap: false,
    //         type: 'pie',
    //         radius: ['30%', '70%'],
    //         height: '240px',
    //         top: '-25px',
    //         width: '50%',
    //         itemStyle: {
    //           borderRadius: 10,
    //           borderColor: '#fff',
    //           borderWidth: 2
    //         },
    //         labelLine: {
    //           show: false
    //         },
    //         label: {
    //           show: false
    //         },
    //         data: [
    //           { value: 26, name: 'Hangup',
    //             itemStyle: {
    //               color: '#A70000'
    //             }
    //           },
    //           { value: 5, name: 'Failed',
    //             itemStyle: {
    //               color: '#730303'
    //             }
    //           },
    //           { value: 58, name: 'Busy',
    //             itemStyle: {
    //               color: '#FC5B5B'
    //             }
    //           },
    //           { value: 10, name: 'Agent_noanswer ', 
    //             itemStyle: {
    //               color: '#CF0F0F'
    //             }
    //           },
    //           { value: 5, name: 'No-answer',
    //             itemStyle: {
    //               color: '#FDA2A2'
    //             }
    //           },
    //           { value: 7, name: 'Đang xử lý',
    //             itemStyle: {
    //               color: '#FC2424'
    //             }
    //           }
    //         ]
    //       }
    //     ]
    // };
    option = {
      xAxis: {
          type: 'category',
          axisTick: { show: false },
          axisLine: { show: false },
          data: ['Chưa xử lý', 'Poped', 'Originaled', 'Dialed', 'Lead answered', 'Lokking agent', 'Connected', 'Hangup', 'Failed', 'No-answer', 'Busy', 'No Agent'],
          axisLabel: {
              color: '#86909C',
              rotate: 35
          }
      },
      textStyle: {
          fontFamily: 'Roboto'
      },
      yAxis: {
          type: 'value',
          splitLine: { show: false },
          axisLabel: { show: false }
      },
      grid: {
          height: '55%',
          top: 20
      },
      tooltip: {
        trigger: 'axis',
        axisPointer: {
          type: 'shadow'
        }
      },
      series: [
        {
          data: [
            {
              value: 15002,
              itemStyle: {
                color: '#A70000',
                borderRadius: [12, 12, 12, 12]
              },
              label: {
                show: true,
                position: 'top',
                formatter: (params) => {
                  if(params.value > 0){
                    return parseInt(params.value / 1000) + 'k'
                  }
                }
              }
            },
            {
              value: 15,
              itemStyle: {
                color: '#730303',
                borderRadius: [12, 12, 12, 12]
              },
              label: {
                show: true,
                position: 'top'
              }
            },
            {
              value: 0,
              itemStyle: {
                color: '#FC5B5B',
                borderRadius: [12, 12, 12, 12]
              },
              label: {
                show: true,
                position: 'top',
                formatter: (params) => {
                  if(params.value > 0){
                    return parseInt(params.value / 1000) + 'k'
                  }
                }
              }
            },
            {
              value: 25,
              itemStyle: {
                color: '#CF0F0F',
                borderRadius: [12, 12, 12, 12]
              },
              label: {
                show: true,
                position: 'top',
                formatter: (params) => {
                  if(params.value > 0){
                    return parseInt(params.value / 1000) + 'k'
                  }
                }
              }
            },
            {
              value: 27,
              itemStyle: {
                color: '#FDA2A2',
                borderRadius: [12, 12, 12, 12]
              },
              label: {
                show: true,
                position: 'top',
                formatter: (params) => {
                  if(params.value > 0){
                    return parseInt(params.value / 1000) + 'k'
                  }
                }
              }
            },
            {
              value: 20,
              itemStyle: {
                color: '#FC2424',
                borderRadius: [12, 12, 12, 12]
              },
              label: {
                show: true,
                position: 'top',
                formatter: (params) => {
                  if(params.value > 0){
                    return parseInt(params.value / 1000) + 'k'
                  }
                }
              }
            },
            {
              value: 10010,
              itemStyle: {
                color: '#9A0F0F',
                borderRadius: [12, 12, 12, 12]
              },
              label: {
                show: true,
                position: 'top',
                formatter: (params) => {
                  if(params.value > 0){
                    return parseInt(params.value / 1000) + 'k'
                  }
                }
              }
            },
            {
              value: 36,
              itemStyle: {
                color: '#A80000',
                borderRadius: [12, 12, 12, 12]
              },
              label: {
                show: true,
                position: 'top',
                formatter: (params) => {
                  if(params.value > 0){
                    return parseInt(params.value / 1000) + 'k'
                  }
                }
              }
            },
            {
              value: 1000,
              itemStyle: {
                color: '#FD2424',
                borderRadius: [12, 12, 12, 12]
              },
              label: {
                show: true,
                position: 'top',
                formatter: (params) => {
                  if(params.value > 0){
                    return parseInt(params.value / 1000) + 'k'
                  }
                }
              }
            },
            {
              value: 35,
              itemStyle: {
                color: '#FF5B5B',
                borderRadius: [12, 12, 12, 12]
              },
              label: {
                show: true,
                position: 'top',
                formatter: (params) => {
                  if(params.value > 0){
                    return parseInt(params.value / 1000) + 'k'
                  }
                }
              }
            },
            {
              value: 55,
              itemStyle: {
                color: '#FFA3A3',
                borderRadius: [12, 12, 12, 12]
              },
              label: {
                show: true,
                position: 'top',
                formatter: (params) => {
                  if(params.value > 0){
                    return parseInt(params.value / 1000) + 'k'
                  }
                }
              }
            },
            {
              value: 800,
              itemStyle: {
                color: '#FF1616',
                borderRadius: [12, 12, 12, 12]
              },
              label: {
                show: true,
                position: 'top',
                formatter: (params) => {
                  if(params.value > 0){
                    return parseInt(params.value / 1000) + 'k'
                  }
                }
              }
            },
          ],
          type: 'bar'
        }
      ]
  };

    if (option && typeof option === 'object') {
        myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
}

initChart4();
function initChart4(){
    var dom = document.getElementById('echart-4');
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
          axisLine: {
            lineStyle: {
              color: '#86909C'
            }
          },
          axisLabel: {
            rotate: 30
          },
          data: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5']
        },
        yAxis: {
          type: 'value',
          splitLine: {
            lineStyle: {
              type: 'dashed',
              color: '#E5E6EB'
            }
          },
          axisLabel: {
            formatter: (params) => {
              if(params >= 1000){
                return parseFloat((params / 1000).toFixed(1)) + 'k'
              }
              else if(params >= 100){
                return parseFloat((params / 100).toFixed(1)) + 'tr'
              } else {
                return params
              }
            },
            color: '#86909C'
          }
        },
        grid: {
            height: '80%',
            top: 20
        },
        tooltip: {
          trigger: 'axis'
        },
        textStyle: {
            fontFamily: 'Roboto'
        },
        series: [
          {
            data: [3000, 800, 700, 1600, 600],
            type: 'line',
            smooth: true,
            showSymbol: false,
            itemStyle: {
              color: '#D70000'
            },
          }
        ]
    };

    if (option && typeof option === 'object') {
        myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
}

initChart5();
function initChart5(){
    var dom = document.getElementById('echart-5');
    var myChart = echarts.init(dom, null, {
    renderer: 'canvas',
    useDirtyRect: false
    });
    var app = {};

    var option;

    option = {
        xAxis: {
          type: 'value',
          axisLabel: {
            show: false
          },
          splitLine: {
            lineStyle: {
              type: 'dashed'
            }
          }
        },
        yAxis: {
          type: 'category',
          data: ['User24', 'User20', 'User1'],
          axisTick: {
            show: false
          },
          axisLabel: {
            color: '#391818'
          }
        },
        tooltip: {
          trigger: 'axis'
        },
        grid: {
            height: '80%',
            top: 20,
            width: '60%',
            right: '20px'
        },
        series: [
          {
            type: 'bar',
            data: [
              {
                value: 9,
                itemStyle: {
                  color: 'rgba(154, 15, 15, 0.5)',
                  borderRadius: [5, 5, 5, 5]
                },
                label: {
                  show: true,
                  position: 'right',
                  formatter: (params) => {
                    if(params.value > 0){
                      return parseFloat((params.value / 100).toFixed(1)) * 100 + '%'
                    }
                  }
                }
              },
              {
                value: 17,
                itemStyle: {
                  color: '#D70000',
                  borderRadius: [5, 5, 5, 5]
                },
                label: {
                  show: true,
                  position: 'right',
                  formatter: (params) => {
                    if(params.value > 0){
                      return parseFloat((params.value / 100).toFixed(1)) * 100 + '%'
                    }
                  }
                }
              },
              {
                value: 74,
                itemStyle: {
                  color: '#750000',
                  borderRadius: [5, 5, 5, 5]
                },
                label: {
                  show: true,
                  position: 'right',
                  formatter: (params) => {
                    if(params.value > 0){
                      return parseFloat((params.value / 100).toFixed(1)) * 100 + '%'
                    }
                  }
                }
              }
            ]
          }
        ]
    };

    if (option && typeof option === 'object') {
        myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
}

initChart6();
function initChart6(){
    var dom = document.getElementById('echart-6');
    var myChart = echarts.init(dom, null, {
    renderer: 'canvas',
    useDirtyRect: false
    });
    var app = {};

    var option;

    option = {
        xAxis: {
          type: 'value',
          axisLabel: {
            show: false
          },
          splitLine: {
            lineStyle: {
              type: 'dashed'
            }
          }
        },
        yAxis: {
          type: 'category',
          data: ['0912 389 231', '0963 654 211', '0963 654 213'],
          axisTick: {
            show: false
          },
          axisLabel: {
            color: '#391818'
          }
        },
        grid: {
            height: '80%',
            top: 20,
            width: '60%',
            right: '20px'
        },
        tooltip: {
          trigger: 'axis'
        },
        series: [
          {
            type: 'bar',
            data: [
              {
                value: 12,
                itemStyle: {
                  color: 'rgba(154, 15, 15, 0.5)',
                  borderRadius: [5, 5, 5, 5]
                },
                label: {
                  show: true,
                  position: 'right',
                  formatter: (params) => {
                    if(params.value > 0){
                      return parseFloat((params.value / 100).toFixed(1)) * 100 + '%'
                    }
                  }
                }
              },
              {
                value: 20,
                itemStyle: {
                  color: '#D70000',
                  borderRadius: [5, 5, 5, 5]
                },
                label: {
                  show: true,
                  position: 'right',
                  formatter: (params) => {
                    if(params.value > 0){
                      return parseFloat((params.value / 100).toFixed(1)) * 100 + '%'
                    }
                  }
                }
              },
              {
                value: 68,
                itemStyle: {
                  color: '#750000',
                  borderRadius: [5, 5, 5, 5]
                },
                label: {
                  show: true,
                  position: 'right',
                  formatter: (params) => {
                    if(params.value > 0){
                      return parseFloat((params.value / 100).toFixed(1)) * 100 + '%'
                    }
                  }
                }
              }
            ]
          }
        ]
    };

    if (option && typeof option === 'object') {
        myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
}

initChart7();
function initChart7(){
    var dom = document.getElementById('echart-7');
    var myChart = echarts.init(dom, null, {
    renderer: 'canvas',
    useDirtyRect: false
    });
    var app = {};

    var option;

    option = {
        xAxis: {
          type: 'value',
          axisLabel: {
            show: false
          },
          splitLine: {
            lineStyle: {
              type: 'dashed'
            }
          }
        },
        yAxis: {
          type: 'category',
          data: ['Ngày 10/1', 'Ngày 13/1', 'Ngày 20/1'],
          axisTick: {
            show: false
          },
          axisLabel: {
            color: '#391818'
          }
        },
        grid: {
            height: '80%',
            top: 20,
            width: '60%',
            right: '20px'
        },
        tooltip: {
          trigger: 'axis'
        },
        series: [
          {
            type: 'bar',
            data: [
              {
                value: 20,
                itemStyle: {
                  color: 'rgba(154, 15, 15, 0.5)',
                  borderRadius: [5, 5, 5, 5]
                },
                label: {
                  show: true,
                  position: 'right',
                  formatter: (params) => {
                    if(params.value > 0){
                      return parseFloat((params.value / 100).toFixed(1)) * 100 + '%'
                    }
                  }
                }
              },
              {
                value: 25,
                itemStyle: {
                  color: '#D70000',
                  borderRadius: [5, 5, 5, 5]
                },
                label: {
                  show: true,
                  position: 'right',
                  formatter: (params) => {
                    if(params.value > 0){
                      return parseFloat((params.value / 100).toFixed(1)) * 100 + '%'
                    }
                  }
                }
              },
              {
                value: 55,
                itemStyle: {
                  color: '#750000',
                  borderRadius: [5, 5, 5, 5]
                },
                label: {
                  show: true,
                  position: 'right',
                  formatter: (params) => {
                    if(params.value > 0){
                      return parseFloat((params.value / 100).toFixed(1)) * 100 + '%'
                    }
                  }
                }
              }
            ]
          }
        ]
    };

    if (option && typeof option === 'object') {
        myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
}