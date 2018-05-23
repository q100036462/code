<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>X-admin2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="${ctx}/static/lib/layui/css/layui.css">
    
  </head>
  
  <body>
    <form class="layui-form"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
	 	<input type="radio" name="sex" lay-filter="erweima" value="显示" title="显示" checked="checked">
		<input type="radio" name="sex" lay-filter="erweima" value="隐藏" title="隐藏" >
		<input type="text" id="radio-1" value="133" >
	</form>
    
    
    
    <script type="text/javascript" src="${ctx}/static/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/static/js/xadmin.js"></script>
    <script>
		layui.use('form', function(){
		  var form = layui.form;
		  
		  form.on('radio(erweima)', function (data) {
		  		//alert(data.value);//判断单选框的选中值
	            if(data.value == '显示'){
	            	$("#radio-1").removeClass("layui-hide");
	            }
	            if(data.value == '隐藏'){
	            	$("#radio-1").addClass("layui-hide")
	            }
	            
	            
	        });
		  
		  //各种基于事件的操作，下面会有进一步介绍
		});
</script>
  </body>

</html>