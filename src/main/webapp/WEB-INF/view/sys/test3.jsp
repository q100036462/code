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
  
  		
		<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
		<div id="main" style="width: 600px;height:400px;float: left;"></div>
		<div id="main2" style="width: 600px;height:400px;float: left;"></div>
		<div id="main3" style="width: 600px;height:400px;float: left;"></div>
		
    
    
    
    
    <script type="text/javascript" src="${ctx}/static/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/static/js/xadmin.js"></script>
    <script type="text/javascript" src="${ctx}/static/echarts/echarts.js"></script>
    <script type="text/javascript" src="${ctx}/static/echarts/theme/vintage.js"></script>
    <script>
    
		 // 基于准备好的dom，初始化echarts实例
		    var myChart = echarts.init(document.getElementById('main'),'light');
		    var myChart2 = echarts.init(document.getElementById('main2'),"dark");
		
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
		    
		    myChart2.setOption({
		    	//backgroundColor: '#2c343c',//div背景颜色，不设置是白色
		    	textStyle: {
		            color: 'rgba(255, 255, 255, 0.3)'
		        },
		        labelLine: {
		            lineStyle: {
		                color: 'rgba(255, 255, 255, 0.3)'
		            }
		        },
		        series : [
		            {
		                name: '访问来源',
		                type: 'pie',//图标
		                radius: '55%',
		                data:[
		                    {value:235, name:'视频广告'},
		                    {value:274, name:'联盟广告'},
		                    {value:310, name:'邮件营销'},
		                    {value:335, name:'直接访问'},
		                    {value:400, name:'搜索引擎'}
		                ],
		            	roseType : 'angle',
		            	/* itemStyle: {
		            	    // 阴影的大小
		            	    shadowBlur: 200,
		            	    // 阴影水平方向上的偏移
		            	    shadowOffsetX: 0,
		            	    // 阴影垂直方向上的偏移
		            	    shadowOffsetY: 0,
		            	    // 阴影颜色
		            	    shadowColor: 'rgba(0, 0, 0, 0.5)'
		            	} */
		            }
		        ]
		    })
		    
		    var myChart3 = echarts.init(document.getElementById('main3'),"vintage");
	         // 显示标题，图例和空的坐标轴
	         myChart3.setOption({
	             title: {
	                 text: '异步数据加载示例'
	             },
	             tooltip: {},
	             legend: {
	                 data:['销量']
	             },
	             xAxis: {
	                 data: []
	             },
	             yAxis: {},
	             series: [{
	                 name: '销量',
	                 type: 'bar',
	                 data: []
	             }]
	         });
	         myChart3.showLoading();    //数据加载完之前先显示一段简单的loading动画
	         var names=[];    //类别数组（实际用来盛放X轴坐标值）
	         var nums=[];    //销量数组（实际用来盛放Y坐标值）
	         
	         $.ajax({
	         type : "post",
	         async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
	         url : "selectAllGoods",    //请求发送到TestServlet处
	         data : {},
	         dataType : "json",        //返回数据形式为json
	         success : function(result) {
	             //请求成功时执行该函数内容，result即为服务器返回的json对象
	             if (result) {
	                    for(var i=0;i<result.length;i++){
	                        names.push(result[i].goodsName);    //挨个取出类别并填入类别数组
	                     }
	                    for(var i=0;i<result.length;i++){
	                        nums.push(result[i].num);    //挨个取出销量并填入销量数组
	                      }
	                    myChart3.hideLoading();    //隐藏加载动画
	                    
	                    myChart3.setOption({        //加载数据图表
	                        xAxis: {
	                            data: names
	                        },
	                        series: [{
	                            // 根据名字对应到相应的系列
	                            name: '销量',
	                            data: nums
	                        }]
	                    });
	             }
	        },
	         error : function(errorMsg) {
	             //请求失败时执行该函数
	         alert("图表请求数据失败!");
	         myChart3.hideLoading();
	         }
	    })
		    
		
	</script>
  </body>

</html>