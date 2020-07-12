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
	<script type="text/javascript" src="ui/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="ui/layui.js"></script>
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
			margin-top: 100px;
		}
		.layui-table-cell{
		  height:auto;
		  overflow:visible;
		 text-overflow:inherit;
		}
		.layui-footer{
			left: 0px !important;
			position: fixed !important; 
			bottom:0px !important;
			background-color: #F2F2F2;
			margin-top: 30px;
		}
		.quick_bar {
			position: fixed;
			left: 95%; 
			top:80%;
			
		}
		.bar-bg{
			height: 40px;
		    width: 40px;
		    border-radius: 50%;
		  	background-color: #ffffff;
		}
		.bar-icon{
			margin-left: 12px;
			padding-top: 10px;
		}
		.to_top{ 
			display: none;
			height: 50px;
		    width: 50px;
		    border-radius: 50%;
		  	background-color: #2F4056;
		}
		.to_top:hover{ 
			opacity:0.5
		}
		.to_reply {
			display: block
		}
		.to_reply:hover{
		 	opacity: 0.5
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
				<li class="layui-nav-item layui-this"><a href="jsp/jobhunter/jobShow.jsp" >公司信息</a>
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
		
		<div class="layui-container top">
			<blockquote class="layui-elem-quote">基本信息</blockquote>
				<hr class="layui-bg-green">	
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
			  <legend>企业信息</legend>
			</fieldset>	
			<table class="layui-table etable1" 
					lay-data="{
								url:'jobShowView.do',
								parseData:function(res){
									return {
										code:0,
										msg:'企业信息',
										count:1,
										data:res
									};
								},
								done: function (res, curr, count){
						                $('th').hide();
									}	
								}">
				<thead>
					<tr>
						<th lay-data="{field:'bsname'}"></th>
					</tr>
				</thead>
			</table>
			
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
			  <legend>企业法人姓名</legend>
			</fieldset>	
			<table class="layui-table etable2" 
					lay-data="{
								url:'jobShowView.do',
								parseData:function(res){
									return {
										code:0,
										msg:'企业信息',
										count:1,
										data:res
									};
								},
								done: function (res, curr, count){
						                $('th').hide();
									}	
								}">
				<thead>
					<tr>
						<th lay-data="{field:'bspname'}"></th>
					</tr>
				</thead>
			</table>
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
			  <legend>行业类别</legend>
			</fieldset>	
			<table class="layui-table etable3" 
					lay-data="{
								url:'jobShowView.do',
								parseData:function(res){
									return {
										code:0,
										msg:'企业信息',
										count:1,
										data:res
									};
								},
								done: function (res, curr, count){
						                $('th').hide();
									}	
								}">
				<thead>
					<tr>
						<th lay-data="{field:'bsclass'}">
					</tr>
				</thead>
			</table>
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
			  <legend>简介</legend>
			</fieldset>	
			<table class="layui-table etable4" 
					lay-data="{
								url:'jobShowView.do',
								parseData:function(res){
									return {
										code:0,
										msg:'企业信息',
										count:1,
										data:res
									};
								},
								done: function (res, curr, count){
						                $('th').hide();
									}	
								}">
				<thead>
					<tr>
						<th lay-data="{field:'bsintr'}"></th>
					</tr>
				</thead>
			</table>
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
			  <legend>公司文化</legend>
			</fieldset>	
			<table class="layui-table etable5" 
					lay-data="{
								url:'jobShowView.do',
								parseData:function(res){
									return {
										code:0,
										msg:'企业信息',
										count:1,
										data:res
									};
								},
								done: function (res, curr, count){
						                $('th').hide();
									}	
								}">
				<thead>
					<tr>
						<th lay-data="{field:'bsculture'}"></th>
					</tr>
				</thead>
			</table>
		</div>	
		
		 <!--返回顶部小组件-->
	    <div class="quick_bar" id="quick_bar">
	        <a id="to_top" class="to_top" title="返回顶部"  href="javascript:void(0)">
	        	<div class="bar-bg">
	        	 	<div class="layui-icon layui-icon-return bar-icon"></div>
	        	</div>
	        </a>
	    </div>
		

		<!-- foot -->
<!-- 		<div class="layui-footer">
			 <div class="layui-main">
			   <p>© 2020 <a href="/"></a></p>
			  </div>
		</div> -->	
	</div>
	
<script type="text/javascript">
	layui.use(["table","element"],function(){
		var table=layui.table;
		var url="jobShowView.do";
		
	});
	
	$(document).scroll(function(){
        var top=$(document).scrollTop();
        if(top<300){
            $('#to_top').hide();
        }
        else{
            $('#to_top').show();
        }
   	})
    
	$('#to_top').click(function(){
        $('body,html').animate({scrollTop:0},300);
    })
</script>	

</body>
</html>