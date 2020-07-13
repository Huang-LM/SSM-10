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
	<title>修改行业类别</title>
	<script type="text/javascript" src="ui/layui.js"></script>
	<link href="ui/css/layui.css" rel="stylesheet"/>
	<style type="text/css">
		.top{
			margin-top:100px;
		}
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
				<li class="layui-nav-item layui-this" ><a href="jsp/manager/classManage.jsp">行业类别管理</a></li>
				<li class="layui-nav-item" ><a href="jsp/manager/jobhunterMessage.jsp">求职者信息查询</a></li>
				<li class="layui-nav-item" ><a href="jsp/manager/jbhunterAdd.jsp">添加求职者信息</a></li>  
			</ul>
		</div>
		
		<div class="layui-body">
			<div class="layui-container top">
				<form class="layui-form" lay-filter="updateclass" id="updateclass">
					<div class="layui-form-item">
						<label class="layui-form-label">企业名称</label>
						<div class="layui-input-inline">
							<input type="text" name="bsname" class="layui-input" placeholder="请输入企业名称">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">行业类别</label>
						<div class="layui-input-inline">
							<input type="text" name="bsclass" class="layui-input" placeholder="请输入行业类别">
						</div>
					</div>
					<div class="layui-form-item" text align="right">
						<div class="layui-input-inline">
							<button lay-submit lay-filter="save" class="layui-btn">保存</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="layui-footer footer footer-doc">
		  <div class="layui-main">
		    <p>© 2020-码农招聘管理系统 <a href="/"></a></p>
		   </div>
		 </div>
		
	</div>
	
<script type="text/javascript">
	layui.use(["form","jquery"],function(){
		var form=layui.form;
		var $=layui.jquery;
		form.on("submit(save)",function(data){
			$.ajax({
				url:"updateclass.do",
				data:data.field,
				type:'POST',
				success:function(result){
					if(result == "success"){
						window.location.href="jsp/manager/classManage.jsp";
					}
					else if(result == "fail") {
						layer.msg("修改失败！");
					}
				},
				error:function(){
					layer.msg("失败！");
				}
			});
			return false;
		});
	});
</script>

</body>
</html>