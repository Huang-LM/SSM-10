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
	<title>主页</title>
	
	 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script type="text/javascript" src="ui/layui.js"></script>
	<link href="ui/css/layui.css" rel="stylesheet"/>
	<style type="text/css">
		.hot-nav{
			height: 80px;
			
		}
		.hot-nav-list{
			padding: 20px; 
			font-size: 30px;
		}
	</style>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header layui-bg-cyan">
		
			<ul class="layui-nav " lay-filter="">
				<li class="layui-nav-item layui-this"><a href="javascript:void(0);" >首页</a>
				<li class="layui-nav-item"><a href="javascript:void(0);" >公司</a>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:void(0);">企业版</a>
				<li class="layui-nav-item"><a href="javascript:void(0);">登录</a>
				<li class="layui-nav-item"><a href="javascript:void(0);">注册</a>
			</ul>
		</div>
		<!-- body -->
		<div class="layui-container">
			<!-- hot-nav -->
			<div style="padding: 30px">
				<fieldset class="layui-elem-field hot-nav" >
				  <legend>热门职业</legend>
						<span class="layui-breadcrumb hot-nav-list" lay-separator="|" >
							  <a href="">娱乐</a>
							  <a href="">八卦</a>
							  <a href="">体育</a>
							  <a href="">搞笑</a>
							  <a href="">视频</a>
							  <a href="">游戏</a>
							  <a href="">综艺</a>
						</span>
				</fieldset>
			</div>
		
			<div style="padding: 20px; background-color: #F2F2F2;">
			  <div class="layui-row layui-col-space15">
			    <div class="layui-col-md6">
			      <div class="layui-card">
			        <div class="layui-card-header">卡片面板</div>
			        <div class="layui-card-body">
			          卡片式面板面板通常用于非白色背景色的主体内<br>
			          从而映衬出边框投影
			        </div>
			      </div>
			    </div>
			    <div class="layui-col-md6">
			      <div class="layui-card">
			        <div class="layui-card-header">卡片面板</div>
			        <div class="layui-card-body">
			          结合 layui 的栅格系统<br>
			          轻松实现响应式布局
			        </div>
			      </div>
			    </div>
			  </div>
			</div> 

		</div>
	 </div> 
	
	<script>
		layui.use(['element','form'], function(){
		  var element = layui.element;
		 
		});
	</script>
</body>


</html>