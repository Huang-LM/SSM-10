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
	<title>登录</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script type="text/javascript" src="ui/layui.js"></script>
	<link href="ui/css/layui.css" rel="stylesheet"/>
	<style type="text/css">
	
	</style>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<!-- 顶部导航栏 -->
		<div class="layui-header layui-bg-cyan nav">
			<ul class="layui-nav" lay-filter="menu">
				<li class="layui-nav-item"><a href="index.jsp" >首页</a>
				<li class="layui-nav-item"><a href="jsp/jobhunter/jobList.jsp" >公司列表</a>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="jsp/enterprise/enterprisesignup.jsp">企业版</a>
				<li class="layui-nav-item"><a href="jsp/jobhunter/jobLogin.jsp">登录</a>
				<li class="layui-nav-item layui-this"><a href="javascript:void(0);">注册</a>
			</ul>
		</div>
		
		<div class="layui-container" style="margin:100px auto;">
			<div style="text-align:center;">
				<form class="layui-form layui-form-pane">
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">用户名称</label>
							<div class="layui-input-inline">
								<input type="text" name="jbname" class="layui-input" lay-verify="required" placeholder="请输入用户名称">
							</div>
						</div>
					</div>
					
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">密码</label>
							<div class="layui-input-inline">
								<input type="password" name="jbpsw" class="layui-input" lay-verify="required" placeholder="请输入密码">
							</div>
						</div>
					</div>
					
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">本人姓名</label>
							<div class="layui-input-inline">
								<input type="text" name="jbusername" class="layui-input" lay-verify="required" placeholder="请输入本人姓名">
							</div>
						</div>
					</div>
					
					<div class="layui-form-item">
						<div class="layui-inline">
							<div class="layui-input-inline">
								<button lay-submit lay-filter="signup" class="layui-btn">注册</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		
	</div>


<script type="text/javascript">
	layui.use(["form","jquery","layer"],function(){
		var form=layui.form;
		var layer=layui.layer;
		var $=layui.jquery;
		form.on("submit(signup)",function(data){
			$.ajax({
				url:"jobEnrol.do",
				data:data.field,
				type:'POST',
				success:function(result){
					if(result == "success"){
						window.location.href='jsp/jobhunter/jobLogin.jsp';
					}
				},
				error:function(){
					layer.msg("注册失败！");
				}
			});
			return false;
		}); 
	});

</script>	
</body>
</html>