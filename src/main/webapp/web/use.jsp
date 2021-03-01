<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css 叠层样式表 -->
<style type="text/css">
.aa{/*类选择器*/
color: red
}
</style>
<link rel="stylesheet" href="/demo1/layui-v2.5.6/layui/css/layui.css" media="all">
<script type="text/javascript" src="/demo1/base/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/demo1/layui-v2.5.6/layui/layui.all.js"></script>
<!-- 从工程名/(转至webapp)包/..  与url访问一样-->
</head>
<body>
<div class="layui-carousel" id="test1">
<div carousel-item>
<div><img src="/demo1/base/img/2.jpeg"></div>
<div><img src="/demo1/base/img/3.jpeg"></div>
<div><img src="/demo1/base/img/4.jpeg"></div>
<div><img src="/demo1/base/img/5.jpeg"></div>
</div>
</div>
<!-- <form class="aa" > -->
<!-- <form style="color:red;font-size:20px">
hfdjfdjkhf  ctrl+shift+/
账号	<input type="text" name="sno"><br>
密码	<input type="password" name="pass"><br>
<input type="button" value="登录" onclick="test()"> 
button 点击触发 事件
</form> -->

<script type="text/javascript">
var carousel=layui.carousel;
carousel.render({ //渲染  impotant
	elem: '#test1',
	width: '100%',
	arrow: 'always'
});


var a=1;//var 的变量定义的时候不确定，只有在赋值时才能确定
var b='abc';//单双引号都可以
var d={a:1,b:2}//js对象
function test(){//方法关键字 方法名 方法参数 方法体    发送请求到java后台
	//alert(123);
	//1，获取输入框中的内容 2，发送请求 （带参）3，根据结果将信息反馈给用户
	//$代表jquery
	var sno=$("input[name='sno']").val();
	var pass=$("input[name='pass']").val();
	$.ajax({
		url:'/demo1/employee/login',
		type:'post',
		data:{sno:sno,pass:pass},  //js对象写法
		//data:'sno='+sno+'&name='+name+'&pass='+pass,//参数
		dataType:'json',//java端返回给前端的数据    text:适用于string int等返回值
		success:function(d){//d就是从java端返回回来的数据
			//alert(d.Sno);
		    console.log(d.Sno);
		    if(d.Sno==1)
		    	alert("账号错误");
		    else if(d.Sno==0)
		    	alert("登陆成功");
		    	else if(d.Sno==2){
		    		alert("密码错误");
		    	}
		}
	});
}
</script>

</body>
</html>