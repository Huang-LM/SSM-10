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
	<title>企业注册</title>
	<script type="text/javascript" src="ui/layui.js"></script>
	<link href="ui/css/layui.css" rel="stylesheet"/>
	<style type="text/css">
	</style>
	<script type="text/javascript" src="ui/layui.js"></script>
</head>

<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">招聘系统</div>
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="index.jsp" >首页</a>
				<li class="layui-nav-item layui-this"><a href="javascript:void(0);" >企业</a>
		    
		    </ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item">
					<a href="jsp/enterprise/enterprisesignin.jsp">登录</a>
				</li>
				<li class="layui-nav-item layui-this">
					<a href="javascript:void(0);">注册</a>
				</li>
		    </ul>
		</div>
		
		<div class="layui-container" style="margin:100px auto;">
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
							<label class="layui-form-label">法人姓名</label>
							<div class="layui-input-inline">
								<input type="text" name="bspname" class="layui-input" lay-verify="required" placeholder="请输入企业法人姓名">
							</div>
						</div>
					</div>
					
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">身份证号</label>
							<div class="layui-input-inline">
								<input type="text" name="bspid" class="layui-input" lay-verify="required" placeholder="请输入企业法人身份证号">
							</div>
						</div>
					</div>
					
					<div class="layui-form-item">
						<div class="layui-inline">
							<div class="layui-input-inline">
								<button lay-submit lay-filter="signup" class="layui-btn layui-btn-normal">注册</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		
	</div>


<script type="text/javascript">
	layui.use(["form","jquery","layer"],function(){
		//var element=layui.element;
		var form=layui.form;
		var layer=layui.layer;
		var $=layui.jquery;
		form.on("submit(signup)",function(data){
			/* var url="enterpriseSignUp.do";			
			$.post(url,data.field,function(){
				}); */
			$.ajax({
				url:"enterpriseSignUp.do",
				data:data.field,
				type:'POST',
				success:function(result){
					if(result == "success"){
						window.location.href='enterprisesignin.jsp';
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