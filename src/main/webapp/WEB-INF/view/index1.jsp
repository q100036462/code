<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>系统管理后台</title>
<!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->
<link href="${ctx}/static/plugins/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet">
<link href="${ctx}/static/css/animate.min.css" rel="stylesheet">
<link href="${ctx}/static/css/style.min.css" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg"
	style="overflow:hidden">
	<div id="wrapper">
		<!--左侧导航开始-->
		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="nav-close">
				<i class="fa fa-times-circle"></i>
			</div>
			<div class="sidebar-collapse">
				<ul class="nav" id="side-menu">
					<li class="nav-header">
						<div class="dropdown profile-element">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#"> <span
								class="clear"> <span class="block m-t-xs"><strong
										class="font-bold"><shiro:principal></shiro:principal></strong></span>
									<span class="text-muted text-xs block">超级管理员<b
										class="caret"></b></span>
							</span>
							</a>
							<ul class="dropdown-menu animated fadeInRight m-t-xs">
								<li><a class="J_menuItem" href="profile.html">个人资料</a></li>
								<li class="divider"></li>
								<li><a href="/logout">安全退出</a></li>
							</ul>
						</div>
						<div class="logo-element">ITAO</div>
					</li>

					<li class="active"><a href="#"><i class="fa fa-desktop"></i>
							<span class="nav-label">系统管理</span><span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="${ctx}/sys/user">用户管理</a></li>
							<li><a class="J_menuItem" href="${ctx}/sys/role">角色管理</a></li>
							<li><a class="J_menuItem" href="${ctx}/sys/resource">资源管理</a>
							</li>
						</ul></li>
				</ul>
			</div>
		</nav>
		<!--左侧导航结束-->
		<!--右侧部分开始-->
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<div class="row content-tabs">
				<button class="roll-nav roll-left J_tabLeft navbar-minimalize">
					<i class="fa fa-bars"></i>
				</button>
				<nav class="page-tabs J_menuTabs">
					<div class="page-tabs-content">
						<a href="javascript:;" class="active J_menuTab"
							data-id="index_v1.html">首页</a>
					</div>
				</nav>
				<button class="roll-nav roll-right J_tabRight">
					<i class="fa fa-forward"></i>
				</button>
				<div class="btn-group roll-nav roll-right">
					<button class="dropdown J_tabClose" data-toggle="dropdown">
						关闭操作<span class="caret"></span>
					</button>
					<ul role="menu" class="dropdown-menu dropdown-menu-right">
						<li class="J_tabShowActive"><a>定位当前选项卡</a></li>
						<li class="divider"></li>
						<li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
						<li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
					</ul>
				</div>
				<a href="${ctx}/logout" class="roll-nav roll-right J_tabExit"><i
					class="fa fa fa-sign-out"></i> 退出</a>
			</div>
			<div class="row J_mainContent" id="content-main">
				<iframe class="J_iframe" name="iframe0" width="100%" height="1024px"
					src="${ctx}/home.jsp" frameborder="0" data-id="index_v1.html"
					seamless></iframe>
			</div>
		</div>
		<!--右侧部分结束-->
	</div>
	<script src="${ctx}/static/plugins/jquery/jquery.js"></script>
	<script src="${ctx}/static/plugins/bootstrap/js/bootstrap.js"></script>
	<script src="${ctx}/static/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${ctx}/static/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="${ctx}/static/js/hplus.min.js"></script>
	<script src="${ctx}/static/js/contabs.min.js"></script>
</body>
</html>