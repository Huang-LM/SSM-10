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
	<title>企业审核</title>
	<script type="text/javascript" src="ui/layui.js"></script>
	<link href="ui/css/layui.css" rel="stylesheet"/>
	<style type="text/css">
	</style>
</head>

<body>
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">后台管理系统</div>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item">
					<a href="jsp/manager/adminSignIn.jsp">注销</a>
				</li>
		    </ul>
		</div>
		<div class="layui-side layui-bg-cyan">
			<ul class="layui-nav layui-nav-tree" lay-filter="menu">
				<li class="layui-nav-item" ><a href="jsp/manager/businessMessage.jsp">企业信息查询</a></li>
				<li class="layui-nav-item" ><a href="jsp/manager/inquireRecords.jsp">招聘记录查询</a></li>
				<li class="layui-nav-item" ><a href="jsp/manager/classManage.jsp">行业类别管理</a></li>
				<li class="layui-nav-item" ><a href="jsp/manager/jobhunterMessage.jsp">求职者信息查询</a></li>
				<li class="layui-nav-item" ><a href="jsp/manager/jbhunterAdd.jsp">添加求职者信息</a></li>
				<li class="layui-nav-item layui-this" ><a href="jsp/manager/businessCheck.jsp">企业信息审核</a></li>
			</ul>
		</div>
		
		<div class="layui-body">
			<table id="entstaTable" lay-filter="entstaTable" class="layui-table" lay-data="{url:'findEntStatus.do',
																						even:true}">
				<thead>
					<tr>
					<th lay-data="{field:'bsname',title:'企业名称'}"></th>
					<th lay-data="{field:'bspname',title:'企业法人姓名'}"></th>
					<th lay-data="{field:'bsid',title:'企业工商注册号'}"></th>
					<th lay-data="{field:'checkstatus',title:'审核状态'}"></th>
					<th lay-data="{title:'审核',width:'150',templet:function(cd){																
																return '<a class=\'layui-btn layui-btn-normal layui-btn-sm\' lay-event=\'ok\'>审核通过</a>';
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
	layui.use(["table","layer","jquery"],function(){
		var table=layui.table;
		var $=layui.jquery;
		var layer=layui.layer;
		//监听行工具事件
		table.on('tool(entstaTable)', function(obj){
			var data = obj.data;
			if(obj.event === 'ok'){
				$.ajax({
					url:"checkFinish.do",
					data:{bsname:data.bsname},
					type:'POST',
					success:function(result){
						if(result == "success"){
							window.location.href="jsp/manager/businessCheck.jsp";
						}
						else if(result == "fail") {
							layer.msg("审核失败！");
						}
					},
					error:function(){
						layer.msg("失败！");
					}
				});
			}
		});
	});
</script>

</body>
</html>