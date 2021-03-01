<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>员工部门修改</title>
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
<legend>员工部门修改</legend>
<div class="layui-fiels-box">
<form class="layui-form layui-form-pane" method="post" lay-filter="form">
  <div class="layui-form-item">
    <label class="layui-form-label">编号</label>
    <div class="layui-input-inline">
      <input type="text" name="sno" required  lay-verify="required"  placeholder="请输入编号" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">员工部门</label>
    <div class="layui-input-inline">
     <select name="deptName">
   <!--   <option value="zhj">sdds</option> -->
  </select>
    </div>
  </div> 
 
  <div class="layui-form-item">
    <div class="layui-input-inline">
   
      <input type="button"class="layui-btn" onclick="cancel()" value="取消">
      <input type="reset" class="layui-btn layui-btn-primary" value="重置"><!-- 不显色 -->
    </div>
    <input type="button"class="layui-btn" lay-submit lay-filter="setDept" value="确认修改">
  </div>
</form>
</div>
 </fieldset>
 
<script>
var form=layui.form;
var $=layui.jquery;//也可以通过引用jquery.js文件来用$
var layer=layui.layer;//弹窗模块
function cancel(){
	var index = parent.layer.getFrameIndex(window.name);//先得到当前iframe层的索引
	parent.layer.close(index);
}
init();
var sno='<%=request.getParameter("sno")%>';
var deptName='<%=request.getParameter("dept_sno")%>';
function init(){
	$.ajax({
		url:'/demo1/department/selectList',
		type:'post',
		data:'',
		datatype:'json',
	    success:function(d){
	    	var temp='';
	    	$.each(d,function(){//遍历   d中的每一个元素
	    		var t='<option value="'+this.sno+'">'+this.name+'</option>';
	    		temp=temp+t;
	    	})
	    	$("select[name='deptName']").html(temp);//标签选择器
	    	
	    	form.render();
	    	init1();
	    	/* form.val("form",{sno:sno,deptName:deptName});
	    	console.log(deptName); */
	    	/* $("input[name='sno']").val(sno);
	    	$("select[name='dept_sno']").val(dept_sno); */
	    	
	    }
	});
}
function init1(){//异步请求，局部刷新
	$.ajax({
		url:'/demo1/employee/selectModel',
		type:'post',
		data:{sno:sno},
		datatype:'json',
	    success:function(d){
	    	console.log(d);
	    	form.val("form",{sno:d.sno,deptName:d.dept_sno});  	
	    }
	});
}
form.on("submit(setDept)",function(data){//layui的时间触发方式
	var deptS=$("select[name=deptName]").val();
	var sno=$("input[name=sno]").val();
	$.ajax({
		url:'/demo1/employee/setDept',
		type:'post',
		//data:{sno:sno,pass:pass},  //js对象写法
		//data:'sno='+sno+'&name='+name+'&pass='+pass,//参数
		data:{sno:sno,dept_sno:deptS},
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

