<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
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

<fieldset class="layui-elem-field" style="margin:20px; padding:20px;">
<legend>注册</legend>
<div class="layui-fiels-box">
<form class="layui-form layui-form-pane" method="post">
  <div class="layui-form-item">
    <label class="layui-form-label">账号</label>
    <div class="layui-input-inline">
      <input type="text" name="name" required  lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-inline">
      <input type="password" name="passwd" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-inline">
      <input type="button" class="layui-btn"  value="注册" onclick="goJspreg()">
      <input type="reset" class="layui-btn layui-btn-primary" value="重置">
      
    </div>
    <input type="button" class="layui-btn" lay-submit lay-filter="log" value="登录" >
  </div>
</form>
</div>
 </fieldset>
<script>
var form=layui.form;
var $=layui.jquery;
var layer=layui.layer;
form.on("submit(log)",function(data){//layui的事件触发方式
	$.ajax({
		url:'/demo1/users/login',
		type:'post',
		data:data.field,
		dataType:'json',
		success:function(d){
		    console.log(d.Sno);
		    if(d.Sno==1)
		    	layer.msg("用户不存在");
		    else if(d.Sno==0){
		    	layer.msg("登录成功");
		    	location.href="/demo1/web/main.jsp";
		    }	
		    else {
		    	layer.msg("密码错误");
		    	}
		}
	});
});//添加监听

function goJspreg(){
	location.href="/demo1/web/reg.jsp";
}
</script>

</body>
</html>

