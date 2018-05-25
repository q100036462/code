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
    <link rel="stylesheet" href="${ctx}/static/css/font.css">
    <link rel="stylesheet" href="${ctx}/static/css/xadmin.css">
    <script type="text/javascript" src="${ctx}/static/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/static/lib/layui/layui.all.js" charset="utf-8"></script>
    
  </head>
  
<body>
	<table class="layui-table" style="width: 800px">
	  <thead>
	    <tr>
	      <th>ID</th>
		  <th>用户名</th>
		  <th>密码</th>
		  <th>用户状态</th>
		  <th>盐值</th>
		  <th>操作</th>
	    </tr>
	  </thead>
	  <tbody id="tbody">

	  </tbody>
	</table>
	<div id="page1"></div>
</body>
<script type="text/javascript">


layui.use('laypage', function(){
  var laypage = layui.laypage;
  var url = "userlist";
  var config = {page:1,pageSize:10};
  $.getJSON(url,config,function(res){
	  laypage.render({
		    elem: 'page1',
		    count: res.count, //总条数
		    theme: '#FFB800', //自定义颜色
		    limits: [5,10,15,20,25],
		    layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip'],
		    jump: function(obj, first){
		        if(!first){ //首次则不进入
		        	config.page = obj.curr;
		        	config.pageSize = obj.limit;
		        	getUserListByPage(url,config);
		        }
		    }
	   });
	  parseUserList(res,config.page);  
  }); 

});
//点击页数从后台获取数据
function getUserListByPage(url,config){
	$.getJSON(url,config,function(res){
		parseUserList(res,config.page);
	});
}

//解析数据，currPage参数为预留参数，当删除一行刷新列表时，可以记住当前页而不至于显示到首页去
function parseUserList(res,currPage){
	var content = "";
	$.each(res.data, function (i, o) {
		content += "<tr>";
		content += "<td>"+o.userId+"</td>";
		content += "<td>"+o.username+"</td>";
		content += "<td>"+o.password+"</td>";
		content += "<td>"+o.type+"</td>";
		content += "<td>"+o.salt+"</td>";
		content += "<td><a>删除</a></td>";
		content += "</tr>";
	});
	$('#tbody').html(content);
}

</script>


</html>