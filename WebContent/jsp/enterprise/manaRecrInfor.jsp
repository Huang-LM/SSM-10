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
	<title>管理招聘信息</title>
	<script type="text/javascript" src="ui/layui.js"></script>
	<link href="ui/css/layui.css" rel="stylesheet"/>
	
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
	
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
		.top{
			margin-top:60px;
		}
		.topa{
			margin-top:120px;
		}
	</style>
</head>

<body>
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header layui-bg-cyan nav">
			<div class="layui-logo"><img src="img/logo.png" style="width:100px;height:40px"></div>
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="index.jsp" >首页</a>
				<li class="layui-nav-item"><a href="jsp/enterprise/enterprisemanage.jsp" >企业</a>
		    	<li class="layui-nav-item"><a href="altEntInfor.do" >企业信息</a>
		    	<li class="layui-nav-item layui-this">
					<a href="javascript:void(0);">招聘信息</a>
					<dl class="layui-nav-child">
					<dd><a href="jsp/enterprise/jobPosting.jsp">发布招聘信息</a></dd>
					<hr>
					<dd><a href="javascript:void(0);">管理招聘信息</a></dd>
					</dl>
				</li>
				<li class="layui-nav-item"><a href="jsp/enterprise/entJobHunter.jsp" >求职者</a>
		    </ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item">
					<a href="jsp/enterprise/enterprisesignin.jsp">注销</a>
				</li>
		    </ul>
		</div>
		
		<div class="layui-container topa">
			<!-- <blockquote class="layui-elem-quote">招聘信息管理</blockquote> -->
			<div class="alert alert-info">
			    <strong>招聘信息管理</strong>
			</div>
			<hr class="layui-bg-green">
			<table id="posTable" lay-filter="posTable" class="layui-table" lay-data="{url:'entFindPosition.do',
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
					<th lay-data="{title:'操作',templet:function(cd){																
																return '<a class=\'layui-btn layui-btn-danger layui-btn-sm\' lay-event=\'del\'>删除</a>';
															}}"></th>
					</tr>
				</thead>
			</table>
		</div>
		
	</div>

<script type="text/javascript">
	layui.use(["table","element","layer","jquery"],function(){
		var table=layui.table;
		var $=layui.jquery;
		var layer=layui.layer;
		//监听行工具事件
		table.on('tool(posTable)', function(obj){
			var data = obj.data;
			//console.log(obj)
			if(obj.event === 'del'){
				$.ajax({
					url:"delRecrInfor.do",
					data:{bsposition:data.bsposition},
					type:'POST',
					success:function(result){
						if(result == "success"){
							window.location.href="jsp/enterprise/manaRecrInfor.jsp";
						}
						else if(result == "fail") {
							layer.msg("删除失败！");
						}
					},
					error:function(){
						layer.msg("失败！");
					}
				});
			}
		});
	});
</script>

</body>
</html>