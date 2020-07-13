<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加客户</title>
<link href="ui/css/layui.css" rel="stylesheet"/>
<style type="text/css">
</style>
<script type="text/javascript" src="ui/layui.js"></script>
</head>
<body>
<div class="layui-container">
	<form class="layui-form" lay-filter="addclient" id="addclient">
		<div class="layui-form-item">
			<label class="layui-form-label">企业名称</label>
			<div class="layui-input-inline">
				<input type="text" name="bsname" class="layui-input" placeholder="请输入企业名称">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">企业法人</label>
			<div class="layui-input-inline">
				<input type="text" name="bspName" class="layui-input" placeholder="请输入法人姓名">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">企业ID</label>
			<div class="layui-input-inline">
				<input type="text" name="bsid" class="layui-input" placeholder="请输入企业ID">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">企业类型</label>
			<div class="layui-input-inline">
				<input type="text" name="bsclass" class="layui-input" placeholder="请输入企业类型">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">企业文化</label>
			<div class="layui-input-inline">
				<input type="text" name="bsculture" class="layui-input" placeholder="请输入企业文化">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">企业简介</label>
			<div class="layui-input-inline">
				<input type="text" name="bsintr" class="layui-input" placeholder="请输入企业简介">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">企业需求</label>
			<div class="layui-input-inline">
				<input type="text" name="bsablt" class="layui-input" placeholder="请输入企业需求">
			</div>
		</div>
		<div class="layui-form-item" text align="right">
			<div class="layui-input-inline">
				<button lay-submit lay-filter="save" class="layui-btn">保存</button>
			</div>
		</div>
	</form>
</div>

<script type="text/javascript">
	layui.use(["form","jquery"],function(){
		/* var form=layui.form;
		var $=layui.jquery; */
		form.on("submit(save)",function(data){
			var url="addBusiness.do";			
			$.post(url,data.field,function(txt){
				if(txt=="ok"){
					alert("添加成功");
					$("#addBusiness")[0].reset(); 
					form.render();
				} 
				else {
					alert("添加失败");
				}
			}); 
			return false;
		});
	});
</script>
</body>
</html>