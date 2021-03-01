<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <%@ include file="/web/header.jsp"%> --%>
	<title>员工信息维护</title>
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
    <input type="text" name="dept_sno" placeholder="请输入部门编号" class="layui-input" autocomplete="off"/>  
  </div>
  <button class="layui-btn layui-btn-sm" lay-event="sel">查询</button>
  <button class="layui-btn layui-btn-sm" lay-event="add">添加</button>
</script>

<script type="text/html" id="toolDemo">
  <a class="layui-btn layui-btn-xs" lay-event="upd">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="updpass">修改密码</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="setDept">设置部门</a>
</script>
<script type="text/javascript">
var table =layui.table;
var tableDemo=table.render({//指定id位置进行渲染
	elem: '#demo',//对应id
	url:'/demo1' + '/employee/selectPage',
	toolbar: '#toolbarDemo',//开启头部工具栏，为其绑定左侧模板
	height:'full-100',//全尺寸-100px
	width:'1030',
	page: true ,//开启分页
	cols:[[ 
		{type:'numbers',title:'序号'},
		{field:'sno',title:'编号',width:'10%'},
		{field:'name',title:'姓名',width:'10%'},
		{field:'pass',title:'密码',width:'10%'},
		{field:'age',title:'年龄',width:'10%'},
		{field:'gender',title:'性别',width:'10%'},
		{field:'dept_sno',title:'部门编号',width:'10%'},
		{field:'deptName',title:'部门名称',width:'10%'},
		{title:'操作',toolbar:'#toolDemo'}//toolbar表示行工具栏
	]]
	
});

var $=layui.jquery;//设为全局
table.on('toolbar(test)', function(obj){//toolbar 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
	var event=obj.event//sel
	var layer=layui.layer;
  switch(event){
 /*  case 'del':
	  alert(123);;break; */
  	case 'sel':
      table.reload('demo', {//此处查询调用的是render里的selectPage
        where: {name: $("input[name='name']").val(),dept_sno:$("input[name='dept_sno']").val()}//设定异步数据接口的额外参数    第一个name要与后台mapper元素对应
       ,page: {curr: 1} //重新从第 1 页开始
      });
     // layer.msg('刷新查询~');
    break;
    case 'add':
    	layer.open({//打开子页面弹窗
    		type:2,
    		content:'/demo1/web/page/employee/add.jsp',
    		area:['500px','400px'],
    		maxmin:true,
    		end: refresh //函数作为参数时不加()
    	});
     // openLayer('/web/page/department/add.jsp',refresh);
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
  var sno =data.sno;
  var dept_sno =data.dept_sno;
  switch(layEvent){
    case 'del':
      del(sno);//对相应的编号项执行del()函数
    break;
    case 'upd':
     // openLayer('/web/page/department/upd.jsp?code='+code,refresh)
     layer.open({
    	 type:2,
    	 area:['500px','400px'],
    	 maxmin:true,
    	 content:'/demo1/web/page/employee/upd.jsp?sno='+sno,
    	 end:refresh
     });
    break;
    case 'updpass':
        layer.open({
       	 type:2,
       	 area:['500px','400px'],
       	 maxmin:true,
       	 content:'/demo1/web/page/employee/updpass.jsp?sno='+sno,
       	 end:refresh
        });
      break;
    case 'setDept':
    layer.open({
   	 type:2,
   	 area:['500px','400px'],
   	 maxmin:true,
   	 content:'/demo1/web/page/employee/setDept.jsp?sno='+sno+'&dept_sno='+dept_sno,
   	 end:refresh
    });
  break;
};
});
function del(sno){
 	layer.confirm("确定进行该操作？", {
 		icon : 3,
 		title : '提示'
 	}, function(index){
 		$.ajax({
 			url:'/demo1/employee/delete',
 			type:'post',
 			data:{sno:sno},  //js对象写法
 			dataType:'json',//java端返回给前端的数据    text:适用于string int等返回值
 			success:function(d){//d就是从java端返回回来的数据
 			    console.log(d.Sno);
 			    if(d.Sno==1){
 			    	layer.msg("删除成功");
 			    	refresh();
 			    	setTimeout(cancel,2000);
 			    }	
 			    else if(d.Sno==2){
 			    	layer.msg("该数据不存在"); }
 			    else {
 			    	layer.msg("删除失败");
 			    	setTimeout(cancel,2000);
 			    	}
 			}
 		})}
   )};
</script>
</body>
</html>

