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
	<title>公司信息</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script type="text/javascript" src="ui/layui.js"></script>
	<link href="ui/css/layui.css" rel="stylesheet"/>
	<style type="text/css">
		body{
		}
		.nav{
			position: fixed;
		    left: 0;
		    top: 0;
		    z-index: 10000;
		    width: 100%;
		    height: 60px;
		}
		.top{
			margin-top: 100px;
		}
		.layui-footer{
			left: 0px !important;
			position: static !important; 
			bottom:0px !important;
			background-color: #F2F2F2;
			margin-top: 30px
		}
	</style>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<!-- 顶部导航栏 -->
		<div class="layui-header layui-bg-cyan nav">
			<ul class="layui-nav" lay-filter="menu">
				<li class="layui-nav-item"><a href="jsp/jobhunter/jobLoginindex.jsp" >首页</a>
				<li class="layui-nav-item"><a href="jsp/jobhunter/jobLoginList.jsp" >公司列表</a>
				<li class="layui-nav-item layui-this"><a href="jsp/jobhunter/jobLoginShow.jsp" >公司信息</a>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="jsp/enterprise/enterprisesignup.jsp">企业版</a>
				<li class="layui-nav-item"><a href="index.jsp">注销</a>
			</ul>
		</div>
		
		<div class="layui-container top">
			<blockquote class="layui-elem-quote">基本信息</blockquote>
				<hr class="layui-bg-green">
			<table class="layui-table etable1" 
					lay-data="{
								url:'jobShowView.do',
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
			<table class="layui-table etable2" 
					lay-data="{
								url:'jobShowView.do',
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
			<table class="layui-table etable3" 
					lay-data="{
								url:'jobShowView.do',
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
			<table class="layui-table etable4" 
					lay-data="{
								url:'jobShowView.do',
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
			<table class="layui-table etable5" 
					lay-data="{
								url:'jobShowView.do',
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

		

		<!-- foot -->
		<div class="layui-footer">
			 <div class="layui-main">
			   <p>© 2020 <a href="/"></a></p>
			  </div>
		</div>	
	</div>
	
<script type="text/javascript">
	layui.use(["table"],function(){
		var table=layui.table;
		var url="jobShowView.do";
		
	});
</script>	

</body>
</html>