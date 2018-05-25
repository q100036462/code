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
    
  </head>
  
  <body>
  
  		<form class="layui-form layui-col-md12  layui-form-pane">
           <div class="layui-form-item" id="x-city">
            <label class="layui-form-label">城市联动</label>
            <div class="layui-input-inline">
              <select name="province" lay-filter="province">
                <option value="">请选择省</option>
              </select>
            </div>
            <div class="layui-input-inline">
              <select name="city" lay-filter="city">
                <option value="">请选择市</option>
              </select>
            </div>
            <div class="layui-input-inline">
              <select name="area" lay-filter="area">
                <option value="">请选择县/区</option>
              </select>
            </div>
          </div>
        </form>
		<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
		<div id="main" style="width: 600px;height:400px;float: left;"></div>
		<div id="page1"></div>
    
    
    
    
    <script type="text/javascript" src="${ctx}/static/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/static/js/xadmin.js"></script>
    <script type="text/javascript" src="${ctx}/static/echarts/echarts.js"></script>
    <script type="text/javascript" src="${ctx}/static/echarts/theme/vintage.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/xcity.js"></script>
    <script>
    
		 // 基于准备好的dom，初始化echarts实例
		    var myChart = echarts.init(document.getElementById('main'));
		
		    // 指定图表的配置项和数据
		    var option = {
		    	    legend: {},
		    	    tooltip: {},
		    	    dataset: {
		    	        // 提供一份数据。
		    	        source: [
		    	            ['product', '2015', '2016', '2017'],
		    	            ['Matcha Latte', 43.3, 85.8, 93.7],
		    	            ['Milk Tea', 83.1, 73.4, 55.1],
		    	            ['Cheese Cocoa', 86.4, 65.2, 82.5],
		    	            ['Walnut Brownie', 72.4, 53.9, 39.1]
		    	        ]
		    	    },
		    	    // 声明一个 X 轴，类目轴（category）。默认情况下，类目轴对应到 dataset 第一列。
		    	    xAxis: {type: 'category'},
		    	    // 声明一个 Y 轴，数值轴。
		    	    yAxis: {},
		    	    // 声明多个 bar 系列，默认情况下，每个系列会自动对应到 dataset 的每一列。
		    	    series: [
		    	        {type: 'bar'},
		    	        {type: 'bar'},
		    	        {type: 'bar'}
		    	    ]
		    	}
		
		    // 使用刚指定的配置项和数据显示图表。
		    myChart.setOption(option);
		    
		    layui.use(['form','code','laypage'], function(){
		        form = layui.form;
		        var laypage = layui.laypage;

		        layui.code();

		        $('#x-city').xcity('广东','广州市','东山区');

		      });
		    
		    layui.use(['laypage', 'layer'], function(){
		    	  var laypage = layui.laypage;
		    	  var layer = layui.layer;
		    	  var url = "/userlist";
		    	  var config = {page:1,pageSize:4};
		    	  $.getJSON(url,config,function(res){
		    		  laypage.render({
		    			    elem: 'page1',
		    			    count: res.total, //总条数
		    			    limit:config.pageSize, //每页条数
		    			    theme: '#FFB800', //自定义颜色
		    			    jump: function(obj, first){
		    			    	alert(obj.curr);
		    			    }
		    		   });
		    		  
		    	  }); 

		    	});
		    
		
	</script>
  </body>

</html>