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
	<title>公司信息</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script type="text/javascript" src="ui/layui.js"></script>
	<!-- <script type="text/javascript" src="ui/jquery-1.11.1.min.js"></script> -->
	<link href="ui/css/layui.css" rel="stylesheet"/>
	<style type="text/css">
		body{
		}
		.nav{
			position: fixed;
		    left: 0;
		    top: 0;
		    z-index: 10000;
		    width: 100%;
		    height: 60px;
		}
		.top{
			
		}
		.see-bg{
			height: 400px;
			width: 100%;
			animation-duration: 1s !important;
		}
		.item-1{
			margin-top: 100px;
			margin-left: 28%
		}
		.sub-btn{
			
		}
		.dot{
			margin-top: 50px;
		}
		.dot-1{
			font-size: 20px;
			margin-left: 0
		}
		.dot-2{
			font-size: 20px;
			margin-left: 30%;
		}
		.dot-3{
			font-size: 20px;
			margin-left: 40%;
		}
		.m-progress{
			margin-top: 10px
		}
		.layui-footer{
			left: 0px !important;
			position: fixed !important; 
			bottom:0px !important;
			background-color: #F2F2F2;
			margin-top: 150px;
		}
	</style>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<div class="see-bg layui-bg-green layui-anim-fadein layui-anim"></div>
		<!-- 顶部导航栏 -->
		<div class="layui-header layui-bg-cyan nav">
			<ul class="layui-nav" lay-filter="menu">
				<li class="layui-nav-item"><a href="jsp/jobhunter/jobLoginindex.jsp" >首页</a>
				<li class="layui-nav-item"><a href="jsp/jobhunter/jobLoginList.jsp" >公司列表</a>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="jsp/enterprise/enterprisesignup.jsp">企业版</a>
				<li class="layui-nav-item" lay-unselect="">
				    <a href="javascript:;">个人中心</a>
				    <dl class="layui-nav-child">
				      <dd><a href="jsp/jobhunter/jobInfo.jsp">查看进度</a></dd>
				      <dd><a href="index.jsp">注销</a></dd>
				    </dl>
				</li>
			</ul>
		</div>
		
		
		<div class="layui-container top layui-anim-up layui-anim">
			
			<form class="layui-form">
				<div class="layui-form-item item-1">
					<label class="layui-form-label">身份证</label>
					<div class="layui-input-inline">
						<input type="text" name="jbid" class="layui-input i-input" placeholder="请输入本人身份证号">
					</div>
					<button lay-submit lay-filter="search" class="layui-btn sub-btn">查看</button>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-input-inline">
						
					</div>
				</div>
			</form>
			
			<div class="dot">
				<span class="layui-badge layui-bg-gray dot-1">正在审核中</span>
				<span class="layui-badge layui-bg-gray dot-2">已预约面试</span>
				<span class="layui-badge layui-bg-gray dot-3">面试结果</span>
			</div>
			<div class="layui-progress layui-progress-big m-progress">
				<div class="layui-progress-bar i-progress layui-bg-orange" lay-percent="10%"></div>
			</div>
			
		</div>
		

		<!-- foot -->
		<div class="layui-footer">
			 <div class="layui-main">
			   <p>© 2020 <a href="/"></a></p>
			  </div>
		</div>	
	</div>
	
<script type="text/javascript">
	layui.use(['table','element','layer','form','jquery'],function(){
		var table=layui.table;
		var element=layui.element; 
		var form=layui.form;
		var layer=layui.layer;
		var $=layui.jquery;
		  
		/* form.on("submit(search)",function(data){
			layer.alert(data);
			$.ajax({
				url:"searchInfo.do",
				data:data.field,
				type:'POST',
				success:function(res){
					layer.msg("??")
				},
				error:function(){
					layer.msg("失败！");
				}
			});
			return false; */
			
		form.on("submit(search)",function(data){
			$.post("searchInfo.do",data.field,function(txt){
				/* layer.alert(txt); */
				if(txt=="success"){	
					layer.alert("恭喜您，面试通过");
					$(".i-progress").attr("style","width: 100%");
					$(".i-progress").attr("class","layui-progress-bar i-progress");
				}else if(txt=="lose"){
					layer.alert("很遗憾，您的面试未通过");
					$(".i-progress").attr("style","width: 100%");
					$(".i-progress").attr("class","layui-progress-bar i-progress layui-bg-red");
				}else if(txt=="loading"){
					layer.alert("已预约面试，请等待公司通知");
					$(".i-progress").attr("style","width: 50%");
					$(".i-progress").attr("class","layui-progress-bar i-progress layui-bg-blue");
				}else{
					layer.alert("公司还未审核，请耐心等待");
					$(".i-progress").attr("style","width: 10%");
					$(".i-progress").attr("class","layui-progress-bar i-progress layui-bg-orange");
				}
			});	
			return false;
		});
		
		
		//监听导航点击
		element.on('nav(demo)', function(elem){
			layer.msg(elem.text());
		});
	});
</script>	

</body>
</html>