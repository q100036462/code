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
    <link rel="stylesheet" href="${ctx}/static/css/font.css">
    <link rel="stylesheet" href="${ctx}/static/css/xadmin.css">
    <script type="text/javascript" src="${ctx}/static/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/lib/layui/layui.js" charset="utf-8"></script>
    
  </head>
  
  <body>
  		<table  class="layui-table" id="layui_table_id"></table>  
        <div id="laypage"></div>
      	
      	
      	
      	<script type="text/javascript">
        //列表查询方法  
        	var page = 1;
            var pageSize = 10;
            layui.use(['table','laypage','laydate'], function(){  
                var table = layui.table,  
                    laydate=layui.laydate,  
                    laypage = layui.laypage; 
                
                table.render({  
                		elem: '#layui_table_id'
                		,height: 'full-350'
                	    ,url:'userlist2'
                	    ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                	      layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                	      ,limits:[5,10,15,20,25]
                	      ,first: false //不显示首页
                	      ,last: false //不显示尾页
                	      
                	    }
                    , cols: [[  
                        {field:'userId', title: 'ID', width: '100', sort: true}  
                        , {field:'username', title: '用户名', width: '150'}  
                        , {field:'password', title: '密码', width: '350'}  
                        , {field:'type', title: '用户状态', width: '120',templet: '#type'}  
                        , {field:'salt', title: '盐值', width: '120'}  
                    ]] 
                    
                });
            });  
  		</script>
  		<script type="text/javascript" id="type">
  			  {{#  if(d.type == 1){ }}
		  	    <span style="color: green">正常</span>
		  	  {{#  } else if(d.type == 0){ }}
		  		<span style="color: red">封禁</span>
		  	  {{#  } }}
  		</script>
  		
  		
  </body>

</html>