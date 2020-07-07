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
	<title>发布招聘信息</title>
	<script type="text/javascript" src="ui/layui.js"></script>
	<link href="ui/css/layui.css" rel="stylesheet"/>
	<style type="text/css">
		.top{
			margin-top:50px;
		}
	</style>
</head>

<body>
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">招聘系统</div>
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="index.jsp" >首页</a>
				<li class="layui-nav-item"><a href="jsp/enterprise/enterprisemanage.jsp" >企业</a>
		    	<li class="layui-nav-item layui-this"><a href="javascript:void(0);" >修改企业信息</a>
		    	<li class="layui-nav-item">
					<a href="javascript:;">招聘信息</a>
					<dl class="layui-nav-child">
					<dd><a href="javascript:void(0);">发布招聘信息</a></dd>
					<hr>
					<dd><a href="javascript:void(0);">管理招聘信息</a></dd>
					</dl>
				</li>
		    </ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item layui-this">
					<a href="javascript:void(0);" ></a>
				</li>
				<li class="layui-nav-item">
					<a href="jsp/enterprise/enterprisesignin.jsp">注销</a>
				</li>
		    </ul>
		</div>
		
		
		
		
	
	</div>

</body>
</html>