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
	<title>添加求职者</title>
	<link href="ui/css/layui.css" rel="stylesheet"/>
	<script type="text/javascript" src="ui/layui.js"></script>
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
				<li class="layui-nav-item" ><a href="jsp/manager/jobhunterMessage.jsp">求职者信息查询</a></li>
				<li class="layui-nav-item layui-this" ><a href="javascript:void(0);">添加求职者信息</a></li>
				<li class="layui-nav-item" ><a href="jsp/manager/businessCheck.jsp">企业信息审核</a></li> 
			</ul>
		</div>
		
		<div class="layui-container container">
			<form class="layui-form sform" method="POST" enctype="multipart/form-data" lay-filter="example" id="example">
				<div class="layui-form-item item-1">
					<label class="layui-form-label">姓名</label>
					<div class="layui-input-inline">
						<input type="text" name="jbname" class="layui-input" placeholder="输入姓名">
					</div>
				</div>
				
				<div class="layui-form-item">
				    <label class="layui-form-label">性别</label>
					    <div class="layui-input-block">
					      <input type="radio" name="jbsex" value="男" title="男">
					      <input type="radio" name="jbsex" value="女" title="女" checked>
					    </div>
			  	</div>
			  	
			  	<div class="layui-form-item">
					<label class="layui-form-label">年龄</label>
					<div class="layui-input-inline">
						<input type="text" name="jbage" class="layui-input" placeholder="输入年龄">
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">身份证号</label>
					<div class="layui-input-block">
						<input type="text" name="jbid" class="layui-input input-id" placeholder="输入身份证号">
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-inline">
						<input type="text" name="jbusername" class="layui-input" placeholder="输入用户名">
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">手机号</label>
					<div class="layui-input-inline">
						<input type="text" name="jbpnmb" class="layui-input" placeholder="输入手机号">
					</div>
				</div>
				
				
				
				<div class="layui-form-item">
					<label class="layui-form-label">公司</label>
					<div class="layui-input-inline">
						<input type="text" name="jbcompany" class="layui-input input-bsname" placeholder="输入公司名称" lay-filter="jbcompany">
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">职位</label>
					<div class="layui-input-inline">
						<input type="text" name="jbjob" class="layui-input" placeholder="输入职位" lay-filter="jbjob">
					</div>
				</div>
				
				 <div class="layui-form-item layui-form-text">
				    <label class="layui-form-label">能力简介</label>
				    <div class="layui-input-block">
				      <textarea name="jbablt" placeholder="请输入内容" class="layui-textarea"></textarea>
				    </div>
				 </div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">上传简历</label>
					<div class="layui-input-inline">
						<button class="layui-btn" id="upbutton" type="button">
							<i class="layui-icon">&#xe67c;</i>上传照片
						</button>
					</div>
					<div class="layui-form-mid layui-word-aux upload-text">请上传A4大小的照片</div>
				</div>
				
				<div class="layui-form-item">
					<div id="imgbox" style="width: 210px;height: 297px;border: black 1px solid; float: left; margin-left: 100px;">
						<img alt="" src="img/sub-bg.png" style="width: 100%;height: 100%; margin: 5 auto;">
						<input type="hidden" name="jbphoto" class="showimg"/>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-input-inline">
						<button lay-submit lay-filter="save" class="layui-btn sub-btn">保存</button>
					</div>
				</div>
			</form>
		</div>
	</div>

<style type="text/css">
	.sub-btn{
		margin-left: 100px;
	}
	.item-1{
		margin-top: 50px;
	}
	.input-id{
		width: 300px
	}
	.input-bsname{
		width: 300px
	}
	.bun-bsname{
		margin-left: 110px
	}
	.upload-text{
		margin-left: -80px
	}
</style>


<script type="text/javascript">
layui.use(["form","jquery","element","upload","layer"],function(){
	var form=layui.form;
	var $=layui.jquery;
	var element=layui.element;
	var upload=layui.upload;
	var layer=layui.layer;
	
	form.on("submit(save)",function(data){
		var url="addJobhunter.do";

		$.post(url,data.field,function(txt){
			if(txt== "success"){	
				layer.alert("添加成功");		
				$("#example")[0].reset(); 
				$("#imgbox img").attr("src","img/sub-bg.png");
				form.render();
			}		
		});
		return false;
	});
	
	var upper=upload.render({
		elem:"#upbutton",
		url:"uppic.do",
		done:function(res){
			$("#imgbox img").attr("src","upload/"+res.photo);
			$(".showimg").val(res.msg);
		},
		error:function(){
			alert("error");
		}
	});
	
});
</script>
</body>
</html>