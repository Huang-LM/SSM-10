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
<title>添加企业</title>
<link href="ui/css/layui.css" rel="stylesheet"/>
<style type="text/css">
</style>
<script type="text/javascript" src="ui/layui.js"></script>
</head>
<body>
<div class="layui-container">
	<form class="layui-form" lay-filter="addBusiness" id="addBusiness">
		<div class="layui-form-item">
			<label class="layui-form-label">姓名</label>
			<div class="layui-input-inline">
				<input type="text" name="jbname" class="layui-input" placeholder="请输入姓名">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">性别</label>
			<div class="layui-input-inline">
				<input type="text" name="jbsex" class="layui-input" placeholder="请输入性别">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">年龄</label>
			<div class="layui-input-inline">
				<input type="text" name="jbage" class="layui-input" placeholder="请输入年龄">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">照片</label>
			<div class="layui-input-inline">
				<input type="text" name="jbphoto" class="layui-input" placeholder="请输入照片">
				</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">编号</label>
			<div class="layui-input-inline">
				<input type="text" name="jbid" class="layui-input" placeholder="请输入编号">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-inline">
				<input type="text" name="jbusername" class="layui-input" placeholder="请输入用户名">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">联系方式</label>
			<div class="layui-input-inline">
				<input type="text" name="jbpnmb" class="layui-input" placeholder="请输入联系方式">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">应聘企业</label>
			<div class="layui-input-inline">
				<input type="text" name="jbcompany" class="layui-input" placeholder="请输入应聘企业">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">应聘职位</label>
			<div class="layui-input-inline">
				<input type="text" name="jbjob" class="layui-input" placeholder="请输入应聘职位">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">能力简介</label>
			<div class="layui-input-inline">
				<input type="text" name="jbablt" class="layui-input" placeholder="请输入个人简介">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">求职状态</label>
			<div class="layui-input-inline">
				<input type="text" name="interstatus" class="layui-input" placeholder="请输入求职状态">
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
		var form=layui.form;
		var $=layui.jquery;
		form.on("submit(save)",function(data){
			var url="addjbhunter.do";			
			$.post(url,data.field,function(txt){
				if(txt=="ok"){
					alert("添加成功");
					$("#addjbhunter")[0].reset(); 
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