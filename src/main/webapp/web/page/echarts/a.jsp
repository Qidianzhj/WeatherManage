<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/demo1/layui-v2.5.6/layui/css/layui.css" media="all">
<script type="text/javascript" src="/demo1/base/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/demo1/layui-v2.5.6/layui/layui.all.js"></script>
<script type="text/javascript" src="/demo1/base/js/echarts.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 600px; height: 400px;"></div>
<script type="text/javascript">
var deptSno='<%=request.getParameter("deptSno")%>';
var empSno='<%=request.getParameter("empSno")%>';
var myChart = echarts.init(document.getElementById('main'));
var $=layui.jquery;
function init(){
	$.ajax({
		url:'/demo1/weather/selectModel',
		type:'post',
		data:{empSno:empSno,deptSno:deptSno},
		dataType:'json',//java端返回给前端的数据    text:适用于string int等返回值
		success:function(d){
			console.log(d);
			// 基于准备好的dom，初始化echarts实例
		
			var zhj = 'zhj';
			// 指定图表的配置项和数据
			var option = {
				title : {
					text : 'ECharts 入门示例'
				},
				xAxis : {
					type : 'category',
					data : [ zhj, "Tue", "雪纺衫", "裤子", "高跟鞋", "袜子" ]
				},
				yAxis : {
					type : 'value'
				},
				series : [ {
					data : [ 820, 932, 901, 934, 1290, 1330, 1320 ],
					type : 'line'

				} ]
			};
			// 使用刚指定的配置项和数据显示图表。
			myChart.setOption(option);
			
		}
	});
}
init();
		
</script>
</body>
</html>