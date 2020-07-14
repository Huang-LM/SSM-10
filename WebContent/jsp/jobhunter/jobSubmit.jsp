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
		.sform{
			border: black .5px solid;
			padding-right: 30px
			
		}
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
		.layui-footer{
			left: 0px !important;
			position: static !important;
			margin-top: 80px;
			bottom:0px !important;
			background-color: #ffffff !important;
		}
	</style>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<!-- 顶部导航栏 -->
		<div class="layui-header layui-bg-cyan nav">
			<div class="layui-logo"><img src="img/logo.png" style="width:100px;height:40px"></div>
			<ul class="layui-nav layui-layout-left" lay-filter="menu">
				<li class="layui-nav-item"><a href="jsp/jobhunter/jobLoginindex.jsp" >首页</a>
				<li class="layui-nav-item"><a href="jsp/jobhunter/jobLoginList.jsp" >公司列表</a>
				<li class="layui-nav-item layui-this"><a href="jsp/jobhunter/jobLoginShow.jsp" >公司信息</a>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="jsp/enterprise/enterprisesignin.jsp">企业版</a>
				<li class="layui-nav-item" lay-unselect="">
				    <a href="javascript:;">个人中心</a>
				    <dl class="layui-nav-child">
				      <dd><a href="jsp/jobhunter/jobInfo.jsp">查看进度</a></dd>
				      <dd><a href="index.jsp">注销</a></dd>
				    </dl>
				</li>
			</ul>
		</div>
		
		
		
		<div class="layui-container container">
			<form class="layui-form sform" method="POST" enctype="multipart/form-data" lay-filter="example">
				<div class="layui-form-item item-1">
					<label class="layui-form-label">姓名</label>
					<div class="layui-input-inline">
						<input type="text" name="jbname" class="layui-input" placeholder="请输入本人姓名" lay-verify="required">
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
						<input type="text" name="jbage" class="layui-input" placeholder="请输入本人年龄" lay-verify="required">
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">身份证号</label>
					<div class="layui-input-block">
						<input type="text" name="jbid" class="layui-input input-id" placeholder="请输入本人身份证号" lay-verify="required">
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-inline">
						<input type="text" name="jbusername" class="layui-input" placeholder="请输入你的用户名" lay-verify="required">
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">手机号</label>
					<div class="layui-input-inline">
						<input type="text" name="jbpnmb" class="layui-input" placeholder="请输入你的手机号" lay-verify="required">
					</div>
				</div>
				
				
				
				<div class="layui-form-item">
					<label class="layui-form-label">公司</label>
					<div class="layui-input-inline">
						<input type="text" name="jbcompany" class="layui-input input-bsname" placeholder="${bsname}" lay-filter="jbcompany">
					</div>
					<button type="button" class="layui-btn bun-bsname" id="LAY-component-form-setval">快捷填写</button>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">职位</label>
					<div class="layui-input-inline">
						<input type="text" name="jbjob" class="layui-input" placeholder="${bsposition}" lay-filter="jbjob">
					</div>
				</div>
				
				 <div class="layui-form-item layui-form-text">
				    <label class="layui-form-label">自身能力简介</label>
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
						<button lay-submit lay-filter="save" class="layui-btn sub-btn">提交</button>
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
				layer.alert("已提交简历，将在三秒后跳转。。。");
				setTimeout("window.location.href='jsp/jobhunter/jobLoginList.jsp'",3000);				
			}		
		});
		return false;
	});
	
	var upper=upload.render({
		elem:"#upbutton",
		url:"uppic.do",
		done:function(res){
			/* alert("/upload/"+res.msg); */
			$("#imgbox img").attr("src","upload/"+res.photo);
			/* $(".showimg").val("upload/"+res.msg); */
			$(".showimg").val(res.msg);
		},
		error:function(){
			alert("error");
		}
	});
	
	$('#LAY-component-form-setval').on('click', function(){
	    form.val('example', {
	      "jbcompany": "${bsname}" 
	      ,"jbjob": "${bsposition}"
	    });
	  });
});
</script>	

</body>
</html>