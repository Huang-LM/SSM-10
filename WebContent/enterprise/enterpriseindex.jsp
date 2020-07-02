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
	<title>企业主页</title>
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
		      <li class="layui-nav-item"><a href="">控制台</a></li>
		      <li class="layui-nav-item"><a href="">商品管理</a></li>
		      <li class="layui-nav-item"><a href="">用户</a></li>
		      <li class="layui-nav-item">
		        <a href="javascript:;">其它系统</a>
		        <dl class="layui-nav-child">
		          <dd><a href="">邮件管理</a></dd>
		          <dd><a href="">消息管理</a></dd>
		          <dd><a href="">授权管理</a></dd>
		        </dl>
		      </li>
		    </ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item">
					<a href="enterprise/enterprisesignin.jsp">注册</a>
				</li>
				<li class="layui-nav-item">
					<a href="">登录</a>
				</li>
		    </ul>
		</div>
	
	
	</div>

<script type="text/javascript">
	layui.use(["element"],function(){
		var element=layui.element;
		
	});

</script>

</body>
</html>