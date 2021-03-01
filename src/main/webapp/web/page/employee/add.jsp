<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>员工信息添加</title>
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
<legend>员工信息添加</legend>
<div class="layui-fiels-box">
<form class="layui-form layui-form-pane" method="post">
  <div class="layui-form-item">
    <label class="layui-form-label">编号</label>
    <div class="layui-input-inline">
      <input type="text" name="sno" required  lay-verify="required" placeholder="请输入编号" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">名称</label>
    <div class="layui-input-inline">
      <input type="text" name="name" required lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-inline">
      <input type="text" name="pass" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
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
    <input type="button"class="layui-btn" lay-submit lay-filter="add" value="确认添加">
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
form.on("submit(add)",function(data){//layui的时间触发方式
	$.ajax({
		url:'/demo1/employee/insert',
		type:'post',
		//data:{sno:sno,pass:pass},  //js对象写法
		//data:'sno='+sno+'&name='+name+'&pass='+pass,//参数
		data:data.field,
		dataType:'json',//java端返回给前端的数据    text:适用于string int等返回值
		success:function(d){//d就是从java端返回回来的数据
		    console.log(d.Sno);
		    if(d.Sno==1){
		    	layer.msg("添加成功");
		    	setTimeout(cancel,3000);
		    }
		    	
		    else if(d.Sno==2){
		    	layer.msg("编号已存在");
		    }
		    else {
		    	layer.msg("添加失败");
		    	setTimeout(cancel,3000);
		    	}
		}
	});
});//添加监听
function goJspLogin(){
	location.href="/demo1/web/login.jsp";
}
</script>

</body>
</html>

