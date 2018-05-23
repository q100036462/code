<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>X-admin2.0</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />


    <link rel="stylesheet" href="${ctx}/static/css/font.css">
	<link rel="stylesheet" href="${ctx}/static/css/xadmin.css">
    <script type="text/javascript" src="${ctx}/static/jquery/jquery.min.js"></script>
    <script src="${ctx}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/static/js/xadmin.js"></script>

</head>
<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <div class="message">x-admin</div>
        <div id="darkbannerwrap"></div>
        
        <form action="${ctx }/login" method="post" class="layui-form" >
        	<h4 class="no-margins" style="color:red;">${error}</h4>
            <input name="username" placeholder="账号"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
            <hr class="hr15">
            <input type="text" name="validatecode"  class="form-control validatecode" placeholder="校验码"/>
            <img id="randImage" src="${ctx}/validatecode.jsp" onclick="loadimage();"/>
            <input value="登录" type="submit"  style="width:100%;" type="submit">
            <hr class="hr20" >
        </form>
    </div>

    <script>
        $(document).ready(function () {
	        $("#login_form").validate();
	    });
	    function loadimage() {
	        document.getElementById("randImage").src = "${ctx}/validatecode.jsp?" + Math.random();
	    }

        
    </script>

    
    
</body>
</html>