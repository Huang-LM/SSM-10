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
		.top{
			margin-top:50px;
		}
	</style>
</head>

<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">招聘系统</div>
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="index.jsp" >首页</a>
				<li class="layui-nav-item layui-this"><a href="javascript:void(0);" >企业</a>
		    	<li class="layui-nav-item"><a href="jsp/enterprise/alterEnterpriseInfor.jsp" >修改企业信息</a>
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
		
		<div class="layui-container top">
			<blockquote class="layui-elem-quote">基本信息</blockquote>
			<hr class="layui-bg-green">
			<table id="entTable1" class="layui-table" lay-data="{url:'findEntInfor.do',
																parseData:function(res){
																	return {
																		code:0,
																		msg:'企业信息',
																		count:1,
																		data:res
																	};
																}}">
				<thead>
					<tr>
					<th lay-data="{field:'bsname',title:'企业名称'}"></th>
					</tr>
				</thead>
			</table>
			<table id="entTable2" class="layui-table" lay-data="{url:'findEntInfor.do',
																parseData:function(res){
																	return {
																		code:0,
																		msg:'企业信息',
																		count:1,
																		data:res
																	};
																}}">
				<thead>
					<tr>
					<th lay-data="{field:'bspname',title:'企业法人姓名'}"></th>
					</tr>
				</thead>
			</table>
			<table id="entTable3" class="layui-table" lay-data="{url:'findEntInfor.do',
																parseData:function(res){
																	return {
																		code:0,
																		msg:'企业信息',
																		count:1,
																		data:res
																	};
																}}">
				<thead>
					<tr>
					<th lay-data="{field:'bsclass',title:'行业类别'}">
					</tr>
				</thead>
			</table>
			<table id="entTable4" class="layui-table" lay-data="{url:'findEntInfor.do',
																parseData:function(res){
																	return {
																		code:0,
																		msg:'企业信息',
																		count:1,
																		data:res
																	};
																}}">
				<thead>
					<tr>
					<th lay-data="{field:'bsintr',title:'简介'}"></th>
					</tr>
				</thead>
			</table>
			<table id="entTable5" class="layui-table" lay-data="{url:'findEntInfor.do',
																parseData:function(res){
																	return {
																		code:0,
																		msg:'企业信息',
																		count:1,
																		data:res
																	};
																}}">
				<thead>
					<tr>
					<th lay-data="{field:'bsculture',title:'公司文化'}"></th>
					</tr>
				</thead>
			</table>
		</div>	
		
		<div class="layui-container top">
			<blockquote class="layui-elem-quote">招聘信息</blockquote>
			<hr class="layui-bg-green">
			<table id="posTable" class="layui-table" lay-data="{url:'entFindPosition.do',
																parseData:function(res){
																	return {
																		code:0,
																		msg:'招聘信息',
																		count:res.length,
																		data:res
																	};
																}}">
				<thead>
					<tr>
					<th lay-data="{field:'bsname',title:'企业名称'}"></th>
					<th lay-data="{field:'bsclass',title:'行业类别'}"></th>
					<th lay-data="{field:'bsposition',title:'职位'}"></th>
					<th lay-data="{field:'bspay',title:'薪资'}"></th>
					</tr>
				</thead>
			</table>
		
		</div>
		

	</div>

<script type="text/javascript">
	layui.use("table",function(){
	});

</script>

</body>
</html>