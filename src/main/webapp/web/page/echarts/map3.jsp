<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/demo1/layui-v2.5.6/layui/css/layui.css" media="all">
<script type="text/javascript" src="/demo1/layui-v2.5.6/layui/layui.all.js"></script>
<script type="text/javascript" src="/demo1/base/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/demo1/base/js/echarts-en.js"></script>
<script type="text/javascript" src="/demo1/base/js/echarts.js"></script>
<script type="text/javascript" src="/demo1/base/js/echarts-gl.js"></script>
<script type="text/javascript" src="/demo1/base/js/qd.js"></script>
<title>Insert title here</title>
</head>
<body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 600px;height:400px;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var $=layui.jquery;
        var tmp=new Array(),weather=new Array(),hum=new Array(),wind=new Array();
        var p=0;
        
        function init(){
        	$.ajax({
        		url:'/demo1/weather/selectList',
        		type:'post',
        		data:'',
        		dataType:'json',//java端返回给前端的数据    text:适用于string int等返回值
        		success:function(d){
        			console.log(d);
        			        // 指定图表的配置项和数据
            
        $.each(d,function(){
        	tmp.push(this.tmp);
        	hum.push(this.hum);
        	weather.push(this.weather);
        	wind.push(this.wind);
        	
        })
        //alert(tmp[0]);
        //document.write(p); 
       
  var myChart = echarts.init(document.getElementById('main'));
        
        var namearr = [ '温度', '湿度', '污染指数'];

        var colorarr = [ '#1921ff', '#266eff', '#01c3dd', '#008198', '#2ef4ab',
        		'#ffe074', '#ffcbcb', '#cd8425' ];
     
     var str = tmp.values(1);
     p=typeof(str);
    // alert(tmp.length);
     var value1=[p,hum[0],wind[0]];
     var value2=[tmp[1],hum[1],wind[1]];
     var value3=[tmp[2], hum[2], wind[2]];
     var value4=[tmp[3], hum[3], wind[3]];
     //p=1;
        var rawData = [
        	{name:'即墨',value:[tmp[0], hum[0], wind[0]]},
        	{name:'黄岛',value:[tmp[1], hum[1], wind[1]]},
        	{name:'平度',value:[tmp[2], hum[2], wind[2]]},
        	{name:'莱西',value:[tmp[3], hum[3], wind[3]]},

        	];
        	var geoCoordMap = {
        		'市南':[120.395966,36.070892],
        		'市北':[120.355026,36.083819],
        		'黄岛':[119.995518,35.875138],
        		'崂山区':[120.467393,36.102569],
        		'李沧区':[120.421236,36.160023],
        		'城阳区':[120.389135,36.306833],
//        		'即墨区':[120.447352,36.390847],
//        		'胶州市':[120.006202,36.285878],
//        		'平度市':[119.959012,36.788828],
//        		'莱西市':[120.526226,36.86509]
        	};
        	 var MapData1 = [
        	       
        	       {
        	         name: '黄岛',
        	         value: [119.995518,35.875138]
        	       },
        	       {
        	         name: '崂山区',
        	         value: [120.467393,36.102569]
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
        echarts.registerMap('qingdao',Json);
        //myChart.hideLoading();
        option = {
                backgroundColor:'#010b43',
                title: {
                    top: 10,
                    text: '青岛市天气情况',
                    subtext: '',
                    x: 'left',
                    textStyle: {
                        color: '#ccc'
                    }
                },
        		top : '-40%',
        		bottom : '-40%',
        		tooltip: {
        		    trigger: 'axis'
        		},
        				geo : {
        					type : 'map',
        					map : 'qingdao',
        					label : {
        						normal : {
        							textStyle : {
        								color : '#fff'
        							},
        							show : true
        						},
        						emphasis : {
        							textStyle : {
        								color : '#C6A300'
        							},
        							show : true
        						}
        					},
        					itemStyle : {
        						normal : {
        							areaColor : "rgba(0,0,0,0)",
        							borderColor : "#126cc4",
        							borderWidth : 1.3
        						},
        						emphasis : {
        							areaColor : "rgba(233,0,200,0.3)"
        						}
        					}
        				},
        				series : []
        			
            };

        	
        function renderEachCity() {
        	var options = {
        		legend:[],
        		xAxis : [],
        		yAxis : [],
        		grid : [],
        		series : []
        	};
        	
        	options.legend.push({
                data : namearr,
                left:'60%',
                top:'85%',
                itemWidth:25,
                itemHeight:15,
                textStyle:{
                    color:'#ddd',
                    fontSize:15
                },
               
            });
        	//ji huang p lai
          var arr1=[[310,160],[250,270],[230,70],[350,60]];
          var tt=[weather[0],weather[1],weather[2],weather[3]];
           var j=0,k=0;
        	echarts.util.each(rawData, function(dataItem, idx) {
        		var geoCoord = geoCoordMap[dataItem.name];
        		//var coord = myChart.convertToPixel({geoIndex: 0}, geoCoord);
        		idx += '';
        		var coord =arr1[k];

        		options.xAxis.push({
        			id : idx,
        			gridId : idx,
        			type : 'category',
        			name : tt[j],
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
        			data : [ tt[j] ],
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
               
        		for (var i = 0; i < namearr.length; i++) {
        			options.series.push({
        				name : namearr[i],
        				type : 'bar',
        				xAxisId : idx,
        				yAxisId : idx,
        				barWidth: '20%',
        				itemStyle : {
        					normal : {
        						color : colorarr[i]
        					}
        				},
        				data : [ rawData[j].value[i]]
        				//data :  value1 
        			});
        		}
        		   j=j+1;
                   k=k+1;
        	});
        	myChart.setOption(options);
        }
        myChart.setOption(option);
        setTimeout(function(){
            renderEachCity();
        },300); 
        myChart.setOption(option);
        //alert(rawData[2].value[0]);
        //-----
        		}
        	});
       }
        init();
        //alert(rawData);
      
    </script>
</body>
</html>