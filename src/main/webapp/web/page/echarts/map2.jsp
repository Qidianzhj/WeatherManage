<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/demo1/base/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/demo1/base/js/echarts-en.js"></script>
<script type="text/javascript" src="/demo1/base/js/echarts.js"></script>
<script type="text/javascript" src="/demo1/base/js/echarts-gl.js"></script>
<script type="text/javascript" src="/demo1/base/js/qd.js"></script>
<title>Insert title here</title>
</head>
<body>
<div id="main" style="width: 600px; height: 400px;"></div>
 <script>
 var myChart = echarts.init(document.getElementById('main'));
 myChart.showLoading();
       let index = -1;
       var timer = setInterval(function() {
         // 隐藏提示框
         myChart.dispatchAction({
           type: 'hideTip',
           seriesIndex: 0,
           dataIndex: index
         });
         // 显示提示框
         myChart.dispatchAction({
           type: 'showTip',
           seriesIndex: 0,
           dataIndex: index + 1
         });
         // 取消高亮指定的数据图形
         myChart.dispatchAction({
           type: 'downplay',
           seriesIndex: 0,
           dataIndex: index
         });
         // 高亮指定的数据图形
         myChart.dispatchAction({
           type: 'highlight',
           seriesIndex: 0,
           dataIndex: index + 1
         });
         index++;
         if (index > 13) {
           index = -1;
         }
       }, 2000);


       myChart.on('mousemove', function(e) {
         clearInterval(timer);
         myChart.dispatchAction({
           type: 'downplay',
           seriesIndex: 0
         });
         myChart.dispatchAction({
           type: 'highlight',
           seriesIndex: 0,
           dataIndex: e.dataIndex
         });
         myChart.dispatchAction({
           type: 'showTip',
           seriesIndex: 0,
           dataIndex: e.dataIndex
         });
       }); //---------------------------------------------鼠标移入静止播放
       myChart.on('mouseout', function(e) {
         clearInterval(timer);
         myChart.dispatchAction({
           type: 'downplay',
           seriesIndex: 0,
           dataIndex: e.dataIndex
         }); //鼠标移出后先把上次的高亮取消
         timer = setInterval(function() {
           // 隐藏提示框
           myChart.dispatchAction({
             type: 'hideTip',
             seriesIndex: 0,
             dataIndex: index
           });
           // 显示提示框
           myChart.dispatchAction({
             type: 'showTip',
             seriesIndex: 0,
             dataIndex: index + 1
           });
           // 取消高亮指定的数据图形
           myChart.dispatchAction({
             type: 'downplay',
             seriesIndex: 0,
             dataIndex: index
           });
           // 高亮指定的数据图形
           myChart.dispatchAction({
             type: 'highlight',
             seriesIndex: 0,
             dataIndex: index + 1
           });
           index++;
           if (index > 13) {
             index = -1;
           }
         }, 2000);
       }); 
       
var mount=[3,2,2,3]
function getJson(){
     echarts.registerMap('qingdao', Json);
    myChart.hideLoading();
  var MapData1 = [
      {
        name: '平度市',
        value: [119.959012,36.788828,mount[0]]
      },
      {
        name: '莱西市',
        value: [120.526226,36.86509,mount[1]]
      },
      {
          name: '黄岛',
          value: [119.995518,35.875138,mount[2]]
        },
        {
            name: '即墨区',
            value: [120.447352,36.390847,mount[3]]
          },
       {
         name: '市南',
         value: [120.395966,36.070892,0]
       },
       {
         name: '市北',
         value: [120.355026,36.083819,0]
       },
       {
         name: '崂山区',
         value: [120.467393,36.102569,0]
       },
       {
         name: '李沧区',
         value: [120.421236,36.160023,0]
       },
       {
         name: '城阳区',
         value: [120.389135,36.306833,0]
       },
      
       {
         name: '胶州市',
         value: [120.006202,36.285878,0]
       }
     ];
  
 
		
option = {
        backgroundColor: '#020933',
        title: {
            top: 10,
            text: '青岛市传感器数量分布',
            subtext: '',
            x: 'left',
            textStyle: {
                color: '#ccc'
            }
        },
        visualMap: {
            min: 0,
            max: 10,
            right: 50,
            seriesIndex: 1,
            type: 'piecewise',
            bottom: 50,
            textStyle: {
              color: 'red'
            },
        splitList: [
            {
              gte: 3,
              color: '#F5222D',
              label: '>3'
            }, 
            {
              gte: 3,
              lte: 2,
              color: 'red ',
              label: '2~3'
            },
            {
              gte: 2,
              lte: 1,
              color: '#FA8C16',
              label: '1~2'
            }, 
            {
              lte: 0,
              color: 'green',
              label: '无'
            }
          ]
},

         geo: {
             map: 'qingdao',
           aspectScale: 0.75, //长宽比
           zoom: 1.1,
           roam: false,
           itemStyle: {
             normal: {
               areaColor: '#013C62',
               shadowColor: '#182f68',
               shadowOffsetX: 0,
               shadowOffsetY: 25
             },
             emphasis: {
               areaColor: '#2AB8FF',
               borderWidth: 0,
               color: 'green',
               label: {
                 show: false
               }
             }
           }
         },
        
         series: [ {
             type: 'map',
             roam: true,
             label: {
               normal: {
                 show: true,
                 textStyle: {
                   color: '#fff'
                 }
               },
               emphasis: {
                 textStyle: {
                   color: '#fff'
                 }
               }
             },

             itemStyle: {
               normal: {
                 borderColor: '#2AB8FF',
                 borderWidth: 1.3,
                 areaColor: '#12235c'
               },
               emphasis: {
                 areaColor: '#2AB8FF',
                 borderWidth: 0,
                 color: 'green'
               }
             },
             zoom: 1.1,
             roam: false,
             map: 'qingdao' //使用
             // data: this.difficultData //热力图数据   不同区域 不同的底色
           },
           {
             type: 'effectScatter',
             coordinateSystem: 'geo',
             showEffectOn: 'render',
             rippleEffect: {
               period: 15,
               scale: 4,
               brushType: 'fill'
             },
             hoverAnimation: true,
             itemStyle: {
               normal: {
                 color: '#ffff',
                 shadowBlur: 10,
                 shadowColor: '#333'
               }
             },
             data: MapData1
           }
       ]
        
     };
   myChart.setOption(option);
}    
 getJson();

 </script>
 
</body>
</html>
