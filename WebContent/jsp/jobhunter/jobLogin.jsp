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
		body{
			background-color: #F2F2F2;
		}
		.top-bg{
			width: 100%;
			height: 400px;
			animation-duration: 1s !important;
		}
	</style>
</head>
<body scroll="no">
	<div class="layui-layout layui-layout-admin">
		<!-- 顶部导航栏 -->
		<div class="layui-header layui-bg-cyan nav">
			<ul class="layui-nav" lay-filter="menu">
				<li class="layui-nav-item"><a href="index.jsp" >首页</a>
				<li class="layui-nav-item"><a href="jsp/jobhunter/jobList.jsp" >公司列表</a>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="jsp/enterprise/enterprisesignup.jsp">企业版</a>
				<li class="layui-nav-item" lay-unselect="">
				    <a href="javascript:;">个人中心</a>
				    <dl class="layui-nav-child">
				      <dd><a href="jsp/jobhunter/jobLogin.jsp">登录</a></dd>
				      <dd><a href="jsp/jobhunter/jobEnrol.jsp">注册</a></dd>
				    </dl>
				</li>
			</ul>
		</div>
		
		<div class="layui-bg-green top-bg layui-anim-fadein layui-anim "></div>
		
		<div class="layui-container lcn layui-anim-upbit layui-anim" style="margin: 50px auto">
			<div style="text-align:center;">
				<div class="layui-form layui-form-pane">
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">用户名称</label>
							<div class="layui-input-inline">
								<input type="text" name="jbusername" class="layui-input" lay-verify="required" placeholder="请输入用户名">
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
							<div class="layui-input-inline">
								<button lay-submit lay-filter="login" class="layui-btn ">登录</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<script type="text/javascript">	
	layui.use(["form","jquery","layer","element"],function(){
		var form=layui.form;
		var layer=layui.layer;
		var $=layui.jquery;
		
		/* form.on("submit(login)",function(data){	
			$.post("jobLogin.do",data.field,function(txt){
				if(txt=="success"){
					alert("登录成功");
					window.location.href="index.jsp";
				} 
				else {
					alert("账号或密码有误");
				}
			}); 
		});  */
		
		form.on("submit(login)",function(data){
			$.ajax({
				url:"jobLogin.do",
				data:data.field,
				type:'POST',
				success:function(result){
					if(result.msg == "success"){
						layer.msg("登录成功，欢迎"+result.name);
						setTimeout(function () {layer.msg("正在跳转");}, 1500);
						setTimeout("window.location.href='jsp/jobhunter/jobLoginindex.jsp'",2000);				
					}
					else if(result == "fail") {
						layer.msg("账号或密码有误！");
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