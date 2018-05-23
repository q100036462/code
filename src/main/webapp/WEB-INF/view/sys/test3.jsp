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
  
  		<body>
		    <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
		    <div id="main" style="width: 600px;height:400px;"></div>
		</body>
    
    
    
    
    <script type="text/javascript" src="${ctx}/static/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/static/js/xadmin.js"></script>
    <script type="text/javascript" src="${ctx}/static/echarts/echarts.js"></script>
    <script>
    
		 // 基于准备好的dom，初始化echarts实例
		    var myChart = echarts.init(document.getElementById('main'));
		
		    // 指定图表的配置项和数据
		    var option = {
		        title: {
		            text: 'ECharts 入门示例'
		        },
		        tooltip: {},
		        legend: {
		            data:['销量']
		        },
		        xAxis: {
		            data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
		        },
		        yAxis: {},
		        series: [{
		            name: '销量',
		            type: 'bar',
		            data: [5, 20, 36, 10, 10, 20]
		        }]
		    };
		
		    // 使用刚指定的配置项和数据显示图表。
		    myChart.setOption(option);
		
	</script>
  </body>

</html>