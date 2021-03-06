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
	<title>企业登录</title>
	<script type="text/javascript" src="ui/layui.js"></script>
	<link href="ui/css/layui.css" rel="stylesheet"/>
	<style type="text/css">
		.top-bg{
			width: 100%;
			height: 400px;
			animation-duration: 1s !important;
		}
	</style>
</head>

<body>
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header layui-bg-cyan">
			<div class="layui-logo"><img src="img/logo.png" style="width:100px;height:40px"></div>
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="index.jsp" >首页</a>
				<li class="layui-nav-item layui-this"><a href="javascript:void(0);" >企业</a>
		    
		    </ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item layui-this">
					<a href="javascript:void(0);">登录</a>
				</li>
				<li class="layui-nav-item">
					<a href="jsp/enterprise/enterprisesignup.jsp">注册</a>
				</li>
		    </ul>
		</div>
		
		<div class="layui-bg-green top-bg layui-anim-fadein layui-anim "></div>

		<div class="layui-container" style="margin:50px auto;">
			<div style="text-align:center;">
				<form class="layui-form layui-form-pane">
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">企业名称</label>
							<div class="layui-input-inline">
								<input type="text" name="bsname" class="layui-input" lay-verify="required" placeholder="请输入企业名称">
							</div>
						</div>
					</div>
					
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">密码</label>
							<div class="layui-input-inline">
								<input type="password" name="bspsw" class="layui-input" lay-verify="required" placeholder="请输入密码">
							</div>
						</div>
					</div>
					
					<div class="layui-form-item">
						<div class="layui-inline">
							<div class="layui-input-inline">
								<button lay-submit lay-filter="signin" class="layui-btn">登录</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

<script type="text/javascript">
	layui.use(["element","form","jquery","layer"],function(){
		var element=layui.element;
		var form=layui.form;
		var layer=layui.layer;
		var $=layui.jquery;
		form.on("submit(signin)",function(data){
			$.ajax({
				url:"enterpriseSignIn.do",
				data:data.field,
				type:'POST',
				success:function(result){
					if(result == "success"){
						window.location.href="jsp/enterprise/enterprisemanage.jsp";
					}
					else if(result == "fail") {
						layer.msg("用户名或密码输入错误！");
					}
					else if(result == "checking") {
						layer.msg("审核中，请等待审核通过！");
					}
				},
				error:function(){
					layer.msg("失败！");
				}
			});
			return false;
		})
	});

</script>

</body>
</html>