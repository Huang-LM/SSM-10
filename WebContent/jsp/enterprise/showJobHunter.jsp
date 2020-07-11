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
	<title>应聘者基本信息</title>
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
		.showimg{
			overflow:hidden;
			border: 1 solid blue;
		}
		.img{
			max-height:800px;
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
		    	<li class="layui-nav-item">
					<a href="javascript:void(0);">招聘信息</a>
					<dl class="layui-nav-child">
					<dd><a href="jsp/enterprise/jobPosting.jsp">发布招聘信息</a></dd>
					<hr>
					<dd><a href="jsp/enterprise/manaRecrInfor.jsp">管理招聘信息</a></dd>
					</dl>
				</li>
				<li class="layui-nav-item layui-this"><a href="jsp/enterprise/entJobHunter.jsp" >应聘者</a>
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
		
		<div class="layui-container top">
			<div class="alert alert-info top">
			    <strong>招聘管理</strong>
			</div>
			<div>
			    <button type="button" id="orderinter" class="layui-btn layui-btn-normal" onclick="location.href='orderInterview.do'">预约面试</button>
			    <!-- <button type="button" class="layui-btn layui-btn-warm">暖色按钮</button> -->
			    <button type="button" id="intersuccess" class="layui-btn" onclick="location.href='interviewSuccess.do'">面试成功</button>
			    <button type="button" id="interfail" class="layui-btn layui-btn-danger" onclick="location.href='interviewFail.do'">面试失败</button>
			    <!-- <button type="button" class="layui-btn layui-btn-disabled">禁用按钮</button> -->
			</div>
		
			<!-- <blockquote class="layui-elem-quote">基本信息</blockquote> -->
			<div class="alert alert-info top">
			    <strong>基本信息</strong>
			</div>
			<hr class="layui-bg-green">
			<table id="jobhunterTable1" class="layui-table" lay-data="{url:'showJobHunter.do',
																parseData:function(res){
																	return {
																		code:0,
																		msg:'应聘者信息',
																		count:1,
																		data:res
																	};
																}}">
				<thead>
					<tr>
					<th lay-data="{field:'jbname',title:'姓名'}"></th>
					</tr>
				</thead>
			</table>
			<table id="jobhunterTable2" class="layui-table" lay-data="{url:'showJobHunter.do',
																parseData:function(res){
																	return {
																		code:0,
																		msg:'应聘者信息',
																		count:1,
																		data:res
																	};
																}}">
				<thead>
					<tr>
					<th lay-data="{field:'jbsex',title:'性别'}"></th>
					</tr>
				</thead>
			</table>
			<table id="jobhunterTable3" class="layui-table" lay-data="{url:'showJobHunter.do',
																parseData:function(res){
																	return {
																		code:0,
																		msg:'应聘者信息',
																		count:1,
																		data:res
																	};
																}}">
				<thead>
					<tr>
					<th lay-data="{field:'jbage',title:'年龄'}"></th>
					</tr>
				</thead>
			</table>
			<table id="jobhunterTable4" class="layui-table" lay-data="{url:'showJobHunter.do',
																parseData:function(res){
																	return {
																		code:0,
																		msg:'应聘者信息',
																		count:1,
																		data:res
																	};
																}}">
				<thead>
					<tr>
					<th lay-data="{field:'jbid',title:'身份证号'}"></th>
					</tr>
				</thead>
			</table>
			<table id="jobhunterTable5" class="layui-table" lay-data="{url:'showJobHunter.do',
																parseData:function(res){
																	return {
																		code:0,
																		msg:'应聘者信息',
																		count:1,
																		data:res
																	};
																}}">
				<thead>
					<tr>
					<th lay-data="{field:'jbpnmb',title:'手机号码'}"></th>
					</tr>
				</thead>
			</table>
			<table id="jobhunterTable6" class="layui-table" lay-data="{url:'showJobHunter.do',
																parseData:function(res){
																	return {
																		code:0,
																		msg:'应聘者信息',
																		count:1,
																		data:res
																	};
																}}">
				<thead>
					<tr>
					<th lay-data="{field:'jbjob',title:'应聘职位'}"></th>
					</tr>
				</thead>
			</table>
			<table id="jobhunterTable7" class="layui-table" lay-data="{url:'showJobHunter.do',
																parseData:function(res){
																	return {
																		code:0,
																		msg:'应聘者信息',
																		count:1,
																		data:res
																	};
																}}">
				<thead>
					<tr>
					<th lay-data="{field:'jbablt',title:'自身能力简介'}"></th>
					</tr>
				</thead>
			</table>
			<!-- <blockquote class="layui-elem-quote">简历</blockquote> -->
			<div class="alert alert-info top">
			    <strong>简历</strong>
			</div>
			<hr class="layui-bg-green">
			<div class="showimg">
				<img class="img" alt="" src="showResume.do">
			</div>
			
			
			
		</div>
		
		<input type="hidden" id="status" value="${status}">

	</div>
	
<script type="text/javascript">
	layui.use(["table","jquery","element"],function(){
		var $=layui.jquery;
		var sta=$("#status").val();
		if(sta=="已预约面试") {
			$("#orderinter").attr("disabled",true);
		}
		else if(sta=="已通过面试") {
			$("#orderinter").attr("disabled",true);
			$("#intersuccess").attr("disabled",true);
			$("#interfail").attr("disabled",true);
		}
		else {
			$("#intersuccess").attr("disabled",true);
			$("#interfail").attr("disabled",true);
		}
	});
	
	/* $("#orderinter").click(function(){
		
		if(t==0) {
			$(this).attr("disabled",true);
		}
	}) */
</script>

</body>
</html>