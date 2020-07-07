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
	<title>公司列表</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script type="text/javascript" src="ui/layui.js"></script>
	<link href="ui/css/layui.css" rel="stylesheet"/>
	<style type="text/css">
		body{
			background-color: #F2F2F2;
		}
		.nav{
			position: fixed;
		    left: 0;
		    top: 0;
		    z-index: 10000;
		    width: 100%;
		    height: 60px;
		}
		.btable{
			margin-top: 100px;
			margin-button: 50px;
		
		}
		
		.layui-footer{
			left: 0px !important;
			position: static !important;
			bottom:0px !important;
			background-color: #ffffff !important;
		}
	</style>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<!-- 顶部导航栏 -->
		<div class="layui-header layui-bg-cyan nav">
			<ul class="layui-nav" lay-filter="menu">
				<li class="layui-nav-item"><a href="index.jsp" >首页</a>
				<li class="layui-nav-item layui-this"><a href="jsp/jobhunter/jobList.jsp" >公司列表</a>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="jsp/enterprise/enterprisesignup.jsp">企业版</a>
				<li class="layui-nav-item"><a href="jsp/jobhunter/jobLogin.jsp">登录</a>
				<li class="layui-nav-item"><a href="jsp/jobhunter/jobEnrol.jsp">注册</a>
			</ul>
		</div>
		
		<div class="layui-container btable">
			<table 
					lay-data="{ url:'showBsjson.do', even: true, limit: 10, height: 800, cellMinWidth: 30}" 
					class="layui-table" 
					lay-filter="demo" >
				<thead>
					<tr>
				      <th lay-data="{field:'bsname', minWidth: 300}">企业名称</th>
				      <th lay-data="{field:'bsclass'}">行业类别</th>
				      <th lay-data="{field:'bsposition', minWidth: 280, sort: true}">职位</th>
				      <th lay-data="{field:'bspay', sort: true}">薪资</th>
				       <th lay-data="{fixed: 'right', align:'center', toolbar: '#barDemo'}"></th>
					</tr>
				</thead>	
			</table>
		</div>
		
		<script type="text/html" id="barDemo">
       		<a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
		</script>

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
/* 		table.render({
			elem:"#bsTable",
			url:"showBsjson.do",
			cols:[[
				{field:"bsname",title:"企业名称",width:300},
				{field:"bsclass",title:"行业类别",width:150},
				{field:"bsposition",title:"职位",width:280},
				{field:"bspay",title:"薪资",width:150, sort: true},
			]]
			,page: true
			,even: true 
			,limit: 10
			,height: 500 
		}); */
		
		table.on('tool(demo)', function(obj){
		    var data = obj.data;
		    if(obj.event === 'detail'){
		      layer.msg('ID：'+ data.bsname + ' 的查看操作');
		    } 
		  });
	});
</script>	

</body>
</html>