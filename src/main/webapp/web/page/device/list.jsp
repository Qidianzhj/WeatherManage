<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <%@ include file="/web/header.jsp"%> --%>
	<title>设备信息管理</title>
<link rel="stylesheet" href="/demo1/layui-v2.5.6/layui/css/layui.css" media="all">
<script src="/demo1/layui-v2.5.6/layui/layui.all.js " type="text/javascript"></script>
</head>

<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 0px; padding: 5px">
	<legend>信息列表</legend>
	<table id="demo" lay-filter="test"></table>
</fieldset>
<script type="text/html" id="toolbarDemo">
  <div class="layui-input-inline" style="width: 200px;">
    <input type="text" name="name" placeholder="请输入名称" class="layui-input" autocomplete="off"/>    
  </div>
  <button class="layui-btn layui-btn-sm" lay-event="sel">查询</button>
  <button class="layui-btn layui-btn-sm" lay-event="add">添加</button>
</script>

<script type="text/html" id="toolDemo">
 <a class="layui-btn layui-btn-xs" lay-event="con">连接</a>
<a class="layui-btn layui-btn-xs" lay-event="uncon">断开连接</a>
  <a class="layui-btn layui-btn-xs" lay-event="upd">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/javascript">
var table =layui.table;
var tableDemo=table.render({//指定id位置进行渲染
	elem: '#demo',//对应id
	url:'/demo1' + '/device/selectPage',
	toolbar: '#toolbarDemo',//开启头部工具栏，为其绑定左侧模板
	height:'full-100',//全尺寸-100px
	width:'1030',
	page: true ,//开启分页
	cols:[[
		{type:'numbers',title:'序号'},
		{field:'num',title:'设备号',width:'10%'},
		{field:'location',title:'位置',width:'8%'},
		{field:'ip',title:'ip',width:'15%'},
		{field:'type',title:'型号',width:'8%'},
		{field:'status',title:'状态',width:'7%'},
		{field:'con',title:'连接',width:'7%'},
		{field:'mode',title:'角色',width:'13%'},
		{title:'操作',toolbar:'#toolDemo'}//toolbar表示行工具栏
	]]
	
});
 //事件监听-头工具条
 var $=layui.jquery;//设为全局
table.on('toolbar(test)', function(obj){//toolbar 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
	var event=obj.event//sel
	var layer=layui.layer;
  switch(event){
 /*  case 'del':
	  alert(123);;break; */
  	case 'sel':
      table.reload('demo', {
        where: {num: $("input[name='name']").val()}//设定异步数据接口的额外参数    第一个name要与后台mapper元素对应
       ,page: {curr: 1} //重新从第 1 页开始
      });
      //layer.msg('刷新查询~');
    break;
    case 'add':
    	layer.open({//打开子页面弹窗
    		type:2,
    		content:'/demo1/web/page/device/add.jsp',
    		area:['500px','400px'],
    		maxmin:true,
    		end: refresh //函数作为参数时不加()
    	});
    break;
  };
});
function cancel(){
	var index = parent.layer.getFrameIndex(window.name);//先得到当前iframe层的索引
	parent.layer.close(index);

}
function refresh(){
	$("button[lay-event='sel']").click();//触发了点击事件
}
// 事件监听-行工具条
table.on('tool(test)', function(obj){//tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
  var data = obj.data; //获得当前行数据
  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
//   var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
  var num =data.num;
  var status =data.status;
  var conn =data.con;
  switch(layEvent){
    case 'del':
      del(num);//对相应的编号项执行del()函数
    break;
    case 'upd':
    
     layer.open({//弹窗
    	 type:2,
    	 area:['500px','400px'],
    	 maxmin:true,
    	 content:'/demo1/web/page/device/upd.jsp?num='+num,
    	 end:refresh
     });
    break;
    case 'con':
      con(num,status);
       break;
    case 'uncon':
      uncon(num,status,conn);
       break;
  };
});

function del(num){
 	layer.confirm("确定进行该操作？", {
 		icon : 3,
 		title : '提示'
 	}, function(index){
 		$.ajax({
 			url:'/demo1/device/delete',
 			type:'post',
 			data:{num:num},  //js对象写法
 			dataType:'json',//java端返回给前端的数据    text:适用于string int等返回值
 			success:function(d){//d就是从java端返回回来的数据
 			    console.log(d.Num);
 			    if(d.Num==1){
 			    	layer.msg("删除成功");
 			    	refresh();
 			    	setTimeout(cancel,2000);
 			    }	
 			    else {
 			    	layer.msg("删除失败");
 			    	setTimeout(cancel,2000);
 			    	}
 			}
 		})}
   )};
   
function con(num,status){
	 	layer.confirm("请确保天气设备配置成功？", {
	 		icon : 3,
	 		title : '提示'
	 	}, function(index){
	 		$.ajax({
	 			url:'/demo1/device/updateCon',
	 			type:'post',
	 			data:{num:num,status:status},  //js对象写法
	 			dataType:'json',//java端返回给前端的数据    text:适用于string int等返回值
	 			success:function(d){//d就是从java端返回回来的数据
	 			    console.log(d.Num);
	 			    if(d.Num==1){
	 			    	layer.msg("连接成功");
	 			    	refresh();
	 			    	setTimeout(cancel,2000);
	 			    }	
	 			    else {
	 			    	layer.msg("连接失败");
	 			    	refresh();
	 			    	setTimeout(cancel,2000);
	 			    	}
	 			}
	 		})}
	   )};
	   
function uncon(num,status,con){
		 	layer.confirm("要断开连接吗？", {
		 		icon : 3,
		 		title : '提示'
		 	}, function(index){
		 		$.ajax({
		 			url:'/demo1/device/updateUncon',
		 			type:'post',
		 			data:{num:num,status:status,con:con},  //js对象写法
		 			dataType:'json',//java端返回给前端的数据    text:适用于string int等返回值
		 			success:function(d){//d就是从java端返回回来的数据
		 			    console.log(d.Num);
		 			    if(d.Num==1){
		 			    	layer.msg("连接已断开");
		 			    	refresh();
		 			    	setTimeout(cancel,2000);
		 			    }	
		 			    else if(d.Num==2){
		 			    	layer.msg("未连接");
		 			    	refresh();
		 			    	setTimeout(cancel,2000);
		 			    	}
		 			   else {
		 			    	layer.msg("连接断开失败");
		 			    	refresh();
		 			    	setTimeout(cancel,2000);
		 			    	}
		 			   	refresh();
		 			}
		 		})}
		   )};
</script>
</body>
</html>

