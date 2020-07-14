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
	<title>管理员登录</title>
	<script type="text/javascript" src="ui/layui.js"></script>
	<link href="ui/css/layui.css" rel="stylesheet"/>
	<style type="text/css">
	</style>
</head>

<body>
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">招聘系统后台管理</div>
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item layui-this"><a href="javascript:void(0);" >管理</a>
		    </ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item layui-this">
					<a href="javascript:void(0);">登录</a>
				</li>
				<li class="layui-nav-item">
					<a href="jsp/manager/adminSignUp.jsp">注册</a>
				</li>
		    </ul>
		</div>
		
		<div class="layui-container" style="margin:100px auto;">
			<div style="text-align:center;">
				<form class="layui-form layui-form-pane">
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">管理员</label>
							<div class="layui-input-inline">
								<input type="text" name="mnname" class="layui-input" lay-verify="required" placeholder="请输入管理员姓名">
							</div>
						</div>
					</div>
					
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">密码</label>
							<div class="layui-input-inline">
								<input type="password" name="mnpsw" class="layui-input" lay-verify="required" placeholder="请输入密码">
							</div>
						</div>
					</div>
					
					<div class="layui-form-item">
						<div class="layui-inline">
							<div class="layui-input-inline">
								<button lay-submit lay-filter="signin" class="layui-btn layui-btn-normal">登录</button>
							</div>
						</div>
						
					</div>
				</form>
				<button lay-submit lay-filter="" class="layui-btn layui-btn-normal" style="margin-left:-25px; margin-top: -5px">
						<a href="jsp/manager/AiLogin.jsp">人脸识别登录</a>
				</button>
				<button lay-submit lay-filter="" class="layui-btn layui-btn-normal" style="margin-left:0px; margin-top: -5px">
						<a href="jsp/manager/AiEnrol.jsp">人脸识别注册</a>
				</button>
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
				url:"adminSignIn.do",
				data:data.field,
				type:'POST',
				success:function(result){
					if(result == "success"){
						window.location.href="jsp/manager/backgroundLogin.jsp";//jsp/enterprise/
					}
					else if(result == "fail") {
						layer.msg("姓名或密码输入错误！");
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