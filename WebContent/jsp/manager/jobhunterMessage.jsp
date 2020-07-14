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
	<title>求职者信息</title>
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
				<li class="layui-nav-item layui-this" ><a href="javascript:void(0);">求职者信息查询</a></li>
				<li class="layui-nav-item" ><a href="jsp/manager/jbhunterAdd.jsp">添加求职者信息</a></li>
				<li class="layui-nav-item" ><a href="jsp/manager/businessCheck.jsp">企业信息审核</a></li> 
			</ul>
		</div>
		<div class="layui-body">
			<table id="jbTable" lay-filter="jbTable" class="layui-table" lay-data="{url:'showjb.do',
																						even:true}">
				<thead>
					<tr>
						<th lay-data="{field:'jbname',title:'姓名'}"></th>
						<th lay-data="{field:'jbsex',title:'性别'}"></th>
						<th lay-data="{field:'jbage',title:'年龄'}"></th>
						<th lay-data="{field:'jbid',title:'编号'}"></th>
						<th lay-data="{field:'jbusername',title:'用户名'}"></th>
						<th lay-data="{field:'jbpnmb',title:'联系方式'}"></th>
						<th lay-data="{field:'jbcompany',title:'应聘公司'}"></th>
						<th lay-data="{field:'jbjob',title:'应聘职位'}"></th>
						<th lay-data="{field:'jbablt',title:'个人能力'}"></th>
						<th lay-data="{title:'删除',templet:function(cd){																
																	return '<a class=\'layui-btn layui-btn-danger layui-btn-sm\' lay-event=\'del\'>删除</a>';
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
		table.on('tool(jbTable)', function(obj){
			var data = obj.data;
			if(obj.event === 'del'){
				$.ajax({
					url:"deljbhunter.do",
					data:{jbid:data.jbid},
					type:'POST',
					success:function(result){
						if(result == "success"){
							window.location.href="jsp/manager/jobhunterMessage.jsp";
						}
						else if(result == "fail") {
							layer.msg("删除失败！");
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