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
	<title>简历提交</title>
	
	<meta http-equiv="Content-Type"  content="multipart/form-data; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script type="text/javascript" src="ui/layui.js"></script>
	<link href="ui/css/layui.css" rel="stylesheet"/>
	<style type="text/css">
		body{
			background-color: #F2F2F2;
		}
		.nav{
			position: fixed;
		    left: 0;
		    top: 0;
		    z-index: 10000;
		    width: 100%;
		    height: 60px;
		}
		.container{
			margin-top: 100px;
		
		}
		
		.layui-footer{
			left: 0px !important;
			position: static !important;
			bottom:0px !important;
			background-color: #ffffff !important;
		}
	</style>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<!-- 顶部导航栏 -->
		<div class="layui-header layui-bg-cyan nav">
			<ul class="layui-nav" lay-filter="menu">
				<li class="layui-nav-item"><a href="index.jsp" >首页</a>
				<li class="layui-nav-item"><a href="jsp/jobhunter/jobList.jsp" >公司列表</a>
				<li class="layui-nav-item layui-this"><a href="" >简历提交</a>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="jsp/enterprise/enterprisesignup.jsp">企业版</a>
				<li class="layui-nav-item"><a href="jsp/jobhunter/jobLogin.jsp">登录</a>
				<li class="layui-nav-item"><a href="jsp/jobhunter/jobEnrol.jsp">注册</a>
			</ul>
		</div>
		
		
		
		<div class="layui-container container">
			<form class="layui-form" method="POST" enctype="multipart/form-data">
				<div class="layui-form-item">
					<label class="layui-form-label">姓名</label>
					<div class="layui-input-inline">
						<input type="text" name="jbname" class="layui-input" placeholder="请输入本人姓名">
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
						<input type="text" name="jbage" class="layui-input" placeholder="请输入本人年龄">
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">身份证号</label>
					<div class="layui-input-block">
						<input type="text" name="jbid" class="layui-input" placeholder="请输入本人身份证号">
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-inline">
						<input type="text" name="jbusername" class="layui-input" placeholder="请输入你的用户名">
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">手机号</label>
					<div class="layui-input-inline">
						<input type="text" name="jbpnmb" class="layui-input" placeholder="请输入你的手机号">
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">公司</label>
					<div class="layui-input-inline">
						<input type="text" name="jbcompany" class="layui-input" placeholder="应聘的公司" lay-filter="jbcompany">
					</div>
					<div class="layui-form-mid layui-word-aux">${bsname}</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">职位</label>
					<div class="layui-input-inline">
						<input type="text" name="jbjob" class="layui-input" placeholder="应聘的职位" lay-filter="jbjob">
					</div>
					<div class="layui-form-mid layui-word-aux">${bsposition}</div>
				</div>
				
				 <div class="layui-form-item layui-form-text">
				    <label class="layui-form-label">自身能力简介</label>
				    <div class="layui-input-block">
				      <textarea name="jbablt" placeholder="请输入内容" class="layui-textarea"></textarea>
				    </div>
				 </div>
				
				
				
				
				<div class="layui-form-item">
				<div id="imgbox" style="width: 200px;height: 220px;border: black 1px solid; float: left;">
					<img alt="" src="upload/" style="width: 200px;height: 100%; margin: 5 auto;">
					<input type="text" name="jbphoto" class="showimg"/>
				</div>
				
				<label class="layui-form-label">上传照片</label>
					<div class="layui-input-inline">
						<button class="layui-btn" id="upbutton" type="button">
							<i class="layui-icon">&#xe67c;</i>上传图片
						</button>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-inline">
						<button lay-submit lay-filter="save" class="layui-btn">提交</button>
					</div>
				</div>
			</form>
		</div>
		
		<%-- <h1>${bsname}</h1>
		<h1>${bsposition}</h1>  --%>

		<!-- foot -->
		<div class="layui-footer">
			 <div class="layui-main">
			   <p>© 2020 <a href="/"></a></p>
			  </div>
		</div>	
	</div>
	
<script type="text/javascript">
layui.use(["form","jquery","element","upload"],function(){
	var form=layui.form;
	var $=layui.jquery;
	var element=layui.element;
	var upload=layui.upload;
	
	form.on("submit(save)",function(data){
		var url="addJobhunter.do";
		
		/* var total={
				"jbname" : data.jbname,
				"jbsex" : data.jbsex,
				"jbage" : data.jbage,
				"jbphoto": data.jbphoto,

		}; */
		
		/* layer.alert(JSON.stringify(data.field), {
		      title: '最终的提交信息'
		    }) */

		/* alert(data.jbname);
		alert(data.file); */
		$.post(url,data.field,function(txt){
			if(txt.code==0){	
				layer.alert("已提交简历");
				window.location.href='jsp/jobhunter/jobList.jsp';
				
			}				
		});
		return false;
	});
	
	var upper=upload.render({
		elem:"#upbutton",
		url:"uppic.do",
		done:function(res){
			alert("/upload/"+res.msg);
			$("#imgbox img").attr("src","upload/"+res.msg);
			$(".showimg").val("upload/"+res.msg);
			/* $(".showimg").val(res.msg); */
		},
		error:function(){
			alert("error");
		}
	});
});
</script>	

</body>
</html>