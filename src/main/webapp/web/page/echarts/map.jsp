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
       
var namearr = [ '1', '2', '3'];

var colorarr = [ '#1921ff', '#266eff', '#01c3dd', '#008198', '#2ef4ab',
       		'#ffe074', '#ffcbcb', '#cd8425' ];   
var MapData = [
{name:'市南',value:[6.6, 9.1, 7.1]},
//{name:'市北',value:[4.6, 13.1, 2.1]},
{name:'黄岛',value:[10.6, 9.1, 7.1]},
{name:'崂山区',value:[10.6, 9.1, 7.1]},
{name:'李沧区',value:[10.6, 9.1, 7.1]},
{name:'城阳区',value:[10.6, 9.1, 7.1]},
//{name:'即墨区',value:[10.6, 9.1, 7.1]},
//{name:'胶州市',value:[10.6, 9.1, 7.1]},
//{name:'平度市',value:[10.6, 9.1, 7.1]},
//{name:'莱西市',value:[10.6, 9.1, 7.1]}

];
var geoCoordMap = {
	'市南':[120.395966,36.070892],
	'市北':[120.355026,36.083819],
	'黄岛':[119.995518,35.875138],
	'崂山区':[120.467393,36.102569],
	'李沧区':[120.421236,36.160023],
	'城阳区':[120.389135,36.306833],
//	'即墨区':[120.447352,36.390847],
//	'胶州市':[120.006202,36.285878],
//	'平度市':[119.959012,36.788828],
//	'莱西市':[120.526226,36.86509]
};
function getJson(){
     echarts.registerMap('qingdao', Json);
    myChart.hideLoading();
  var MapData1 = [
       {
         name: '市南',
         value: [120.395966,36.070892]
       },
       {
         name: '市北',
         value: [120.355026,36.083819]
       },
       {
         name: '黄岛',
         value: [119.995518,35.875138]
       },
       {
         name: '崂山区',
         value: [120.467393,36.102569]
       },
       {
         name: '李沧区',
         value: [120.421236,36.160023]
       },
       {
         name: '城阳区',
         value: [120.389135,36.306833]
       },
       {
         name: '即墨区',
         value: [120.447352,36.390847]
       },
       {
         name: '胶州市',
         value: [120.006202,36.285878]
       },
       {
         name: '平度市',
         value: [119.959012,36.788828]
       },
       {
         name: '莱西市',
         value: [120.526226,36.86509]
       }
     ];
  
 
		
option = {
        backgroundColor: '#020933',
        title: {
            top: 20,
            text: '天气情况',
            subtext: '',
            x: 'left',
            textStyle: {
                color: '#ccc'
            }
        },
        splitList: [
            {
              
              gte: 30000,
              lte: 0,
              color: '#2ab8ff',
              label: ''
            }],

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
         //series:[]
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
                 borderColor: 'red',
                 borderWidth: 2,
                 areaColor: 'red'
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
           /*{
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
           }*/
       ]
        
     };
   myChart.setOption(option);
}    
  
   
   var options = {
			legend:[],
			xAxis : [],
			yAxis : [],
			grid : [],
			series : []
		};
		
		options.legend.push({
	        data : namearr,
	        left:'70%',
	        top:'85%',
	        itemWidth:25,
	        itemHeight:15,
	        textStyle:{
	            color:'#ddd',
	            fontSize:15
	        },
	       
	    });
		var arr=[1,2,3,4,5,6,7,8,9];
		var arr1=[[310,300],[250,270],[100,100],[100,160],[100,200],[100,230]];
		var i=0;
		MapData.forEach(function(dataItem, idx) {
			//for (var i = 0; i < MapData.length; i++) {
			//var dataItem=MapData[i]['name'];
			var geoCoord = geoCoordMap[dataItem.name];
			//var coord = myChart.convertToPixel({geoIndex: 0}, [120.395966,36.070892]);
			
			//idx=arr[i]
			var tt=['晴','阴','多云','晴','阴','多云'];
			var coord =arr1[i];
			idx += '';
			
			options.xAxis.push({
				id : idx,
				gridId : idx,
				type : 'category',
				name : dataItem.name,
				nameTextStyle : {
					color : '#fff',
					fontSize : 14
				},
				nameLocation : 'middle',
				nameGap : 3,
				splitLine : {
					show : false
				},
				axisTick : {
					show : false
				},
				axisLabel : {
					show : false
				},
				axisLine : {
					show : false,
					lineStyle : {
						color : '#bbb'
					}
				},
				data : [ dataItem.name ],
			});
			options.yAxis.push({
				id : idx,
				gridId : idx,
				show : false
			});
			options.grid.push({
				id : idx,
				width : 50,
				height : 40,
				left : coord[0] - 15,
				top : coord[1] - 35,
			});
			i++;
            var s=[1,2,3]
			for (var j = 0; j < namearr.length; j++) {
				options.series.push({
					name : namearr[j],
					type : 'bar',
					xAxisId : idx,
					yAxisId : idx,
					barWidth: '20%',
					itemStyle : {
						normal : {
							color : colorarr[j]
						}
					},
					//data : [ MapData[i]['value'][j] ]
					data : [ s[j] ]
				});
			}

		});  
 getJson();
   setTimeout(function(){
	   myChart.setOption(options);
	},1); 


 </script>
 
</body>
</html>
