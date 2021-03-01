<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>员工信息修改</title>
<!-- css 叠层样式表 -->
<style type="text/css">
.window {
	width: 400px;
	position: absolute;
	margin-left: -200px;
	margin-top: -80px;
	top: 50%;
	left: 50%;
	display: block;
	z-index: 2000;
	background: #fff;
	padding: 20 0;
}

}
</style>
<link rel="stylesheet" href="/demo1/layui-v2.5.6/layui/css/layui.css" media="all">
<script type="text/javascript" src="/demo1/base/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/demo1/layui-v2.5.6/layui/layui.all.js"></script>
<!-- 从工程名/(转至webapp)包/..  与url访问一样-->
</head>
<body class="window">

<fieldset class="layui-elem-field"  style="margin:20px; padding:20px;">
<legend>员工信息修改</legend>
<div class="layui-fiels-box">
<form class="layui-form layui-form-pane" method="post" lay-filter="form">
  <div class="layui-form-item">
    <label class="layui-form-label">编号</label>
    <div class="layui-input-inline">
      <input type="text" name="sno" required  lay-verify="required"  readonly placeholder="请输入编号" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">名称</label>
    <div class="layui-input-inline">
      <input type="text" name="name" required lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">年龄</label>
    <div class="layui-input-inline">
      <input type="text" name="age" required  lay-verify="required" placeholder="请输入年龄" autocomplete="off" class="layui-input">
    </div>
  </div> 
  <div class="layui-form-item">
    <label class="layui-form-label">性别</label>
    <div class="layui-input-inline">
      <input type="text" name="gender" required  lay-verify="required" placeholder="请输入性别" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">部门编号</label>
    <div class="layui-input-inline">
      <input type="text" name="dept_sno" required lay-verify="required" placeholder="请输入部门编号" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-inline">
   
      <input type="button"class="layui-btn" onclick="cancel()" value="取消">
      <input type="reset" class="layui-btn layui-btn-primary" value="重置"><!-- 不显色 -->
    </div>
    <input type="button"class="layui-btn" lay-submit lay-filter="upd" value="确认修改">
  </div>
</form>
</div>
 </fieldset>
 
<script>
var form=layui.form;
var $=layui.jquery;//也可以通过引用jquery.js文件来用$
var layer=layui.layer;
function cancel(){
	var index = parent.layer.getFrameIndex(window.name);//先得到当前iframe层的索引
	parent.layer.close(index);

}
function init(){
	var sno='<%=request.getParameter("sno")%>';
	$.ajax({
		url:'/demo1/employee/selectModel',
		type:'post',
		data:{sno:sno},
		datatype:'json',
	    success:function(d){
	    	console.log(d);
	    	form.val("form",{sno:d.sno,name:d.name,age:d.age,gender:d.gender,dept_sno:d.dept_sno});
	    }
	});
}
init();
form.on("submit(upd)",function(data){//layui的时间触发方式
	$.ajax({
		url:'/demo1/employee/update',
		type:'post',
		//data:{sno:sno,pass:pass},  //js对象写法
		//data:'sno='+sno+'&name='+name+'&pass='+pass,//参数
		data:data.field,
		dataType:'json',//java端返回给前端的数据    text:适用于string int等返回值
		success:function(d){//d就是从java端返回回来的数据
		    console.log(d.Sno);
		    if(d.Sno==1){
		    	layer.msg("修改成功");
		    	setTimeout(cancel,2000);
		    }	
		    else if(d.Sno==2){
		    	layer.msg("记录不存在");
		    }
		    else {
		    	layer.msg("修改失败");
		    	setTimeout(cancel,2000);
		    	}
		}
	});
});//添加监听
</script>

</body>
</html>

