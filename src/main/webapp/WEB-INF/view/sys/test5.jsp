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
  		<table class="layui-table" id="layui_table_id" lay-filter="test"></table>  
         	  
      	
      	<div id="laypage"></div>
      	
      	
      	
      	<script type="text/javascript">
	      	var limitcount = 10;  
	        var curnum = 1;  
	        //列表查询方法  
	        function productsearch(curnum,limitsize) {  
	            layui.use(['table','laypage','laydate'], function(){  
	                var table = layui.table,  
	                    laydate=layui.laydate,  
	                    laypage = layui.laypage;  
	                table.render({  
	                    elem: '#layui_table_id'  
	                    , url: 'userlist?page='+ curnum+ '&pageSize=' + limitsize  
	                    , cols: [[  
	                        {field:'userId', title: 'ID', width: '170', sort: true}  
	                        , {field:'username', title: '用户名', width: '450'}  
	                        , {field:'password', title: '密码', width: '100'}  
	                        , {field:'type', title: '用户状态', width: '120'}  
	                        , {field:'salt', title: '盐值', width: '120'}  
	                    ]] 
	                    ,done: function(res, curr, count){  
	                        //如果是异步请求数据方式，res即为你接口返回的信息。  
	                        //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度  
	                        
	                        laypage.render({  
	                        	elem: 'laypage'
	                        	,count: res.count
	                        	,limits:[5,10,15,20,25]
	                        	,layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
	                            ,jump:function (obj,first) { 
	                                if(!first){  
	                                    curnum = obj.curr;  
	                                    limitcount = obj.limit;  
	                                    //console.log("curnum"+curnum);  
	                                    //console.log("limitcount"+limitcount);  
	                                    //layer.msg(curnum+"-"+limitcount);  
	                                    productsearch(curnum,limitcount);  
	                                }  
	                            }  
	                        })  
	                    }  
	                })  
	       
	                //监听工具条  
	                table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"  
	                    var data = obj.data //获得当前行数据  
	                        ,layEvent = obj.event; //获得 lay-event 对应的值  
	                    if(layEvent === 'detail'){  
	                        viewLableInfo(data.attrId);  
	                        layer.msg(data.attrId);  
	                    } else if(layEvent === 'del'){  
	                        layer.msg('删除');  
	                    } else if(layEvent === 'edit'){  
	                        layer.msg('编辑操作');  
	                    }  
	                });  
	                //常规用法  
	                laydate.render({  
	                    elem: '#createDate'  
	                });  
	                //常规用法  
	                laydate.render({  
	                    elem: '#processingTime'  
	                });  
	       
	            });  
	        }  
	        
	    productsearch(curnum, limitcount);  
      	</script>
  		
  		
  </body>

</html>