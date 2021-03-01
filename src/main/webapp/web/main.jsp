<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>layout 后台大布局</title>
 <link rel="stylesheet" href="/demo1/layui-v2.5.6/layui/css/layui.css" media="all">
<script type="text/javascript" src="/demo1/base/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/demo1/layui-v2.5.6/layui/layui.all.js"></script>
</head>

<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">气象检测平台</div>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;"><!-- 事件为空，什么也不做 -->
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    旗巅
        </a>
        <dl class="layui-nav-child">
          <dd><a href="Javascript:goUser()">基本资料</a></dd>
          <dd><a href="Javascript:goPass()">修改密码</a></dd>
           <dd><a href="Javascript:goImg()">修改头像</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="/demo1/web/login.jsp">退出</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll"><!-- ul.li.dl.dd -->
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">信息管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:openURL('/web/page/device/list.jsp');">设备信息管理</a></dd>
            <dd><a href="javascript:openURL('/web/page/weather/list.jsp');">天气信息管理</a></dd>
            <dd><a href="javascript:openURL('/web/page/users/list.jsp');">用户信息管理</a></dd>
            <!-- <dd><a href="">超链接</a></dd> -->
          </dl>
        </li>
        <li class="layui-nav-item">
         <a href="javascript:;">数据可视化</a>
          <dl class="layui-nav-child">
       <dd class="layui-nav-item"><a href="javascript:openURL('/web/page/echarts/b.jsp');">基础数据图表</a></dd>
       <dd class="layui-nav-item"><a href="javascript:openURL('/web/page/echarts/map2.jsp');">传感器数量分布</a></dd>
        <dd class="layui-nav-item"><a href="javascript:openURL('/web/page/echarts/map3.jsp');">实时天气地图</a></dd>
          </dl>
        </li> 
      <!-- <li class="layui-nav-item"><a href="javascript:openURL('/web/page/echarts/b.jsp');">数据可视化</a></li>
       <li class="layui-nav-item"><a href="javascript:openURL('/web/page/echarts/map.jsp');">map</a></li>
       <li class="layui-nav-item"><a href="javascript:openURL('/web/page/echarts/map2.jsp');">map2</a></li>
        <li class="layui-nav-item"><a href="javascript:openURL('/web/page/echarts/map3.jsp');">map3</a></li> -->
<!-- <li class="layui-nav-item"><a href="javascript:openURL('/web/page/echarts/a.jsp');" class="site-demo-active" data-url="/web/login.jsp">test</a></li> -->
    
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <!-- <div class="layui-anim layui-anim-rotate">zhj</div> -->
 <!--    <i class="layui-icon layui-icon-ios" style="font-size: 300px; color: #1E9FFF;"></i>  -->
    <iframe name="zhj" width="99%" height="97%" src="/demo1/web/use.jsp"></iframe><!-- 在网页中内嵌其他子页面 -->
  </div>
  
  <div class="layui-footer"> <!-- 底部固定区域 -->
    基于物联网的气象台站
  </div>
</div>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  element.render();
});

function openURL(url){
	window.open('/demo1'+url,"zhj");//第二个参数为iframe位置的名字
}
var $=layui.jquery;
$('.site-demo-active').click(function(){
	window.open('/demo1' + $(this).data('url'),"zhj");
});
function goUser(){
	location.href="/demo1/web/userInfo.jsp";
}
function goPass(){
	location.href="/demo1/web/userPass.jsp";
}
function goImg(){
	location.href="/demo1/web/userImg.jsp";
}
</script>
</body>
</html>