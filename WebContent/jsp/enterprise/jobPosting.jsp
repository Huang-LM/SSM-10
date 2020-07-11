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
	<title>发布招聘信息</title>
	<script type="text/javascript" src="ui/layui.js"></script>
	<link href="ui/css/layui.css" rel="stylesheet"/>
	<style type="text/css">
		.top{
			margin-top:50px;
		}
	</style>
</head>

<body>
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">招聘系统</div>
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="index.jsp" >首页</a>
				<li class="layui-nav-item"><a href="jsp/enterprise/enterprisemanage.jsp" >企业</a>
		    	<li class="layui-nav-item"><a href="altEntInfor.do" >企业信息</a>
		    	<li class="layui-nav-item layui-this">
					<a href="javascript:void(0);">招聘信息</a>
					<dl class="layui-nav-child">
					<dd><a href="javascript:void(0);">发布招聘信息</a></dd>
					<hr>
					<dd><a href="jsp/enterprise/manaRecrInfor.jsp">管理招聘信息</a></dd>
					</dl>
				</li>
				<li class="layui-nav-item"><a href="jsp/enterprise/entJobHunter.jsp" >应聘者</a>
		    </ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item layui-this">
					<a href="javascript:void(0);" ></a>
				</li>
				<li class="layui-nav-item">
					<a href="jsp/enterprise/enterprisesignin.jsp">注销</a>
				</li>
		    </ul>
		</div>
		
		<div class="layui-container" style="margin:100px auto;">
			<div style="text-align:center;">
				<form class="layui-form layui-form-pane">
					<div class="layui-form-item">
							<label class="layui-form-label">企业名称</label>
							<div class="layui-input-block">
								<input type="text" name="bsname" autocomplete="off" placeholder="请输入企业名称" class="layui-input">
							</div>
					</div>
					<div class="layui-form-item">
							<label class="layui-form-label">行业类别</label>
							<div class="layui-input-block">
								<input type="text" name="bsclass" autocomplete="off" placeholder="请输入行业类别" class="layui-input">
							</div>
					</div>
					<div class="layui-form-item">
							<label class="layui-form-label">职位</label>
							<div class="layui-input-block">
								<input type="text" name="bsposition" autocomplete="off" placeholder="请输入职位" class="layui-input">
							</div>
					</div>
					<div class="layui-form-item">
							<label class="layui-form-label">薪资</label>
							<div class="layui-input-block">
								<input type="text" name="bspay" autocomplete="off" placeholder="请输入薪资" class="layui-input">
							</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<div class="layui-input-inline">
								<button lay-submit lay-filter="publish" class="layui-btn layui-btn-normal">发布</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		
	
	</div>
	
<script type="text/javascript">
	layui.use(["form","jquery","layer","element"],function(){
		var form=layui.form;
		var layer=layui.layer;
		var $=layui.jquery;
		form.on("submit(publish)",function(data){
			$.ajax({
				url:"entJobPosting.do",
				data:data.field,
				type:'POST',
				success:function(result){
					if(result == "success"){
						window.location.href='jsp/enterprise/enterprisemanage.jsp';
					}
				},
				error:function(){
					layer.msg("发布失败！");
				}
			});
			return false;
		}); 
	});
</script>

</body>
</html>