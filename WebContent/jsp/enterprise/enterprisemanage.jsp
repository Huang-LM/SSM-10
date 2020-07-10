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
	<title>企业管理</title>
	<script type="text/javascript" src="ui/layui.js"></script>
	<link href="ui/css/layui.css" rel="stylesheet"/>
	
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
    
	<style type="text/css">
		.top{
			margin-top:50px;
		}
		body{
			margin-top: 50px;
		}
	</style>
</head>

<body>
	<div class="layui-layout layui-layout-admin">
		<!-- <div class="layui-header">
			<div class="layui-logo">招聘系统</div>
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="index.jsp" >首页</a>
				<li class="layui-nav-item layui-this"><a href="javascript:void(0);" >企业</a>
		    	<li class="layui-nav-item"><a href="jsp/enterprise/alterEnterpriseInfor.jsp" >企业信息</a>
		    	<li class="layui-nav-item">
					<a href="javascript:void(0);">招聘信息</a>
					<dl class="layui-nav-child">
					<dd><a href="jsp/enterprise/jobPosting.jsp">发布招聘信息</a></dd>
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
		</div> -->
		
		
		<nav class="navbar navbar-expand-sm bg-primary navbar-dark fixed-top">
		  <!-- Brand -->
		  <a class="navbar-brand" href="#">招聘系统</a>
		  <!-- Links -->
		  <ul class="navbar-nav">
		    <li class="nav-item">
		      <a class="nav-link" href="index.jsp">首页</a>
		    </li>
		    <li class="nav-item active">
		      <a class="nav-link" href="#">企业</a>
		    </li>
		    <li class="nav-item">
		      <!-- <a class="nav-link" href="jsp/enterprise/alterEnterpriseInfor.jsp">企业信息</a> -->
		      <a class="nav-link" href="altEntInfor.do">企业信息</a>
		    </li>
		
		    <!-- Dropdown -->
		    <li class="nav-item dropdown">
		      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
		        	招聘信息
		      </a>
		      <div class="dropdown-menu">
		        <a class="dropdown-item" href="jsp/enterprise/jobPosting.jsp">发布招聘信息</a>
		        <a class="dropdown-item" href="jsp/enterprise/manaRecrInfor.jsp">管理招聘信息</a>
		      </div>
		    </li>
		  </ul>
		</nav>
		
		
		<!-- <div>
			<div class="layui-carousel" id="carou" lay-filter="carou">
				<div carousel-item="">
				    <div><img style="width:100%;height:400px" src="img/enttop1.jpg"></div>
				    <div><img style="width:100%;height:400px" src="img/enttop2.jpg"></div>
				    <div><img style="width:100%;height:400px" src="img/enttop3.jpg"></div>
				</div>
			</div>
		</div> -->
		<div id="demo" class="carousel slide" data-ride="carousel">
		 
		  <!-- 指示符 -->
		  <ul class="carousel-indicators">
		    <li data-target="#demo" data-slide-to="0" class="active"></li>
		    <li data-target="#demo" data-slide-to="1"></li>
		    <li data-target="#demo" data-slide-to="2"></li>
		  </ul>
		 
		  <!-- 轮播图片 -->
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="img/enttop1.jpg" style="width:100%;height:400px">
		    </div>
		    <div class="carousel-item">
		      <img src="img/enttop2.jpg" style="width:100%;height:400px">
		    </div>
		    <div class="carousel-item">
		      <img src="img/enttop3.jpg" style="width:100%;height:400px">
		    </div>
		  </div>
		 
		  <!-- 左右切换按钮 -->
		  <a class="carousel-control-prev" href="#demo" data-slide="prev">
		    <span class="carousel-control-prev-icon"></span>
		  </a>
		  <a class="carousel-control-next" href="#demo" data-slide="next">
		    <span class="carousel-control-next-icon"></span>
		  </a>
		 
		</div>
		
		<div class="layui-container top">
			<!-- <blockquote class="layui-elem-quote">基本信息</blockquote> -->
			<div class="alert alert-info">
			    <strong>基本信息</strong>
			</div>
			<hr class="layui-bg-green">
			<table id="entTable1" class="layui-table" lay-data="{url:'findEntInfor.do',
																parseData:function(res){
																	return {
																		code:0,
																		msg:'企业信息',
																		count:1,
																		data:res
																	};
																}}">
				<thead>
					<tr>
					<th lay-data="{field:'bsname',title:'企业名称'}"></th>
					</tr>
				</thead>
			</table>
			<table id="entTable2" class="layui-table" lay-data="{url:'findEntInfor.do',
																parseData:function(res){
																	return {
																		code:0,
																		msg:'企业信息',
																		count:1,
																		data:res
																	};
																}}">
				<thead>
					<tr>
					<th lay-data="{field:'bspname',title:'企业法人姓名'}"></th>
					</tr>
				</thead>
			</table>
			<table id="entTable3" class="layui-table" lay-data="{url:'findEntInfor.do',
																parseData:function(res){
																	return {
																		code:0,
																		msg:'企业信息',
																		count:1,
																		data:res
																	};
																}}">
				<thead>
					<tr>
					<th lay-data="{field:'bsclass',title:'行业类别'}">
					</tr>
				</thead>
			</table>
			<table id="entTable4" class="layui-table" lay-data="{url:'findEntInfor.do',
																parseData:function(res){
																	return {
																		code:0,
																		msg:'企业信息',
																		count:1,
																		data:res
																	};
																}}">
				<thead>
					<tr>
					<th lay-data="{field:'bsintr',title:'简介'}"></th>
					</tr>
				</thead>
			</table>
			<table id="entTable5" class="layui-table" lay-data="{url:'findEntInfor.do',
																parseData:function(res){
																	return {
																		code:0,
																		msg:'企业信息',
																		count:1,
																		data:res
																	};
																}}">
				<thead>
					<tr>
					<th lay-data="{field:'bsculture',title:'公司文化'}"></th>
					</tr>
				</thead>
			</table>
		</div>	
		
		<div class="layui-container top">
			<!-- <blockquote class="layui-elem-quote">招聘信息</blockquote> -->
			<div class="alert alert-info">
			    <strong>招聘信息</strong>
			</div>
			<hr class="layui-bg-green">
			<table id="posTable" class="layui-table" lay-data="{url:'entFindPosition.do',
																page:true,
																even:true,
																limit:5,
																limits:[5,10,20]}">
				<thead>
					<tr>
					<th lay-data="{field:'bsname',title:'企业名称'}"></th>
					<th lay-data="{field:'bsclass',title:'行业类别'}"></th>
					<th lay-data="{field:'bsposition',title:'职位'}"></th>
					<th lay-data="{field:'bspay',title:'薪资'}"></th>
					</tr>
				</thead>
			</table>
		</div>
		
		
		
		

	</div>

<script type="text/javascript">
	layui.use(["table","carousel","jquery","element"],function(){
		var carousel = layui.carousel;
		carousel.render({
		    elem: '#carou'
		    ,arrow: 'always'
		    ,width: '100%'
		    ,height: '400px'
		    ,interval: 5000
		  });
	});

</script>

</body>
</html>