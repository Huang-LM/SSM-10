<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>企业管理</title>
	<script type="text/javascript" src="ui/layui.js"></script>
	<link href="ui/css/layui.css" rel="stylesheet"/>
	<style type="text/css">
	</style>
	<script type="text/javascript" src="ui/layui.js"></script>
</head>

<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">招聘系统</div>
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="index.jsp" >首页</a>
				<li class="layui-nav-item layui-this"><a href="javascript:void(0);" >企业</a>
		    
		    </ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item">
					
				</li>
				<li class="layui-nav-item layui-this">
					<a href="jsp/enterprise/enterprisesignup.jsp">退出登录</a>
				</li>
		    </ul>
		</div>

	</div>


</body>
</html>