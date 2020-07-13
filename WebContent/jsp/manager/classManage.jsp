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
	<title>行业类别管理</title>
	<script type="text/javascript" src="ui/layui.js"></script>
	<link href="ui/css/layui.css" rel="stylesheet"/>
	<style type="text/css">
	</style>
</head>

<body>
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">后台管理系统</div>
				<ul class="layui-nav layui-layout-left" lay-filter="nav1">
				</ul>
		</div>
		<div class="layui-side layui-bg-cyan">
			<ul class="layui-nav layui-nav-tree" lay-filter="menu">
				<li class="layui-nav-item" ><a href="jsp/manager/businessMessage.jsp">企业信息查询</a></li>
				<li class="layui-nav-item" ><a href="jsp/manager/inquireRecords.jsp">招聘记录查询</a></li>
				<li class="layui-nav-item layui-this" ><a href="javascript:void(0);">行业类别管理</a></li>
				<li class="layui-nav-item" ><a href="jsp/manager/jobhunterMessage.jsp">求职者信息查询</a></li>
				<li class="layui-nav-item" ><a href="jsp/manager/jbhunterAdd.jsp">添加求职者信息</a></li>  
			</ul>
		</div>
	
		<div class="layui-body">
			<table id="classTable" lay-filter="bsTable" class="layui-table" lay-data="{url:'showBusiness.do',
																						even:true}">
				<thead>
					<tr>
					<th lay-data="{field:'bsname',width:'300',title:'企业名称'}"></th>
					<th lay-data="{field:'bspname',width:'150',title:'企业法人姓名'}"></th>
					<th lay-data="{field:'bsid',width:'200',title:'企业工商注册号'}"></th>
					<th lay-data="{field:'bsclass',width:'300',title:'行业类别'}"></th>
					<th lay-data="{title:'修改',width:'150',templet:function(cd){																
																return '<a class=\'layui-btn layui-btn-danger layui-btn-sm\' lay-event=\'edit\' href=\'jsp/manager/updateClass.jsp\'>修改行业类别</a>';
															}}"></th>
					</tr>
				</thead>
			</table>
		</div>
		<div class="layui-footer footer footer-doc">
			<div class="layui-main">
		    	<p>© 2020-码农招聘管理系统 <a href="/"></a></p>
		    </div>
		 </div>
	</div>

<script type="text/javascript">
	layui.use(["table","jquery"],function(){
	});
</script>

</body>
</html>