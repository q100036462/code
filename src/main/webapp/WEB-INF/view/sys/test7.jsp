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
  		
		 
		<div style="margin-top: 10px" class="layui-btn-group demoTable">
		  <button class="layui-btn" data-type="getCheckData">获取选中行数据</button>
		  <button class="layui-btn" data-type="getCheckLength">获取选中数目</button>
		  <button class="layui-btn" data-type="isAll">验证是否全选</button>
		</div>
		 
		<table class="layui-table" lay-data="{height: 'full-250', cellMinWidth: 80,  url:'userlist2', page:true,limits:[5,10,15,20], id:'idTest'}" lay-filter="demo">
		  <thead>
		    <tr>
		      <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
		      <th lay-data="{field:'userId', width:80, sort: true, fixed: true}">ID</th>
		      <th lay-data="{field:'username',edit: 'text', width:150}">用户名</th>
		      <th lay-data="{field:'password',edit: 'password', width:350, sort: true}">密码</th>
		      <th lay-data="{field:'type', width:150,templet: '#type'}">用户状态</th>
		      <th lay-data="{field:'salt', width:150}">盐值</th>
		      <th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}"></th>
		    </tr>
		  </thead>
		</table>
		
		<
		 
		<script type="text/html" id="barDemo">
  			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  			<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		</script>
		<script>
			layui.use(['form','table'], function(){
			  var table = layui.table;
			  var form = layui.form;
			  
				//监听用户状态操作
			  form.on('switch(lockDemo)', function(obj){
			  	this.value=(obj.elem.checked?1:0);
			    layer.tips(this.value + ' ' + this.name + '：'+ obj.elem.checked, obj.othis);
			  });
				
			  //监听表格复选框选择
			  table.on('checkbox(demo)', function(obj){
			    console.log(obj)
			  });
			//监听工具条
			  table.on('tool(demo)', function(obj){
			    var data = obj.data;
			    if(obj.event === 'detail'){
			      layer.msg('ID：'+ data.userId + ' 的查看操作');
			    } else if(obj.event === 'del'){
			      layer.confirm('真的删除行么', function(index){
			        obj.del();
			        layer.close(index);
			      });
			    } else if(obj.event === 'edit'){
			      layer.alert('编辑行：<br>'+ JSON.stringify(data))
			    }
			  });
			  
			  var $ = layui.$, active = {
			    getCheckData: function(){ //获取选中数据
			      var checkStatus = table.checkStatus('idTest')
			      ,data = checkStatus.data;
			      layer.alert(JSON.stringify(data));
			    }
			    ,getCheckLength: function(){ //获取选中数目
			      var checkStatus = table.checkStatus('idTest')
			      ,data = checkStatus.data;
			      layer.msg('选中了：'+ data.length + ' 个');
			    }
			    ,isAll: function(){ //验证是否全选
			      var checkStatus = table.checkStatus('idTest');
			      layer.msg(checkStatus.isAll ? '全选': '未全选')
			    }
			  };
			  
			  $('.demoTable .layui-btn').on('click', function(){
			    var type = $(this).data('type');
			    active[type] ? active[type].call(this) : '';
			  });
			});
		</script>
		<script type="text/javascript" id="type">
			<input type="checkbox" name="type" value="{{d.type}}" lay-skin="switch" lay-text="正常|封禁" lay-filter="lockDemo" {{ d.type == 1 ? 'checked' : '' }}>
  		</script>
  		
  		
  </body>

</html>