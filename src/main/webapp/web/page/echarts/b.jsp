<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/demo1/layui-v2.5.6/layui/css/layui.css" media="all">
<script type="text/javascript" src="/demo1/base/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/demo1/layui-v2.5.6/layui/layui.all.js"></script>
<script type="text/javascript" src="/demo1/base/js/echarts.js"></script>
<title>Insert title here</title>
</head>
<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="width: 600px; height: 400px;"></div>
	<div id="main1" style="width: 600px; height: 400px;"></div>
	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        var myChart2 = echarts.init(document.getElementById('main1'));
        var $=layui.jquery;
        function init(){
        	$.ajax({
        		url:'/demo1/weather/selectList',
        		type:'post',
        		data:'',
        		dataType:'json',//java端返回给前端的数据    text:适用于string int等返回值
        		success:function(d){
        			console.log(d);
        // 指定图表的配置项和数据
                 var tmp=new Array(),location=new Array(),hum=new Array(),weather=new Array();
        $.each(d,function(){
        	tmp.push(this.tmp);
        	hum.push(this.hum);
        	weather.push(this.weather);
        	location.push(this.location);
        })
		    var option = {
        	title:{text:'天气'},
        	legend: {
                data:['温度']
            },
        	xAxis:{data:location},
        	yAxis:{},
        	series:[{name: '温度',type:'bar',data:tmp}]
        };
        	
		        // 使用刚指定的配置项和数据显示图表。
		   myChart.setOption(option);
		    var option1 = {
		            	title:{text:'湿度'},
		            	xAxis:{type: 'category',data:location},
		            	yAxis:{type: 'value'},
		            	series:[{data:hum,type:'line'}]
		            };
		            	
		    		        // 使用刚指定的配置项和数据显示图表。
		   myChart2.setOption(option1);
		      
        		}
        	});
        }
        
     init();
     </script>
</body>
</html>
